<?php
include ('./admin/lib/php/pg_connect.php');
include ('./admin/lib/php/classes/Connexion.class.php');
include ('./admin/lib/php/classes/Projet.class.php');
include ('./admin/lib/php/classes/ProjetBD.class.php');
$cnx = Connexion::getInstance($dsn,$user,$password);
$pr = array();
$projet = new ProjetBD($cnx);
$liste = $projet->getAllProjet();
$nbr = count($liste);
include ('../admin/lib/php/TCPDF/tcpdf.php');
$pdf = new TCPDF('P','mm','A4');
$pdf->AddPage();
$pdf->SetFont('times','B',15);
$pdf->SetTextColor(255,0,0);
$pdf->Cell(190,10,'A la cagnotte intitulée: ',1,1,'C');
$pdf->SetFont('times','',12);
$pdf->SetTextColor(0,0,0);
$x = 20;
$y = 50;
for($i = 0;$i<$nbr; $i++){
    $pdf->WriteHTMLCell(150,30,$x,$y,$liste[$i]->nom_projet,1,1,'','','L');
    $y+=10;
}
$pdf->Output();