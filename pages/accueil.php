<?php
$liste = new ProjetBD($cnx);
$projets = $liste->getProjet();
$nbr = count($projets);
?>

<div class="container">

    <div class="card text-center">
        <img src="./admin/images/ciel.jpg" class="banniere">
        <div class="encadre_accueil">
            <h5 class="card-title">Make Good Things Happen</h5>
            <p class="card-text">Supportez les cagnottes déjà présentes</p>

            <button type="submit" class="bouton_connexion" name="envoyer" id="envoyer" value="Envoyer" onclick="window.location.href='index_.php?page=decouvrir.php';">
                Découvrir les projets
            </button>

            <button type="submit" class="bouton_connexion" name="envoyer" id="envoyer" value="Envoyer" onclick="window.location.href='index_.php?page=connexion.php';">Se
                connecter
            </button>
        </div>
<section>
    Bienvenue sur Stussy - Crowfunding ! Notre but est d'utiliser la solidarité afin d'aider des personnes dans le besoin ou de financer des projets.
    Ainsi, plusieurs cagnottes vous sont proposées, libre à chacun de participer à l'une ou l'autre (ou éventuellement les 2 pour les plus généreux).
    Le montant de votre donation vous est libre tant qu'il n'est pas inférieur à 1€.
    <i>NB: Certaines cagnottes ont une deadline.</i>
</section>

        <p>&nbsp;</p>
        <?php
        $cat = new ProjetBD($cnx);
        $liste_pro = $cat->getProjet();
        $nbr_pro = 4;
        ?>
        <div class="card-group">
            <?php
            for ($i = 0; $i < $nbr_pro; $i++) {
                ?>
                <div class="card col-lg-4 d-flex align-items-stretch">
                    <img src="./admin/images/<?php print $liste_pro[$i]->image; ?>" class="card-img-top"
                         alt="logo_association">
                    <div class="card-body">
                        <h5 class="card-title">
                            <a class="lien" href="#">
                                <?php print $liste_pro[$i]->nom_projet; ?>
                            </a>
                        </h5>
                        <p class="card-text"><?php print $liste_pro[$i]->description; ?></p>
                    </div>
                </div>

                <?php
            }
            ?>

        </div>
    </div>
