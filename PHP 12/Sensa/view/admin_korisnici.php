<?php
if (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin') {
    ?>
<div class="services">
    <div class="dodaj">
    <a href="index.php?id=105">Dodaj novog korisnika</a>
    </div>
    <br>
    <div class="ispis">
    <table id="tabela" class="border3" style="margin: 0px auto; margin-top: 20px; text-align: center">
        <tr class="border-bottom" >
            <th>Korisnicko ime</th>
            <th>Izmeni / Obriši</th>
        </tr>
        <?php
        include 'php/konekcija.php';
        $upit = "SELECT * FROM korisnik";
        $rezultat = $konekcija->query($upit);      
// var_dump($rezultat);
        if ($rezultat) :
           foreach ($rezultat as $red):
                echo "<tr>";
                echo "<td>" . $red->korisnicko_ime . "</td>";
                echo "<td>";
                echo "<a href='index.php?id=106&id_korisnik="  . $red->id_korisnik . "' >Izmeni</a> / ";
                echo "<a class='brisi2' href='' data-id ='". $red->id_korisnik ."'>Obriši</a>";
                echo "</td>";
                echo "</tr>";

            endforeach;
        endif;
        ?>
    </table>
    </div>
</div>
    <?php
}
?>