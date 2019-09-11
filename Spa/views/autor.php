<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
	<div class="content">	<!-- div class='content' se razlikuje od strane do strane i to je sadrzaj koji se menja-->
		<h3>O autoru</h3>
		<?php
			
			$upit = "SELECT * FROM autor";
			$izvrsenje = $konekcija->prepare($upit);
			$izvrsenje->execute();
			$rezultat1 = $izvrsenje->fetch();
			/* var_dump($rezultat); */
		?>
		<h2 class="naslov">Aleksandra Fridl</h2>
		<ul>
			<li>
				<img src="<?= $rezultat1->slika_putanja?>" width="317" height="379" alt="<?= $rezultat1->imePrezime ?>"></a>
				<?=$rezultat1->tekst?></br></br>
				</br>
				<b>Broj indeksa: </b><?= $rezultat1->br_indeks?>
			</li>
		</ul>
		<div id="anketa">					
			<div class="levo">
				<h2 class="naslov">Anketa</h2>				
					<table class="anketa">
						<tr>
							<?php								
								$upit = "SELECT naziv_pitanja FROM pitanja WHERE aktivno_pitanje = 1";
								$rezultat2 = $konekcija->query($upit)->fetch();
							//var_dump($rezultat);
							?>   								
							<th><?= $rezultat2->naziv_pitanja ?></th> 
						</tr>			
						<?php
							$upit = "SELECT p.*, o.id_odgovor, o.ime_odgovor, o.pitanja_id FROM pitanja p INNER JOIN odgovori o ON p.id_pitanja = o.pitanja_id WHERE p.aktivno_pitanje = 1";
							$rezultat3 = $konekcija->query($upit)->fetchAll();
							?>
							<tr>
							<td>
							<?php
							foreach($rezultat3 as $rez): 
						?>								
								<input type="radio" name="rbAnketa" value="<?= $rez->id_odgovor ?>"/><?= $rez->ime_odgovor?>
							
						<?php
							endforeach;
						?>				
						</td>
						</tr>				
						<tr>
							<td>
								<input type="button" name="btnGlasaj" id="btnGlasaj" value="Glasaj"/>
							</td>
						</tr>
						
					</table>
			</div>
			<div class="desno">
			</div>
		</div>
	</div>
</div>		