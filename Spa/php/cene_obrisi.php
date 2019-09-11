<?php
session_start();
include "konekcija.php";
$id = $_GET['id'];

$upit = "DELETE FROM cenovnik WHERE id_cenovnik = :id";
    $izvrsenje = $konekcija->prepare($upit);
    $izvrsenje->bindParam(":id", $id);
    try{
        $rezultat = $izvrsenje->execute();
        if($rezultat){
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = "Uspesno ste izbrisali stavku!";
            header("Location: ../index.php?page=admin_cene");
        }
        else{
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = "Brisanje nije bilo uspesno!";
            header("Location: ../index.php?page=admin_cene");
        }
    } catch(PDOException $e){
        $e->getMessage();
    }

?>