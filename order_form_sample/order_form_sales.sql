CREATE DATABASE  IF NOT EXISTS `order_form` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `order_form`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: order_form
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `purchase_id` int NOT NULL AUTO_INCREMENT,
  `purchase_date` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `parcel_id` varchar(255) DEFAULT NULL,
  `arrived` tinyint(1) DEFAULT '0',
  `shipping_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `customer_id` (`customer_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2018-06-17',3,5,2,'EK458465176HK',0,NULL),(2,'2018-08-21',4,2,6,'EK458465128HK',0,NULL),(3,'2018-08-30',11,7,2,'SF1028382264477',0,NULL),(4,'2018-09-01',9,20,5,'EK465325642HK',0,NULL),(5,'2018-09-02',1,2,7,'EK465454063HK',0,NULL),(6,'2018-09-05',12,8,2,'EK464590155HK',0,NULL),(7,'2018-09-06',7,3,8,'EK464590147HK',0,NULL),(8,'2018-09-10',10,10,3,'EK465454015HK',0,NULL),(9,'2018-09-11',12,2,1,'EK457199620HK',0,NULL),(10,'2018-09-13',4,18,2,'EK464671659HK',0,NULL),(11,'2018-09-16',7,3,8,'EK464590147HK',0,NULL),(12,'2018-09-17',10,10,3,'EK465454015HK',0,NULL),(13,'2018-09-18',12,2,1,'EK457199620HK',0,NULL),(14,'2018-09-18',4,18,2,'EK464671659HK',0,NULL),(15,'2018-09-19',11,7,2,'SF1028382264477',0,NULL),(16,'2018-10-01',9,20,5,'EK465325642HK',0,NULL),(17,'2018-10-02',1,2,7,'EK465454063HK',0,NULL),(18,'2018-10-02',12,8,2,'EK464590155HK',0,NULL),(19,'2018-10-02',7,3,8,'EK464590147HK',0,NULL),(20,'2018-10-03',4,18,2,'EK464671659HK',0,NULL),(21,'2018-10-04',7,3,8,'EK464590147HK',0,NULL),(22,'2018-10-05',10,10,3,'EK465454015HK',0,NULL),(23,'2018-10-06',12,2,1,'EK457199620HK',0,NULL),(24,'2018-10-07',7,3,8,'EK464590147HK',0,NULL),(25,'2018-10-08',4,18,2,'EK464671659HK',0,NULL),(26,'2018-10-09',7,3,8,'EK464590147HK',0,NULL),(27,'2018-10-10',10,10,3,'EK465454015HK',0,NULL),(28,'2018-10-10',5,6,1,'EK465139132HK',0,NULL),(29,'2018-10-14',9,3,4,'EK458737696HK',0,NULL),(30,'2018-10-15',7,3,8,'EK464590147HK',0,NULL),(31,'2018-10-17',10,10,3,'EK465454015HK',0,NULL),(32,'2018-10-17',12,2,1,'EK457199620HK',0,NULL),(33,'2018-10-18',7,3,8,'EK464590147HK',0,NULL),(34,'2018-10-18',7,3,8,'EK464590147HK',0,NULL),(35,'2018-10-19',10,10,3,'EK465454015HK',0,NULL),(36,'2018-10-20',12,2,1,'EK457199620HK',0,NULL),(37,'2018-10-21',7,3,8,'EK464590147HK',0,NULL),(38,'2018-10-22',7,3,8,'EK464590147HK',0,NULL),(39,'2018-10-23',10,10,3,'EK465454015HK',0,NULL),(40,'2018-10-23',12,2,1,'EK457199620HK',0,NULL),(41,'2018-10-23',7,3,8,'EK464590147HK',0,NULL),(42,'2018-10-24',7,3,8,'EK464590147HK',0,NULL),(43,'2018-10-24',10,10,3,'EK465454015HK',0,NULL),(44,'2018-10-24',12,2,1,'EK457199620HK',0,NULL),(45,'2018-10-24',7,3,8,'EK464590147HK',0,NULL),(46,'2018-10-24',7,3,8,'EK464590147HK',0,NULL),(47,'2018-10-25',10,10,3,'EK465454015HK',0,NULL),(48,'2018-10-25',12,2,1,'EK457199620HK',0,NULL),(49,'2018-10-25',7,3,8,'EK464590147HK',0,NULL),(50,'2018-10-25',7,3,8,'EK464590147HK',0,NULL),(51,'2018-10-25',10,10,3,'EK465454015HK',0,NULL),(52,'2018-10-25',12,2,1,'EK457199620HK',0,NULL),(53,'2018-10-26',7,3,8,'EK464590147HK',0,NULL),(54,'2018-10-27',7,3,8,'EK464590147HK',0,NULL),(55,'2018-10-27',10,10,3,'EK465454015HK',0,NULL),(56,'2018-10-27',12,2,1,'EK457199620HK',0,NULL),(57,'2018-10-27',7,3,8,'EK464590147HK',0,NULL),(58,'2018-10-28',1,2,7,'EK465454063HK',0,NULL),(59,'2018-10-28',12,8,2,'EK464590155HK',0,NULL),(60,'2018-10-29',7,3,8,'EK464590147HK',0,NULL),(61,'2018-10-30',4,18,2,'EK464671659HK',0,NULL),(62,'2018-10-30',7,3,8,'EK464590147HK',0,NULL),(63,'2018-10-30',10,10,3,'EK465454015HK',0,NULL),(64,'2018-10-31',12,2,1,'EK457199620HK',0,NULL),(65,'2018-10-31',7,3,8,'EK464590147HK',0,NULL),(66,'2018-10-31',4,18,2,'EK464671659HK',0,NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11  0:25:10