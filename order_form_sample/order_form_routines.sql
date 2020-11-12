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
-- Temporary view structure for view `v_sales_price_history`
--

DROP TABLE IF EXISTS `v_sales_price_history`;
/*!50001 DROP VIEW IF EXISTS `v_sales_price_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_sales_price_history` AS SELECT 
 1 AS `purchase_id`,
 1 AS `purchase_date`,
 1 AS `customer_id`,
 1 AS `item_id`,
 1 AS `quantity`,
 1 AS `parcel_id`,
 1 AS `arrived`,
 1 AS `shipping_info`,
 1 AS `update_date`,
 1 AS `price_record_cny`,
 1 AS `date_diff`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_track_prices`
--

DROP TABLE IF EXISTS `v_track_prices`;
/*!50001 DROP VIEW IF EXISTS `v_track_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_track_prices` AS SELECT 
 1 AS `purchase_id`,
 1 AS `purchase_date`,
 1 AS `customer_id`,
 1 AS `item_id`,
 1 AS `quantity`,
 1 AS `parcel_id`,
 1 AS `arrived`,
 1 AS `shipping_info`,
 1 AS `update_date`,
 1 AS `price_record_cny`,
 1 AS `date_diff`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_sales_price_history`
--

/*!50001 DROP VIEW IF EXISTS `v_sales_price_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sales_price_history` AS select `s`.`purchase_id` AS `purchase_id`,`s`.`purchase_date` AS `purchase_date`,`s`.`customer_id` AS `customer_id`,`s`.`item_id` AS `item_id`,`s`.`quantity` AS `quantity`,`s`.`parcel_id` AS `parcel_id`,`s`.`arrived` AS `arrived`,`s`.`shipping_info` AS `shipping_info`,`p`.`update_date` AS `update_date`,`p`.`price_record_cny` AS `price_record_cny`,(to_days(`s`.`purchase_date`) - to_days(`p`.`update_date`)) AS `date_diff` from (`sales` `s` join `price_history` `p` on((`s`.`item_id` = `p`.`item_id`))) where (`s`.`purchase_date` >= `p`.`update_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_track_prices`
--

/*!50001 DROP VIEW IF EXISTS `v_track_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_track_prices` AS select `vsp1`.`purchase_id` AS `purchase_id`,`vsp1`.`purchase_date` AS `purchase_date`,`vsp1`.`customer_id` AS `customer_id`,`vsp1`.`item_id` AS `item_id`,`vsp1`.`quantity` AS `quantity`,`vsp1`.`parcel_id` AS `parcel_id`,`vsp1`.`arrived` AS `arrived`,`vsp1`.`shipping_info` AS `shipping_info`,`vsp1`.`update_date` AS `update_date`,`vsp1`.`price_record_cny` AS `price_record_cny`,`vsp1`.`date_diff` AS `date_diff` from `v_sales_price_history` `vsp1` where (`vsp1`.`date_diff` = (select min(`vsp2`.`date_diff`) from `v_sales_price_history` `vsp2` where (`vsp1`.`purchase_id` = `vsp2`.`purchase_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11  0:25:10
