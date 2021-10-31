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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-22 08:51:59.775706','2','anhbd123',1,'[{\"added\": {}}]',4,1),(2,'2021-10-22 10:08:01.015222','2','anhbd123',3,'',4,1),(3,'2021-10-22 10:08:15.935828','3','huy123',1,'[{\"added\": {}}]',4,1),(4,'2021-10-24 10:40:53.037040','4','a',3,'',4,1),(5,'2021-10-24 10:41:53.284752','5','a',3,'',4,1),(6,'2021-10-31 03:16:03.748186','1','Cá',1,'[{\"added\": {}}]',8,1),(7,'2021-10-31 03:16:08.012441','2','Thịt',1,'[{\"added\": {}}]',8,1),(8,'2021-10-31 03:16:13.009387','3','Trái cây',1,'[{\"added\": {}}]',8,1),(9,'2021-10-31 03:17:34.731542','1','Product object (1)',1,'[{\"added\": {}}]',9,1),(10,'2021-10-31 03:19:01.052804','2','Product object (2)',1,'[{\"added\": {}}]',9,1),(11,'2021-10-31 03:31:08.602868','3','Product object (3)',1,'[{\"added\": {}}]',9,1),(12,'2021-10-31 03:33:31.513677','4','Product object (4)',1,'[{\"added\": {}}]',9,1),(13,'2021-10-31 03:34:29.178079','5','Product object (5)',1,'[{\"added\": {}}]',9,1),(14,'2021-10-31 03:35:11.512691','6','Product object (6)',1,'[{\"added\": {}}]',9,1),(15,'2021-10-31 03:38:08.671160','7','Product object (7)',1,'[{\"added\": {}}]',9,1),(16,'2021-10-31 03:39:06.378295','6','Product object (6)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(17,'2021-10-31 03:40:23.050585','5','Product object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(18,'2021-10-31 03:41:02.018002','4','Product object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(19,'2021-10-31 03:41:53.665106','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(20,'2021-10-31 03:43:55.217615','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(21,'2021-10-31 03:45:15.967262','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(22,'2021-10-31 03:46:37.563514','8','Product object (8)',1,'[{\"added\": {}}]',9,1),(23,'2021-10-31 03:49:28.526513','9','Product object (9)',1,'[{\"added\": {}}]',9,1),(24,'2021-10-31 03:50:44.730760','10','Product object (10)',1,'[{\"added\": {}}]',9,1),(25,'2021-10-31 03:54:10.770837','11','Product object (11)',1,'[{\"added\": {}}]',9,1),(26,'2021-10-31 03:55:12.236148','12','Product object (12)',1,'[{\"added\": {}}]',9,1),(27,'2021-10-31 03:58:08.178127','13','Product object (13)',1,'[{\"added\": {}}]',9,1),(28,'2021-10-31 03:59:26.844447','14','Product object (14)',1,'[{\"added\": {}}]',9,1),(29,'2021-10-31 04:00:16.545802','4','Rau Củ',1,'[{\"added\": {}}]',8,1),(30,'2021-10-31 04:00:49.255140','15','Product object (15)',1,'[{\"added\": {}}]',9,1),(31,'2021-10-31 04:02:19.784927','16','Product object (16)',1,'[{\"added\": {}}]',9,1),(32,'2021-10-31 04:04:05.814811','17','Product object (17)',1,'[{\"added\": {}}]',9,1),(33,'2021-10-31 04:05:22.852089','18','Product object (18)',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
