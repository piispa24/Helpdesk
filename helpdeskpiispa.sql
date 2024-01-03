-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 26.03.2023 klo 10:57
-- Palvelimen versio: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdeskpiispa`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `ratkaisut`
--

CREATE TABLE `ratkaisut` (
  `ratkaisuID` int(11) NOT NULL,
  `ratkaisu` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `ratkaisut`
--

INSERT INTO `ratkaisut` (`ratkaisuID`, `ratkaisu`) VALUES
(1, 'Mahdollinen'),
(2, 'Muunnettava'),
(3, 'Säilytettävä');

-- --------------------------------------------------------

--
-- Rakenne taululle `roolit`
--

CREATE TABLE `roolit` (
  `rooliID` int(11) NOT NULL,
  `rooli` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `roolit`
--

INSERT INTO `roolit` (`rooliID`, `rooli`) VALUES
(1, 'Käyttäjä'),
(2, 'Suunnittelija'),
(3, 'Tukihenkilö'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Rakenne taululle `status`
--

CREATE TABLE `status` (
  `statusID` int(11) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `status`
--

INSERT INTO `status` (`statusID`, `status`) VALUES
(1, 'Avoin'),
(2, 'Työn alla'),
(3, 'Suljettu');

-- --------------------------------------------------------

--
-- Rakenne taululle `tiketit`
--

CREATE TABLE `tiketit` (
  `tikettiID` int(11) NOT NULL,
  `statusID` int(11) NOT NULL,
  `ratkaisuID` int(11) NOT NULL,
  `tyontekijaID` int(11) NOT NULL,
  `asia` text NOT NULL,
  `asiakasnimi` varchar(30) NOT NULL,
  `asiakassposti` varchar(30) NOT NULL,
  `kirjauspaiva` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `tiketit`
--

INSERT INTO `tiketit` (`tikettiID`, `statusID`, `ratkaisuID`, `tyontekijaID`, `asia`, `asiakasnimi`, `asiakassposti`, `kirjauspaiva`) VALUES
(1, 3, 2, 1, 'Mikään ei toimi taaskaan, paska sovellus', 'Joonas Piispanen', 'jpiispanen@jotain.fi', '2023-03-14 15:37:23'),
(10, 2, 1, 1, 'sgwre', 'wegwe', 'wef', '2023-03-24 10:04:47'),
(11, 2, 2, 2, 'kfoqewkfweokf', 'hessukka', 'hessukka@gsogmpsro.fi', '2023-03-24 12:54:31'),
(12, 3, 2, 3, 'Aika vaikeata tämä homma', 'vaikea asiakas', 'vasikka@jee.fi', '2023-03-24 14:12:07'),
(13, 1, 1, 3, 'Mahdollisesti tästä saa jonkun väsäyksen aikaan', 'Väsääjä Veikko', 'väve@gggg.fi', '2023-03-25 12:16:36'),
(14, 3, 2, 9, 'ihcodshfcsoif', 'jfpowejfpowefjpj', 'jpiowejfpiowejf', '2023-03-25 13:02:46'),
(15, 1, 3, 6, 'asiani on tämä', 'h h', 'kkk@kk.fi', '2023-03-25 13:05:08');

-- --------------------------------------------------------

--
-- Rakenne taululle `tyontekijat`
--

CREATE TABLE `tyontekijat` (
  `tyontekijaID` int(11) NOT NULL,
  `nimi` varchar(40) NOT NULL,
  `tunnus` varchar(15) NOT NULL,
  `salasana` varchar(30) NOT NULL,
  `sposti` varchar(40) NOT NULL,
  `rooliID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `tyontekijat`
--

INSERT INTO `tyontekijat` (`tyontekijaID`, `nimi`, `tunnus`, `salasana`, `sposti`, `rooliID`) VALUES
(1, 'Tuukka Räihä', 'traiha', 'traiha', 'traiha@jotain.fi', 1),
(2, 'Hessu Hopo', 'hhopo', 'hhopo', 'hhopo@jotain.fi', 2),
(3, 'Floki Koira', 'fkoira', 'fkoira', 'fkoira@jtotain.fi', 3),
(5, 'Juuso Pylly', 'jpylly', 'jpylly', 'jpylly@perse.fi', 2),
(6, 'Iida Ylitalo', 'iyli', 'iyli', 'iyli@hehhheeee.fi', 2),
(9, 'Joonas Piispanen', 'jpiispanen', 'jpiispanen', 'jpiispanen@gmail.com', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ratkaisut`
--
ALTER TABLE `ratkaisut`
  ADD PRIMARY KEY (`ratkaisuID`);

--
-- Indexes for table `roolit`
--
ALTER TABLE `roolit`
  ADD PRIMARY KEY (`rooliID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusID`);

--
-- Indexes for table `tiketit`
--
ALTER TABLE `tiketit`
  ADD PRIMARY KEY (`tikettiID`),
  ADD KEY `statusID` (`statusID`),
  ADD KEY `ratkaisuID` (`ratkaisuID`),
  ADD KEY `tyontekijaID` (`tyontekijaID`);

--
-- Indexes for table `tyontekijat`
--
ALTER TABLE `tyontekijat`
  ADD PRIMARY KEY (`tyontekijaID`),
  ADD KEY `rooliID` (`rooliID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ratkaisut`
--
ALTER TABLE `ratkaisut`
  MODIFY `ratkaisuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roolit`
--
ALTER TABLE `roolit`
  MODIFY `rooliID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tiketit`
--
ALTER TABLE `tiketit`
  MODIFY `tikettiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tyontekijat`
--
ALTER TABLE `tyontekijat`
  MODIFY `tyontekijaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `tiketit`
--
ALTER TABLE `tiketit`
  ADD CONSTRAINT `tiketit_ibfk_1` FOREIGN KEY (`ratkaisuID`) REFERENCES `ratkaisut` (`ratkaisuID`),
  ADD CONSTRAINT `tiketit_ibfk_2` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`),
  ADD CONSTRAINT `tiketit_ibfk_3` FOREIGN KEY (`tyontekijaID`) REFERENCES `tyontekijat` (`tyontekijaID`);

--
-- Rajoitteet taululle `tyontekijat`
--
ALTER TABLE `tyontekijat`
  ADD CONSTRAINT `tyontekijat_ibfk_1` FOREIGN KEY (`rooliID`) REFERENCES `roolit` (`rooliID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
