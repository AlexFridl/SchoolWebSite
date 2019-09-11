<?php
session_start();
include ("php/konekcija.php");

include "view/head.php";
include "view/sidebar.php";

$id="";
if(isset($_GET['id'])){
$id = @$_GET['id'];

}

                    switch ($id) {
                        case '1':
                            include('view/pocetna.php');
                            break;
                        case '2':
                            include('view/program.php');
                            break;
                        case '3':
                            include('view/galerija.php');
                            break;
                        case '5':
                            include('view/autor.php');
                            break;
                        case '6':
                            include('view/admin_korisnici.php');
                            break;
                        case '98':
                            include('view/logovanje.php');
                            break;
                        case '99':
                            include('view/registracija.php');
                            break;
                        case '100':
                            include('php/logout.php');
                            break;
                        case '101':
                            include('view/admin_dodaj_program.php');
                            break;
                        case '102':
                            include('view/program.php');
                            break;
                        case '103':
                            include('view/admin_izmeni_program.php');
                            break;
                        case '104':
                            include('php/admin/brisanjePrograma.php');
                            break;
                        case '105':
                            include('view/admin_dodaj_korisnika.php');
                            break;
                        case '106':
                            include('view/admin_izmeni_korisnika.php');
                            break;
                        case '107':
                            include('php/admin/obrisiKorisnika.php');
                            break;
                        case '108':
                            include('view/admin_dodaj_sliku.php');
                            break;
                        case '109':
                            include('view/admin_izmena_galerija.php');
                            break;
                        case '7':
                            include('view/adminAnketa.php');
                            break;
                        default:
                            include('view/pocetna.php');
                    }


?>



</div>
</div>
</div>
</body>
</html>
