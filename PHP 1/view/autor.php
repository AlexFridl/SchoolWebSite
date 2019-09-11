<div class="autor">
    <h2>Autor</h2>

    <?php
    include "php/konekcija.php";

    $id1 = 1;
    $upit1 = "SELECT * FROM sadrzaj WHERE id_sadzaj= :id1";
    $priprema1 = $konekcija->prepare($upit1);
    $priprema1->bindParam(":id1", $id1);
    try {
        $priprema1->execute();
        $rezultat1 = $priprema1->fetchAll();
        foreach ($rezultat1 as $red1)
            echo "<div id='autor1'>";
        echo $red1->tekst1_sadrzaj;
        echo " ";
        echo $red1->tekst2_sadrzaj;
        echo "</div>";
        echo "<div>";
        echo "<img src='images/" . $red1->slika_sadrzaj . "' alt='" . $red1->naziv_sadrzaj . "'/>";
        echo "</div>";
        echo "<div class='autor_tekst'>";
        echo $red1->tekst3_sadrzaj;
        echo "</div>";
    } catch (PDOException $ex) {
        $ex->getMessage();
    }
    ?>
    <div id="anketa">
        <h4 align="center"><u>ANKETA</u></h4>
        <div class='levo'
        <form name="anketa" method="POST" action="">
            <?php
            include ('php/konekcija.php');

            $aktivno_pitanje = 1;
            $upit2 = "SELECT * FROM pitanja WHERE aktivno_pitanje = :aktivno_pitanje";
            $priprema1 = $konekcija->prepare($upit2);
            $priprema1->bindParam(":aktivno_pitanje", $aktivno_pitanje);
            try {
                $priprema1->execute();
                $rezultat1 = $priprema1->fetchAll();
                if ($rezultat1) {
                    echo "<table>";
                    foreach ($rezultat1 as $rez1):
                        echo "<tr><td>";
                        echo $rez1->naziv_pitanja;
                        echo "</td></tr>";

                        $upit3 = "SELECT * FROM odgovori o LEFT JOIN pitanja p ON o.pitanje_id = p.id_pitanja WHERE p.aktivno_pitanje = :aktivno_pitanje";
                        $priprema2 = $konekcija->prepare($upit3);
                        $priprema2->bindParam(":aktivno_pitanje", $aktivno_pitanje);
                        $priprema2->execute();

                        $rezultat2 = $priprema2->fetchAll();
                        foreach ($rezultat2 as $rez2):
                            if($rez2->pitanje_id == $rez1->id_pitanja):
                                echo "<tr><td>";
                                echo "<input type = 'radio' name = 'rbOdgovori' data-idpitanje = '".$rez2->id_pitanja."' class='rbOdgovori' value = '" . $rez2->id_odgovor . "'/>";
                                echo $rez2->ime_odgovor;
                                echo "</td></tr>";
                            endif;
                        endforeach;
                    endforeach;
                    echo "<tr align = 'center'><td>";
                    echo "<input type = 'button' name = 'btnGasaj' id='btnGlasaj' value = 'Glasaj'/> ";

                    echo "</td></tr>";
                    echo "</table>";
                    echo "</form>";
                }
            } catch (Exception $ex) {
                $ex->getMessage();
            }
            ?>
    </div>
    <div class="desno"></div>
</div>	
