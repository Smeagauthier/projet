<?php

class Connexion {

    private static $_instance = null;

    public static function getInstance($dsn, $user, $password){
        // :: --> manière d'atteinde une variable statique
        if(!self::$_instance){
            //si l'instance de cnx n'existe pas encore
            try{
                //on essaie d'instancier un objet PDO
                self::$_instance = new PDO($dsn, $user, $password);
                //print "connecté";
            } catch(PDOException $e){
                print "Echec: ".$e->getMessage();
            }
        }
        return self::$_instance;
    }
}