<?php
    if(isset($_POST['btnPosalji'])){
	
		$imePrezime = $_POST['tbImePrezime'];
		$email = $_POST['tbEmail'];
        $poruka = $_POST['tbPoruka'];

        $reImePrezime = "/^[A-Z][a-z]{3,12}(\s[A-Z][a-z]{3,20})+$/";
        $rePoruka = "/[^=]$/";
        $errors = [];
		
		if(!preg_match($reImePrezime,$imePrezime))
        {
            $errors[] = "Ime i prezime nisu Ok!";
        }
		if(!preg_match($rePoruka,$poruka))
        {
            $errors[] = "Poruka nije dobrog formata!";
        }
		if(!filter_var($email, FILTER_VALIDATE_EMAIL))
        {
            $errors[] = "Email nije dobrog formata!";
        }
		  if(count($errors) > 0)
        {
            $_SESSION['errors'] = $errors;
        }
		else
        {
            $upit = "INSERT INTO kontakt VALUES('', :imePrezime, :email, :poruka)";

            $prepare = $konekcija->prepare($upit);

            $prepare->bindParam(':imePrezime',$imePrezime);
            $prepare->bindParam(':email',$email);
            $prepare->bindParam(':poruka',$poruka);

            $prepare->execute();

            $headers = "FROM: $email";
            mail("aleksandra.fridl.311.14@ict.edu.rs",$imePrezime,$poruka,$headers);
        }
    }
?>

<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
	<div class="content">	
	<h3>Kontakt</h3>
        <p>Pošaljite poruku administratoru.</p>
	<form method="POST" action="">
	<table class="section">
		<tr>
			<td>
				<label for="name"> <span>Ime i prezime</span>
					<input type="text" id="tbImePrezimeK" name="tbImePrezime"/>
				</label>
			</td>
		</tr>
		<tr>
			<td>
				<label for="name"> <span>Vaš email</span>
					<input type="text" id="tbEmail" name="tbEmail"/>
				</label>
			</td>
		</tr>
		<tr>
			<td>
				<label for="name"> <span>Vaša poruka</span></label>
					<textarea type="text" id="tbPoruka" name="tbPoruka" placeholder="Ovde unesite poruku"></textarea>
				
			</td>
		</tr>
		<tr>
			<td class="even">
				<label for="name">
					<input type="submit" id="btnPosalji" name="btnPosalji" value="Pošalji" min="50px"/>
				</label>
			</td>	
		</tr>
		</table>
	</form>	
	
	</div>
</div>