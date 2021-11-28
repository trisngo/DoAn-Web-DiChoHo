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
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `total_paid` decimal(10,0) NOT NULL,
  `order_key` varchar(200) NOT NULL,
  `payment_option` varchar(200) NOT NULL,
  `billing_status` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_user_id_e9b59eb1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (1,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-26 09:32:26.320435','2021-11-26 09:32:26.320435',400000,'2H089670064955226','paypal',1,1),(2,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-26 09:35:02.039680','2021-11-26 09:35:02.039680',2650000,'1HP552942P733761W','paypal',1,1),(3,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-26 09:36:17.079166','2021-11-26 09:36:17.079166',470000,'5XN146331E589764K','paypal',1,1),(4,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-26 09:53:01.622502','2021-11-26 09:53:01.622502',892000,'1N182494RW294664Y','paypal',1,1),(5,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-26 10:12:30.264676','2021-11-26 10:12:30.264676',811000,'1NV86842XW071705L','paypal',1,9),(6,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-27 11:39:11.183182','2021-11-27 11:39:11.183182',684000,'710037215K489820X','paypal',1,7),(7,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-27 11:41:05.875255','2021-11-27 11:41:05.875255',1120000,'7G661961L91762743','paypal',1,7),(8,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-27 14:36:03.455307','2021-11-27 14:36:03.455307',291000,'79N74145VP381133X','paypal',1,7),(10,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-27 14:38:32.744965','2021-11-27 14:38:32.744965',291000,'8AA29261DV201323P','paypal',1,7),(11,'John Doe','sb-wtipl8697620@personal.example.com','1 Main St','','2021-11-27 14:39:23.679791','2021-11-27 14:39:23.679791',291000,'7RB13963N4436072A','paypal',1,7),(12,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-27 16:41:19.830512','2021-11-27 16:41:19.830512',293500,'cod','cod',1,7),(13,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-28 03:50:27.548018','2021-11-28 03:50:27.548018',275000,'2EF500231J0247622','Paypal',1,7),(15,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-28 03:55:05.221551','2021-11-28 03:55:05.221551',240100,'not paypal','Trả tiền khi nhận hàng (COD)',1,7),(16,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-28 13:56:57.135831','2021-11-28 13:56:57.135831',327500,'not paypal','Trả tiền khi nhận hàng (COD)',1,7),(17,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-28 13:57:26.569064','2021-11-28 15:05:39.437316',327500,'not paypal','Trả tiền khi nhận hàng (COD)',0,7),(18,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-28 14:00:44.540672','2021-11-28 14:00:44.540672',241500,'5KN07626V52611322','Paypal',1,7),(19,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-28 14:31:31.913455','2021-11-28 14:31:31.913455',246000,'0JX19077YK799282Y','Paypal',1,7),(20,'Đức Trí','ngoductri14@gmail.com','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','1234567890','2021-11-28 15:06:26.664040','2021-11-28 15:06:26.664040',309000,'not paypal','Trả tiền khi nhận hàng (COD)',0,7),(21,'Ngô Đức Trí','ngoductri14@gmail.com','324 Chu Văn An, Phường 12, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam','1234567890','2021-11-28 15:44:52.316106','2021-11-28 15:44:52.316106',252500,'4YK079976B1378932','Paypal',1,7);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-28 23:29:03
