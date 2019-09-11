//Slajder

$(document).ready(function(){
	slajder();
});

function slajder()
 {
	var current = $('#slikaHeader .slajder');
	var next = current.next().length ? current.next() : current.parent().children(':first');
  
	current.hide().removeClass('slajder');
	next.fadeIn().addClass('slajder');
  
	setTimeout(slajder, 5000);
}

//Prijavi se

$(document).ready(function(){
	$('#prijaviSe >.forma').hide();
	
	$('#prijaviSe').hover(function(){
		$('.forma')		
			.stop(true,true)
			.fadeIn('fast');	
			
		
	}, function(){
		$('.forma')
			.stop(true,true)
			.fadeOut("fast");
			$("#tbKorisnickoIme").val("");
			$("#tbLozinka").val("");
		
	})
	
});

//Padajuca navigacija

	var vreme_Pokazivanja=0;
	var trajanje=3000;
	var getId=0;

function otvori(id)
{
	vremePokazivanja();
	
	if (getId)
	{
		getId.style.visibility='hidden';
	}
	
	getId=document.getElementById(id);
	getId.style.visibility='visible';
	
}

function zatvori()
{
	if(getId)
	{
		getId.style.visibility='hidden';
	}
}

function vremeTrajanja()
{
	vreme_Pokazivanja=window.setTimeout(zatvori, trajanje);
}

function vremePokazivanja()
{
	if(vreme_Pokazivanja)
	{
		window.clearTimeout(vremePokazivanja);
		vreme_Pokazivanja=null;
	}
}

	document.onClick=zatvori;

/*Pretraga*/

function pretraga(){
	if(window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("GET","stranice/pretraga.xml",false);
	xmlhttp.send();
	xmlDoc=xmlhttp.responseXML;
	dohvatiPodatke(xmlDoc);
}
function dohvatiPodatke(xmlDoc){
	var tbSearch=document.getElementById('tbPoljeUnos');
	var svaPretraga=xmlDoc.getElementsByTagName('strana');
	var ispis="";
	for(var i=0;i<svaPretraga.length;i++)
	{
		var ime=svaPretraga[i].getElementsByTagName('ime')[0].childNodes[0].nodeValue;
		var srcc=svaPretraga[i].getElementsByTagName('srcc')[0].childNodes[0].nodeValue;
		
		if(tbSearch.value.toLowerCase().trim() ==ime.toLowerCase().trim())
		{
			ispis="<span>Naziv: </span>"+ime+
	        " <a href='"+srcc+
			"'style='color:#19458e'>Saznaj više!</a>";
		}
	}
	
  document.getElementById('pretragaRezultat').innerHTML=ispis;
}

function pretraga1(){
	if(window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("GET","pretraga.xml",false);
	xmlhttp.send();
	xmlDoc=xmlhttp.responseXML;
	dohvatiPodatke(xmlDoc);
}
function dohvatiPodatke(xmlDoc){
	var tbSearch=document.getElementById('tbPoljeUnos');
	var svaPretraga=xmlDoc.getElementsByTagName('strana');
	var ispis="";
	for(var i=0;i<svaPretraga.length;i++)
	{
		var ime=svaPretraga[i].getElementsByTagName('ime')[0].childNodes[0].nodeValue;
		var srcc=svaPretraga[i].getElementsByTagName('srcc')[0].childNodes[0].nodeValue;
		
		if(tbSearch.value.toLowerCase().trim() ==ime.toLowerCase().trim())
		{
			ispis="<span>Naziv: </span>"+ime+
	        " <a href='"+srcc+
			"'style='color:#19458e'>Saznaj više!</a>";
		}
	}
	
  document.getElementById('pretragaRezultat').innerHTML=ispis;
}

//Galerija

	var text="";

	$(document).ready(function(){
	$.ajax({
		type:"GET",
		url:"galerija.xml",
		dataType:"xml",
		success:function(xml){
			$(xml).find("slika").each(function(){
				
				var naziv=$(this).find('naziv').text();
				var putanja=$(this).find('putanja').text();
				var alt=$(this).find('alt').text();
				
				text+='<div class="galerijaSlike"><div class="gslika"><a href="' + putanja + '" data-lightbox="gal" data-title="'+naziv +'"><img src="' + putanja +'" alt="' +alt + '"/></a><p>' + naziv + '</p></div></div>';
			});
			
			document.getElementById("galerija").innerHTML=text;
		}
	});
	
});


//Registraciaj

function prijavi_se()
{
	var ime = document.getElementById('tbIme');
	var prezime = document.getElementById('tbPrezime');
	var brojIndeksa = document.getElementById('tbBrIndeksa');
	var status = document.getElementsByName('rbStatus');
	var korisnicko = document.getElementById('tbKorisnickoIme2');
	var lozinka = document.getElementById('tbLozinka2');

	var reIme = /^[A-Z]{1}[a-z]{2,14}$/;
	var rePrezime = /^[A-Z]{1}[a-z]{2,19}$/;
	var reBrojIndeksa = /^[1-9]{1}[0-9]{0,3}\/[0-9]{2}$/;
	var reKorisnicko = /^[\w]{1,10}$/;
	var reLozinka=/^[\w]{5,10}$/;
	
	var greske = new Array();
	var ispis = "<fieldset><legend>Podaci: </legend><ul>";
	var sadrzaj = new Array();
	
	
	if(!ime.value.match(reIme))
	{
		ime.style.border="1px solid red"
		greske.push("Ime nije u dobrom formatu!");
	}
	else
	{
		ime.style.border="1px solid silver"
		ispis+= "<li>Vaše ime je: " +ime.value+"</li>";
	}
	
	if(!prezime.value.match(rePrezime))
	{
		prezime.style.border="1px solid red";
		greske.push("Prezime nije u dobrom formatu!");
	}
	else
	{	
		prezime.style.border="1px solid silver";
		ispis+= "<li>Vaše prezime je: " +prezime.value+ "</li>";
	}
	
	if(!brojIndeksa.value.match(reBrojIndeksa))
	{
		brojIndeksa.style.border="1px solid red";
		greske.push("Broj indeksa nije u dobrom formatu!");
		
	}
	else
	{	
		brojIndeksa.style.border="1px solid silver";
		ispis+= "<li>Vaš broj indeksa je: " +brojIndeksa.value + "</li>";
	}
	var izabraniStatus = "";
	for(var i = 0; i < status.length; i++)
	{
		if(status[i].checked)
		{
			izabraniStatus = status[i].value;
		}
	}
	if(izabraniStatus == "")
	{
		greske.push("Izaberite pol!")
	}
	else
	{
		ispis+= "<li>Vaš pol je: " + izabraniStatus + "</li>";
	}
	if(!korisnicko.value.match(reKorisnicko))
	{
		korisnicko.style.border="1px solid red";
		greske.push("Korisničko ime nije u dobrom formatu!");
	}
	else
	{	
		korisnicko.style.border="1px solid silver";
		ispis+= "<li>Vaše korisničko ime je: " + korisnicko.value +"</li>";
	}
	if(!lozinka.value.match(reLozinka))
	{
		lozinka.style.border="1px solid red"
		greske.push("Lozinka nije u dobrom formatu!");
	}
	else
	{	
		lozinka.style.border="1px solid silver"
	}
	
	if(greske.length == 0)
	{
		ispis += "</ul></fieldset>" 	
		
		document.getElementById('podaci').innerHTML = ispis;
	}
	else
	{
		var listaGresaka = "<fieldset><legend>Greške: </legend><ul>";
		
		for(var i = 0; i < greske.length; i++)
		{
			listaGresaka += "<li>" + greske[i] + "</li>";
		}
		listaGresaka += "</ul></fieldset>";
		document.getElementById('podaci').innerHTML = listaGresaka;
	}	
}
 
 //Anketa
 
 function kolacic()
 {
	var sajt = document.getElementById('ddlocena');
	var dizajn = document.getElementById('ddldizajn');
	var odgovor = document.getElementsByName('odgovor');
	var kolacic="";
	var izabranSajt = "";
	var izabranDizajn = "";
	var izabranOdgovor = "";
		
		for(var i = 0; i < sajt.length; i++)
		{
			if(sajt[i].checked)
			{
				izabranSajt = status[i].value;
			}
			kolacic += "Ocena za sajt je: " +izabranSajt;
		}
		for(var i = 0; i < dizajn.length; i++)
		{
			if(dizajn[i].checked)
			{
				izabranDizajn = dizajn[i].value;
			}
			kolacic += "Ocena za dizajn je: " +izabranDizajn;
		}
		for(var i = 0; i < odgovor.length; i++)
		{
			if(odgovor[i].checked)
			{
				izabranOdgovor = odgovor[i].value;
			}
			kolacic += "Da li su informacije koje ste dobili korisne?" +izabranOdgovor;
		}
		document.cookie="username=" + kolacic;
		alert("Uspešno ste glasali i kreirali kolačić!!!");
}





