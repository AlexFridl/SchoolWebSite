<div class="services">
    <div class="naslov">
        Dodavanje novog programa
    </div>
 <form action="php/admin/dodajProgram.php" accept-charset="utf=8" method="POST" enctype="multipart/form-data">
 <table style="margin: 0px auto; margin-top: 20px">
 <tr>
        <td>Naziv programa:</td>
     <td>
         <input type="text"name="tbNazivPrograma" size="49" required/>
     </td>
 </tr>
 <tr>
 <td>Tekst programa 1:</td>
 <td><textarea name="taTekstProgram1" rows="5" cols="50" id="taTekstProgram1"></textarea></td>
 </tr>
 <tr>
 <td>Tekst programa 2:</td>
 <td><textarea name="taTekstProgram2" rows="5" cols="50" id="taTekstProgram2"></textarea></td>
 </tr
 <tr>
 <td>Tekst programa 3:</td>
 <td><textarea name="taTekstProgram3" rows="5" cols="50" id="taTekstProgram3"></textarea></td>
 <tr>
 <tr>
 <td>Nova slika program:</td>
 <td><input type="file" name="fSlika" id="fSlika"/></td>
 </tr>
<tr>
<td colspan="2" class="submit">
<input type="submit" class="right form-control" name="btnDodaj" id="btnDodaj" value="Dodaj"/>
</td>
</tr>
</table>
</form>
    <?php if(isset($_SESSION['obavestenje'])){
        foreach ($_SESSION['obavestenje'] as $o):
            echo $o."</br>";
        endforeach;
    }
    unset($_SESSION['obavestenje']);
    ?>

</div>
