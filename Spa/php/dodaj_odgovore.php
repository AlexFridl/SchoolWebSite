<?php
if(isset($_POST['btnDodajOdgovor'])){
    $odgovor = $_POST['tbOdgovor'];
    $idPitanje = $_POST['ddlDodajPitanje'];
    var_dump($idPitanje);
    $glas_odgovor = 0;
    $errors = [];

    $reOdgovor = "/^[\w\s\d]{2,20}$/";

    if(empty($idPitanje)){
        $errors[] = "Morate odabrati pitanje za koje unosite odgovore!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
        header("Location: ../index.php?page=admin_anketa");
    }
    else{
        if(empty($odgovor)){
            $errors[] = "Morate uneti neki sadržaj za odgovor!</br>";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
            header("Location: ../index.php?page=admin_anketa");
        }
        else{
            if(!preg_match($reOdgovor,$odgovor)){
                    $errors[]="Tekst nije odgovora OK!</br>";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_anketa");
            }   
        }
        if(count($errors) == 0){ 
            $unos =  "INSERT INTO odgovori VALUES ('', :ime_odgovor, :glas_odgovor, :pitanja_id)";
            $izvrsenje = $konekcija->prepare($unos);
            $izvrsenje->bindParam(":ime_odgovor", $odgovor);
            $izvrsenje->bindParam(":glas_odgovor", $glas_odgovor);
            $izvrsenje->bindParam(":pitanja_id", $idPitanje);        
            try{
                $rezultat = $izvrsenje->execute();     
               
                if($rezultat){
                    $errors[] = "Uspešno ste uneli odgovor!";
                    $_SESSION['obavestenje'] = "";               
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_anketa");
                }
                else{
                    $errors[] = "Nije uspeo unos!";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: ../index.php?page=admin_anketa");
                }   
            }   
            catch(PDOException $e){
                $e->getMessage();
            }
        }
    }    
}
?>