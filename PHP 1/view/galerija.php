
<!--0VDE IDE GALERIJA-->
<div class="portfolio">
    <?php
       if(isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin'):
    ?>
    <div class="dodaj">
    <a href="index.php?id=108">Dodaj sliku u Galeriju</a>
</div>
    <?php
       else:
    ?>
           <h2>GALERIJA</h2>
    <?php
       endif;
    ?>
    <div class="galerija">
        <div class="ispis">
        <?php
        //include "php/konekcija.php";
        $per_page = 4;
        if(isset($_GET['idG'])):
                $skriveno = ($_GET['idG'] * $per_page)-$per_page;
        else:
            $skriveno = 0;
        endif;
        $upit = "SELECT * FROM galerija LIMIT ". $per_page ." OFFSET ".$skriveno;
        $rezultat = $konekcija->query($upit)->fetchAll();
        if ($rezultat) {
            foreach ($rezultat as $rez):
                echo "<div class='gslika'>";
                echo "<a href='images/" . $rez->putanja_slika . "' data-lightbox='galerija' data-title='" . $rez->naziv_slika . "'>";
                echo "<img src='images/" . $rez->putanja_slika . "' alt='" . $rez->naziv_slika . "' style='margin:0px auto; max-width: 200px'/>";
                echo "</a><p style='text-align: center;'><b><i>" . $rez->naziv_slika . " " .$rez->id_slika. "</i></b></p>";
                if(isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin'):
                    echo "<p style='text-align: center;'><a href='index.php?id=109&id_gal=".$rez->id_slika."'>Izmeni</a> /     ";
                    if(isset($_GET['idG'])):
                        echo "<a href='php/admin/brisanjeSlikeG.php?idS=".$rez->id_slika."&idG=".$_GET['idG']."'>Obrisi</a></p>";
                    else:
                        echo "<a href='php/admin/brisanjeSlikeG.php?idS=".$rez->id_slika."&idG=1'>Obrisi</a></p>";
                    endif;
                endif;
                echo "</div>";
            endforeach;
        }
        $upit_count = "SELECT count(id_slika) FROM galerija";
        $rows = $konekcija->query($upit_count)->fetchColumn();

        paging($rows,$per_page);

        function paging($rows, $per_page=4) {
            echo"<h4>";
            @$_GET['idG'] = $_GET['idG'] ? intval($_GET['idG']) : 1;
            $p = ceil($rows / $per_page);
            if ($p > 1) {
                if ($_GET['idG'] > 1) {
                    echo "<a  href='" . $_SERVER['PHP_SELF'] . "?id=".$_GET['id']."&idG=" . (intval($_GET['idG']) - 1) . "'><</a>\n";
                }
                echo "<a  href='" . $_SERVER['PHP_SELF'] . "?id=".$_GET['id']."&idG=1'>1</a>\n";

                $start = max(2, min($p - 4, $_GET['idG'] - 2));
                $end = min($p - 1, max($start + 3, $_GET['idG'] + 2));
                for ($i = $start; $i <= $end; $i++) {
                    if (($start > 2) and ( $start == $i)) {
                        echo "... ";
                    }
                    echo "<a  href='" . $_SERVER['PHP_SELF'] . "?id=".$_GET['id']."&idG=" . $i . "'>" . $i . "</a>\n";
                    if (($end < $p - 1) and ( $i == $end)) {
                        echo "... ";
                    }
                }

                echo "<a  href='" . $_SERVER['PHP_SELF'] . "?id=".$_GET['id']."&idG=" . $p . "'>" . $p . "</a>\n";
                if ($_GET['idG'] < $p) {
                    echo "<a  href='" . $_SERVER['PHP_SELF'] . "?id=".$_GET['id']."&idG=" . (intval($_GET['idG']) + 1) . "'>></a>\n";
                    echo"</h4>";
                }
            }
        }

        echo "</div>";
        echo "<div class='cisti'></div>";
        echo "<div id='prikaz2'></div>";
        ?>
    </div>
    </div>
</div>


<?php if(isset($_SESSION['obavestenje'])){
    foreach ($_SESSION['obavestenje'] as $o):
        echo $o."</br>";
    endforeach;
}
unset($_SESSION['obavestenje']);
?>
?>