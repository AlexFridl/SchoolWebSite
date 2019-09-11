<?php
$id = $_GET['id_gal'];
$upit = "SELECT * FROM galerija WHERE id_slika = :id";
$priprema = $konekcija->prepare($upit);
$priprema->bindParam(":id", $id);
try{
$priprema->execute();
$rezultat = $priprema->fetch();
if($rezultat):
?>
<div class="services">
    <div class="naslov">
        Izmena slike u Galeriji
    </div>
    <form action='php/admin/izmeniSliku.php?id=109&id_gal=<?php echo $id ?>' accept-charset='utf=8' method='POST' enctype='multipart/form-data' >

       <table style='margin: 0px auto; margin-top: 20px'>
            <tr>
                <td>Naziv slike:</td>
                <td><input type="text" name="tbImeS" id="tbImeS" value="<?=  $rezultat->naziv_slika?>"required/></td>
                <td id="ime"></td>
            </tr>
            <tr>
                <td>Slika:</td>
                <td>
                    <img width="200px" src="images/<?php echo $rezultat->putanja_slika?>" alt="<?php echo $rezultat->naziv_slika?>"/>
                </td>
            </tr>
           <tr>
               <td id="fSlika"></td>
               <td><input type="file" name="fSlika" id="fSlika"/></td>
            </tr>

            <tr>
                <td collspan="2"></td>
                <td>
                    <input type="submit" name="btnIzmeniG" id="btnIzmeni" value="Izmeni"/>
                </td>
            </tr>
        </table>
    </form>
    <?php
    endif;
    }
    catch(PDOException $ex){
    $ex->getMessage();
    }
?>

    <?php if(isset($_SESSION['obavestenje'])){
        foreach ($_SESSION['obavestenje'] as $o):
            echo $o."</br>";
        endforeach;
    }
    unset($_SESSION['obavestenje']);
    ?>

</div>
