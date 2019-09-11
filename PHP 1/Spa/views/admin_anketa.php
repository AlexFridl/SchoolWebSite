<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">	
        <?php
        $upit = "SELECT * FROM pitanja";
        $izvrsenje = $konekcija->query($upit);
        $rezultat = $izvrsenje->fetchAll();
        ?>
        <h3>Anketa</h3>          
        <div id="ispis">
            <?php
            if (isset($_SESSION['obavestenje'])) {
                echo @$_SESSION['obavestenje'];
            }
            unset($_SESSION['obavestenje']);
            ?>
        </div>
        <div id="ispisR">
        </div>

        <div class="anketaAdmin">  
            <form method="POST" action="php/dodaj_pitanje.php">
                <table style="border:3px solid #630C6F; border-radius:5px;">
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
                                    <input type="radio" name="rbbPitanja" id="rbbPitanja" value="<?= $rez->id_pitanja ?>" <?= $rez->aktivno_pitanje == 1 ? 'checked = "true"' : '' ?>/></td>
                                <td>
                                    <a href="php/izmena_statusa_pitanja.php?id==//$rez->id_pitanja">Izmeni</a>

                                </td> 
                                <td>
                                    <a href="php/anketa_obrisi.php?id=<?= $rez->id_pitanja ?>">Obriši</a>
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
</div>