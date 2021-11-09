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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-22 08:51:59.775706','2','anhbd123',1,'[{\"added\": {}}]',4,1),(2,'2021-10-22 10:08:01.015222','2','anhbd123',3,'',4,1),(3,'2021-10-22 10:08:15.935828','3','huy123',1,'[{\"added\": {}}]',4,1),(4,'2021-10-24 10:40:53.037040','4','a',3,'',4,1),(5,'2021-10-24 10:41:53.284752','5','a',3,'',4,1),(6,'2021-10-31 03:16:03.748186','1','Cá',1,'[{\"added\": {}}]',8,1),(7,'2021-10-31 03:16:08.012441','2','Thịt',1,'[{\"added\": {}}]',8,1),(8,'2021-10-31 03:16:13.009387','3','Trái cây',1,'[{\"added\": {}}]',8,1),(9,'2021-10-31 03:17:34.731542','1','Product object (1)',1,'[{\"added\": {}}]',9,1),(10,'2021-10-31 03:19:01.052804','2','Product object (2)',1,'[{\"added\": {}}]',9,1),(11,'2021-10-31 03:31:08.602868','3','Product object (3)',1,'[{\"added\": {}}]',9,1),(12,'2021-10-31 03:33:31.513677','4','Product object (4)',1,'[{\"added\": {}}]',9,1),(13,'2021-10-31 03:34:29.178079','5','Product object (5)',1,'[{\"added\": {}}]',9,1),(14,'2021-10-31 03:35:11.512691','6','Product object (6)',1,'[{\"added\": {}}]',9,1),(15,'2021-10-31 03:38:08.671160','7','Product object (7)',1,'[{\"added\": {}}]',9,1),(16,'2021-10-31 03:39:06.378295','6','Product object (6)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(17,'2021-10-31 03:40:23.050585','5','Product object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(18,'2021-10-31 03:41:02.018002','4','Product object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(19,'2021-10-31 03:41:53.665106','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(20,'2021-10-31 03:43:55.217615','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(21,'2021-10-31 03:45:15.967262','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(22,'2021-10-31 03:46:37.563514','8','Product object (8)',1,'[{\"added\": {}}]',9,1),(23,'2021-10-31 03:49:28.526513','9','Product object (9)',1,'[{\"added\": {}}]',9,1),(24,'2021-10-31 03:50:44.730760','10','Product object (10)',1,'[{\"added\": {}}]',9,1),(25,'2021-10-31 03:54:10.770837','11','Product object (11)',1,'[{\"added\": {}}]',9,1),(26,'2021-10-31 03:55:12.236148','12','Product object (12)',1,'[{\"added\": {}}]',9,1),(27,'2021-10-31 03:58:08.178127','13','Product object (13)',1,'[{\"added\": {}}]',9,1),(28,'2021-10-31 03:59:26.844447','14','Product object (14)',1,'[{\"added\": {}}]',9,1),(29,'2021-10-31 04:00:16.545802','4','Rau Củ',1,'[{\"added\": {}}]',8,1),(30,'2021-10-31 04:00:49.255140','15','Product object (15)',1,'[{\"added\": {}}]',9,1),(31,'2021-10-31 04:02:19.784927','16','Product object (16)',1,'[{\"added\": {}}]',9,1),(32,'2021-10-31 04:04:05.814811','17','Product object (17)',1,'[{\"added\": {}}]',9,1),(33,'2021-10-31 04:05:22.852089','18','Product object (18)',1,'[{\"added\": {}}]',9,1),(34,'2021-11-02 10:24:49.404552','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(35,'2021-11-02 10:25:20.023416','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(36,'2021-11-02 10:26:01.539472','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(37,'2021-11-02 10:26:40.270093','4','Product object (4)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(38,'2021-11-02 10:27:19.504608','5','Product object (5)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(39,'2021-11-02 10:27:45.183188','6','Product object (6)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(40,'2021-11-02 10:28:46.284555','7','Product object (7)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(41,'2021-11-02 10:29:03.716006','8','Product object (8)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(42,'2021-11-02 10:29:41.563917','9','Product object (9)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(43,'2021-11-02 10:30:33.293444','10','Product object (10)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(44,'2021-11-02 10:31:00.333546','11','Product object (11)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(45,'2021-11-02 10:31:20.834060','12','Product object (12)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(46,'2021-11-02 10:31:57.096078','13','Product object (13)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(47,'2021-11-02 10:32:52.251666','14','Product object (14)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(48,'2021-11-02 10:33:12.030439','15','Product object (15)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(49,'2021-11-02 10:33:37.523611','16','Product object (16)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(50,'2021-11-02 10:33:58.229862','17','Product object (17)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(51,'2021-11-02 10:34:25.407237','18','Product object (18)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(52,'2021-11-08 04:56:08.260804','3','Trái Cây',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(53,'2021-11-08 13:46:04.500240','2','Thịt',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(54,'2021-11-09 09:34:53.797034','5','Đồ uống',1,'[{\"added\": {}}]',8,1),(55,'2021-11-09 09:36:39.950893','19','Product object (19)',1,'[{\"added\": {}}]',9,1),(56,'2021-11-09 09:37:37.319806','19','Product object (19)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(57,'2021-11-09 09:39:12.770547','20','Product object (20)',1,'[{\"added\": {}}]',9,1),(58,'2021-11-09 09:40:02.987923','21','Product object (21)',1,'[{\"added\": {}}]',9,1),(59,'2021-11-09 09:40:42.822532','21','Product object (21)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(60,'2021-11-09 09:41:36.113009','22','Product object (22)',1,'[{\"added\": {}}]',9,1),(61,'2021-11-09 09:42:36.250751','23','Product object (23)',1,'[{\"added\": {}}]',9,1),(62,'2021-11-09 09:43:17.620648','24','Product object (24)',1,'[{\"added\": {}}]',9,1),(63,'2021-11-09 09:44:19.012315','25','Product object (25)',1,'[{\"added\": {}}]',9,1),(64,'2021-11-09 09:44:53.468771','24','Product object (24)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(65,'2021-11-09 09:45:53.489674','26','Product object (26)',1,'[{\"added\": {}}]',9,1),(66,'2021-11-09 09:46:55.111681','27','Product object (27)',1,'[{\"added\": {}}]',9,1),(67,'2021-11-09 09:47:54.211173','28','Product object (28)',1,'[{\"added\": {}}]',9,1),(68,'2021-11-09 09:49:46.775089','29','Product object (29)',1,'[{\"added\": {}}]',9,1),(69,'2021-11-09 09:50:49.051203','30','Product object (30)',1,'[{\"added\": {}}]',9,1),(70,'2021-11-09 09:51:29.057979','31','Product object (31)',1,'[{\"added\": {}}]',9,1),(71,'2021-11-09 09:51:55.775993','31','Product object (31)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(72,'2021-11-09 10:13:42.144022','32','Product object (32)',1,'[{\"added\": {}}]',9,1),(73,'2021-11-09 10:15:12.884793','33','Product object (33)',1,'[{\"added\": {}}]',9,1),(74,'2021-11-09 10:16:55.265905','34','Product object (34)',1,'[{\"added\": {}}]',9,1),(75,'2021-11-09 10:18:10.752726','35','Product object (35)',1,'[{\"added\": {}}]',9,1),(76,'2021-11-09 10:19:52.605051','36','Product object (36)',1,'[{\"added\": {}}]',9,1),(77,'2021-11-09 10:20:16.902680','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',9,1),(78,'2021-11-09 10:20:57.207441','36','Product object (36)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(79,'2021-11-09 10:21:55.354510','37','Product object (37)',1,'[{\"added\": {}}]',9,1),(80,'2021-11-09 10:24:00.221913','38','Product object (38)',1,'[{\"added\": {}}]',9,1),(81,'2021-11-09 10:24:53.202026','39','Product object (39)',1,'[{\"added\": {}}]',9,1),(82,'2021-11-09 10:25:44.475459','40','Product object (40)',1,'[{\"added\": {}}]',9,1),(83,'2021-11-09 10:27:24.901567','41','Product object (41)',1,'[{\"added\": {}}]',9,1),(84,'2021-11-09 10:28:10.364473','38','Product object (38)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(85,'2021-11-09 10:29:20.434062','42','Product object (42)',1,'[{\"added\": {}}]',9,1),(86,'2021-11-09 10:30:54.614956','43','Product object (43)',1,'[{\"added\": {}}]',9,1),(87,'2021-11-09 10:31:48.982794','44','Product object (44)',1,'[{\"added\": {}}]',9,1),(88,'2021-11-09 10:32:52.023413','45','Product object (45)',1,'[{\"added\": {}}]',9,1),(89,'2021-11-09 10:34:18.175597','46','Product object (46)',1,'[{\"added\": {}}]',9,1),(90,'2021-11-09 10:35:44.135767','47','Product object (47)',1,'[{\"added\": {}}]',9,1),(91,'2021-11-09 10:37:40.014110','48','Product object (48)',1,'[{\"added\": {}}]',9,1),(92,'2021-11-09 10:38:33.734312','49','Product object (49)',1,'[{\"added\": {}}]',9,1),(93,'2021-11-09 10:39:45.156295','50','Product object (50)',1,'[{\"added\": {}}]',9,1),(94,'2021-11-09 10:41:00.360747','51','Product object (51)',1,'[{\"added\": {}}]',9,1),(95,'2021-11-09 10:42:02.277415','52','Product object (52)',1,'[{\"added\": {}}]',9,1),(96,'2021-11-09 10:44:43.934540','5','Đồ Uống',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(97,'2021-11-09 10:46:08.748440','23','Product object (23)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1);
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

-- Dump completed on 2021-11-09 17:48:22
