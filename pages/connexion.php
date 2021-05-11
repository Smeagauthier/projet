<h2 class="titre_accueil">Se connecter</h2>

<?php
if (isset($_POST['envoyer'])) {
    $log = new ClientBD($cnx);
    $client = $log->isClient($_POST['pseudo'], $_POST['password']);

    if (is_null($client)) {
        ?>
        <h5 class="message_connexion"> Identifiants incorrects </h5>
        <?php
        
    } else {
        $_SESSION['client'] = 1;
        print 'Client trouvé';
        $_SESSION['mon_client'] = $client[0]->id_client;
        ?>
        <meta http-equiv = "refresh": content = "0;url=index_.php?page=accueil.php">
        <?php

    }
}
?>

<div class="connexion_formulaire" style="padding:70px 0">
    <div class="login-form-1">
        <form action="<?php print $_SERVER['PHP_SELF']; ?>" method="post" id="form_connexion">
            <form id="login-form" class="text-left">
                <div class="login-form-main-message"></div>
                <div class="main-login-form">
                    <div class="login-group">
                        <div class="form-group">
                            <label for="pseudo" class="sr-only">Pseudo</label>
                            <input type="text" class="form-control" id="pseudo" name="pseudo" placeholder="Pseudo">
                        </div>
                        <div class="form-group">
                            <label for="password" class="sr-only">Mot de passe</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Mot de passe">
                        </div>
                        </br>
                        <div class="form-group login-group-checkbox">
                            <input type="checkbox" id="lg_remember" name="lg_remember">
                            <label for="lg_remember">Se souvenir</label>
                        </div>
                    </div>

                    <button type="submit" class="bouton_connexion" name="envoyer" id="envoyer" value="Envoyer">Se
                        connecter
                    </button>
                </div>
                </br>
                <div class="etc-login-form">
                    <p>Nouveau ? <a href="./index_.php?page=inscription.php">S'inscrire</a></p>
                </div>
            </form>
    </div>
</div>
