-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2020 at 08:25 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `baza`
--
CREATE DATABASE IF NOT EXISTS `baza` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `baza`;

-- --------------------------------------------------------

--
-- Table structure for table `combustibil`
--

CREATE TABLE IF NOT EXISTS `combustibil` (
  `cod_comb` int(1) NOT NULL AUTO_INCREMENT,
  `nume_comb` varchar(20) NOT NULL,
  `unit_masura` varchar(10) NOT NULL,
  `cost_unit` int(2) NOT NULL,
  PRIMARY KEY (`cod_comb`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `combustibil`
--

INSERT INTO `combustibil` (`cod_comb`, `nume_comb`, `unit_masura`, `cost_unit`) VALUES
(1, 'GPL', 'l', 3),
(2, 'Benzina', 'l', 5),
(3, 'Motorina', 'l', 5);

-- --------------------------------------------------------

--
-- Table structure for table `curse`
--

CREATE TABLE IF NOT EXISTS `curse` (
  `cod_cursa` int(6) NOT NULL AUTO_INCREMENT,
  `cod_masina` int(3) NOT NULL,
  `cod_sofer` int(3) NOT NULL,
  `nr_km` decimal(5,2) NOT NULL,
  `cant_combustibil` decimal(2,1) NOT NULL,
  `suma` int(3) NOT NULL,
  `nr_factura` int(6) NOT NULL,
  `data_factura` date NOT NULL,
  PRIMARY KEY (`cod_cursa`),
  UNIQUE KEY `nr_factura` (`nr_factura`),
  KEY `cod_masina` (`cod_masina`),
  KEY `cod_sofer` (`cod_sofer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `curse`
--

INSERT INTO `curse` (`cod_cursa`, `cod_masina`, `cod_sofer`, `nr_km`, `cant_combustibil`, `suma`, `nr_factura`, `data_factura`) VALUES
(1, 1, 1, '3.80', '0.3', 9, 108923, '2020-05-26'),
(2, 1, 1, '2.50', '0.2', 6, 103748, '2020-05-26'),
(3, 1, 1, '4.00', '0.4', 12, 104621, '2020-05-28'),
(5, 2, 2, '2.50', '0.3', 7, 120372, '2020-05-28'),
(6, 2, 2, '4.30', '0.5', 13, 109932, '2020-05-28'),
(8, 2, 2, '7.00', '0.7', 18, 204735, '2020-05-28'),
(11, 3, 3, '2.40', '0.3', 8, 102879, '2020-05-28'),
(12, 4, 4, '5.00', '0.5', 10, 193763, '2020-05-28'),
(13, 4, 4, '2.00', '0.2', 6, 109871, '2020-05-28'),
(14, 4, 4, '9.00', '1.0', 20, 102988, '2020-05-28'),
(15, 5, 5, '1.00', '0.2', 4, 109000, '2020-05-28'),
(16, 5, 5, '10.00', '1.0', 24, 198777, '2020-05-28'),
(20, 5, 5, '6.30', '0.5', 16, 109655, '2020-05-29'),
(21, 6, 6, '3.20', '0.3', 9, 167365, '2020-05-29'),
(22, 6, 6, '1.50', '0.1', 5, 108765, '2020-05-28'),
(23, 6, 6, '2.90', '0.3', 8, 897675, '2020-05-28'),
(24, 7, 7, '1.40', '0.1', 5, 198722, '2020-05-28'),
(25, 7, 7, '2.30', '0.2', 6, 102345, '2020-05-28'),
(28, 1, 1, '3.00', '0.4', 7, 109222, '2020-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `masini`
--

CREATE TABLE IF NOT EXISTS `masini` (
  `cod_masina` int(3) NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) NOT NULL,
  `model` varchar(20) NOT NULL,
  `an_fabr` int(4) NOT NULL,
  `serie_sasiu` varchar(16) NOT NULL,
  `cod_comb` int(1) NOT NULL,
  `tarif_km` int(1) NOT NULL,
  `cap_rezervor` int(3) NOT NULL,
  `nr_inmatr` varchar(7) NOT NULL,
  `data_revizie` date NOT NULL,
  `nr_rca` int(6) NOT NULL,
  `nr_casco` int(6) NOT NULL,
  `nr_km` int(6) NOT NULL,
  PRIMARY KEY (`cod_masina`),
  UNIQUE KEY `nr_inmatr` (`nr_inmatr`),
  KEY `cod_comb` (`cod_comb`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `masini`
--

INSERT INTO `masini` (`cod_masina`, `marca`, `model`, `an_fabr`, `serie_sasiu`, `cod_comb`, `tarif_km`, `cap_rezervor`, `nr_inmatr`, `data_revizie`, `nr_rca`, `nr_casco`, `nr_km`) VALUES
(1, 'Dacia', 'Logan', 2010, '5372638471628758', 1, 2, 70, 'IS02XTI', '2019-09-12', 874928, 645274, 259865),
(2, 'Opel', 'Astra', 2012, '6475284719473804', 3, 2, 65, 'IS87HTY', '2020-02-11', 645372, 645372, 186573),
(3, 'Renault', 'Clio', 2015, '3647284729485647', 3, 2, 90, 'IS87UNI', '2020-01-30', 937464, 967584, 105837),
(4, 'Mercedes', 'GLA', 2018, '2734658765745362', 3, 3, 100, 'IS76ONL', '2019-10-12', 867036, 546025, 30867),
(5, 'BMW', 'M3', 2013, '7685947301248045', 2, 3, 95, 'IS40HRB', '2020-04-06', 657463, 908546, 230586),
(6, 'Volkswagen', 'Passat', 2016, '4657253698076512', 2, 2, 75, 'IS87RHY', '2020-02-15', 766298, 546234, 158235),
(7, 'Volkswagen', 'Golf 4', 2013, '7685947525347654', 2, 2, 70, 'IS81JML', '2020-03-04', 746098, 647819, 210980),
(8, 'Audi', 'A4', 2019, '4657981490361527', 3, 3, 80, 'IS73BNS', '2019-11-13', 657920, 541738, 25890),
(11, 'Renault', 'Megane', 2015, '9485637462718374', 1, 2, 70, 'IS08OPN', '2019-03-17', 958365, 987654, 108967);

-- --------------------------------------------------------

--
-- Table structure for table `membri`
--

CREATE TABLE IF NOT EXISTS `membri` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `usertype` varchar(10) NOT NULL,
  `nume` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `regdate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `membri`
--

INSERT INTO `membri` (`id`, `usertype`, `nume`, `email`, `username`, `password`, `regdate`) VALUES
(1, 'sofer', 'Ion Radu', 'ion.radu@gmail.com', 'ion', 'ionion', '2020-05-19'),
(2, 'admin', 'Andrei Barbu', 'andrei.barbu@startaxi.ro', 'admin', 'adminadmin', '2020-05-19'),
(3, 'manager', 'Radulescu Anda', 'anda.radulescu@startaxi.ro', 'anda', 'andaanda', '2020-05-20'),
(4, 'sofer', 'Roban Luca', 'roban.luca@gmail.com', 'luca', 'lucaluca', '2020-05-20'),
(5, 'sofer', 'Ardeleanu Sandu', 'ardeleanu.sandu@gmail.com', 'sandu', 'sandusandu', '2020-05-20'),
(9, 'sofer', 'Antal Razvan', 'antal.razvan@gmail.com', 'antal', 'antalantal', '2020-05-20'),
(10, 'sofer', 'Damian Timofte', 'damian.timofte@hotmail.com', 'damian', 'damiandamian', '2020-05-20'),
(11, 'sofer', 'Alexandru Mihai', 'alex.mihai@yahoo.ro', 'mihai', 'mihaimihai', '2020-05-20'),
(12, 'sofer', 'Adrian Atanasie', 'adrian.atanasie@gmail.com', 'adrian', 'adrianadrian', '2020-05-26'),
(13, 'sofer', 'Alex Mihailescu', 'alex.mihailescu@gmail.com', 'alex', 'alexalex', '2020-05-26'),
(24, 'sofer', 'a', '', '', '', '2020-05-29'),
(25, 'sofer', 'a', '', '', '', '2020-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `soferi`
--

CREATE TABLE IF NOT EXISTS `soferi` (
  `cod_sofer` int(3) NOT NULL AUTO_INCREMENT,
  `nume_prenume` varchar(30) NOT NULL,
  `cnp` bigint(13) NOT NULL,
  `serie_ci` varchar(2) NOT NULL,
  `numar_ci` int(6) NOT NULL,
  `an_permis` int(4) NOT NULL,
  `cont` varchar(15) NOT NULL,
  `parola` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_sofer`),
  UNIQUE KEY `cnp` (`cnp`,`cont`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `soferi`
--

INSERT INTO `soferi` (`cod_sofer`, `nume_prenume`, `cnp`, `serie_ci`, `numar_ci`, `an_permis`, `cont`, `parola`) VALUES
(1, 'Ion Radu', 1747483647891, 'IS', 746354, 2005, 'ion', 'ionion'),
(2, 'Roban Luca', 1920112397803, 'IS', 746253, 2014, 'luca', 'lucaluca'),
(3, 'Ardeleanu Sandu', 1950604170551, 'IS', 756109, 2015, 'sandu', 'sandusandu'),
(4, 'Antal Razvan', 1921126279055, 'IS', 859763, 2010, 'antal', 'antalantal'),
(5, 'Damian Timofte', 1871209125319, 'IS', 958087, 2008, 'damian', 'damiandamian'),
(6, 'Alexandru Mihai', 1860520066807, 'IS', 736826, 2013, 'mihai', 'mihaimihai'),
(7, 'Adrian Atanasie', 1910213257103, 'IS', 736452, 2018, 'adrian', 'adrianadrian'),
(8, 'Alex Mihailescu', 1930522190481, 'IS', 947612, 2016, 'alex', 'alexalex');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `curse`
--
ALTER TABLE `curse`
  ADD CONSTRAINT `curse_ibfk_1` FOREIGN KEY (`cod_masina`) REFERENCES `masini` (`cod_masina`),
  ADD CONSTRAINT `curse_ibfk_2` FOREIGN KEY (`cod_sofer`) REFERENCES `soferi` (`cod_sofer`);

--
-- Constraints for table `masini`
--
ALTER TABLE `masini`
  ADD CONSTRAINT `masini_ibfk_1` FOREIGN KEY (`cod_comb`) REFERENCES `combustibil` (`cod_comb`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
