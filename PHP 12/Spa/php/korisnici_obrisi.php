<?php
session_start();
include "konekcija.php";
$id = $_GET['id'];

$upit = "DELETE FROM korisnik WHERE id_korisnik = :id";
    $izvrsenje = $konekcija->prepare($upit);
    $izvrsenje->bindParam(":id", $id);
    try{
        $rezultat = $izvrsenje->execute();
        if($rezultat){
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = "Uspesno ste izbrisali korisnika!";
            header("Location: ../index.php?page=admin_korisnici");
        }
        else{
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = "Brisanje nije bilo uspesno!";
            header("Location: ../index.php?page=admin_korisnici");
        }
    } catch(PDOException $e){
        $e->getMessage();
    }
?>