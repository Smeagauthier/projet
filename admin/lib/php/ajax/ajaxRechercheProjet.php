<?php
header('Content-Type: application/json');
/*
 * inclure les fichiers nécessaire à la communication avec la BD car on ne passe par l'index
 * Ce fichier est appelé par fonctions_jquery.js
 */
//A partir de admin/lib/php/ajax, revenir dans dossier précédent
include ('../pg_connect.php');
include ('../classes/Connexion.class.php');
include ('../classes/Projet.class.php');
include ('../classes/ProjetBD.class.php');
$cnx = Connexion::getInstance($dsn,$user,$password);
$pr = array();
$projet = new ProjetBD($cnx);
//id_produit est un paramètre de l'url
//ds js : var parametre = "id_produit="+id;
$pr[] = $projet->getProjetByRef($_GET['ref']);
//conversion du tableau PHP au format javascript
print json_encode($pr);