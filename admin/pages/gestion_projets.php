<?php
include('./lib/php/verifier_connexion.php');
$prod = new ProjetBD($cnx);
$liste = $prod->getAllProjet();
$nbr = count($liste);
?>
<h2 class="titre_accueil">Modification des projets</h2>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Nom</th>
        <th scope="col">Description</th>
        <th scope="col">Propriétaire</th>
        <th scope="col">Objectif</th>
        <th scope="col">Temps restant</th>
    </tr>
    </thead>
    <tbody>

    <?php
    for ($i = 0; $i < $nbr; $i++) {


        ?>
        <tr>
            <th scope="row">
                <?php print $liste[$i]->id_projet; ?>
            </th>
            <td>
                <span contenteditable="true" name="nom_projet" id="<?php print $liste[$i]->id_projet; ?>">
                    <?php print $liste[$i]->nom_projet; ?>
                </span>
            </td>
            <td>
                <span contenteditable="true" name="description" id="<?php print $liste[$i]->id_projet; ?>">
                    <?php print $liste[$i]->description; ?>
                </span>
            </td>
            <td>
                <span contenteditable="true" name="proprietaire" id="<?php print $liste[$i]->id_projet; ?>">
                    <?php print $liste[$i]->proprietaire; ?>
                </span>
            </td>
            <td>
                <span contenteditable="true" name="objectif" id="<?php print $liste[$i]->objectif; ?>">
                    <?php print $liste[$i]->objectif; ?>
                </span>
            </td>
            <td>
                <span contenteditable="true" name="temps" id="<?php print $liste[$i]->temps; ?>">
                    <?php print $liste[$i]->temps; ?>
                </span>
            </td>
        </tr>

        <?php
    }
    ?>

    </tbody>
</table>

