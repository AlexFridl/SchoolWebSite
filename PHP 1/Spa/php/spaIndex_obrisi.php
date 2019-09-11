<?php
session_start();
include "konekcija.php";
$id = $_GET['id'];
$errors = [];

$upit = "DELETE FROM slika WHERE id_slika = :id";
$izvrsenje = $konekcija->prepare($upit);
$izvrsenje->bindParam(":id",$id);
try{
    $rezultat = $izvrsenje->execute();
    if($rezultat){
        $errors[] = "Uspesno ste izvrsili brisanje slike!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header ("Location: ../index.php?page=admin_spaIndex");
    }
    else{
        $errors[] = "Brisanje nije bilo uspesno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header ("Location: ../index.php?page=admin_spaIndex");
    }
}
catch(PDOException $e){
    $e->getMessage();
}
?>