<?php 
$phpconnect = new mysqli("localhost", "root", "", "site");

$table= "CREATE TABLE membre (
    id_membre INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    pseudo VARCHAR(20) NOT NULL ,
    mdp VARCHAR(32) NOT NULL ,
    nom VARCHAR(20) NOT NULL ,
    prenom VARCHAR(20) NOT NULL ,
    email VARCHAR(50) NOT NULL ,
    civilite ENUM('m', 'f') NOT NULL ,
    ville VARCHAR(20) NOT NULL ,
    code_postal INT(5) UNSIGNED ZEROFILL NOT NULL ,
    adresse VARCHAR(50) NOT NULL ,
    statut INT(1) NOT NULL DEFAULT 0,
    UNIQUE (pseudo)
)";



if($phpconnect->query($table)===TRUE){
    echo "table membre cée avec succès";
}
?>
