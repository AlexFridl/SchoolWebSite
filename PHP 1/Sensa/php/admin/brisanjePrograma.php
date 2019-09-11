<?php
session_start();
include "../konekcija.php";

$id = $_POST['id'];
$upit = "DELETE FROM programi WHERE id_prog = :id";
$priprema = $konekcija->prepare($upit);
$priprema->bindParam(":id", $id);

$podaci = "";
$rezultat = $priprema->execute();
if($rezultat){
    $podaci .= "<table id='tabela' class='border3' style='margin: 0px auto; margin-top: 20px; text-align: center'>";
    $podaci .= "<tr class='border-bottom'>";
    $podaci .= "<th >Naziv programa</th>";
    $podaci .= "<th>Slika </th>";
    $podaci .= "<th>Izmeni/Obriši</th>";
    $podaci .= "</tr>";
    $upit = "SELECT * FROM programi p LEFT JOIN  slikeprog s ON p.slikaP_id = s.id_slikaP";
    $rezultat = $konekcija->query($upit);
    if ($rezultat):
        foreach ($rezultat as $red):
            $podaci .= "<tr>";
            $podaci .= "<td>" . $red->naziv_prog . "</td>";
            $podaci .= "<td><img width='200px' src='images/". $red->putanja_slike . "' alt='" . $red->naziv_prog . "'/></td>";
            $podaci .= "<td>";
            $podaci .= "<a href='index.php?id=103&id_prog=" . $red->id_prog . "'>Izmeni</a> / ";
            $podaci .= "<a class='brisi' href='index.php?id=2&id=" . $red->id_prog . "' data-id='<?php $red->id_prog?>'>Obriši</a>";
            $podaci .= "</td>";
            $podaci .= "</tr>";
        endforeach;
    endif;
    $podaci .= "</table>";

    echo json_encode($podaci);


}
else{

    $podaci .= "<table id='tabela' class='border3' style='margin: 0px auto; margin-top: 20px; text-align: center'>";
    $podaci .= "<tr class='border-bottom'>";
    $podaci .= "<th >Naziv programa</th>";
    $podaci .= "<th>Slika </th>";
    $podaci .= "<th>Izmeni/Obriši</th>";
    $podaci .= "</tr>";
    $upit = "SELECT * FROM programi p LEFT JOIN  slikeprog s ON p.slikaP_id = s.id_slikaP";
    $rezultat = $konekcija->query($upit);
    if ($rezultat):
        foreach ($rezultat as $red):
            $podaci .= "<tr>";
            $podaci .= "<td>" . $red->naziv_prog . "</td>";
            $podaci .= "<td><img width='200px' src='images/". $red->putanja_slike . "' alt='" . $red->naziv_prog . "'/></td>";
            $podaci .= "<td>";
            $podaci .= "<a href='index.php?id=103&id_prog=" . $red->id_prog . "'>Izmeni</a> / ";
            $podaci .= "<a class='brisi' href='index.php?id=2&id=" . $red->id_prog . "' data-id='<?php $red->id_prog?>'>Obriši</a>";
            $podaci .= "</td>";
            $podaci .= "</tr>";
        endforeach;
    endif;
    $podaci .= "</table>";

    echo json_encode($podaci);
}


/*echo json_encode("Pozdrav");*/
?>