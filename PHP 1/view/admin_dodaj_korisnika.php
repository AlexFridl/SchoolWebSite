<?php
if (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin') :
?>

<div class="services">

    <div class="naslov">
        Dodavanje novog korisnika
    </div>
    <form action='php/admin/dodajKorisnika.php' accept-charset='utf=8' method='POST' enctype='multipart/form-data' >
        <table style='margin: 0px auto; margin-top: 20px'>
            <tr>
                <td>Ime:</td>
                <td><input type="text" name="tbIme" id="tbImeR" required/></td>
                <td id="ime"></td>
            </tr>

            <tr>
                <td>Prezime:</td>
                <td><input type="text" name="tbPrezime" id="tbPrezimeR" required /></td>
                <td id="prezime"></td>
            </tr>
            <tr>
                <td>Korisnicko ime:</td>
                <td>  <input type='text'name='tbKorisnickoIme' size='20' required/></td>
                <td id="KorIme"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="tbEmail" id="tbEmailR" required /></td>
                <td id="email"></td>
            </tr>
            <tr>
                <td>Lozinka:</td>
                <td><input type="password" name="lozinka" id="lozinkaReg" required /></td>
                <td id="lozinkaR"></td>
            </tr>
            <tr>
                <td>Odaberi ulogu:</td>
                <td>
                    <select name="uloga">
                        <option value="0">Izaberi</option>
                        <?php
                        $upit = "SELECT * FROM uloga";
                        $rezultat = $konekcija->query($upit);
                        if ($rezultat):
                            foreach ($rezultat as $rez):
                                ?>
                                <option value="<?php echo $rez->id ?>"><?= $rez->naziv_uloga ?></option>
                        <?php
                            endforeach;
                        endif;
                        ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td collspan="2"></td>
                <td>
                    <input type="submit" name="btnPotvrdi" id="btnPotvrdi" value="Dodaj"/>		<!-- onClick()="proveraRegistracije();" -->
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
    endif;
    ?>


</div>
