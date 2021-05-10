<!doctype html>
<?php
//index public
session_start();
include('./lib/php/admin_liste_include.php');
$cnx = Connexion::getInstance($dsn, $user, $password);
?>
<html>
<head>
    <title>Stussy - Crowdfunding</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
            integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
            integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="./lib/css/style.css"/>
    <link rel="stylesheet" href="./lib/css/custom.css"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="./lib/js/functions_jquery.js"></script>

</head>

<body>
<div id="page" class="container">
    <section id="colGauche">
        <nav>
            <?php
            $path = "./lib/php/admin_menu.php";
            if (file_exists($path)) {
                include($path);
            }
            ?>
        </nav>

    </section>
    <section id="contenu">
        <div id="main">
            <?php
            if(isset($_SESSION['page']) && !isset($_SESSION['partie_admin'])){
                unset($_SESSION['page']);
                $_SESSION['partie_admin']=1;
            }
            if (!isset($_SESSION['page'])) {
                $_SESSION['page'] = "accueil_admin.php";
            }
            if (isset($_GET['page'])) {
                //si on a un param page dans l'url
                $_SESSION['page'] = $_GET['page'];
            }
            $path = "./pages/" . $_SESSION['page'];
            // print "path: " . $path . "<br>";
            if (file_exists($path)) {
                include($path);
            } else {
                include("./pages/page404.php");
            }
            ?>
        </div>
        <!--
        <aside id="pub">
            <img src="./images/pub.jpg" alt="publicité" />
        </aside>
        -->
    </section>

    <footer class="footer mt-auto py-3 bg-light">
        <div class="container">
            <?php
            $path = "./lib/php/public_footer.php";
            if (file_exists($path)) {
                include($path);
            }
            ?>
        </div>

    </footer>
</body>
</html>
