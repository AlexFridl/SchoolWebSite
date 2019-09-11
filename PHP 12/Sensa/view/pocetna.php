<div>
    <h2>Sensa - kreativna učionica</h2>
    <p style="text-align: center">
        <img src="images/Flajer2.png" alt="flajer">
    </p>

    <div>
        <h3><span>PROGRAM</span></h3>
        <p>
            Sensa - kreativna učionica otvorena je 2012.godine. Postojeći program je prilagođen deci različitog uzrasta. Mentori na programima su licencirani <img src="images/NTC4.jpg" alt="NTC"/> predavači, a sav materijal i organizacija programa prate načela <a href="https://ntcucenje.com/?v=8cee5050eeb7"></a><img src="images/NTC4.jpg" alt="NTC"/> sistema učenja.
        </p>
        <ul>
            <li id="link1">
                <a href="index.php?id=2"><span>Maleni</br>(3-7god)</span></a>
            </li>
            <li id="link2">
                <a href="index.php?id=2"><span>Mali naučnici</br>(7-10god)</span></a>
            </li>
            <li id="link3">
                <a href="index.php?id=2"><span id="link3">Radionice</span></a>
            </li>
        </ul>
    </div>

    <div class="section">

        <?php
        $id3 = 2;
        $upit3 = "SELECT *	FROM sadrzaj WHERE id_sadzaj=:id3";
        $priprema3 = $konekcija->prepare($upit3);
        $priprema3->bindParam(":id3", $id3);
        try{
            $priprema3->execute();
            $rezultat3 = $priprema3->fetchAll();

            if($rezultat3){
                foreach($rezultat3 as $red3):
                    echo "<h4 class='adresa1'>";
                    echo "ADRESA";
                    echo "</h4>";
                    echo "<div class='adresa' style='padding:-10px;'>";
                    echo $red3->tekst1_sadrzaj;
                    echo "</div>";
                endforeach;
            }
        }
        catch(PDOException $ex){
            $ex->getMessage();
        }
        ?>
    </div>
</div>