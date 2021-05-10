<?php
if(!isset($_SESSION['admin'])){
    ?> <h3 class="connexion_echouee">Accès réservé</h3> <?php
    session_destroy();
    ?>
    <meta http-equiv="refresh": content="2;URL=../index_.php">
<?php
}
