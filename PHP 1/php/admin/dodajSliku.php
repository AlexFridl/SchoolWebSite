<?php
session_start();
include "../konekcija.php";

if(isset($_POST['btnPotvrdi'])){
    $imeS = $_POST['tbImeS'];
    $slika = $_FILES['fSlika'];

    $slika_ime = $slika['name'];
    $slika_tip = $slika['type'];
    $slika_size =  $slika['size'];
    $slika_tmp = $slika['tmp_name'];


    $novoIme = time().$slika_ime;
    $novaPutanja = "../../images/".$novoIme;


    $greske = array();
    $dozvoljeni_formati = array("images/jpg","image/jpeg","images/png","images/gif");
   // $regSlika = "/^\S{2,}\.(gif|jpg|jpeg|png|JPG)$/";
    $regNaziv = "/^[\w\s]{2,25}$/";


    if ($slika != "") {
        if (!in_array($slika_tip,$dozvoljeni_formati)) {
            $greske[] = "Slika nije u dobrom formatu!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $greske;
            header("Location: ../../index.php?id=108");
       }
    }
    if (!preg_match($regNaziv, $imeS)) {
        $greske[] = "Morate uneti ispravno naziv slike!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $greske;
        header("Location: ../../index.php?id=108");
    }

    if (count($greske) != 0) {
        echo "<div>";
        foreach ($greske as $g) {
            echo "<i>" . $g . "</i><br/>";
        }
        echo "</div>";
    } else {

        if (move_uploaded_file($slika_tmp, $novaPutanja)) {

            $upit = "INSERT INTO galerija VALUES('', :naziv_slika, :putanja_slika)";
            $priprema = $konekcija->prepare($upit);
            $priprema->bindParam(":naziv_slika", $imeS);
            $priprema->bindParam(":putanja_slika", $novoIme);

            try{
                $rezultat = $priprema->execute();
                if($rezultat){
                    $greske[] =  "</br>Uspesno ste uneli sliku u galeriju";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $greske;
                    header("Location: ../../index.php?id=108");
                }
                else{
                    $greske[] =  "Niste uneli sliku u galeriju";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $greske;
                    header("Location: ../../index.php?id=108");
                }
            }
            catch(PDOException $ex){
                $ex->getMessage();
            }
        }

    }
}
?>