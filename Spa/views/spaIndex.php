<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div id="content">	<!-- div class='content' se razlikuje od strane do strane-->
        <h3>Usluge</h3>
        <script type="text/javascript">
            $(document).ready(function () {
                
            }
        </script>
        <ul class="section">
            <?php
            $upit = "SELECT s.*, c.naslov FROM slika s INNER JOIN cenovnik c ON s.id_slika = c.slika_id";
            $izvrsenje = $konekcija->query($upit);
            $rezultat = $izvrsenje->fetchAll();

            foreach ($rezultat as $rez):
                ?>
                <li>
                    <div class="slika">
                        <a href="<?= $rez->putanja_slika ?>">
                            <img src="<?= $rez->putanja_slika ?>" width="96" height="96" alt="<?= $rez->naslov ?>" title="<?= $rez->naslov ?>">
                        </a>
                    </div>
                    <h2>
                        <a href="index.php?page=zakazi"></a><?= $rez->naslov ?>
                    </h2>
                </li>

            <?php endforeach; ?>
        </ul>
        <ul class="navigation">
            <li><a href="index.php?page=logovanje">Uloguj se</a></li>
        </ul>
    </div>

</div>
