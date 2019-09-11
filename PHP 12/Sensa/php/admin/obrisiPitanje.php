<?php
session_start();
include "../konekcija.php";

$id = $_POST['id'];
$podaci = "";

$upit_obrisiPitanje = "DELETE FROM pitanja WHERE aktivno_pitanje = 0 AND id_pitanja = :id";
$priprema = $konekcija->prepare($upit_obrisiPitanje);
$priprema->bindParam(":id", $id);

try {
    $rezultat = $priprema->execute();
    if($rezultat){

        $upit = "SELECT * FROM pitanja";
        $izvrsenje = $konekcija->query($upit);
        $rezultat = $izvrsenje->fetchAll();

        $podaci .= "<div class='anketaAdmin'>";
        $podaci .= "<form method='POST' action='php/admin/dodajPitanje.php'>";
        $podaci .= "<table style='border: 3px solid #7d7d7d; border-radius: 5px; margin-left: 100px; padding: 25px;'>";
        $podaci .= "<tr>";
        $podaci .= "<th>Dodaj pitanje</th>";
        $podaci .= "</tr>";
        $podaci .= "<tr>";
        $podaci .="<td>";
        $podaci .= "<input type='text' id='tbPitanje' name='tbPitanje'/>";
        $podaci .= "</td>";
        $podaci .= "<td>";
        $podaci .= "<input type='submit' name='btnDodajPitanje' id='btnDodajPitanje' value='Dodaj pitanje'/>";
        $podaci .= "</td>";
        $podaci .= "</tr>";
        $podaci .= "<tr>";
        $podaci .= "<th>Pitanje</th>";
        $podaci .= "<th>Aktivno pitanje</th>";
        $podaci .= "</tr>";
        foreach ($rezultat as $rez):
            $podaci .= "<tr>";
            $podaci .= "<td ><?= $rez->naziv_pitanja ?></td>";
            $podaci .= "<td align='center'>";
            $podaci .= "<input type='radio' name='rbbPitanja' id='rbbPitanja' data-id='<?= $rez->id_pitanja ?>' value='<?= $rez->id_pitanja ?>' <?= $rez->aktivno_pitanje == 1 ? 'checked = 'true' : '' ?>/></td>";
            $podaci .= "<td>";
            $podaci .= "<a href='' class='brisi3' data-id='<?= $rez->id_pitanja ?>' style='color:#7d7d7d'>Obriši</a>";
            $podaci .= "</td>";
            $podaci .= "</tr>";
        endforeach;
        $podaci .= "<tr>";
        $podaci .= "<td>";
        $podaci .= "<select name='ddlDodajPitanje' id='ddlDodajPitanje'>";
        $podaci .= "<option value='0'>Odaberi pitanje</option>";
        foreach ($rezultat as $rez):
            $podaci .= "<option value='<?= $rez->id_pitanja ?>'><?= $rez->naziv_pitanja ?></option>";
        endforeach;
        $podaci .= "</select>";
        $podaci .= "</td>";
        $podaci .= "</tr>";
        $podaci .= "<tr>";
        $podaci .= "<th>Dodaj odgovore</th>";
        $podaci .= "</tr>";
        $podaci .= "<tr>";
        $podaci .= "<td>";
        $podaci .= "<input type='text' name='tbOdgovor' id='tbOdgovor' placeholder='Odgovor'/>";
        $podaci .= "</td>";
        $podaci .= "<td>";
        $podaci .= "<input type='submit' name='btnDodajOdgovor' id='btnDodajOdgovor' value='Dodaj odgovor'/>";
        $podaci .= "</td>";
        $podaci .= "</tr>";
        $podaci .= "</table>";
        $podaci .= "</form>";
        $podaci .= "</div>";

    }
}
catch(PDOException $ex){
    $ex->getMessage();
}
echo json_encode($podaci);

?>