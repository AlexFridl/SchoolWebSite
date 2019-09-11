<body>
    <div id="page">
        <div id="header">
            <ul class="section">
                <li><a class="home" href="index.php?page=spaIndex">&nbsp;</a></li>
            </ul>
            <ul class="navigation">
                <!--posetioc-->
                <?php
                if (!isset($_SESSION['korisnik'])):
                    $upit = "SELECT * FROM meni WHERE posetioc_meni=1";
                    $upit = $konekcija->query($upit);
                    $rezultat = $upit->fetchAll();
                    foreach ($rezultat as $rez):
                        if ($rez->link == "cene"):
                            ?>
                            <li><a href="index.php?page=<?= $rez->link ?>&id=1"><?= $rez->naziv_meni ?></a></li>
                            <?php
                        else:
                            ?>
                            <li><a href="index.php?page=<?= $rez->link ?>"><?= $rez->naziv_meni ?></a></li>
                        <?php
                        endif;
                    endforeach;
                    ?>

                    <li><a href="index.php?page=logovanje">Logovanje</a></li>
                    <li><a href="doc/DokumentacijaSpa.pdf">Dokumentacija</a></li>
                    <!--admin-->
                    <?php
                elseif ($_SESSION['korisnik']->naziv_uloga == 'admin'):
                    $upit1 = "SELECT naziv_meni, link FROM meni WHERE admin_meni=1";
                    $upit1 = $konekcija->query($upit1);
                    $rezultat = $upit1->fetchAll();
                    foreach ($rezultat as $rez):
                        ?>
                        <li><a href="index.php?page=<?= $rez->link ?>"><?= $rez->naziv_meni ?></a></li>
                    <?php endforeach; ?>						
                    <li><a href="php/logout.php">Odjava</a></li>
                    <li><a href="doc/DokumentacijaSpa.pdf">Dokumentacija</a></li>

                    <!--korisnik -->
                    <?php
                elseif ($_SESSION['korisnik']->naziv_uloga == 'korisnik'):
                    $upit1 = "SELECT naziv_meni, link FROM meni WHERE korisnik_meni=1";
                    $upit1 = $konekcija->query($upit1);
                    $rezultat = $upit1->fetchAll();
                    foreach ($rezultat as $rez):
                        ?>
                        <li><a href="index.php?page=<?= $rez->link ?>"><?= $rez->naziv_meni ?></a></li>
                    <?php endforeach; ?>						
                    <li><a href="php/logout.php">Odjava</a></li>
                    <li><a href="doc/DokumentacijaSpa.pdf">Dokumentacija</a></li>
                <?php endif; ?>

            </ul>
        </div>