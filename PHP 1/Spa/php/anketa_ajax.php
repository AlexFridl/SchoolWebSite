<?php
    include "konekcija.php";
 
    $podatak = $_REQUEST['id'];
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

       $upit3 = "SELECT * FROM odgovori";
       try{
            $izvrsenje3 = $konekcija->query($upit3);
            $rezultat3 = $izvrsenje3->fetchAll();
            //var_dump($rezultat3);
            $podaci .= "<div class='desno' style='border:1px solid #630C6F; border-radius:5px;'>";
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

