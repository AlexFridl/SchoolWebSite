<?php

session_start();
include "konekcija.php";

if (isset($_POST['btnDodajPitanje'])) {
    $pitanje = $_POST['tbPitanje'];
    $rePitanje = "/^[\w\s\.\-\:\?]{1,255}$/";
    $aktivnoPitanje = 0;
    $uspeh = [];
    if (!empty($pitanje)) {
        if (!preg_match($rePitanje, $pitanje)) {
            $uspeh = "Tekst za pitanje nije OK!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $uspeh;
            header("Location: ../index.php?page=admin_anketa");
        }
    } else {
        $uspeh = "Morate uneti neki sadržaj za pitanje!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $uspeh;
        header("Location: ../index.php?page=admin_anketa");
    }
    if (count($uspeh) == 0) {
        $unos = "INSERT INTO pitanja VALUES ('', :naziv_pitanja, :aktivno_pitanje)";
        $izvrsenje = $konekcija->prepare($unos);
        $izvrsenje->bindParam(":naziv_pitanja", $pitanje);
        $izvrsenje->bindParam(":aktivno_pitanje", $aktivnoPitanje);
        try {
            $rezultat = $izvrsenje->execute();
            if ($rezultat) {
                $uspeh = "Uspešno ste uneli pitanje!</br>";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $uspeh;
                header("Location: ../index.php?page=admin_anketa");
            } else {
                $uspeh = "Nije uspeo unos!</br>";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $uspeh;
                header("Location: ../index.php?page=admin_anketa");
            }
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }
}
if (isset($_POST['btnDodajOdgovor'])) {

    $idPitanje = $_POST['ddlDodajPitanje'];
    $odgovor = $_POST['tbOdgovor'];
    $glas_odgovor = 0;

    $unos = "INSERT INTO odgovori VALUES ('', :ime_odgovor, :glas_odgovor, :pitanja_id)";
    $izvrsenje = $konekcija->prepare($unos);
    $izvrsenje->bindParam(":ime_odgovor", $odgovor);
    $izvrsenje->bindParam(":glas_odgovor", $glas_odgovor);
    $izvrsenje->bindParam(":pitanja_id", $idPitanje);
    try {
        $rezultat = $izvrsenje->execute();
        if ($rezultat) {
            $errors = "Uspešno ste uneli odgovor!";
            header("Location: ../index.php?page=admin_anketa");
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=admin_anketa");
        } else {
            $errors = "Nije uspeo unos!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=admin_anketa");
        }
    } catch (PDOException $e) {
        $e->getMessage();
    }
}
?>