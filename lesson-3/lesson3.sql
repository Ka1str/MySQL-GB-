-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'praesentium',1),(2,'iusto',2),(3,'animi',3),(4,'velit',4),(5,'sequi',5),(6,'iusto',6),(7,'voluptas',7),(8,'in',8),(9,'in',9),(10,'possimus',10),(11,'dolorem',11),(12,'rerum',12),(13,'quos',13),(14,'qui',14),(15,'et',15),(16,'enim',16),(17,'laboriosam',17),(18,'veniam',18),(19,'possimus',19),(20,'sed',20),(21,'et',21),(22,'unde',22),(23,'in',23),(24,'repellat',24),(25,'est',25),(26,'eum',26),(27,'quaerat',27),(28,'sed',28),(29,'maxime',29),(30,'enim',30),(31,'perferendis',31),(32,'et',32),(33,'alias',33),(34,'velit',34),(35,'amet',35),(36,'tenetur',36),(37,'nobis',37),(38,'sunt',38),(39,'aut',39),(40,'ut',40),(41,'et',41),(42,'rerum',42),(43,'ut',43),(44,'velit',44),(45,'iure',45),(46,'accusantium',46),(47,'non',47),(48,'iure',48),(49,'non',49),(50,'nobis',50),(51,'laborum',51),(52,'et',52),(53,'rerum',53),(54,'culpa',54),(55,'dicta',55),(56,'quia',56),(57,'dolorem',57),(58,'ex',58),(59,'sunt',59),(60,'dicta',60),(61,'repellat',61),(62,'architecto',62),(63,'odit',63),(64,'molestias',64),(65,'dolor',65),(66,'minima',66),(67,'consequatur',67),(68,'voluptate',68),(69,'in',69),(70,'ipsam',70),(71,'ea',71),(72,'qui',72),(73,'minima',73),(74,'similique',74),(75,'aliquid',75),(76,'et',76),(77,'doloribus',77),(78,'odio',78),(79,'animi',79),(80,'explicabo',80),(81,'illum',81),(82,'adipisci',82),(83,'optio',83),(84,'culpa',84),(85,'culpa',85),(86,'non',86),(87,'incidunt',87),(88,'soluta',88),(89,'magni',89),(90,'dolore',90),(91,'ducimus',91),(92,'eos',92),(93,'voluptate',93),(94,'vel',94),(95,'distinctio',95),(96,'voluptas',96),(97,'corporis',97),(98,'cupiditate',98),(99,'ad',99),(100,'et',100);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,101,'1999-02-11 07:41:47'),(2,2,102,'2004-03-26 23:19:55'),(3,3,103,'1995-06-24 14:28:01'),(4,4,104,'2000-10-26 11:54:51'),(5,5,105,'2002-09-25 06:02:58'),(6,6,106,'1971-06-25 05:13:11'),(7,7,107,'2014-07-21 14:11:22'),(8,8,108,'2010-08-23 23:38:36'),(9,9,109,'1984-06-16 03:35:34'),(10,10,110,'1983-07-01 01:54:11'),(11,11,111,'1972-12-19 13:17:48'),(12,12,112,'1982-09-23 16:39:07'),(13,13,113,'2012-01-11 14:58:05'),(14,14,114,'2016-05-09 21:45:42'),(15,15,115,'2014-09-13 07:52:48'),(16,16,116,'1997-02-13 07:07:29'),(17,17,117,'1976-05-04 14:57:08'),(18,18,118,'1977-02-17 17:56:50'),(19,19,119,'2020-08-01 19:36:42'),(20,20,120,'2009-12-21 22:20:03'),(21,21,121,'1983-11-07 22:50:02'),(22,22,122,'1985-01-07 00:57:58'),(23,23,123,'1987-09-04 17:10:55'),(24,24,124,'2012-08-02 13:33:59'),(25,25,125,'2001-09-21 02:19:04'),(26,26,126,'1971-02-22 11:34:16'),(27,27,127,'1990-02-15 07:16:56'),(28,28,128,'1986-07-18 19:54:28'),(29,29,129,'1975-07-14 12:33:02'),(30,30,130,'2018-05-06 07:49:28'),(31,31,131,'1987-05-28 21:23:57'),(32,32,132,'2001-09-23 10:48:17'),(33,33,133,'2019-06-01 15:14:37'),(34,34,134,'2019-02-16 16:06:28'),(35,35,135,'2013-01-04 16:07:05'),(36,36,136,'1984-04-15 21:45:15'),(37,37,137,'2014-05-05 00:57:54'),(38,38,138,'2000-06-08 01:38:04'),(39,39,139,'2008-02-22 07:03:43'),(40,40,140,'2005-03-04 02:54:25'),(41,41,141,'1998-04-20 21:36:11'),(42,42,142,'1982-10-22 20:42:43'),(43,43,143,'2004-10-31 17:36:27'),(44,44,144,'1984-10-31 21:40:18'),(45,45,145,'1990-01-31 21:46:31'),(46,46,146,'1987-01-31 02:21:18'),(47,47,147,'1970-05-20 06:05:10'),(48,48,148,'1990-05-19 18:53:12'),(49,49,149,'1984-05-02 00:14:10'),(50,50,150,'2008-02-25 00:20:38'),(51,51,151,'1971-08-30 03:23:22'),(52,52,152,'1997-08-07 21:28:52'),(53,53,153,'2020-09-20 07:55:32'),(54,54,154,'2009-09-16 02:52:03'),(55,55,155,'2002-10-26 18:05:49'),(56,56,156,'1987-06-22 13:07:03'),(57,57,157,'2018-02-23 16:14:55'),(58,58,158,'1970-08-15 09:58:55'),(59,59,159,'2011-08-15 22:31:21'),(60,60,160,'2013-02-02 18:17:00'),(61,61,161,'2014-12-05 09:13:36'),(62,62,162,'1995-08-24 23:01:56'),(63,63,163,'2011-05-22 09:36:39'),(64,64,164,'1987-09-05 09:21:13'),(65,65,165,'1999-05-07 15:22:15'),(66,66,166,'2005-09-22 20:27:54'),(67,67,167,'2006-04-23 23:51:23'),(68,68,168,'2002-04-09 11:52:50'),(69,69,169,'1995-10-11 13:30:14'),(70,70,170,'1980-06-07 04:43:14'),(71,71,171,'1978-05-06 19:39:18'),(72,72,172,'1989-04-05 21:28:29'),(73,73,173,'1984-08-15 17:08:32'),(74,74,174,'2005-11-28 14:08:32'),(75,75,175,'1999-03-22 19:48:08'),(76,76,176,'1998-06-01 20:56:31'),(77,77,177,'1996-07-02 00:50:21'),(78,78,178,'1970-03-29 06:13:00'),(79,79,179,'1991-10-07 05:11:51'),(80,80,180,'1973-06-03 23:37:21'),(81,81,181,'1985-06-21 17:58:34'),(82,82,182,'2020-08-13 02:37:19'),(83,83,183,'1986-06-22 19:20:21'),(84,84,184,'2020-04-25 20:32:06'),(85,85,185,'1999-02-18 03:33:22'),(86,86,186,'1994-08-13 16:11:47'),(87,87,187,'1988-03-16 13:31:36'),(88,88,188,'2009-05-11 01:33:05'),(89,89,189,'1974-02-02 12:41:24'),(90,90,101,'2010-03-30 10:29:56'),(91,91,102,'1990-07-22 02:37:31'),(92,92,103,'1983-05-23 07:00:51'),(93,93,104,'1986-06-09 04:46:21'),(94,94,105,'2008-06-01 07:18:02'),(95,95,106,'1989-08-14 16:47:55'),(96,96,107,'1984-08-07 14:44:53'),(97,97,108,'2015-12-30 03:10:26'),(98,98,109,'1981-03-08 01:42:52'),(99,99,110,'2017-03-23 12:20:13'),(100,100,111,'2009-12-14 19:52:24');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (101,1,1,'rerum','vel',2,'9','2009-06-23 04:45:41','1993-12-16 12:48:26'),(102,2,2,'labore','accusantium',2,'9','1989-07-21 18:22:56','1974-07-12 11:47:31'),(103,3,3,'labore','sed',8,'5','2000-12-17 05:18:12','1998-09-10 13:11:32'),(104,4,4,'eius','vel',8,'1','2016-07-15 11:26:59','1983-01-18 15:31:57'),(105,5,5,'officiis','non',8,'9','1980-07-03 06:06:18','2003-03-04 16:03:22'),(106,6,6,'et','exercitationem',6,'5','1999-07-05 10:03:29','1988-06-20 15:37:20'),(107,7,7,'dicta','sed',3,'8','2013-09-27 22:56:29','2003-02-09 09:39:30'),(108,8,8,'ea','cum',2,'9','2014-01-15 15:22:53','1986-10-11 17:34:33'),(109,9,9,'dolorem','necessitatibus',5,'3','2018-11-02 01:42:07','2000-05-13 03:14:26'),(110,11,11,'velit','omnis',6,'5','1976-08-05 19:04:10','2018-08-19 02:23:17'),(111,12,12,'cum','velit',3,'6','2000-12-08 00:13:01','1980-07-04 14:30:47'),(112,13,13,'nisi','incidunt',6,'7','2011-06-08 19:35:56','1988-12-28 15:49:50'),(113,14,14,'sit','aut',3,'2','2009-04-17 02:57:30','2005-02-10 01:08:56'),(114,15,15,'laudantium','neque',1,'6','2019-06-10 21:35:28','2012-02-17 23:45:18'),(115,17,17,'perferendis','neque',8,'8','2009-03-19 17:46:12','1991-12-15 02:08:08'),(116,18,18,'sed','debitis',2,'6','2003-02-09 22:06:35','2014-08-06 17:50:49'),(117,19,19,'saepe','itaque',4,'1','2003-02-02 00:36:30','1997-08-19 18:37:24'),(118,20,20,'sequi','odio',2,'8','2000-06-23 21:47:29','1975-10-14 17:40:32'),(119,21,21,'ducimus','voluptas',7,'6','1981-07-16 04:43:17','2018-08-01 11:03:11'),(120,22,22,'id','tempore',7,'3','2002-07-02 02:48:37','2000-03-02 00:58:40'),(121,23,23,'totam','qui',2,'3','1984-03-09 10:23:38','1984-06-05 17:06:50'),(122,24,24,'assumenda','eum',5,'1','1987-03-26 01:40:56','2001-02-23 17:53:03'),(123,26,26,'inventore','non',7,'3','1976-08-22 15:00:27','1970-02-16 13:10:12'),(124,27,27,'quos','voluptates',1,'4','2018-05-10 12:43:14','1996-11-27 03:08:15'),(125,28,28,'mollitia','quae',5,'8','2007-11-08 01:31:11','1995-07-08 01:52:59'),(126,30,30,'facere','sint',6,'1','1997-10-01 16:27:03','2003-08-19 10:53:25'),(127,31,31,'suscipit','placeat',5,'9','2007-01-17 00:07:08','1977-02-28 01:52:20'),(128,32,32,'dicta','iusto',3,'1','2014-12-14 12:57:10','1982-12-06 04:00:19'),(129,33,33,'nesciunt','exercitationem',4,'9','2021-04-24 04:44:13','2017-02-25 03:53:09'),(130,34,34,'sequi','dignissimos',7,'5','2016-08-18 22:35:59','1982-08-26 01:10:26'),(131,35,35,'ex','autem',4,'8','1988-01-28 09:33:28','2006-03-16 18:02:04'),(132,36,36,'incidunt','sapiente',1,'1','1975-06-18 06:05:47','1988-11-07 21:49:58'),(133,37,37,'iure','aperiam',4,'7','2013-04-19 16:20:35','1994-04-02 20:58:25'),(134,40,40,'vel','aut',6,'6','1996-07-19 01:24:50','1973-07-13 07:52:29'),(135,41,41,'optio','iste',8,'5','2010-04-17 20:34:04','1983-04-21 01:01:47'),(136,42,42,'repudiandae','vero',6,'3','1996-09-26 02:07:45','1993-05-04 11:04:56'),(137,43,43,'voluptatem','officia',8,'9','1979-08-16 08:21:10','2010-11-09 07:12:10'),(138,44,44,'quasi','doloremque',5,'3','2015-08-03 11:02:45','2015-11-10 03:42:03'),(139,46,46,'ut','et',2,'2','1994-02-03 12:05:49','1993-07-15 21:09:14'),(140,47,47,'cumque','impedit',7,'4','1988-02-24 17:00:13','2021-01-06 10:12:53'),(141,48,48,'facilis','culpa',1,'6','2008-09-11 20:07:08','2020-08-31 17:40:25'),(142,50,50,'est','incidunt',5,'5','2014-12-19 18:06:39','2014-09-02 16:00:55'),(143,51,51,'doloremque','minima',8,'1','2011-08-30 13:57:47','1984-01-24 09:23:46'),(144,52,52,'et','possimus',9,'2','1998-12-06 15:52:30','2019-05-15 12:45:19'),(145,53,53,'occaecati','explicabo',6,'9','2007-05-20 11:39:21','1980-01-10 05:04:37'),(146,55,55,'qui','hic',5,'5','1971-11-27 15:45:02','1971-05-26 09:48:32'),(147,56,56,'et','vel',3,'1','2007-11-09 20:18:56','1982-10-28 02:53:36'),(148,57,57,'recusandae','dolor',9,'6','1987-03-09 01:53:10','1980-11-18 16:51:31'),(149,58,58,'dolores','asperiores',7,'4','2003-11-24 23:00:03','1998-02-02 01:40:56'),(150,59,59,'numquam','aut',3,'6','2019-05-14 04:27:38','2014-12-08 02:00:16'),(151,60,60,'veritatis','saepe',8,'1','1990-12-19 01:23:38','1998-12-28 17:28:12'),(152,61,61,'ducimus','nulla',2,'3','1973-06-29 09:31:24','1995-06-09 16:22:52'),(153,62,62,'molestias','ut',8,'7','1987-12-27 01:14:48','1990-08-28 20:39:06'),(154,63,63,'distinctio','saepe',1,'2','2006-03-18 03:10:20','1998-07-22 22:31:39'),(155,64,64,'id','reprehenderit',2,'3','1974-11-28 11:36:08','2021-02-03 01:19:28'),(156,65,65,'soluta','qui',7,'1','1992-02-02 19:10:12','1991-03-22 07:29:48'),(157,66,66,'impedit','ea',4,'4','1972-09-26 04:16:02','2003-02-06 09:01:19'),(158,67,67,'voluptatem','dolor',8,'1','2002-01-20 23:06:29','2000-10-14 01:33:56'),(159,68,68,'suscipit','animi',3,'2','1979-01-26 22:07:10','2018-05-06 14:15:38'),(160,69,69,'sint','repellat',1,'5','2009-09-12 08:34:46','1982-07-06 18:19:42'),(161,70,70,'tempore','et',6,'6','1996-07-18 17:42:21','2011-03-17 03:31:17'),(162,71,71,'sapiente','mollitia',2,'9','2019-07-27 19:19:58','2004-07-16 13:48:38'),(163,72,72,'excepturi','dolores',7,'3','1984-08-17 03:56:38','1985-07-29 03:52:21'),(164,73,73,'sit','ea',1,'4','1975-04-04 05:05:16','2001-09-04 13:00:06'),(165,74,74,'dolor','reiciendis',9,'7','1980-11-24 13:49:08','2004-08-06 14:16:04'),(166,75,75,'corrupti','aut',6,'4','1984-05-19 04:04:54','1977-03-31 09:55:12'),(167,76,76,'cumque','ratione',8,'2','2010-05-28 09:38:29','1981-07-23 19:01:33'),(168,77,77,'impedit','molestias',1,'2','2016-02-12 22:07:50','2001-09-26 06:15:15'),(169,78,78,'ducimus','labore',2,'6','1974-07-28 17:17:05','2003-11-20 00:36:22'),(170,79,79,'ea','vel',3,'4','1994-05-28 00:35:43','1999-03-16 01:12:37'),(171,80,80,'corrupti','facere',6,'4','1990-04-08 19:07:18','1994-07-29 22:25:46'),(172,81,81,'et','quia',6,'3','2017-09-28 07:02:17','2005-04-03 16:37:28'),(173,82,82,'et','inventore',6,'1','1979-03-15 14:00:07','1972-10-12 09:26:20'),(174,83,83,'excepturi','sunt',2,'7','1973-04-05 18:52:50','2000-10-22 03:13:52'),(175,84,84,'omnis','quam',3,'4','1982-12-07 11:37:42','1981-02-14 05:28:58'),(176,85,85,'saepe','et',1,'4','1990-04-26 17:31:39','2019-11-10 17:00:38'),(177,86,86,'sapiente','saepe',5,'8','2007-05-14 05:27:36','1998-03-07 16:41:56'),(178,87,87,'ea','rem',8,'9','2010-07-15 12:44:19','2012-11-12 05:26:09'),(179,88,88,'qui','deserunt',5,'5','2012-09-18 16:25:44','2019-06-25 18:10:23'),(180,89,89,'similique','occaecati',3,'8','1975-05-12 09:54:16','1987-08-22 22:14:28'),(181,91,91,'laborum','recusandae',4,'7','1971-07-27 21:01:42','2007-02-10 19:07:06'),(182,92,92,'aut','delectus',6,'2','2005-08-03 04:57:24','2005-08-19 02:45:50'),(183,93,93,'mollitia','ea',2,'9','1975-11-20 21:25:52','1980-05-06 23:07:00'),(184,94,94,'incidunt','minus',4,'8','1978-01-03 06:38:41','2003-05-24 19:52:05'),(185,96,96,'pariatur','assumenda',5,'9','1979-02-24 21:11:38','2007-09-21 11:05:19'),(186,97,97,'voluptatum','et',1,'2','2018-01-28 08:05:39','1979-02-09 13:00:19'),(187,98,98,'quisquam','eveniet',9,'2','1995-02-08 23:46:38','2015-10-25 05:05:39'),(188,99,99,'eligendi','modi',5,'8','1984-06-11 21:55:27','2010-10-06 02:06:02'),(189,100,100,'omnis','magni',1,'9','1977-05-11 04:51:00','2011-05-15 02:39:23');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'rem','1995-03-16 08:00:44','2020-10-05 23:49:48'),(2,'odio','1972-09-13 03:39:39','1997-05-21 00:25:00'),(3,'quia','1988-10-03 04:36:30','2008-08-14 08:24:36'),(4,'autem','1975-04-18 06:13:51','1970-03-17 10:21:30'),(5,'asperiores','1982-06-20 12:37:11','2004-10-25 07:57:52'),(6,'incidunt','1973-08-11 03:11:26','2012-03-22 08:22:12'),(7,'harum','1978-06-17 04:43:23','2002-02-10 07:07:12'),(8,'illum','1994-08-30 18:32:59','1991-11-19 07:03:19'),(9,'ullam','1989-05-11 00:08:51','2020-05-21 20:47:07'),(10,'debitis','1973-06-20 12:38:33','1973-09-12 09:06:17'),(11,'debitis','2001-07-14 02:36:57','1991-03-06 23:19:25'),(12,'rerum','1973-11-13 12:04:51','1975-10-25 10:10:32'),(13,'et','1990-01-15 01:56:41','1979-03-09 04:29:51'),(14,'eum','2000-07-24 23:20:59','2015-07-24 19:53:03'),(15,'ipsam','1987-02-24 23:00:12','1998-02-10 19:11:01'),(16,'illo','1972-03-19 03:52:55','1975-10-29 09:18:39'),(17,'possimus','1974-02-07 10:23:51','1978-09-04 06:58:03'),(18,'consequatur','2017-11-22 23:15:50','1977-01-10 04:19:18'),(19,'dolores','1996-08-25 20:13:15','1976-06-05 12:01:28'),(20,'dolorem','1977-07-03 20:34:20','2003-12-18 20:37:14'),(21,'labore','2013-04-07 09:17:07','2017-12-07 14:36:47'),(22,'magnam','2020-01-08 00:05:47','2011-01-13 23:34:56'),(23,'qui','2018-09-20 21:57:59','2005-08-20 13:21:27'),(24,'nihil','2012-06-15 20:39:12','1974-05-03 06:54:40'),(25,'id','1989-05-10 06:29:44','2005-08-29 09:38:23'),(26,'culpa','2021-02-05 23:24:23','2000-05-23 05:39:13'),(27,'nam','2018-02-24 17:40:03','1978-09-25 01:25:25'),(28,'repellat','2015-04-07 09:43:30','1983-02-20 23:32:04'),(29,'sunt','2018-10-11 13:31:40','1998-08-07 02:13:37'),(30,'placeat','1978-03-18 10:04:49','1977-10-09 03:43:36'),(31,'dolorum','2019-11-02 16:31:21','2002-02-08 17:12:22'),(32,'a','2019-06-06 06:39:03','1977-06-03 00:21:31'),(33,'repudiandae','2020-08-17 06:12:43','1993-01-29 06:56:58'),(34,'veritatis','2001-01-09 08:25:49','1988-08-28 12:37:13'),(35,'atque','1978-02-15 11:22:21','1986-11-24 10:26:07'),(36,'quae','1997-05-26 05:27:02','2008-06-02 10:44:34'),(37,'consectetur','2010-10-18 14:39:51','1996-05-07 22:17:27'),(38,'odio','2009-06-24 12:07:54','1980-04-13 20:57:20'),(39,'qui','1999-12-19 11:50:29','1983-06-20 21:23:29'),(40,'cupiditate','2004-01-07 14:27:59','1987-06-18 04:26:40'),(41,'omnis','2004-03-22 03:50:53','2009-10-10 05:32:00'),(42,'culpa','1988-10-30 03:06:41','2006-06-14 12:38:22'),(43,'rerum','2003-07-01 03:45:11','2009-04-28 19:08:15'),(44,'beatae','1978-08-27 04:22:44','2006-09-01 10:41:30'),(45,'praesentium','1972-04-03 02:54:00','1995-04-23 11:44:50'),(46,'maiores','1995-06-25 13:07:21','1979-01-01 06:10:39'),(47,'nisi','2006-08-01 18:12:48','2017-01-18 03:49:30'),(48,'molestias','2019-06-15 20:59:59','2016-12-22 08:10:28'),(49,'aut','2014-12-26 20:15:52','2008-09-08 20:08:43'),(50,'recusandae','2006-03-06 00:03:07','2003-11-24 01:16:31'),(51,'dolores','2016-02-19 21:25:47','1993-06-24 02:55:48'),(52,'id','2016-04-30 11:15:22','1993-01-09 07:38:07'),(53,'beatae','2012-09-09 06:00:16','1982-11-11 07:18:05'),(54,'deleniti','1995-05-12 06:48:18','2007-11-08 10:04:35'),(55,'dignissimos','1997-10-16 09:58:43','1999-02-21 20:42:15'),(56,'ducimus','1979-06-12 23:32:21','2019-11-25 23:33:25'),(57,'deleniti','1981-06-09 05:24:59','1998-02-14 18:50:19'),(58,'id','1992-10-26 22:50:01','2003-03-11 03:29:25'),(59,'aut','1984-11-29 16:35:00','2000-01-06 02:10:00'),(60,'adipisci','1992-11-01 14:59:45','1995-07-04 19:55:40'),(61,'a','1987-05-27 16:34:19','2012-08-22 03:29:15'),(62,'quidem','2001-06-12 09:54:17','1972-06-08 13:28:26'),(63,'corporis','1997-05-23 16:43:15','1992-08-12 07:02:26'),(64,'porro','1978-08-01 16:36:41','1995-06-10 16:08:06'),(65,'sit','2016-01-18 13:21:11','2009-01-08 23:32:01'),(66,'qui','2010-04-03 06:44:09','1975-06-08 08:41:54'),(67,'incidunt','2020-08-22 14:31:09','1983-11-07 07:56:02'),(68,'ipsum','1973-08-22 10:16:57','2005-08-27 17:41:36'),(69,'provident','2009-06-16 23:53:30','2015-07-23 16:58:05'),(70,'possimus','1986-08-13 09:59:02','2014-05-23 12:16:24'),(71,'eaque','1973-11-26 13:48:05','1976-04-28 16:57:17'),(72,'maxime','1982-03-16 06:31:19','2010-09-11 14:44:56'),(73,'ea','1980-12-04 00:04:58','2002-06-19 07:14:07'),(74,'nam','1988-10-23 10:15:22','2012-02-03 15:43:48'),(75,'voluptatum','1983-06-08 03:24:26','1982-05-27 22:54:24'),(76,'et','1970-05-30 08:28:35','2013-10-28 00:46:23'),(77,'accusantium','1982-09-22 05:51:30','2018-04-01 23:13:09'),(78,'cupiditate','2004-05-14 10:44:23','1995-01-03 12:27:56'),(79,'quia','1995-08-23 21:47:34','1973-03-07 05:20:54'),(80,'aut','2018-09-01 07:41:45','2017-08-08 23:29:18'),(81,'est','2018-07-03 09:22:34','2006-10-13 15:48:38'),(82,'ut','2005-11-01 13:30:21','1981-10-31 12:30:04'),(83,'architecto','1982-04-09 14:29:41','1999-08-06 05:58:01'),(84,'ut','1979-03-31 15:10:40','1994-09-05 06:04:05'),(85,'aut','1980-06-09 12:18:38','2001-08-28 02:14:02'),(86,'pariatur','2006-08-13 03:55:31','1981-05-09 03:57:46'),(87,'laudantium','1999-02-21 17:24:07','1996-02-21 11:01:54'),(88,'temporibus','1976-01-14 19:43:54','2018-09-13 19:26:41'),(89,'ut','2020-10-15 13:56:46','2014-09-01 00:19:41'),(90,'aliquam','1973-05-23 22:56:00','1988-12-10 16:16:55'),(91,'ut','1979-07-30 09:51:53','1992-06-16 22:16:31'),(92,'illo','1990-07-18 06:40:38','1978-11-03 16:24:52'),(93,'expedita','2015-09-01 01:07:33','1990-12-05 17:24:16'),(94,'error','2000-08-01 15:54:51','2016-05-29 23:26:26'),(95,'ut','1973-12-21 17:11:40','1985-09-05 00:54:32'),(96,'culpa','1981-02-16 13:45:55','2015-04-15 19:25:46'),(97,'velit','2019-08-03 20:13:37','1990-02-28 09:59:54'),(98,'totam','2003-06-26 10:19:31','1971-05-20 11:14:55'),(99,'consequatur','2001-03-09 20:00:40','1970-09-16 05:01:06'),(100,'aut','1991-08-26 22:52:05','1975-07-06 11:02:43');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Et reiciendis libero qui quia inventore natus accusamus. Repellat qui sed in aperiam laborum dolor. Error dolorem impedit cupiditate omnis soluta sequi eius.','1996-02-05 07:40:32'),(2,2,2,'Ex dolorem officia odio odio vel. Quam sapiente voluptate dolore corporis. Officia rem quo excepturi laborum enim possimus incidunt adipisci. Autem recusandae id quia.','1987-04-08 17:00:05'),(3,3,3,'Officiis fugiat fugiat est tempore nihil beatae repellat. Itaque consectetur est tempora soluta non perspiciatis similique cumque. Sit aut sed placeat dolore ad.','1986-08-14 15:24:49'),(4,4,4,'Aut voluptatum dolore debitis aut. Libero sapiente neque amet ut sed aut. Nesciunt et odit sequi fuga et voluptatem beatae ut. Asperiores beatae facilis laudantium earum esse perferendis natus.','1977-04-02 20:49:27'),(5,5,5,'Ipsa accusamus et non. Beatae voluptates pariatur nam voluptatibus laboriosam.','2007-12-02 19:48:40'),(6,6,6,'Facilis sed saepe commodi sit. Unde dolore nulla suscipit qui quasi. Delectus et consequatur delectus temporibus saepe.','1970-03-08 22:03:36'),(7,7,7,'Labore repellendus quasi praesentium non doloribus. Occaecati animi sit qui deserunt consequatur. Omnis eius ut quam. Magnam unde alias quia autem adipisci.','2016-07-10 04:14:07'),(8,8,8,'Dolor in tempore voluptatem omnis occaecati. Aut enim vel libero facere dolores. Et qui consequuntur voluptatem. Incidunt autem mollitia velit aut rerum. Aperiam hic aut nostrum occaecati.','1980-06-13 08:55:44'),(9,9,9,'Facilis voluptatibus suscipit ipsam adipisci recusandae. Delectus voluptas nisi dolore eius. Officia fuga provident rerum.','2012-02-15 22:34:42'),(10,10,10,'Commodi assumenda nihil cumque dolor neque omnis excepturi. Id quisquam aut rerum eos sunt eaque. Ut non et laudantium praesentium repudiandae iusto et. Consequatur eius corrupti aut. Doloribus nobis aliquid hic autem nam.','2012-04-30 08:15:20'),(11,11,11,'In repellat provident dolorum corporis sint optio odit aperiam. Vitae ea sit aliquam facere recusandae praesentium.','2012-04-20 13:45:01'),(12,12,12,'Minus corrupti impedit dolores a ad consequuntur. Rerum neque ut aut explicabo dolores aut nostrum. Molestiae assumenda tenetur temporibus. Sit ad consequatur doloremque ipsa ipsa magnam dolor.','2008-06-16 13:57:12'),(13,13,13,'Voluptates possimus nobis iste velit non. Doloremque rerum illum ex modi ipsam. Blanditiis maiores sequi voluptas enim. Vel beatae minima repellat nihil deleniti nobis.','1998-10-22 09:48:54'),(14,14,14,'Consequuntur deleniti et quia quidem repellendus quaerat quo. Aut autem neque et vel consequatur omnis necessitatibus. Deleniti voluptas ipsa facilis expedita accusamus.','1996-02-01 11:56:41'),(15,15,15,'Dolor hic harum praesentium dolorem sed. Dolores dignissimos sed perspiciatis et suscipit sunt. Maiores ipsa rerum recusandae quia. Nihil veritatis corporis omnis.','1978-11-23 21:01:40'),(16,16,16,'Voluptas nam architecto esse hic. Delectus numquam rerum saepe quo non laudantium. Consectetur incidunt dolor sit occaecati assumenda laudantium molestiae.','2012-01-29 22:15:50'),(17,17,17,'Quia hic repellendus beatae et in itaque deleniti. Est quod consequatur beatae autem ut voluptatibus. Quaerat doloribus reprehenderit voluptate similique. Totam quae nulla provident iure eligendi.','1991-01-11 19:01:27'),(18,18,18,'Similique ut cupiditate possimus. Dolor voluptas quam voluptas esse neque et. Et deserunt facilis quos libero et fugit ab. Est delectus animi velit.','2009-12-19 06:37:33'),(19,19,19,'Repellendus sequi blanditiis fuga molestias nisi. Ad consectetur vel voluptas praesentium saepe.','2004-08-01 16:28:44'),(20,20,20,'Harum nihil iure facilis repellendus quaerat quia animi. Vel debitis rerum nemo placeat saepe. Exercitationem deleniti atque id praesentium. In molestiae voluptas aliquam tempora sed.','1996-09-05 18:27:15'),(21,21,21,'Doloremque incidunt sapiente culpa beatae fuga nemo. Iste non qui voluptatem. Architecto totam in quis minima.','1995-02-17 01:40:42'),(22,22,22,'Vitae nostrum quas accusamus hic est quo molestiae. Reiciendis molestiae provident repellat quidem et ducimus. Voluptatem repellat adipisci dolores perspiciatis dolor.','1997-11-11 09:36:19'),(23,23,23,'Autem necessitatibus quis doloremque facere doloribus vero. Libero ut ratione quia ab error. Aliquam ad eos sapiente. Et et vero vitae voluptates atque corporis odio.','2006-10-17 00:20:08'),(24,24,24,'Aliquid quis ut itaque porro fugit dolorum at. Aliquam eos voluptates tenetur fugit reprehenderit qui. Enim fugiat eaque quos fugit.','1995-04-13 00:17:43'),(25,25,25,'Vel dolores voluptatem consequatur sint ducimus velit. Fugit asperiores sed illo. Voluptatem et necessitatibus voluptate voluptas doloremque possimus.','2013-05-24 10:40:47'),(26,26,26,'Quas quisquam sint consectetur est iusto non. Culpa harum magni nesciunt et maiores velit et. Occaecati iste voluptatem qui aut repellat non neque. Illum sint autem rem unde. Vel neque velit reprehenderit.','2014-10-11 14:46:38'),(27,27,27,'Error blanditiis et dicta aut. Et quos commodi maxime mollitia explicabo. Suscipit qui alias provident. Ducimus fuga dolore quidem iure ea ullam.','1980-12-26 23:24:05'),(28,28,28,'Aliquid delectus eaque quia officia perspiciatis ad quis. At aspernatur qui nisi sapiente neque. Fuga alias eligendi nihil culpa.','1976-06-16 10:09:29'),(29,29,29,'Et quibusdam veritatis recusandae dolorem. Nihil optio non nobis quia et nihil. Repudiandae consequatur architecto cumque adipisci voluptatem harum dolor.','1995-04-08 07:17:36'),(30,30,30,'Qui minus iste modi ratione corrupti. Rerum accusantium est sunt possimus animi qui. Est illum quis atque et quia ut qui. Fuga fugit assumenda deserunt rerum sint sapiente nisi.','1979-07-23 08:34:27'),(31,31,31,'Eum et asperiores ut corrupti harum dolorum. Quo aut dolorum ipsa totam laudantium sunt animi officia. Necessitatibus voluptas consectetur aut sunt esse.','1972-08-02 03:26:48'),(32,32,32,'Omnis vero voluptas omnis. Labore labore vel sit eveniet. Error voluptatem laudantium omnis voluptas at aliquam nam.','1984-06-14 02:26:51'),(33,33,33,'Culpa unde aut sint amet et illum sit quidem. Atque consequatur enim voluptates. Et eaque incidunt molestias sunt porro.','1998-10-29 21:36:35'),(34,34,34,'Voluptatem inventore quis qui molestias omnis non sit aut. Voluptas facere eveniet aliquam cupiditate et aperiam exercitationem. Possimus totam possimus labore harum asperiores iusto.','1988-12-27 22:09:26'),(35,35,35,'Voluptate ut delectus ipsam quia ut omnis ad. Ea quae quidem inventore. Fugit sunt consectetur totam sed rem ea. Quia eligendi facere facere magnam et fuga inventore.','2001-02-22 17:57:09'),(36,36,36,'Error cumque sed itaque eum illo quasi quo. Deserunt magni id voluptas sequi numquam. Reprehenderit itaque ea ex quia. Facere ut non nihil sapiente.','1976-10-02 03:49:01'),(37,37,37,'Vitae accusantium in necessitatibus quo tempora est. Et debitis ipsam ex consectetur eligendi nisi voluptate nisi. Natus dolor hic sed quidem quia. Doloremque illum quibusdam qui velit. Animi maxime qui iste quos ut natus veniam.','1987-09-14 01:41:45'),(38,38,38,'Et illum delectus quas. Velit quod sed quia veritatis perspiciatis aut totam. Numquam consequatur voluptatem est dolorem nihil maxime. Maxime alias id in illum. Ipsa minus debitis dolorem ut est non.','1976-09-18 12:48:49'),(39,39,39,'Commodi dolor dolorem ratione dolorem. Id debitis ab debitis aut tenetur nostrum. Consequatur qui veniam velit eum qui ipsa et sed.','2018-03-11 06:05:05'),(40,40,40,'Aut eos possimus reiciendis illo delectus et. Eaque omnis exercitationem repudiandae laboriosam a. Eum sit in asperiores explicabo autem. Voluptatem rerum quam blanditiis error ut dicta nesciunt soluta.','1973-09-29 00:20:57'),(41,41,41,'Culpa culpa in ut eos. Possimus consequatur corporis natus. Autem ea aut necessitatibus repellendus. Eum voluptas quia nemo cumque.','1979-04-27 02:53:33'),(42,42,42,'Ipsum vitae harum aut eos. Tempora culpa ducimus illum atque accusamus reiciendis maxime. Sed qui quia culpa hic tempora eum animi. Cumque ab distinctio est id qui.','1991-11-19 11:21:49'),(43,43,43,'Voluptatibus blanditiis voluptas esse eos sed omnis quaerat et. Numquam quo iusto eius. Officiis omnis libero repellat repellat non.','1977-02-14 11:21:33'),(44,44,44,'Id ut ipsa ipsam sed cum. Cum aperiam reprehenderit et qui quidem cum qui. Tenetur aliquam et repellendus at. Cumque in voluptatibus enim provident non eligendi ut delectus.','2014-02-06 09:47:06'),(45,45,45,'Necessitatibus laboriosam nihil in. Ut iste aspernatur repellendus et consequatur blanditiis at. Sint id qui velit maxime. Qui maiores omnis sed necessitatibus ipsam culpa. Aut quisquam dolorum esse facere tempora atque.','1980-12-28 01:51:15'),(46,46,46,'Dolorem in cupiditate consequuntur eos. Totam est ut quasi ex et. Nesciunt nam explicabo qui nostrum odio exercitationem quia temporibus. Enim quisquam nesciunt voluptas vero dolor.','1977-05-01 16:26:52'),(47,47,47,'Quo in quo nam quis. Autem ullam occaecati iusto porro numquam est voluptates.','2004-01-07 19:48:44'),(48,48,48,'Esse error magnam deserunt voluptatibus doloremque. Eveniet rerum magni est dolor nostrum consequatur. Dolores vel non ipsam ratione est. Facere cum placeat tempora.','2014-11-04 02:07:32'),(49,49,49,'Assumenda voluptate quisquam nemo fugiat autem. Consectetur eveniet ea omnis quaerat. Sunt aliquid est itaque quis. Quas amet aut aut fugiat quidem tenetur.','2007-05-27 03:56:26'),(50,50,50,'Sint voluptatem labore deleniti et. Tenetur quis odio veniam voluptatem officiis eum voluptas. Molestiae rerum quos tempora non quis eaque.','1987-09-11 09:12:56'),(51,51,51,'Itaque corporis ut et et facere impedit necessitatibus. Dolorum a quo nostrum. Odio impedit quis doloremque consequatur id consequuntur. Sint minima quod aut qui deserunt. Architecto repellat magnam atque error ut beatae quibusdam.','1982-12-19 01:55:54'),(52,52,52,'Exercitationem eum quis distinctio eum repudiandae soluta commodi. Cupiditate cupiditate veritatis qui aut et culpa. Quasi molestiae et maxime nostrum aut porro. Qui at ullam eaque minus quam.','1974-03-04 03:23:44'),(53,53,53,'Veritatis in aperiam rerum nihil qui. Sunt sint in ducimus quo. Sapiente minus quam nulla ullam. Repellendus aliquid quod et minima.','2001-03-31 09:20:06'),(54,54,54,'Voluptas nostrum similique est quia nobis accusamus. Corrupti veritatis neque soluta soluta sint qui magnam. Voluptas veniam eius error nesciunt perferendis laboriosam perferendis voluptatem.','1979-01-15 01:40:03'),(55,55,55,'Ab est architecto sed. Delectus itaque repellendus modi at dolor dolor. Nesciunt autem et laudantium ipsam velit. Incidunt est soluta sit atque voluptatem.','2002-12-12 19:57:30'),(56,56,56,'Officiis est voluptas doloribus doloremque distinctio nihil. Eos qui et aliquid consequatur maiores rem. Officia mollitia nobis voluptatibus error.','1981-11-17 02:07:55'),(57,57,57,'Repellendus est soluta quae consequatur et nobis. Minus ratione fugiat nobis consequatur ducimus voluptas nihil. Dolores in qui architecto at commodi sequi expedita. Est suscipit iusto repellendus harum quo.','1999-08-21 09:10:17'),(58,58,58,'Nemo dolorem perspiciatis rerum non dolor eum voluptas corporis. Aperiam dicta fuga corrupti assumenda exercitationem sunt. Doloribus veritatis expedita ratione aut placeat sit. Porro sunt occaecati quas sequi explicabo quos molestiae.','2002-03-31 01:06:57'),(59,59,59,'Voluptate voluptatem nihil est delectus. Est commodi sit voluptatem alias aut. Ipsum illum dicta amet tenetur autem nam eveniet.','1987-11-10 10:42:46'),(60,60,60,'Ea rerum placeat illum aut ex molestias. Eos soluta recusandae doloribus distinctio officiis mollitia doloribus. Blanditiis eos eveniet placeat reiciendis. Dicta omnis culpa sint voluptatum id quis doloremque.','2010-02-01 22:17:02'),(61,61,61,'Qui quisquam nesciunt temporibus. Voluptatum reprehenderit unde magnam rerum at voluptatem similique. Ut dolore est voluptatem atque debitis eveniet vero nulla.','1983-12-06 08:37:14'),(62,62,62,'Sunt quia impedit esse molestiae consequatur vel dolores. Aut esse odio doloribus corporis fugit quas qui error. Quia sed eum ea dolor laborum.','2008-03-20 14:31:09'),(63,63,63,'Vel sit soluta sunt dolores. Eum magni iusto et dignissimos officia aut inventore. Ut a sed ut. Facilis sed nihil eius veritatis.','1999-04-26 11:59:51'),(64,64,64,'Autem consequuntur fugit velit nulla ipsa. Quia sunt nulla voluptatem esse consequatur dignissimos. Deleniti beatae doloremque autem ipsa harum blanditiis.','1984-02-24 11:56:57'),(65,65,65,'Debitis et sit ut blanditiis in. Ut et rerum repudiandae deserunt. Quod ratione dolore vel aliquam corrupti et hic. Et numquam perferendis eos voluptas animi veniam.','2017-03-30 12:47:41'),(66,66,66,'Perferendis voluptatem mollitia est. Et dolor id qui minima. Accusantium quo iusto maxime molestias vero doloremque qui corrupti.','1972-10-07 00:17:33'),(67,67,67,'Et molestiae autem ipsam laborum aut temporibus nihil. Voluptas fugit error natus sint. Qui nihil repudiandae repudiandae ea perspiciatis beatae. Rem fuga nostrum et adipisci minima.','1990-06-26 07:40:44'),(68,68,68,'Qui et ab amet. Reiciendis perspiciatis et iusto maiores quibusdam ut. Eligendi ex vero placeat exercitationem aspernatur aspernatur. Doloremque nesciunt repudiandae alias dolorem.','1976-04-23 23:10:14'),(69,69,69,'Voluptatem tempore sit officiis reprehenderit hic expedita. Error unde pariatur ut assumenda. Est optio doloremque debitis.','1991-04-04 20:42:13'),(70,70,70,'In commodi deserunt iusto modi et. Aliquid nemo sapiente tenetur nihil esse a ad. Ab est quaerat eaque et eos. In cumque impedit et. Est perferendis magni enim beatae quisquam.','2010-08-31 08:05:49'),(71,71,71,'Qui molestiae dolores nisi explicabo suscipit corporis. Labore consequuntur quo veniam est ad dolores vitae. Maxime impedit voluptatem voluptatibus ratione maiores quaerat. Eveniet repellat quibusdam praesentium.','1971-04-08 00:09:36'),(72,72,72,'Magnam sit rerum nisi ipsa cum ea quis eum. Eveniet et sit earum est sed inventore. Maiores velit expedita dolorem mollitia temporibus molestiae. Quis dolorem eveniet ut.','2019-11-20 23:19:43'),(73,73,73,'Libero nesciunt assumenda laudantium aut. Laudantium dicta voluptatem consectetur nihil aut corporis quibusdam. Tenetur animi sequi officia qui. Esse dolorum repellendus tenetur sit temporibus nam quia.','1982-11-08 11:14:47'),(74,74,74,'Aspernatur cum repudiandae unde totam. Numquam sequi voluptas nostrum et voluptas. Cum dolorem at molestiae assumenda ea. Et est doloribus perspiciatis est.','1986-11-05 22:13:27'),(75,75,75,'Ex molestias quidem consequatur assumenda nulla praesentium. Dolores suscipit soluta sapiente incidunt temporibus modi. A eius unde eos consequuntur voluptates omnis nostrum.','2011-04-23 10:58:43'),(76,76,76,'Culpa ut est enim praesentium. Placeat voluptas similique minus rem assumenda ex quis at. Dignissimos quas perspiciatis eveniet cum ut ab.','1988-02-25 14:39:35'),(77,77,77,'Non voluptatem atque quas. Non repudiandae dolorem debitis maxime amet. Voluptatum similique et quo ut.','1973-11-17 09:45:35'),(78,78,78,'Ducimus aut consequatur doloribus numquam nesciunt sit impedit ea. Exercitationem sit voluptatem exercitationem qui. In adipisci quia eos quas quis ut. Sequi molestias nemo aut dolorum voluptatibus.','2007-10-21 04:21:48'),(79,79,79,'Sit eos repudiandae quia ex fugiat fuga provident. Repellat non eveniet molestiae omnis odit.','2017-02-12 19:08:42'),(80,80,80,'Cupiditate officia sunt dolorem ut nesciunt nemo. Est velit repudiandae earum voluptas rerum. Eius provident id consequatur nobis et minima similique. Voluptatem iure temporibus consequuntur excepturi soluta non mollitia quia.','1982-07-08 17:52:38'),(81,81,81,'A architecto velit quibusdam recusandae minima. Commodi rem voluptatem quo maiores perspiciatis fuga. Rerum rerum dolore aperiam.','1976-02-17 20:29:31'),(82,82,82,'Quisquam qui omnis corrupti at quas ipsum itaque et. Sit dignissimos odio fugiat quia occaecati doloribus eaque. Voluptatem magnam magnam repudiandae ipsa et. Facere est fugiat totam voluptas illo quia excepturi. Facere repellat adipisci incidunt iure.','2009-12-12 23:26:30'),(83,83,83,'Molestiae mollitia tenetur corrupti eligendi esse ullam ut. Est ipsa optio omnis soluta vel. Adipisci occaecati quo at molestias libero sint nulla blanditiis.','1985-10-29 16:27:53'),(84,84,84,'Quidem delectus et aut aut iusto iusto quod. Inventore cupiditate sint consequatur ab. Dignissimos vitae omnis iste eveniet porro tempore. Totam corporis sequi consequatur sint saepe.','1980-01-07 12:24:05'),(85,85,85,'Nesciunt consequatur vel dolorem sit occaecati nulla molestiae. Ullam qui non qui consequatur. Impedit accusamus animi ut consectetur hic libero. Quo eveniet quas aut non vero.','2012-01-29 12:33:12'),(86,86,86,'Laboriosam aliquam ut quod fuga fugiat sed repellat. Qui qui consequatur nesciunt voluptatibus aperiam aut. Facere quidem voluptate perferendis sed quae.','2004-04-21 08:48:57'),(87,87,87,'Repellendus aut iure qui pariatur iste in sed. Cum aut aut reprehenderit debitis quibusdam. Sunt dolore ut vel voluptatum quibusdam dolores quidem sed. Non qui autem quidem molestiae porro eum.','1996-05-02 17:59:05'),(88,88,88,'Ut natus ut est assumenda voluptatem earum aut. Consequatur explicabo voluptas dignissimos suscipit dolorem nostrum eum sunt. Iusto nemo corporis et consectetur aut aut. Eum incidunt non veniam rerum sunt qui aut esse.','1986-09-04 20:44:52'),(89,89,89,'Dolorem voluptatem sint repellendus enim. Laudantium exercitationem perferendis a. Expedita placeat modi a officia vel. Laboriosam est est voluptatem.','1988-10-25 03:49:58'),(90,90,90,'Nobis sit deserunt est suscipit et atque. Dolore facere praesentium ut sit recusandae cumque expedita qui. Et et adipisci maiores dolor dolor. Ad dolores vero vel optio repellat ipsum.','2010-04-26 00:48:10'),(91,91,91,'Autem ducimus quis id sed aut velit et corrupti. Perspiciatis provident ipsa itaque cumque. Ipsum non ea eius sed quia pariatur incidunt. Praesentium accusamus maxime sed aliquam reiciendis totam nam eaque.','1981-08-18 08:11:23'),(92,92,92,'Asperiores amet nemo nobis ad. Accusamus sit aut deleniti quo quia sit. Quae ducimus et esse consequuntur natus asperiores.','2011-09-17 22:43:34'),(93,93,93,'Voluptatem ipsa laudantium et qui maxime. Quia molestiae quis dolor accusantium corporis hic. Magnam nisi possimus alias id aut et non quo. Aut consectetur sed beatae ut sed et asperiores.','2013-01-17 09:32:05'),(94,94,94,'Consequatur in qui tenetur consectetur. Possimus dicta quia et dicta aut laborum nostrum. Fugit quia ea alias consectetur est. Est est veritatis facilis corrupti veniam quisquam. Sed voluptas impedit itaque nemo dolorem soluta.','1989-09-07 02:43:52'),(95,95,95,'Saepe qui ut debitis repellendus esse dignissimos molestiae atque. Vero autem optio dolore laborum sit. Voluptate laborum earum rerum ipsa ut aut. Sed dolore repellat omnis aspernatur qui.','1990-10-21 03:09:55'),(96,96,96,'Necessitatibus earum velit veniam id. Aut excepturi ducimus consequuntur atque occaecati qui quos minima. Doloribus et et perferendis id amet. Ipsa quia beatae atque et autem quod consequatur.','1981-08-11 00:59:22'),(97,97,97,'Eius voluptas perferendis assumenda earum dignissimos dolor. Atque velit numquam dignissimos a eaque. Cumque deserunt ipsum qui modi. Officiis ducimus omnis beatae exercitationem ducimus sed.','1992-05-31 02:04:54'),(98,98,98,'Optio reprehenderit quos nisi sint. Inventore est qui quia. Optio nihil nihil omnis delectus corporis.','1992-12-23 01:49:23'),(99,99,99,'Dolorem nihil quisquam qui explicabo. In sit est asperiores ipsam nam alias. Esse alias quibusdam eius velit aliquid quibusdam. Voluptas quis dignissimos accusantium est praesentium cupiditate dolore.','2005-12-09 11:40:45'),(100,100,100,'Aut pariatur quam iste quod. Libero molestiae id aut eligendi quis aliquam. Nobis porro earum repellendus veritatis repudiandae.','1996-07-17 17:58:12');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'voluptates',1),(2,'excepturi',2),(3,'suscipit',3),(4,'reiciendis',4),(5,'inventore',5),(6,'modi',6),(7,'et',7),(8,'est',8),(9,'reiciendis',9),(10,'et',10),(11,'aut',11),(12,'non',12),(13,'rem',13),(14,'deleniti',14),(15,'occaecati',15),(16,'odit',16),(17,'autem',17),(18,'omnis',18),(19,'quo',19),(20,'in',20),(21,'qui',21),(22,'eos',22),(23,'ea',23),(24,'ea',24),(25,'sapiente',25),(26,'minima',26),(27,'fuga',27),(28,'voluptatem',28),(29,'et',29),(30,'quia',30),(31,'perferendis',31),(32,'vitae',32),(33,'facilis',33),(34,'nobis',34),(35,'voluptates',35),(36,'ullam',36),(37,'quia',37),(38,'consequatur',38),(39,'et',39),(40,'provident',40),(41,'sed',41),(42,'qui',42),(43,'perferendis',43),(44,'quaerat',44),(45,'quia',45),(46,'ipsum',46),(47,'natus',47),(48,'tempore',48),(49,'porro',49),(50,'totam',50),(51,'animi',51),(52,'est',52),(53,'consequatur',53),(54,'neque',54),(55,'est',55),(56,'veritatis',56),(57,'consequatur',57),(58,'non',58),(59,'cum',59),(60,'aut',60),(61,'velit',61),(62,'et',62),(63,'ut',63),(64,'porro',64),(65,'qui',65),(66,'non',66),(67,'nam',67),(68,'est',68),(69,'et',69),(70,'est',70),(71,'dolorem',71),(72,'maiores',72),(73,'velit',73),(74,'voluptatem',74),(75,'et',75),(76,'reprehenderit',76),(77,'optio',77),(78,'et',78),(79,'est',79),(80,'earum',80),(81,'et',81),(82,'repellat',82),(83,'non',83),(84,'ut',84),(85,'sapiente',85),(86,'nihil',86),(87,'assumenda',87),(88,'enim',88),(89,'quam',89),(90,'aspernatur',90),(91,'qui',91),(92,'mollitia',92),(93,'nostrum',93),(94,'omnis',94),(95,'sed',95),(96,'doloribus',96),(97,'aliquid',97),(98,'vero',98),(99,'ut',99),(100,'culpa',100);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,101),(2,2,102),(3,3,103),(4,4,104),(5,5,105),(6,6,106),(7,7,107),(8,8,108),(9,9,109),(10,10,110),(11,11,111),(12,12,112),(13,13,113),(14,14,114),(15,15,115),(16,16,116),(17,17,117),(18,18,118),(19,19,119),(20,20,120),(21,21,121),(22,22,122),(23,23,123),(24,24,124),(25,25,125),(26,26,126),(27,27,127),(28,28,128),(29,29,129),(30,30,130),(31,31,131),(32,32,132),(33,33,133),(34,34,134),(35,35,135),(36,36,136),(37,37,137),(38,38,138),(39,39,139),(40,40,140),(41,41,141),(42,42,142),(43,43,143),(44,44,144),(45,45,145),(46,46,146),(47,47,147),(48,48,148),(49,49,149),(50,50,150),(51,51,151),(52,52,152),(53,53,153),(54,54,154),(55,55,155),(56,56,156),(57,57,157),(58,58,158),(59,59,159),(60,60,160),(61,61,161),(62,62,162),(63,63,163),(64,64,164),(65,65,165),(66,66,166),(67,67,167),(68,68,168),(69,69,169),(70,70,170),(71,71,171),(72,72,172),(73,73,173),(74,74,174),(75,75,175),(76,76,176),(77,77,177),(78,78,178),(79,79,179),(80,80,180),(81,81,181),(82,82,182),(83,83,183),(84,84,184),(85,85,185),(86,86,186),(87,87,187),(88,88,188),(89,89,189),(90,90,101),(91,91,102),(92,92,103),(93,93,104),(94,94,105),(95,95,106),(96,96,107),(97,97,108),(98,98,109),(99,99,110),(100,100,111);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','2019-12-26',1,'2014-10-14 13:10:05','Bodebury'),(2,'m','1988-05-11',2,'2010-07-06 02:39:28','South Carlie'),(3,'m','1987-07-14',3,'1976-09-17 20:37:39','Port George'),(4,'f','2020-11-08',4,'1996-11-20 15:13:24','Kesslerstad'),(5,'m','1986-11-05',5,'1983-10-18 04:32:41','Jerodmouth'),(6,'m','1983-07-13',6,'2010-07-23 22:33:18','South Clyde'),(7,'m','2001-05-13',7,'1979-06-06 02:39:57','Smithamland'),(8,'m','1999-01-10',8,'1995-05-08 11:53:07','Colliermouth'),(9,'f','1977-01-06',9,'1979-01-08 05:34:23','South Kaci'),(10,'m','2000-04-07',10,'1973-04-07 16:40:12','Alfonsofort'),(11,'m','1978-02-10',11,'2001-04-04 07:56:35','West Sigurd'),(12,'m','1980-02-08',12,'1982-02-09 20:54:39','East Audra'),(13,'f','2017-10-05',13,'2004-01-14 02:22:28','Leeburgh'),(14,'f','2012-01-11',14,'1997-03-21 19:47:54','North Wilmerview'),(15,'f','1981-06-30',15,'2012-09-29 17:54:34','Conroybury'),(16,'m','1971-12-04',16,'1974-05-07 05:57:19','Lake Carole'),(17,'m','1989-07-17',17,'2011-06-16 14:25:28','East Deionville'),(18,'m','1973-03-11',18,'2019-04-20 05:53:40','North Millie'),(19,'m','1978-08-04',19,'1994-01-22 20:39:17','Lake Duane'),(20,'f','1971-06-29',20,'1984-05-27 11:57:48','Ratkeburgh'),(21,'m','1998-12-12',21,'1998-02-09 13:31:11','Delaneyberg'),(22,'m','1998-03-28',22,'1978-11-05 06:14:42','Hirthefort'),(23,'m','2013-09-21',23,'2010-04-09 16:11:24','Furmanmouth'),(24,'f','1992-07-09',24,'1996-07-01 04:07:34','South Brandon'),(25,'f','2009-10-09',25,'2006-12-09 04:37:51','Hahnbury'),(26,'m','1981-11-15',26,'1994-09-11 20:19:17','West Hettieshire'),(27,'f','2017-01-16',27,'1982-09-18 11:51:59','Lake Donnie'),(28,'m','1994-10-30',28,'1986-04-20 08:44:47','Port Deondre'),(29,'f','1999-12-24',29,'1986-02-19 08:32:03','East Tanner'),(30,'f','2013-11-18',30,'1999-09-30 21:25:28','Borerside'),(31,'m','1982-11-17',31,'2002-07-09 03:07:38','Mateofurt'),(32,'m','1997-05-11',32,'1987-02-06 19:25:45','New Hope'),(33,'f','1981-12-04',33,'1972-12-20 14:25:42','Turnerburgh'),(34,'f','1971-08-09',34,'2013-07-20 09:10:41','Kendrashire'),(35,'m','2017-05-16',35,'1997-03-03 04:46:45','Ryleeport'),(36,'f','2006-01-25',36,'2015-05-23 08:09:42','Gladysstad'),(37,'f','1995-05-31',37,'1993-05-31 10:29:37','Lelandland'),(38,'f','1994-09-17',38,'1977-02-06 20:07:19','Smithamport'),(39,'f','1975-08-26',39,'1977-10-03 10:53:02','East Cydney'),(40,'f','2004-06-09',40,'2011-10-09 06:57:54','Port Flaviotown'),(41,'m','2009-03-23',41,'1993-09-10 23:33:23','Fritschstad'),(42,'f','1998-06-06',42,'1985-02-28 13:13:48','Karlichester'),(43,'f','2014-06-12',43,'2019-03-19 04:22:46','Daisyburgh'),(44,'m','2001-04-29',44,'1977-10-28 10:43:24','Port Elissa'),(45,'m','2009-09-16',45,'2015-12-15 08:26:00','Matthaven'),(46,'m','1993-11-04',46,'1972-03-29 02:15:24','East Trent'),(47,'f','1981-08-28',47,'1987-06-07 00:59:43','Rueckerton'),(48,'m','1995-11-07',48,'2014-10-13 21:17:21','New Kyleigh'),(49,'m','1992-04-28',49,'1999-08-31 16:17:51','North Kenyon'),(50,'f','1979-10-27',50,'1985-11-03 09:54:44','Earleneton'),(51,'f','1972-06-10',51,'1979-04-15 22:38:43','Riceport'),(52,'m','1980-04-26',52,'1988-02-05 01:29:19','South August'),(53,'f','2011-10-19',53,'1982-06-05 21:59:37','Port Lorenzaborough'),(54,'f','1971-09-07',54,'2013-06-29 01:21:42','Lake Fannyville'),(55,'f','2010-07-20',55,'1988-01-25 09:57:11','Treviontown'),(56,'f','2002-09-25',56,'2011-06-18 02:54:04','Deloresside'),(57,'m','1997-03-05',57,'2013-08-03 01:44:02','Sipesberg'),(58,'f','1991-03-15',58,'1988-11-11 20:44:39','East Godfrey'),(59,'m','1977-02-27',59,'1982-07-01 12:00:55','Powlowskibury'),(60,'m','2011-07-18',60,'2008-07-17 19:53:40','Jaydenmouth'),(61,'m','1992-06-09',61,'2006-03-14 20:13:55','Bruceville'),(62,'m','1980-09-13',62,'2012-03-20 16:13:38','Kihnside'),(63,'f','2015-12-15',63,'1992-07-11 20:30:07','Maryjanehaven'),(64,'f','1996-10-04',64,'1984-12-20 22:21:04','Edwinmouth'),(65,'f','1989-02-02',65,'1990-07-24 12:20:45','North Paris'),(66,'m','2006-09-18',66,'1992-07-23 06:53:22','Lake Maximochester'),(67,'m','1976-05-13',67,'2003-01-14 07:48:35','Elnoraberg'),(68,'m','2019-07-31',68,'1992-03-28 10:54:42','East Ricardoside'),(69,'m','1978-02-09',69,'1993-01-15 19:14:39','North Logan'),(70,'f','2001-02-23',70,'2008-08-28 03:31:40','Colemouth'),(71,'m','1986-03-19',71,'1978-04-02 13:32:05','Lake Katelynnport'),(72,'f','2011-02-02',72,'2018-04-01 18:41:59','Lake Reinaport'),(73,'m','1988-06-26',73,'1978-03-10 07:21:34','Aldenside'),(74,'m','2014-10-05',74,'1988-12-03 23:24:35','Doyleberg'),(75,'m','1989-11-26',75,'2021-05-27 21:03:25','Connshire'),(76,'m','1977-01-27',76,'1972-07-07 00:47:28','Louveniamouth'),(77,'m','1977-10-08',77,'2021-03-02 22:27:01','West Brookburgh'),(78,'m','1995-02-13',78,'1979-06-27 12:46:46','East Gilbertview'),(79,'m','2000-08-05',79,'1991-07-09 22:57:27','New Sebastianfurt'),(80,'m','2011-11-27',80,'1992-01-05 21:51:24','Russelmouth'),(81,'m','1981-08-11',81,'1989-10-03 16:34:10','Lake Margarettshire'),(82,'m','2012-03-19',82,'1985-07-31 00:50:07','New Maudie'),(83,'f','1989-03-02',83,'2000-03-12 04:16:12','Baileemouth'),(84,'m','2005-01-10',84,'2017-06-19 02:03:48','Port Haroldborough'),(85,'m','1994-02-11',85,'2009-06-23 23:18:17','East Yesseniaberg'),(86,'m','2008-07-03',86,'1995-12-14 06:25:06','South Andreanne'),(87,'m','2009-02-18',87,'2008-02-18 09:35:29','Lawsonfurt'),(88,'f','2007-11-19',88,'2015-10-30 18:01:33','Port Mafalda'),(89,'f','2019-08-07',89,'1972-01-14 02:52:58','Port Leramouth'),(90,'f','2011-12-08',90,'1980-04-03 21:01:18','Brakusstad'),(91,'m','1998-08-08',91,'1972-04-06 08:10:50','South Haven'),(92,'m','2015-07-24',92,'1988-09-23 07:25:54','South Sheila'),(93,'m','2013-07-31',93,'1998-10-11 10:35:03','East Casimirberg'),(94,'m','2003-05-04',94,'1985-02-01 20:18:40','North Benton'),(95,'f','2004-08-29',95,'2021-01-17 19:08:45','West Vanessa'),(96,'m','1982-05-27',96,'1998-09-27 06:12:53','Hayesfort'),(97,'f','1989-10-26',97,'2005-12-11 00:30:51','Veummouth'),(98,'f','2003-12-12',98,'1988-08-13 22:39:26','South Maximilliaborough'),(99,'f','2003-01-22',99,'1982-05-11 22:31:44','West Maurinemouth'),(100,'m','1979-02-01',100,'1971-05-17 07:53:01','South Juliet');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Leonard','Hermiston','qgleason@example.net','eb081abc83c262b4411020ee07a9bdd9fafb0924',87721913540),(2,'Eden','Brekke','marian15@example.org','eac228fd95c68c6d95f7981eb7fb38e0e2045aed',86386308521),(3,'Orlo','Sawayn','pierce.renner@example.org','c72e80bd173188cd0f3bdc65edec8d221fe124a3',84620826789),(4,'Cameron','Haley','sabshire@example.net','f9d594addd36352ef864b905c91c659a922cb29c',82291731433),(5,'Elian','Keebler','hailey.corwin@example.net','5b6d37af486f37e5de2a1c6fd3d9af6edae0e4dd',84170943624),(6,'Julian','Parisian','dereck25@example.net','71a0f09183666d6bd2f3c0eb267e1e8024a3a910',80893031298),(7,'Price','Stracke','zkilback@example.com','3e2e8b91d20c94d094c5c2f6e595599a6cc55006',88612788761),(8,'Dallin','Leffler','reid55@example.org','f713074c8b4e5cfd6a5ec76ffdd7c32d7f5b288f',87421840699),(9,'Elvera','Dickinson','flatley.jessica@example.net','459837887deb90ca9ff2896ac48e4fc8af5d504c',82239260212),(10,'Christy','Roberts','elva.sporer@example.org','2291a879ebc38df83fda0698731e2f556b93f336',81814370336),(11,'Georgette','Romaguera','adolphus.kuhn@example.net','edd8c23ded9de99571f4c1bc7408ed1b61307c51',81503933710),(12,'Cornell','Kshlerin','rreichert@example.net','e44f419584492733e781dd3831159d59f6da984f',80798171008),(13,'Karlie','Batz','judge.wolf@example.org','f879a282094f2fb8f457087bb5a98ab7dfb4a48d',88523546871),(14,'Breana','Shanahan','garett65@example.net','eebb177c70857e3e049fc6d46d980d5ce7afed41',89820574983),(15,'Otis','Carroll','ogleichner@example.org','cd5daced910e746c44cf24a1adb0723f6fce7641',86119022988),(16,'Abigail','Gibson','pmcglynn@example.net','49fd85fad79d7eb2abb31c9d8397e3869250d85d',83470691628),(17,'Idell','Pfeffer','erika13@example.org','8f3860ff02e591f0c915d424e85b92fe2b916251',80030805268),(18,'Olga','Sipes','carolina.considine@example.com','121106737933d2bad2021884fd299d4fe0d0e638',83016296904),(19,'Maggie','McDermott','ulises.balistreri@example.net','d68b2596ccccb43ceb43b97294bf5f10dbff6972',80511178993),(20,'Mazie','Christiansen','mckenzie00@example.org','ba9ffc6d4cd7e6f54475df0d97dcd2b38779caae',88281623744),(21,'Magali','Miller','torphy.shaina@example.net','ac66f538d77f4cdfe1491c0fcf690d27a3c57c98',81249109301),(22,'Jarred','Russel','raynor.casimer@example.com','dfeddae8cfab6e6a5a1eea95a49f8748d59b784a',85568343359),(23,'Mose','Little','leanne.hayes@example.com','1370bdd3a332df4ed2dcc0d87fbb2f2ddd8bd1a5',86033034618),(24,'Sister','Wilkinson','jacobson.emma@example.com','e0c1316306d589d917f9d30a2bcb5cf223327a82',83671281104),(25,'Mitchell','Mann','jenkins.else@example.net','55b548febbbf1aba24077e26a9ee9a674878197f',83762715784),(26,'Thora','Williamson','wmckenzie@example.org','e54382eff03fbc9e853820a638f24c44e6b4e1aa',81594878141),(27,'Maiya','Kling','littel.krista@example.com','8625d36fa12cbfcc2600b0639f1d35fab8d03f74',81773711764),(28,'Chloe','Lueilwitz','lmetz@example.com','f37f539c85ec0ccfb9aab6a8a6347b41f2f7d306',81096903458),(29,'Karina','Williamson','antone.homenick@example.net','bc70d1c26253b3fb3d85d98565cee2cf5e40db91',85868748864),(30,'Aglae','Anderson','marlen63@example.org','fa8c8a33982114a08f04e35d799f0cce33ca0687',82514983625),(31,'Angela','Hermann','bortiz@example.org','2e34fa7a998a7c4cf83666dbe11854d0675aa7a0',89209139039),(32,'Rowland','Boyle','melyna02@example.com','86c53f37e22478f8fdb514808b91c4fcecc71c11',80933367135),(33,'Trenton','Stiedemann','mueller.tad@example.net','59f5e032f2f451288cf567d98f40d3eb0724cc5f',87855962770),(34,'Nina','Bogan','sydnee86@example.com','71ad7e03556655425593bbc1579278f7654f270e',86810844712),(35,'Abel','Dicki','melvina37@example.net','f4bd0e55096a026d3b718e98dd54d3f2fdc4d33f',83830038649),(36,'Rylee','Schuster','viola.bednar@example.org','c3cc6c19c547a266a1af7426a6147378bbad62a9',85365768042),(37,'Garth','Kilback','terence.reynolds@example.org','5e9271db20c39cca25cb97915756f396d3f4b7d0',85791715085),(38,'Reece','Cummerata','hdenesik@example.com','a354c799d21baa1390b04134e2223d014bedd116',81735211540),(39,'Ebony','Bernier','lauriane75@example.net','74d2d08693f9c92b1886f67e11fed564e1bc9011',82891695122),(40,'Vena','Grant','leannon.dean@example.org','a17837dba5996cdb19993412977416a0e9650cb6',87905495860),(41,'Freeda','Bruen','boehm.dusty@example.net','624bfdbf7470876ace5da54190dff99fc8789543',83361139288),(42,'Millie','Roob','gussie96@example.org','5ff9514ff3b0f517143a5ae68b88d0a6e4f57534',83881612443),(43,'Clementina','Howe','deckow.ryley@example.org','c46accaba72709769cdec41345127823b6e66c20',82234372533),(44,'Jada','Legros','hpowlowski@example.com','47e604f86a0076913a46b3ca70ed9b713dd8a286',80933830235),(45,'Dianna','McClure','jenifer.turner@example.org','fa7c91b24771a2e357a71ccab8c7ac51a5031015',81163435666),(46,'Yvonne','Kutch','daniella.hane@example.com','c27f6f6932b867205858f5a3656811b8f6020d16',84240248808),(47,'Joannie','Abbott','rmiller@example.org','40736f363ba8ce5ff30e6a0972501b7664ae93d7',87598509243),(48,'Wilburn','Little','imogene22@example.org','cd57ef8c721e1edc38412e0646f6e0ef361c3bcb',86482692370),(49,'Freeda','Gaylord','jwilkinson@example.com','6c586204a026f585cd6d0628147ea49de59ca04b',85645263642),(50,'Leonel','Reilly','verlie86@example.net','02adaac3e2360a6676dc7bfc193a20749890a61e',86545114852),(51,'Javonte','Barton','maggio.roosevelt@example.net','b872ccbd22464019d45628a556222fab084e15dc',84991194237),(52,'Joanne','Bernhard','herman.casper@example.org','f9458684b98bbc1cba5a4ac6bec3a40545f8bbe3',80820257049),(53,'Harvey','Dach','misael.bahringer@example.net','2260f7019e1b397bcc4eda367ad0f89c25873d5e',81586820785),(54,'Muhammad','Ritchie','theresa13@example.net','133a0c67616b3b9782a928dcffb8d6dd4e42b044',85641788053),(55,'Fannie','Quitzon','aschumm@example.com','3f09d2c352c47d01fa71b5bbab465d421bfa6b8f',81263967566),(56,'Matteo','Kirlin','caufderhar@example.net','c1d066bac04fefaec574031568f33bc4ec1646fc',88223814368),(57,'Mabelle','Boehm','joel88@example.com','81eca9f7fa2940f104c0adebf2c2d8b6817408e4',89857177878),(58,'Emmy','Kohler','stevie.jast@example.net','9d152384eddc25efd155eab4ecee22249b885561',80442975843),(59,'Cullen','Pouros','casandra30@example.com','5ee03adb4ecbc2f8caa336757b64c76a98c29b83',81647279304),(60,'Arielle','Cole','rwilderman@example.org','448e70c4a55cd608057fdbc59d49c86267be26af',86195260193),(61,'Gennaro','Emmerich','renee.sanford@example.org','54eacc9e4d9a381abdd4475477b143fda9679cdb',88616778021),(62,'Lafayette','Ondricka','sidney70@example.org','7da54c249eb3e3cdbcb5e6db81cce3dbabb66c5d',82295453920),(63,'Rosanna','Rowe','kiel27@example.org','5e94496fd3fb4e302f239e4825287753eae0f4df',88684274130),(64,'Darian','Cormier','romaguera.darwin@example.net','ee5a33b6c484404c7fe0016d212ca4db55694055',80059918654),(65,'Madisen','Reichert','susan.schmidt@example.net','df64465a1511874502460535edd0ce44648ba368',87080721789),(66,'Raphaelle','Quitzon','gracie62@example.org','5092ef56e2b0ab5dd3b4de0e024c63023df586cb',83019561734),(67,'Joe','Conn','cdeckow@example.com','00bcc0e468b0252665d6c67427008d91161b50ad',87079485999),(68,'Carter','Jerde','dpowlowski@example.net','041cade658fe4bc5cd81b4c33f09134876d7efef',82778085358),(69,'Cristian','Gleason','xbergstrom@example.net','826b2bf3a45816c6daed7e6b97adbbc926187a6b',83407118367),(70,'Carrie','Goyette','nia.okuneva@example.org','6f9b3837a3dfd744cb7d46fa7cb03eed69957a0a',84214622452),(71,'Sandy','Jacobson','omedhurst@example.com','074e60d5462a9ea24c4e4112bb7f1d5c518f0143',80737917353),(72,'Mariano','Corwin','doris.lubowitz@example.org','9f0b81898c2b95ea4291efc5356a9dde7b7967ea',81654314352),(73,'Levi','Franecki','schaden.stephanie@example.com','01a5a07fcf14983ea4c56f67609f84584f0c092c',88600353379),(74,'Orin','Adams','bode.leonor@example.org','161a79dc6b7dcbd601c27849a58bd2f5dbae832d',86985700572),(75,'Aurore','Rempel','charlene.gottlieb@example.org','76e305da92f8e87cc7a1605e03dc329374519f7c',87379318089),(76,'Nova','Cremin','dkeeling@example.com','ca52bcca8825b2cbb927c239482612a9a4521860',85575736807),(77,'Dax','Labadie','lgoodwin@example.com','21f12c06142cfaf16b953bf07cda57c46c2fe37b',80459460550),(78,'Jerrod','Yundt','flangosh@example.org','9ef88afbe096c8522e42a5bf9da417ab8463e7c4',85890668905),(79,'Drake','Wehner','qhilpert@example.org','71fff294b739db9faca5883b48a1d13c791b61ee',81226701033),(80,'Adela','Stroman','xkessler@example.com','8903c3cd58f46453e110755af9215e24d892bb04',83380576684),(81,'Gregg','Hauck','elta04@example.com','19aeb0062d91f4545f6570ae18e995bc4d6f4f42',88652599561),(82,'Maybelle','Nitzsche','frowe@example.net','5f86601b9625f8a73329dbd8731e273dbdda7240',89563819742),(83,'Isabel','Gusikowski','jolie.gislason@example.net','d43ebce6eb75c92f475e6e9ea128f238016fae1d',87766844099),(84,'Vivianne','Towne','darby.krajcik@example.org','0e574a1ebcf10d1c9fa89d40848615d37e0f531b',87439381643),(85,'Alicia','Schamberger','greenholt.lia@example.net','011fbe2e8b302641fd8394722f27000a1f582067',89521692688),(86,'Annabel','Schaefer','lockman.reinhold@example.org','61c7077b6b26a75c9cf17937300a9dbe26a23b8b',82789459689),(87,'Tristin','Marvin','bdaniel@example.net','dd4e37683d4c025aba1e02aa39597cd1e02665fc',80919735692),(88,'Roger','Breitenberg','rosalind.pollich@example.net','e7807c9f0d71acb3e43d0e2597961350cf0a3566',88632061867),(89,'Marilie','Dicki','ashley21@example.org','b9dd3027edfd6d4480b9e63b4f292be541ac2b30',81501491819),(90,'Kaden','O\'Hara','reinger.aurelia@example.org','6ebf309c325c89bd1b2e58b3b946b452ab0e9c50',86026200973),(91,'Maymie','Hudson','lizeth30@example.com','f0946e12b9fc67c4eea6161ab8c7da936c24e235',88532943474),(92,'Brooks','Cummings','kilback.colton@example.org','674b74e14ac652448aed15026195cc5f3dba529f',89706736789),(93,'Reymundo','Beatty','lemke.rossie@example.org','fae61deb26021212166ba4b6c1dc7e93ab6df46f',84136163955),(94,'Cassidy','Orn','jennyfer.collier@example.org','767ddf1bfda374e1ff52cee756db97fe056ae771',83510394757),(95,'Opal','Smitham','alarson@example.org','a2c44ebfcca2c16fdbf008d4065131fd5072f177',88831397974),(96,'Wilma','Legros','ulittle@example.org','1785ca002424b8e676dd8f3cdcf263b8f9844ee8',87141255880),(97,'Clementine','Nader','emilia61@example.org','9eef067830ef16e9e7afe1dfac76bec92370fcad',88463701126),(98,'Karli','Hahn','boyer.elinor@example.net','d34e807d975d02962f04016221f425d814c61c75',81897559072),(99,'Sheridan','Lebsack','ethyl91@example.com','6bfb3ded386ed546acf79efb56cf1d3e0779fbcb',80315282531),(100,'Scot','O\'Kon','cayla85@example.net','dbfdea5ab58885efb5c358d79c1f37c36383892b',84378560828);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

ALTER TABLE vk.likes 
ADD CONSTRAINT likes_fk 
FOREIGN KEY (media_id) REFERENCES vk.media(id);

ALTER TABLE vk.likes 
ADD CONSTRAINT likes_fk_1 
FOREIGN KEY (user_id) REFERENCES vk.users(id);

ALTER TABLE vk.profiles 
ADD CONSTRAINT profiles_fk_1 
FOREIGN KEY (photo_id) REFERENCES media(id);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-16 16:33:57
