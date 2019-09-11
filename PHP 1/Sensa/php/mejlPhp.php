<?php
if(isset($_POST['btnPosalji'])){

    $imePrezime = $_POST['tbImePrezime'];
    $email = $_POST['tbEmail'];
    $poruka = $_POST['tbPoruka'];

    $reImePrezime = "/^[A-Z][a-z]{3,12}(\s[A-Z][a-z]{3,20})+$/";
    $rePoruka = "/^[^=]$/";
   // $rePoruka = "/^[\w\s\d\.\:\;\,\"\']$/";

    $errors = [];

    if(!preg_match($reImePrezime,$imePrezime))
    {
        $errors[] = "Ime i prezime nisu Ok!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    if(!preg_match($rePoruka,$poruka))
    {
        $errors[] = "Poruka nije dobrog formata!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    if(!filter_var($email, FILTER_VALIDATE_EMAIL))
    {
        $errors[] = "Email nije dobrog formata!";
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    if(count($errors) > 0)
    {
        $_SESSION['errors'] = $errors;
        $_SESSION['obavestenje'] = "";
        $_SESSION['obavestenje'] = $errors;
    }
    else
    {
        $upit = "INSERT INTO kontakt VALUES('', :imePrezime, :email, :poruka)";

        $prepare = $konekcija->prepare($upit);

        $prepare->bindParam(':imePrezime',$imePrezime);
        $prepare->bindParam(':email',$email);
        $prepare->bindParam(':poruka',$poruka);

        $prepare->execute();

        $headers = "FROM: $email";
        mail("aleksandra.fridl.311.14@ict.edu.rs",$imePrezime,$poruka,$headers);
    }
}
?>
