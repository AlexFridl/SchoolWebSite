<?php

session_start();
include "konekcija.php";

if (isset($_POST['btnZakazi'])) {
    $imePrezime = $_POST['tbImePrezime'];
    $email = $_POST['email'];
    $brTel = $_POST['tbBrTel'];
    $datum = $_POST['btnDatum'];
    $usluga = $_POST['ddlTipUsluga'];
    $termin = $_POST['hbTermin'];
    $status = "1";
    $errors = [];

    //datum
    $datum = explode("-", $datum);
    $godina = intval($datum[0]);
    $mesec = intval($datum[1]);
    $dan = intval($datum[2]);
    $tmStmDatumPokupljeni = mktime(0, 0, 0, $mesec, $dan, $godina);

    $tmStDanasnjiDatum = time();
    $datumZaUpis = date("Y-m-d H:i:s", $tmStmDatumPokupljeni);

    /*  $danasnjiDatum = date("Y-m-d",$timestamp); */

    if ($tmStmDatumPokupljeni < $tmStDanasnjiDatum) {
        $errors[] = "Morate odabrati datum posle današnjeg datuma!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location:../index.php?page=zakazi");
    }
    if (empty($datum)) {
        $errors[] = "Datum mora biti izabran!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location:../index.php?page=zakazi");
    }
    //ime i prezime
    $reImePrezime = "/^[A-Z][a-z]{3,12}(\s[A-Z][a-z]{3,20})+$/";
    if (!preg_match($reImePrezime, $imePrezime)) {
        $errors[] = "Ime i prezime nije OK!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location:../index.php?page=zakazi");
    }
    $imePrezime = explode(" ", $imePrezime);
    $ime = $imePrezime[0];
    $prezime = $imePrezime[1];

    //brTel
    $reBrTel = "/^06[1-9]\/[0-9]{5,7}$/";
    if (!preg_match($reBrTel, $brTel)) {
        $errors[] = "Broj telefona nije OK!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location:../index.php?page=zakazi");
    }
    //email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Email nije OK!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location:../index.php?page=zakazi");
    }
    //usluga
    if ($usluga == 0) {
        $errors[] = "Usluga mora biti izabrana!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location:../index.php?page=zakazi");
    }
    //usluga
    if ($termin == 0) {
        $errors[] = "Termin mora biti izabran!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location:../index.php?page=zakazi");
    }
    if (count($errors) == 0) {
        $upit = "INSERT INTO zakazani_termini VALUES('', :ime, :prezime, :email, :datum_termina, :br_tel, :usluga_id, :status_termina_id, :odabrani_id)";
        $izvrsenje = $konekcija->prepare($upit);
        $izvrsenje->bindParam(":ime", $ime);
        $izvrsenje->bindParam(":prezime", $prezime);
        $izvrsenje->bindParam(":email", $email);
        $izvrsenje->bindParam(":datum_termina", $datumZaUpis);
        $izvrsenje->bindParam(":br_tel", $brTel);
        $izvrsenje->bindParam(":usluga_id", $usluga);
        $izvrsenje->bindParam(":status_termina_id", $status);
        $izvrsenje->bindParam(":odabrani_id", $termin);
        try {
            $rezultat = $izvrsenje->execute();
            var_dump($rezultat);
            if ($rezultat) {
                $errors[] = "Uspešno ste izvrsili zakazivanje!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;

                header("Location:../index.php?page=zakazi");
            } else {
                $errors[] = "Zakazivanje nije izvršeno!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
                header("Location:../index.php?page=zakazi");
            }
        } catch (PDOException $e) {
            $e->getMessage();
        }
    } 
}
?>