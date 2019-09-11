<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">
        <!-- LOGOVANJE -->	
        <div id="logovanje">
            <h2 class="logNaslov">Uloguj se</h2>
            <form method="POST" action="<?php print $_SERVER['PHP_SELF'] . '?page=logovanje' ?>">
                <table>
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td><input type="text" name="tbKorImeL" id="tbKorImeL"/></td>
                        <td id="KorImeLog"></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><input type="password" name="lozinkaLog" id="lozinkaLog"</td>
                        <td id="lozinkaL"></td>
                    </tr>
                    <tr>
                        <td collspan="2"></td>
                        <td>
                            <input type="submit" name="btnUlogujSe" id="btnUlogujSe" value="Uloguj se"/>
                        </td>
                    </tr>
                </table>
            </form></br>
            <div class="ispis">
                <!-- LOGOVANJE PHP-->	
                <?php
                if (isset($_POST['btnUlogujSe'])) {
                    $korIme = trim($_POST['tbKorImeL']);
                    $lozinka = trim($_POST['lozinkaLog']);

                    $upit = "SELECT k.*, u.naziv_uloga FROM korisnik k INNER JOIN uloga u ON k.uloga_id = u.id_uloga WHERE korisnicko_ime = :korIme AND lozinka = :lozinka";

                    $izvrsenje = $konekcija->prepare($upit);
                    $izvrsenje->bindParam(":korIme", $korIme);
                    $izvrsenje->bindParam(":lozinka", $lozinka);
                    try {
                        $izvrsenje->execute();
                        $korisnik = $izvrsenje->fetch();
                        if ($korisnik) {
                            $_SESSION['korisnik'] = $korisnik;

                            if ($_SESSION['korisnik']->naziv_uloga == 'admin') {
                                header("Location: ../index.php?page=admin_spaIndex");
                            } else {
                                header("Location: ../index.php?page=zakazi");
                            }
                        } else {
                            echo "Niste se ulogovali!";
                        }
                    } catch (PDOException $e) {
                        $e->getMessage();
                    }
                }
                ?>			
            </div>
        </div>
  
    </div>
</div>
