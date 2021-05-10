<h2 class="titre_accueil">S'inscrire</h2>

<div class="formulaire_inscription" style="padding:50px">
    <div class="login-form-1">
        <form action="<?php print $_SERVER['PHP_SELF']; ?>" method="get" id="form_inscription">
            <form id="register-form" class="text-left">
                <div class="login-form-main-message"></div>
                <div class="main-login-form">
                    <div class="login-group">

                        <div class="form-group">
                            <label for="nom" class="sr-only">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" size="30" placeholder="Nom">
                        </div>

                        <div class="form-group">
                            <label for="prenom" class="sr-only">Prénom</label>
                            <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Prénom">
                        </div>

                        <div class="form-group">
                            <label for="telephone" class="sr-only">Téléphone</label>
                            <input type="text" class="form-control" id="telephone" name="telephone"
                                   placeholder="xxxx/xx/xx/xx">
                        </div>

                        <div class="form-group">
                            <label for="pseudo" class="sr-only">Pseudo</label>
                            <input type="text" class="form-control" id="pseudo" name="pseudo" placeholder="Pseudo">
                        </div>

                        <div class="form-group">
                            <label for="mdp" class="sr-only">Mot de passe</label>
                            <input type="password" id="mdp" class="form-control" name="mdp" placeholder="Mot de passe">
                        </div>
                        <div class="form-group">
                            <label for="mdp2" class="sr-only">Confirmez le mot de passe</label>
                            <input type="password" id="mdp2" class="form-control" name="mdp2"
                                   placeholder="Confirmez le mot de passe">
                        </div>

                        <div class="form-group">
                            <label for="reg_username" class="sr-only">Adresse e-mail</label>
                            <input type="email" id="mail" class="form-control" name="mail"
                                   placeholder="contact@gmail.com">
                        </div>

                        </br>
                        <div class="form-group login-group-checkbox">
                            <input type="checkbox" class="" id="reg_agree" name="reg_agree">
                            <label for="reg_agree">J'accepte les termes</label>
                        </div>
                    </div>

                    <button type="submit" name="envoyer" id="envoyer" value="Envoyer"
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
