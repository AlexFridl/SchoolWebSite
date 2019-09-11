<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
	<div class="content">	
            <?php
                if(isset($_SESSION['obavestenje'])){
                    echo $_SESSION['obavestenje'];
                }
                unset($_SESSION['obavestanje']);           
            ?>            
        <h3>Cenovnik</h3>
        <form method="POST" action="php/cene_dodaj.php" enctype="multipart/form-data">
            <table class="dodaj">
                <tr>
                    <td>Naslov</td>
                    <td><input type="text" name="tbNaslov" id="tbNaslov"/>
                </tr>
                <tr>
                    <td>Slika</td>
                    <td><input type="file" name="fSlika" id="fSlika"/></td>
                </tr>
                <tr>
                    <td>Cene</td>
                    <td><input type="text" name="tbCene" id="tbCene"/>
                </tr>
                <tr>
                    <td>Tekst</td>
                    <td><input type="text" name="tbTekst" id="tbTekst"/>
                </tr>
                <tr >
                    <td><input type="submit" name="btnDodajCene" id="btnDodajCene" value="Potvrdi"/></td>
                </tr>
            </table>           
           
        </form>
    </div>
</div>

     