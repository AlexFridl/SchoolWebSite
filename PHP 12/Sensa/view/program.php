<?php
if (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin') :
?>
     <div class="services">

<div class="dodaj">
    <a href="index.php?id=101">Dodaj novi program</a>
</div>
    <br>
         <div class = "ispis">
    <table id="tabela" class="border3" style="margin: 0px auto; margin-top: 20px; text-align: center">
        <tr class="border-bottom" >
            <th >Naziv programa</th>

            <th>Slika </th>
            <th>Izmeni/Obriši</th>
        </tr>
        <?php
        include 'php/konekcija.php';
        $upit = "SELECT * FROM programi p LEFT JOIN  slikeprog s ON p.slikaP_id = s.id_slikaP";
        $rezultat = $konekcija->query($upit)->fetchAll();

        if ($rezultat):
            foreach ($rezultat as $red):
                echo "<tr>";
                echo "<td>" . $red->naziv_prog . "</td>";
                echo "<td><img width='200px' src='images/". $red->putanja_slike . "' alt='" . $red->naziv_prog . "'/></td>";
                echo "<td>";
                echo "<a href='index.php?id=103&id_prog=" . $red->id_prog . "'>Izmeni</a> / ";
                echo "<a class='brisi' href='' data-id='". $red->id_prog."'>Obriši</a>";
                echo "</td>";
                echo "</tr>";
            endforeach;
        endif;
        ?>
    </table>
         </div>
</div>
    <?php
    elseif (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'korisnik'):
    ?>

        <div class="services">

            <h2>PROGRAM</h2>

    <?php
    include "php/konekcija.php";

    $upit = "SELECT * FROM programi p LEFT JOIN  slikeprog s ON p.slikaP_id = s.id_slikaP ";
    $rezultat = $konekcija->query($upit)->fetchAll();

    if (!$rezultat) :
    echo "<div class='ispis'>";
    echo "Nema ništa u bazi!";
    echo "</div>";
    else :
    echo "<ul>";
    foreach ($rezultat as $red):
    echo "<li>";
    echo "<h3>";
    echo "<span>";
    echo $red->naziv_prog;
    echo "</span>";
    echo "</h3>";
    echo "<div>";
    echo "<img width='200px' src='images/". $red->putanja_slike . "' alt='" . $red->naziv_prog . "'/>";
    echo "</div>";
    echo "<p>";
    echo $red->tekst1_prog;
    echo "</p>";
    echo "<p>";
    echo $red->tekst2_prog;
    echo "</p>";
    echo "</li>";
    endforeach;
    endif;
    echo "</ul>";


    else:?>
            <div class="services">

            <h2>PROGRAM</h2>

    <?php
    include "php/konekcija.php";

    $upit = "SELECT * FROM programi p LEFT JOIN  slikeprog s ON p.slikaP_id  = s.id_slikaP ";
    $rezultat = $konekcija->query($upit)->fetchAll();

    if (!$rezultat) :
    echo "<div class='ispis'>";
    echo "Nema ništa u bazi!";
    echo "</div>";
    else :
    echo "<ul>";
    foreach ($rezultat as $red):
    echo "<li>";
    echo "<h3>";
    echo "<span>";
    echo $red->naziv_prog;
    echo "</span>";
    echo "</h3>";
    echo "<div>";
    echo "<img width='200px' src='images/". $red->putanja_slike . "' alt='" . $red->naziv_prog . "'/>";
    echo "</div>";
    echo "<p>";
    echo $red->tekst1_prog;
    echo "</p>";
    echo "<p>";
    echo $red->tekst2_prog;
    echo "</p>";
    echo "</li>";
    endforeach;
    endif;
    echo "</ul>";

    endif;
    ?>

</div>