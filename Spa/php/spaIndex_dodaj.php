<?php

session_start();
include "konekcija.php";

if (isset($_POST['btnDodaj'])) {
    $naziv = $_POST['tbNaziv'];
    $slika = $_FILES['fSlika'];
    //  $id = $_POST['hiddenId'];
    $errors = [];

    $slikaNaziv = $slika['name'];
    $slikaTip = $slika['type'];
    $slikaVelicina = $slika['size'];
    $slikaTmp = $slika['tmp_name'];
    
    //$reNaziv = "/^([A-z]{1,}\s){1,}$/";
    if (empty($naziv)) {
        $errors[] = "Mora biti unesen naziv!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=spaIndex_dodaj");
    } 
//    else {
//        if (!preg_match($reNaziv, $slikaNaziv)) {
//            $errors[] = "Naziv slike";
//            $_SESSION['obavestenje'] = "";
//            $_SESSION['obavestenje'] = $errors;
//            header("Location: ../index.php?page=spaIndex_dodaj");
//        }
//    }
    $dozvoljeniFormati = array("image/jpg", "image/jpeg", "image/gif", "image/png");
    if (empty($slika)) {
        $errors[] = "Morate uneti sliku!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=spaIndex_dodaj");
    } else {
        if (!in_array($slikaTip, $dozvoljeniFormati)) {
            $errors[] = "Nije dobar format slike!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=spaIndex_dodaj");
        }
        if ($slikaVelicina > 2000000) {
            $errors[] = "Slika mora da bude manja od 2MB!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=spaIndex_dodaj");
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
            $izvrsenje->bindParam(":naziv_slike", $naziv);
            try {
                $rezultat = $izvrsenje->execute();
                if ($rezultat) {
                    $errors[] = "Unos u bazu je odrađen!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_spaIndex");
                } else {
                    $errors[] = "Unos nije odrađen!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_spaIndex");
                }
            } catch (PDOException $e) {
                $e->getMessage();
            }
        }
    }
}
?>
       