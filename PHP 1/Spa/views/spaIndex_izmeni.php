<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
	<div class="content">
    <div id="ispisSlika">
                <?php if(isset($_SESSION['obavestenje'])){
                echo $_SESSION['obavestenje'];}
			unset($_SESSION['obavestenje']);
        ?>
        <h3>Izmena tretmana</h3>
        <?php
                $id = $_GET['id'];
                $upit = "SELECT * FROM slika WHERE id_slika = :id";
                $izvrsenje = $konekcija->prepare($upit);
                $izvrsenje->bindParam(":id",$id);
                $izvrsenje->execute(); 
                $rezultat = $izvrsenje->fetch();
                    if($rezultat):                            
            ?>
        
        <form method="POST" action="php/spaIndex_izmeni.php" enctype="multipart/form-data">
            <table class="izmeni">
            
                <tr>           
                    <td>Naziv</td>
                    <td>
                        <input type="text" name="tbNaziv" id="tbNaziv" value="<?= $rezultat->naziv_slike?>"/>
                    </td>
                    </tr>
                <tr>
                    <td>Slika</td>
                    <td>
                        <input type="file" name="fSlika" id="fSlika"/><?= $rezultat->naziv_slike?>
                    </td>
                </tr>
                <tr>
                    <td><input type="hidden" id="hiddenId" name="hiddenId" value="<?=$rezultat->id_slika?>"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnIzmeni" id="btnIzmeni" value="Izmeni"/></td>
                </tr>                
            </table>       
        </form>
        <div id="ispis"></
        <?php          
                    endif;           
                ?>
      </div>
    </div>
</div>