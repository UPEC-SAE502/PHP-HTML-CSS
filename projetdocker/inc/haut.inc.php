<!Doctype html>
<html>
    <head>
        <title>projetdocker</title>
        <link rel="stylesheet" href="<?php echo RACINE_SITE; ?>inc/css/style.css" />
    </head>
    <body>    
        <header>
			<div class="conteneur">    
				<img alt="Oups problème de chargement de notre superbe logo" src="photo/fond_haut.png">                  
				<span>
					<h1>          </h1>
                </span>
				<nav>
					<?php
					
					if(internauteEstConnecte()) // membre et admin
					{
						echo '<a href="' . RACINE_SITE . 'profil.php">Voir votre profil</a>';
						echo '<a href="' . RACINE_SITE . 'connexion.php?action=deconnexion">Se déconnecter</a>';
					}
					else // visiteur
					{
						echo '<a href="' . RACINE_SITE . 'inscription.php">Inscription</a>';
						echo '<a href="' . RACINE_SITE . 'connexion.php">Connexion</a>';
					}

					?>
				</nav>
			</div>
        </header>
        <section>
			<div class="conteneur">       