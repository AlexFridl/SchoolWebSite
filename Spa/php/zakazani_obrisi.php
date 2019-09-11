<?php 
session_start();  
include "konekcija.php";  
$id = $_GET['id'];
$errors = [];

$upit = "DELETE FROM zakazani_termini WHERE id_termin = :id";
 $izvrsenje = $konekcija->prepare($upit);
    $izvrsenje->bindParam(":id", $id);
    try{
        $rezultat = $izvrsenje->execute();
        if($rezultat){
            $errors[] = "Uspesno ste izbrisali zakazan termin!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=pregled_otkazanih");
        }
        else{
            $errors = "Brisanje nije bilo uspesno!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=pregled_otkazanih");
        }
    } catch(PDOException $e){
        $e->getMessage();
    }
?>











