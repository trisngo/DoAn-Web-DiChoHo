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
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$zeiBjAIXk5DXBLBbNgxhbk$U0pPRFOwSiSM5kXRmQ520u4xWLDAZnAeqZRkaJrhoW4=','2021-11-26 09:27:27.606212',1,'admins','Admin','Root','admin@dichoho.com',1,1,'2021-10-22 08:43:39.000000'),(6,'pbkdf2_sha256$260000$XXMev3uOinYAZUbO5RYA6q$PzA0ovUQbGjec7uDIYvpBM6yiDZYAU/qdq4Ocxdilro=','2021-11-26 09:56:26.000000',0,'hoangne','Hoàng','Nguyễn Văn Minh','hoangne@gmail.com',0,1,'2021-11-26 09:55:27.000000'),(7,'pbkdf2_sha256$260000$zirO70Chgzo5HWqAdMOrsd$PnOwmgQzW3gvu/0mdz2336Cc5DvcfRMT70Q/kWUSoGQ=','2021-11-28 15:48:14.816400',0,'ductri','Tri','Ngo Duc','ngoductri14@gmail.com',1,1,'2021-11-26 09:57:58.000000'),(8,'pbkdf2_sha256$260000$RXiFBzYvTw3N1pwaaY3hr1$GtI73n9GPgSJeCm598rgTzJXu3GbbIGOpLNqKYeB4Og=','2021-11-26 10:01:12.000000',0,'huy123','Huy','Bui','huybui@gmail.com',0,1,'2021-11-26 10:00:41.000000'),(9,'pbkdf2_sha256$260000$j2DrO8HPM9fHnNCAziaJ4L$QX1c+0unNirhEDe/VCj9MDgXVdQcSZVHls4HLYoMuj4=','2021-11-26 10:11:08.000000',0,'andbd','Anh','Bui Duc','anhbd@gmail.com',0,1,'2021-11-26 10:02:10.000000'),(10,'pbkdf2_sha256$260000$QzF8gsCkbEsUnaC46Sh8bP$XCbfLDJJJ9khIR9/zwXfQS7k6qjX124zMaV4x21WWO8=','2021-11-28 15:47:13.465785',1,'admin','admin','admin','admin@dichoho.com',1,1,'2021-11-26 10:16:04.538637');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
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
