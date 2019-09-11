<?php
if (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin') :
?>
<div class="services">
    <div class="naslov">
        Administriranje ankete
    </div>
    <div class="ispis">
        <?php
        $upit = "SELECT * FROM pitanja";
        $izvrsenje = $konekcija->query($upit);
        $rezultat = $izvrsenje->fetchAll();
        ?>

        <div class="anketaAdmin">
            <form method="POST" action="php/admin/dodajPitanje.php">
                <table style="border: 3px solid #7d7d7d;border-radius: 5px;	margin-left: 100px;	padding: 25px;">
                    <tr>
                        <th>Dodaj pitanje</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="tbPitanje" name="tbPitanje"/>
                        </td>
                        <td>
                            <input type="submit" name="btnDodajPitanje" id="btnDodajPitanje" value="Dodaj pitanje"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Pitanje</th>
                        <th>Aktivno pitanje</th>
                    </tr>

                    <?php
                    foreach ($rezultat as $rez):
                        ?>      <tr>
                        <td ><?= $rez->naziv_pitanja ?></td>
                        <td align="center">
                            <input type="radio" name="rbbPitanja" id="rbbPitanja" data-id="<?= $rez->id_pitanja ?>" value="<?= $rez->id_pitanja ?>" <?= $rez->aktivno_pitanje == 1 ? 'checked = "true"' : '' ?>/></td>
          <!--              <td>
                            <a href="php/admin/izmenaStatusaPitanja.php?id=<?/*=$rez->id_pitanja*/?>" style="color:#7d7d7d">Izmeni</a>

                        </td>-->
                        <td>
                            <a href="" class="brisi3" data-id="<?= $rez->id_pitanja ?>" style="color:#7d7d7d">Obriši</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>

                    <tr>
                        <td>
                            <select name="ddlDodajPitanje" id="ddlDodajPitanje">
                                <option value="0">Odaberi pitanje</option>
                                <?php foreach ($rezultat as $rez): ?>
                                    <option value="<?= $rez->id_pitanja ?>"><?= $rez->naziv_pitanja ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                    </tr>
                    <tr>

                        <th>Dodaj odgovore</th>
                    </tr>

                    <tr>
                        <td>
                            <input type="text" name="tbOdgovor" id="tbOdgovor" placeholder="Odgovor"/>
                        </td>
                        <td>
                            <input type="submit" name="btnDodajOdgovor" id="btnDodajOdgovor" value="Dodaj odgovor"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div id="ispis">
        <?php
        if (isset($_SESSION['obavestenje'])) {
           foreach ($_SESSION['obavestenje'] as $o):
            echo $o;
           endforeach;
        }
        unset($_SESSION['obavestenje']);
        ?>
    </div>
<?php
endif;
?>
