-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2019 at 10:01 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sensa`
--

-- --------------------------------------------------------

--
-- Table structure for table `galerija`
--

CREATE TABLE `galerija` (
  `id_slika` int(11) NOT NULL,
  `naziv_slika` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `putanja_slika` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galerija`
--

INSERT INTO `galerija` (`id_slika`, `naziv_slika`, `putanja_slika`) VALUES
(1, 'Čudovište', 'Cudoviste.jpg'),
(2, 'Kockice', 'Kockice1.jpg'),
(3, 'Kockice2', 'Kockice2.jpg'),
(4, 'Obruč', 'Obruc.jpg'),
(5, 'Poligon', 'Poligon.jpg'),
(6, 'Ribice', 'Ribice.jpg'),
(7, 'ShooShooMali', 'ShooShooMali.jpg'),
(8, 'Fliper', 'Fliper.jpg'),
(9, 'Materijal', 'Materijal.jpg'),
(10, 'Materijal1', 'Materijal1.jpg'),
(11, 'Uskrs', 'Uskrs.jpg'),
(12, 'Vulkan', 'Vulkan1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kontakt`
--

CREATE TABLE `kontakt` (
  `id_kontakt` int(11) NOT NULL,
  `imePrezime` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `poruka` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id_korisnik` int(11) NOT NULL,
  `ime_korisnik` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `prezime_korisnik` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `korisnicko_ime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `lozinka` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uloga_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id_korisnik`, `ime_korisnik`, `prezime_korisnik`, `korisnicko_ime`, `email`, `lozinka`, `uloga_id`) VALUES
(5, 'Aleksandra', 'Fridl', 'admin', 'bebelak@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 1),
(6, 'Mladen', 'Jeremic', 'korisnik', 'mladjica@gmail.com', '716b64c0f6bad9ac405aab3f00958dd1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `meni`
--

CREATE TABLE `meni` (
  `id_meni` int(11) NOT NULL,
  `naziv_meni` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posetioci_meni` int(11) NOT NULL,
  `admin_meni` int(11) NOT NULL,
  `korisnik_meni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meni`
--

INSERT INTO `meni` (`id_meni`, `naziv_meni`, `posetioci_meni`, `admin_meni`, `korisnik_meni`) VALUES
(1, 'Početna', 1, 0, 1),
(2, 'Program', 1, 1, 1),
(3, 'Galerija', 0, 1, 1),
(5, 'Autor', 1, 0, 0),
(6, 'Korisnici', 0, 1, 0),
(7, 'Anketa', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `odgovori`
--

CREATE TABLE `odgovori` (
  `id_odgovor` int(11) NOT NULL,
  `ime_odgovor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `glas_odgovor` int(11) NOT NULL,
  `pitanje_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `odgovori`
--

INSERT INTO `odgovori` (`id_odgovor`, `ime_odgovor`, `glas_odgovor`, `pitanje_id`) VALUES
(1, 'Ocena 1', 4, 1),
(2, 'Ocena 2', 5, 1),
(3, 'Ocena 3', 7, 1),
(4, 'Ocena 4', 1, 1),
(5, 'Ocena 5', 4, 1),
(7, 'Da', 0, 2),
(8, 'Ne', 0, 2),
(9, 'Da', 0, 5),
(10, 'Ne', 0, 5),
(11, 'Mozda', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pitanja`
--

CREATE TABLE `pitanja` (
  `id_pitanja` int(11) NOT NULL,
  `naziv_pitanja` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `aktivno_pitanje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `pitanja`
--

INSERT INTO `pitanja` (`id_pitanja`, `naziv_pitanja`, `aktivno_pitanje`) VALUES
(1, 'Ocena sajta:', 1),
(2, 'Da li znate?', 0),
(5, 'Jeste li sigurni?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `programi`
--

CREATE TABLE `programi` (
  `id_prog` int(11) NOT NULL,
  `naziv_prog` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tekst1_prog` text COLLATE utf8mb4_unicode_ci,
  `tekst2_prog` text COLLATE utf8mb4_unicode_ci,
  `tekst3_prog` text COLLATE utf8mb4_unicode_ci,
  `slikaP_id` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programi`
--

INSERT INTO `programi` (`id_prog`, `naziv_prog`, `tekst1_prog`, `tekst2_prog`, `tekst3_prog`, `slikaP_id`) VALUES
(3, 'Radionice', 'Radionice su prilika da se stekne funkcionalno znanje stečeno u školi ali i u kreativnim učionicama ovog tipa. Različite su tematike i različite uzraste dece. Osmišljavaju se krejem meseca i do početka meseca se objavljuju na oglasnoj tabli u našim prostorijama. Takođe se oslanjaju na NTC sistem učenja.', 'Ciljevi NTC sistema učenja su: <br>\n								- podizanje nivoa intelektualnih sposobnosti svih učenika koji učestvuju u programu <br>\n								- sprečavanje poremećaja pažnje i koncentracije u školskom periodu <br>\n								- razvijanje koordinacije pokreta i motorike <br>\n								- razvijanje brzine razmišljanja, povezivanja i zaključivanja (funkcionalno znanje) <br>\n								- pravovremeno uočavanje darovitih učenika i podsticanja razvoja njihovih sposobnos <br>', 'svi', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sadrzaj`
--

CREATE TABLE `sadrzaj` (
  `id_sadzaj` int(11) NOT NULL,
  `naziv_sadrzaj` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slika_sadrzaj` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tekst1_sadrzaj` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tekst2_sadrzaj` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tekst3_sadrzaj` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sadrzaj`
--

INSERT INTO `sadrzaj` (`id_sadzaj`, `naziv_sadrzaj`, `slika_sadrzaj`, `tekst1_sadrzaj`, `tekst2_sadrzaj`, `tekst3_sadrzaj`) VALUES
(1, 'imeIprezime', 'aleksandra_fridl.jpg', 'Aleksandra', 'Fridl', 'Moje ime je Aleksandra Fridl.</br> Završila sam Filozofski fakultet, smer etnologija i antropologija. </br> 						Trenutno sam na završnoj godini studija Visoke škole strukovnih studija \"ICT\".</br> 						Ovaj sajt je realizovan radi ispunjavanja predispitnih obaveza iz predmeta PHP2, profesora Nenada Kojića, </br> 						na smeru Intrnet tehnologije, modul Web programiranje.'),
(2, 'Adresa', 'Flajer2.png', 'Kreativna učionica - Sensa</br>\r\n								Svetog Save 52</br>\r\n								Lazarevac', '', ''),
(3, 'slikaItekst', 'logo.jpg', '\n', '', ''),
(4, 'tekst_kontakt', 'NTC4.jpg', 'Sensa - kreativna učionica otvorena je 2012.godinie.</br>							Nastavni program koji realizuje sprovode licencirani', 'mentori koji svojim učešćem trebaju da motivišu polaznike i organizuju nastavu.</br> \r\nMaterijal koji se koristi je propratni materijal', 'sistema učenja.');

-- --------------------------------------------------------

--
-- Table structure for table `slikeprog`
--

CREATE TABLE `slikeprog` (
  `id_slikaP` int(125) NOT NULL,
  `naziv_slika` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `putanja_slike` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slikeprog`
--

INSERT INTO `slikeprog` (`id_slikaP`, `naziv_slika`, `putanja_slike`) VALUES
(1, '	\r\nmali 2', '	\r\nShooShooMali4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `id` int(125) NOT NULL,
  `naziv_uloga` varchar(125) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uloga`
--

INSERT INTO `uloga` (`id`, `naziv_uloga`) VALUES
(1, 'admin'),
(2, 'korisnik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `galerija`
--
ALTER TABLE `galerija`
  ADD PRIMARY KEY (`id_slika`);

--
-- Indexes for table `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`id_kontakt`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id_korisnik`);

--
-- Indexes for table `meni`
--
ALTER TABLE `meni`
  ADD PRIMARY KEY (`id_meni`);

--
-- Indexes for table `odgovori`
--
ALTER TABLE `odgovori`
  ADD PRIMARY KEY (`id_odgovor`);

--
-- Indexes for table `pitanja`
--
ALTER TABLE `pitanja`
  ADD PRIMARY KEY (`id_pitanja`);

--
-- Indexes for table `programi`
--
ALTER TABLE `programi`
  ADD PRIMARY KEY (`id_prog`);

--
-- Indexes for table `sadrzaj`
--
ALTER TABLE `sadrzaj`
  ADD PRIMARY KEY (`id_sadzaj`);

--
-- Indexes for table `slikeprog`
--
ALTER TABLE `slikeprog`
  ADD PRIMARY KEY (`id_slikaP`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `galerija`
--
ALTER TABLE `galerija`
  MODIFY `id_slika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `id_kontakt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meni`
--
ALTER TABLE `meni`
  MODIFY `id_meni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `odgovori`
--
ALTER TABLE `odgovori`
  MODIFY `id_odgovor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pitanja`
--
ALTER TABLE `pitanja`
  MODIFY `id_pitanja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `programi`
--
ALTER TABLE `programi`
  MODIFY `id_prog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sadrzaj`
--
ALTER TABLE `sadrzaj`
  MODIFY `id_sadzaj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slikeprog`
--
ALTER TABLE `slikeprog`
  MODIFY `id_slikaP` int(125) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uloga`
--
ALTER TABLE `uloga`
  MODIFY `id` int(125) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
