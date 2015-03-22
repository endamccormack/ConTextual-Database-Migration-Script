-- MySQL dump 10.13  Distrib 5.6.21, for osx10.10 (x86_64)
--
-- Host: localhost    Database: mydb
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
-- Drop and create database
--

DROP DATABASE IF EXISTS contextual;
CREATE DATABASE contextual;

USE contextual;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'EndaCorp'),(2,'EndaCorp'),(3,'Enda\'s Emporium'),(4,'EndaCorp');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Advertisement`
--

DROP TABLE IF EXISTS `Advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Context` varchar(45) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Content` text,
  `Campaign_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Advertisement_Campaign1_idx` (`Campaign_id`),
  CONSTRAINT `fk_Advertisement_Campaign1` FOREIGN KEY (`Campaign_id`) REFERENCES `Campaign` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advertisement`
--

LOCK TABLES `Advertisement` WRITE;
/*!40000 ALTER TABLE `Advertisement` DISABLE KEYS */;
INSERT INTO `Advertisement` VALUES (1,'Coffee','Starbucks O\'Connell street','in Starbucks O\'Connell street',1),(2,'Coffee','Starbucks Westmorland street','in Starbucks Westmorland street',1),(3,'Coffee','Startbucks Templebar','in Starbucks on Templebar',1),(4,'Coffee','Starbucks Barrow steet','in Starbucks Barrow street',1),(6,'Coffee','Starbucks Orange street','in Starbucks on Orange street',1),(8,'Coffee','Starbucks IPod street','in Starbucks on IPod street',1),(9,'Coffee','Starbucks Fan street','in Starbucks on Fan Street',1),(10,'Coffee','Starbucks Router Steet','in Starbucks on Router street',1),(11,'Coffee','Starbucks Raspberry Pi Street','in Starbuck on Raspberry Pi Street',1),(14,'Coffee','Starbucks Whiteboard street','in Starbucks on Whiteboard Street',1),(15,'Coffee','Starbucks Printer street','in Starbucks on Printer street',1),(16,'Coffee','Starbucks TARDIS street','in Starbucks in the TARDIS',1),(17,'gejknjknegnj','ekjjkegnjkeg','newjnkgjknwkjn',4);
/*!40000 ALTER TABLE `Advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuctionResult`
--

DROP TABLE IF EXISTS `AuctionResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuctionResult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `Context` varchar(45) DEFAULT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Content` text,
  `BidId` int(11) DEFAULT NULL,
  `StreetAddress` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `PostCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuctionResult`
--

LOCK TABLES `AuctionResult` WRITE;
/*!40000 ALTER TABLE `AuctionResult` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuctionResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Advertisement_id` int(11) NOT NULL,
  `Location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Bid_Advertisement1_idx` (`Advertisement_id`),
  KEY `fk_Bid_Location1_idx` (`Location_id`),
  CONSTRAINT `fk_Bid_Location1` FOREIGN KEY (`Location_id`) REFERENCES `Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid`
--

LOCK TABLES `Bid` WRITE;
/*!40000 ALTER TABLE `Bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campaign`
--

DROP TABLE IF EXISTS `Campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` text,
  `Account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Campaign_Account1_idx` (`Account_id`),
  CONSTRAINT `fk_Campaign_Account1` FOREIGN KEY (`Account_id`) REFERENCES `Account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campaign`
--

LOCK TABLES `Campaign` WRITE;
/*!40000 ALTER TABLE `Campaign` DISABLE KEYS */;
INSERT INTO `Campaign` VALUES (1,'Worldwide Organic coffee campaign','this campaign is to show off our fairtrade status',1),(2,'aflniefjnjn','jknwkjjsefbjqbjefjbfeefjlflnqefkln',1),(4,'aflknnefinj','jnsdjknfejkndsfjnkefjknejwfnkjknfejknfe',1);
/*!40000 ALTER TABLE `Campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StreetAddress` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `PostCode` varchar(45) DEFAULT NULL,
  `xGeoLocation` varchar(45) DEFAULT NULL,
  `yGeoLocation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentDetail`
--

DROP TABLE IF EXISTS `PaymentDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CardNumber` varchar(45) NOT NULL,
  `ExpiryDate` varchar(45) NOT NULL,
  `CardHolderName` varchar(255) NOT NULL,
  `CSV` varchar(45) DEFAULT NULL,
  `CardType` varchar(45) NOT NULL,
  `Account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PaymentDetail_Account1_idx` (`Account_id`),
  CONSTRAINT `fk_PaymentDetail_Account1` FOREIGN KEY (`Account_id`) REFERENCES `Account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentDetail`
--

LOCK TABLES `PaymentDetail` WRITE;
/*!40000 ALTER TABLE `PaymentDetail` DISABLE KEYS */;
INSERT INTO `PaymentDetail` VALUES (1,'1234567890','02/17','John Smith','123','Visa',1),(2,'2234567890','04/17','Jane Smith','321','MasterCard',1);
/*!40000 ALTER TABLE `PaymentDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `EmailAddress` varchar(100) NOT NULL,
  `FirstName` varchar(128) DEFAULT NULL,
  `LastName` varchar(128) DEFAULT NULL,
  `JobTitle` varchar(128) DEFAULT NULL,
  `Role` varchar(45) DEFAULT NULL COMMENT '	',
  `Account_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`EmailAddress`),
  KEY `fk_User_Account_idx` (`Account_id`),
  CONSTRAINT `fk_User_Account` FOREIGN KEY (`Account_id`) REFERENCES `Account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('Enda@gmail.com','Enda','McCormack','Helicopter','admin',1,'93bba116c9e12eefb34c37cffa9ec391a9c7d4d8cc3de3663374ba67b5a9ec07'),('g@g.com','Ender','derp','Knobb','Wizard',1,'otherPassword');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Detail` varchar(255) DEFAULT NULL,
  `Lat` varchar(45) DEFAULT NULL,
  `Long` varchar(45) DEFAULT NULL,
  `Account_id` int(11) DEFAULT NULL,
  `Campaign_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Account_idx` (`Account_id`),
  KEY `fk_Campaign_idx` (`Campaign_id`),
  CONSTRAINT `fk_Account` FOREIGN KEY (`Account_id`) REFERENCES `Account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Campaign` FOREIGN KEY (`Campaign_id`) REFERENCES `Campaign` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,'Dublin','Sales improve +5% in the last week','53.347754',' -6.250511',1,4),(2,'Cork','Sales improve +5% in the last week','51.903663','-8.392923',1,4),(3,'Limerick','Sales improve +5% in the last week','52.666717','-8.631513',1,4),(4,'Galway','Sales improve +5% in the last week','53.285655','-9.015520',1,4),(5,'Sligo','Sales improve +5% in the last week','54.270193','-8.470477',1,4);
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-12  0:52:22
