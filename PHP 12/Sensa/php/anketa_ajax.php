<?php

    include "konekcija.php";
 
    $podatak = $_REQUEST['id'];
    $idP = $_REQUEST['idP'];
    $podaci="";
    $code = 404;


    $upit1 = "SELECT glas_odgovor FROM odgovori WHERE id_odgovor = :podatak";
    $izvrsenje1 = $konekcija->prepare($upit1);
    $izvrsenje1->bindParam(":podatak", $podatak);
    $rezultat1=0;
    try{
        $izvrsenje1->execute();
        $rezultat1 = $izvrsenje1->fetch();
    }
    catch(PDOException $e){
        $e->getMessage();
    }    

    $rezultat2 = $rezultat1->glas_odgovor+1;
    $upit2 = "UPDATE odgovori SET glas_odgovor = :rezultat2 WHERE id_odgovor = :podatak";
    $izvrsenje2 = $konekcija->prepare($upit2);    
    $izvrsenje2->bindParam(":rezultat2", $rezultat2);
    $izvrsenje2->bindParam(":podatak", $podatak);

    try{
        $izvrsenje2->execute();

       $upit3 = "SELECT * FROM odgovori WHERE pitanje_id = :idP";
        $izvrsenje3 = $konekcija->prepare($upit3);
        $izvrsenje3->bindParam(":idP", $idP);
       try{
            $izvrsenje3->execute();
            $rezultat3 = $izvrsenje3->fetchAll();
            //var_dump($rezultat3);
            $podaci .= "<div class='desno' style='border:3px solid #D6D6D6; margin-botom:5px; border-radius:5px;'>";
            $podaci .= "<h2 class='naslov'>Rezultati</h2>";	
            $podaci .= "<table class='anketa'>";
            $podaci .= "<tr>";
            $podaci .= "<th>Glasovi:</th>";
            $podaci .= "</tr>";
            $podaci .= "<tr>";
            foreach($rezultat3 as $rez3):               
                $podaci .= "<td>Ocena ".$rez3->id_odgovor.": ".$rez3->glas_odgovor."</td>";
            endforeach;
            $podaci .= "</tr>";
            $podaci .= "</table>";
            $podaci .= "</div>";
             $code = 201;
        }
        catch(PDOException $e){
            $e->getMessage();
               $code = 500;
        }
    }
    catch(PDOException $e){
        $e->getMessage();
           $code = 500;
    }
        http_response_code($code);
echo json_encode($podaci); 

