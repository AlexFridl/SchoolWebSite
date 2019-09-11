<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">	
        <?php
        if (isset($_SESSION['obavestenje'])) {
            foreach ($_SESSION['obavestenje'] as $e):
                echo $e . "<br>";
            endforeach;
        }
        unset($_SESSION['obavestenje']);
        ?>
        <h3 id="oNama"></h3>
        <p>Spa centar otvoren je u martu mesecu 2017.godine. Kako smo novootvoreni centar masaže,  u centru trenutno radi samo jedan masažer. Trudimo se da svojim uslugama doprinosimo potpunijem užitku Vaše svakodnevnice. </p>
        <p>Iako se termini mogu zakazati putem interneta, termin se može otkazati isključivo putem telefona. </p></br></br></br>

        <h3>Zakaži</h3>
        <?php //echo $_SESSION['obavestenje'];?>
        <form method="POST" action="php/zakazi.php">
            <table class="section">
                <tr>
                    <td>
                        <label for="name"> <span>Ime i prezime</span>
                            <input type="text" id="tbImePrezime" name="tbImePrezime" required="true"/>
                        </label>
                    </td>
                    <td class="even">

                        <label for="service"> <span>Tip usluge</span>
                            <select id="ddlTipUsluga" name="ddlTipUsluga" required="true">
                                <option value="0">Izaberite...</option>
                                <?php
                                $upit = "SELECT * FROM tip_usluge";
                                $izvrsenje = $konekcija->query($upit);
                                $rezultat = $izvrsenje->fetchAll();

                                /* $rezultat = query("SELECT * FROM tip_usluge")->fetchAll(); */
                                foreach ($rezultat as $rez):
                                    ?>
                                    <option value=<?= $rez->id_usluga ?>><?= $rez->naziv_usluge ?></option>
                                <?php endforeach; ?>
                            </select>

                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="email" required="true"> <span>Email </span></br>
                            <input type="text" id="email" name="email"/>
                        </label>
                    </td>
                    <td class="even">
                        <label for="datetime"> <span>Termini</span>
                            <select id="ddlTermin" name="ddlTermin" required="true">
                                <option value="0">Izaberite...</option>
                                <?php
//							$upit = "SELECT * FROM odabrani_termin";
//							$izvrsenje = $konekcija ->query($upit);
//							$rezultat = $izvrsenje->fetchAll();
//							foreach($rezultat as $rez):
                                ?>
                                <!--<option value=<?= $rez->id_odabrani ?>><?= $rez->naziv_termin ?></option>-->
                                <?php
//							endforeach;
                                ?>							
                            </select>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td><input type="hidden" id="hbTermin" name="hbTermin" required="true"/></td>
                </tr>
                <tr>
                    <td>
                        <label for="date"> <span>Datum</span>
                            <input type="date" id="btnDatum" name="btnDatum" required="true"/>
                        </label>
                    </td>		
                    <td class="even">
                        <label for="name">
                            <input type="submit" id="btnZakazi" name="btnZakazi" value="Zakaži" min="50px"/>
                        </label>
                    </td>						
                </tr>
                <tr>
                    <td>
                        <label for="phone"> <span>Broj telefona</span>
                            <input type="text" id="tbBrTel" name="tbBrTel" required="true"/>
                        </label>
                    </td>
                </tr>
                
            </table>
        </form>
        <?php
        if (isset($_SESSION['greske'])):
            /* 		var_dump($_SESSION['greske']); */
            unset($_SESSION['greske']);
        endif;

        if (isset($_SESSION['porukaZ'])):
            /* 	var_dump($_SESSION['porukaZ']); */
            unset($_SESSION['porukaZ']);
        endif;
        ?>
    </div>
</div>