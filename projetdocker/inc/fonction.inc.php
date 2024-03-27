<?php
function executeRequete($req)
{
	global $mysqli; 
	$resultat = $mysqli->query($req); 
	if (!$resultat)
	{
		die("Erreur sur la requete sql.<br />Message : " . $mysqli->error . "<br />Code: " . $req);
	}
	return $resultat;
}
//------------------------------------
function debug($var, $mode = 1) 
{
		echo '<div style="background: orange; padding: 5px; float: right; clear: both; ">';
		$trace = debug_backtrace(); 
		$trace = array_shift($trace);
		echo "Debug demand� dans le fichier : $trace[file] � la ligne $trace[line].<hr />";
		if($mode === 1)
		{
			echo "<pre>"; print_r($var); echo "</pre>";
		}
		else
		{
			echo "<pre>"; var_dump($var); echo "</pre>";
		}
	echo '</div>';
}
//------------------------------------
function internauteEstConnecte()
{  
	if(!isset($_SESSION['membre'])) 
	{
		return false;
	}
	else
	{
		return true;
	}
}
//------------------------------------
function internauteEstConnecteEtEstAdmin()
{ 
	if(internauteEstConnecte() && $_SESSION['membre']['statut'] == 1) 
	{
			return true;
	}
	return false;
}

function verifierMotDePasseFort($motDePasse) {
    // Expression r�guli�re pour v�rifier la force du mot de passe
    $regex = '/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{10,}$/';
    return preg_match($regex, $motDePasse);
}