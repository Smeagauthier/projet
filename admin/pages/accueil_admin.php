<h2 class="titre_accueil">Administration</h2>
<p>&nbsp;</p>
<?php
if (isset($_POST['submit'])) {
    extract($_POST, EXTR_OVERWRITE);

    $ad = new AdminBD($cnx);
    $admin = $ad->getAdmin($pseudo, $password);
    if ($admin) {
        $_SESSION['admin'] = 1;
        ?>
        <meta http-equiv="refresh" : content="0;URL=index_.php?page=gestion_projets.php">
        <?php
    } else {

        ?>
            <h5 class="message_connexion"> Identifiants incorrects </h5>
        <?php
    }
}
?>

<p class=""><?php
    if (isset($message)) {
        print $message;
    }
    ?></p>
<div class="admin_connexion" style="padding:75px 0">
    <div class="login-form-1">
        <form action="<?php print $_SERVER['PHP_SELF']; ?>" method="post" id="form_connexion">
            <form id="login-form" class="text-left">
                <div class="login-form-main-message"></div>
                <div class="main-login-form">
                    <div class="login-group">
                        <div class="form-group">
                            <label for="pseudo" class="sr-only"></label>
                            <input type="pseudo" class="form-control" id="pseudo" aria-describedby="" name="pseudo"
                                   placeholder="Pseudo">
                        </div>
                        <div class="form-group">
                            <label for="password" class="sr-only"></label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Mot de passe">
                        </div>
                    </div>
                    </br>
                    <button type="submit" class="btn btn-primary" name="submit" id="envoyer" value="Envoyer"
                            class="bouton_connexion">Se connecter
                    </button>

                </div>
            </form>
    </div>
</div>

