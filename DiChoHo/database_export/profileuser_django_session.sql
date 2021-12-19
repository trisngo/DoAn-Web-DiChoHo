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
INSERT INTO `django_session` VALUES ('2dn49tig7g86nlbivzwmy7ykio33m715','.eJxd0DsOwjAMBuC7eEZVbCdt2pGdM1R50gJqoY8BIe5OIyHUsHjwZ_22_AJnpgWaF8hU7lPvAjRQSiUEHOCxPKHB9wFwr7jhT2lT5oy1-mPaMwmRZ7Pas_xTqfday2z15q1Zl65d5zC1vU_bIetZ465hSOAvZjiPhRuHZeptkUaKr87FafThdvzOZgGdmbt0FkVi9oIMCsRKC4MyRFahYudrpSOXWGNQVEYXZdheoMla55mk8Kqy8P4ANoJqHQ:1mqFuc:l-UjSgiKzXOLf9JEgKv0IfkVvshSrl8Z1iLWIdxVxPE','2021-12-09 14:39:46.539991'),('2hl7l6kh3mom2oswrmcv9y8om0mq8jn2','eyJjYXJ0Ijp7fX0:1myqQU:8BHXyw3uHXjLjChPQ3vyn465o2kkrMGkBJ3ct_94xps','2022-01-02 07:16:10.720163'),('52q7oq3qu9g4n0zeqcb043l79t92wjxj','eyJjYXJ0Ijp7fX0:1myqlX:-cYdWZlVWbaHFY9krBAc5nykPV_p4yz9NdnN_Q_tLgc','2022-01-02 07:37:55.969192'),('5vu7agez7z1pppyw7xgrov7kjrs0mkoe','eyJjYXJ0Ijp7fX0:1myqUI:1aMC8TJ3q-YEdHZfBS1kT3Rh99mrBFO1CkQyvHTyybQ','2022-01-02 07:20:06.861244'),('6dcm4lksxzja4dhi9uheedjo1kdyfozq','eyJjYXJ0Ijp7fX0:1mpsgI:HpGAF8enD2fU8YHyrQAAgL8na74RcLuwEhI7AgSuPV0','2021-12-08 13:51:26.189112'),('asatl6ungxm8jh6kmp36z9tmk194r7tm','.eJxdzDkOg0AMBdC7uEbI48zCUKbPGZBnIZBEkLAUEeLuYSQKSOPC7_-_gOdhgnIBJdJ9D62PUAJJRIQMPtMXSrFmoPDIyqozS3lk-9-W6sgFndqbVzxPTTWPcajasCVE4sPTsX_GLkl4cHfvc99309C6PEXyXcf81of4uu7Z00DDY5N2LZoao2EptHNSRFfoOjguDCEZJG2cII9E0YgCLWlLMnqvFPsLW-Fg_QEr41rL:1myoVi:3GNuqAK7-dw40pY3sfWfvV3sUhekI2bKDzh_y9LCnqE','2022-01-02 05:13:26.623102'),('bgo1aufctqddbdzrxjdchowmzyba65fi','eyJjYXJ0Ijp7fX0:1mynH4:36_9MikBgEhQc26n2Y5BWH7ZQVH-4o4MA2YfzzbJuqk','2022-01-02 03:54:14.208428'),('ckdwvxaw79xijcouuv67nw44riyqt019','eyJjYXJ0Ijp7fX0:1myqQE:KSlGRSihiNrQ-ZrtpLEgfEsXsG1n_kxU4BWwAS4pI4k','2022-01-02 07:15:54.311874'),('di35qq44r4awr4768tpn0cbhc0rcmzdg','eyJjYXJ0Ijp7fX0:1mpsmE:tggpIj-bpp2VdcNA9yBE4Y5Vcx9V3lte-psN2PCvFec','2021-12-08 13:57:34.879018'),('f31x51ub3bqlq3uxj61pxzeyq3x3edqo','eyJjYXJ0Ijp7fX0:1mrYEQ:-4xzFY_yF2e2VLGHSv2AY9XyE-YVK0ACavEx1D_iXiM','2021-12-13 04:25:34.320734'),('icahs9hwz1fpvfl9p6alk4clcci7aah0','.eJxVzD0OgzAMhuG7eEaR4-aHMHbvGZATQqGtoIUwVIi7l0gMdPHg59W3QuApQbWClvm-pz5EqIAUIkIBn_SFSm4FaDyzdvrMu9e8pK5e5jjVfbMXMvPp6Tk845ClefBwH0UYhzT1XuREHDqL29jE1_Vo_wY6nru869C2GC0rabxXMvrStI3n0hKSRTLWSwpIFK0s0ZFxpGIIWnO4sJMeth-ol0qe:1mt5Al:v4MleCcuWP4MiEnSpuklx_OcY-VVSpGW1_L9DW_fQ-0','2021-12-17 09:48:07.156682'),('m5iztm2xhpvmdnnaugv7e0pa66408mc1','eyJjYXJ0Ijp7fX0:1mpsgb:xk2tNyNmTpBRo83X9V-4jHRKZ3izqZdR7objiww4JE4','2021-12-08 13:51:45.631774'),('mbdp5w42iln09ayc1bc0daxqye4dy4m1','eyJjYXJ0Ijp7fX0:1mq5wa:jbCoBtZCJGwirWtsa1QTHA0aQOSrKxjFEpIfAH80iAo','2021-12-09 04:01:08.719095'),('qo1juoz7vy7nffv1815qhyr95x1rhu19','.eJxdkMtuhDAMRf_F6wEl5EHCcvb9BuQ4ptAH0BAWo1H_vTBlMczGsnyurXt9B8KUobmDEXud00AMDRhvhIAL_OQbNPL3Ato_Y1u9YnXaduIF62fs9QlvvMU19-26cGqHuClqOM0C0iePO4gfOL5PJU1jTkMod0l50KV8myJ_XQ_t6UCPS79tdwZtLS3FIH1AybWj4NEwkla6i-iiIu-VYSlQdVZiRbpDjFwblJp3Vxhj4mXZ4xztv2MhOKCNtogSsdDIrvCupoJYq8p5rqR1sCWd10SbG378A2_fPOZ2mvMwjY9X_AGURHs-:1mrB7i:a_QRtWTkYuev6aqbIeFFEZBbLIS1VN69gI3hd1uVNPw','2021-12-12 03:45:06.568351'),('u4vhmbw27rz1d57ur96ph5k8d44aiq1g','.eJxVjLsOgzAMAP_FcxU5LiSEsTvfgGzHFNoKJB4T4t8rJBbWu9PtoDyvUO_HA1re1r7dFpvbIUMNHuEGhfVr42nyh8f35HQa13kQdybusotrpmy_19XeBj0v_flNGDu0yIUPIoU3qUKXhatISBEpRPGkSGTRV5goJCpMtSxZn5y8wPEHNy86pg:1myrpC:8h13wCVa08dyib0AbeE4L-hVAP-wqBOgjfslkW8BbOo','2022-01-02 08:45:46.750124'),('vd12qi03hooraf5ap0eo74a7bkaxjqlj','eyJjYXJ0Ijp7fX0:1mynjJ:iuUJP7CP_RmNUMPVBQ4osfaD_dYKnUW4EuRF9YQXarE','2022-01-02 04:23:25.071714'),('w66f6v0s5j5m5aod4q3a2dgtwk06ldwj','eyJjYXJ0Ijp7fX0:1mr0AX:Wv57Fwjk4f2IoncqdZddugzy_faCt9TO6f1V2GZUSUE','2021-12-11 16:03:17.143317'),('woa0y17pb5r5cnxenrisuo0g30280x56','.eJxVjLsOgzAMAP_FcxU5LiSEsTvfgGzHFNoKJB4T4t8rJBbWu9PtoDyvUO_HA1re1r7dFpvbIUMNHuEGhfVr42nyh8f35HQa13kQdybusotrpmy_19XeBj0v_flNGDu0yIUPIoU3qUKXhatISBEpRPGkSGTRV5goJCpMtSxZn5y8wPEHNy86pg:1mqYHs:QEPkuPZYiAAVyoPDXF_6G9x2EfSF11y88eI1IbRuTcU','2021-12-10 10:17:00.237240'),('xwqraswajvekg0s02rxjxrmz9m75b9ba','eyJjYXJ0Ijp7fX0:1mrYNt:esliOl-BpT_5mW7aCW-VPlHA0BTxW92ACTzxduu4n9Q','2021-12-13 04:35:21.233185'),('z67jwjhyhfvn5dn4hdxfzx7wkjjkdzpp','eyJjYXJ0Ijp7fX0:1mynk5:aeVPi5GG6NdOSpfV0_cqVBsniY0b4zptfIDauxwuSp0','2022-01-02 04:24:13.127135');
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

-- Dump completed on 2021-12-19 15:48:13
