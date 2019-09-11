<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">	

        <?php
        $upit = "SELECT * FROM slika ";
        $izvrsenje = $konekcija->query($upit);
        $rezultat = $izvrsenje->fetchAll();
        ?>      
        <div class="spaIndex">   
            <?php
            if (isset($_SESSION['obavestenje'])) {
                foreach ($_SESSION['obavestenje'] as $e):
                    echo $e . "<br>";
                endforeach;
            }
            unset($_SESSION['obavestenje']);
            ?>
            <a class="link" href="index.php?page=spaIndex_dodaj">Dodaj</a>          
            <table style="border:3px solid #630C6F; border-radius:5px; margin-left:350px;">
                <tr> 
                    <th>Naziv</th>               
                    <th>Slika</th>
                    <td></td>
                </tr>   
                <?php
                foreach ($rezultat as $rez):
                    ?>
                    <tr>
                        <td><?= $rez->naziv_slike ?></td>       
                        <td><img src="<?= $rez->putanja_slika ?>" width="55px" height="55px" alt="<?= $rez->naziv_slike ?>"/></td>
                        <td><a href="index.php?page=spaIndex_izmeni&id=<?= $rez->id_slika ?>">Izmeni</a></td>
                        <td><a href="php/spaIndex_obrisi.php?id=<?= $rez->id_slika ?>">Obriši</a></td>
                    </tr>
                <?php endforeach; ?>
            </table>

        </div>
    </div>
</div>