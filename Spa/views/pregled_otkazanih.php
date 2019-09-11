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
        <h3>Pregled otkazanih termina</h3>    
        <?php
        $upit = "SELECT * FROM zakazani_termini z INNER JOIN tip_usluge u ON z.usluga_id = u.id_usluga INNER JOIN odabrani_termin o ON z.odabrani_id = o.id_odabrani INNER JOIN status_termin s ON z.status_termina_id = s.id_status WHERE z.status_termina_id = 2";
        $izvrsenje = $konekcija->query($upit);
        $rezultat = $izvrsenje->fetchAll();
        ?>
        <div class="ispisTermina">
            <!-- <a class="linkP" href="index.php?page=pregled_dodaj">Dodaj</a>     -->     
            <form method="POST" action="php/pregled.php">
                <table style="border:3px solid #630C6F; border-radius:5px; margin:0px auto;">
                    <tr> 
                        <th>Ime</th>
                        <th>Prezime</th>
                        <th>Email</th>
                        <th>Datum</th>
                        <th>Broj telefona</th>
                        <th>Usluga</th>
                        <th>Termin</th>
                        <th>Status</th>                
                    </tr>   


                    <?php
                    foreach ($rezultat as $rez):
                        ?>
                        <tr>
                            <td ><?= $rez->ime ?></td>
                            <td ><?= $rez->prezime ?></td>
                            <td ><?= $rez->email ?></td>
                            <td ><?= $rez->datum_termina ?></td>
                            <td ><?= $rez->br_tel ?></td>
                            <td><?= $rez->naziv_usluge ?></td>
                            <td><?= $rez->naziv_termin ?></td>
                            <td><?= $rez->naziv_status ?></td>

                            <td><a href="php/zakazani_obrisi.php?id=<?= $rez->id_termin ?>">Obriši</a></td>
                        </tr>
<?php endforeach; ?>

                </table>	
            </form>	
        </div>
    </div>
</div>
