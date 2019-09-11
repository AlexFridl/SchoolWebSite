<?php
    session_start();
    include "konkcija.php";

    unset($_SESSION['korisnik']);
    header("Location: ../index.php?page=spaIndex");
        
    

?>