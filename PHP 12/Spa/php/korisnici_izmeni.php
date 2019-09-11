<?php

session_start();
include "konekcija.php";

if (isset($_POST['btnKorisnikIzmena'])) {

    $id = $_POST['hiddenId'];
    $ime = $_POST['tbIme'];
    $prezime = $_POST['tbPrezime'];
    $korIme = $_POST['tbKorIme'];
    $email = $_POST['tbEmail'];
    $lozinka = md5($_POST['tbLoz']);
    $uloga = $_POST['ddlUloga'];

    $reIme = "/^[A-ZŽĆČĐŠ][a-zžćčđš]{2,15}$/";
    $rePrezime = "/^[A-ZŽĆČĐŠ][a-zžćčđš]{2,20}$/";
    $reKorIme = "/^\w{6,15}$/";

    if (empty($ime)) {
        $errors[] = "Polje za ime je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    } elseif (!preg_match($reIme, $ime)) {
        $errors[] = "Polje za ime mora pocinjati velikim slovom i imati najvise 15 karaktera!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    }
    //prezime
    if (empty($prezime)) {
        $errors[] = "Polje za prezime je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    } elseif (!preg_match($rePrezime, $prezime)) {
        $errors[] = "Polje za prezime mora pocinjati velikim slovom i imati najvise 20 karaktera!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    }
    //korisicko ime
    if (empty($korIme)) {
        $errors[] = "Polje za korisnicko ime je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    } elseif (!preg_match($reKorIme, $korIme)) {
        $errors[] = "Polje za korisnicko ime se sastoji od 6 do 15 karaktera!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    }
    //email
    if (empty($email)) {
        $errors[] = "Polje za email je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "E-mail nije u ispravnom formatu.";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=korisnici_izmeni&id=" . $id);
    }
    //lozinka
    if (empty($lozinka)) {
        $errors[] = "Polje za lozinku je obavezno.";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    
    if (empty($errors)) {
        $upit = "UPDATE korisnik SET ime_korisnik = :ime_korisnik, prezime_korisnik = :prezime_korisnik, korisnicko_ime = :korisnicko_ime, email = :email, lozinka = :lozinka, uloga_id = :uloga_id WHERE id_korisnik=:id";
        
        $izvrsenje = $konekcija->prepare($upit);
        $izvrsenje->bindParam(":ime_korisnik", $ime);
        $izvrsenje->bindParam(":prezime_korisnik", $prezime);
        $izvrsenje->bindParam(":korisnicko_ime", $korIme);
        $izvrsenje->bindParam(":email", $email);
        $izvrsenje->bindParam(":lozinka", $lozinka);
        $izvrsenje->bindParam(":uloga_id", $uloga);
        $izvrsenje->bindParam(":id", $id_korisnik);
        try {
            $rezultat = $izvrsenje->execute();
            if ($rezultat) {
                $errors[] = "Uspesno je izvrsena izmena u bazi!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
                header("Location: ../index.php?page=admin_korisnici");
            } else {
                $errors[] = "Nije uspeno izvrsena izmena u bazi!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;

                header("Location: ../index.php?page=admin_korisnici");
            }
        } catch (PDOException $e) {
            $errors[] = "GRESKA!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=admin_korisnici");
        }
    } else {
        $errors[] = "Nije uspeo unos u bazu!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=admin_korisnici");
    }
}
?>