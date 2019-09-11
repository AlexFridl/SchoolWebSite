<?php

session_start();  
include "konekcija.php";  

if(isset($_POST['btnDodajCene'])){    
    $naslov = $_POST['tbNaslov'];        
    $slika = $_FILES['fSlika'];
    
    $cene = $_POST['tbCene']; 
    $tekst = $_POST['tbTekst']; 
    $errors = [];

    //slika
    $slikaNaziv = $slika['name'];
    $slikaTip = $slika['type'];
    $slikaVelicina = $slika['size'];
    $slikaTmp = $slika['tmp_name'];
    $dozvoljeniFormati = array("image/jpg", "image/jpeg", "image/gif", "image/pbg");

     //naslov
     $reNaslov="/^[\w\s\d]{1,255}$/";
     if(!empty($naslov)){
         if(!preg_match($reNaslov,$naslov)){
             $errors[]="Naslov nije OK!</br>";
             $_SESSION['obavestenje'] = "";
             $_SESSION['obavestenje'] = $errors;
             header("Location: ../index.php?page=cene_dodaj");
         }
     }
     else{
         $errors[] = "Morate uneti neki naslov!</br>";
         $_SESSION['obavestenje'] = "";
         $_SESSION['obavestenje'] = $errors;
         header("Location: ../index.php?page=cene_dodaj");
     }
     //slika
    if(!empty($slika)){
        if($slikaVelicina >2000000)
        {
            $errors[] = "Slika mora da bude manja od 1MB!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_dodaj");
        }        
        if(!in_array($slikaTip, $dozvoljeniFormati)){
            $errors[] = "Nije dobar format slike!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_dodaj");
        }   
    } 
    else{
        $errors[] = "Morate uneti sliku!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=cene_dodaj");
    }
   
    //tekst
    $reTekst="/^[\w\s\.\-\:]{1,255}$/";
    if(!empty($tekst)){
        if(!preg_match($reTekst,$tekst)){
            $errors[]="Tekst nije OK!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_dodaj");
        }
    }
    else{
        $errors[] = "Morate uneti neki sadržaj!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=cene_dodaj");
    }
    //cena
    $reCena="/^[\d]{1,50}$/";
    if(!empty($cene)){
        if(!preg_match($reCena,$cene)){
            $errors[]="Cena nije OK!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=cene_dodaj");
        }
    }
    else{
        $errors[] = "Morate uneti neki iznos!</br>";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=cene_dodaj");
    }
    if(count($errors) == 0){ 
        $nazivFajla = time().$slikaNaziv;
        $novaPutanja = "../slike/".$nazivFajla;
        $novaPutanjaZaBazu = "slike/".$nazivFajla;
        if(move_uploaded_file($slikaTmp, $novaPutanja)){
            $upit = "INSERT INTO slika VALUES ('', :putanja_slika, :naziv_slike)";
            $izvrsenje = $konekcija->prepare($upit);
            $izvrsenje->bindParam(":putanja_slika", $novaPutanjaZaBazu);
            $izvrsenje->bindParam(":naziv_slike", $nazivFajla); 
            try{
                $rezultat = $izvrsenje->execute();
                $id_slika = $konekcija->lastInsertId();
            /*     var_dump($id_slika); */

                $unos =  "INSERT INTO cenovnik VALUES ('', :naslov, :tekst, :cena, :slika_id)";
                $izvrsenje = $konekcija->prepare($unos);
                $izvrsenje->bindParam(":naslov", $naslov);
                $izvrsenje->bindParam(":tekst", $tekst); 
                $izvrsenje->bindParam(":cena", $cene);
                $izvrsenje->bindParam(":slika_id", $id_slika); 
    
                    $rezultat = $izvrsenje->execute();         
                    if($rezultat){
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] = "Uspesno ste uneli u cenovnik!";
                        header("Location: ../index.php?page=admin_cene");
                    }
                    else{
                        $_SESSION['obavestenje'] = "";
                        $_SESSION['obavestenje'] ="Nije uspeo unos!";
                        header("Location: ../index.php?page=admin_cene");
                    }   
            }               
            catch(PDOException $e){
                $e->getMessage();
            }
        }
    }

}
?>