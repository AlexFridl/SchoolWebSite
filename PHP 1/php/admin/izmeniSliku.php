<?php
session_start();
include "../konekcija.php";

if(isset($_POST['btnIzmeniG'])) {
    $imeS = $_POST['tbImeS'];
    $slika = $_FILES['fSlika'];
    $id = $_GET['id_gal'];

    $slika_ime = $slika['name'];
    $slika_tip = $slika['type'];
    $slika_size = $slika['size'];
    $slika_tmp = $slika['tmp_name'];


    $novoIme = time() . $slika_ime;
    $novaPutanja = "../../images/" . $novoIme;


    $greske = array();
    $dozvoljeni_formati = array("images/jpg", "image/jpeg", "images/png", "images/gif");
    // $regSlika = "/^\S{2,}\.(gif|jpg|jpeg|png|JPG)$/";
    $regNaziv = "/^[\w\s]{2,25}$/";

    /*
        if ($slika != "") {
            if (!in_array($slika_tip,$dozvoljeni_formati)) {
                $greske[] = "Slika nije u dobrom formatu!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $greske;
                header("Location: ../../index.php?id=109&id_gal=".$id);
           }
        }*/
    if (!preg_match($regNaziv, $imeS)) {
        $greske[] = "Morate uneti ispravno naziv slike!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $greske;
        header("Location: ../../index.php?id=109&id_gal=".$id);
    }

    if (count($greske) != 0) {
        echo "<div>";
        foreach ($greske as $g) {
            echo "<i>" . $g . "</i><br/>";
        }
        echo "</div>";
    } else {
        if ($slika_ime == "") {
            $upit = "UPDATE galerija SET naziv_slika = :naziv_slika WHERE id_slika = :id";
            $priprema = $konekcija->prepare($upit);
            $priprema->bindParam(":naziv_slika", $imeS);
            $priprema->bindParam(":id", $id);
            try {
                $rezultat = $priprema->execute();
                if ($rezultat) {
                    $greske[] = "</br>Uspesno ste uneli izmenu u galeriju!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $greske;
                    header("Location: ../../index.php?id=109&id_gal=".$id);
                } else {
                    $greske[] = "Niste uneli izmenu u galeriju!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $greske;
                    header("Location: ../../index.php?id=109&id_gal=".$id);
                }
            } catch (PDOException $ex) {
                $ex->getMessage();
            }

        } else{
            if (move_uploaded_file($slika_tmp, $novaPutanja)) {
                $upit2 = "UPDATE galerija SET naziv_slika = :naziv_slika, putanja_slika = :putanja_slika WHERE id_slika = :id";
                $priprema = $konekcija->prepare($upit2);
                $priprema->bindParam(":naziv_slika", $imeS);
                $priprema->bindParam(":putanja_slika", $novoIme);
                $priprema->bindParam(":id", $id);

                try {
                    $rezultat = $priprema->execute();
                    if ($rezultat) {
                        $greske[] = "</br>Uspesno ste uneli izmenu u galeriju!";
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] = $greske;
                        header("Location: ../../index.php?id=109&id_gal=".$id);
                    } else {
                        $greske[] = "Niste uneli izmenu u galeriju!";
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] = $greske;
                        header("Location: ../../index.php?id=109&id_gal=".$id);
                    }
                } catch (PDOException $ex) {
                    $ex->getMessage();
                }
            }
    }
    }
}
?>
