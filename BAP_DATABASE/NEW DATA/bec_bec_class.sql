CREATE DATABASE  IF NOT EXISTS `bec` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bec`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: bec
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `bec_class`
--

DROP TABLE IF EXISTS `bec_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bec_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `section` varchar(1) NOT NULL,
  `Dept_Name_id` int(11) NOT NULL,
  `coordinator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BEC_class_Dept_Name_id_1f87d12d_fk_BEC_hod_id` (`Dept_Name_id`),
  KEY `BEC_class_78527ed6` (`coordinator_id`),
  CONSTRAINT `BEC_class_Dept_Name_id_1f87d12d_fk_BEC_hod_id` FOREIGN KEY (`Dept_Name_id`) REFERENCES `bec_hod` (`id`),
  CONSTRAINT `BEC_class_coordinator_id_84cd67a4_fk_BEC_staff_id` FOREIGN KEY (`coordinator_id`) REFERENCES `bec_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bec_class`
--

LOCK TABLES `bec_class` WRITE;
/*!40000 ALTER TABLE `bec_class` DISABLE KEYS */;
INSERT INTO `bec_class` VALUES (1,4,'A',1,16),(2,4,'B',1,10),(3,4,'C',1,1),(4,3,'A',1,1),(5,3,'B',1,1),(6,3,'C',1,1),(7,2,'A',1,1),(8,2,'B',1,1),(9,2,'C',1,1);
/*!40000 ALTER TABLE `bec_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-19 19:00:24
