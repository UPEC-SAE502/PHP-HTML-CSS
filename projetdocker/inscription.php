<?php
require_once("inc/init.inc.php");
if($_POST)
{

	if (!verifierMotDePasseFort($_POST['mdp'])) {
        // Affichez un message d'erreur pour indiquer que le mot de passe est faible
        $contenu .= "<div class='erreur'>Le mot de passe doit contenir au moins 10 caractères avec au moins une lettre minuscule, une lettre majuscule, un chiffre et un caractère spécial.</div>";
    }

	if(empty($contenu)) 
	{
		$membre = executeRequete("SELECT * FROM membre WHERE pseudo='$_POST[pseudo]'"); 
		if($membre->num_rows > 0)
		{
			$contenu .= "<div class='erreur'>Pseudo indisponible. Veuillez en choisir un autre svp.</div>";
		}
		else
		{
			foreach($_POST as $indice => $valeur)
			{
				$_POST[$indice] = htmlEntities(addSlashes($valeur));
			}
			executeRequete("INSERT INTO membre (pseudo, mdp, nom, prenom, email, civilite, ville, code_postal, adresse) VALUES ('$_POST[pseudo]', '$_POST[mdp]', '$_POST[nom]', '$_POST[prenom]', '$_POST[email]', '$_POST[civilite]', '$_POST[ville]', '$_POST[code_postal]', '$_POST[adresse]')");
			$contenu .= "<div class='validation'>Vous êtes inscrit à notre site web. <a href=\"connexion.php\"><u>Cliquez ici pour vous connecter</u></a></div>";
		}
	}
	// Vérification si l'adresse email est déjà utilisée
    $resultatEmail = executeRequete("SELECT * FROM membre WHERE email = '$_POST[email]'");
    if ($resultatEmail->num_rows > 0) {
        // L'adresse email est déjà utilisée, afficher un message d'erreur
        $contenu .= "<div class='erreur'>L'adresse e-mail est déjà utilisée. Veuillez vous connecter ou utiliser une autre adresse e-mail.</div>";
        $contenu .= "<a href='connexion.php' class='lien-connexion'>Se connecter</a>";
    } 
}
?>
<?php require_once("inc/haut.inc.php"); ?>
<?php echo $contenu; ?>

<form method="post" action="">
    <label for="pseudo">Pseudo</label><br>
    <input type="text" id="pseudo" name="pseudo" maxlength="20" placeholder="votre pseudo" pattern="[a-zA-Z0-9-_.]{1,20}" title="caractères acceptés : a-zA-Z0-9-_." required="required"><br><br>
         
    <label for="mdp">Mot de passe</label><br>
<input type="password" id="mdp" name="mdp" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{10,}" title="Le mot de passe doit contenir au moins 10 caractères avec au moins une lettre minuscule, une lettre majuscule, un chiffre et un caractère spécial."><br><br>
<small>Le mot de passe doit contenir au moins 10 caractères avec au moins une lettre minuscule, une lettre majuscule, un chiffre et un caractère spécial.</small><br><br>
         
    <label for="nom">Nom</label><br>
    <input type="text" id="nom" name="nom" placeholder="votre nom"><br><br>
         
    <label for="prenom">Prénom</label><br>
    <input type="text" id="prenom" name="prenom" placeholder="votre prénom"><br><br>
 
    <label for="email">Email</label><br>
    <input type="email" id="email" name="email" placeholder="exemple@gmail.com"><br><br>
         
    <label for="civilite">Civilité</label><br>
    <input name="civilite" value="m" checked="" type="radio">Homme
    <input name="civilite" value="f" type="radio">Femme<br><br>
                 
    <label for="ville">Ville</label><br>
    <input type="text" id="ville" name="ville" placeholder="votre ville" pattern="[a-zA-Z0-9-_.]{5,15}" title="caractères acceptés : a-zA-Z0-9-_."><br><br>
         
    <label for="cp">Code Postal</label><br>
    <input type="text" id="code_postal" name="code_postal" placeholder="code postal" pattern="[0-9]{5}" title="5 chiffres requis : 0-9"><br><br>
         
    <label for="adresse">Adresse</label><br>
    <textarea id="adresse" name="adresse" placeholder="votre adresse" pattern="[a-zA-Z0-9-_.]{5,15}" title="caractères acceptés :  a-zA-Z0-9-_."></textarea><br><br>
 
    <input name="inscription" value="S'inscrire" type="submit">
</form>
 
<?php require_once("inc/bas.inc.php"); ?>