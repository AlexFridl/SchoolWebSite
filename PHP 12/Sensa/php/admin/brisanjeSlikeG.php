<?php
session_start();
include "../konekcija.php";

$id = $_REQUEST['idS'];

//var_dump($id);

$upit = "DELETE FROM galerija WHERE id_slika = :id";
$priprema = $konekcija->prepare($upit);
$priprema->bindParam(":id", $id);

$rezultat = $priprema->execute();

if(isset($_GET['idG'])):
    $idG = $_REQUEST['idG'];
    $per_page = 4;

    $upit1 = "SELECT count(id_slika) FROM galerija";
    $rows = $konekcija->query($upit1)->fetchColumn();
    $p = ceil($rows / $per_page);
    if($p < $idG):
        $br = $idG - 1;
        echo "<script language='JavaScript'> window.location='../../index.php?id=3&idG=".$br."'</script>";
    else:
        echo "<script language='JavaScript'> window.location='../../index.php?id=3&idG=".$idG."'</script>";
    endif;
endif;

    ?>