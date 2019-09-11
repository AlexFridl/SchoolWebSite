<?php
session_start();
    include '../konekcija.php';

    if (isset($_REQUEST['btnDodaj'])) {
        $naziv = trim($_REQUEST['tbNazivPrograma']);
        $text1 = trim($_REQUEST['taTekstProgram1']);
        $text2 = trim($_REQUEST['taTekstProgram2']);
        $text3 = trim($_REQUEST['taTekstProgram3']);

        $s = $_FILES['fSlika'];
        $slika = $s['name'];
        $slika_tip = $s['type'];
        $slika_size = $s['size'];
        $p_slika = $s['tmp_name'];

        $novo_ime_slike = time() . $slika;
        $novaPutanjaZaBazu = "../../images/".$novo_ime_slike;
        $greske = array();

        $regNaziv = "/^[\w\s\d]{2,50}$/";
        $regText = "/^[\w\s\.\:\;\!\'\"\/]{2,150}$/";
        $dozvoljeni_formati = array("images/jpg","image/jpeg","images/png","images/gif");

        if ($slika != "") {
            if (!in_array($slika_tip,$dozvoljeni_formati)) {
                $greske[] = "Slika nije u dobrom formatu!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $greske;
                header("Location: ../../index.php?id=101");
            }
        }
        if (!preg_match($regNaziv, $naziv)) {
            $greske[] = "Morate uneti ispravno naziv programa!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $greske;
            header("Location: ../../index.php?id=101");
        }

        if (!preg_match($regText, $text1)) {
          $greske[] = "Morate uneti ispravno tekst 1 programa!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $greske;
            header("Location: ../../index.php?id=101");
        }
        if (!preg_match($regText, $text2)) {
           $greske[] = "Morate uneti ispravan tekst 2 programa!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $greske;
            header("Location: ../../index.php?id=101");
        }
        if (!preg_match($regText, $text3)) {
            $greske[] = "Morate uneti ispravan tekst 3 programa!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $greske;
            header("Location: ../../index.php?id=101");
        }

        if (count($greske) != 0) {
            echo "<div>";
            foreach ($greske as $g) {
                echo "<i>" . $g . "</i><br/>";
            }
            echo "</div>";
        } else {

            if (move_uploaded_file($p_slika, $novaPutanjaZaBazu)) {

                $upit = "INSERT INTO slikeProg VALUES ('', :naziv_slika, :putanja_slike)";
                $izvrsenje = $konekcija->prepare($upit);
                $izvrsenje->bindParam(":naziv_slika", $naziv);
                $izvrsenje->bindParam(":putanja_slike", $novo_ime_slike);

                try {
                    $rezultat = $izvrsenje->execute();
                    $id_slika = $konekcija->lastInsertId();

                $upit_dodajProg = "INSERT INTO programi VALUES('', :naziv, :text1, :text2, :text3 , :slikaP_id)";
                $priprema = $konekcija->prepare($upit_dodajProg);
                $priprema->bindParam(":naziv", $naziv);
                $priprema->bindParam(":text1", $text1);
                $priprema->bindParam(":text2", $text2);
                $priprema->bindParam(":text3", $text3);
                $priprema->bindParam(":slikaP_id", $id_slika);

                    $rezultat = $priprema->execute();
                    if (!$rezultat) {
                        $greske[] =  "</br>Dodavanje programa nije uspelo.";
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] = $greske;
                        echo "<script language='JavaScript'> window.location='../../index.php?id=101'</script>";

                    } else {
                        $greske[] =  "Uspesno ste uneli program.";
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] = $greske;
                        header("Location: ../../index.php?id=101");
                    }
                } catch (PDOException $ex) {
                    $ex->getMessage();
                }
            } else {
                $greske[] =  "Greska pri unosu! Proverite da li ste uneli sliku za program.";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $greske;

            }
        }
    }
?>