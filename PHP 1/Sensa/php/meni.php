
<?php

include "konekcija.php";

if (!isset($_SESSION['korisnik'])) {

    $posetioci_meni = 1;
    $upit = "SELECT id_meni, naziv_meni FROM meni WHERE posetioci_meni = :posetioci_meni";
    $prepare = $konekcija->prepare($upit);
    $prepare->bindParam(":posetioci_meni", $posetioci_meni);
    $prepare->execute();
    $rezultat = $prepare->fetchAll();
    //var_dump($rezultat);
    if ($rezultat) {
        echo "<ul>";
        foreach ($rezultat as $red):
            echo "<li>";
            echo "<a href='index.php?id=" . $red->id_meni . "'>" . $red->naziv_meni . "</a>";
            echo "</li>";
        endforeach;
        echo "<li class='log'>";
        echo "<a href='index.php?id=99'>REGISTRACIJA</a>";
        echo "</li>";
        echo "<li class='log'>";
        echo "<a href='index.php?id=98'>LOGOVANJE</a>";
        echo "</li>";
        echo "<li class='log'>";
        echo "<a href='doc/DokumentacijaSensa.pdf'>DOKUMENTACIJA</a>";
        echo "</li>";


//     
        echo "</ul>";
    }
    else {
        echo "Niste se registrovali";
    }
//  
} elseif (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'admin') {

    $admin_meni = 1;
    $upit1 = "SELECT id_meni, naziv_meni FROM meni WHERE admin_meni = :admin_meni";
    $prepare = $konekcija->prepare($upit1);
    $prepare->bindParam(":admin_meni", $admin_meni);
    try {
        $prepare->execute();
        $rezultat = $prepare->fetchAll();

        if ($rezultat) {
            echo "<ul>";
            foreach ($rezultat as $red):
                echo "<li>";
                echo "<a href='index.php?id=" . $red->id_meni . "'>" . $red->naziv_meni . "</a>";
                echo "</li>";
            endforeach;

            echo "<li class='log'>";
            echo "<a href='php/logout.php'>";
            echo "ODJAVA";
            echo "</a>";
            echo "</li>";
            echo "<li class='log'>";
            echo "<a href='doc/DokumentacijaSensa.pdf'>DOKUMENTACIJA</a>";
            echo "</li>";
            echo "</ul>";
        }
    } catch (PDOException $ex) {
        $ex->getMessage();
    }
} elseif (isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'korisnik') {

    $korisnik_meni = 1;
    $upit2 = "SELECT id_meni, naziv_meni FROM meni WHERE korisnik_meni = :korisnik_meni";
    $prepare = $konekcija->prepare($upit2);
    $prepare->bindParam(":korisnik_meni", $korisnik_meni);
    try {
        $prepare->execute();
        $rezultat = $prepare->fetchAll();

        if ($rezultat) {
            echo "<ul>";
            foreach ($rezultat as $red):
                echo "<li>";
                echo "<a href='index.php?id=" . $red->id_meni . "'>" . $red->naziv_meni . "</a>";
                echo "</li>";
            endforeach;
            echo "<li class='log'>";
            echo "<a href='php/logout.php'>ODJAVA</a>";
            echo "</li>";
            echo "<li class='log'>";
            echo "<a href='doc/DokumentacijaSensa.pdf'>DOKUMENTACIJA</a>";
            echo "</li>";
            echo "</ul>";
        }
    } catch (PDOException $ex) {
        $ex->getMessage();
    }
}
?>

