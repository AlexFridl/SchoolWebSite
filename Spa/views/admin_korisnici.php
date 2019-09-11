
<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">	<!-- div class='content' se razlikuje od strane do strane-->
        <h3>Korisnici</h3>
        <?php
        if (isset($_SESSION['obavestenje'])) {
            foreach ($_SESSION['obavestenje'] as $e):
                echo $e . "<br>";
            endforeach;
        }
        unset($_SESSION['obavestenje']);
        
        $upit = "SELECT k.*, u.* FROM korisnik k INNER JOIN uloga u ON k.uloga_id = u.id_uloga";
        $izvrsenje = $konekcija->query($upit);
        $rezultat = $izvrsenje->fetchAll();
        ?>

        <div class="ispisKorisnici">   
            <a class="link" href="index.php?page=korisnik_dodaj">Dodaj</a>      
            <table style="border:3px solid #630C6F; border-radius:5px; margin:0px auto;">
                <tr> 
                    <th>Ime</th>               
                    <th>Prezime</th>
                    <th>Korisničko ime</th>               
                    <th>Email</th>
                    <th>Lozinka</th>               
                    <th>Uloga</th>
                    <td></td>
                </tr>   
                <?php
                foreach ($rezultat as $rez):
                    ?>
                    <tr>
                        <td><?= $rez->ime_korisnik ?></td> 
                        <td><?= $rez->prezime_korisnik ?></td>     
                        <td><?= $rez->korisnicko_ime ?></td>   
                        <td><?= $rez->email ?></td>
                        <td><?= $rez->naziv_uloga ?></td>
                        <td><a href="index.php?page=korisnici_izmeni&id=<?= $rez->id_korisnik ?>">Izmeni</a></td>
                        <td><a href="php/korisnici_obrisi.php?id=<?= $rez->id_korisnik ?>">Obriši</a></td>
                    </tr>
                <?php endforeach; ?>
            </table>

        </div>

    </div>
</div>