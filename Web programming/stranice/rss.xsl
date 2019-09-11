<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:mapa="http://www.sitemaps.org/schemas/sitemap/0.9">
    <xsl:output method="html"/>
	<xsl:template match="/">
	<html>
	<head>
		<title>Pčelarsko gazdinstvo Fridl</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="Keywords" content="pčelarstvo, domaćinstvo, pčelinjak, Fridl, košnice"/>
		<meta name="Description" content="Porodično domaćinstvo Fridl čini pčelinjak od ukupno sedamdeset košnica. Pčelinjak se nalazi na teritoriji opštine Lazarevac."/>
		<script type="text/javascript" src="../JavaScript/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="../JavaScript/dzej.js"></script>
		<link rel="shortcut icon" href="../slike/logo1.png" type="image/x-icon"/>
		<link rel="stylesheet" type="text/css" href="../css/stil.css"/>
	</head>

	<body onLoad="slajder();">
		<div id="sajt">
		
			<div id="omot">
						
				<div id="header">
					<h1>Pčelarsko gazdinstvo Fridl</h1>
					<div id="pretragai">
						<input type="text" placeholder="Pretraga..." maxlength="45" id="tbPoljeUnos" name="tbPoljeUnos" size="15"/>
						<input type="button" name="btPretraga" id="btPretraga" value="Pretraga" onClick="pretraga1()"/>
					</div>	
					<div id="slikaHeader">
						<img class="slajder" name="slajder" src="../slike/slajder/3-1.jpg" alt="PčelinjakFridl"/>
						<img src="../slike/slajder/8-1.jpg" alt="PčelinjakFridl"/>
						<img src="../slike/slajder/7-1.jpg" alt="PčelinjakFridl"/>
						<img src="../slike/slajder/10-1.jpg" alt="PčelinjakFridl"/>
						<img src="../slike/slajder/9-1.jpg" alt="PčelinjakFridl"/>
					</div>
					
				</div>
				<div id="meni">					
					<div id="navigacija">
						<ul>
							<li><a href="../index.html">POČETNA</a></li>
							<li><a href="#" onmouseover="otvori('pro');" onmouseout="vremeTrajanja();">PROIZVODI</a>
								<div id="pro" onmouseover="vremePokazivanja();" onmouseout="vremeTrajanja();">
									<a href="bagrem.html">BAGREMOV MED</a>
									<a href="lipa.html">LIPOV MED</a>
									<a href="suncokret.html">SUNCOKRETOV MED</a>								
									<a href="livada.html">LIVADSKI MED</a>									
									<a href="ostali.html">OSTALI PROIZVODI</a>
									
								</div>
							</li>
							<li><a href="galerija.html">GALERIJA</a></li>
							<li><a href="kontakt.html">KONTAKT</a></li>
							<li><a href="autor.html">O AUTORU</a></li>	
							<li id="prijaviSe"><a href="#"><b>PRIJAVI SE</b></a>
							<form class="forma">
								<table>
									<tr>
										<td>Korisničko ime: </td>
									</tr>
									<tr>
										<td><input type="text" id="tbKorisnickoIme" name="tbKorisnickoIme" maxlength="20"/></td>
									</tr>
									<tr>
										<td>Lozinka:</td>	
									</tr>
									<tr>
										<td><input type="password" id="tbLozinka" name="tbLozinka" maxlength="20"/></td>
										
									</tr>
									<tr>
										<td>
											<input type="submit" id="btPrijava" value="Prijava"/>
											<a href="registracija.html"><input type="button" id="btRegistracija" value="Registracija"/></a>
										</td>
									</tr>
								</table>
							</form></li>
						</ul>			
					</div>
				</div>
				<div id="sredinaOmot">
					<div id="pretragaRezultat"></div>					
					<div id="sredinaText3">
						<div class="sredinNaslov">
							<h2>NOVOSTI</h2>
						</div>
						<div class="sredinaPrica5">
							<table border="1">
								<tr bgcolor="#CC7722">
									<th>Nalov</th>
									<th>Link</th>
									<th>Opis</th>
								</tr>
								<xsl:for-each select="rss/channel/item">
								<tr>
									<td><xsl:value-of select="title"/></td>
									<td><xsl:value-of select="link"/></td>
									<td><xsl:value-of select="description"/></td>
								</tr>
								</xsl:for-each>
							</table>
						</div>
					</div>
				</div>
				<div id="footer">
					<div id="footerNavigacija">
						<ul>
							<li><a href="dokumentacija.pdf">Dokumentacija</a></li>
							<li><a href="sitemap.xml">Mapa sajta</a></li>						
						</ul>					
					</div>
					<div id="rss">
						<a href="rss.xml"><img src="../slike/rss.png" alt="iconRss"/></a>					
					</div>
					<div id="copyRight">
						<p>Copyright AleksandraFridl 2016</p>
					</div>
				</div>
		</div>
		
		</div>
	</body>
</html>
    </xsl:template>
</xsl:stylesheet>