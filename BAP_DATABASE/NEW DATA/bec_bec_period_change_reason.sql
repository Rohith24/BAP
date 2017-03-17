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
-- Table structure for table `bec_period_change_reason`
--

DROP TABLE IF EXISTS `bec_period_change_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bec_period_change_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `classDetails_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `Period` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BEC_period_change_reaso_classDetails_id_61e92292_fk_BEC_class_id` (`classDetails_id`),
  KEY `BEC_period_change_reason_staff_id_066e001f_fk_BEC_staff_id` (`staff_id`),
  CONSTRAINT `BEC_period_change_reaso_classDetails_id_61e92292_fk_BEC_class_id` FOREIGN KEY (`classDetails_id`) REFERENCES `bec_class` (`id`),
  CONSTRAINT `BEC_period_change_reason_staff_id_066e001f_fk_BEC_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `bec_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bec_period_change_reason`
--

LOCK TABLES `bec_period_change_reason` WRITE;
/*!40000 ALTER TABLE `bec_period_change_reason` DISABLE KEYS */;
INSERT INTO `bec_period_change_reason` VALUES (1,'2017-01-18','null',2,5,0),(2,'2017-01-18','null',2,5,0),(3,'2017-01-18','null',2,5,0),(4,'2017-01-18','null',2,5,0),(5,'2017-01-18','Reason2',2,10,0),(6,'2017-01-18','Reason3',8,10,1),(7,'2017-01-18','Reason09',2,31,7);
/*!40000 ALTER TABLE `bec_period_change_reason` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-19 19:00:22
