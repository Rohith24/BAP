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
-- Table structure for table `bec_staff_login`
--

DROP TABLE IF EXISTS `bec_staff_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bec_staff_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BEC_staff_login_staff_id_5836d73b_fk_BEC_staff_id` (`staff_id`),
  CONSTRAINT `BEC_staff_login_staff_id_5836d73b_fk_BEC_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `bec_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bec_staff_login`
--

LOCK TABLES `bec_staff_login` WRITE;
/*!40000 ALTER TABLE `bec_staff_login` DISABLE KEYS */;
INSERT INTO `bec_staff_login` VALUES (42,'suds.nagalla@gmail.com','-1007638360',1),(43,'cdvetagiri@gmail.com','-1007638360',2),(44,'psvvachaspati@yahoo.com','-1007638360',3),(45,'pardhu.pathella@gmail.com','-1007638360',4),(46,'shk_nazir@yahoo.co.in','-1007638360',5),(47,'mrb.csebec@gmail.com','-1007638360',6),(48,'mangachoppara@gmail.com','-1007638360',7),(49,'rajeshkumar.pendem@gmail.com','-1007638360',8),(50,'kishanchandkopila@gmail.com','-1007638360',9),(51,'nagarjuna595@gmail.com','-1007638360',10),(52,'manideep.karumanchi@gmail.com','-1007638360',11),(53,'arunkarumanchi123@gmail.com','-1007638360',12),(54,'naveenvipparla@gmail.com','-1007638360',13),(55,'pavankartheek.r@gmail.com','-1007638360',14),(56,'schandu.bec@gmail.com','-1007638360',15),(57,'veeramohan.it65@gmail.com','-1007638360',16),(58,'rajkumar_cse2007@yahoo.co.in','-1007638360',17),(59,'ravikishore4u.2010@gmail.com','-1007638360',18),(60,'madhan.mtcse@gmail.com','-1007638360',19),(61,'nandakishore.pujala@gmail.com','-1007638360',20),(62,'karuna.painam@gmail.com','-1007638360',21),(63,'balakrishnamtech@gmail.com','-1007638360',22),(64,'rameshbabugcse@gmail.com','-1007638360',23),(65,'sri.srinivas.07@gmail.com','-1007638360',24),(66,'kishan.kancharagunta@gmail.com','-1007638360',25),(67,'naralasetty99@gmail.com','-1007638360',26),(68,'prashanthbabubandi@gmail.com','-1007638360',27),(69,'pavanidakineni@gmail.com','-1007638360',28),(70,'thyashok@gmail.com','-1007638360',29),(71,'KG','-1007638360',30),(72,'YNB','-1007638360',31),(73,'MSM','-1007638360',32),(74,'MS','-1007638360',33),(75,'KJ','-1007638360',34),(76,'SVV','-1007638360',35),(77,'EE','-1007638360',36),(78,'JS','-1007638360',37),(79,'NJB','-1007638360',38),(80,'KNB','-1007638360',39),(81,'MSK','-1007638360',40),(82,'DV','-1007638360',41);
/*!40000 ALTER TABLE `bec_staff_login` ENABLE KEYS */;
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
