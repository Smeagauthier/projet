<?php
header('Content-Type: application/json');
require '../pg_connect.php';
require '../classes/Connexion.class.php';
require '../classes/Projet.class.php';
require '../classes/ProjetBD.class.php';
$cnx = Connexion::getInstance($dsn, $user, $password);

$pr = array();
$projet = new ProjetBD($cnx);
//On veut un tableau json --> pr[]
$pr[] = $projet->getProjetById($_GET['id_projet']);
//var_dump($pr);
print json_encode($pr);
