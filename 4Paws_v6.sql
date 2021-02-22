-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: 4paws
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `bank_branch` int NOT NULL,
  `bank_accountNum` int NOT NULL,
  `bank_accountType` varchar(30) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breed` (
  `breed_id` int NOT NULL AUTO_INCREMENT,
  `breed_name` varchar(50) NOT NULL,
  PRIMARY KEY (`breed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed`
--

LOCK TABLES `breed` WRITE;
/*!40000 ALTER TABLE `breed` DISABLE KEYS */;
/*!40000 ALTER TABLE `breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carer`
--

DROP TABLE IF EXISTS `carer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carer` (
  `idcarer` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  PRIMARY KEY (`idcarer`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carer`
--

LOCK TABLES `carer` WRITE;
/*!40000 ALTER TABLE `carer` DISABLE KEYS */;
INSERT INTO `carer` VALUES (1,'John','john@email.com','St Thomas','ON','M6K5R7','CA',12345678);
/*!40000 ALTER TABLE `carer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_address` varchar(250) NOT NULL,
  `location_city` varchar(50) NOT NULL,
  `location_province` varchar(50) NOT NULL,
  `location_country` varchar(50) NOT NULL,
  `location_postalCode` varchar(10) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `owner_firstname` varchar(100) NOT NULL,
  `owner_lastname` varchar(100) NOT NULL,
  `owner_email` varchar(100) NOT NULL,
  `owner_phone` varchar(15) NOT NULL,
  `owner_dob` date NOT NULL,
  `location_id` int NOT NULL,
  `bank_id` int NOT NULL,
  PRIMARY KEY (`owner_id`),
  KEY `owner_bank_fk` (`bank_id`),
  KEY `owner_location_fk` (`location_id`),
  CONSTRAINT `owner_bank_fk` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `owner_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `pet_id` int NOT NULL AUTO_INCREMENT,
  `pet_name` varchar(50) NOT NULL,
  `pet_age` int NOT NULL,
  `breed_id` int NOT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `pet_breed_fk` (`breed_id`),
  CONSTRAINT `pet_breed_fk` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_owner`
--

DROP TABLE IF EXISTS `pet_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_owner` (
  `pet_owner_id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`pet_owner_id`),
  KEY `petOwner_owner_fk` (`owner_id`),
  KEY `petOwner_pet_fk` (`pet_id`),
  CONSTRAINT `petOwner_owner_fk` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `petOwner_pet_fk` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_owner`
--

LOCK TABLES `pet_owner` WRITE;
/*!40000 ALTER TABLE `pet_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `rating_start` int NOT NULL,
  `rating_review` varchar(250) NOT NULL,
  `rating_date` date NOT NULL,
  `owner_id` int NOT NULL,
  `sitter_id` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `rating_owner_fk` (`owner_id`),
  KEY `rating_sitter_fk` (`sitter_id`),
  CONSTRAINT `rating_owner_fk` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rating_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `sch_dropOffDate` date NOT NULL,
  `sch_dropOffTime` time NOT NULL,
  `sch_pickUpDate` date NOT NULL,
  `sch_pickUpTime` time NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitter`
--

DROP TABLE IF EXISTS `sitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitter` (
  `sitter_id` int NOT NULL AUTO_INCREMENT,
  `sitter_firstname` varchar(100) NOT NULL,
  `sitter_lastname` varchar(100) NOT NULL,
  `sitter_email` varchar(100) NOT NULL,
  `sitter_phone` varchar(15) NOT NULL,
  `sitter_dob` date NOT NULL,
  `sitter_photo` blob NOT NULL,
  `sitter_policeCheck` blob NOT NULL,
  `sitter_price` double NOT NULL,
  `location_id` int NOT NULL,
  `bank_id` int NOT NULL,
  PRIMARY KEY (`sitter_id`),
  KEY `sitter_location_fk` (`location_id`),
  KEY `sitter_bank_fk` (`bank_id`),
  CONSTRAINT `sitter_bank_fk` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sitter_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitter`
--

LOCK TABLES `sitter` WRITE;
/*!40000 ALTER TABLE `sitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitter_breed`
--

DROP TABLE IF EXISTS `sitter_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitter_breed` (
  `sitter_breed_id` int NOT NULL AUTO_INCREMENT,
  `sitter_id` int NOT NULL,
  `breed_id` int NOT NULL,
  PRIMARY KEY (`sitter_breed_id`),
  KEY `sitterBreed_sitter_fk` (`sitter_id`),
  KEY `sitterBreed_breed_fk` (`breed_id`),
  CONSTRAINT `sitterBreed_breed_fk` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sitterBreed_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitter_breed`
--

LOCK TABLES `sitter_breed` WRITE;
/*!40000 ALTER TABLE `sitter_breed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitter_breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitter_schedule`
--

DROP TABLE IF EXISTS `sitter_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitter_schedule` (
  `sitterchs_id` int NOT NULL AUTO_INCREMENT,
  `sitter_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  PRIMARY KEY (`sitterchs_id`),
  KEY `sitterSch_sitter_fk` (`sitter_id`),
  KEY `sitterSch_schedule_fk` (`schedule_id`),
  CONSTRAINT `sitterSch_schedule_fk` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sitterSch_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitter_schedule`
--

LOCK TABLES `sitter_schedule` WRITE;
/*!40000 ALTER TABLE `sitter_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitter_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-22 12:23:55
