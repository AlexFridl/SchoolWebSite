<?php
    session_start();
    include "konkcija.php";

    unset($_SESSION['korisnik']);
    header("Location: ../index.php?id=1");
?>