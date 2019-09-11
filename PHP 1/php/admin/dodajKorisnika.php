<?php
session_start();
include "../konekcija.php";
if (isset($_REQUEST['btnPotvrdi'])) {
    $ime = trim($_POST['tbIme']);
    $prezime = trim($_POST['tbPrezime']);
    $korIme = trim($_POST['tbKorisnickoIme']);
    $email = trim($_POST['tbEmail']);
    $lozinka = trim($_POST['lozinka']);
    $uloga_id = $_POST['uloga'];

    $reIme = "/^[A-ZŽĆČĐŠ][a-zžćčđš]{2,15}$/";
    $rePrezime = "/^[A-ZŽĆČĐŠ][a-zžćčđš]{2,20}$/";
    $reKorIme = "/^\w{4,15}$/";
    $reLozinka = "/^[\S]{4,10}$/";
    $errors = [];
    //ime
    if (empty($ime)) {
        $errors[] = "Polje za ime je obavezno!";
    } elseif (!preg_match($reIme, $ime)) {
        $errors[] = "Polje za ime mora pocinjati velikim slovom i imati najvise 15 karaktera!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
     }
    //prezime
    if (empty($prezime)) {
        $errors[] = "Polje za prezime je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    } elseif (!preg_match($rePrezime, $prezime)) {
        $errors[] = "Polje za prezime mora pocinjati velikim slovom i imati najvise 20 karaktera!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    //korisicko ime
    if (empty($korIme)) {
        $errors[] = "Polje za korisnicko ime je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    } elseif (!preg_match($reKorIme, $korIme)) {
        $errors[] = "Polje za korisnicko ime se sastoji od 4 do 15 karaktera!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    //email
    if (empty($email)) {
        $errors[] = "Polje za email je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "E-mail nije u ispravnom formatu.";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    //lozinka
    if (empty($lozinka)) {
        $errors[] = "Polje za lozinku je obavezno.";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    } elseif (!preg_match($reLozinka, $lozinka)) {
        $errors[] = "Polje za lozinku mora sadrzati ukupno 4 do 10 karaktera!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }

    if ($uloga_id == 0) {
        $errors[] = "Polje za ulogu je obavezno!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }

    $podaci = "";
    if (!empty($errors)) {
        $podaci .= "<ol>";
        foreach ($errors as $error) {
            echo "<li> $error </li>";
        }
        $podaci .= "</ol>";
    } else {
        $lozinka = md5($_POST['lozinka']);
        $upit = "INSERT INTO korisnik VALUES('', :ime_korisnik, :prezime_korisnik, :korisnicko_ime, :email, :lozinka, :uloga_id)";
        $izvrsenje = $konekcija->prepare($upit);
        $izvrsenje->bindParam(':ime_korisnik', $ime);
        $izvrsenje->bindParam(':prezime_korisnik', $prezime);
        $izvrsenje->bindParam(':korisnicko_ime', $korIme);
        $izvrsenje->bindParam(':email', $email);
        $izvrsenje->bindParam(':lozinka', $lozinka);
        $izvrsenje->bindParam(':uloga_id', $uloga_id);
        try {
            $rezultat = $izvrsenje->execute();

            if ($rezultat) {
                $errors[] =  "</br>Uspešno ste se uneli korisnika.";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
                echo "<script language='JavaScript'> window.location='../../index.php?id=105'</script>";
                //header("Location: ../../index.php?id=108");
            } else {
                $errors[] =  "</br>Greška pri unosu korisnika.";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
                header("Location: ../../index.php?id=105");
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
}
?>