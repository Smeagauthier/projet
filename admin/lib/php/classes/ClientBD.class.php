<?php

class ClientBD extends Client
{
    private $_db; //recevoir la valeur de $cnx lors de la connexion à la BD dans index
    private $_data = array();
    private $_resultset;

    public function __construct($cnx)
    { // $cnx envoyé depuis la page qui instancie
        $this->_db = $cnx;
    }

    public function ajoutCompte($nom_client, $prenom_client, $tel, $pseudo, $password, $email)
    {
        try {
            $last="select max(id_client) from cf_client";
            $chiffre = $this->_db->prepare($last);
            $chiffre->execute();
            $retour = $chiffre->fetchColumn(0);
            $retour=$retour +1;
            $query = "INSERT INTO cf_client (nom_client, prenom_client, tel, pseudo, password, email ) VALUES ('".$nom_client."', '".$prenom_client."', '".$tel."', '".$pseudo."', '".$password."', '".$email."')";
            $_resultset = $this->_db->prepare($query);
            $_resultset->execute();
            $b = $_resultset->fetch();
            return $b;
        }catch(PDOException $e){
        }
    }

    function isClient($pseudo, $password) {
        try {
            $query = "select * from cf_client where pseudo = :pseudo and password = :password";
            $resultset = $this->_db->prepare($query);
            $resultset->bindValue(':pseudo', $pseudo);
            $resultset->bindValue(':password', $password);
            $resultset->execute();
            $data = $resultset->fetch();
            if (!empty($data)) {
                try {
                    $_client[] = new Client($data);
                    if ($_client[0]->pseudo == $pseudo && $_client[0]->password ==$password ) {
                        return $_client;
                    } else {
                        return null;
                    }
                } catch (PDOException $e) {
                    print $e->getMessage();
                }
            }
        } catch (PDOException $e) {
            print "Requete échouée" . $e->getMessage();
        }
    }
}