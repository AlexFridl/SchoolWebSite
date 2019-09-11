<?php
session_start();
include "../konekcija.php";
if (isset($_REQUEST['btnIzmeni'])) {
    $naziv = $_REQUEST['tbNazivPrograma'];
    $text1 = $_REQUEST['taTekstProgram1'];
    $text2 = $_REQUEST['taTekstProgram2'];
    $text3 = $_REQUEST['taTekstProgram3'];
    $id = $_REQUEST['id_prog'];

    @$s = $_REQUEST['fSlika'];
    $slika = $_FILES['fSlika']['name'];
    $p_slika = $_FILES['fSlika']['tmp_name'];

    $novo_ime_slike = time() . $slika;
    $putanja = "../../images/" . $novo_ime_slike;

//            echo "slika ".$slika;
    $greske = array();

//            $regNaziv = "/^[A-Z][\w]{1,}$/";
//            $regText = "/^[A-Z][\w]{1,}$/";
    $regSlika = "/^\S+\.(gif|jpg|jpeg|png|JPG)$/";

//            if (!preg_match($regNaziv, $naziv)) {
//                $greske[] = "Morate uneti ispravno naziv programa!";
//            }
//
//            if (!preg_match($regText, $text1)) {
//                $greske[] = "Morate uneti ispravno tekst 1 programa!";
//            }
//            if (!preg_match($regText, $text2)) {
//                $greske[] = "Morate uneti ispravan tekst 2 programa!";
//            }
//            if (!preg_match($regText, $text3)) {
//                $greske[] = "Morate uneti ispravan tekst 3 programa!";
//            }
    if ($slika != "") {
        if (!preg_match($regSlika, $slika)) {
            $greske[] = "Slika nije u dobrom formatu!";
        }
    }

    if (count($greske) != 0) {
        echo "<div>";
        foreach ($greske as $g) {
            echo "<i>" . $g . "</i><br/>";
        }
        echo "</div>";
    } else {
        if ($slika == "") {
            $upit_izmeniProg = "UPDATE programi SET naziv_prog= :naziv, tekst1_prog= :text1, tekst2_prog= :text2, tekst3_prog= :text3 WHERE id_prog= :id";
            //   $upit_izmeniProg = "UPDATE programi SET naziv_prog='" . $naziv . "', tekst1_prog='" . $text1 . "', tekst2_prog='" . $text2 . "', tekst3_prog='" . $text3 . "' WHERE id_prog=" . $id;
            $priprema = $konekcija->prepare($upit_izmeniProg);
            $priprema->bindParam(":naziv", $naziv);
            $priprema->bindParam(":text1", $text1);
            $priprema->bindParam(":text2", $text2);
            $priprema->bindParam(":text3", $text3);
            $priprema->bindParam(":id", $id);

            try {
                $rezultat = $priprema->execute();
                if (!$rezultat) {
                    $greske[] = "</br>Izmena programa je neuspesna.";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $greske;
                    header("Location: ../../index.php?id=103&id_prog=".$id);
                } else {
                    $greske[] = "</br>Uspesno ste uneli izmenu programa.";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $greske;
                    header("Location: ../../index.php?id=103&id_prog=".$id);
                }
            } catch (PDOException $ex) {
                $ex->getMessage();
            }
        } else {
            if (move_uploaded_file($p_slika, $putanja)) {

                $upit_izmeniProg = "UPDATE programi SET naziv_prog= :naziv, tekst1_prog=:text1, tekst2_prog=:text2, tekst3_prog=:text3 WHERE id_prog=:id";
                $priprema = $konekcija->prepare($upit_izmeniProg);
                $priprema->bindParam(":naziv", $naziv);
                $priprema->bindParam(":text1", $text1);
                $priprema->bindParam(":text2", $text2);
                $priprema->bindParam(":text3", $text3);
                $priprema->bindParam(":id", $id);
                try {
                    $rez_izmeniProg = $priprema->execute();
                    if (!$rez_izmeniProg) {
                        $greske[] = "</br>Izmena programa je neuspesna.2";
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] = $greske;
                        header("Location: ../../index.php?id=103&id_prog=".$id);
                    } else {
                        $upit_select_izmeniProgram = "SELECT * FROM programi WHERE id_prog = :id";
                        $priprema2 = $konekcija->prepare($upit_select_izmeniProgram);
                        $priprema2->bindParam(":id", $id);
                        $rezultat_select_izmeniProgram = $priprema2->execute();
                        $rezultat_select_izmeniProgram = $priprema2->fetch();
                        //var_dump($rezultat_select_izmeniProgram);

                        if (!$rezultat_select_izmeniProgram) {
                        $greske[] = "</br>Izmena programa je neuspesna.3";
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] = $greske;
                        header("Location: ../../index.php?id=103&id_prog=".$id);
                        } else {
                            $upit_izmeniProg = "UPDATE slikeprog SET naziv_slika= :naziv, putanja_slike=:putanja_slike WHERE id_slikaP=:id";
                            $priprema3 = $konekcija->prepare($upit_izmeniProg);
                            $priprema3->bindParam(":naziv", $naziv);
                            $priprema3->bindParam(":putanja_slike", $novo_ime_slike);
                            $priprema3->bindParam(":id", $rezultat_select_izmeniProgram->slikaP_id);
                            $rezultat_slika_program = $priprema3->execute();

                        if (!$rezultat_slika_program) {
                            $greske[] = "</br>Izmena programa je neuspesna.4";
                            $_SESSION['obavestenje'] = "";
                            $_SESSION['obavestenje'] = $greske;
                            header("Location: ../../index.php?id=103&id_prog=".$id);
                        } else {
                                $greske[] = "</br>Uspesno ste uneli izmenu programa.";
                                $_SESSION['obavestenje'] = "";
                                $_SESSION['obavestenje'] = $greske;
                                header("Location: ../../index.php?id=103&id_prog=".$id);
                            }
                        }

                    }
                } catch (PDOException $ex) {

                    $greske[] = "</br>Izmena programa je neuspesna 5" . $ex->getMessage();;
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $greske;
                    header("Location: ../../index.php?id=103&id_prog=".$id);

                }

            }
        }
    }
}

?>