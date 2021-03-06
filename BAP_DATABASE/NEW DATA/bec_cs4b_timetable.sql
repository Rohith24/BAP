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
-- Table structure for table `cs4b_timetable`
--

DROP TABLE IF EXISTS `cs4b_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cs4b_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(10) NOT NULL,
  `Batch` int(11) NOT NULL,
  `P1` int(11) NOT NULL,
  `P2` int(11) NOT NULL,
  `P3` int(11) NOT NULL,
  `P4` int(11) NOT NULL,
  `P5` int(11) NOT NULL,
  `P6` int(11) NOT NULL,
  `P7` int(11) NOT NULL,
  `P8` int(11) NOT NULL,
  `P9` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs4b_timetable`
--

LOCK TABLES `cs4b_timetable` WRITE;
/*!40000 ALTER TABLE `cs4b_timetable` DISABLE KEYS */;
INSERT INTO `cs4b_timetable` VALUES (1,'MON',1,5,23,31,41,41,41,0,0,0),(2,'TUE',1,5,5,5,10,23,5,0,0,0),(3,'TUE',2,10,10,10,10,23,5,0,0,0),(4,'WED',1,5,31,10,41,41,41,0,0,0),(5,'THU',1,23,10,31,5,41,41,0,0,0),(6,'FRI',1,31,23,10,10,10,10,0,0,0),(7,'FRI',2,31,23,10,5,5,5,0,0,0),(8,'SAT',1,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cs4b_timetable` ENABLE KEYS */;
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
