<div class="content">
    <!-- LOGOVANJE -->	
    <div id="logovanje">
        <h2 class="logNaslov">Uloguj se</h2>
        <?php
        if (isset($_POST['btnPrijava'])) {
            $korIme = trim($_POST['tbKorisnickoIme']);
            $lozinka = trim($_POST['tbLozinka']);

            $reKorIme = "/^[\w]{4,15}$/";
            $reLozinka = "/^[\S]{4,10}$/";
            $errors = [];

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

            //$podaci = "";
           if(empty($errors)):
                $lozinka = md5($lozinka);
                $upit = "SELECT * FROM korisnik k INNER JOIN uloga u ON k.uloga_id = u.id WHERE korisnicko_ime = :korIme AND lozinka = :lozinka";

                $izvrsenje = $konekcija->prepare($upit);
                $izvrsenje->bindParam(":korIme", $korIme);
                $izvrsenje->bindParam(":lozinka", $lozinka);
                try {
                    $izvrsenje->execute();
                    $korisnik = $izvrsenje->fetch();

                    if ($korisnik) {
                        $_SESSION['korisnik'] = $korisnik;

                        if ($_SESSION['korisnik']->naziv_uloga == 'admin') {
                            //echo "<script language='JavaScript'> window.location.href='index.php?id=102'</script>";
                            header("Location: index.php?id=102");
                        } elseif ($_SESSION['korisnik']->naziv_uloga == 'korisnik') {
                            //echo "<script language='JavaScript'> window.location='index.php?id=1'</script>";
                            header("Location: index.php?id=1");
                        }
                    } else {
                        echo "Niste se ulogovali!";
                        echo "<script language='JavaScript'> window.location='index.php?id=1'</script>";
                        //header("Location: ..index.php?id=1");
                    }
                } catch (PDOException $e) {
                    $e->getMessage();
                }
            endif;
        }
        ?>
        <form class="forma" method="POST" action="<?php $_SERVER['PHP_SELF'] ?>">
            <table>
                <tr>
                    <td>Korisničko ime: </td>
                </tr>
                <tr>
                    <td><input type="text" id="tbKorisnickoIme" name="tbKorisnickoIme" maxlength="20"/></td>
                </tr>
                <tr>
                    <td>Lozinka:</td>	
                </tr>
                <tr>
                    <td><input type="password" id="tbLozinka" name="tbLozinka" maxlength="20"/></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="btnPrijava"  value="Uloguj se"/>
                    </td>
                </tr>
            </table>
        </form>
        <?php if(isset($_SESSION['obavestenje'])){
        foreach ($_SESSION['obavestenje'] as $o):
            echo $o."</br>";
        endforeach;
    }
    unset($_SESSION['obavestenje']);

    ?>

        <div class="ispis">
            <!-- LOGOVANJE PHP-->	

        </div>
    </div>