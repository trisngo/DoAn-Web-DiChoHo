-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: profileuser
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(10,0) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  KEY `orders_orderitem_product_id_afe4254a_fk_shop_product_id` (`product_id`),
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `orders_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderitem`
--

LOCK TABLES `orders_orderitem` WRITE;
/*!40000 ALTER TABLE `orders_orderitem` DISABLE KEYS */;
INSERT INTO `orders_orderitem` VALUES (1,59500,1,1,50),(2,62500,1,1,49),(3,58000,1,1,43),(4,38000,1,1,14),(5,48500,1,1,7),(6,55000,1,1,6),(7,23500,1,1,12),(8,25000,1,1,13),(9,149000,10,2,38),(10,29000,10,2,41),(11,119000,5,2,46),(12,35000,7,2,16),(13,9000,20,3,15),(14,23500,4,3,21),(15,20000,1,3,32),(16,18000,7,3,19),(17,94000,4,4,44),(18,59500,1,4,50),(19,62500,1,4,49),(20,94000,1,4,48),(22,62500,10,5,49),(23,156000,1,5,47),(24,29000,1,6,41),(25,42000,1,6,40),(26,94000,1,6,44),(27,82500,1,6,45),(28,59500,1,6,50),(29,94000,1,6,48),(30,149000,1,6,38),(31,63000,1,6,39),(32,27000,1,6,30),(33,14000,1,6,34),(34,14000,10,7,34),(35,15000,33,7,1),(36,65000,7,7,2),(37,59500,1,8,50),(38,82500,1,8,45),(39,119000,1,8,46),(40,59500,1,10,50),(41,82500,1,10,45),(42,119000,1,10,46),(43,59500,1,11,50),(44,119000,1,11,46),(45,82500,1,11,45),(46,94000,1,12,44),(47,62500,1,12,49),(48,58000,1,12,43),(49,29000,1,12,41),(50,59500,1,13,50),(51,62500,1,13,49),(52,94000,1,13,44),(53,29000,1,13,41),(57,19100,11,15,52),(58,59500,5,16,50),(59,59500,5,17,50),(60,59500,1,18,50),(61,58000,1,18,43),(62,94000,1,18,44),(63,59500,1,19,50),(64,62500,1,19,49),(65,94000,1,19,44),(66,65000,3,20,2),(67,69000,1,20,3),(68,15000,1,20,1),(69,94000,1,21,44),(70,25000,1,21,13),(71,48500,1,21,7),(72,55000,1,21,6);
/*!40000 ALTER TABLE `orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-28 23:29:05
