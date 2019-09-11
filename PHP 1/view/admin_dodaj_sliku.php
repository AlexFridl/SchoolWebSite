

<div class="services">
    <div class="naslov">
    Dodavanje slike u Galeriju
    </div>
    <form action='php/admin/dodajSliku.php' accept-charset='utf=8' method='POST' enctype='multipart/form-data' >
        <table style='margin: 0px auto; margin-top: 20px'>
            <tr>
                <td>Naziv slike:</td>
                <td><input type="text" name="tbImeS" id="tbImeS" required/></td>
                <td id="ime"></td>
            </tr>
            <tr>
                <td>Slika:</td>
                <td><input type="file" name="fSlika" id="fSlika" required /></td>
                <td id="fSlika"></td>
            </tr>

            <tr>
                <td collspan="2"></td>
                <td>
                    <input type="submit" name="btnPotvrdi" id="btnPotvrdi" value="Dodaj"/>
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