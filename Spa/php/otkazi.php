<?php
session_start();
include "konekcija.php";
$id = $_GET['id'];
$status=2;
$errors = [];

$upit = "UPDATE zakazani_termini SET status_termina_id = :status WHERE id_termin = :id";
$izvrsenje = $konekcija->prepare($upit);
$izvrsenje->bindParam(":status",$status);
$izvrsenje->bindParam(":id",$id);
try{
    $rezultata = $izvrsenje->execute();
    if($rezultat){
        $errors = "Otkazivanje termina nije bilo uspesno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=pregled_zakazanih");
    }
    else{
        $errors= "Uspešno ste izvršili otkazivanje termina!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=pregled_zakazanih");        
    }
} catch (Exception $ex) {
$e->getMessage();
}
