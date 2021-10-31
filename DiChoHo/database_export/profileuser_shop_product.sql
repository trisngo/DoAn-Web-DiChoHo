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
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  `created_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  KEY `shop_product_created_by_id_9cc24d1b_fk_auth_user_id` (`created_by_id`),
  KEY `shop_product_slug_30bd2d5d` (`slug`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  CONSTRAINT `shop_product_created_by_id_9cc24d1b_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'Dưa leo túi 500g','admin','','templates/static/images/dua-leo-vi-500g-202009292350252470_i4d8qW0.jpg','dua-leo-500g',15000,1,1,'2021-10-31 03:17:34.728550','2021-10-31 03:45:15.964271',3,1),(2,'Cam vàng nhập khẩu túi 1kg','admin','','templates/static/images/cam-vang-valencia-uc-hop-1kg-4-5-trai-202101271645511757_NC8EO3Q.jpg','cam-vang-1kg',65000,1,1,'2021-10-31 03:19:01.050807','2021-10-31 03:43:55.208079',3,1),(3,'Táo Star nhập khẩu túi 1kg','admin','','templates/static/images/tao-star-nhap-khau-tui-1kg-202108302002485834_kvQ22RD.jpg','tao-star-tui-1kg',69000,1,1,'2021-10-31 03:31:08.600904','2021-10-31 03:41:53.654086',3,1),(4,'Kiwi xanh Zespri hộp 500g','admin','','templates/static/images/kiwi-xanh-zespri-hop-500g-202108191526551273_CsIKlTR.jpg','kiwi-xanh-zespri-hop-500g',64500,1,1,'2021-10-31 03:33:31.512679','2021-10-31 03:41:02.008469',3,1),(5,'Hồng giòn nhập khẩu Trung Quốc 1kg','admin','','templates/static/images/hong-gion-nhap-khau-new-zealand-1kg-202109231416203868_7lJVfmJ.jpg','hong--tq-1kg',49000,1,1,'2021-10-31 03:34:29.177052','2021-10-31 03:40:23.047601',3,1),(6,'Xoài cát Hoà Lộc túi 1kg','admin','','templates/static/images/xoai-cat-hoa-loc-tui-1kg-202103180811509891_TE90F4F.jpg','xoai-cat-hoa-loc-tui-1kg',55000,1,1,'2021-10-31 03:35:11.510697','2021-10-31 03:39:06.373305',3,1),(7,'Thịt đùi heo G khay 300g','admin','','templates/static/images/thit-dui-heo-khay-300g-202106021336492345_Ywq8Nk9.jpg','thit-dui-heo-g-khay-300g',48500,1,1,'2021-10-31 03:38:08.670163','2021-10-31 03:38:08.670163',2,1),(8,'Thịt vai heo nhập khẩu túi 500g','admin','','templates/static/images/thit-vai-heo-nhap-khau-tui-500g-202110191757526752_3CKaqii.jpg','thit-vai-heo-nhap-khau-tui-500g',72500,1,1,'2021-10-31 03:46:37.551787','2021-10-31 03:46:37.551787',2,1),(9,'Thịt bò Úc xay khay 250g','admin','','templates/static/images/thit-bo-uc-xay-pacow-khay-250g-202105121346559240_RkC7gSc.jpg','thit-bo-uc-xay-khay-250g',82000,1,1,'2021-10-31 03:49:28.525512','2021-10-31 03:49:28.525512',2,1),(10,'Đùi bò nhập khẩu đông lạnh túi 500g','admin','','templates/static/images/dui-bo-nhap-khau-dong-lanh-tui-500g-202110021939273907_RQKMEsi.jpg','dui-bo-nhap-khau-dong-lanh-tui-500g',153000,1,1,'2021-10-31 03:50:44.727795','2021-10-31 03:50:44.727795',2,1),(11,'Nạc mông trâu nhập khẩu túi 300g','admin','','templates/static/images/nac-mong-trau-nhap-khau-tui-300g-202105081657246580_TOkBOPC.jpg','nac-mong-trau-nhap-khau-tui-300g',53500,1,1,'2021-10-31 03:54:10.768843','2021-10-31 03:54:10.768843',2,1),(12,'Má đùi gà nhập khẩu túi 500g','admin','','templates/static/images/ma-dui-ga-nhap-khau-tui-500g-202107101441012437_LgAcmdi.jpeg','ma-djui-ga-nhp-khu-tui-500g',23500,1,1,'2021-10-31 03:55:12.235180','2021-10-31 03:55:12.235180',2,1),(13,'Hộp 30 trứng cút tươi T.Food 30 trứng','admin','','templates/static/images/vi-30-trung-cut-loai-1-vfarm-202010261554134965_5oVAp9S.jpg','hop-30-trung-cut-tuoi-tfood-30-trng',25000,1,1,'2021-10-31 03:58:08.176135','2021-10-31 03:58:08.176135',2,1),(14,'Hộp 10 trứng vịt V.Food 10 trứng','admin','','templates/static/images/hop-10-trung-vit-vfood-202102050230472043_hpC3ziM.jpg','hop-10-trung-vit-vfood-10-trung',38000,1,1,'2021-10-31 03:59:26.840461','2021-10-31 03:59:26.840461',2,1),(15,'Rau mồng tơi baby túi 300g','admin','','templates/static/images/rau-mong-toi-baby-tui-300g-202011071653168977_YOTYqEF.jpg','rau-mong-toi-baby-tui-300g',9000,1,1,'2021-10-31 04:00:49.253148','2021-10-31 04:00:49.253148',4,1),(16,'Bông cải trắng túi 500g','admin','','templates/static/images/bong-cai-trang-tui-500g-202105181408034973_JkI9GrQ.jpg','bong-cai-trang-tui-500g',35000,1,1,'2021-10-31 04:02:19.782931','2021-10-31 04:02:19.782931',4,1),(17,'Cá thát lát rút xương muối sả ớt gói 250g','admin','','templates/static/images/ca-that-lat-rut-xuong-muoi-sa-ot-goi-250g-202005251508319356_oSXyU7a.jpg','ca-that-lat-rut-xuong-muoi-sa-ot-goi-250g',70000,1,1,'2021-10-31 04:04:05.810822','2021-10-31 04:04:05.810822',1,1),(18,'Cá diêu hồng làm sạch khay 500g','admin','','templates/static/images/ca-dieu-hong-lam-sach-khay-500g-giao-ngau-nhien-phan-dau-hoac-d_PvKewBE.jpeg','ca-dieu-hong-lam-sach-khay-500g',48000,1,1,'2021-10-31 04:05:22.850064','2021-10-31 04:05:22.850064',1,1);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-31 11:08:29
