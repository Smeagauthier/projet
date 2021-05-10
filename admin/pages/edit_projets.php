<?php
include('./lib/php/verifier_connexion.php');

?>
<h2 class="titre_accueil">Editer ou ajouter un projet</h2>
<p>&nbsp;</p>

<?php
    $produit= new ProjetBD($cnx);
    if(isset($_GET['editer'])){
        ?><pre><?php
        //var_dump($_GET);
        extract($_GET, EXTR_OVERWRITE);
        $prod = $produit ->updateProjet($id_projet);
    }

    if(isset($_GET['inserer'])){
        $prod=$produit ->ajoutProjet();//ajouter les arguments vérifiés

    }
?>

<form class="row g-3">

    <div class="col-md-2">
        <label for="reference" class="form-label">Référence</label>
        <input type="text" class="form-control" id="reference" name="reference" placeholder="A32">
    </div>
    <div class="col-md-6">
        <label for="nom_projet" class="form-label">Nom du projet</label>
        <input type="text" class="form-control" id="nom_projet" name="nom_projet" placeholder="Greenpeace">
    </div>
    <div class="col-md-12">
        <label for="description" class="form-label">Description</label>
        <input type="text" class="form-control" id="description" name="description" placeholder="Greenpeace est une association qui aide à lutter contre le changement climatique">
    </div>
    <div class="col-md-2">
        <label for="proprietaire" class="form-label">Propriétaire</label>
        <input type="text" class="form-control" id="proprietaire" name="proprietaire" placeholder="Marie-Ange Casalta">
    </div>
    <div class="col-md-2">
        <label for="objectif" class="form-label">Objectif</label>
        <input type="text" class="form-control" id="objectif" name="objectif" placeholder="13 450 €">
    </div>
    <div class="col-md-2">
        <label for="temps" class="form-label">Temps</label>
        <input type="text" class="form-control" id="temps" name="temps" placeholder="15 jours ou pas de deadline">
    </div>
    <div class="col-12">
        <input type="hidden" name="id_projet" id="id_projet">
        <button type="submit" class="btn btn-primary" id="editer" name="editer">Mettre à jour</button>
        <button type="submit" class="btn btn-primary" id="inserer" name="inserer">Enregistrer</button>
    </div>

</form>