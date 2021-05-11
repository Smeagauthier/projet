<h2 class="titre_accueil">S'inscrire</h2>

<?php
if (isset($_GET['envoyer'])) {
    extract($_GET, EXTR_OVERWRITE);

    $client = new ClientBD($cnx);
    //var_dump($_GET);
    $client->ajoutCompte($_GET);
    ?>
    <meta http-equiv = "refresh": content = "0;url=index_.php?page=accueil.php">
    <?php
}
?>



<?php
$compte = new ClientBD($cnx);
if (isset($_GET['inserer'])){
?>
<pre><?php
    //var_dump($_GET);
    extract($_GET, EXTR_OVERWRITE);
    }

    if (isset($_GET['inserer'])) {
        $cpt = $compte->ajoutCompte($nom_client, $prenom_client, $tel, $pseudo, $password, $email);

        ?>
        <meta http-equiv="refresh" : content="1;url=index_.php?page=accueil.php">
        <?php
    }
    ?>

<div class="formulaire_inscription" style="padding:50px">
    <div class="login-form-1">
        <form action="<?php print $_SERVER['PHP_SELF']; ?>" method="get" id="form_inscription">
            <form id="register-form" class="text-left">
                <div class="login-form-main-message"></div>
                <div class="main-login-form">
                    <div class="login-group">

                        <div class="form-group">
                            <label for="nom_client" class="sr-only">Nom</label>
                            <input type="text" class="form-control" id="nom_client" name="nom_client" size="30"
                                   placeholder="Nom">
                        </div>

                        <div class="form-group">
                            <label for="prenom_client" class="sr-only">Prénom</label>
                            <input type="text" class="form-control" id="prenom_client" name="prenom_client"
                                   placeholder="Prénom">
                        </div>

                        <div class="form-group">
                            <label for="tel" class="sr-only">Téléphone</label>
                            <input type="text" class="form-control" id="tel" name="tel"
                                   placeholder="xxxx/xx/xx/xx">
                        </div>

                        <div class="form-group">
                            <label for="pseudo" class="sr-only">Pseudo</label>
                            <input type="text" class="form-control" id="pseudo" name="pseudo" placeholder="Pseudo">
                        </div>

                        <div class="form-group">
                            <label for="password" class="sr-only">Mot de passe</label>
                            <input type="password" id="password" class="form-control" name="password"
                                   placeholder="Mot de passe">
                        </div>

                        <div class="form-group">
                            <label for="email" class="sr-only">Adresse e-mail</label>
                            <input type="email" id="email" class="form-control" name="email"
                                   placeholder="contact@gmail.com">
                        </div>

                        </br>
                        <div class="form-group login-group-checkbox">
                            <input type="checkbox" class="" id="reg_agree" name="reg_agree">
                            <label for="reg_agree">J'accepte les termes</label>
                        </div>
                    </div>

                    <button type="submit" name="inserer" id="inserer" value="inserer"
                            class="bouton_connexion">Se connecter
                    </button>

                </div>
                </br>
                <div class="etc-login-form">
                    <p>Déjà un compte ? <a href="./index_.php?page=connexion.php">Se connecter</a></p>
                </div>
                </br>
            </form>
    </div>
</div>
