<div class="logovanje">
    <?php
    if (isset($_POST['btnPotvrdi'])) {
        //echo "Pozdrav";
        $ime = trim($_POST['tbImeR']);
        $prezime = trim($_POST['tbPrezimeR']);
        $korIme = trim($_POST['tbKorImeR']);
        $email = trim($_POST['tbEmailR']);
        $lozinka = md5(trim($_POST['lozinkaReg']));

        $reIme = "/^[A-ZŽĆČĐŠ][a-zžćčđš]{2,15}$/";
        $rePrezime = "/^[A-ZŽĆČĐŠ][a-zžćčđš]{2,20}$/";
        $reKorIme = "/^\w{4,15}$/";
        $reLozinka = "/^[\S]{4,10}$/";
        $errors = [];

        //ime
        if(!empty($ime)):
            if(!preg_match($reIme, $ime)):
                $errors[] = "Polje za ime mora pocinjati velikim slovom i imati najvise 15 karaktera!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
            endif;
        else:
            $errors[] = "Polje za ime je obavezno!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
        endif;

        //prezime
        if(!empty($prezime)):
            if(!preg_match($rePrezime, $prezime)):
                $errors[] = "Polje za prezime mora pocinjati velikim slovom i imati najvise 20 karaktera!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
            endif;
        else:
            $errors[] = "Polje za prezime je obavezno!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
        endif;

        //korisicko ime
        if(!empty($korIme)):
            if(!preg_match($reKorIme, $korIme)):
                $errors[] = "Polje za korisnicko ime se sastoji od 4 do 15 karaktera!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
            endif;
        else:
            $errors[] = "Polje za korisnicko ime je obavezno!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
        endif;

        //email
        if(!empty($email)):
            if(!filter_var($email, FILTER_VALIDATE_EMAIL)):
                $errors[] = "E-mail nije u ispravnom formatu.";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
            endif;
        else:
            $errors[] = "Polje za email je obavezno!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
        endif;

        //lozinka
        if(!empty($lozinka)):
            if(!preg_match($reLozinka, $lozinka)):
                $errors[] = "Polje za lozinku mora sadrzati ukupno 4 do 10 karaktera!";
                $_SESSION['obavestenje'] = "";
                $_SESSION['obavestenje'] = $errors;
            endif;
        else:
            $errors[] = "Polje za lozinku je obavezno!";
            $_SESSION['obavestenje'] = "";
            $_SESSION['obavestenje'] = $errors;
        endif;

        /*$podaci = "";
        if (!empty($errors)) {
            $podaci .= "<ol>";
            foreach ($errors as $error) {
                echo "<li> $error </li>";
            }
            $podaci .= "</ol>";
        }*/
        //else {
        if(empty($errors)):
            /*foreach ($errors as $i) {
                echo $i;
            }
        else:*/
            $lozinka = md5($_POST['lozinkaReg']);
            $uloga_id = 2;
            $upit = "INSERT INTO korisnik VALUES('', :ime_korisnik, :prezime_korisnik, :korisnicko_ime, :email, :lozinka, :uloga_id)";
            $izvrsenje = $konekcija->prepare($upit);
            $izvrsenje->bindParam(':ime_korisnik', $ime);
            $izvrsenje->bindParam(':prezime_korisnik', $prezime);
            $izvrsenje->bindParam(':korisnicko_ime', $korIme);
            $izvrsenje->bindParam(':email', $email);
            $izvrsenje->bindParam(':lozinka', $lozinka);
            $izvrsenje->bindParam(':uloga_id', $uloga_id);
            try {
                $rezultat = $izvrsenje->execute();

                if ($rezultat) {
                    $errors[] = "Uspešno ste se registrovali, možete se ulogovati.";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    echo "<script language='JavaScript'> window.location='index.php?id=98'</script>";
                } else {
                    $errors[] = "Greška pri registraciji.";
                    $_SESSION['obavestenje'] = "";
                    $_SESSION['obavestenje'] = $errors;
                    header("Location: index.php?id=99");
                }
            } catch (PDOException $e) {
                echo $e->getMessage();
            }
            endif;
        //}
    }
    ?>
        <!--REGISTRACIJA -->
        <div id="registracija">
            <h2 class="logNaslov">Registracija</h2>
            <form class="forma" method="POST" action="<?php $_SERVER['PHP_SELF'] ?>">
                <table>
                    <tr>
                        <td>Ime:</td>
                        <td><input type="text" name="tbImeR" id="tbImeR"/></td>
                        <td id="ime"></td>
                    </tr>

                    <tr>
                        <td>Prezime:</td>
                        <td><input type="text" name="tbPrezimeR" id="tbPrezimeR"/></td>
                        <td id="prezime"></td>
                    </tr>
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td><input type="text" name="tbKorImeR" id="tbKorImeR"/></td>
                        <td id="KorIme"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="tbEmailR" id="tbEmailR"/></td>
                        <td id="email"></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><input type="password" name="lozinkaReg" id="lozinkaReg"</td>
                        <td id="lozinkaR"></td>
                    </tr>
                    <tr>
                        <td collspan="2"></td>
                        <td>
                            <input type="submit" name="btnPotvrdi" id="btnPotvrdi" value="Potvrdi"/>		<!-- onClick()="proveraRegistracije();" -->
                        </td>
                    </tr>
                </table>
            </form></br>
            <?php if(isset($_SESSION['obavestenje'])){
        foreach ($_SESSION['obavestenje'] as $o):
            echo $o."</br>";
        endforeach;
    }
    unset($_SESSION['obavestenje']);

    ?>
            <div class="ispis">

                <!--REGISTRACIJA PHP-->

            </div>
        </div>
    </div>
</div>
