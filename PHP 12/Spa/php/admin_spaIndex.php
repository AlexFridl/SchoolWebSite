<?php
session_start();
include "konekcija.php";
/* include "funkcije.php"; */
/* 
if($_GET['insert']){

   /*  $alt=$_POST['tbAlt']; 
        $slika=$_FILES['fSlika'];

        $ime_slike=$slika['name'];
        $tip_slike=$slika['type'];
        $velicina_slike=$slika['size'];
        $tmp_putanja=$slika['tmp_name'];

        $errors=[];
        $reAlt="/^[\w\s]{1,255}$/";

        if(!preg_match($reAlt,$alt)){
            $errors[]="Opis slike nije po pravilima";
        }
        $dozvoljeni_tip=array("images/jpg","image/jpeg","images/png");

        if(!in_array($tip_slike,$dozvoljeni_tip)){
            $errors[]="Tip slike moža biti neki od sledećih formata .jpg, .jpeg ili .png";
        }
        if($velicina_slike>4000000){
            $errors[]="Slika mora biti do 4MB";
        }
        if(count($errors)==0){
            $naziv_slike=time().$ime_slike;
            $nova_putanja="slike/velika".$naziv_slike;
        }
        if(move_uploaded_file($tmp_putanja,$nova_putanja)){
            $putanja_mala="slike/mala".$naziv_slike;

            malaslika($nova_putanja,$putanja_mala,233,138);
            $unos_slika="INSERT into galerija VALUES('',:alt,:putanja_mala,:putanja_velika)";
            $priprema=$conn->prepare($unos_slika);
            $priprema->bindParam(":alt",$alt);
            $priprema->bindParam(":putanja_mala",$putanja_mala);
            $priprema->bindParam(":putanja_velika",$nova_putanja);
       
        try{
            $rezultat_slika=$priprema->execute();
           if($rezultat_slika){
               echo"Uneli ste sliku u galeriju";
               header("Location:admin_panel.php?page=galerija");
           }
          
        } catch(PDOException $e){
               echo $e->getMessage();
        }
    }
    else{
        echo "Nije uspeo upload slike";
    }
}
}

 */


?>