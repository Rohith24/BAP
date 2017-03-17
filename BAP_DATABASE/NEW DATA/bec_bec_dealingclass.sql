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
-- Table structure for table `bec_dealingclass`
--

DROP TABLE IF EXISTS `bec_dealingclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bec_dealingclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name_id` int(11) NOT NULL,
  `staff_name_id` int(11) NOT NULL,
  `Subject_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BEC_dealingclass_class_name_id_aaaaac6c_fk_BEC_class_id` (`class_name_id`),
  KEY `BEC_dealingclass_staff_name_id_cd439851_fk_BEC_staff_id` (`staff_name_id`),
  CONSTRAINT `BEC_dealingclass_class_name_id_aaaaac6c_fk_BEC_class_id` FOREIGN KEY (`class_name_id`) REFERENCES `bec_class` (`id`),
  CONSTRAINT `BEC_dealingclass_staff_name_id_cd439851_fk_BEC_staff_id` FOREIGN KEY (`staff_name_id`) REFERENCES `bec_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bec_dealingclass`
--

LOCK TABLES `bec_dealingclass` WRITE;
/*!40000 ALTER TABLE `bec_dealingclass` DISABLE KEYS */;
INSERT INTO `bec_dealingclass` VALUES (76,1,30,'IEM'),(77,1,3,'DA-II'),(78,1,16,'CS-II'),(79,1,13,'STM'),(80,1,3,'DA-II LAB'),(81,1,16,'CS-II LAB'),(82,1,39,'PROJECT'),(83,2,31,'IEM'),(84,2,5,'DA-II'),(85,2,10,'CS-II'),(86,2,23,'STM'),(87,2,5,'DA-II LAB'),(88,2,10,'CS-II LAB'),(89,2,41,'PROJECT'),(90,3,32,'IEM'),(91,3,13,'DA-II'),(92,3,21,'CS-II'),(93,3,14,'STM'),(94,3,13,'DA-II LAB'),(95,3,21,'CS-II LAB'),(96,3,40,'PROJECT'),(97,4,22,'IDA'),(98,4,7,'CD'),(99,4,25,'CN'),(100,4,15,'EP-II'),(101,4,11,'C&MAD'),(102,4,18,'ACA'),(103,4,22,'IDA LAB'),(104,4,15,'EP-II LAB'),(105,4,11,'C&MAD LAB'),(106,5,5,'IDA'),(107,5,9,'CD'),(108,5,21,'CN'),(109,5,15,'EP-II'),(110,5,12,'C&MAD'),(111,5,6,'ACA'),(112,5,5,'IDA LAB'),(113,5,15,'EP-II LAB'),(114,5,12,'C&MAD LAB'),(115,6,6,'IDA'),(116,6,4,'CD'),(117,6,23,'CN'),(118,6,14,'EP-II'),(119,6,25,'C&MAD'),(120,6,18,'ACA'),(121,6,6,'IDA LAB'),(122,6,14,'EP-II LAB'),(123,6,25,'C&MAD LAB'),(124,7,33,'P&S'),(125,7,8,'PE&HV'),(126,7,26,'CO'),(127,7,24,'DAA'),(128,7,12,'GUI'),(129,7,17,'WT'),(130,7,24,'DAA LAB'),(131,7,12,'GUI LAB'),(132,7,17,'WT LAB'),(133,8,34,'P&S'),(134,8,2,'PE&HV'),(135,8,26,'CO'),(136,8,10,'DAA'),(137,8,11,'GUI'),(138,8,19,'WT'),(139,8,10,'DAA LAB'),(140,8,11,'GUI LAB'),(141,8,19,'WT LAB'),(142,9,35,'P&S'),(143,9,8,'PE&HV'),(144,9,22,'CO'),(145,9,4,'DAA'),(146,9,9,'GUI'),(147,9,27,'WT'),(148,9,4,'DAA LAB'),(149,9,9,'GUI LAB'),(150,9,27,'WT LAB');
/*!40000 ALTER TABLE `bec_dealingclass` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-19 19:00:25
