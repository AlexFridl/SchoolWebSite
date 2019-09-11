<?php
session_start();
include "php/konekcija.php";

$page = "";
if(isset($_GET['page'])){
	$page = $_GET['page'];
}

    include "views/head.php";
    include "views/nav.php";     

    if(!isset($_SESSION['korisnik'])):
        //za ono sto treba posetilac da vidi    
        switch($page){
            case "spaIndex":
                include "views/spaIndex.php";
                break;
            case "zakazi":
                include "views/zakazi.php";
                break;
            case "cene":
                include "views/cene.php";
                break;
            case "logovanje":
                include "views/logovanje.php";
                break;
            case "autor":
                include "views/autor.php";
                break;         
            default:
                include "views/spaIndex.php";
                break;
        }    
    
    elseif($_SESSION['korisnik']->naziv_uloga == 'admin'):
            //ovde se ucitavaju svi fajlovi preko switcha za ono sto administrator moze i sme da vidi
        switch($page){
            case "admin_spaIndex":
                include "views/admin_spaIndex.php";
                break;
             case "zakazi":
                include "views/zakazi.php";
                break;
            case "admin_cene":
                include "views/admin_cene.php";
                break;
            case "spaIndex_dodaj":
                include "views/spaIndex_dodaj.php";
                break;
            case "spaIndex_izmeni":
                include "views/spaIndex_izmeni.php";
                break;
            case "cene_dodaj":
                include "views/cene_dodaj.php";
                break;       
            case "cene_izmena":
                include "views/cene_izmena.php";
                break;
              case "pregled_zakazanih":
                include "views/pregled_zakazanih.php";
                break;
            case "pregled_otkazanih":
                include "views/pregled_otkazanih.php";
                break;
            case "pregled_dodaj":
                include "views/pregled_dodaj.php";
                break;
            case "admin_anketa":
                include "views/admin_anketa.php";
                break;
            case "admin_korisnici":
                include "views/admin_korisnici.php";
                break;
            case "korisnici_izmeni":
                include "views/korisnici_izmeni.php";
                break;
            case "korisnik_dodaj":
                include "views/korisnik_dodaj.php";
                break;
            case "pregled_zakazanih":
                include "views/pregled_zakazanih.php";
                break;
            case "pregled_izmena":
                include "views/pregled_izmena.php";
                break;
            case "pregled_dodaj":
                include "views/pregled_dodaj.php";
                break;
            case "autor":
                include "views/autor.php";
                break; 
            default:
                include "views/admin_spaIndex.php";
                break;
            }
        
    elseif($_SESSION['korisnik']->naziv_uloga == 'korisnik'):
         ////ovde se ucitavaju svi fajlovi preko switcha za ono sto korisnik moze i sme da vidi
        switch($page){
            case "zakazi":
                include "views/zakazi.php";
                break;
            case "cene":
                include "views/cene.php";
                break;
            case "pregled_zakazanih":
                include "views/pregled_zakazanih.php";
                break;
            case "pregled_otkazanih":
                include "views/pregled_otkazanih.php";
                break;
            case "pregled_izmena":
                include "views/pregled_izmena.php";
                break;
            case "kontakt":
                include "views/kontakt.php";
                break;
            default:
                include "views/pregled_zakazanih.php";
                break;
            }
    endif;

    include "views/footer.php";


?>
