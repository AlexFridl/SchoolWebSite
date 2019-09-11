
$(document).ready(function () {


//    $('.slika a').vanillabox();
    
    
    $("#ddlTermin").on("change", function () {
        $termin = $("#ddlTermin").val();
        $hbTermin = $("#hbTermin");

        $hbTermin.prop('value', $termin);
    });

   $("#btnDatum").on("change", function () {
        $datum = $("#btnDatum").val();

        $.ajax({
            url: 'php/zakaziAjax.php',
            type: 'POST',
            data: {"datum": $datum},
            dataType: 'json',
            success: function (data) {
                //console.log(data);
                $('#ddlTermin').html('');
                $('#ddlTermin').html(data);
            }
        });
    });
    


//provera na klijenstskoj strani (Registracija)
    $("#btnPotvrdi").on("click", function () {
        potvrdiRegistraciju();
    });
//provera na klijentskoj strani (Logovanje)
    $("#btnUlogujSe").on("click", function () {
        potvrdiLogovanje();
    });


//anketa sa ajaxom
    $(document).ready(function () {

        $("#btnPotvrdi").on("click", function () {
            potvrdiRegistraciju();
        });

        $("#btnGlasaj").on("click", function () {
            $id = $('input[name=rbAnketa]:checked').val();
            var ispis = $(".desno");

            $.ajax({
                url: 'php/anketa_ajax.php',
                method: 'POST',
                data: {
                    'id': $id
                },
                dataType: 'json',
                success: function (podaci) {
                    console.log(podaci);
                    ispis.html('');
                    ispis.html(podaci);
                },
                error:function(xhr, statusTxt, error){
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
    });
    //promena statusa pitanja (aktivno - neaktivno pitanje) u anketi
    $('input[type=radio][name=rbbPitanja]').click(function () {
        $id = $(this).val();
        $.ajax({
            url: 'php/izmena_statusa_pitanja.php',
            method: 'POST',
            data: {
                'podatak': $id
            },
            dataType: 'json',
            success: function (obavestenje) {
                if (obavestenje === true) {
//                    alert("Uspesno ste izmenili pitanje za anketu");
                    $("#ispisR").empty('');
                    $("#ispisR").append("<p>Uspesno ste izmenili pitanje za anketu!</p>");
                } else {
                    console.log("Greska");
                }
            }
//              error:function(xhr, statusTxt, error){
//                    var status =xhr.status;
//                    switch (status){
//                         case '500':
//                             alert("Greska je na serveru!");
//                             break;
//                         case '404':
//                             alert("Stranica nije pronadjena!");
//                             break;
//                         default:
//                             alert("Greska: "+status+"-"+statusTxt);
//                             break;
//                    }
//                }
        });
    });
$('.slika a').vanillabox();
});


function potvrdiRegistraciju() {

    var ime, prezime, email, korisnickoIme, lozinka;

    ime = document.getElementById("tbIme").value;
    prezime = document.getElementById("tbPrezime").value;
    korisnickoIme = document.getElementById("tbKorImeR").value;
    email = document.getElementById("tbEmail").value;
    lozinka = document.getElementById("lozinkaReg").value;

    //alert(prezime+korisnickoIme+email+lozinka);

    var reIme = /^[A-Z][a-z]{2,15}$/;
    var rePrezime = /^[A-Z][a-z]{2,20}$/;
    var reKorIme = /^[\w\S-_\d]{4,15}$/;
   var reEmail=/\S+@\S+\.\S+/;
    var reLoz = /^[\d\w]{4,12}$/;

    var greske = new Array();
    var podaci = new Array();
    //ime
    if (ime.match(reIme)) {
        podaci.push(ime.value);
    } else {
        document.querySelector("#ime").innerHTML = "*";
        document.querySelector("#ime").style.color = "red";
    }
    //prezime
    if (prezime.match(rePrezime)) {
        podaci.push(prezime.value);
    } else {
        document.querySelector("#prezime").innerHTML = "*";
        document.querySelector("#prezime").style.color = "red";
    }
    //korisnicko ime
    if (korisnickoIme.match(reKorIme)) {
        podaci.push(korisnickoIme.value);
    } else {
        document.querySelector("#KorIme").innerHTML = "*";
        document.querySelector("#KorIme").style.color = "red";
    }
    //email      
    if (email.match(reEmail)) {
        podaci.push(email.value);
    } else {
        document.querySelector("#email").innerHTML = "*";
        document.querySelector("#email").style.color = "red";
    }
    //lozinka
    if (lozinka.match(reLoz)) {
        podaci.push(lozinka.value);
    } else {
        document.querySelector("#lozinkaR").innerHTML = "*!";
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

