<?php
session_start();
include "../konekcija.php";

$id = $_POST['id'];
$podaci = "";

$upit_obrisiKorisnika = "DELETE FROM korisnik WHERE id_korisnik=:id";
$priprema = $konekcija->prepare($upit_obrisiKorisnika);
$priprema->bindParam(":id", $id);

try {
$rezultat = $priprema->execute();
if($rezultat){
 $podaci .= "<table id='tabela' class='border3' style='margin: 0px auto; margin-top: 20px; text-align: center'>";
 $podaci .= "<tr class='border-bottom'>";
 $podaci .= "<th>Korisnicko ime</th>";
 $podaci .= "<th>Izmeni / Obriši</th>";
 $podaci .= "</tr>";

$upit = "SELECT * FROM korisnik";
$rezultat1 = $konekcija->query($upit);
// var_dump($rezultat);
if ($rezultat1) :
 foreach ($rezultat1 as $red):
 $podaci .= "<tr>";
 $podaci .= "<td>" . $red->korisnicko_ime . "</td>";
 $podaci .= "<td>";
 $podaci .= "<a href='index.php?id=106&id_korisnik="  . $red->id_korisnik . "' >Izmeni</a> / ";
 $podaci .= "<a id='brisi2' href='#' data-id ='. $red->id_korisnik .'>Obriši</a>";
 $podaci .= "</td>";
 $podaci .= "</tr>";

 endforeach;
endif;

$podaci .= "</table>";
$podaci .= "</div>";
}
}
catch(PDOException $ex){
 $ex->getMessage();
}
echo json_encode($podaci);
?>


