
	<div id="body"> <a id="logo" href="index.html"><img src="images/logo.gif" width="272" height="201" alt="spa" title="spa"></a>
		<div class="content">
			<h3>Cenovnik</h3>
			<ul class="section">

			<?php							
				 $limit = $_GET['page'] ? "0,3" : ((intval($_GET['id'])-1)*3).",3";
  $rezultatC =$konekcija->query("SELECT * FROM cenovnik c INNER JOIN slika s ON s.id_slika = c.slika_id LIMIT ".$limit)->fetchAll();
				foreach($rezultatC as $rez):
			?>
				<li><a href="index.php?page=zakazi">
						<img src="<?= $rez->putanja_slika?>" width="96" height="96"/>
					</a>
					<h2><a href="index.php?page=zakazi"><?= $rez->naslov ?></a></h2>
					<p><?=$rez->cena?> rsd</p></br><p><?= $rez->tekst?> </p>
					<input type="hidden" data-id="<?=$rez->id_cenovnik?>"/>
				</li>
				<?php endforeach;?>		
			</ul>
			
<?php
$upit = "SELECT count(id_cenovnik) FROM cenovnik c INNER JOIN slika s ON s.id_slika = c.slika_id";
$rows= $konekcija->query($upit)->fetchColumn();
$count = $rows[0];
paging($rows, 3);
    $id = $_GET['page'];
   function paging($rows,$per_page) {
      $id = $_GET['page'] ? intval($_GET['page']) : 1;
      $p = ceil($rows/$per_page);
      if ($p > 1) {
         if ($_GET['page'] > 1) {
			echo "<a  href='".$_SERVER['PHP_SELF']."?page=cene&id=".(intval($_GET['page'])-1)."'><</a>\n";
         }
		echo "<div class='paginacija'><a  href='".$_SERVER['PHP_SELF']."?page=cene&id=1'>1</a>\n";
		  
		 $start = max(2,min($p-3,intval($_GET['id'])-2));
         $end = min($p-1,max($start+3,intval($_GET['page'])+2));
         for ($i=$start;$i<=$end;$i++) {
            if (($start > 2) and ($start == $i)) {
               echo "pozdrav ";
            }
            echo "<a  href='".$_SERVER['PHP_SELF']."?page=cene&id=".$i."'>".$i."</a>\n";
            if (($end < $p - 1) and ($i == $end)) {
               echo "... ";
            }
         }
		 echo "<a  href='".$_SERVER['PHP_SELF']."?page=cene&id=".$p."'>".$p."</a>\n";       
		 if ($_GET['page'] < $p) {
            echo "<a  href='".$_SERVER['PHP_SELF']."?page=cene&id=".(intval($_GET['id'])+1)."'>></a>\n</div>";
         }
      }
   }
?>	
</div>
	</div>
	
