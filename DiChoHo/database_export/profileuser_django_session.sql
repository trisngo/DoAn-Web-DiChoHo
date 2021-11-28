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
INSERT INTO `django_session` VALUES ('2dn49tig7g86nlbivzwmy7ykio33m715','.eJxd0DsOwjAMBuC7eEZVbCdt2pGdM1R50gJqoY8BIe5OIyHUsHjwZ_22_AJnpgWaF8hU7lPvAjRQSiUEHOCxPKHB9wFwr7jhT2lT5oy1-mPaMwmRZ7Pas_xTqfday2z15q1Zl65d5zC1vU_bIetZ465hSOAvZjiPhRuHZeptkUaKr87FafThdvzOZgGdmbt0FkVi9oIMCsRKC4MyRFahYudrpSOXWGNQVEYXZdheoMla55mk8Kqy8P4ANoJqHQ:1mqFuc:l-UjSgiKzXOLf9JEgKv0IfkVvshSrl8Z1iLWIdxVxPE','2021-12-09 14:39:46.539991'),('6dcm4lksxzja4dhi9uheedjo1kdyfozq','eyJjYXJ0Ijp7fX0:1mpsgI:HpGAF8enD2fU8YHyrQAAgL8na74RcLuwEhI7AgSuPV0','2021-12-08 13:51:26.189112'),('di35qq44r4awr4768tpn0cbhc0rcmzdg','eyJjYXJ0Ijp7fX0:1mpsmE:tggpIj-bpp2VdcNA9yBE4Y5Vcx9V3lte-psN2PCvFec','2021-12-08 13:57:34.879018'),('eo1erkb0na93dljd1ik2d0npt6keygkh','.eJxVjDsOgzAQBe-ydWTFsY1xyvQ5A3reXQeSCCQ-FeLuCRIN7ZuZtxJjnOm-bhdqsMxts0w6Np3QnSKdtgz-aL8DeaN_DYaHfh67bHbFHHQyz0H0-zjc00GLqf3XJaCKtmLJNmVYjTXnhKBg73wR1OI4JRfUXuFKZXFjXwDRGGC9Rtp-WeQ8aQ:1mrMPW:Jzz7UqP2rsPngU-jaohyqynpl-mvHqDlg9Sjp2C38fw','2021-12-12 15:48:14.822391'),('m5iztm2xhpvmdnnaugv7e0pa66408mc1','eyJjYXJ0Ijp7fX0:1mpsgb:xk2tNyNmTpBRo83X9V-4jHRKZ3izqZdR7objiww4JE4','2021-12-08 13:51:45.631774'),('mbdp5w42iln09ayc1bc0daxqye4dy4m1','eyJjYXJ0Ijp7fX0:1mq5wa:jbCoBtZCJGwirWtsa1QTHA0aQOSrKxjFEpIfAH80iAo','2021-12-09 04:01:08.719095'),('qo1juoz7vy7nffv1815qhyr95x1rhu19','.eJxdkMtuhDAMRf_F6wEl5EHCcvb9BuQ4ptAH0BAWo1H_vTBlMczGsnyurXt9B8KUobmDEXud00AMDRhvhIAL_OQbNPL3Ato_Y1u9YnXaduIF62fs9QlvvMU19-26cGqHuClqOM0C0iePO4gfOL5PJU1jTkMod0l50KV8myJ_XQ_t6UCPS79tdwZtLS3FIH1AybWj4NEwkla6i-iiIu-VYSlQdVZiRbpDjFwblJp3Vxhj4mXZ4xztv2MhOKCNtogSsdDIrvCupoJYq8p5rqR1sCWd10SbG378A2_fPOZ2mvMwjY9X_AGURHs-:1mrB7i:a_QRtWTkYuev6aqbIeFFEZBbLIS1VN69gI3hd1uVNPw','2021-12-12 03:45:06.568351'),('w66f6v0s5j5m5aod4q3a2dgtwk06ldwj','eyJjYXJ0Ijp7fX0:1mr0AX:Wv57Fwjk4f2IoncqdZddugzy_faCt9TO6f1V2GZUSUE','2021-12-11 16:03:17.143317'),('woa0y17pb5r5cnxenrisuo0g30280x56','.eJxVjLsOgzAMAP_FcxU5LiSEsTvfgGzHFNoKJB4T4t8rJBbWu9PtoDyvUO_HA1re1r7dFpvbIUMNHuEGhfVr42nyh8f35HQa13kQdybusotrpmy_19XeBj0v_flNGDu0yIUPIoU3qUKXhatISBEpRPGkSGTRV5goJCpMtSxZn5y8wPEHNy86pg:1mqYHs:QEPkuPZYiAAVyoPDXF_6G9x2EfSF11y88eI1IbRuTcU','2021-12-10 10:17:00.237240');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
