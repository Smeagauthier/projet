<?php
$proj = new ProjetBD($cnx);
if (isset($_GET['id_projet'])) {
    $liste = $proj->getProjetsByCat($_GET['id_projet']);
} else {
    $liste = $proj->getAllProjet();
}
$nbr = count($liste);

?>
<div class="album py-5 bg-light">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-3">
            <?php
            $ok = 0;
            for ($i = 0; $i < $nbr; $i++) {
                ?>
                <div class="col col-lg-4 d-flex align-items-stretch">
                    <div class="card shadow-sm">
                        <img class="logo_projets" loading="lazy" src="./admin/images/<?php print $liste[$i]->image; ?>" alt="image"/>
                        <div class="card-body">
                            <p class="card-text">
                                <?php print $liste[$i]->description; ?>                            </p>
                            <p class="card-text"><i> <i class="fas fa-male"></i> Propriétaire de la
                                    cagnotte: </i><?php print $liste[$i]->proprietaire; ?></p>

                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group" id="remove_a">
                                    <button data-id="<?php print $liste[$i]->id_projet; ?>" data-bs-toggle="modal"
                                            data-bs-target="#info_produit" class="info_projet"> Faire un don
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>        </div>
        <?php
        include('./pages/info_projet.php');
        ?>    </div>
</div>
