-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: IIMJavaWeb
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Material`
--

DROP TABLE IF EXISTS `Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Material` (
  `Id` int(11) NOT NULL,
  `ArticleNr` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `Name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Price` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Material`
--

LOCK TABLES `Material` WRITE;
/*!40000 ALTER TABLE `Material` DISABLE KEYS */;
INSERT INTO `Material` VALUES (1,'WB01','Wereldbol voor de aardrijkskundelessen','Wereldbol',10),(2,'RB01','Rugbybal voor de LO-lessen','Rugbybal',15),(3,'LT01','Grote lat voor op bord','Lat',14);
/*!40000 ALTER TABLE `Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservation` (
  `Id` int(11) NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `User_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Reservation_User1_idx` (`User_id`),
  CONSTRAINT `fk_Reservation_User1` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (1,'2016-05-01 00:00:00','2016-05-04 00:00:00','2016-05-08 00:00:00',1),(2,'2016-05-07 00:00:00','2016-05-15 00:00:00','2016-05-19 00:00:00',1);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReservationDetail`
--

DROP TABLE IF EXISTS `ReservationDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReservationDetail` (
  `Id` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `PickUpDate` datetime DEFAULT NULL,
  `BroughtBackDate` datetime DEFAULT NULL,
  `Reservation_Id` int(11) NOT NULL,
  `Material_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_ReservationDetail_Reservation_idx` (`Reservation_Id`),
  KEY `fk_ReservationDetail_Material1_idx` (`Material_Id`),
  CONSTRAINT `fk_ReservationDetail_Material1` FOREIGN KEY (`Material_Id`) REFERENCES `Material` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservationDetail_Reservation` FOREIGN KEY (`Reservation_Id`) REFERENCES `Reservation` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReservationDetail`
--

LOCK TABLES `ReservationDetail` WRITE;
/*!40000 ALTER TABLE `ReservationDetail` DISABLE KEYS */;
INSERT INTO `ReservationDetail` VALUES (1,3,'2016-05-04 00:00:00','2016-05-08 00:00:00',1,1),(2,2,'2016-05-04 00:00:00','2016-05-08 00:00:00',1,3),(3,5,'2016-05-15 00:00:00',NULL,2,2);
/*!40000 ALTER TABLE `ReservationDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `LastName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Email` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `Password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Matthias','Seghers',0,'matthiasseghers@icloud.com','test01'),(2,'Pieter','Willaert',1,'pieterwillaert@hotmail.com','MatthiasIsCool');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-10 17:00:13
