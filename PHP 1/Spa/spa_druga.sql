-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2019 at 09:55 AM
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
-- Database: `spa_druga`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id_podaci` int(50) NOT NULL,
  `imePrezime` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` text COLLATE utf8_unicode_ci NOT NULL,
  `br_indeks` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `slika_putanja` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id_podaci`, `imePrezime`, `tekst`, `br_indeks`, `slika_putanja`) VALUES
(1, 'Aleksandra Fridl', 'Rođena sam 20. 09.1982. godine. </br>\r\nFilozofski fakultet, smer etnologija i antropologija sam završila 2011. godine.</br></br>\r\n\r\nUz veliku podršku porodice studiram Visoku ICT školu.  Kod programiranja mi se dopada to se odmah mo\\e videti reyultat svog rada.</br>\r\nImam sina od tri godine.</br> \r\nNadam se da ću se u budućnosti profesionalno baviti web programiranjem.', '311/14', 'images/af.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cenovnik`
--

CREATE TABLE `cenovnik` (
  `id_cenovnik` int(50) NOT NULL,
  `naslov` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` text COLLATE utf8_unicode_ci NOT NULL,
  `cena` int(50) NOT NULL,
  `slika_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cenovnik`
--

INSERT INTO `cenovnik` (`id_cenovnik`, `naslov`, `tekst`, `cena`, `slika_id`) VALUES
(1, 'Masaža celog tela', 'Masaža celog tela podrazumeva masažu leđa, nogu, ruku i stopala. Poboljšava cirkulaciju i vraća osećaj energije u celom telu.', 1800, 1),
(2, 'Masaža stopala', 'Masaža stopala opušta i osvežava organizam i daje osećaj lakoće nogu. Učinak je isti kao kod masaže celog tela.', 900, 2),
(3, 'Masaža glave', 'Opuštajuća masaža glave se koristi u smanjenju stresa i napetosti. Radi se kod slabe koncentracije i hroničnih glavobolja.', 900, 3),
(4, 'Masaža leđa', 'Ova masaža ima blaotvorno dejstvo na ceo organizam jer otklanja sve blokade i nakupljeni stres u organizmu.', 1200, 4),
(5, 'Masaža nogu', 'Masažom nogu se pospešuje cirkulacija što predstavlja prevenciju bolesti krvnih sudova i ublazavanja osećaja teskih I otecenih nogu.', 1000, 5),
(6, 'Maderoterapija', 'Ovo je poseban vid anticelulit masaže kojom se postiže duplo brži rezultati a u osnovi je stimulacija limfne drenaže.', 2500, 6);

-- --------------------------------------------------------

--
-- Table structure for table `kontakt`
--

CREATE TABLE `kontakt` (
  `id_kontakt` int(50) NOT NULL,
  `imePrezime` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `poruka` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kontakt`
--

INSERT INTO `kontakt` (`id_kontakt`, `imePrezime`, `email`, `poruka`) VALUES
(5, 'Milan Milanovic', 'miki@gmail.com', 'ghjhdf');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id_korisnik` int(50) NOT NULL,
  `ime_korisnik` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `prezime_korisnik` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `korisnicko_ime` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `lozinka` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `uloga_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id_korisnik`, `ime_korisnik`, `prezime_korisnik`, `korisnicko_ime`, `email`, `lozinka`, `uloga_id`) VALUES
(10, 'Aleksandra', 'Fridl', 'alex4', 'korisnik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2),
(14, 'Sonja', 'Damjanovic', 'SonjaD', 'sonja@gmail.com', '59e109b171f9f636ac60bf4513680f9c', 2),
(15, 'David', 'Jeremic', 'davidMA', 'david@gmail.com', '249f57cf3ca4282dd7fb3732e817ed53', 1),
(17, 'Korisnik', 'Korisnik', 'korisnik', 'korisnik@gmail.com', '716b64c0f6bad9ac405aab3f00958dd1', 2),
(20, 'Aleksandra', 'Fridl', 'administrator', 'admin@gmail.com', 'fc1ebc848e31e0a68e868432225e3c82', 1);

-- --------------------------------------------------------

--
-- Table structure for table `meni`
--

CREATE TABLE `meni` (
  `id_meni` int(50) NOT NULL,
  `naziv_meni` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `korisnik_meni` int(50) NOT NULL,
  `admin_meni` int(50) NOT NULL,
  `posetioc_meni` int(50) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meni`
--

INSERT INTO `meni` (`id_meni`, `naziv_meni`, `korisnik_meni`, `admin_meni`, `posetioc_meni`, `link`) VALUES
(1, 'Početna', 0, 0, 1, 'spaIndex'),
(2, 'Zakaži', 1, 1, 1, 'zakazi'),
(3, 'Cene', 0, 0, 1, 'cene'),
(5, 'Autor', 0, 0, 1, 'autor'),
(6, 'Početna', 0, 1, 0, 'admin_spaIndex'),
(7, 'Cene', 0, 1, 0, 'admin_cene'),
(8, 'Zakazani', 1, 1, 0, 'pregled_zakazanih'),
(9, 'Korisnici', 0, 1, 0, 'admin_korisnici'),
(11, 'Otkazani', 1, 1, 0, 'pregled_otkazanih'),
(12, 'Anketa', 0, 1, 0, 'admin_anketa'),
(14, 'Kontakt', 1, 0, 0, 'kontakt');

-- --------------------------------------------------------

--
-- Table structure for table `odabrani_termin`
--

CREATE TABLE `odabrani_termin` (
  `id_odabrani` int(50) NOT NULL,
  `naziv_termin` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `odabrani_termin`
--

INSERT INTO `odabrani_termin` (`id_odabrani`, `naziv_termin`) VALUES
(1, '9 - 10'),
(2, '10 - 11'),
(3, '12 - 13'),
(4, '14 - 15'),
(5, '16 - 17');

-- --------------------------------------------------------

--
-- Table structure for table `odgovori`
--

CREATE TABLE `odgovori` (
  `id_odgovor` int(50) NOT NULL,
  `ime_odgovor` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `glas_odgovor` int(50) NOT NULL,
  `pitanja_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `odgovori`
--

INSERT INTO `odgovori` (`id_odgovor`, `ime_odgovor`, `glas_odgovor`, `pitanja_id`) VALUES
(1, 'Ocena 1', 1, 1),
(2, 'Ocena 2', 2, 1),
(3, 'Ocena 3', 10, 1),
(4, 'Ocena 4', 10, 1),
(5, 'Ocena 5', 22, 1),
(15, 'Da', 0, 22),
(16, 'Ne', 0, 22);

-- --------------------------------------------------------

--
-- Table structure for table `pitanja`
--

CREATE TABLE `pitanja` (
  `id_pitanja` int(50) NOT NULL,
  `naziv_pitanja` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `aktivno_pitanje` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pitanja`
--

INSERT INTO `pitanja` (`id_pitanja`, `naziv_pitanja`, `aktivno_pitanje`) VALUES
(1, 'Ocenite sajt:', 1),
(22, 'Da li vam se svidja sajt?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `slika`
--

CREATE TABLE `slika` (
  `id_slika` int(50) NOT NULL,
  `putanja_slika` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `naziv_slike` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slika`
--

INSERT INTO `slika` (`id_slika`, `putanja_slika`, `naziv_slike`) VALUES
(1, 'images/slide-1.jpg', 'Masaža celog tela'),
(2, 'images/foot-treatment.jpg', 'Masaža stopala'),
(3, 'images/hair-treatment.jpg', 'Masaža glave'),
(4, 'images/slide-3.jpg', 'Masaža leđa'),
(5, 'images/massage-calf-xl1.jpg', 'Masaža nogu'),
(6, 'images/maderoterapija1.jpg', 'Maderoterapija');

-- --------------------------------------------------------

--
-- Table structure for table `status_termin`
--

CREATE TABLE `status_termin` (
  `id_status` int(50) NOT NULL,
  `naziv_status` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status_termin`
--

INSERT INTO `status_termin` (`id_status`, `naziv_status`) VALUES
(1, 'zakazan'),
(2, 'otkazan');

-- --------------------------------------------------------

--
-- Table structure for table `tip_usluge`
--

CREATE TABLE `tip_usluge` (
  `id_usluga` int(50) NOT NULL,
  `naziv_usluge` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tip_usluge`
--

INSERT INTO `tip_usluge` (`id_usluga`, `naziv_usluge`) VALUES
(1, 'Masaža celog tela'),
(2, 'Masaža stopala'),
(3, 'Masaža glave'),
(4, 'Masaža leđa'),
(5, 'Masaža nogu'),
(6, 'Maderoterapija');

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `id_uloga` int(50) NOT NULL,
  `naziv_uloga` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uloga`
--

INSERT INTO `uloga` (`id_uloga`, `naziv_uloga`) VALUES
(1, 'admin'),
(2, 'korisnik');

-- --------------------------------------------------------

--
-- Table structure for table `zakazani_termini`
--

CREATE TABLE `zakazani_termini` (
  `id_termin` int(50) NOT NULL,
  `ime` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datum_termina` date NOT NULL,
  `br_tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `usluga_id` int(50) NOT NULL,
  `status_termina_id` int(50) NOT NULL,
  `odabrani_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zakazani_termini`
--

INSERT INTO `zakazani_termini` (`id_termin`, `ime`, `prezime`, `email`, `datum_termina`, `br_tel`, `usluga_id`, `status_termina_id`, `odabrani_id`) VALUES
(2, 'Aleksandra', 'Fridl', 'bebelak@gmail.com', '2018-06-27', '069/2610393', 6, 2, 2),
(3, 'Aleksandra', 'Fridl', 'bebelak@gmail.com', '2018-06-28', '069/2610393', 1, 2, 4),
(4, 'Aleksandra', 'Fridl', 'bebelak@gmail.com', '2018-06-29', '069/2610393', 1, 2, 4),
(5, 'Aleksandra', 'Fridl', 'bebelak@gmail.com', '2018-06-28', '069/2610393', 6, 2, 1),
(6, 'Aleksandra', 'Fridl', 'bebelak@gmail.com', '2018-06-30', '069/2610393', 4, 1, 3),
(7, 'Aleksandra', 'Fridl', 'bebelak@gmail.com', '2018-06-28', '069/2610393', 2, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_podaci`);

--
-- Indexes for table `cenovnik`
--
ALTER TABLE `cenovnik`
  ADD PRIMARY KEY (`id_cenovnik`),
  ADD KEY `slika_id` (`slika_id`);

--
-- Indexes for table `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`id_kontakt`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id_korisnik`),
  ADD KEY `uloga_id` (`uloga_id`);

--
-- Indexes for table `meni`
--
ALTER TABLE `meni`
  ADD PRIMARY KEY (`id_meni`);

--
-- Indexes for table `odabrani_termin`
--
ALTER TABLE `odabrani_termin`
  ADD PRIMARY KEY (`id_odabrani`);

--
-- Indexes for table `odgovori`
--
ALTER TABLE `odgovori`
  ADD PRIMARY KEY (`id_odgovor`),
  ADD KEY `id_pitanja` (`pitanja_id`);

--
-- Indexes for table `pitanja`
--
ALTER TABLE `pitanja`
  ADD PRIMARY KEY (`id_pitanja`);

--
-- Indexes for table `slika`
--
ALTER TABLE `slika`
  ADD PRIMARY KEY (`id_slika`);

--
-- Indexes for table `status_termin`
--
ALTER TABLE `status_termin`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tip_usluge`
--
ALTER TABLE `tip_usluge`
  ADD PRIMARY KEY (`id_usluga`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`id_uloga`);

--
-- Indexes for table `zakazani_termini`
--
ALTER TABLE `zakazani_termini`
  ADD PRIMARY KEY (`id_termin`),
  ADD KEY `usluga_id` (`usluga_id`),
  ADD KEY `status_termina_id` (`status_termina_id`),
  ADD KEY `odabrani_id` (`odabrani_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id_podaci` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cenovnik`
--
ALTER TABLE `cenovnik`
  MODIFY `id_cenovnik` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `id_kontakt` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnik` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `meni`
--
ALTER TABLE `meni`
  MODIFY `id_meni` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `odabrani_termin`
--
ALTER TABLE `odabrani_termin`
  MODIFY `id_odabrani` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `odgovori`
--
ALTER TABLE `odgovori`
  MODIFY `id_odgovor` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pitanja`
--
ALTER TABLE `pitanja`
  MODIFY `id_pitanja` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `slika`
--
ALTER TABLE `slika`
  MODIFY `id_slika` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status_termin`
--
ALTER TABLE `status_termin`
  MODIFY `id_status` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tip_usluge`
--
ALTER TABLE `tip_usluge`
  MODIFY `id_usluga` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uloga`
--
ALTER TABLE `uloga`
  MODIFY `id_uloga` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zakazani_termini`
--
ALTER TABLE `zakazani_termini`
  MODIFY `id_termin` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cenovnik`
--
ALTER TABLE `cenovnik`
  ADD CONSTRAINT `cenovnik_ibfk_1` FOREIGN KEY (`slika_id`) REFERENCES `slika` (`id_slika`);

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `korisnik_ibfk_1` FOREIGN KEY (`uloga_id`) REFERENCES `uloga` (`id_uloga`);

--
-- Constraints for table `odgovori`
--
ALTER TABLE `odgovori`
  ADD CONSTRAINT `odgovori_ibfk_1` FOREIGN KEY (`pitanja_id`) REFERENCES `pitanja` (`id_pitanja`);

--
-- Constraints for table `zakazani_termini`
--
ALTER TABLE `zakazani_termini`
  ADD CONSTRAINT `zakazani_termini_ibfk_1` FOREIGN KEY (`status_termina_id`) REFERENCES `status_termin` (`id_status`),
  ADD CONSTRAINT `zakazani_termini_ibfk_2` FOREIGN KEY (`usluga_id`) REFERENCES `tip_usluge` (`id_usluga`),
  ADD CONSTRAINT `zakazani_termini_ibfk_3` FOREIGN KEY (`odabrani_id`) REFERENCES `odabrani_termin` (`id_odabrani`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
