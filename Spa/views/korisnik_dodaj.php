<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">
      <!--REGISTRACIJA -->
        <div id="registracija">
            <h2 class="logNaslov">Registracija</h2>
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF'] . '?page=korisnik_dodaj' ?>">
                <table>
                    <tr>
                        <td>Ime:</td>
                        <td><input type="text" name="tbIme" id="tbIme"/></td>
                        <td id="ime"></td>
                    </tr>

                    <tr>
                        <td>Prezime:</td>
                        <td><input type="text" name="tbPrezime" id="tbPrezime"/></td>
                        <td id="prezime"></td>
                    </tr>
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td><input type="text" name="tbKorImeR" id="tbKorImeR"/></td>
                        <td id="KorIme"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="tbEmail" id="tbEmail"/></td>
                        <td id="email"></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><input type="password" name="lozinkaReg" id="lozinkaReg"</td>
                        <td id="lozinkaR"></td>
                    </tr>
                    <tr>
                        <td>Uloga</td>
                        <td>
                            <select name="ddlUloga">
                                <option value="0">Izaberi...</option>
                                <?php
                                $upitDdl = "SELECT * FROM uloga";
                                $rezultatDdl = $konekcija->query($upitDdl)->fetchAll();
                                foreach ($rezultatDdl as $r):
                                    if ($rezultat->uloga_id == $r->id_uloga):
                                        echo "<option value='" . $r->id_uloga . "'  selected='true' >" . $r->naziv_uloga . "</option>";
                                    else:
                                        echo "<option value='" . $r->id_uloga . "'>" . $r->naziv_uloga . "</option>";
                                    endif;

                                endforeach;
                                ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td collspan="2"></td>
                        <td>
                            <input type="submit" name="btnPotvrdi" id="btnPotvrdi" value="Potvrdi"/>
                        </td>
                    </tr>
                </table>
            </form></br>
            <div class="ispis">
                
                <!--REGISTRACIJA PHP-->
<?php
if (isset($_POST['btnPotvrdi'])) {
    $ime = $_POST['tbIme'];
    $prezime = $_POST['tbPrezime'];
    $korIme = $_POST['tbKorImeR'];
    $email = $_POST['tbEmail'];
    $lozinka = $_POST['lozinkaReg'];
    $id_uloga = $_POST['ddlUloga'];

    $reIme = "/^[A-Z][a-z]{2,15}$/";
    $rePrezime = "/^[A-Z][a-z]{2,20}$/";
    $reKorIme = "/^[\w\d]{6,15}$/";
    $reLozinka = "/^[\S]{6,10}$/";
    $errors = [];
    //ime
    if (empty($ime)) {
        $errors[] = "Polje za ime je obavezno!";
    } elseif (!preg_match($reIme, $ime)) {
        $errors[] = "Polje za ime mora pocinjati velikim slovom i imati najvise 15 karaktera!";
    }
    //prezime
    if (empty($prezime)) {
        $errors[] = "Polje za prezime je obavezno!";
    } elseif (!preg_match($rePrezime, $prezime)) {
        $errors[] = "Polje za prezime mora pocinjati velikim slovom i imati najvise 20 karaktera!";
    }
    //korisicko ime
    if (empty($korIme)) {
        $errors[] = "Polje za korisnicko ime je obavezno!";
    } elseif (!preg_match($reKorIme, $korIme)) {
        $errors[] = "Polje za korisnicko ime se sastoji od 6 do 15 karaktera!";
    }
    //email
    if (empty($email)) {
        $errors[] = "Polje za email je obavezno!";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "E-mail nije u ispravnom formatu.";
    }
    //lozinka
    if (empty($lozinka)) {
        $errors[] = "Polje za lozinku je obavezno.";
    } elseif (!preg_match($reLozinka, $lozinka)) {
        $errors[] = "Polje za lozinku mora sadrzati ukupno 6 do 10 karaktera!";
    }

    $podaci = "";
    if (!empty($errors)) {
        $podaci .= "<ol>";
        foreach ($errors as $error) {
            echo "<li> $error </li>";
        }
        $podaci .= "</ol>";
    } else {
        $lozinka = md5($_POST['lozinkaReg']);
        $upit = "INSERT INTO korisnik VALUES('', :ime, :prezime, :kor_Ime, :email, :lozinka, :uloga_id)";
        $izvrsenje = $konekcija->prepare($upit);
        $izvrsenje->bindParam(':ime', $ime);
        $izvrsenje->bindParam(':prezime', $prezime);
        $izvrsenje->bindParam(':kor_Ime', $korIme);
        $izvrsenje->bindParam(':email', $email);
        $izvrsenje->bindParam(':lozinka', $lozinka);
        $izvrsenje->bindParam(':uloga_id', $id_uloga);
        try {
            $rezultat = $izvrsenje->execute();

            if ($rezultat) {
                echo "Uspešno ste se registrovali, možete se ulogovati.";
                header("Location: index.php?page=admin_korisnici");
            } else {
                echo "Greška pri registraciji.";
                header("Location: index.php?page=admin_korisnici");
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
}
?>
            </div>
        </div>  
    </div>
            
</div>