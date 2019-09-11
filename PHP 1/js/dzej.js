function GetXmlHttpObject() {
    var xmlHttp = null;
    try {
        xmlHttp = new XMLHttpRequest();
    } catch (e) {
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}

var xmlhttp;
function promena(vrednost, slika) {
    var id_slika = slik;
    var opcija = vrednost.value;
    if (opcija.length == 0) {
        document.getElementById("prikaz2").innerHTML = "";
        return;
    }
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null) {
        alert("Browser does not support HTTP Request");
        return;
    }
    var strana = "../inc/glasanje.php";
    var url = strana + "?glas=" + opcija + "&slika=" + id_slika;
    xmlHttp.onreadystatechange = state_changed;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}


//provera na klijenstskoj strani (Registracija)
    $("#btnPotvrdi").on("click", function () {
        potvrdiRegistraciju();
    });
//provera na klijentskoj strani (Logovanje)
$("#btnUlogujSe").on("click", function () {
    potvrdiLogovanje();
});


//REGISTRACIJA
function potvrdiRegistraciju() {

    var ime, prezime, email, korisnickoIme, lozinka;

    ime = document.getElementById("tbIme").value;
    prezime = document.getElementById("tbPrezime").value;
    korisnickoIme = document.getElementById("tbKorImeR").value;
    email = document.getElementById("tbEmail").value;
    lozinka = document.getElementById("lozinkaReg").value;

    //alert(prezime+korisnickoIme+email+lozinka);

    var reIme = /^[A-ZŽĆČĐŠ][a-zžćčđš]{2,15}$/;
    var rePrezime = /^[A-ZŽĆČĐŠ][a-zžćčđš]{2,20}$/;
    var reKorIme = /^(\w\S\-\_\d){4,15}$/;
    var reEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+])*(\.\w{2,3})+$/;
    var reLoz = /^(\d\w){4,12}$/;

    var greske = new Array();
    var podaci = new Array();
    //ime
    if (ime.match(reIme)) {
        podaci.push(ime.value);
    } else {
        document.querySelector("#ime").innerHTML = "Ime nije ok!";
        document.querySelector("#ime").style.color = "red";
    }
    //prezime
    if (prezime.match(rePrezime)) {
        podaci.push(prezime.value);
    } else {
        document.querySelector("#prezime").innerHTML = "Prezime nije ok!";
        document.querySelector("#prezime").style.color = "red";
    }
    //korisnicko ime
    if (korisnickoIme.match(reKorIme)) {
        podaci.push(korisnickoIme.value);
    } else {
        document.querySelector("#KorIme").innerHTML = "Korisnicko ime nije ok!";
        document.querySelector("#KorIme").style.color = "red";
    }
    //email      
    if (email.match(reEmail)) {
        podaci.push(email.value);
    } else {
        document.querySelector("#email").innerHTML = "Email ime nije ok!";
        document.querySelector("#email").style.color = "red";
    }
    //lozinka
    if (lozinka.match(reLoz)) {
        podaci.push(lozinka.value);
    } else {
        document.querySelector("#lozinkaR").innerHTML = "Lozinka nije ok!";
        document.querySelector("#lozinkaR").style.color = "red";
    }
}
function potvrdiLogovanje() {
    var korisnickoIme, lozinka;
    korisnickoIme = document.getElementById("tbKorImeL").value;
    lozinka = document.getElementById("lozinkaLog").value;

    var reKorIme = /^[\w\S-_d]{4,15}$/;
    var reLoz = /^[\d\w]{4,12}$/;


    var greske = new Array();
    var podaci = new Array();

    //korisnicko ime
    if (korisnickoIme.match(reKorIme)) {
        podaci.push(korisnickoIme.value);
    } else {
        document.querySelector("#KorImeLog").innerHTML = "*";
        document.querySelector("#KorImeLog").style.color = "red";
        greske.push('Korisnicko ime nije ok!');
    }

    //lozinka
    if (lozinka.match(reLoz)) {
        podaci.push(lozinka.value);
    } else {
        document.querySelector("#lozinkaL").innerHTML = "*";
        document.querySelector("#lozinkaL").style.color = "red";
        greske.push('Lozinka nije ok!');
    }
}
//anketa 
$(document).ready(function () {

    $("#btnGlasaj").on("click", function () {
        $id = $('input[name=rbOdgovori]:checked').val();
        $idP = $('input[name=rbOdgovori]:checked').data("idpitanje");
        var ispis = $(".desno");

        $.ajax({
            url: 'php/anketa_ajax.php',
            method: 'POST',
            data: {
                'id': $id, 'idP': $idP
            },
            dataType: 'json',
            success: function (podaci) {
                console.log(podaci);
                ispis.html('');
                ispis.html(podaci);
            },
            error: function (xhr, statusTxt, error) {
                ispis.html('');
                ispis.html(xhr + " " + statusTxt + " " + error);
                /* var status =xhr.status;
                 switch (status){
                 case '500':
                 alert("Greska je na serveru!");
                 break;
                 case '404':
                 alert("Stranica nije pronadjena!");
                 break;
                 default:
                 alert("Greska: "+status+"-"+statusTxt);
                 break;
                 } */
            }
        });
    });
    //promena statusa pitanja (aktivno - neaktivno pitanje) u anketi
    $('input[type=radio][name=rbbPitanja]').click(function () {
        $id = $(this).data('id');
        $ispis = $("#ispis");

        $.ajax({
            url: 'php/admin/izmenaStatusaPitanja.php',
            method: 'POST',
            data: {
                'id': $id
            },
            dataType: 'json',
            success: function (podaci) {
                $ispis.html();
                $ispis.html(podaci);
            } ,
            error:function(xhr,statusTxt,error) {
                $ispis.html();
                $ispis.html(xhr + " " + statusTxt + " " + error);
            }
        });
    });

    //brisanje preko ajaxa
    //brisanje programa


    $(".brisi").click(function(){
    $id = $(this).data('id');
    $ispis = $(".ispis");

    $.ajax({
       url:'./php/admin/brisanjePrograma.php',
       method:'POST',
       data:{
           'id':$id
       },
       dataType: 'json',
       success:function(podaci){
            $ispis.html();
            $ispis.html(podaci);
       } ,
        error:function(xhr,statusTxt,error){
            $ispis.html();
            $ispis.html(xhr + " " + statusTxt + " " + error);

          /*  $status =xhr.status;
            switch (status){
                case '500':
                    alert("Greska je na serveru!");
                    break;
                case '404':
                    alert("Stranica nije pronadjena!");
                     break;
                default:
                    alert("Greska: "+status+"-"+statusTxt);
                    break;*/
        }
    });
});

//brisanje preko ajaxa
//  brisanje korisnika
    $(".brisi2").click(function(){
        $id = $(this).data('id');
        $ispis = $(".ispis");

        $.ajax({
            url:'./php/admin/obrisiKorisnika.php',
            method:'POST',
            data:{
                'id':$id
            },
            dataType: 'json',
            success:function(podaci){
                $ispis.html();
                $ispis.html(podaci);
            } ,
            error:function(xhr,statusTxt,error){
                $ispis.html();
                $ispis.html(xhr + " " + statusTxt + " " + error);

                /*  $status =xhr.status;
            switch (status){
                case '500':
                    alert("Greska je na serveru!");
                    break;
                case '404':
                    alert("Stranica nije pronadjena!");
                     break;
                default:
                    alert("Greska: "+status+"-"+statusTxt);
                    break;*/

            }
        });
    });
    //brisanje preko ajaxa
//  brisanje korisnika
    $(".brisi3").click(function(){
        $id = $(this).data('id');
        $ispis = $(".ispis");

        $.ajax({
            url:'./php/admin/obrisiPitanje.php',
            method:'POST',
            data:{
                'id':$id
            },
            dataType: 'json',
            success:function(podaci){
                $ispis.html();
                $ispis.html(podaci);
            } ,
            error:function(xhr,statusTxt,error){
                $ispis.html();
                $ispis.html(xhr + " " + statusTxt + " " + error);

            }
        });

    });

});

