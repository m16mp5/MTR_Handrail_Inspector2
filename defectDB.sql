CREATE DATABASE  IF NOT EXISTS `defectdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `defectdb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: defectdb
-- ------------------------------------------------------
-- Server version	8.0.33

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add defect type',7,'add_defecttype'),(26,'Can change defect type',7,'change_defecttype'),(27,'Can delete defect type',7,'delete_defecttype'),(28,'Can view defect type',7,'view_defecttype'),(29,'Can add handrail',8,'add_handrail'),(30,'Can change handrail',8,'change_handrail'),(31,'Can delete handrail',8,'delete_handrail'),(32,'Can view handrail',8,'view_handrail'),(33,'Can add defect type threshold',9,'add_defecttypethreshold'),(34,'Can change defect type threshold',9,'change_defecttypethreshold'),(35,'Can delete defect type threshold',9,'delete_defecttypethreshold'),(36,'Can view defect type threshold',9,'view_defecttypethreshold'),(37,'Can add defect',10,'add_defect'),(38,'Can change defect',10,'change_defect'),(39,'Can delete defect',10,'delete_defect'),(40,'Can view defect',10,'view_defect');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$HA27hUERNlqZf3XzQYDtTd$7Vyyn7Cb7bY4yBGGiCboBFuJ0wF3pAt5hMXMXJggIRQ=','2024-02-08 14:34:04.979441',1,'Admin','MTR','MTR','info@mtr.com',1,1,'2024-02-07 09:51:02.093815');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'webapp','defect'),(7,'webapp','defecttype'),(9,'webapp','defecttypethreshold'),(8,'webapp','handrail');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-06 16:05:58.673430'),(2,'auth','0001_initial','2024-02-06 16:05:59.111653'),(3,'admin','0001_initial','2024-02-06 16:05:59.199534'),(4,'admin','0002_logentry_remove_auto_add','2024-02-06 16:05:59.205433'),(5,'admin','0003_logentry_add_action_flag_choices','2024-02-06 16:05:59.212533'),(6,'contenttypes','0002_remove_content_type_name','2024-02-06 16:05:59.298944'),(7,'auth','0002_alter_permission_name_max_length','2024-02-06 16:05:59.323763'),(8,'auth','0003_alter_user_email_max_length','2024-02-06 16:05:59.341937'),(9,'auth','0004_alter_user_username_opts','2024-02-06 16:05:59.354306'),(10,'auth','0005_alter_user_last_login_null','2024-02-06 16:05:59.389938'),(11,'auth','0006_require_contenttypes_0002','2024-02-06 16:05:59.389938'),(12,'auth','0007_alter_validators_add_error_messages','2024-02-06 16:05:59.403341'),(13,'auth','0008_alter_user_username_max_length','2024-02-06 16:05:59.442365'),(14,'auth','0009_alter_user_last_name_max_length','2024-02-06 16:05:59.490614'),(15,'auth','0010_alter_group_name_max_length','2024-02-06 16:05:59.504607'),(16,'auth','0011_update_proxy_permissions','2024-02-06 16:05:59.504607'),(17,'auth','0012_alter_user_first_name_max_length','2024-02-06 16:05:59.560068'),(18,'sessions','0001_initial','2024-02-06 16:05:59.590577'),(19,'webapp','0001_initial','2024-02-06 16:05:59.752212'),(20,'webapp','0002_defect_sseverity','2024-02-07 09:39:39.732436');
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
INSERT INTO `django_session` VALUES ('jaj3a18iek1ft6d1zyzgrxk0ya8yoyye','.eJzFk8tOwzAQRX8l8rptHiR97UBIsGGJWNCqmngmjSFxKjsRgqr_TtyWqjUkLW8pi2jm-njunWTJZlCV6azSpGYC2Zj5rLNfi4E_kjQNfAA5L3q8kKUScc9Ietuu7t0USNnFVnsASEGn9WkKCD1Ez48QEy_E4ShIovrxE49oOAiHwSjuxxDFEYYDThBQcjbiQ-xHISAkZKA5yUrXrPvlhEnIacLGzoSd11eRLAWHUhTSAYmOKRVKvKwrE9apVYKbN6NPQDsJdHUqKMMuZOVGkBsH2kgO8VeqqBa6AWIc6i4v5pt-pbJN2wXMhXRNCu7cANyNABBvmzV1d6uLFQFyVeXxBxP9gOFVx_mSydXUKEigEfieF9igW6N9z1FvnJacTPtITGvJ_6V03Jydz5ld8G3mHcWwWDRAuVA8o_bv85IS4qVTPi_IKVNFOi0ybJpyH2gv4Wk9iYtrnsHtaM1baTlz4ppO8m-H9iXP9iqiFuqP5PeJ2P4qrc9m1LdZ1_V_pEBk3wgo3SKOxrMT_mY4pxqykxnYhXA1ZatXmyJdTA:1rXea8:AXhWn8bV1EoJEMBIkcHtGUzzCGgHy4elV6W19JRVfAo','2024-02-21 17:51:04.865707'),('s4so9epbnjjyd9yuuau212x9r9dmbn14','.eJzFk1tP4zAQhf9K5Oe2uZD0whurlXZf9hHxQFE18Uwas4lT2YlWC-p_x9MWBIa05S7lIZo5_jznTHIrFtC15aKzZBYKxamIxeBxLQf5lzQ38Br0shnJRrdG5SOWjHZdO_rTIFU_dtongBJs6U5TQhghRnGGWEQpTmdJkbknLiKi6SSdJrN8nEOWZ5hOJEFCxclMTnGcpYBQkIMyzpHOsFaa76hJd9YVLm_nQkNNc3EazMWZu5l0qyS0qtEBaAy41Bh1s6nMxcCplOQ31hdggwKGtlRU4RCqdiuo2ZBlyVP8L9N0K9sD4QntUDbLbb8z1bYdAs8ccijhkgHhVgCI5_0a193pckOA0nR1_sJEH2B4PQjeZHJ9xQpSyII4ihIfdM7a5xxzz9mTE7cPxLSRfF9Kh835-Zz4hdhnXlAOq1UPVCojK9r_ff6kgmQbtP9XFLSlIVs2FfZN-RjoL-HfZpIQNzzGPdD6t7LnzJFrOsq_H9qbPPuryPZQPyS_V8T2VWm9NqOxz_rt_iMDqnpHQOUOcTCeB-FnhnOsIT-ZiV9I11difQeL2GHi:1rYLS5:bBoylstR-G5E5bKa7XPywFxGlRCY-wBKPAKNVGWNfgQ','2024-02-23 15:37:37.559604');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_defect`
--

DROP TABLE IF EXISTS `webapp_defect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_defect` (
  `sDefectID` int NOT NULL AUTO_INCREMENT,
  `sDefectTimeStamp` datetime(6) NOT NULL,
  `sLength` double NOT NULL,
  `sWidth` double NOT NULL,
  `sDepth` double NOT NULL,
  `sDistanceFromStartPoint` double NOT NULL,
  `sSpeed` double NOT NULL,
  `sDefectPhotoLocation` varchar(200) NOT NULL,
  `sDefectDefectTypeID_id` int NOT NULL,
  `sDefectHandrailID_id` int unsigned NOT NULL,
  `sSeverity` varchar(30) NOT NULL,
  PRIMARY KEY (`sDefectID`),
  KEY `webapp_defect_sDefectDefectTypeID__68f47559_fk_webapp_de` (`sDefectDefectTypeID_id`),
  KEY `webapp_defect_sDefectHandrailID_id_e8341f66_fk_webapp_ha` (`sDefectHandrailID_id`),
  CONSTRAINT `webapp_defect_sDefectDefectTypeID__68f47559_fk_webapp_de` FOREIGN KEY (`sDefectDefectTypeID_id`) REFERENCES `webapp_defecttype` (`sDefectTypeID`),
  CONSTRAINT `webapp_defect_sDefectHandrailID_id_e8341f66_fk_webapp_ha` FOREIGN KEY (`sDefectHandrailID_id`) REFERENCES `webapp_handrail` (`sHandrailID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_defect`
--

LOCK TABLES `webapp_defect` WRITE;
/*!40000 ALTER TABLE `webapp_defect` DISABLE KEYS */;
INSERT INTO `webapp_defect` VALUES (1,'2023-10-13 04:41:35.000000',3.02,5.53,-1.7,16.56,6,'abc.jfif',1,1,'Action'),(2,'2023-10-13 04:41:35.000000',0.62,0.73,-1,32.88,6,'1',2,1,'Alarm'),(3,'2023-10-13 04:41:35.000000',1.02,5.19,-2.7,78.36,6,'1',3,1,'Alert'),(4,'2023-10-13 06:43:15.000000',3.02,5.53,-1.7,16.56,2,'1',4,2,'Normal'),(5,'2023-10-13 06:43:15.000000',0.62,0.73,-1,32.88,2,'1',2,2,'Normal'),(6,'2023-10-13 06:43:15.000000',1.02,5.19,-2.7,78.36,2,'1',2,2,'Alert'),(7,'2023-10-25 03:36:01.000000',3.02,5.53,-1.7,16.56,2,'1',3,3,'Normal'),(8,'2023-10-25 03:36:02.000000',0.62,0.73,-1,32.88,2,'1',4,3,'Normal'),(9,'2023-10-25 03:36:02.000000',1.02,5.19,-2.7,78.36,2,'1',1,3,'Normal'),(10,'2023-10-13 04:41:35.000000',1.02,5.19,-2.7,78.36,6,'1',1,1,'Alert'),(11,'2023-10-13 06:43:15.000000',3.02,5.53,-1.7,16.56,2,'1',1,2,'Normal'),(12,'2023-10-13 06:43:15.000000',0.62,0.73,-1,32.88,2,'1',1,2,'Normal'),(13,'2023-10-13 06:43:15.000000',1.02,5.19,-2.7,78.36,2,'1',1,2,'Alert'),(14,'2023-10-25 03:36:01.000000',3.02,5.53,-1.7,16.56,2,'1',1,3,'Normal'),(15,'2023-10-25 03:36:02.000000',0.62,0.73,-1,32.88,2,'1',1,3,'Normal'),(16,'2023-10-25 03:36:02.000000',1.02,5.19,-2.7,78.36,2,'1',1,3,'Normal');
/*!40000 ALTER TABLE `webapp_defect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_defecttype`
--

DROP TABLE IF EXISTS `webapp_defecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_defecttype` (
  `sDefectTypeID` int NOT NULL AUTO_INCREMENT,
  `sDefectTypeName` varchar(30) NOT NULL,
  PRIMARY KEY (`sDefectTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_defecttype`
--

LOCK TABLES `webapp_defecttype` WRITE;
/*!40000 ALTER TABLE `webapp_defecttype` DISABLE KEYS */;
INSERT INTO `webapp_defecttype` VALUES (1,'Damage'),(2,'Multiple Types'),(3,'Exposed Steal Core'),(4,'Repaired Joint');
/*!40000 ALTER TABLE `webapp_defecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_defecttypethreshold`
--

DROP TABLE IF EXISTS `webapp_defecttypethreshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_defecttypethreshold` (
  `sDefectTypeThresholdID` int NOT NULL AUTO_INCREMENT,
  `sSeverity` varchar(30) NOT NULL,
  `sLengthThreshold` double NOT NULL,
  `sWidthhThreshold` double NOT NULL,
  `sDepthThreshold` double NOT NULL,
  `sThresholdDefectTypeID_id` int NOT NULL,
  PRIMARY KEY (`sDefectTypeThresholdID`),
  KEY `webapp_defecttypethr_sThresholdDefectType_7e4b9294_fk_webapp_de` (`sThresholdDefectTypeID_id`),
  CONSTRAINT `webapp_defecttypethr_sThresholdDefectType_7e4b9294_fk_webapp_de` FOREIGN KEY (`sThresholdDefectTypeID_id`) REFERENCES `webapp_defecttype` (`sDefectTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_defecttypethreshold`
--

LOCK TABLES `webapp_defecttypethreshold` WRITE;
/*!40000 ALTER TABLE `webapp_defecttypethreshold` DISABLE KEYS */;
INSERT INTO `webapp_defecttypethreshold` VALUES (1,'Alert',1,2,3,1),(2,'Alarm',2,4,6,1),(3,'Action',3,6,9,1),(4,'Alert',1,2,3,2);
/*!40000 ALTER TABLE `webapp_defecttypethreshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapp_handrail`
--

DROP TABLE IF EXISTS `webapp_handrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapp_handrail` (
  `sHandrailID` int unsigned NOT NULL,
  `sHandrailCode` varchar(50) NOT NULL,
  `sLine` varchar(50) NOT NULL,
  `sStation` varchar(50) NOT NULL,
  `sEscNo` int unsigned NOT NULL,
  `sPosition` varchar(10) NOT NULL,
  PRIMARY KEY (`sHandrailID`),
  CONSTRAINT `webapp_handrail_chk_1` CHECK ((`sHandrailID` >= 0)),
  CONSTRAINT `webapp_handrail_chk_2` CHECK ((`sEscNo` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapp_handrail`
--

LOCK TABLES `webapp_handrail` WRITE;
/*!40000 ALTER TABLE `webapp_handrail` DISABLE KEYS */;
INSERT INTO `webapp_handrail` VALUES (1,'1','Kwun Tong Line','Tiu Keng Leng',1,'Left'),(2,'1','Kwun Tong Line','Yau Tong',2,'Right'),(3,'1','Kwun Tong Line','Lam Tin',2,'Left'),(4,'1','Kwun Tong Line','Kwun Tong',1,'Left'),(5,'1','Kwun Tong Line','Ngau Tau Kok',1,'Left'),(6,'1','Kwun Tong Line','Kowloon Bay',1,'Left'),(7,'1','Kwun Tong Line','Choi Hung',1,'Left'),(8,'1','Kwun Tong Line','Diamond Hill',1,'Left'),(9,'1','Kwun Tong Line','Wong Tai Sin',1,'Left'),(10,'1','Kwun Tong Line','Lok Fu',1,'Left'),(11,'1','Kwun Tong Line','Kowloon Tong',1,'Left'),(12,'1','Kwun Tong Line','Shek Kip Mei',1,'Left'),(13,'1','Kwun Tong Line','Prince Edward',1,'Left'),(14,'1','Kwun Tong Line','Mong Kok',1,'Left'),(15,'1','Kwun Tong Line','Yau Ma Tei',1,'Left'),(16,'1','Kwun Tong Line','Ho Man Tin',1,'Left'),(17,'1','Kwun Tong Line','Whampoa',1,'Left'),(18,'1','Tsuen Wan Line','Tsuen Wan',1,'Left'),(19,'1','Tsuen Wan Line','Tai Wo Hau',1,'Left'),(20,'1','Tsuen Wan Line','Kwai Hing',1,'Left'),(21,'1','Tsuen Wan Line','Kwai Fong',1,'Left'),(22,'1','Tsuen Wan Line','Lai King',1,'Left'),(23,'1','Tsuen Wan Line','Mei Foo',1,'Left'),(24,'1','Tsuen Wan Line','Lai Chi Kok',1,'Left'),(25,'1','Tsuen Wan Line','Cheung Sha Wan',1,'Left'),(26,'1','Tsuen Wan Line','Sham Shui Po',1,'Left'),(27,'1','Tsuen Wan Line','Prince Edward',1,'Left'),(28,'1','Tsuen Wan Line','Mong Kok',1,'Left'),(29,'1','Tsuen Wan Line','Yau Ma Tei',1,'Left'),(30,'1','Tsuen Wan Line','Jordan',1,'Left'),(31,'1','Tsuen Wan Line','Tsim Sha Tsui',1,'Left'),(32,'1','Tsuen Wan Line','Admiralty',1,'Left'),(33,'1','Tsuen Wan Line','Central',1,'Left'),(34,'1','Island Line','Kennedy Town',1,'Left'),(35,'1','Island Line','HKU',1,'Left'),(36,'1','Island Line','Sai Ying Pun',1,'Left'),(37,'1','Island Line','Sheung Wan',1,'Left'),(38,'1','Island Line','Central',1,'Left'),(39,'1','Island Line','Admiralty',1,'Left'),(40,'1','Island Line','Wan Chai',1,'Left'),(41,'1','Island Line','Causeway Bay',1,'Left'),(42,'1','Island Line','Tin Hau',1,'Left'),(43,'1','Island Line','Fortress Hill',1,'Left'),(44,'1','Island Line','North Point',1,'Left'),(45,'1','Island Line','Quarry Bay',1,'Left'),(46,'1','Island Line','Tai Koo',1,'Left'),(47,'1','Island Line','Sai Wan Ho',1,'Left'),(48,'1','Island Line','Shau Kei Wan',1,'Left'),(49,'1','Island Line','Heng Fa Chuen',1,'Left'),(50,'1','Island Line','Chai Wan',1,'Left'),(51,'1','South Island Line','Admiralty',1,'Left'),(52,'1','South Island Line','Ocean Park',1,'Left'),(53,'1','South Island Line','Wong Chuk Hang',1,'Left'),(54,'1','South Island Line','Lei Tung',1,'Left'),(55,'1','South Island Line','South Horizons',1,'Left'),(56,'1','Tseung Kwan O Line','LOHAS Park',1,'Left'),(57,'1','Tseung Kwan O Line','Po Lam',1,'Left'),(58,'1','Tseung Kwan O Line','Hang Hau',1,'Left'),(59,'1','Tseung Kwan O Line','Tseung Kwan O',1,'Left'),(60,'1','Tseung Kwan O Line','Tiu Keng Leng',1,'Left'),(61,'1','Tseung Kwan O Line','Yau Tong',1,'Right'),(62,'1','Tseung Kwan O Line','Quarry Bay',1,'Right'),(63,'1','Tseung Kwan O Line','North Point',1,'Right'),(64,'1','Tung Chung Line & Disneyland Resort Line','Hong Kong',1,'Right'),(65,'1','Tung Chung Line & Disneyland Resort Line','Kowloon',1,'Right'),(66,'1','Tung Chung Line & Disneyland Resort Line','Olympic',1,'Right'),(67,'1','Tung Chung Line & Disneyland Resort Line','Nam Cheong',1,'Right'),(68,'1','Tung Chung Line & Disneyland Resort Line','Lai King',1,'Right'),(69,'1','Tung Chung Line & Disneyland Resort Line','Tsing Yi',1,'Right'),(70,'1','Tung Chung Line & Disneyland Resort Line','Sunny Bay',1,'Right'),(71,'1','Tung Chung Line & Disneyland Resort Line','Disneyland Resort',1,'Right'),(72,'1','Tung Chung Line & Disneyland Resort Line','Tung Chung',1,'Right'),(73,'1','East Rail Line','Admiralty',1,'Right'),(74,'1','East Rail Line','Exhibition Centre',1,'Right'),(75,'1','East Rail Line','Hung Hom',1,'Right'),(76,'1','East Rail Line','Mong Kok East',1,'Right'),(77,'1','East Rail Line','Kowloon Tong',1,'Right'),(78,'1','East Rail Line','Tai Wai',1,'Right'),(79,'1','East Rail Line','Sha Tin',1,'Right'),(80,'1','East Rail Line','Fo Tan',1,'Right'),(81,'1','East Rail Line','Racecourse',1,'Right'),(82,'1','East Rail Line','University',1,'Right'),(83,'1','East Rail Line','Tai Po Market',1,'Right'),(84,'1','East Rail Line','Tai Wo',1,'Right'),(85,'1','East Rail Line','Fanling',1,'Right'),(86,'1','East Rail Line','Sheung Shui',1,'Right'),(87,'1','East Rail Line','Lo Wu',1,'Right'),(88,'1','East Rail Line','Lok Ma Chau',1,'Right'),(89,'1','Tuen Ma Line','Tuen Mun',1,'Right'),(90,'1','Tuen Ma Line','Siu Hong',1,'Right'),(91,'1','Tuen Ma Line','Tin Shui Wai',1,'Right'),(92,'1','Tuen Ma Line','Long Ping',1,'Right'),(93,'1','Tuen Ma Line','Yuen Long',1,'Right'),(94,'1','Tuen Ma Line','Kam Sheung Road',1,'Right'),(95,'1','Tuen Ma Line','Tsuen Wan West',1,'Right'),(96,'1','Tuen Ma Line','Mei Foo',1,'Right'),(97,'1','Tuen Ma Line','Nam Cheong',1,'Right'),(98,'1','Tuen Ma Line','Austin',1,'Right'),(99,'1','Tuen Ma Line','East Tsim Sha Tsui',1,'Right'),(100,'1','Tuen Ma Line','Hung Hom',1,'Right'),(101,'1','Tuen Ma Line','Ho Man Tin',1,'Right'),(102,'1','Tuen Ma Line','To Kwa Wan',1,'Right'),(103,'1','Tuen Ma Line','Sung Wong Toi',1,'Right'),(104,'1','Tuen Ma Line','Kai Tak',1,'Right'),(105,'1','Tuen Ma Line','Diamond Hill',1,'Right'),(106,'1','Tuen Ma Line','Hin Keng',1,'Right'),(107,'1','Tuen Ma Line','Tai Wai',1,'Right'),(108,'1','Tuen Ma Line','Che Kung Temple',1,'Right'),(109,'1','Tuen Ma Line','Sha Tin Wai',1,'Right'),(110,'1','Tuen Ma Line','City One',1,'Right'),(111,'1','Tuen Ma Line','Shek Mun',1,'Right'),(112,'1','Tuen Ma Line','Tai Shui Hang',1,'Right'),(113,'1','Tuen Ma Line','Heng On',1,'Right'),(114,'1','Tuen Ma Line','Ma On Shan',1,'Right'),(115,'1','Tuen Ma Line','Wu Kai Sha',1,'Right'),(116,'1','Airport Express','Hong Kong',1,'Right'),(117,'1','Airport Express','Kowloon',1,'Right'),(118,'1','Airport Express','Tsing Yi',1,'Right'),(119,'1','Airport Express','Airport',1,'Right'),(120,'1','Airport Express','AsiaWorld-Expo',1,'Right');
/*!40000 ALTER TABLE `webapp_handrail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-09 15:54:39
