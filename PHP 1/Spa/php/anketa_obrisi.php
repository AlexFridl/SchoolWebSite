<?php
session_start();
include "konekcija.php";
$id = $_GET['id'];

$upit = "DELETE FROM pitanja WHERE id_pitanja = :id";
    $izvrsenje = $konekcija->prepare($upit);
    $izvrsenje->bindParam(":id", $id);
    try{
        $rezultat = $izvrsenje->execute();
        if($rezultat){
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = "Uspesno ste izbrisali pitanje!";
            header("Location: ../index.php?page=admin_anketa");
        }
        else{
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = "Brisanje nije bilo uspesno!";
            header("Location: ../index.php?page=admin_anketa");
        }
    } catch(PDOException $e){
        $e->getMessage();
    }
?>