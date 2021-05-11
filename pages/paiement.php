<h2 class="titre_accueil"> Procédure de paiement </h2>

<p>&nbsp;</p>

<?php
if (!isset($_SESSION['client'])) {
    ?>
    <h3 class="connexion_echouee">Vous devez vous connecter</h3>
    <meta http-equiv = "refresh": content = "2;url=index_.php?page=connexion.php">
    <?php
} else {

    $proj = new ProjetBD($cnx);
    if (!isset($_GET['id_projet'])) {

        $liste = $proj->getAllProjet();
    }
    $nbr = count($liste);

    ?>


    <form>
        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Email :</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail3" placeholder="email@gmail.com">
            </div>
        </div>

        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Pour un montant de :</label>
            <div class="col-sm-10">
                <input type="number" id="montant" name="montant" min="1" max="2000"> €
            </div>
        </div>

        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Je souhaite donner à :</label>
            <div class="col-sm-10">
                <select <?php
                $ok = 0;
                for ($i = 0; $i < $nbr; $i++) {
                    ?>
                    <option> <?php print $liste[$i]->nom_projet; ?> </option>

                <?php } ?>

                </select>
            </div>
        </div>

        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">Paiement avec :</legend>
            <div class="col-sm-10">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1"
                           checked>
                    <label class="form-check-label" for="gridRadios1">
                        Paypal
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                    <label class="form-check-label" for="gridRadios2">
                        Bancontact
                    </label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                    <label class="form-check-label" for="gridRadios2">
                        Visa
                    </label>
                </div>

            </div>
        </fieldset>
        <div class="row mb-3">
            <div class="col-sm-10 offset-sm-2">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck1">
                    <label class="form-check-label" for="gridCheck1">
                        Je souhaite être tenu informé des avances de la cagnotte par mail
                    </label>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary" onclick="window.location.href='./pages/facture.php';">
            Payer
        </button>
    </form>

    <?php
}
?>