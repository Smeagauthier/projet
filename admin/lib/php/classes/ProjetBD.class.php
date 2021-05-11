<?php

class ProjetBD extends Projet
{

    private $_db; //recevoir la valeur de $cnx lors de la connexion à la BD dans index
    private $_data = array();
    private $_resultset;

    public function __construct($cnx)
    { //$cnx envoyé depuis la page qui instancie
        $this->_db = $cnx;
    }

    public function getProjet()
    {
        $query = "select * from cf_projet";
        $_resultset = $this->_db->prepare($query);
        $_resultset->execute();

        while ($d = $_resultset->fetch()) {
            $_data[] = new Projet($d);
        }
        //var_dump($_data);

        return $_data;
    }

    public function getAllProjet()
    {
        $query = "select * from cf_projet order by id_projet";
        $_resultset = $this->_db->prepare($query);
        $_resultset->execute();

        while ($d = $_resultset->fetch()) {
            $_data[] = new Projet($d);
        }
        //var_dump($_data);

        return $_data;
    }


    public function updateProjet($champ, $id, $valeur)
    {
        try {
            //appeler une procédure embarquée
            $query = "update cf_projet set " . $champ . "='" . $valeur . "' where id_projet='" . $id . "'";
            $resultset = $this->_db->prepare($query); //transformer la requête!
            $resultset->execute();
        } catch (PDOException $e) {
            print $e->getMessage();
        }
    }


    public function ajoutProjet($reference, $nom_projet, $description, $proprietaire, $image, $objectif, $temps)
    {
        try {
            $last="select max(id_projet) from cf_projet";
            $resultset = $this->_db->prepare($last);
            $resultset->execute();
            $retour = $resultset->fetchColumn(0);
            $retour=$retour +1;
            $query = "INSERT INTO cf_projet (reference, nom_projet, description, image, proprietaire, objectif, temps ) VALUES ('".$reference."','".$nom_projet."', '".$description."', '".$image."', '".$proprietaire."', '".$objectif."', '".$temps."')";
            $_resultset = $this->_db->prepare($query);
            $_resultset->execute();
            $b = $_resultset->fetch();
            return $b;
        }catch(PDOException $e){
        }


    }

    public function getProjetByRef($ref)
    {
        try {
            $this->_db->beginTransaction();
            $query = "select * from cf_projet where reference = :ref";
            $resultset = $this->_db->prepare($query);
            $resultset->bindValue(':ref', $ref);
            $resultset->execute();
            $data = $resultset->fetch();
            return $data;
            //renvoyer un objet nécéssite adaptation dans ajax pour retour json
            // donc retourner objet simple, qui sera stocké dans un élément de tableau json

            $this->_db->commit();
        } catch (PDOException $e) {
            print "Echec de la requête : " . $e->getMessage();
            $_db->rollback();
        }
    }

    public function getProjetById($id_projet) //getprojetbyid2
    {
        try {
            $this->_db->beginTransaction();
            $query = "select * from cf_projet where id_projet = :id_projet";
            $resultset = $this->_db->prepare($query);
            $resultset->bindValue(':id_projet', $id_projet);
            $resultset->execute();
            $data = $resultset->fetch();
            return $data;
            //renvoyer un objet nécéssite adaptation dans ajax pour retour json
            // donc retourner objet simple, qui sera stocké dans un élément de tableau json

            $this->_db->commit();
        } catch (PDOException $e) {
            print "Echec de la requête : " . $e->getMessage();
            $_db->rollback();
        }
    }

}



