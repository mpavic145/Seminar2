/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.8-rc : Database - Seminar2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`Seminar2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */;

USE `Seminar2`;

/*Table structure for table `Korisnici` */

DROP TABLE IF EXISTS `Korisnici`;

CREATE TABLE `Korisnici` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Ime` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Prezime` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Adresa` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Mjesto` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Poštanski_broj` int(10) unsigned NOT NULL,
  `Telefon` char(15) COLLATE utf8_croatian_ci NOT NULL,
  `Email` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Korisničko_ime` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Lozinka` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Prava_pristupa` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `Korisnici` */

/*Table structure for table `Linije` */

DROP TABLE IF EXISTS `Linije`;

CREATE TABLE `Linije` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_polazista` int(10) unsigned NOT NULL,
  `ID_odredista` int(10) unsigned NOT NULL,
  `Datum_polaska` date NOT NULL,
  `Vrijeme_polaska` time NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Polazište_linija` (`ID_polazista`),
  KEY `Odredište_linija` (`ID_odredista`),
  CONSTRAINT `Odredište_linija` FOREIGN KEY (`ID_odredista`) REFERENCES `Odrediste` (`ID`),
  CONSTRAINT `Polazište_linija` FOREIGN KEY (`ID_polazista`) REFERENCES `Polaziste` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `Linije` */

/*Table structure for table `Odrediste` */

DROP TABLE IF EXISTS `Odrediste`;

CREATE TABLE `Odrediste` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_polazista` int(10) unsigned NOT NULL,
  `Naziv` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Polazište` (`ID_polazista`),
  CONSTRAINT `Polazište` FOREIGN KEY (`ID_polazista`) REFERENCES `Polaziste` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `Odrediste` */

/*Table structure for table `Polaziste` */

DROP TABLE IF EXISTS `Polaziste`;

CREATE TABLE `Polaziste` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `Polaziste` */

/*Table structure for table `Prodajna_mjesta` */

DROP TABLE IF EXISTS `Prodajna_mjesta`;

CREATE TABLE `Prodajna_mjesta` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Naziv_mjesta` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Adresa` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Broj_telefona` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `Prodajna_mjesta` */

/*Table structure for table `Upiti` */

DROP TABLE IF EXISTS `Upiti`;

CREATE TABLE `Upiti` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Ime` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Email` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Upit` text COLLATE utf8_croatian_ci NOT NULL,
  `Datum` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `Upiti` */

/*Table structure for table `Vijesti` */

DROP TABLE IF EXISTS `Vijesti`;

CREATE TABLE `Vijesti` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_jezik` int(10) unsigned NOT NULL,
  `Naslov` varchar(25) COLLATE utf8_croatian_ci NOT NULL,
  `Kratki_opis` varchar(40) COLLATE utf8_croatian_ci NOT NULL,
  `Sadržaj` text COLLATE utf8_croatian_ci NOT NULL,
  `Slika` varchar(25) COLLATE utf8_croatian_ci DEFAULT NULL,
  `Sakrij` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `Vijesti` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
