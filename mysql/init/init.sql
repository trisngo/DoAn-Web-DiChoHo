-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: dichoho
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add profile',7,'add_profile'),(26,'Can change profile',7,'change_profile'),(27,'Can delete profile',7,'delete_profile'),(28,'Can view profile',7,'view_profile'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add order',10,'add_order'),(38,'Can change order',10,'change_order'),(39,'Can delete order',10,'delete_order'),(40,'Can view order',10,'view_order'),(41,'Can add order item',11,'add_orderitem'),(42,'Can change order item',11,'change_orderitem'),(43,'Can delete order item',11,'delete_orderitem'),(44,'Can view order item',11,'view_orderitem'),(45,'Can add Address',12,'add_address'),(46,'Can change Address',12,'change_address'),(47,'Can delete Address',12,'delete_address'),(48,'Can view Address',12,'view_address'),(49,'Can add Delivery Option',13,'add_deliveryoptions'),(50,'Can change Delivery Option',13,'change_deliveryoptions'),(51,'Can delete Delivery Option',13,'delete_deliveryoptions'),(52,'Can view Delivery Option',13,'view_deliveryoptions'),(53,'Can add Payment Selection',14,'add_paymentselections'),(54,'Can change Payment Selection',14,'change_paymentselections'),(55,'Can delete Payment Selection',14,'delete_paymentselections'),(56,'Can view Payment Selection',14,'view_paymentselections'),(57,'Can add order',15,'add_order'),(58,'Can change order',15,'change_order'),(59,'Can delete order',15,'delete_order'),(60,'Can view order',15,'view_order'),(61,'Can add order item',16,'add_orderitem'),(62,'Can change order item',16,'change_orderitem'),(63,'Can delete order item',16,'delete_orderitem'),(64,'Can view order item',16,'view_orderitem'),(65,'Can add Delivery Option',17,'add_deliveryoptions'),(66,'Can change Delivery Option',17,'change_deliveryoptions'),(67,'Can delete Delivery Option',17,'delete_deliveryoptions'),(68,'Can view Delivery Option',17,'view_deliveryoptions'),(69,'Can add Rating',18,'add_rating'),(70,'Can change Rating',18,'change_rating'),(71,'Can delete Rating',18,'delete_rating'),(72,'Can view Rating',18,'view_rating'),(73,'Can add Payment Selection',19,'add_paymentselections'),(74,'Can change Payment Selection',19,'change_paymentselections'),(75,'Can delete Payment Selection',19,'delete_paymentselections'),(76,'Can view Payment Selection',19,'view_paymentselections'),(77,'Can add Payment Selection',20,'add_paymentoptions'),(78,'Can change Payment Selection',20,'change_paymentoptions'),(79,'Can delete Payment Selection',20,'delete_paymentoptions'),(80,'Can view Payment Selection',20,'view_paymentoptions'),(81,'Can add access attempt',21,'add_accessattempt'),(82,'Can change access attempt',21,'change_accessattempt'),(83,'Can delete access attempt',21,'delete_accessattempt'),(84,'Can view access attempt',21,'view_accessattempt'),(85,'Can add access log',22,'add_accesslog'),(86,'Can change access log',22,'change_accesslog'),(87,'Can delete access log',22,'delete_accesslog'),(88,'Can view access log',22,'view_accesslog'),(89,'Can add access failure',23,'add_accessfailurelog'),(90,'Can change access failure',23,'change_accessfailurelog'),(91,'Can delete access failure',23,'delete_accessfailurelog'),(92,'Can view access failure',23,'view_accessfailurelog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$zeiBjAIXk5DXBLBbNgxhbk$U0pPRFOwSiSM5kXRmQ520u4xWLDAZnAeqZRkaJrhoW4=','2021-11-26 09:27:27.000000',1,'staff','staff','staff','staff@dichoho.com',1,1,'2021-10-22 08:43:39.000000'),(6,'pbkdf2_sha256$260000$f7AA1Piy74zFmKK5gy7W1m$1tmHyCKiDBmg2oKXL1c8q5avFbn5I9hrQBbZbb3iBMw=','2021-11-26 09:56:26.000000',0,'hoangne','Hoàng','Minh','hoangne@gmail.com',0,1,'2021-11-26 09:55:27.000000'),(7,'pbkdf2_sha256$260000$zirO70Chgzo5HWqAdMOrsd$PnOwmgQzW3gvu/0mdz2336Cc5DvcfRMT70Q/kWUSoGQ=','2021-12-19 02:52:27.000000',0,'ductri','Tri','Ngo Duc','ductri@gmail.com',1,1,'2021-11-26 09:57:58.000000'),(8,'pbkdf2_sha256$260000$ertqkWIlECa7Tl91eE3Oss$7loLPns9oM2qGPjrQYR/URkCePhDFmpoTTvu3wE0Mys=','2021-11-26 10:01:12.000000',0,'huy123','Huy','Bui','huybui@gmail.com',0,1,'2021-11-26 10:00:41.000000'),(9,'pbkdf2_sha256$260000$EcFQpyyL2pNuErUoa9ar6q$bfYIJJfZfTqNQcSWd2r0+8mEOHMA0b+FteACHQUIQmA=','2021-11-26 10:11:08.000000',0,'andbd','Anh','Bui Duc','anhbd@gmail.com',0,1,'2021-11-26 10:02:10.000000'),(10,'pbkdf2_sha256$260000$uTdUG7HDwF7yGyMEPGMpd2$vdkHzcX7WzzUHDOWVIc66wWscT7z1JgdL/jhONpi0hY=','2022-05-21 14:21:09.092272',1,'admin','admin','admin','admin@dichoho.com',1,1,'2021-11-26 10:16:04.538637');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axes_accessattempt`
--

DROP TABLE IF EXISTS `axes_accessattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `axes_accessattempt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `http_accept` varchar(1025) NOT NULL,
  `path_info` varchar(255) NOT NULL,
  `attempt_time` datetime(6) NOT NULL,
  `get_data` longtext NOT NULL,
  `post_data` longtext NOT NULL,
  `failures_since_start` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `axes_accessattempt_username_ip_address_user_agent_8ea22282_uniq` (`username`,`ip_address`,`user_agent`),
  KEY `axes_accessattempt_ip_address_10922d9c` (`ip_address`),
  KEY `axes_accessattempt_user_agent_ad89678b` (`user_agent`),
  KEY `axes_accessattempt_username_3f2d4ca0` (`username`),
  CONSTRAINT `axes_accessattempt_chk_1` CHECK ((`failures_since_start` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axes_accessattempt`
--

LOCK TABLES `axes_accessattempt` WRITE;
/*!40000 ALTER TABLE `axes_accessattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `axes_accessattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axes_accessfailurelog`
--

DROP TABLE IF EXISTS `axes_accessfailurelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `axes_accessfailurelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `http_accept` varchar(1025) NOT NULL,
  `path_info` varchar(255) NOT NULL,
  `attempt_time` datetime(6) NOT NULL,
  `locked_out` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `axes_accessfailurelog_user_agent_ea145dda` (`user_agent`),
  KEY `axes_accessfailurelog_ip_address_2e9f5a7f` (`ip_address`),
  KEY `axes_accessfailurelog_username_a8b7e8a4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axes_accessfailurelog`
--

LOCK TABLES `axes_accessfailurelog` WRITE;
/*!40000 ALTER TABLE `axes_accessfailurelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `axes_accessfailurelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axes_accesslog`
--

DROP TABLE IF EXISTS `axes_accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `axes_accesslog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `http_accept` varchar(1025) NOT NULL,
  `path_info` varchar(255) NOT NULL,
  `attempt_time` datetime(6) NOT NULL,
  `logout_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `axes_accesslog_ip_address_86b417e5` (`ip_address`),
  KEY `axes_accesslog_user_agent_0e659004` (`user_agent`),
  KEY `axes_accesslog_username_df93064b` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axes_accesslog`
--

LOCK TABLES `axes_accesslog` WRITE;
/*!40000 ALTER TABLE `axes_accesslog` DISABLE KEYS */;
INSERT INTO `axes_accesslog` VALUES (1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0','192.168.128.1','admin','text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8','/admin/login/','2022-05-21 14:13:00.314404','2022-05-21 14:20:49.901413'),(2,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0','192.168.128.1','admin','text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8','/admin/login/','2022-05-21 14:21:09.120566','2022-05-21 14:21:11.435432');
/*!40000 ALTER TABLE `axes_accesslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_deliveryoptions`
--

DROP TABLE IF EXISTS `checkout_deliveryoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_deliveryoptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `delivery_name` varchar(255) NOT NULL,
  `delivery_price` decimal(6,0) NOT NULL,
  `delivery_method` varchar(255) NOT NULL,
  `delivery_timeframe` varchar(255) NOT NULL,
  `delivery_window` varchar(255) NOT NULL,
  `order` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_deliveryoptions`
--

LOCK TABLES `checkout_deliveryoptions` WRITE;
/*!40000 ALTER TABLE `checkout_deliveryoptions` DISABLE KEYS */;
INSERT INTO `checkout_deliveryoptions` VALUES (1,'Giao Hàng Tiêu Chuẩn',30000,'HD','2-3 ngày','8:00-17:00',1,1),(2,'Giao Hàng Nhanh',50000,'HD','1-2 ngày','9:00-21:00',1,1),(3,'Ninja Van',30000,'HD','2-4 ngày','9:00-21:00',1,1);
/*!40000 ALTER TABLE `checkout_deliveryoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_paymentoptions`
--

DROP TABLE IF EXISTS `checkout_paymentoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_paymentoptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_paymentoptions`
--

LOCK TABLES `checkout_paymentoptions` WRITE;
/*!40000 ALTER TABLE `checkout_paymentoptions` DISABLE KEYS */;
INSERT INTO `checkout_paymentoptions` VALUES (1,'Paypal',1),(2,'Trả tiền khi nhận hàng (COD)',1);
/*!40000 ALTER TABLE `checkout_paymentoptions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-22 08:51:59.775706','2','anhbd123',1,'[{\"added\": {}}]',4,1),(2,'2021-10-22 10:08:01.015222','2','anhbd123',3,'',4,1),(3,'2021-10-22 10:08:15.935828','3','huy123',1,'[{\"added\": {}}]',4,1),(4,'2021-10-24 10:40:53.037040','4','a',3,'',4,1),(5,'2021-10-24 10:41:53.284752','5','a',3,'',4,1),(6,'2021-10-31 03:16:03.748186','1','Cá',1,'[{\"added\": {}}]',8,1),(7,'2021-10-31 03:16:08.012441','2','Thịt',1,'[{\"added\": {}}]',8,1),(8,'2021-10-31 03:16:13.009387','3','Trái cây',1,'[{\"added\": {}}]',8,1),(9,'2021-10-31 03:17:34.731542','1','Product object (1)',1,'[{\"added\": {}}]',9,1),(10,'2021-10-31 03:19:01.052804','2','Product object (2)',1,'[{\"added\": {}}]',9,1),(11,'2021-10-31 03:31:08.602868','3','Product object (3)',1,'[{\"added\": {}}]',9,1),(12,'2021-10-31 03:33:31.513677','4','Product object (4)',1,'[{\"added\": {}}]',9,1),(13,'2021-10-31 03:34:29.178079','5','Product object (5)',1,'[{\"added\": {}}]',9,1),(14,'2021-10-31 03:35:11.512691','6','Product object (6)',1,'[{\"added\": {}}]',9,1),(15,'2021-10-31 03:38:08.671160','7','Product object (7)',1,'[{\"added\": {}}]',9,1),(16,'2021-10-31 03:39:06.378295','6','Product object (6)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(17,'2021-10-31 03:40:23.050585','5','Product object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(18,'2021-10-31 03:41:02.018002','4','Product object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(19,'2021-10-31 03:41:53.665106','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(20,'2021-10-31 03:43:55.217615','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(21,'2021-10-31 03:45:15.967262','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(22,'2021-10-31 03:46:37.563514','8','Product object (8)',1,'[{\"added\": {}}]',9,1),(23,'2021-10-31 03:49:28.526513','9','Product object (9)',1,'[{\"added\": {}}]',9,1),(24,'2021-10-31 03:50:44.730760','10','Product object (10)',1,'[{\"added\": {}}]',9,1),(25,'2021-10-31 03:54:10.770837','11','Product object (11)',1,'[{\"added\": {}}]',9,1),(26,'2021-10-31 03:55:12.236148','12','Product object (12)',1,'[{\"added\": {}}]',9,1),(27,'2021-10-31 03:58:08.178127','13','Product object (13)',1,'[{\"added\": {}}]',9,1),(28,'2021-10-31 03:59:26.844447','14','Product object (14)',1,'[{\"added\": {}}]',9,1),(29,'2021-10-31 04:00:16.545802','4','Rau Củ',1,'[{\"added\": {}}]',8,1),(30,'2021-10-31 04:00:49.255140','15','Product object (15)',1,'[{\"added\": {}}]',9,1),(31,'2021-10-31 04:02:19.784927','16','Product object (16)',1,'[{\"added\": {}}]',9,1),(32,'2021-10-31 04:04:05.814811','17','Product object (17)',1,'[{\"added\": {}}]',9,1),(33,'2021-10-31 04:05:22.852089','18','Product object (18)',1,'[{\"added\": {}}]',9,1),(34,'2021-11-02 10:24:49.404552','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(35,'2021-11-02 10:25:20.023416','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(36,'2021-11-02 10:26:01.539472','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(37,'2021-11-02 10:26:40.270093','4','Product object (4)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(38,'2021-11-02 10:27:19.504608','5','Product object (5)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(39,'2021-11-02 10:27:45.183188','6','Product object (6)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(40,'2021-11-02 10:28:46.284555','7','Product object (7)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(41,'2021-11-02 10:29:03.716006','8','Product object (8)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(42,'2021-11-02 10:29:41.563917','9','Product object (9)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(43,'2021-11-02 10:30:33.293444','10','Product object (10)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(44,'2021-11-02 10:31:00.333546','11','Product object (11)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(45,'2021-11-02 10:31:20.834060','12','Product object (12)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(46,'2021-11-02 10:31:57.096078','13','Product object (13)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(47,'2021-11-02 10:32:52.251666','14','Product object (14)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(48,'2021-11-02 10:33:12.030439','15','Product object (15)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(49,'2021-11-02 10:33:37.523611','16','Product object (16)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(50,'2021-11-02 10:33:58.229862','17','Product object (17)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(51,'2021-11-02 10:34:25.407237','18','Product object (18)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(52,'2021-11-08 04:56:08.260804','3','Trái Cây',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(53,'2021-11-08 13:46:04.500240','2','Thịt',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(54,'2021-11-09 09:34:53.797034','5','Đồ uống',1,'[{\"added\": {}}]',8,1),(55,'2021-11-09 09:36:39.950893','19','Product object (19)',1,'[{\"added\": {}}]',9,1),(56,'2021-11-09 09:37:37.319806','19','Product object (19)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(57,'2021-11-09 09:39:12.770547','20','Product object (20)',1,'[{\"added\": {}}]',9,1),(58,'2021-11-09 09:40:02.987923','21','Product object (21)',1,'[{\"added\": {}}]',9,1),(59,'2021-11-09 09:40:42.822532','21','Product object (21)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(60,'2021-11-09 09:41:36.113009','22','Product object (22)',1,'[{\"added\": {}}]',9,1),(61,'2021-11-09 09:42:36.250751','23','Product object (23)',1,'[{\"added\": {}}]',9,1),(62,'2021-11-09 09:43:17.620648','24','Product object (24)',1,'[{\"added\": {}}]',9,1),(63,'2021-11-09 09:44:19.012315','25','Product object (25)',1,'[{\"added\": {}}]',9,1),(64,'2021-11-09 09:44:53.468771','24','Product object (24)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(65,'2021-11-09 09:45:53.489674','26','Product object (26)',1,'[{\"added\": {}}]',9,1),(66,'2021-11-09 09:46:55.111681','27','Product object (27)',1,'[{\"added\": {}}]',9,1),(67,'2021-11-09 09:47:54.211173','28','Product object (28)',1,'[{\"added\": {}}]',9,1),(68,'2021-11-09 09:49:46.775089','29','Product object (29)',1,'[{\"added\": {}}]',9,1),(69,'2021-11-09 09:50:49.051203','30','Product object (30)',1,'[{\"added\": {}}]',9,1),(70,'2021-11-09 09:51:29.057979','31','Product object (31)',1,'[{\"added\": {}}]',9,1),(71,'2021-11-09 09:51:55.775993','31','Product object (31)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(72,'2021-11-09 10:13:42.144022','32','Product object (32)',1,'[{\"added\": {}}]',9,1),(73,'2021-11-09 10:15:12.884793','33','Product object (33)',1,'[{\"added\": {}}]',9,1),(74,'2021-11-09 10:16:55.265905','34','Product object (34)',1,'[{\"added\": {}}]',9,1),(75,'2021-11-09 10:18:10.752726','35','Product object (35)',1,'[{\"added\": {}}]',9,1),(76,'2021-11-09 10:19:52.605051','36','Product object (36)',1,'[{\"added\": {}}]',9,1),(77,'2021-11-09 10:20:16.902680','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',9,1),(78,'2021-11-09 10:20:57.207441','36','Product object (36)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(79,'2021-11-09 10:21:55.354510','37','Product object (37)',1,'[{\"added\": {}}]',9,1),(80,'2021-11-09 10:24:00.221913','38','Product object (38)',1,'[{\"added\": {}}]',9,1),(81,'2021-11-09 10:24:53.202026','39','Product object (39)',1,'[{\"added\": {}}]',9,1),(82,'2021-11-09 10:25:44.475459','40','Product object (40)',1,'[{\"added\": {}}]',9,1),(83,'2021-11-09 10:27:24.901567','41','Product object (41)',1,'[{\"added\": {}}]',9,1),(84,'2021-11-09 10:28:10.364473','38','Product object (38)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(85,'2021-11-09 10:29:20.434062','42','Product object (42)',1,'[{\"added\": {}}]',9,1),(86,'2021-11-09 10:30:54.614956','43','Product object (43)',1,'[{\"added\": {}}]',9,1),(87,'2021-11-09 10:31:48.982794','44','Product object (44)',1,'[{\"added\": {}}]',9,1),(88,'2021-11-09 10:32:52.023413','45','Product object (45)',1,'[{\"added\": {}}]',9,1),(89,'2021-11-09 10:34:18.175597','46','Product object (46)',1,'[{\"added\": {}}]',9,1),(90,'2021-11-09 10:35:44.135767','47','Product object (47)',1,'[{\"added\": {}}]',9,1),(91,'2021-11-09 10:37:40.014110','48','Product object (48)',1,'[{\"added\": {}}]',9,1),(92,'2021-11-09 10:38:33.734312','49','Product object (49)',1,'[{\"added\": {}}]',9,1),(93,'2021-11-09 10:39:45.156295','50','Product object (50)',1,'[{\"added\": {}}]',9,1),(94,'2021-11-09 10:41:00.360747','51','Product object (51)',1,'[{\"added\": {}}]',9,1),(95,'2021-11-09 10:42:02.277415','52','Product object (52)',1,'[{\"added\": {}}]',9,1),(96,'2021-11-09 10:44:43.934540','5','Đồ Uống',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(97,'2021-11-09 10:46:08.748440','23','Product object (23)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(98,'2021-11-12 01:48:53.438186','52','Product object (52)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(99,'2021-11-12 01:48:59.416572','51','Product object (51)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(100,'2021-11-12 01:49:07.123990','50','Product object (50)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(101,'2021-11-12 01:49:12.603112','49','Product object (49)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(102,'2021-11-12 01:49:19.691670','48','Product object (48)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(103,'2021-11-12 01:51:16.042350','47','Product object (47)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(104,'2021-11-12 01:51:30.004647','46','Product object (46)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(105,'2021-11-12 01:51:39.648627','45','Product object (45)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(106,'2021-11-12 01:52:44.864540','44','Product object (44)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(107,'2021-11-12 01:52:51.524563','43','Product object (43)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(108,'2021-11-12 01:52:59.141900','42','Product object (42)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(109,'2021-11-12 01:53:12.137712','41','Product object (41)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(110,'2021-11-12 01:54:14.434118','40','Product object (40)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(111,'2021-11-12 01:54:23.197904','39','Product object (39)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(112,'2021-11-12 01:54:30.132926','38','Product object (38)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(113,'2021-11-12 01:54:38.618013','37','Product object (37)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(114,'2021-11-12 01:54:47.207807','36','Product object (36)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(115,'2021-11-12 01:55:06.952044','35','Product object (35)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(116,'2021-11-12 01:55:18.759830','34','Product object (34)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(117,'2021-11-12 01:56:30.611947','33','Product object (33)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(118,'2021-11-12 01:56:41.159671','32','Product object (32)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(119,'2021-11-12 01:56:51.667401','31','Product object (31)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(120,'2021-11-12 01:58:29.215754','30','Product object (30)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(121,'2021-11-12 01:58:37.209273','29','Product object (29)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(122,'2021-11-12 01:58:45.705267','28','Product object (28)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(123,'2021-11-12 01:58:54.052627','27','Product object (27)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(124,'2021-11-12 01:59:02.412329','26','Product object (26)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(125,'2021-11-12 01:59:11.367366','25','Product object (25)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(126,'2021-11-12 01:59:21.431797','24','Product object (24)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(127,'2021-11-12 01:59:27.096218','23','Product object (23)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(128,'2021-11-12 02:00:01.430520','20','Product object (20)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(129,'2021-11-12 02:00:07.598892','21','Product object (21)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(130,'2021-11-12 02:00:17.296297','22','Product object (22)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(131,'2021-11-12 02:00:27.318424','17','Product object (17)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(132,'2021-11-12 02:00:33.343734','18','Product object (18)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(133,'2021-11-12 02:00:43.449315','16','Product object (16)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(134,'2021-11-12 02:00:58.607616','15','Product object (15)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(135,'2021-11-12 02:01:05.547664','14','Product object (14)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(136,'2021-11-12 02:01:20.870108','13','Product object (13)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(137,'2021-11-12 02:01:28.325163','12','Product object (12)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(138,'2021-11-12 02:01:36.677315','11','Product object (11)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(139,'2021-11-12 02:01:46.167470','10','Product object (10)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(140,'2021-11-12 02:02:36.475858','8','Product object (8)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(141,'2021-11-12 02:02:42.324597','7','Product object (7)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(142,'2021-11-12 02:02:49.505586','6','Product object (6)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(143,'2021-11-12 02:02:55.488564','9','Product object (9)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(144,'2021-11-12 02:03:06.749636','5','Product object (5)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(145,'2021-11-12 02:03:11.727391','4','Product object (4)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(146,'2021-11-12 02:03:18.520364','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(147,'2021-11-12 02:03:25.671232','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(148,'2021-11-12 02:03:31.645437','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Sold\"]}}]',9,1),(149,'2021-11-25 03:09:09.580633','e2f68fe9-1f86-4f59-b7b0-ea0e83812ebb','Address',1,'[{\"added\": {}}]',12,1),(150,'2021-11-25 08:11:03.829902','1','admins',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(151,'2021-11-25 09:44:52.784012','498787cf-e1ae-4dd3-8ef0-237b4194be27','Rating object (498787cf-e1ae-4dd3-8ef0-237b4194be27)',1,'[{\"added\": {}}]',18,1),(152,'2021-11-25 09:45:19.323636','fc6afc79-e153-4041-bccd-6ce52c1177ca','Rating object (fc6afc79-e153-4041-bccd-6ce52c1177ca)',1,'[{\"added\": {}}]',18,1),(153,'2021-11-25 09:46:02.535433','e4b1d600-e947-476b-a73f-2d9906887bd6','Rating object (e4b1d600-e947-476b-a73f-2d9906887bd6)',1,'[{\"added\": {}}]',18,1),(154,'2021-11-25 13:16:10.963268','fc6afc79-e153-4041-bccd-6ce52c1177ca','Rating object (fc6afc79-e153-4041-bccd-6ce52c1177ca)',3,'',18,1),(155,'2021-11-25 13:16:10.974241','e4b1d600-e947-476b-a73f-2d9906887bd6','Rating object (e4b1d600-e947-476b-a73f-2d9906887bd6)',3,'',18,1),(156,'2021-11-25 13:16:10.979187','498787cf-e1ae-4dd3-8ef0-237b4194be27','Rating object (498787cf-e1ae-4dd3-8ef0-237b4194be27)',3,'',18,1),(157,'2021-11-25 13:20:38.793773','3fd8e4de-77e4-488a-a763-7f3667a8c3a2','Rating object (3fd8e4de-77e4-488a-a763-7f3667a8c3a2)',1,'[{\"added\": {}}]',18,1),(158,'2021-11-25 13:23:11.676123','0a35aec2-7c39-454c-b50c-bc1740ee7b08','Rating object (0a35aec2-7c39-454c-b50c-bc1740ee7b08)',1,'[{\"added\": {}}]',18,1),(159,'2021-11-26 09:30:18.675430','1','Giao Hàng Tiêu Chuẩn',1,'[{\"added\": {}}]',17,1),(160,'2021-11-26 09:30:38.460739','2','Giao Hàng Nhanh',1,'[{\"added\": {}}]',17,1),(161,'2021-11-26 09:31:41.074411','3','Ninja Van',1,'[{\"added\": {}}]',17,1),(162,'2021-11-26 09:38:45.408225','e2f68fe9-1f86-4f59-b7b0-ea0e83812ebb','Address',2,'[{\"changed\": {\"fields\": [\"Postcode\", \"Address Line 1\", \"Address Line 2\", \"Town/City/State\", \"Delivery Instructions\"]}}]',12,1),(163,'2021-11-26 09:54:25.514686','e2f68fe9-1f86-4f59-b7b0-ea0e83812ebb','Address',2,'[{\"changed\": {\"fields\": [\"H\\u1ecd t\\u00ean ng\\u01b0\\u1eddi nh\\u1eadn\", \"\\u0110\\u1ecba ch\\u1ec9 giao h\\u00e0ng\", \"Th\\u00e0nh Ph\\u1ed1/T\\u1ec9nh\"]}}]',12,1),(164,'2021-11-26 09:55:27.908347','6','hoangne',1,'[{\"added\": {}}]',4,1),(165,'2021-11-26 09:56:41.762821','6','hoangne',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Last login\"]}}]',4,1),(166,'2021-11-26 09:57:19.472491','3','huy123',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(167,'2021-11-26 09:57:39.295141','e2f68fe9-1f86-4f59-b7b0-ea0e83812ebb','Address',2,'[{\"changed\": {\"fields\": [\"H\\u1ecd t\\u00ean ng\\u01b0\\u1eddi nh\\u1eadn\"]}}]',12,1),(168,'2021-11-26 09:57:58.233117','7','ductri',1,'[{\"added\": {}}]',4,1),(169,'2021-11-26 09:58:41.610004','7','ductri',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Last login\"]}}]',4,1),(170,'2021-11-26 09:58:56.570334','1','Profile object (1)',2,'[{\"changed\": {\"fields\": [\"Birth date\"]}}]',7,1),(171,'2021-11-26 09:59:11.945524','3','Profile object (3)',2,'[{\"changed\": {\"fields\": [\"Birth date\"]}}]',7,1),(172,'2021-11-26 09:59:22.226392','6','Profile object (6)',2,'[{\"changed\": {\"fields\": [\"Birth date\"]}}]',7,1),(173,'2021-11-26 09:59:28.913118','7','Profile object (7)',2,'[{\"changed\": {\"fields\": [\"Birth date\"]}}]',7,1),(174,'2021-11-26 10:00:15.308764','3','huy123',3,'',4,1),(175,'2021-11-26 10:00:41.195647','8','huy123',1,'[{\"added\": {}}]',4,1),(176,'2021-11-26 10:01:14.731824','8','huy123',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Last login\"]}}]',4,1),(177,'2021-11-26 10:01:47.496325','8','Profile object (8)',2,'[{\"changed\": {\"fields\": [\"Birth date\"]}}]',7,1),(178,'2021-11-26 10:02:11.100456','9','ducanhbd',1,'[{\"added\": {}}]',4,1),(179,'2021-11-26 10:02:50.974978','9','ducanhbd',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Last login\"]}}]',4,1),(180,'2021-11-26 10:04:01.145174','9','Profile object (9)',2,'[{\"changed\": {\"fields\": [\"Birth date\"]}}]',7,1),(181,'2021-11-26 10:06:43.379853','f895d98c-d84b-4ee1-9ce2-04e694c5fe0e','Address',1,'[{\"added\": {}}]',12,1),(182,'2021-11-26 10:07:41.346161','f7fcf3e4-17e7-4880-8be3-fb433c65cf9f','Address',1,'[{\"added\": {}}]',12,1),(183,'2021-11-26 10:08:16.093907','00eba6d6-d1aa-4ae8-987c-ce43289e2168','Address',1,'[{\"added\": {}}]',12,1),(184,'2021-11-26 10:09:06.435918','efa5c8a7-5228-41e2-84c7-a09f23734a91','Address',1,'[{\"added\": {}}]',12,1),(185,'2021-11-26 10:09:52.569004','a17649b1-7cc3-4007-bf9c-006385ef64d3','Address',1,'[{\"added\": {}}]',12,1),(186,'2021-11-26 10:10:33.270776','8d2618a4-5dc9-480e-badb-2d851285ee4d','Address',1,'[{\"added\": {}}]',12,1),(187,'2021-11-28 03:44:19.194516','1','Paypal',1,'[{\"added\": {}}]',20,10),(188,'2021-11-28 03:44:33.445669','2','Trả tiền khi nhận hàng (COD)',1,'[{\"added\": {}}]',20,10),(189,'2021-11-28 03:52:50.672863','14','2021-11-28 03:51:02.823601+00:00',3,'',15,10),(190,'2021-11-28 04:42:42.727144','1','Profile object (1)',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',7,10),(191,'2021-11-28 04:45:02.444454','10','Profile object (10)',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',7,10),(192,'2021-11-28 06:30:29.154114','10','Profile object (10)',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',7,10),(193,'2021-11-28 06:59:53.120982','1','Rating object (1)',1,'[{\"added\": {}}]',18,10),(194,'2021-11-28 08:20:27.100358','9','Profile object (9)',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',7,10),(195,'2021-11-28 08:20:35.848765','8','Profile object (8)',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',7,10),(196,'2021-11-28 08:20:42.784079','7','Profile object (7)',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',7,10),(197,'2021-11-28 08:20:47.170083','6','Profile object (6)',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',7,10),(198,'2021-11-28 08:20:50.753548','1','Profile object (1)',2,'[]',7,10),(199,'2021-11-28 08:20:53.733129','6','Profile object (6)',2,'[]',7,10),(200,'2021-11-28 08:20:57.500352','9','Profile object (9)',2,'[]',7,10),(201,'2021-11-28 08:34:07.361085','9','2021-11-27 14:37:40.722710+00:00',3,'',15,10),(202,'2021-11-28 08:52:18.243256','9','andbd',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,10),(203,'2021-11-28 15:05:39.440308','17','2021-11-28 13:57:26.569064+00:00',2,'[{\"changed\": {\"fields\": [\"Billing status\"]}}]',15,10),(204,'2021-12-19 08:46:10.903211','7','ductri',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,10),(205,'2021-12-19 08:46:32.325598','6','hoangne',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',4,10),(206,'2021-12-19 08:46:54.351855','a17649b1-7cc3-4007-bf9c-006385ef64d3','Address',2,'[{\"changed\": {\"fields\": [\"H\\u1ecd t\\u00ean ng\\u01b0\\u1eddi nh\\u1eadn\"]}}]',12,10),(207,'2021-12-19 08:46:59.177078','8d2618a4-5dc9-480e-badb-2d851285ee4d','Address',2,'[]',12,10),(208,'2022-05-21 14:13:41.811475','1','staff',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Email address\"]}}]',4,10),(209,'2022-05-21 14:15:34.087560','10','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,10),(210,'2022-05-21 14:17:23.790063','9','andbd',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,10),(211,'2022-05-21 14:18:46.083037','10','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,10),(212,'2022-05-21 14:19:59.640856','6','hoangne',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,10),(213,'2022-05-21 14:20:31.705929','8','huy123',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,10);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(21,'axes','accessattempt'),(23,'axes','accessfailurelog'),(22,'axes','accesslog'),(17,'checkout','deliveryoptions'),(20,'checkout','paymentoptions'),(19,'checkout','paymentselections'),(5,'contenttypes','contenttype'),(15,'orders','order'),(16,'orders','orderitem'),(6,'sessions','session'),(12,'shop','address'),(8,'shop','category'),(13,'shop','deliveryoptions'),(10,'shop','order'),(11,'shop','orderitem'),(14,'shop','paymentselections'),(9,'shop','product'),(7,'shop','profile'),(18,'shop','rating');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-22 08:42:28.695640'),(2,'auth','0001_initial','2021-10-22 08:42:29.691532'),(3,'admin','0001_initial','2021-10-22 08:42:29.920919'),(4,'admin','0002_logentry_remove_auto_add','2021-10-22 08:42:29.935876'),(5,'admin','0003_logentry_add_action_flag_choices','2021-10-22 08:42:29.952832'),(6,'contenttypes','0002_remove_content_type_name','2021-10-22 08:42:30.173857'),(7,'auth','0002_alter_permission_name_max_length','2021-10-22 08:42:30.374268'),(8,'auth','0003_alter_user_email_max_length','2021-10-22 08:42:30.425132'),(9,'auth','0004_alter_user_username_opts','2021-10-22 08:42:30.443083'),(10,'auth','0005_alter_user_last_login_null','2021-10-22 08:42:30.562793'),(11,'auth','0006_require_contenttypes_0002','2021-10-22 08:42:30.568748'),(12,'auth','0007_alter_validators_add_error_messages','2021-10-22 08:42:30.585702'),(13,'auth','0008_alter_user_username_max_length','2021-10-22 08:42:30.684438'),(14,'auth','0009_alter_user_last_name_max_length','2021-10-22 08:42:30.793147'),(15,'auth','0010_alter_group_name_max_length','2021-10-22 08:42:30.833060'),(16,'auth','0011_update_proxy_permissions','2021-10-22 08:42:30.851992'),(17,'auth','0012_alter_user_first_name_max_length','2021-10-22 08:42:30.962694'),(18,'sessions','0001_initial','2021-10-22 08:42:31.098330'),(19,'shop','0001_initial','2021-10-22 08:42:31.376524'),(20,'shop','0002_remove_profile_hobby','2021-10-22 08:42:31.467281'),(21,'shop','0003_category_product','2021-10-31 02:42:20.812124'),(22,'shop','0004_alter_product_price','2021-10-31 02:42:20.929807'),(23,'shop','0005_alter_product_price','2021-10-31 02:42:21.048492'),(24,'shop','0006_alter_product_image','2021-10-31 02:42:21.065448'),(25,'shop','0007_alter_product_image','2021-10-31 03:30:13.235094'),(26,'shop','0008_auto_20211111_1030','2021-11-12 01:35:23.536392'),(27,'shop','0009_auto_20211111_1057','2021-11-12 01:35:23.853509'),(28,'shop','0010_auto_20211111_1108','2021-11-12 01:35:23.888415'),(29,'shop','0011_auto_20211111_1258','2021-11-12 01:35:24.032221'),(30,'shop','0012_product_sold','2021-11-12 01:35:24.137938'),(31,'checkout','0001_initial','2021-11-25 03:07:06.516781'),(32,'shop','0013_auto_20211125_0051','2021-11-25 03:07:07.326127'),(33,'orders','0001_initial','2021-11-25 03:07:07.783902'),(34,'orders','0002_alter_orderitem_price','2021-11-25 03:07:07.893641'),(35,'shop','0014_rating','2021-11-25 09:41:38.425179'),(36,'checkout','0002_paymentselections','2021-11-25 13:12:56.098006'),(37,'shop','0014_auto_20211125_1725','2021-11-25 13:16:27.367958'),(38,'shop','0015_merge_0014_auto_20211125_1725_0014_rating','2021-11-25 13:16:27.374970'),(39,'shop','0015_product_users_wishlist','2021-11-26 01:58:46.861594'),(40,'shop','0016_merge_20211126_0858','2021-11-26 01:58:46.873548'),(41,'shop','0017_remove_product_sold','2021-11-26 01:58:47.064164'),(42,'shop','0015_auto_20211126_1008','2021-11-26 03:09:18.481929'),(43,'shop','0015_auto_20211126_1016','2021-11-26 03:17:40.542988'),(44,'shop','0016_auto_20211126_1651','2021-11-26 09:51:49.202865'),(45,'shop','0017_auto_20211126_1706','2021-11-26 10:06:12.206429'),(46,'shop','0018_auto_20211127_0653','2021-11-27 11:10:47.058063'),(47,'shop','0019_remove_address_postcode','2021-11-27 11:10:47.143066'),(48,'shop','0020_auto_20211127_0804','2021-11-27 11:10:47.292076'),(49,'shop','0021_product_sold','2021-11-27 11:10:47.355074'),(50,'shop','0022_alter_rating_rating_id','2021-11-27 11:26:41.560711'),(51,'shop','0023_delete_rating','2021-11-27 11:27:15.955566'),(52,'shop','0024_rating','2021-11-27 11:27:57.401384'),(53,'checkout','0003_delete_paymentselections','2021-11-28 03:17:26.596232'),(54,'checkout','0004_auto_20211128_1043','2021-11-28 03:43:56.300859'),(55,'shop','0025_alter_profile_profile_pic','2021-11-28 04:39:45.767460'),(56,'shop','0026_alter_profile_phone','2021-11-28 05:31:32.015482'),(57,'checkout','0005_auto_20211219_1025','2021-12-19 03:26:07.256072'),(58,'axes','0001_initial','2022-05-21 14:10:13.420341'),(59,'axes','0002_auto_20151217_2044','2022-05-21 14:10:13.857832'),(60,'axes','0003_auto_20160322_0929','2022-05-21 14:10:13.888526'),(61,'axes','0004_auto_20181024_1538','2022-05-21 14:10:13.924046'),(62,'axes','0005_remove_accessattempt_trusted','2022-05-21 14:10:13.980219'),(63,'axes','0006_remove_accesslog_trusted','2022-05-21 14:10:14.038522'),(64,'axes','0007_alter_accessattempt_unique_together','2022-05-21 14:10:14.111592'),(65,'axes','0008_accessfailurelog','2022-05-21 14:10:14.268191'),(66,'shop','0027_rating_created_at','2022-05-21 14:10:14.346901'),(67,'shop','0028_alter_rating_created_at','2022-05-21 14:10:14.382988'),(68,'shop','0029_auto_20220428_2039','2022-05-21 14:10:14.463147'),(69,'shop','0030_alter_rating_options','2022-05-21 14:10:14.495517');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2dn49tig7g86nlbivzwmy7ykio33m715','.eJxd0DsOwjAMBuC7eEZVbCdt2pGdM1R50gJqoY8BIe5OIyHUsHjwZ_22_AJnpgWaF8hU7lPvAjRQSiUEHOCxPKHB9wFwr7jhT2lT5oy1-mPaMwmRZ7Pas_xTqfday2z15q1Zl65d5zC1vU_bIetZ465hSOAvZjiPhRuHZeptkUaKr87FafThdvzOZgGdmbt0FkVi9oIMCsRKC4MyRFahYudrpSOXWGNQVEYXZdheoMla55mk8Kqy8P4ANoJqHQ:1mqFuc:l-UjSgiKzXOLf9JEgKv0IfkVvshSrl8Z1iLWIdxVxPE','2021-12-09 14:39:46.539991'),('2hl7l6kh3mom2oswrmcv9y8om0mq8jn2','eyJjYXJ0Ijp7fX0:1myqQU:8BHXyw3uHXjLjChPQ3vyn465o2kkrMGkBJ3ct_94xps','2022-01-02 07:16:10.720163'),('52q7oq3qu9g4n0zeqcb043l79t92wjxj','eyJjYXJ0Ijp7fX0:1myqlX:-cYdWZlVWbaHFY9krBAc5nykPV_p4yz9NdnN_Q_tLgc','2022-01-02 07:37:55.969192'),('5vu7agez7z1pppyw7xgrov7kjrs0mkoe','eyJjYXJ0Ijp7fX0:1myqUI:1aMC8TJ3q-YEdHZfBS1kT3Rh99mrBFO1CkQyvHTyybQ','2022-01-02 07:20:06.861244'),('6dcm4lksxzja4dhi9uheedjo1kdyfozq','eyJjYXJ0Ijp7fX0:1mpsgI:HpGAF8enD2fU8YHyrQAAgL8na74RcLuwEhI7AgSuPV0','2021-12-08 13:51:26.189112'),('asatl6ungxm8jh6kmp36z9tmk194r7tm','.eJxdzDkOg0AMBdC7uEbI48zCUKbPGZBnIZBEkLAUEeLuYSQKSOPC7_-_gOdhgnIBJdJ9D62PUAJJRIQMPtMXSrFmoPDIyqozS3lk-9-W6sgFndqbVzxPTTWPcajasCVE4sPTsX_GLkl4cHfvc99309C6PEXyXcf81of4uu7Z00DDY5N2LZoao2EptHNSRFfoOjguDCEZJG2cII9E0YgCLWlLMnqvFPsLW-Fg_QEr41rL:1myoVi:3GNuqAK7-dw40pY3sfWfvV3sUhekI2bKDzh_y9LCnqE','2022-01-02 05:13:26.623102'),('bgo1aufctqddbdzrxjdchowmzyba65fi','eyJjYXJ0Ijp7fX0:1mynH4:36_9MikBgEhQc26n2Y5BWH7ZQVH-4o4MA2YfzzbJuqk','2022-01-02 03:54:14.208428'),('ckdwvxaw79xijcouuv67nw44riyqt019','eyJjYXJ0Ijp7fX0:1myqQE:KSlGRSihiNrQ-ZrtpLEgfEsXsG1n_kxU4BWwAS4pI4k','2022-01-02 07:15:54.311874'),('di35qq44r4awr4768tpn0cbhc0rcmzdg','eyJjYXJ0Ijp7fX0:1mpsmE:tggpIj-bpp2VdcNA9yBE4Y5Vcx9V3lte-psN2PCvFec','2021-12-08 13:57:34.879018'),('f31x51ub3bqlq3uxj61pxzeyq3x3edqo','eyJjYXJ0Ijp7fX0:1mrYEQ:-4xzFY_yF2e2VLGHSv2AY9XyE-YVK0ACavEx1D_iXiM','2021-12-13 04:25:34.320734'),('icahs9hwz1fpvfl9p6alk4clcci7aah0','.eJxVzD0OgzAMhuG7eEaR4-aHMHbvGZATQqGtoIUwVIi7l0gMdPHg59W3QuApQbWClvm-pz5EqIAUIkIBn_SFSm4FaDyzdvrMu9e8pK5e5jjVfbMXMvPp6Tk845ClefBwH0UYhzT1XuREHDqL29jE1_Vo_wY6nru869C2GC0rabxXMvrStI3n0hKSRTLWSwpIFK0s0ZFxpGIIWnO4sJMeth-ol0qe:1mt5Al:v4MleCcuWP4MiEnSpuklx_OcY-VVSpGW1_L9DW_fQ-0','2021-12-17 09:48:07.156682'),('ille6rqsvymz4loewnfda1kwfxweihnc','eyJjYXJ0Ijp7fX0:1nsPyh:5mySlODYvA84R2ExCMzYQqm_DR_fuoQkJa9nEMfufgk','2022-06-04 14:21:11.464243'),('m5iztm2xhpvmdnnaugv7e0pa66408mc1','eyJjYXJ0Ijp7fX0:1mpsgb:xk2tNyNmTpBRo83X9V-4jHRKZ3izqZdR7objiww4JE4','2021-12-08 13:51:45.631774'),('mbdp5w42iln09ayc1bc0daxqye4dy4m1','eyJjYXJ0Ijp7fX0:1mq5wa:jbCoBtZCJGwirWtsa1QTHA0aQOSrKxjFEpIfAH80iAo','2021-12-09 04:01:08.719095'),('nuh1zcj3xai5z4e24qbr8z27jaeyavqb','eyJjYXJ0Ijp7fX0:1nsPyt:eXtzlL75AhXHGaIZLc3UUBxDWR3rliZmCOYur8GasMM','2022-06-04 14:21:23.754572'),('qo1juoz7vy7nffv1815qhyr95x1rhu19','.eJxdkMtuhDAMRf_F6wEl5EHCcvb9BuQ4ptAH0BAWo1H_vTBlMczGsnyurXt9B8KUobmDEXud00AMDRhvhIAL_OQbNPL3Ato_Y1u9YnXaduIF62fs9QlvvMU19-26cGqHuClqOM0C0iePO4gfOL5PJU1jTkMod0l50KV8myJ_XQ_t6UCPS79tdwZtLS3FIH1AybWj4NEwkla6i-iiIu-VYSlQdVZiRbpDjFwblJp3Vxhj4mXZ4xztv2MhOKCNtogSsdDIrvCupoJYq8p5rqR1sCWd10SbG378A2_fPOZ2mvMwjY9X_AGURHs-:1mrB7i:a_QRtWTkYuev6aqbIeFFEZBbLIS1VN69gI3hd1uVNPw','2021-12-12 03:45:06.568351'),('u4vhmbw27rz1d57ur96ph5k8d44aiq1g','.eJxVjLsOgzAMAP_FcxU5LiSEsTvfgGzHFNoKJB4T4t8rJBbWu9PtoDyvUO_HA1re1r7dFpvbIUMNHuEGhfVr42nyh8f35HQa13kQdybusotrpmy_19XeBj0v_flNGDu0yIUPIoU3qUKXhatISBEpRPGkSGTRV5goJCpMtSxZn5y8wPEHNy86pg:1myrpC:8h13wCVa08dyib0AbeE4L-hVAP-wqBOgjfslkW8BbOo','2022-01-02 08:45:46.750124'),('vd12qi03hooraf5ap0eo74a7bkaxjqlj','eyJjYXJ0Ijp7fX0:1mynjJ:iuUJP7CP_RmNUMPVBQ4osfaD_dYKnUW4EuRF9YQXarE','2022-01-02 04:23:25.071714'),('w66f6v0s5j5m5aod4q3a2dgtwk06ldwj','eyJjYXJ0Ijp7fX0:1mr0AX:Wv57Fwjk4f2IoncqdZddugzy_faCt9TO6f1V2GZUSUE','2021-12-11 16:03:17.143317'),('woa0y17pb5r5cnxenrisuo0g30280x56','.eJxVjLsOgzAMAP_FcxU5LiSEsTvfgGzHFNoKJB4T4t8rJBbWu9PtoDyvUO_HA1re1r7dFpvbIUMNHuEGhfVr42nyh8f35HQa13kQdybusotrpmy_19XeBj0v_flNGDu0yIUPIoU3qUKXhatISBEpRPGkSGTRV5goJCpMtSxZn5y8wPEHNy86pg:1mqYHs:QEPkuPZYiAAVyoPDXF_6G9x2EfSF11y88eI1IbRuTcU','2021-12-10 10:17:00.237240'),('xwqraswajvekg0s02rxjxrmz9m75b9ba','eyJjYXJ0Ijp7fX0:1mrYNt:esliOl-BpT_5mW7aCW-VPlHA0BTxW92ACTzxduu4n9Q','2021-12-13 04:35:21.233185'),('z67jwjhyhfvn5dn4hdxfzx7wkjjkdzpp','eyJjYXJ0Ijp7fX0:1mynk5:aeVPi5GG6NdOSpfV0_cqVBsniY0b4zptfIDauxwuSp0','2022-01-02 04:24:13.127135');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_address` (
  `id` char(32) NOT NULL,
  `phone` varchar(10) NOT NULL,
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
INSERT INTO `shop_address` VALUES ('00eba6d6d1aa4ae8987cce43289e2168','1234567890','45-47 Phan Đăng Lưu, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh 700000, Việt Nam','Không có','2021-11-26 10:08:16.090904','2021-11-26 10:08:16.090904',0,7,'Thành phố Hồ Chí Minh','Đức Trí'),('8d2618a45dc9480ebadb2d851285ee4d','1234567890','324 Chu Văn An, Phường 12, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:10:33.268767','2021-12-19 08:46:59.175071',1,7,'Thành phố Hồ Chí Minh','Ngô Đức Trí'),('a17649b17cc34007bf9c006385ef64d3','1234567890','Cầu, Thảo Điền, Quận 2, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:09:52.567005','2021-12-19 08:46:54.345859',1,6,'Thành phố Hồ Chí Minh','Minh Hoàng'),('e2f68fe91f864f59b7b0ea0e83812ebb','0123456789','24 Đ. Số 1, Phường 11, Gò Vấp','quẹo dô hẻm','2021-11-25 03:09:09.578601','2021-11-26 09:57:39.293153',1,1,'Thành phố Hồ Chí Minh','Admin'),('efa5c8a7522841e284c7a09f23734a91','1234567890','2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1','Không có','2021-11-26 10:09:06.433937','2021-11-26 10:09:06.433937',1,8,'Thành phố Hồ Chí Minh','Bùi Quốc Huy'),('f7fcf3e417e748808be3fb433c65cf9f','1234567890','252 Nam Kỳ Khởi Nghĩa, Phường 8, Quận 3, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:07:41.343150','2021-11-26 10:07:41.343150',0,9,'Thành phố Hồ Chí Minh','Anh Bùi Đức'),('f895d98cd84b4ee19ce204e694c5fe0e','1234567890','20/8C Thống Nhất, Phường 16, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam','Không có','2021-11-26 10:06:43.376855','2021-11-26 10:06:43.376855',1,9,'Thành phố Hồ Chí Minh','Bùi Đức Anh');
/*!40000 ALTER TABLE `shop_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_category_name_11b68823` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'Cá','ca'),(2,'Thịt','thit'),(3,'Trái Cây','trai-cay'),(4,'Rau Củ','rau-cu'),(5,'Đồ Uống','do-uong');
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

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
  `price` decimal(10,0) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  `created_by_id` int NOT NULL,
  `sold` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  KEY `shop_product_created_by_id_9cc24d1b_fk_auth_user_id` (`created_by_id`),
  KEY `shop_product_slug_30bd2d5d` (`slug`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  CONSTRAINT `shop_product_created_by_id_9cc24d1b_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'Dưa leo túi 500g','admin','Dưa leo hay còn gọi là dưa chuột, là một loại quả thuộc họ Bầu bí, khi ăn có vị ngọt nhẹ và thanh mát. Đây là loại quả có hàm lượng nước và chất xơ cao cùng với các khoáng chất có lợi cho sức khỏe. Vì thế, dưa leo không chỉ được dùng như một loại nguyên liệu chế biến món ăn mà còn được xem là một thần dược trong việc làm đẹp.','templates/static/images/dua-leo-vi-500g-202009292350252470_i4d8qW0.jpg','dua-leo-500g',15000,1,1,'2021-10-31 03:17:34.728550','2021-11-12 02:03:31.643443',4,1,34),(2,'Cam vàng nhập khẩu túi 1kg','admin','Cam nhập khẩu 100% từ Úc (giấy chứng nhận nguồn gốc xuất xứ). Đạt tiêu chuẩn xuất khẩu toàn cầu. Bảo quản tươi ngon đến tận tay khách hàng. Trái to tròn, màu vàng tươi, mùi thơm thanh mát. Múi cam to, tép mọng nước, vị chua dịu, thích hợp để vắt nước.','templates/static/images/cam-vang-valencia-uc-hop-1kg-4-5-trai-202101271645511757_NC8EO3Q.jpg','cam-vang-1kg',65000,1,1,'2021-10-31 03:19:01.050807','2021-11-12 02:03:25.667207',3,1,10),(3,'Táo Star nhập khẩu túi 1kg','admin','Táo Star nhập khẩu New Zealand là giống táo lai từ một nhánh đặc biệt của giống cây táo Royal Gala, được trồng nhiều tại vùng đồng bằng ở Waimea thuộc vùng Nelson của New Zealand. Táo có màu đỏ tươi vô cùng bắt mắt, sáng mịn, vỏ mỏng bóng, cuốn hút ngay từ cái nhìn đầu tiên.','templates/static/images/tao-star-nhap-khau-tui-1kg-202108302002485834_kvQ22RD.jpg','tao-star-tui-1kg',69000,1,1,'2021-10-31 03:31:08.600904','2021-11-12 02:03:18.510804',3,1,1),(4,'Kiwi xanh Zespri hộp 500g','admin','Loại trái cây xuất xứ từ New Zealand có vỏ nâu và nhiều lông, bên trong có màu xanh, tươi, đep mắt.  Kiwi có rất nhiều lợi ích cho sức khỏe như giúp vết thương nhanh lành, hỗ trợ giấc ngủ và tăng cường tỉnh táo và buổi sáng. Cam kết giao đúng khối lượng, chất lượng và an toàn','templates/static/images/kiwi-xanh-zespri-hop-500g-202108191526551273_CsIKlTR.jpg','kiwi-xanh-zespri-hop-500g',64500,1,1,'2021-10-31 03:33:31.512679','2021-11-12 02:03:11.722396',3,1,0),(5,'Hồng giòn nhập khẩu Trung Quốc 1kg','admin','Hồng giòn nhập khẩu từ Trung Quốc là loại trái cây nhập khẩu được nhiều người yêu thích. Loại trái cây này có độ giòn ngọt, màu vàng sẫm, trung bình mỗi trái có trọng lượng từ 200g đến 400g.  Khi thưởng thức loại hồng này sẽ có cảm giác giòn giòn và dai dai. Vị ngọt của loại quả này khá là thanh, khiến bạn ăn hoài mà không bị ngán.','templates/static/images/hong-gion-nhap-khau-new-zealand-1kg-202109231416203868_7lJVfmJ.jpg','hong--tq-1kg',49000,1,1,'2021-10-31 03:34:29.177052','2021-11-12 02:03:06.746640',3,1,0),(6,'Xoài cát Hoà Lộc túi 1kg','admin','Trong các loại xoài ngon ở nước ta thì không thể không nhắc đến xoài cát Hoà Lộc, đây được xem là loại trái cây nội địa đặc sản của miền Tây bởi hương vị thơm ngon, màu sắc bắt mắt, nguồn dinh dưỡng cao. Không chỉ nổi tiếng ở trong nước, xoài cát Hoà Lộc còn là loại trái cây xuất khẩu top đầu trong các loại hoa quả sạch trên thế giới.','templates/static/images/xoai-cat-hoa-loc-tui-1kg-202103180811509891_TE90F4F.jpg','xoai-cat-hoa-loc-tui-1kg',55000,1,1,'2021-10-31 03:35:11.510697','2021-11-12 02:02:49.504620',3,1,1),(7,'Thịt đùi heo G khay 300g','admin','Thịt đùi heo G được đóng gói và bảo quản đạt các tiêu chuẩn về an toàn toàn thực phẩ. Thịt đùi nạc nhiều, ít mỡ nên rất thích hợp cho người có chế độ ăn kiêng, giảm cân có thể chiên, kho, luộc hoặc xào với rau. Có thể dùng điện thoại quét mã QR trên tem sản phẩm để kiểm tra nguồn gốc.','templates/static/images/thit-dui-heo-khay-300g-202106021336492345_Ywq8Nk9.jpg','thit-dui-heo-g-khay-300g',48500,1,1,'2021-10-31 03:38:08.670163','2021-11-12 02:02:42.315915',2,1,1),(8,'Thịt vai heo nhập khẩu túi 500g','admin','Thịt vai heo của thương hiệu CP được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon của thực phẩm, xuất xứ rõ ràng. Thịt vai heo mềm, mọng nước nên thường được các bà nội trợ dùng để nấu cháo, luộc hoặc xào với rau củ.','templates/static/images/thit-vai-heo-nhap-khau-tui-500g-202110191757526752_3CKaqii.jpg','thit-vai-heo-nhap-khau-tui-500g',72500,1,1,'2021-10-31 03:46:37.551787','2021-11-12 02:02:36.464409',2,1,0),(9,'Thịt bò Úc xay khay 250g','admin','Rất thuận tiện chế biến nhiều món ngon. Thịt có cả nạc và mỡ xen lẫn cho hương vị béo ngậy tăng thêm phần hấp dẫn cho các món ăn. thích hợp để làm các món như hamburger,cháo,súp,bò viên. Thịt bò Úc xay khay 250g tươi ngon được sản xuất ở Úc bởi Pacow, đã được kiểm duyệt chặc chẽ nên đảm bảo an toàn.','templates/static/images/thit-bo-uc-xay-pacow-khay-250g-202105121346559240_RkC7gSc.jpg','thit-bo-uc-xay-khay-250g',82000,1,1,'2021-10-31 03:49:28.525512','2021-11-12 02:02:55.485501',2,1,0),(10,'Đùi bò nhập khẩu đông lạnh túi 500g','admin','Thịt đùi bò nhập khẩu là phần thịt mông hay đùi sau của bò, ưu điểm của phần thịt này là nhiều nạc, ít mỡ, thịt mềm. Là món ăn tuyệt vời cho bữa tối cuối tuần, đặc biệt là khi kết hợp với các món ăn tiện lợi như khoai tây nghiền hoặc cơm. Với phương pháp làm đông lạnh cấp tốc từ những miếng thịt bò nhập khẩu từ Úc/Canada... tươi ngon trong thời gian nhanh nhất, điều này giúp các dinh dưỡng thất thoát sẽ ít hơn, chất lượng sẽ được giữ không kém gì so với thịt bò tươi.','templates/static/images/dui-bo-nhap-khau-dong-lanh-tui-500g-202110021939273907_RQKMEsi.jpg','dui-bo-nhap-khau-dong-lanh-tui-500g',153000,1,1,'2021-10-31 03:50:44.727795','2021-11-12 02:01:46.163451',2,1,0),(11,'Nạc mông trâu nhập khẩu túi 300g','admin','Thịt mông trâu là phần thịt được lấy từ mông của con trâu. Phần thịt này thường không có xương, có lớp mỡ nhẹ ngoài bề mặt và bên trong rất nạc, không có mỡ xen lẫn trong thịt. Thịt nạc mông trâu gần như chỉ toàn thịt nạc nhưng dai hơn một số phần thịt khác vì các cơ chân thường vận động nhiều ảnh hưởng lên phần mông, có một chút gân, vì thế chế biến thịt mông trâu tương đối khó vì nếu không khéo thì thịt sẽ rất dai và khô, làm mất vị ngon của món ăn.','templates/static/images/nac-mong-trau-nhap-khau-tui-300g-202105081657246580_TOkBOPC.jpg','nac-mong-trau-nhap-khau-tui-300g',53500,1,1,'2021-10-31 03:54:10.768843','2021-11-12 02:01:36.675321',2,1,0),(12,'Má đùi gà nhập khẩu túi 500g','admin','Má đùi gà nhập khẩu của Bách Hóa Xanh được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon của thực phẩm, xuất xứ rõ ràng. Thịt chắc, ngọt nên thường được dùng để chế biến các món nướng BBQ, chiên nước mắm.','templates/static/images/ma-dui-ga-nhap-khau-tui-500g-202107101441012437_LgAcmdi.jpeg','ma-djui-ga-nhp-khu-tui-500g',23500,1,1,'2021-10-31 03:55:12.235180','2021-11-12 02:01:28.312711',2,1,0),(13,'Hộp 30 trứng cút tươi T.Food 30 trứng','admin','Hộp 30 trứng cút tươi của T.Food được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm. Trứng cút tròn, đều.Trứng cút thì bạn có thể luộc chín chế biến thành một số món ăn như: trứng cút hun khói, xíu mại trứng cút,..','templates/static/images/vi-30-trung-cut-loai-1-vfarm-202010261554134965_5oVAp9S.jpg','hop-30-trung-cut-tuoi-tfood-30-trng',25000,1,1,'2021-10-31 03:58:08.176135','2021-11-12 02:01:20.867117',2,1,1),(14,'Hộp 10 trứng vịt V.Food 10 trứng','admin','Hộp 10 trứng vịt của Bách Hóa Xanh được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm. Trứng vịt của Bách Hóa Xanh to tròn, đều. Đây là sản phẩm thích hợp để nấu các món như trứng chiên thịt, cháo trứng vịt,...','templates/static/images/hop-10-trung-vit-vfood-202102050230472043_hpC3ziM.jpg','hop-10-trung-vit-vfood-10-trung',38000,1,1,'2021-10-31 03:59:26.840461','2021-11-12 02:01:05.545670',2,1,0),(15,'Rau mồng tơi baby túi 300g','admin','Rau mồng tơi Bách Hóa Xanh có  hàm lượng calo và chất béo thấp, nhưng lại chứa lượng lớn Vitamin, khoáng chất thiết yếu và các hợp chất chống oxy hóa giúp cho quá trình tiêu hóa diễn ra hiệu quả hơn và ngăn ngừa các vấn đề về đường ruột. Thực phẩm vàng cho phụ nữ mang thai và trẻ em.','templates/static/images/rau-mong-toi-baby-tui-300g-202011071653168977_YOTYqEF.jpg','rau-mong-toi-baby-tui-300g',9000,1,1,'2021-10-31 04:00:49.253148','2021-11-12 02:00:58.606588',4,1,0),(16,'Bông cải trắng túi 500g','admin','Bông cải trắng của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Hàm lượng dinh dưỡng cao, vị giòn ngọt nên thường được dùng để chế biến các món xào hoặc luộc, giúp tăng cường miễn dịch.','templates/static/images/bong-cai-trang-tui-500g-202105181408034973_JkI9GrQ.jpg','bong-cai-trang-tui-500g',35000,1,1,'2021-10-31 04:02:19.782931','2021-11-12 02:00:43.448318',4,1,0),(17,'Cá thát lát rút xương muối sả ớt gói 250g','admin','Cá thác lác nguyên con được rút xương và ướp sẵn với sả, ớt mua về chỉ việc chế biến thôi, rất tiện lợi và tiết kiệm thời gian. Cá thát lát rút xương muối sả ớt có thể chiên hoặc nướng đều rất ngon. Vì được tẩm ướp sẵn nên rất vừa ăn, không có thời gian nấu ăn thì hãy thử ngay với món này nhé.','templates/static/images/ca-that-lat-rut-xuong-muoi-sa-ot-goi-250g-202005251508319356_oSXyU7a.jpg','ca-that-lat-rut-xuong-muoi-sa-ot-goi-250g',70000,1,1,'2021-10-31 04:04:05.810822','2021-11-12 02:00:27.315430',1,1,0),(18,'Cá diêu hồng làm sạch khay 500g','admin','Cá điêu hồng loại cá phổ biến có thịt nhiều, ít xương, thịt trắng, ngọt và lành tính, cá điêu hồng chế biến thành rất nhiều món ngon trong bữa cơm gia đình như cá điêu hồng kho, cá điêu hồng nấu canh chua, cá điêu hồng chiên giòn, cá điêu hồng sốt cà chua,...','templates/static/images/ca-dieu-hong-lam-sach-khay-500g-giao-ngau-nhien-phan-dau-hoac-d_PvKewBE.jpeg','ca-dieu-hong-lam-sach-khay-500g',48000,1,1,'2021-10-31 04:05:22.850064','2021-11-12 02:00:33.333269',1,1,0),(19,'Nước uống có thạch dừa Mogu Mogu vị xoài','admin','Thức uống trái cây được ưa chuộng tại Thái Lan với nhiều hương vị thơm ngon, cung cấp nước và các vitamin thiết yếu cho cơ thể. Là thức uống giải khát tuyệt vời cho những người vận động mạnh, cần bổ sung năng lượng cho cơ thể, lứa tuổi học sinh, sinh viên...','templates/static/images/nuoc-uong-co-thach-dua-mogu-mogu-vi-xoai-320ml-20201127082958029_6EePo9l.jpg','nuoc-uong-co-thach-da-mogu-mogu-vi-xoai',18000,1,1,'2021-11-09 09:36:39.946903','2021-11-09 09:37:37.314817',5,1,0),(20,'Nước ép nho Aroma 1 lít','admin','Từ 100% trái cây tươi, được chọn lọc kỹ càng từ những khâu canh tác trên những cánh đồng chuyên canh, đến khâu đóng gói, bao bì, cho ra những sản phẩm nước trái cây nguyên chất, thơm ngon nhất, tốt cho sức khỏe. Sản phẩm thơm ngon bổ dưỡng cung cấp vitamin và năng lượng cho cơ thể khỏe mạnh','templates/static/images/nuoc-ep-nho-aroma-1-lit-202005071323079263_EWXkVOv.jpg','nuoc-ep-nho-aroma-1-lit',35000,1,1,'2021-11-09 09:39:12.768551','2021-11-12 02:00:01.421907',5,1,0),(21,'Trà sữa Aik Cheong It\'s Teh Tarik ly 72g','admin','Sản phẩm trà sữa hòa tan vốn đã tiện lợi nhanh chóng nay thêm dạng ly giấy thiết kế hiện đại ấn tượng cực thích. Trà sữa Aik Cheong It\'s Teh Tarik ly 72g nhanh chóng mang lại hương vị ngọt ngào, thơm béo cho cảm giác đã thèm thích thú. Sản phẩm phẩm chất lượng của trà Aik Cheong','templates/static/images/tra-sua-aik-cheong-its-teh-tarik-ly-72g-202110222156503519_43nJD5Z.jpg','tra-sua-aik-cheong-its-teh-tarik-ly-72g',23500,1,1,'2021-11-09 09:40:02.986925','2021-11-12 02:00:07.596804',5,1,0),(22,'Cà phê sữa hòa tan NesCafé Latte vị sô cô la 240g','admin','Sản phẩm cà phê hòa tan tiện lợi thơm ngon tư thương hiệu Nescafé. Cà phê sữa hòa tan NesCafé Latte vị sô cô la 240g được sản xuất từ những nguyên liệu tuyển chọn tạo mang đến ly cafe Latte đúng điệu hòa quyện với hương vị mê hoặc khó cưỡng như chocolate hảo hạng','templates/static/images/ca-phe-sua-hoa-tan-nescafe-latte-vi-so-co-la-240g-20211020163050_fjuTcWi.jpg','ca-phe-sa-hoa-tan-nescafe-latte-v-so-co-la-240g',45000,1,1,'2021-11-09 09:41:36.111028','2021-11-12 02:00:17.294296',5,1,0),(23,'Trà Atisô Lama hộp 50g','admin','Được chiết xuất từ 100% lá Atiso và cao đặc Actiso. Sản phẩm có hương vị thơm ngon, mùi hương dễ chịu giúp giải khát mà mang lại nhiều công dụng tuyệt vời của tinh chất atiso như giúp cơ thể thanh lọc, thải độc gan, lợi tiểu, điều hòa hệ bài tiết, giảm stress, tạo giấc ngủ sâu và thoải mái,...','templates/static/images/tra-atiso-lama-hop-50g-202011230855295859_bR17bzl.jpg','tra-atiso-lama-hop-50g',25000,1,1,'2021-11-09 09:42:36.247758','2021-11-12 01:59:27.085278',5,1,0),(24,'Cà phê đen đá NesCafé Café Việt Arabica & Robusta 192g','admin','Từ 100% cà phê hảo hạng tuyển chọn từ vùng cà phê nổi tiếng cả nước. Cà phê đen đậm đà kết hợp hài hòa giữa cà phê Robusta và Arabica. Bằng sản phẩm cà phê đen đá NesCafé Café Việt Arabica & Robusta 192g NesCafé đã mang đến ly cà phê đen thuần túy Việt Nam với hương vị cà phê cực mạnh mẽ, lôi cuốn','templates/static/images/ca-phe-den-da-nescafe-cafe-viet-arabica-robusta-192g-20211026090_HbbL3wt.jpg','ca-phe-den-da-nescafe-cafe-vit-arabica-robusta-192g',45000,1,1,'2021-11-09 09:43:17.618653','2021-11-12 01:59:21.428830',5,1,0),(25,'Thùng 24 lon bia Tiger 330ml','admin','Hay còn gọi là Tiger nâu được lên men tự nhiên từ các thành phần chính nước, đại mạch, ngũ cốc và hoa bia. Tạo nên hương vị độc đáo và rất riêng của Tiger bằng vị bia đậm đà kết hợp với vị ngọt tự nhiên của lúa mạch. Cam kết bia chính hãng chất lượng','templates/static/images/thung-24-lon-bia-tiger-330ml-202105202206349560_K8q8DWn.jpg','thung-24-lon-bia-tiger-330ml',360000,1,1,'2021-11-09 09:44:19.007326','2021-11-12 01:59:11.357630',5,1,0),(26,'6 lon bia Tuborg 330ml','admin','Thiết kế nổi bật ấn tượng, chắt lọc tinh túy từ nă 1880 từ nguồn nguyên liệu thượng hạng cùng công nghệ sản xuất hiện đại. 6 lon bia Tuborg 330ml có hương vị thơm ngon hấp dẫn, uống cực sảng khoái. Bia Tuborg cam kết chính hãng, chất lượng và an toàn','templates/static/images/6-lon-bia-tuborg-330ml-202103162331528177_H7CCokS.jpg','6-lon-bia-tuborg-330ml',75000,1,1,'2021-11-09 09:45:53.488675','2021-11-12 01:59:02.403853',5,1,0),(27,'Thùng 24 lon bia Heineken 0.0% độ cồn 330ml','admin','Từ thương hiệu bia được ưa chuộng tại hơn 192 quốc gia trên thế giới. Thùng 24 lon bia Heineken 0.0% độ cồn 330ml vẫn giữ hương vị đặc trưng, cân bằng và êm dịu của bia Heineken và đặc biệt không chứa cồn cho những cuộc vui thoải mái sảng khoái mà không sợ say, thoải mái tham gia giao thông êm mượt ...','templates/static/images/thung-24-lon-bia-heineken-00-do-con-330ml-202005190810221493_lhfm8Jr.jpg','thung-24-lon-bia-heineken-0-do-con-330ml',415000,1,1,'2021-11-09 09:46:55.110683','2021-11-12 01:58:54.048635',5,1,0),(28,'Thùng 24 lon bia Bia Việt 330ml','admin','Từ những nguyên liệu tự nhiên bao gồm nước, đại mạch, hoa bia, ngũ cốc và men bia. Đặc biệt, công nghệ lên men lạnh ở nhiệt độ 8-10 độ C giúp lưu giữ tinh túy của hoa bia và mang đến cảm giác sảng khoái bất tận khi thưởng thức. Mua ngay Bia Việt 330ml bia Việt 330ml tại Bách Hóa XANH','templates/static/images/thung-24-lon-bia-viet-330ml-202103162305178063_zkne0YW.jpg','thung-24-lon-bia-bia-viet-330ml',190000,1,1,'2021-11-09 09:47:54.206151','2021-11-12 01:58:45.704270',5,1,0),(29,'Lẩu nấm thiên nhiên khay 300g','admin','Lẩu nấm thiên nhiên gồm nhiều thành phần: nấm bào ngư, nấm kim châm, nấm hương, ớt,... Dùng nấu lẩu ngọt thơm, thanh mát nhờ các loại nấm có giá trị dinh dưỡng cao. Sản phẩm được làm sẵn, đơn giản tiện lợi thích hợp cho gia đình bận rộn không có thời gian','templates/static/images/lau-nam-thien-nhien-khay-300g-202012041938372117_RLHW6Qd.jpg','lau-nam-thien-nhien-khay-300g',33000,1,1,'2021-11-09 09:49:46.772096','2021-11-12 01:58:37.207277',4,1,0),(30,'Nấm linh chi nâu hộp 150g','admin','Nấm linh chi màu nâu của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Vị nấm giòn dai và ngọt thịt, chứa hàm lượng dinh dưỡng cao rất thích hợp cho các món nhúng lẩu, xào với rau củ hoặc nấu súp...','templates/static/images/nam-linh-chi-nau-bach-hoa-xanh-150g-202103242256101359_Tl23JT0.jpg','nam-linh-chi-nau-hop-150g',27000,1,1,'2021-11-09 09:50:49.049209','2021-11-12 01:58:29.213757',4,1,1),(31,'Nấm kim châm Hàn Quốc túi 150g','admin','Nấm kim châm Hàn Quốc của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Sợi nấm dai, giòn và ngọt, khi nấu chín rất thơm nên thường được lăn bột chiên giòn, nấu súp hoặc để nướng ăn kèm.','templates/static/images/nam-kim-cham-goi-150g-202009300014188068_Hyn0nMF.jpg','nam-kim-cham-han-quoc-tui-150g',16000,1,1,'2021-11-09 09:51:29.056981','2021-11-12 01:56:51.666404',4,1,0),(32,'Bí ngòi xanh gói 500g','admin','Có thể dùng để chế biến thành nhiều món ăn ngon cho gia đình như: nấu canh, xào, kho,... Đặc biệt, các thành phần dinh dưỡng có chứa trong loại bí này cũng đem đến rất nhiều tác dụng tích cực đối với sức khỏe con người như: chống lão hoá, giảm cân rất hiệu quả.','templates/static/images/bi-ngoi-xanh-goi-500g-202101291349096548_rsf4bIn.jpg','bi-ngoi-xanh-goi-500g',20000,1,1,'2021-11-09 10:13:42.142026','2021-11-12 01:56:41.157708',4,1,0),(33,'Cà chua túi 500g','admin','Cà chua được xem là một loại thực phẩm thiết yếu bởi chúng rất quen thuộc để tạo ra nhiều món ăn ngon hàng ngày cho gia đình. Đây cũng được xem là một loại củ rất bổ dưỡng và lành mạnh, có tác dụng tăng cường sức đề kháng của cơ thể, ngăn ngừa và điều trị bệnh suy nhược, chống chống nhiễm trùng. Không những thế, cà chua còn chứa hàm lượng vitamin A cao, mang đến nhiều lợi ích cho sức khoẻ.','templates/static/images/ca-chua-tui-500g-202102040115386738_PdJhfez.jpg','ca-chua-tui-500g',18500,1,1,'2021-11-09 10:15:12.882796','2021-11-12 01:56:30.610950',4,1,0),(34,'Cà rốt túi 500g','admin','Là một loại củ rất quen thuộc trong các món ăn của người Việt. Loại củ này có hàm lượng chất dinh dưỡng và vitamin A cao, được xem là nguyên liệu cần thiết cho các món ăn dặm của trẻ nhỏ, giúp trẻ sáng mắt và cung cấp nguồn chất xơ dồi dào.','templates/static/images/ca-rot-tui-500g-202101271632218440_Pmuu2Lz.jpg','ca-rot-tui-500g',14000,1,1,'2021-11-09 10:16:55.263910','2021-11-12 01:55:18.757836',4,1,11),(35,'Gừng túi 100g','admin','Gừng là một loài thực vật hay được dùng làm gia vị, thuốc. Trong củ gừng có các hoạt chất: Tinh dầu zingiberen, chất nhựa, chất cay, tinh bột. Chính tinh dầu này làm món ăn thơm ngon hơn, khử đi mùi tanh của thịt cá. Không những vậy, gừng có vị cay, tính ôn, kích thích vị giác, tạo cảm giác thèm ăn, khiến bữa ăn thêm ngon miệng. Bên cạnh đó những lợi ích từ gừng như: làm ấm cơ thể, trừ hàn, tiêu đàm, dịu ho, cầm máu, giúp giảm các cơn đau cơ, viêm khớp, thấp khớp, đau đầu hay đau nửa đầu.','templates/static/images/gung-tui-100g-202110201541316775_M0VIrox.jpeg','gung-tui-100g',4000,1,1,'2021-11-09 10:18:10.750730','2021-11-12 01:55:06.951048',4,1,0),(36,'Mít Thái túi 1kg','admin','Vốn có nguồn gốc từ Thái Lan, mít Thái không chỉ là loại trái cây tươi ngon được nhiều người yêu thích mà còn dần trở thành một trong những loại trái cây nhiệt đới quen thuộc, được nhiều người yêu thích không kém gì các loại trái cây nội địa khác như xoài, nhãn... Nhắc đến loại mít này, người ta sẽ nhớ ngay đến cái vị ngọt thanh từ múi mít đến sơ mít cùng với độ dai giòn sần sật mà các loại mít khác không thể có được.','templates/static/images/mit-thai-1kg-202110222009372285_mrNCXma.jpg','mit-thai-tui-1kg',25000,1,1,'2021-11-09 10:19:52.603031','2021-11-12 01:54:47.205812',3,1,0),(37,'Nho xanh không hạt túi 500g','admin','Nho xanh không hạt là loại trái cây tươi nhập khẩu cao cấp, nho có đặc điểm trái tròn, tươi ngon mọng nước. Không chỉ vậy, quả nho còn có vị ngọt đậm đà, thịt chắc giòn, ngon miệng. Sản phẩm nhập khẩu trực tiếp từ Mỹ, đạt tiêu chuẩn xuất khẩu toàn cầu và được bảo quản tươi ngon đến tận tay khách hàng.','templates/static/images/nho-xanh-khong-hat-tui-500g-202110131353245253_GmijIMY.jpeg','nho-xanh-khong-hat-tui-500g',145000,1,1,'2021-11-09 10:21:55.351519','2021-11-12 01:54:38.609300',3,1,0),(38,'Việt quất hộp 125g','admin','Việt quất thì quả khá tròn trịa, vỏ mỏng và trơn mịn. Đường kính trung bình dao động tầm 2 – 3 cm, một đầu có cuống và một đầu có phần đài quả. Quả thường có màu xanh sẫm gần như màu mực, một vài giống thì sẽ có màu đen hoặc đỏ. Việt quất mang vị ngọt thơm, khi mới ăn có thể thấy hơi chát nhưng sau quen rồi lại thấy rất hấp dẫn.','templates/static/images/viet-quat-hop-125g-202101141115286393_wh0NDyU.jpg','viet-quat-hop-125g',149000,1,1,'2021-11-09 10:24:00.219919','2021-11-12 01:54:30.130930',3,1,1),(39,'Bưởi da xanh túi 1.5kg','admin','Bưởi da xanh được trồng phổ biến nhất ở tỉnh Bến Tre. Đúng với tên gọi của loại bưởi này, bưởi có hình cầu, vỏ màu xanh khi chín thì mới chuyển sang xanh hơi vàng một chút, có cân nặng từ 1,2 - 2,5kg. Bưởi da xanh này là múi có màu hồng đỏ rất bắt mắt mang vị ngọt dịu, không chua và những tép bưởi rất dễ tróc vỏ, chính vì điều này làm cho loại bưởi này rất được nhiều người yêu thích.','templates/static/images/buoi-da-xanh-tui-15kg-202110071446215628_HGs5T1d.jpg','buoi-da-xanh-tui-15kg',63000,1,1,'2021-11-09 10:24:53.200031','2021-11-12 01:54:23.196875',3,1,1),(40,'Đu đủ vàng túi 2kg','admin','Đu đủ vàng là một trong những loại trái cây đặc sản của miền Tây, có nguồn gốc từ Thái Lan. Đây là giống đu đủ rất được ưa chuộng bởi độ ngọt đậm, dày thịt, có mùi thơm và tương đối ít hạt. Loại đu đủ này khi còn xanh có thể làm nộm, gỏi và khi chín thì cho vỏ màu vàng tươi, ruột đỏ vàng như ruột gấc, dùng ăn tươi hoặc chế biến thành sinh tố đu đủ, làm kem hay mứt đều rất ngon.','templates/static/images/du-du-vang-tui-1kg-202107061446046910_xv9rCLJ.jpg','du-du-vang-tui-2kg',42000,1,1,'2021-11-09 10:25:44.473952','2021-11-12 01:54:14.432153',3,1,1),(41,'Cam sành loại 2 túi 1kg','admin','Cam có tác dụng tốt cho cơ thể như giải khát, chế biến món ăn, làm đẹp. Trong cam cũng chứa rất nhiều vitamin và khoáng chất cần thiết cho cơ thể do chứa nhiều thành phần như vitamin, các chất dinh dưỡng và khoáng chất. Ngoải ra, cam còn có nhiều công dụng làm đẹp thần kì được rất nhiều chị em phụ nữ áp dụng.','templates/static/images/cam-sanh-loai-2-tui-1kg-202101271631270717_HCAD5kF.jpg','cam-sanh-loai-2-tui-1kg',29000,1,1,'2021-11-09 10:27:24.899572','2021-11-12 01:53:12.136687',3,1,3),(43,'Đuôi heo vỉ 300g','admin','Thịt đuôi heo là phần thịt chứa nhiều các dưỡng chất tốt cho cơ thể như collagen, elastin, protein, keratin,... Thịt đuôi heo mềm, có lớp mỡ béo ngậy, thường được dùng nấu bánh canh đuôi heo cho bữa sáng hoặc canh đủ đủ hầm đuôi heo,..','templates/static/images/duoi-heo-vi-300g-202101190947152140_LPTpkxH.jpg','duoi-heo-vi-300g',58000,1,1,'2021-11-09 10:30:54.611963','2021-11-12 01:52:51.523567',2,1,2),(44,'Sườn non heo G khay 300g','admin','Sườn non heo của thương hiệu G được đóng gói và bảo quản đạt các tiêu chuẩn về an toàn toàn thực phẩm. Sườn mềm, thịt săn chắc và thơm nên thường dùng để làm sườn xào chua ngọt, sườn ram mặn,... Có thể dùng điện thoại quét mã QR trên tem sản phẩm để kiểm tra nguồn gốc.','templates/static/images/suon-non-heo-g-khay-300g-202106091749459706_xkPCdvE.jpg','suon-non-heo-g-khay-300g',94000,1,1,'2021-11-09 10:31:48.979772','2021-11-12 01:52:44.862509',2,1,7),(45,'Ba rọi heo có da nhập khẩu đông lạnh túi 500g','admin','Ba rọi heo có da với tỉ lệ nạc mỡ tuyệt vời, thịt săn chắc ngọt nên luôn được các bà nội trợ ưa chuộng và tin dùng. Ba rọi heo có da nhập khẩu đông lạnh với phương pháp cấp đông hiện đại, giúp lưu giữ hương vị tự nhiên, mang đến những món ăn ngon cho gia đình.','templates/static/images/ba-roi-heo-co-da-nhap-khau-dong-lanh-tui-500g-20211018080420105_MKLRPKP.jpeg','ba-roi-heo-co-da-nhap-khau-dong-lanh-tui-500g',82500,1,1,'2021-11-09 10:32:52.021405','2021-11-12 01:51:39.637676',2,1,1),(46,'Bít tết đùi bò Úc Pacow khay 250g','admin','Phần thịt nạc nguyên quả nằm ngay phía trên bắp chân sau của con bò. Miếng thịt rất nạc và hơi khô phù hợp với chiên hoặc nướng theo tảng. Đặc biệt với món beefsteak,một món ăn ưa thích. Bít tết đùi bò Úc Pacow khay 250g được sản xuất ở Úc bởi Pacow, đã được kiểm duyệt chặc chẽ nên đảm bảo an toàn.','templates/static/images/bit-tet-dui-bo-uc-pascow-khay-250g-202009300015034764_nmF5agE.jpg','bit-tet-dui-bo-uc-pacow-khay-250g',119000,1,1,'2021-11-09 10:34:18.173602','2021-11-12 01:51:29.994887',2,1,0),(47,'Thịt nạm bò Mỹ Orifood Hotpot Story hộp','admin','Thịt bò Mỹ Orifood là loại thịt bò đông lạnh nhập khẩu từ Mỹ được xem là lựa chọn hàng đầu cho các thực khách sành ăn. Thịt nạm bò Mỹ Orifood Hotpot Story hộp 300g mang đến những thớ thịt săn chắc, vị ngọt, thơm và độ mềm lý tưởng, thích hợp ăn kèm với các món lẩu nhúng...','templates/static/images/thit-nam-bo-my-orifood-hotpot-story-hop-300g-201911040854454525_qzlRxb1.jpg','thit-nam-bo-my-orifood-hotpot-story-hop',156000,1,1,'2021-11-09 10:35:44.132776','2021-11-12 01:51:16.038354',2,1,0),(48,'Cá bạc má đông lạnh túi 500g','admin','Cá bạc má có thịt trắng và chắc ngọt, dễ chế biến thành nhiều món ăn ngon, đây là một trong những loại cá biển quen thuộc với bà nội trợ. Cá bạc má đông lạnh vẫn giữ được độ tươi ngon từ cá tươi, giúp bảo quản lâu hơn mà thịt cá vẫn chắc, không bở mà vẫn giữ nguyên vị đậm đà.','templates/static/images/ca-bac-ma-dong-lanh-tui-1kg-202108161923398360_ZZnUrey.jpeg','ca-bac-ma-dong-lanh-tui-500g',94000,1,1,'2021-11-09 10:37:40.012115','2021-11-12 01:49:19.690673',1,1,1),(49,'Bạch tuộc size lớn túi 300g','admin','Là loại hải sản vô cùng giàu dinh dưỡng. Bạch tuộc Bách hoá XANH giàu vitamin thiết yếu, được các bà nội trợ ưa thích chọn làm nguyên liệu cho các món ăn của gia đình. Bạch tuộc có thể chế biến thành nhiều món ăn khác nhau như bạch tuộc hấp, bạch tuộc xào thập cẩm với vị giòn dai tuyệt vời','templates/static/images/bach-tuoc-size-lon-tui-300g-202111041618379960_8vvVCoD.jpeg','bach-tuoc-size-lon-tui-300g',62500,1,1,'2021-11-09 10:38:33.733317','2021-11-12 01:49:12.601117',1,1,4),(50,'Vây cá hồi đông lạnh túi 500g','admin','Vây cá hồi hay còn gọi là vi cá hồi, là phần được lấy ra từ vây 2 bên của con cá hồi. Phần vây này có xương mềm, thịt tươi, mềm, béo ngọt không khác gì thịt cá hồi phi lê nhưng có một ít mỡ giúp người dùng đỡ ngán hơn. Vây cá hồi thường được dùng cho các món lẩu, canh súp giúp tăng độ ngọt và phần vây sẽ không bị vỡ ra khi được làm nóng nhiều.','templates/static/images/vay-ca-hoi-dong-lanh-tui-500g-202110010001310377_RvOz3zg.jpg','vay-ca-hoi-dong-lanh-tui-500g',59500,1,1,'2021-11-09 10:39:45.150313','2021-11-12 01:49:07.122992',1,1,15),(51,'Chả cá thát lát nạo gói 100g','admin','Chả cá thát lát là một trong những nguyên liệu nấu ăn được nhiều người yêu thích, được lấy từ những con cá thát lát tươi sống. Đây là món ăn quen thuộc và rất được ưa chuộng bởi độ dai mềm và vị ngọt tự nhiên đến từ thương hiệu chả cá Nhất Tâm.','templates/static/images/ca-that-lat-nao-goi-100g-202011141608521050_FAGkUcD.jpg','cha-ca-that-lat-nao-goi-100g',24000,1,1,'2021-11-09 10:41:00.357750','2021-11-12 01:48:59.415574',1,1,0),(52,'Cá cơm túi 200g','admin','Cá cơm là loại cá sinh sống ở vùng nước mặn, dễ dàng bắt gặp trong mỗi bữa cơm của gia đình. Cá cơm có thân trắng trong, mỗi con có dáng thon dài cỡ một ngón tay. Cá cơm đã được sơ chế cắt bỏ phần đầu và làm sạch phần ruột. Vì thế, sản phẩm thích hợp cho những ai bận rộn nhưng vẫn muốn có bữa ăn nhanh chóng, đầy đủ chất dinh dưỡng.','templates/static/images/ca-com-tui-200g-202012292316404576_Bd2rGpU.jpg','ca-com-tui-200g',19100,1,1,'2021-11-09 10:42:02.275420','2021-11-12 01:48:53.427215',1,1,11);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_users_wishlist`
--

DROP TABLE IF EXISTS `shop_product_users_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_users_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_product_users_wishlist_product_id_user_id_71e153dd_uniq` (`product_id`,`user_id`),
  KEY `shop_product_users_wishlist_user_id_07b2b259_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_product_users_w_product_id_f16937bc_fk_shop_prod` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_product_users_wishlist_user_id_07b2b259_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_users_wishlist`
--

LOCK TABLES `shop_product_users_wishlist` WRITE;
/*!40000 ALTER TABLE `shop_product_users_wishlist` DISABLE KEYS */;
INSERT INTO `shop_product_users_wishlist` VALUES (1,52,7);
/*!40000 ALTER TABLE `shop_product_users_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_profile`
--

DROP TABLE IF EXISTS `shop_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birth_date` date DEFAULT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `shop_profile_user_id_251f5ef7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_profile`
--

LOCK TABLES `shop_profile` WRITE;
/*!40000 ALTER TABLE `shop_profile` DISABLE KEYS */;
INSERT INTO `shop_profile` VALUES (1,'2001-11-25','templates/static/images/defaultavatar_shd2ztM.png',1,'0'),(6,'2001-11-27','templates/static/images/defaultavatar_jU2UU6v.png',6,'0'),(7,NULL,'templates/static/images/defaultavatar_6tlm8wk.png',7,'0'),(8,'1980-11-28','templates/static/images/defaultavatar_1cTpXnn.png',8,'0'),(9,'2001-08-06','templates/static/images/defaultavatar_Nt6z848.png',9,'0'),(10,NULL,'templates/static/images/defaultavatar_XIvVgGp.png',10,'0');
/*!40000 ALTER TABLE `shop_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_rating`
--

DROP TABLE IF EXISTS `shop_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `ratingStar` decimal(6,1) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_rating_product_id_9d5a8768_fk_shop_product_id` (`product_id`),
  KEY `shop_rating_user_id_038b24f5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_rating_product_id_9d5a8768_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_rating_user_id_038b24f5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_rating`
--

LOCK TABLES `shop_rating` WRITE;
/*!40000 ALTER TABLE `shop_rating` DISABLE KEYS */;
INSERT INTO `shop_rating` VALUES (1,'tốt, chất lượng',5.0,52,9,'2022-05-21 14:10:14.303619'),(2,'tốt, hàng chất lượng',4.0,52,7,'2022-05-21 14:10:14.303619'),(3,'sườn ngon lắm, nấu canh thì quá chiến',5.0,44,7,'2022-05-21 14:10:14.303619'),(4,'Sản phẩm tươi',4.5,50,7,'2022-05-21 14:10:14.303619'),(5,'thịt tươi quá',5.0,7,7,'2022-05-21 14:10:14.303619'),(6,'xoài ngon quá',4.0,6,7,'2022-05-21 14:10:14.303619');
/*!40000 ALTER TABLE `shop_rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-21 14:29:18
