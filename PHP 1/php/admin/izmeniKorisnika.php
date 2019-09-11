<?php

include "../konekcija.php";
if (isset($_REQUEST['btnPotvrdi'])) {
    $ime = trim($_POST['tbImeK']);
    $prezime = trim($_POST['tbPrezimeK']);
    $korisnicko_ime = trim($_POST['tbKorisnickoIme']);
    $email = trim($_POST['tbEmailK']);
    $lozinka = trim($_POST['lozinkaK']);
    $uloga_id = $_POST['uloga'];
    $id = $_GET['id_korisnik'];

    $greske = array();
    $regKorisnickoIme = "/^[A-Z]\w{1,}$/";
    $regLozinka = "/^\w{1,}$/";

    if ($korisnicko_ime != "") {
        if (!preg_match($regKorisnickoIme, $korisnicko_ime)) {
            $greske[] = "Korisničко ime nije u dobrom formatu!";
        }
    } else {
        $greske[] = "Niste uneli korisnicko ime!";
    }
    if ($lozinka != "") {
        if (!preg_match($regLozinka, $lozinka)) {
            $greske[] = "Lozinka nije u dobrom formatu!";
        }
    } else {
        $greske[] = "Niste uneli lozinku!";
    }

    if (count($greske) != 0) {
        echo "<div>";
        foreach ($greske as $g) {
            echo "<i>" . $g . "</i><br/>";
        }
        echo "</div>";
    } else {
           $lozinka = md5($_POST['lozinka']);
        $upit_izmeniKorisnik = "UPDATE korisnik SET ime_korisnik = :ime_korisnik, prezime_korisnik = :prezime_korisnik, korisnicko_ime = :korisnicko_ime, email = :email, lozinka=:lozinka, uloga_id = :uloga_id WHERE id_korisnik = :id";
        $priprema = $konekcija->prepare($upit_izmeniKorisnik);

        $priprema->bindParam(":ime_korisnik", $ime);
        $priprema->bindParam(":prezime_korisnik", $prezime);
        $priprema->bindParam(":korisnicko_ime", $korisnicko_ime);
        $priprema->bindParam(":email", $email);
        $priprema->bindParam(":lozinka", $lozinka);
        $priprema->bindParam(":uloga_id", $uloga_id);
        $priprema->bindParam(":id", $id);

        try {
            $rezultat = $priprema->execute();

            if (!$rezultat) {
                $greske[] =  "</br>Izmena korisnika nije uspela!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $greske;
                header("Location: ../../index.php?id=105");
            } else {
                $greske[] =  "</br>Uspešno ste izmenili korisnika!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $greske;
                header("Location: ../../index.php?id=6");
            }
        } catch (PDOExecute $ex) {
            $ex->getMessage();
        }

    }
}
?>