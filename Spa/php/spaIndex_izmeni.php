<?php
    session_start();
    include "konekcija.php";

    if(isset($_POST['btnIzmeni'])){       
        $naziv = $_POST['tbNaziv'];        
        $slika = $_FILES['fSlika'];
        $id = $_POST['hiddenId'];      
        $errors = [];

        $slikaNaziv = $slika['name'];
        $slikaTip = $slika['type'];
        $slikaVelicina = $slika['size'];
        $slikaTmp = $slika['tmp_name'];

        if(empty($naziv)){
            $errors[] = "Mora biti unet neki sadržaj!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
        }
        else{
            $upit = "UPDATE slika SET naziv_slike = :naziv WHERE id_slika = :id";
            $izvrsenje = $konekcija->prepare($upit);
            $izvrsenje->bindParam(":naziv", $naziv);        
            $izvrsenje->bindParam(":id", $id);
            try{
                $rezultat = $izvrsenje->execute();
                if($rezultat){
                    $errors[] =  "Uspesno ste uneli izmenu!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_spaIndex");
                }
                else{
                    $errors[] = "Izmena nije unešena!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_spaIndex");
                }
            }
            catch(PDOException $e){
                $e->getMessage();
            }
        }       
        if(!empty($slika)){
            $dozvoljeniFormati = array("image/jpg", "image/jpeg", "image/gif", "image/pbg");
            if(!in_array($slikaTip, $dozvoljeniFormati)){
                $errors[] = "Nije dobar format slike!";
            }
            if($slikaVelicina > 2000000){
                $errors[] = "Slika mora da bude manja od 2MB!";
            }
            if(count($errors) == 0){
                $nazivFajla = time().$slikaNaziv;
                $novaPutanja = "../slike/".$nazivFajla;
                $novaPutanjaZaBazu = "slike/".$nazivFajla;
                if(move_uploaded_file($slikaTmp, $novaPutanja)){
                    $upit = "UPDATE slika SET putanja_slika = :slika, naziv_slike = :naziv WHERE id_slika = :id";
                    $izvrsenje = $konekcija->prepare($upit);
                    $izvrsenje->bindParam(":slika", $novaPutanjaZaBazu);
                    $izvrsenje->bindParam(":naziv", $naziv);        
                    $izvrsenje->bindParam(":id", $id);
                    try{
                        $rezultat = $izvrsenje->execute();
                        if($rezultat){
                            $errors[] = "Uspesno ste uneli izmenu!";
                            $_SESSION['obavestenje'] = "";
                            $_SESSION['obavestenje'] = $errors;
                            header("Location: ../index.php?page=admin_spaIndex");
                        }
                        else{
                            $errors[] = "Izmena nije unešena!";
                            $_SESSION['obavestenje'] = "";
                            $_SESSION['obavestenje'] = $errors;
                            header("Location: ../index.php?page=admin_spaIndex");
                        }
                    }                    
                    catch(PDOException $e){
                        $e->getMessage();
                    }
                }
            }
        }    
    }
?>