<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
	<div class="content">	
		<h3>Cenovnik</h3>    
      <?php if(isset($_SESSION['obavestenje'])){
                echo ($_SESSION['obavestenje']);
            }
            unset($_SESSION['obavestenje']);
      ?>  
<?php
	$upit = "SELECT s.*, c.* FROM slika s INNER JOIN cenovnik c ON s.id_slika = c.slika_id";
	$izvrsenje = $konekcija->query($upit);
    $rezultat = $izvrsenje->fetchAll();
    

?>
        <div class="ispis">
            <a class="linkC" href="index.php?page=cene_dodaj">Dodaj</a>         
            <table style="border:3px solid #630C6F; border-radius:5px; margin:0px auto;">
            <tr> 
                <th>Naslov</th>
                <th>Slika</th>
                <th>Cena</th>
                <th>Tekst</th>
            </tr>   
    <?php
            foreach($rezultat as $rez):
    ?>
            
            <tr>
                <td ><?=$rez->naslov?></td>
        
                <td ><img src="<?=$rez->putanja_slika?>" width="40px" height="40px" alt="<?=$rez->naslov?>"/></td>
                <td ><?=$rez->cena?></td>            
                <td ><?=$rez->tekst?></td>
                <td><a href="index.php?page=cene_izmena&id=<?=$rez->id_cenovnik?>">Izmeni</a></td>
                <td ><a href="php/cene_obrisi.php?id=<?=$rez->id_cenovnik?>">Obriši</a></td>
            <?php endforeach; ?>
			
            </tr>   	
            </table>
            				
	      
            </div>
	</div>
    </div>
