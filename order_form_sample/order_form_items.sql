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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `price_cny` decimal(13,3) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Terre d\'Hermes Eau Intense Vetiver Eau de parfum 100ml',1050.000,1),(2,'Eau de citron noir Hair and body shower gel 200ml',355.000,1),(3,'3 soaps gift set',585.000,1),(4,'BELLE DE JOUR 40ml',740.000,2),(5,'COLOGNE ROYALE  40ml',740.000,2),(6,'SOUFFLE DE SOIE 125ml',1650.000,2),(7,'English Pear and Freesia Cologne 50ml',630.000,3),(8,'Wood Sage & Sea Salt Cologne 100ml',890.000,3),(9,'Vitamin E gel 30ml',590.000,3),(10,'LE GEMME EREA EAU DE PARFUM 41134',2740.000,4),(11,'ROSE GOLDEA EAU DE PARFUM 50251',1355.000,4),(12,'GOLDEA EAU DE PARFUM SPRAY',1355.000,4),(13,'Power Infusing Concentrate 50ml Set',860.000,5),(14,'Legendary Enmei Ultimate Luminance Serum Set',3600.000,5),(15,'Vital Perfection Lifting Mask',980.000,5),(16,'ADVANCED GÉNIFIQUE 30ml',725.000,6),(17,'ADVANCED GÉNIFIQUE EYE CREAM 15ml',520.000,6),(18,'MIRACLE SECRET 100ml',850.000,6),(19,'Double Wear STAY-IN-PLACE MAKEUP SPF 10/PA++ 30ml',365.000,7),(20,'Double Wear Cushion BB All Day Wear Liquid Compact SPF 50/PA++++ 12g',390.000,7),(21,'Double Wear Stay-in-Place Eye Pencil',200.000,7);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `price_update_insert` AFTER INSERT ON `items` FOR EACH ROW begin
	insert into price_history(item_id,update_date,price_record_cny)
    values
    (new.item_id,DATE_FORMAT(SYSDATE(), '%Y-%m-%d'),new.price_cny);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `price_update_update` AFTER UPDATE ON `items` FOR EACH ROW begin
if new.price_cny != old.price_cny then
	insert into price_history(item_id,update_date,price_record_cny)
    values
    (old.item_id,DATE_FORMAT(SYSDATE(), '%Y-%m-%d'),new.price_cny);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11  0:25:09
