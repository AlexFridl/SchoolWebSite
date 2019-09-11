<?php
if (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin') :

$id = $_GET['id_korisnik'];
$upit = "SELECT * FROM korisnik WHERE id_korisnik = :id";
$priprema = $konekcija->prepare($upit);
$priprema->bindParam(":id", $id);
try {
    $priprema->execute();
    $rezultat = $priprema->fetch();
    //var_dump($rezultat);
    if ($rezultat) :

        ?>
        <div class="services">
            <form action="php/admin/izmeniKorisnika.php?id=106&id_korisnik=<?php echo $id ?>" accept-charset="utf=8" method="POST" >
                <table style='margin: 0px auto; margin-top: 20px'>
                    <tr>
                        <td>Ime:</td>
                        <td><input type="text" name="tbImeK" id="tbImek" value="<?php echo $rezultat->ime_korisnik ?>" required/></td>
                        <td id="ime"></td>
                    </tr>

                    <tr>
                        <td>Prezime:</td>
                        <td><input type="text" name="tbPrezimeK" id="tbPrezimeK" value="<?php echo $rezultat->prezime_korisnik ?>"required/></td>
                        <td id="prezime"></td>
                    </tr>
                    <tr>
                        <td>Korisnicko ime:</td>
                        <td>  <input type="text" name="tbKorisnickoIme" size="20" value="<?php echo $rezultat->korisnicko_ime ?>"required/></td>
                        <td id="KorIme"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="tbEmailK" id="tbEmailK" value="<?php echo $rezultat->email ?>"required/></td>
                        <td id="email"></td>
                    </tr>
                    <tr>
                        <td>Lozinka:</td>
                        <td><input type="password" name="lozinkaK" id="lozinkaK" value=""required</td>
                        <td id="lozinkaR"></td>
                    </tr>
                    <tr>
                        <td>Odaberi ulogu:</td>
                        <td>
                            <select name="uloga">
                                <option value="0">Izaberi</option>
                                <?php
                                $upit = "SELECT * FROM uloga";
                                $rezultat2 = $konekcija->query($upit);
                                if ($rezultat2):
                                    foreach ($rezultat2 as $rez):
                                        ?>
                                        <?php if($rezultat->uloga_id == $rez->id):?>
                                        <option value="<?php echo $rez->id ?>" selected="true"><?= $rez->naziv_uloga ?> </option>
                                        <?php else:?>
                                        <option value="<?php echo $rez->id ?>"><?= $rez->naziv_uloga ?></option>
                                        <?php endif;?>

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
                            <input type="submit" name="btnPotvrdi" id="btnPotvrdi" value="Izmeni"/>		
                        </td>
                    </tr>    
                </table>
            </form>
    <?php
        endif;
    } catch (Exception $ex) {
        $ex->getMessage();
    }
            if(isset($_SESSION['obavestenje'])){
                foreach ($_SESSION['obavestenje'] as $o):
                    echo $o."</br>";
                endforeach;
            }
            unset($_SESSION['obavestenje']);
            endif;
            ?>
</div>