<?php
session_start();
include "../konekcija.php";
$id = $_REQUEST['id'];

$obavestenje = "";

$upit1 = "UPDATE pitanja SET aktivno_pitanje = 0";
$izvrsenje1 = $konekcija->prepare($upit1);
$rezultat1 = $izvrsenje1->execute();

if ($rezultat1):
    $ispis2 = "UPDATE pitanja SET aktivno_pitanje = 1 WHERE id_pitanja = :id";
    $izvrsenje2 = $konekcija->prepare($ispis2);
    $izvrsenje2->bindParam(":id", $id);
    $rezultat2 = $izvrsenje2->execute();
    if ($rezultat2):
        $obavestenje .= "Pitanje je aktivno!";
    endif;
endif;


echo json_encode($obavestenje);
?>