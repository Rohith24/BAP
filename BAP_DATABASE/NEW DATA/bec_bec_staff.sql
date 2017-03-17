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
-- Table structure for table `bec_staff`
--

DROP TABLE IF EXISTS `bec_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bec_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Dept_Name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BEC_staff_ae8cad72` (`Dept_Name_id`),
  CONSTRAINT `BEC_staff_Dept_Name_id_f896c1a0_fk_BEC_hod_id` FOREIGN KEY (`Dept_Name_id`) REFERENCES `bec_hod` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bec_staff`
--

LOCK TABLES `bec_staff` WRITE;
/*!40000 ALTER TABLE `bec_staff` DISABLE KEYS */;
INSERT INTO `bec_staff` VALUES (1,'NS',1),(2,'VC',1),(3,'PSV',1),(4,'PPS',1),(5,'SKN',1),(6,'MRB',1),(7,'CHM',1),(8,'PRK',1),(9,'KKC',1),(10,'TN',1),(11,'KMD',1),(12,'KAB',1),(13,'VNK',1),(14,'RPK',1),(15,'SNCS',1),(16,'RVM',1),(17,'JKR',1),(18,'ARK',1),(19,'JMK',1),(20,'PNK',1),(21,'MK',1),(22,'PBK',1),(23,'GRB',1),(24,'ASR',1),(25,'KKB',1),(26,'NP',1),(27,'BPB',1),(28,'DP',1),(29,'KA',1),(30,'KG',1),(31,'YNB',1),(32,'MSM',1),(33,'MS',1),(34,'KJ',1),(35,'SVV',1),(36,'EE',1),(37,'JS',1),(38,'NJB',1),(39,'KNB',1),(40,'MSK',1),(41,'DV',1);
/*!40000 ALTER TABLE `bec_staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-19 19:00:23
