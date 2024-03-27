<?php
require_once("inc/init.inc.php");
//--------------------------------- TRAITEMENTS PHP ---------------------------------//
if(!internauteEstConnecte()) 
{
	header("location:connexion.php");
}
$contenu .= '<p class="centre">Bienvenue mon chère <strong>' . $_SESSION['membre']['pseudo'] . '</strong></p>'; // exercice: tenter d'afficher le pseudo de l'internaute pour lui dire Bonjour.
$contenu .= '<div class="cadre"><h2> Tout ce que nous savons de vous </h2>';
$contenu .= '<p> Email : ' . $_SESSION['membre']['email'] . '<br>';
$contenu .= 'Ville : ' . $_SESSION['membre']['ville'] . '<br>';
$contenu .= 'Code postal : ' . $_SESSION['membre']['code_postal'] . '<br>';
$contenu .= 'Adresse : ' . $_SESSION['membre']['adresse'] . '</p></div><br /><br />';
	
//--------------------------------- AFFICHAGE HTML ---------------------------------//
require_once("inc/haut.inc.php");
echo $contenu;
require_once("inc/bas.inc.php");