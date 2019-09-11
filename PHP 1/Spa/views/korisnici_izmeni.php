<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">	
        <h3>Izmena korisnika</h3>
        <?php
        if (isset($_SESSION['obavestenje'])) {
            foreach ($_SESSION['obavestenje'] as $e):
                echo $e . "<br>";
            endforeach;
        }
        unset($_SESSION['obavestenje']);
        
        $id = $_GET['id'];
        $upit = "SELECT * FROM korisnik k INNER JOIN uloga u ON k.uloga_id = u.id_uloga WHERE id_korisnik = :id";
        $izvrsenje = $konekcija->prepare($upit);
        $izvrsenje->bindParam(":id", $id);
        $izvrsenje->execute();
        $rezultat = $izvrsenje->fetch();
        if ($rezultat):
            ?> 
            <form method="POST" action="php/korisnici_izmeni.php">
                <table class="dodaj">
                    <tr>
                        <td>Ime</td>
                        <td><input type="text" name="tbIme" id="tbIme" value="<?= $rezultat->ime_korisnik ?>"/></td>
                    </tr>
                    <tr>
                        <td>Prezime</td>
                        <td><input type="text" name="tbPrezime" id="tbPrezime" value="<?= $rezultat->prezime_korisnik ?>"/></td>
                    </tr>
                    <tr>
                        <td>Korisničko ime</td>
                        <td><input type="text" name="tbKorIme" id="tbKorIme" value="<?= $rezultat->korisnicko_ime ?>"/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="tbEmail" id="tbEmail" value="<?= $rezultat->email ?>"/></td>
                    </tr>
                    <tr>
                        <td>Lozinka</td>
                        <td><input type="password" name="tbLoz" id="tbLoz" /></td>
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
                        <td><input type="hidden" id="hiddenId" name="hiddenId" value="<?= $rezultat->id_korisnik ?>"/></td>
                    </tr>
                    <tr >
                        <td><input type="submit" name="btnKorisnikIzmena" id="btnKorisnikIzmena" value="Izmeni"/></td>
                    </tr>
                </table>   
            </form>        
        <?php endif; ?>
    </div>
</div>