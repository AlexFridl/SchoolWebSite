<?php

session_start();
include "../konekcija.php";

if (isset($_POST['btnDodajPitanje'])) {
    $pitanje = $_POST['tbPitanje'];
    $rePitanje = "/^[\w\s\.\-\:\?]{1,255}$/";
    $aktivnoPitanje = 0;
    $uspeh = [];

    if(!empty($pitanje)):
        if(!preg_match($rePitanje, $pitanje)):
            $uspeh[] = "Tekst za pitanje nije OK!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $uspeh;
            //echo "<script language='JavaScript'> window.location='index.php?id=7'</script>";
            header("Location: ../../index.php?id=7");
        endif;
    else:
        $uspeh[] = "Morate uneti neki sadržaj za pitanje!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $uspeh;
        //echo "<script language='JavaScript'> window.location='index.php?id=7'</script>";
        header("Location: ../../index.php?id=7");
    endif;

    if (count($uspeh) == 0) {
        $unos = "INSERT INTO pitanja VALUES ('', :naziv_pitanja, :aktivno_pitanje)";
        $izvrsenje = $konekcija->prepare($unos);
        $izvrsenje->bindParam(":naziv_pitanja", $pitanje);
        $izvrsenje->bindParam(":aktivno_pitanje", $aktivnoPitanje);
        try {
            $rezultat = $izvrsenje->execute();
            if ($rezultat) {
                $uspeh[] = "Uspešno ste uneli pitanje!</br>";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $uspeh;
                header("Location: ../../index.php?id=7");
            } else {
                $uspeh[] = "Nije uspeo unos!</br>";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $uspeh;
                header("Location: ../../index.php?id=7");
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
    $reOdgovor = "/^([\w\.\-\:\?]{1,}\s{0,1}){1,}$/";

    if($idPitanje != 0):
        if(!preg_match($reOdgovor, $odgovor)){
            $errors[] = "Nije uspeo unos! Niste uneli ispravno odgovor!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../../index.php?id=7");
        }else {
            $unos = "INSERT INTO odgovori VALUES ('', :ime_odgovor, :glas_odgovor, :pitanje_id)";
            $izvrsenje = $konekcija->prepare($unos);
            $izvrsenje->bindParam(":ime_odgovor", $odgovor);
            $izvrsenje->bindParam(":glas_odgovor", $glas_odgovor);
            $izvrsenje->bindParam(":pitanje_id", $idPitanje);
            try {
                $rezultat = $izvrsenje->execute();
                if ($rezultat) {
                    $errors[] = "Uspešno ste uneli odgovor!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../../index.php?id=7");
                } else {
                    $errors[] = "Nije uspeo unos!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../../index.php?id=7");
                }
            } catch (PDOException $e) {
                $e->getMessage();
            }
        }
    else:
        $errors[] = "Nije uspeo unos! Niste izabrali pitanje!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../../index.php?id=7");
    endif;
}
?>