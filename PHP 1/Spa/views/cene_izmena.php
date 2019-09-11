<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">	
        <?php
        if (isset($_SESSION['obavestenje'])) {
            echo $_SESSION['obavestenje'];
        }
        unset($_SESSION['obavestenje']);
        ?>
        <h3>Izmena usluge</h3>
        <?php
        $id = $_GET['id'];
       
        var_dump($id);
        $upit = "SELECT * FROM cenovnik c INNER JOIN slika s ON c.slika_id = s.id_slika WHERE c.id_cenovnik = :id";
        $izvrsenje = $konekcija->prepare($upit);
        $izvrsenje->bindParam(":id", $id);
        $izvrsenje->execute();
        $rezultat = $izvrsenje->fetchAll();
        foreach($rezultat as $rez):
        ?>
        <form method="POST" action="php/cene_izmena.php" enctype="multipart/form-data">
            <table class="dodaj">
                <tr>
                    <td>Naslov</td>
                    <td><input type="text" name="tbNaslov" id="tbNaslov" value="<?= $rez->naslov ?>"/>
                </tr>
                <tr>
                    <td>Slika</td>
                    <td><input type="file" name="fSlika" id="fSlika" /><?= $rez->naziv_slike ?></td>
                </tr
                <tr>
                    <td>Cene</td>
                    <td><input type="text" name="tbCene" id="tbCene" value="<?= $rez->cena ?>"/></td>
                </tr>
                <tr>
                    <td>Tekst</td>
                    <td><textarea type="text" name="tbTekst" id="tbTekst"><?= $rez->tekst ?></textarea></td>
                </tr>
                <tr>
                   <!--<td>Cene</td>-->
                    <td><input type="hidden" id="hiddenId" name="hiddenId" value="<?= $rez->id_cenovnik ?>"/></td>
                </tr>
                <tr >
                    <td><input type="submit" name="btnCeneIzmena" id="btnCeneIzmena" value="Potvrdi"/></td>
                </tr>
            </table>     
            <?php endforeach; ?>
        </form

    </div>
</div>

