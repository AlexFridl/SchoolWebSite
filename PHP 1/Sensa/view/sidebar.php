
    <body>
        <!--OKVIR sajta sa pozadinom-->
        <div class="border">	
            <div id="bg">
                background
            </div>
            <!--OKVIR sajta -->
            <div class="page">		
                <!--SIDEBAR ili NAVIGACIONI MENI SA FOOTERom-->
                <div class="sidebar">		
                    <div id="logo">
                        <img src="images/SensaLogo.jpg"/>				
                    </div>				
                    <?php
                    include "php/meni.php";
                    ?>

                    <p>
                        <a class="eksterno" href="https://ntcucenje.com/?v=8cee5050eeb7">NTC sistem učenja</a></br></br>
                    </p>
                    <p>
                        <a class="eksterno" href=https://www.facebook.com/Sensa-kreativna-ucionica-298197673574610/?hc_ref=ART51I_VuAfK3SjlfWj89E6P2Aolu710Ly5iaxFLjc-WyTjY3UuwFFasmF2e2PHMeR8">Facebook</a> 
                    </p>
                    <?php
                    if(isset($_SESSION['korisnik']) && $_SESSION['korisnik']->naziv_uloga == 'korisnik'):
                    ?>
                    <div class="meni1">
                        <form id="forma" action="php/mejlPhp.php" method="POST">
                            <table>
                                <tr>
                                    <th colspan="2" align="center">Posaljite poruku
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        Ime i prezime:</br>
                                    </td>
                                    <td>
                                        <input type="text" name="tbImePrezime" id="tbImePrezime" /></br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Poruka:</br>
                                    </td>
                                    <td>
                                        <textarea name="tbPoruka" id="tbPoruka" style="border-radius:5px;background-color: #d3d3d3;box-shadow: 0 0 5px 3px #919191;" ></textarea></br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email:</br>
                                    </td>
                                    <td>
                                        <input type="text" name="tbEmail" id="tbEmail"/></br>
                                    </td>
                                </tr>
                                <tr >
                                    <td colspan="2" align="center">
                                        <input type="submit"  name="btnPosalji" id="btnPosalji" value="Posalji" style="font-family: Impact, Haettenschweiler,'Arial Narrow Bold', sans-serif;color: #828282;">
                                    </td>
                                </tr>						

                            </table>
                        </form>
                    </div>
                    <?php
                    endif;
                    ?>
                    <div id="footnote">
                        <p id="copyright">Copyright &copy; 2018 
                            <a href="autor.html">Aleksandra Fridl | Sensa - kreativna učionica</a>
                        </p>
                    </div>
                </div>
                <div class="body">