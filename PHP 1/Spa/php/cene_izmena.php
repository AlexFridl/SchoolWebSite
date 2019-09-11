<?php

session_start();
include "konekcija.php";

if (isset($_POST['btnCeneIzmena'])) {
    $id = $_POST['hiddenId'];   
    $naslov = $_POST['tbNaslov'];
    $slika = $_FILES['fSlika'];
    $cene = $_POST['tbCene'];
    $tekst = $_POST['tbTekst'];
    $errors = [];

    //slika
    $slikaNaziv = $slika['name'];
    $slikaTip = $slika['type'];
    $slikaVelicina = $slika['size'];
    $slikaTmp = $slika['tmp_name'];
    $dozvoljeniFormati = array("image/jpg", "image/jpeg", "image/gif", "image/png");

    //naslov
    $reNaslov = "/^[A-Z][\w\s\d]{2,255}$/";
    if (empty($naslov)) {
        $errors = "Morate uneti neki naslov!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=cene_izmena&id=".$id);
    } else {
        if (!preg_match($reNaslov, $naslov)) {
            $errors = "Naslov nije OK!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_izmena&id=".$id);
        }
    }
    //slika
    if (empty($slika)) {
        $errors = "Morate uneti sliku!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=cene_izmena&id=".$id);
    } else {
        if ($slikaVelicina > 2000000) {
            $errors = "Slika mora da bude manja od 1MB!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_izmena&id=".$id);
        }
        if (!in_array($slikaTip, $dozvoljeniFormati)) {
            $errors = "Nije dobar format slike!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_izmena&id=".$id);
        }
    }

    //tekst
    $reTekst = "/^[\w\s\d\.\-\:\,]{1,255}$/";
    if (empty($tekst)) {
        $errors = "Morate uneti neki sadržaj!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=cene_izmena");
    } else {
        if (!preg_match($reTekst, $tekst)) {
            $errors = "Tekst nije OK!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_izmena&id=".$id);
        }
    }

    //cena
    $reCena = "/^[\d]{1,50}$/";
    if (empty($cene)) {
        $errors = "Morate uneti neki iznos!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=cene_izmena&id=".$id);
    } else {
        if (!preg_match($reCena, $cene)) {
            $errors = "Cena nije OK!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_izmena&id=".$id);
        }
    }
    if (count($errors) == 0) {
        $nazivFajla = time() . $slikaNaziv;
        $novaPutanja = "../slike/" . $nazivFajla;
        $novaPutanjaZaBazu = "slike/" . $nazivFajla;
        if (move_uploaded_file($slikaTmp, $novaPutanja)) {
            $upit = "INSERT INTO slika VALUES ('', :putanja_slika, :naziv_slike)";
            $izvrsenje = $konekcija->prepare($upit);
            $izvrsenje->bindParam(":putanja_slika", $novaPutanjaZaBazu);
            $izvrsenje->bindParam(":naziv_slike", $nazivFajla);
            try {
                $rezultat = $izvrsenje->execute();
                $id_slika = $konekcija->lastInsertId();

                $unos = "UPDATE cenovnik SET naslov = :naslov, tekst = :tekst, cena = :cena, slika_id = :slika_id) WHERE id_cenovnik = :id";
                $izvrsenje = $konekcija->prepare($unos);
                $izvrsenje->bindParam(":naslov", $naslov);
                $izvrsenje->bindParam(":tekst", $tekst);
                $izvrsenje->bindParam(":cena", $cene);
                $izvrsenje->bindParam(":slika_id", $id_slika);
                $izvrsenje->bindParam(":id", $id);
             

                $rezultat = $izvrsenje->execute();
                if ($rezultat) {

                    $errors = "Uspesno ste uneli u cenovnik!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_cene&id=".$id);
                } else {

                    $errors = "Nije uspeo unos!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_cene&id=".$id);
                }
            } catch (PDOException $e) {
                $e->getMessage();
            }
        }
    }
}
?>
