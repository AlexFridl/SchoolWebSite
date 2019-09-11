<?php

session_start();
include "konekcija.php";

if (isset($_POST['datum'])) {
    $datum = $_POST['datum'];

    $upit1 = "SELECT * FROM zakazani_termini z JOIN odabrani_termin o ON z.odabrani_id = o.id_odabrani WHERE z.datum_termina = '" . $datum . "' AND z.status_termina_id = 1";


    $podaci = "<option value='0'>Izaberi...</option>";
    try {
        $rezultat1 = $konekcija->query($upit1)->fetchAll();
//        $rezultat1 = $nesto;

        if ($rezultat1) {
            $upit2 = "SELECT * FROM odabrani_termin";
            $rezultat2 = $konekcija->query($upit2)->fetchAll();
//            $nesto = $izvrsenje2->execute();
//            $rezultat2 = $nesto;
            if ($rezultat2) {
                foreach ($rezultat2 as $rez2) {
                    foreach ($rezultat1 as $rez1) {
                        if ($rez2->id_odabrani != $rez1->odabrani_id) {
                            $podaci .= "<option value='" . $rez2->id_odabrani . "'>" . $rez2->naziv_termin . "</option>";
                        }
                    }
                }
                echo json_encode($podaci);
            } else {
                $errors = "Greska razultat 2!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
            }
        } else {
            $upit2 = "SELECT * FROM odabrani_termin";
            $rezultat2 = $konekcija->query($upit2)->fetchAll();
            foreach ($rezultat2 as $rez2) {
                $podaci .= "<option value='" . $rez2->id_odabrani . "'>" . $rez2->naziv_termin . "</option>";
            }
            echo json_encode($podaci);
        }
    } catch (PDOException $e) {
        echo json_encode($e->getMessage());
    }
}

