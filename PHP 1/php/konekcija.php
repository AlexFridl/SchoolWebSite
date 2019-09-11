<?php

	$ime_servera = "localhost";
	$ime_baze = "sensa2019";
	$kor_ime = "root";
	$lozinka = "";
	
	/*$ime_servera = "sql109.byethost32.com";
	$ime_baze = "b32_23457878_sensa";
	$kor_ime = "b32_23457878";
	$lozinka = "FAlexJeremic";*/
	
	try{
	$konekcija = new PDO("mysql:host=".$ime_servera.";dbname=".$ime_baze.";charset=utf8",$kor_ime, $lozinka);
	
	$konekcija->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
	$konekcija->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	catch(PDOexception $ex){
		$ex->getMessage();
	}
	
?>