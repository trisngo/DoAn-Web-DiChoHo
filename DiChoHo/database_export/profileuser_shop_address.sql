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
-- Table structure for table `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_address` (
  `id` char(32) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `postcode` varchar(50) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `delivery_instructions` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `city` varchar(150) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_address_user_id_3edd3b17_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_address_user_id_3edd3b17_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_address`
--

LOCK TABLES `shop_address` WRITE;
/*!40000 ALTER TABLE `shop_address` DISABLE KEYS */;
INSERT INTO `shop_address` VALUES ('00eba6d6d1aa4ae8987cce43289e2168','1234567890','700000','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','Không có','2021-11-26 10:08:16.090904','2021-11-26 10:08:16.090904',1,7,'Thành phố Hồ Chí Minh','Đức Trí'),('8d2618a45dc9480ebadb2d851285ee4d','1234567890','700000','324 Chu Văn An, Phường 12, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:10:33.268767','2021-11-26 10:10:33.268767',0,7,'Thành phố Hồ Chí Minh','Ngô Đức Trí'),('a17649b17cc34007bf9c006385ef64d3','1234567890','700000','Cầu, Thảo Điền, Quận 2, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:09:52.567005','2021-11-26 10:09:52.567005',1,6,'Thành phố Hồ Chí Minh','Nguyễn Văn Minh Hoàng'),('e2f68fe91f864f59b7b0ea0e83812ebb','0123456789','700000','24 Đ. Số 1, Phường 11, Gò Vấp','quẹo dô hẻm','2021-11-25 03:09:09.578601','2021-11-26 09:57:39.293153',1,1,'Thành phố Hồ Chí Minh','Admin'),('efa5c8a7522841e284c7a09f23734a91','1234567890','700000','2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1','Không có','2021-11-26 10:09:06.433937','2021-11-26 10:09:06.433937',1,8,'Thành phố Hồ Chí Minh','Bùi Quốc Huy'),('f7fcf3e417e748808be3fb433c65cf9f','1234567890','700000','252 Nam Kỳ Khởi Nghĩa, Phường 8, Quận 3, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:07:41.343150','2021-11-26 10:07:41.343150',0,9,'Thành phố Hồ Chí Minh','Anh Bùi Đức'),('f895d98cd84b4ee19ce204e694c5fe0e','1234567890','700000','20/8C Thống Nhất, Phường 16, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:06:43.376855','2021-11-26 10:06:43.376855',1,9,'Thành phố Hồ Chí Minh','Bùi Đức Anh');
/*!40000 ALTER TABLE `shop_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-26 17:20:17
