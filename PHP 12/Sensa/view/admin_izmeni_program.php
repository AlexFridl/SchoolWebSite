<?php
$id = $_GET['id_prog'];
$upit = "SELECT * FROM programi p LEFT JOIN  slikeprog s ON p.slikaP_id = s.id_slikaP WHERE id_prog = :id";
$priprema = $konekcija->prepare($upit);
$priprema->bindParam(":id", $id);

try {
    $priprema->execute();
    $rezultat = $priprema->fetch();
    if ($rezultat) {
        ?>

 <form action="php/admin/izmenaProgram.php?id=102&id_prog=<?php echo $id?>" accept-charset="utf=8" method="POST" enctype="multipart/form-data">
 <table style="margin: 0px auto; margin-top: 20px">
 <tr>
        <td>Naziv programa:</td>
     <td>
         <input type="text"name="tbNazivPrograma" size="49" value="<?php echo $rezultat->naziv_prog?>" required/>
     </td>
 </tr>
 <tr>
 <td>Tekst programa 1:</td>
 <td><textarea name="taTekstProgram1" rows="5" cols="50" id="taTekstProgram1"><?php echo $rezultat->tekst1_prog?></textarea></td>
 </tr>
 <tr>
 <td>Tekst programa 2:</td>
 <td><textarea name="taTekstProgram2" rows="5" cols="50" id="taTekstProgram2"><?php echo $rezultat->tekst2_prog?></textarea></td>
 </tr
 <tr>
 <td>Tekst programa 3:</td>
 <td><textarea name="taTekstProgram3" rows="5" cols="50" id="taTekstProgram3"><?php echo $rezultat->tekst3_prog?></textarea></td>
 <tr>
 <tr>
     <td>Nova slika program:</td>
     <td>
         <img width="200px" src="images/<?php echo $rezultat->putanja_slike?>" alt="<?php echo $rezultat->naziv_prog?>"/>
     </td>
 </tr>
 <tr>
    <td></td>
    <td><input type="file" name="fSlika" id="fSlika"/></td>
 </tr>
<tr>
<td colspan="2" class="submit">
<input type="submit" class="right form-control" name="btnIzmeni" id="btnIzmeni" value="Izmeni"/>
</td>
</tr>
</table>
</form>
<?php }}
catch (PDOException $ex) {
$ex->getMessage();
}if(isset($_SESSION['obavestenje'])){
        foreach ($_SESSION['obavestenje'] as $o):
            echo $o."</br>";
        endforeach;
    }
    unset($_SESSION['obavestenje']);
?>