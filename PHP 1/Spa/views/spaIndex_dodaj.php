
<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
    <div class="content">
        <div id="ispis">
            
            <h3>Dodavanje masaže</h3>    
            <?php
            if (isset($_SESSION['obavestenje'])) {
                foreach ($_SESSION['obavestenje'] as $e):
                    echo $e . "<br>";
                endforeach;
            }
            unset($_SESSION['obavestenje']);
            ?>
            <form action="php/spaIndex_dodaj.php" method="POST" enctype="multipart/form-data">
                <table class="dodaj">
                    <tr>
                        <td>Naziv</td>
                        <td><input type="text" name="tbNaziv" id="tbNaziv"/>
                    </tr>
                    <tr>
                        <td>Slika</td>
                        <td><input type="file" name="fSlika" id="fSlika"/></td>
                    </tr>
                   <!-- <tr>
                        <td><input type="hidden" id="hiddenId" name="hiddenId" value="<?= $rezultat->id_slika ?>"/></td>
                    </tr>-->
                    <tr >                
                        <td><input type="submit" name="btnDodaj" id="btnDodaj" value="Dodaj"/></td>
                    </tr>
                </table>     
            </form>  
        </div>    
    </div>
</div>