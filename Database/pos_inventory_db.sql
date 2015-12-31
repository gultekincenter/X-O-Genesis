-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pos_inventory_db
-- ------------------------------------------------------
-- Server version	5.7.6-m16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_trail_tbl`
--

DROP TABLE IF EXISTS `audit_trail_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_trail_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `activity` longtext,
  `date` date DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_employee_fk_idx` (`employee_id`),
  KEY `audit_receipt_fk_idx` (`receipt_id`),
  CONSTRAINT `audit_employee_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `audit_receipt_fk` FOREIGN KEY (`receipt_id`) REFERENCES `receipt_tbl` (`invoice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail_tbl`
--

LOCK TABLES `audit_trail_tbl` WRITE;
/*!40000 ALTER TABLE `audit_trail_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_trail_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bestsellers`
--

DROP TABLE IF EXISTS `bestsellers`;
/*!50001 DROP VIEW IF EXISTS `bestsellers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `bestsellers` (
  `Name` tinyint NOT NULL,
  `Item_Sold` tinyint NOT NULL,
  `Percent_Share` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category_tbl`
--

DROP TABLE IF EXISTS `category_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_tbl`
--

LOCK TABLES `category_tbl` WRITE;
/*!40000 ALTER TABLE `category_tbl` DISABLE KEYS */;
INSERT INTO `category_tbl` VALUES (1,'Camera'),(2,'CCTV'),(3,'Paper Laptop'),(4,'Flapper');
/*!40000 ALTER TABLE `category_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_tbl`
--

DROP TABLE IF EXISTS `customer_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `telephone_number` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tbl`
--

LOCK TABLES `customer_tbl` WRITE;
/*!40000 ALTER TABLE `customer_tbl` DISABLE KEYS */;
INSERT INTO `customer_tbl` VALUES (1,'jdklfjskl','jfdlkf;','jfdklj','fdjklfjf','fdjklfjf','jfdlskfjsld','dlkfjlds ljflafldj'),(2,'','','','','','',' '),(3,'Raineir Rabi','Ramirez','Abordo','AshleyLoves','09192223456','ashleybabes@gmail.com','Sa puso ni Ashley Sa puso ni Ashley'),(4,'Christopher John','Amper','Ponce','09194441782','09194441782','amorphyst@gmail.com','83 Magsaysay St. Doña Faustina Subd. San Bartolome Novaliches, Quezon City'),(5,'Christopher John','Amper','Ponce','09194441782','09194441782','amorphyst@gmail.com','83 Magsaysay St. Doña Faustina Subd. San Bartolome Novaliches Quezon City'),(6,'Carla Jean','Aragon','Acta','09233005665','09233005665','carlajeanacta@gmail.com','17 Israel Street, Jordan Heights Subd. Novaliches, Q.C. Metro Manila'),(7,'Randy','Cinco','Panol','09264142434','09264142434','decafmind@gmail.com','G44 Abbey Road Bagbag Novaliches Quezon City');
/*!40000 ALTER TABLE `customer_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `daily_sales_report`
--

DROP TABLE IF EXISTS `daily_sales_report`;
/*!50001 DROP VIEW IF EXISTS `daily_sales_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `daily_sales_report` (
  `Date` tinyint NOT NULL,
  `Sales` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee_tbl`
--

DROP TABLE IF EXISTS `employee_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) NOT NULL,
  `mobile_no` varchar(45) DEFAULT NULL,
  `telephone_no` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `image_path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_user_fk_idx` (`user_id`),
  CONSTRAINT `employee_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tbl`
--

LOCK TABLES `employee_tbl` WRITE;
/*!40000 ALTER TABLE `employee_tbl` DISABLE KEYS */;
INSERT INTO `employee_tbl` VALUES (1,'Randy','Randy','C','Panol','09264142434','09264142434','akira@google.com','G44 Abbey Road Bagbag Novaliches Quezon City','C:\\\\Petvet\\Images\\754282.jpg'),(2,'Francis','Francis','X','Caceres','0933764751','t','akira@google.com','jdlfkj','C:\\\\Petvet\\Images\\233469.jpg'),(3,'Jerwin','Jerwin','V','Alog','093276278','t','akira@google.com','fjlskdfjl','C:\\\\Petvet\\Images\\334903.jpg'),(4,'Rabi','Rainier','A','Abordo','8490384038403','232-434-23','jessea@m.com','dfjldk','C:\\\\Petvet\\Images\\83110.jpg'),(5,'Karen','Karen','F','Paje','0923263746232','3287328372897','kp@gmail.com','jflskj',''),(6,'jessea','Jessea','R','Malanao','09356080445','232-434-23','jessea@m.com','Dito','C:\\\\Petvet\\Images\\937495.jpg');
/*!40000 ALTER TABLE `employee_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fraud`
--

DROP TABLE IF EXISTS `fraud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fraud` (
  `Productno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Productname` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`Productno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraud`
--

LOCK TABLES `fraud` WRITE;
/*!40000 ALTER TABLE `fraud` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_tbl`
--

DROP TABLE IF EXISTS `inventory_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(20) DEFAULT NULL,
  `stockin_datetime` datetime DEFAULT NULL,
  `qty_received` int(11) DEFAULT NULL,
  `qty_onhand` int(11) DEFAULT NULL,
  `supplier` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_product_tbl_idx` (`product_id`),
  CONSTRAINT `inventory_product_tbl` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_tbl`
--

LOCK TABLES `inventory_tbl` WRITE;
/*!40000 ALTER TABLE `inventory_tbl` DISABLE KEYS */;
INSERT INTO `inventory_tbl` VALUES (1,'SWGB1D1015M09','2015-10-15 15:29:45',100,100,NULL),(2,'SWGB1D1015M09','2015-10-15 15:31:12',100,100,NULL),(3,'CTVB1D1015M00','2015-10-15 15:31:50',100,100,NULL),(4,'CTVB1D1015M00',NULL,NULL,-50,NULL),(5,'CTVB1D1015M00',NULL,NULL,-1,NULL),(6,'CTVB1D1015M00',NULL,NULL,-1,NULL),(7,'CTVB1D1015M00','2015-10-15 18:43:43',100,100,NULL),(8,'ACCB1D1015M30','2015-10-15 18:45:46',100,100,NULL),(9,'ACCB1D1015M30',NULL,NULL,-100,NULL),(10,'SWGB1D1015M09',NULL,NULL,-7,NULL),(11,'CTVB1D1015M00',NULL,NULL,-2,NULL),(12,'CTVB1D1015M00',NULL,NULL,-50,NULL);
/*!40000 ALTER TABLE `inventory_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `inventory_view`
--

DROP TABLE IF EXISTS `inventory_view`;
/*!50001 DROP VIEW IF EXISTS `inventory_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `inventory_view` (
  `Name` tinyint NOT NULL,
  `Barcode` tinyint NOT NULL,
  `Unit_price` tinyint NOT NULL,
  `Category` tinyint NOT NULL,
  `Stock_since` tinyint NOT NULL,
  `Supplier` tinyint NOT NULL,
  `Qty_Received` tinyint NOT NULL,
  `Qty_On_Hand` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoice_tbl`
--

DROP TABLE IF EXISTS `invoice_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `employee_id` varchar(45) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_employee_fk_idx` (`employee_id`),
  KEY `invoice_customer_fk_idx` (`customer_id`),
  CONSTRAINT `invoice_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_tbl`
--

LOCK TABLES `invoice_tbl` WRITE;
/*!40000 ALTER TABLE `invoice_tbl` DISABLE KEYS */;
INSERT INTO `invoice_tbl` VALUES (1,'2015-10-15','15:32:05','Randy',NULL),(2,'2015-10-15','15:33:10','Randy',NULL),(3,'2015-10-15','15:33:17','Karen',NULL),(4,'2015-10-15','15:33:32','Karen',NULL),(5,'2015-10-15','16:00:09','Randy',NULL),(6,'2015-10-15','16:00:22','Randy',NULL),(7,'2015-10-15','16:01:06','Karen',NULL),(8,'2015-10-15','16:01:15','Karen',NULL),(9,'2015-10-15','16:10:50','Karen',NULL),(10,'2015-10-15','16:11:24','Karen',NULL),(11,'2015-10-15','16:13:43','Karen',NULL),(12,'2015-10-15','16:16:24','Karen',NULL),(13,'2015-10-15','16:18:43','Randy',NULL),(14,'2015-10-15','16:18:58','Randy',NULL),(15,'2015-10-15','16:19:17','Randy',NULL),(16,'2015-10-15','16:19:31','Randy',NULL),(17,'2015-10-15','16:19:47','Karen',NULL),(18,'2015-10-15','16:19:56','Karen',NULL),(19,'2015-10-15','16:21:21','Randy',NULL),(20,'2015-10-15','16:22:28','Randy',NULL),(21,'2015-10-15','16:23:12','Randy',NULL),(22,'2015-10-15','16:25:56','Karen',NULL),(23,'2015-10-15','16:26:05','Randy',NULL),(24,'2015-10-15','16:27:38','Randy',NULL),(25,'2015-10-15','16:32:49','Randy',NULL),(26,'2015-10-15','16:35:14','Randy',NULL),(27,'2015-10-15','16:35:25','Randy',NULL),(28,'2015-10-15','18:56:54','Randy',NULL),(29,'2015-10-15','19:16:44','Karen',NULL),(30,'2015-10-15','19:18:51','Karen',NULL),(31,'2015-10-29','09:48:49','Francis',NULL),(32,'2015-10-29','09:50:49','Francis',NULL),(33,'2015-10-29','09:53:08','Karen',NULL),(34,'2015-10-29','09:54:10','Karen',NULL);
/*!40000 ALTER TABLE `invoice_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_trail_tbl`
--

DROP TABLE IF EXISTS `login_trail_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_trail_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `datetime_in` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_out` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `login_employee_fk_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_trail_tbl`
--

LOCK TABLES `login_trail_tbl` WRITE;
/*!40000 ALTER TABLE `login_trail_tbl` DISABLE KEYS */;
INSERT INTO `login_trail_tbl` VALUES (1,'Jerwin','2015-10-09 01:34:54','2015-10-09 01:35:11'),(2,'Randy','2015-10-09 01:35:42','2015-10-09 01:35:42'),(3,'Randy','2015-10-09 01:36:53','2015-10-09 01:36:53'),(4,'Jerwin','2015-10-09 01:37:45','2015-10-09 01:37:49'),(5,'','2015-10-09 01:37:55','2015-10-09 01:40:37'),(6,'Randy','2015-10-09 01:42:51','2015-10-09 01:42:51'),(7,'','2015-10-09 01:43:24','2015-10-09 01:43:24'),(8,'Randy','2015-10-09 01:45:09','2015-10-09 01:45:09'),(9,'Randy','2015-10-09 01:46:23','2015-10-09 01:46:23'),(10,'Randy','2015-10-09 01:50:08','2015-10-09 01:50:08'),(11,'Randy','2015-10-09 01:52:10','2015-10-09 01:52:10'),(12,'Jerwin','2015-10-09 01:58:36','2015-10-09 01:58:39'),(13,'','2015-10-09 01:58:42','2015-10-09 01:58:42'),(14,'Randy','2015-10-09 01:58:43','2015-10-09 01:58:43'),(15,'','2015-10-09 01:59:38','2015-10-09 01:59:38'),(16,'','2015-10-09 02:02:09','2015-10-09 02:02:09'),(17,'Randy','2015-10-09 02:04:43','2015-10-09 02:04:43'),(18,'','2015-10-09 02:04:49','2015-10-09 02:04:50'),(19,'Jerwin','2015-10-09 02:04:57','2015-10-09 02:05:00'),(20,'','2015-10-09 02:05:08','2015-10-09 02:06:37'),(21,'Jerwin','2015-10-09 02:07:31','2015-10-09 02:07:39'),(22,'','2015-10-09 02:07:47','2015-10-09 02:08:09'),(23,'Karen','2015-10-09 02:08:57','2015-10-09 02:09:39'),(24,'Jerwin','2015-10-09 02:09:45','2015-10-09 02:09:45'),(25,'Randy','2015-10-09 02:11:30','2015-10-09 02:11:30'),(26,'Randy','2015-10-09 02:12:03','2015-10-09 02:12:03'),(27,'Randy','2015-10-09 02:12:33','2015-10-09 02:12:33'),(28,'Randy','2015-10-09 02:14:33','2015-10-09 02:14:33'),(29,'Randy','2015-10-09 02:15:01','2015-10-09 02:15:01'),(30,'Jerwin','2015-10-09 02:15:46','2015-10-09 02:15:46'),(31,'Randy','2015-10-09 02:17:28','2015-10-09 02:17:28'),(32,'Jerwin','2015-10-09 02:19:27','2015-10-09 02:19:27'),(33,'Jerwin','2015-10-09 02:27:35','2015-10-09 02:27:35'),(34,'Jerwin','2015-10-09 02:28:50','2015-10-09 02:28:50'),(35,'Jerwin','2015-10-09 02:34:06','2015-10-09 02:34:06'),(36,'Jerwin','2015-10-09 02:36:25','2015-10-09 02:36:25'),(37,'Jerwin','2015-10-09 02:40:31','2015-10-09 02:41:19'),(38,'Jerwin','2015-10-09 02:41:45','2015-10-09 02:42:41'),(39,'Jerwin','2015-10-09 02:44:28','2015-10-09 02:44:28'),(40,'Jerwin','2015-10-09 02:45:12','2015-10-09 02:45:52'),(41,'Jerwin','2015-10-09 02:46:58','2015-10-09 02:50:44'),(42,'Randy','2015-10-09 08:48:15','2015-10-09 08:48:16'),(43,'Randy','2015-10-09 19:04:02','2015-10-09 19:05:28'),(44,'Randy','2015-10-09 19:19:55','2015-10-09 19:20:06'),(45,'Randy','2015-10-09 19:20:41','2015-10-09 19:21:49'),(46,'Randy','2015-10-09 19:44:21','2015-10-09 19:45:31'),(47,'Randy','2015-10-09 19:53:16','2015-10-09 19:53:29'),(48,'Randy','2015-10-10 20:43:34','2015-10-10 20:47:12'),(49,'Randy','2015-10-10 20:48:27','2015-10-10 20:48:40'),(50,'Randy','2015-10-10 20:49:51','2015-10-10 20:50:54'),(51,'Randy','2015-10-10 20:51:40','2015-10-10 20:51:40'),(52,'Randy','2015-10-10 20:55:58','2015-10-10 20:55:58'),(53,'Karen','2015-10-10 21:01:24','2015-10-10 21:02:39'),(54,'Karen','2015-10-10 21:03:03','2015-10-10 21:03:56'),(55,'Randy','2015-10-10 21:16:29','2015-10-10 21:16:35'),(56,'Karen','2015-10-10 21:16:41','2015-10-10 21:17:14'),(57,'Randy','2015-10-10 21:17:26','2015-10-10 21:17:52'),(58,'Randy','2015-10-10 21:18:27','2015-10-10 21:19:44'),(59,'Randy','2015-10-10 21:24:20','2015-10-10 21:25:12'),(60,'Randy','2015-10-10 21:32:36','2015-10-10 21:33:12'),(61,'Randy','2015-10-10 21:34:40','2015-10-10 21:35:03'),(62,'Randy','2015-10-10 21:36:12','2015-10-10 21:37:23'),(63,'Randy','2015-10-10 21:43:16','2015-10-10 21:44:11'),(64,'Randy','2015-10-10 21:44:38','2015-10-10 21:44:49'),(65,'Randy','2015-10-11 09:46:30','2015-10-11 09:46:33'),(66,'Randy','2015-10-11 09:55:17','2015-10-11 09:56:22'),(67,'Randy','2015-10-11 10:01:02','2015-10-11 10:03:42'),(68,'Randy','2015-10-11 10:04:41','2015-10-11 10:06:11'),(69,'Randy','2015-10-11 10:09:57','2015-10-11 10:10:12'),(70,'Randy','2015-10-13 22:12:27','2015-10-13 22:12:37'),(71,'Randy','2015-10-13 22:16:15','2015-10-13 22:16:23'),(72,'Randy','2015-10-13 22:20:45','2015-10-13 22:20:52'),(73,'Randy','2015-10-13 22:22:38','2015-10-13 22:22:44'),(74,'Randy','2015-10-13 22:24:02','2015-10-13 22:24:02'),(75,'Randy','2015-10-13 22:24:45','2015-10-13 22:25:09'),(76,'Randy','2015-10-13 22:26:05','2015-10-13 22:26:10'),(77,'Randy','2015-10-13 22:27:15','2015-10-13 22:27:32'),(78,'Randy','2015-10-13 22:28:02','2015-10-13 22:28:07'),(79,'','2015-10-13 22:32:41','2015-10-13 22:32:48'),(80,'Randy','2015-10-13 22:42:05','2015-10-13 22:42:12'),(81,'Randy','2015-10-13 22:49:03','2015-10-13 22:50:53'),(82,'Randy','2015-10-13 22:56:24','2015-10-13 22:57:47'),(83,'Randy','2015-10-13 23:04:45','2015-10-13 23:05:04'),(84,'Randy','2015-10-13 23:06:25','2015-10-13 23:06:34'),(85,'Randy','2015-10-13 23:08:09','2015-10-13 23:08:16'),(86,'Randy','2015-10-13 23:09:05','2015-10-13 23:09:19'),(87,'Randy','2015-10-13 23:13:03','2015-10-13 23:13:22'),(88,'Randy','2015-10-13 23:13:59','2015-10-13 23:15:18'),(89,'Randy','2015-10-13 23:59:45','2015-10-13 23:59:55'),(90,'Randy','2015-10-14 00:00:09','2015-10-14 00:00:22'),(91,'Randy','2015-10-14 00:18:58','2015-10-14 00:19:25'),(92,'Randy','2015-10-14 00:36:37','2015-10-14 00:36:37'),(93,'Randy','2015-10-14 00:49:12','2015-10-14 00:49:12'),(94,'Randy','2015-10-14 00:51:12','2015-10-14 00:51:12'),(95,'Randy','2015-10-14 00:56:55','2015-10-14 00:56:55'),(96,'Randy','2015-10-14 01:01:35','2015-10-14 01:01:54'),(97,'Randy','2015-10-14 01:11:40','2015-10-14 01:11:51'),(98,'Jerwin','2015-10-14 01:12:01','2015-10-14 01:13:10'),(99,'Randy','2015-10-14 01:14:08','2015-10-14 01:15:10'),(100,'Randy','2015-10-14 01:16:27','2015-10-14 01:16:27'),(101,'Randy','2015-10-14 01:17:45','2015-10-14 01:17:45'),(102,'Randy','2015-10-14 01:30:07','2015-10-14 01:30:07'),(103,'Randy','2015-10-14 01:34:16','2015-10-14 01:35:44'),(104,'Jerwin','2015-10-14 01:37:19','2015-10-14 01:38:11'),(105,'Randy','2015-10-14 16:48:06','2015-10-14 16:48:45'),(106,'Randy','2015-10-14 17:06:25','2015-10-14 17:06:27'),(107,'Randy','2015-10-14 18:11:15','2015-10-14 18:11:27'),(108,'Randy','2015-10-15 07:49:14','2015-10-15 07:49:14'),(109,'Randy','2015-10-15 07:50:45','2015-10-15 07:51:15'),(110,'Karen','2015-10-15 08:05:14','2015-10-15 08:05:17'),(111,'Karen','2015-10-15 08:07:49','2015-10-15 08:07:53'),(112,'Jerwin','2015-10-15 08:08:30','2015-10-15 08:08:39'),(113,'Jerwin','2015-10-15 08:10:55','2015-10-15 08:10:59'),(114,'Randy','2015-10-15 08:11:45','2015-10-15 08:11:45'),(115,'Randy','2015-10-15 08:25:23','2015-10-15 08:25:28'),(116,'Randy','2015-10-15 08:27:21','2015-10-15 08:27:26'),(117,'Randy','2015-10-15 08:28:21','2015-10-15 08:28:24'),(118,'Randy','2015-10-15 08:46:16','2015-10-15 08:47:25'),(119,'Randy','2015-10-15 08:47:36','2015-10-15 08:47:44'),(120,'Karen','2015-10-15 08:47:49','2015-10-15 08:49:22'),(121,'Jerwin','2015-10-15 08:50:04','2015-10-15 08:50:29'),(122,'Jerwin','2015-10-15 09:01:47','2015-10-15 09:01:47'),(123,'Karen','2015-10-15 09:05:53','2015-10-15 09:05:58'),(124,'Jerwin','2015-10-15 09:06:38','2015-10-15 09:06:38'),(125,'Jerwin','2015-10-15 09:09:55','2015-10-15 09:09:55'),(126,'Jerwin','2015-10-15 09:13:02','2015-10-15 09:13:02'),(127,'Jerwin','2015-10-15 09:15:59','2015-10-15 09:15:59'),(128,'Jerwin','2015-10-15 09:17:16','2015-10-15 09:17:16'),(129,'Jerwin','2015-10-15 09:21:14','2015-10-15 09:21:38'),(130,'Jerwin','2015-10-15 09:22:26','2015-10-15 09:24:21'),(131,'Jerwin','2015-10-15 09:26:28','2015-10-15 09:26:28'),(132,'Jerwin','2015-10-15 09:28:22','2015-10-15 09:28:55'),(133,'Jerwin','2015-10-15 09:30:27','2015-10-15 09:31:35'),(134,'Jerwin','2015-10-15 09:32:15','2015-10-15 09:32:15'),(135,'Jerwin','2015-10-15 09:34:11','2015-10-15 09:34:37'),(136,'Jerwin','2015-10-15 09:35:46','2015-10-15 09:36:06'),(137,'Jerwin','2015-10-15 09:37:06','2015-10-15 09:37:28'),(138,'Jerwin','2015-10-15 09:41:42','2015-10-15 09:41:53'),(139,'Jerwin','2015-10-15 09:42:30','2015-10-15 09:43:54'),(140,'Jerwin','2015-10-15 09:45:29','2015-10-15 09:45:50'),(141,'Jerwin','2015-10-15 09:46:24','2015-10-15 09:46:59'),(142,'Jerwin','2015-10-15 09:48:27','2015-10-15 09:48:27'),(143,'','2015-10-15 09:51:20','2015-10-15 09:51:21'),(144,'Jerwin','2015-10-15 09:51:45','2015-10-15 09:52:17'),(145,'Jerwin','2015-10-15 09:53:00','2015-10-15 09:53:27'),(146,'Jerwin','2015-10-15 09:54:49','2015-10-15 09:56:15'),(147,'Karen','2015-10-15 09:56:19','2015-10-15 09:56:30'),(148,'Jerwin','2015-10-15 09:56:37','2015-10-15 09:56:47'),(149,'Jerwin','2015-10-15 09:58:24','2015-10-15 09:58:45'),(150,'Jerwin','2015-10-15 09:59:54','2015-10-15 10:00:11'),(151,'Karen','2015-10-15 10:46:56','2015-10-15 10:48:23'),(152,'Jerwin','2015-10-15 10:48:29','2015-10-15 10:48:35'),(153,'Jerwin','2015-10-15 10:49:47','2015-10-15 10:50:04'),(154,'Karen','2015-10-15 10:50:09','2015-10-15 10:51:20'),(155,'Jerwin','2015-10-15 10:52:19','2015-10-15 10:53:48'),(156,'Randy','2015-10-15 10:53:52','2015-10-15 10:55:11'),(157,'Karen','2015-10-15 10:55:18','2015-10-15 10:55:18'),(158,'Karen','2015-10-15 10:59:48','2015-10-15 10:59:48'),(159,'Karen','2015-10-15 11:00:57','2015-10-15 11:00:57'),(160,'Karen','2015-10-15 11:03:33','2015-10-15 11:03:33'),(161,'Karen','2015-10-15 11:05:37','2015-10-15 11:05:37'),(162,'Karen','2015-10-15 11:07:04','2015-10-15 11:07:04'),(163,'Karen','2015-10-15 11:09:31','2015-10-15 11:09:31'),(164,'Karen','2015-10-15 11:12:24','2015-10-15 11:12:24'),(165,'Karen','2015-10-15 11:14:58','2015-10-15 11:14:58'),(166,'Karen','2015-10-15 11:17:45','2015-10-15 11:18:34'),(167,'Karen','2015-10-15 11:18:53','2015-10-15 11:19:13'),(168,'Karen','2015-10-15 11:21:04','2015-10-15 11:21:19'),(169,'Randy','2015-10-15 11:21:44','2015-10-15 11:22:24'),(170,'Karen','2015-10-15 11:35:16','2015-10-15 11:35:21'),(171,'Jerwin','2015-10-15 11:35:24','2015-10-15 11:37:49'),(172,'Jerwin','2015-10-15 11:40:03','2015-10-15 11:40:26'),(173,'Jerwin','2015-10-15 11:41:27','2015-10-15 11:42:59'),(174,'Randy','2015-10-15 11:43:09','2015-10-15 11:43:44'),(175,'Karen','2015-10-15 11:43:54','2015-10-15 11:46:02'),(176,'Karen','2015-10-15 11:46:07','2015-10-15 11:46:19'),(177,'Randy','2015-10-15 11:46:26','2015-10-15 11:47:47'),(178,'Karen','2015-10-15 11:47:55','2015-10-15 11:49:05'),(179,'Jerwin','2015-10-15 11:49:16','2015-10-15 11:49:27'),(180,'Jerwin','2015-10-15 11:50:25','2015-10-15 11:50:32'),(181,'Jerwin','2015-10-15 12:00:05','2015-10-15 12:00:05'),(182,'','2015-10-15 12:00:21','2015-10-15 12:00:52'),(183,'Randy','2015-10-15 12:01:07','2015-10-15 12:01:07'),(184,'Jerwin','2015-10-15 12:06:35','2015-10-15 12:06:38'),(185,'Karen','2015-10-15 12:06:48','2015-10-15 12:06:49'),(186,'Francis','2015-10-15 12:07:07','2015-10-15 12:11:24'),(187,'Karen','2015-10-15 12:12:20','2015-10-15 12:12:21'),(188,'Francis','2015-10-15 12:12:26','2015-10-15 12:12:26'),(189,'','2015-10-15 12:17:39','2015-10-15 12:17:41'),(190,'Karen','2015-10-15 12:17:57','2015-10-15 12:17:57'),(191,'Jerwin','2015-10-15 12:22:51','2015-10-15 12:22:51'),(192,'Jerwin','2015-10-15 12:23:04','2015-10-15 12:23:05'),(193,'Randy','2015-10-15 12:23:16','2015-10-15 12:23:16'),(194,'Francis','2015-10-15 12:24:56','2015-10-15 12:25:27'),(195,'Randy','2015-10-15 12:30:26','2015-10-15 12:31:20'),(196,'Randy','2015-10-15 12:31:26','2015-10-15 12:31:59'),(197,'Randy','2015-10-15 12:33:44','2015-10-15 12:33:44'),(198,'Karen','2015-10-15 12:35:18','2015-10-15 12:35:18'),(199,'Randy','2015-10-15 12:35:48','2015-10-15 12:35:48'),(200,'Francis','2015-10-15 12:35:48','2015-10-15 12:35:48'),(201,'Jerwin','2015-10-15 12:36:17','2015-10-15 12:36:17'),(202,'','2015-10-15 12:37:53','2015-10-15 12:37:54'),(203,'Randy','2015-10-15 12:37:58','2015-10-15 12:37:58'),(204,'Randy','2015-10-15 12:47:41','2015-10-15 12:47:41'),(205,'Jerwin','2015-10-15 12:48:27','2015-10-15 12:48:27'),(206,'Karen','2015-10-15 12:49:28','2015-10-15 13:00:12'),(207,'Rabi','2015-10-15 13:00:32','2015-10-15 13:06:53'),(208,'','2015-10-15 13:10:43','2015-10-15 13:10:54'),(209,'Karen','2015-10-15 13:11:01','2015-10-15 13:11:01'),(210,'','2015-10-15 13:14:33','2015-10-15 13:22:46'),(211,'','2015-10-15 13:30:54','2015-10-15 13:30:54'),(212,'Karen','2015-10-15 13:34:53','2015-10-15 13:34:53'),(213,'','2015-10-15 13:35:18','2015-10-15 13:40:56'),(214,'Jerwin','2015-10-15 13:51:03','2015-10-15 13:51:03'),(215,'','2015-10-15 14:00:20','2015-10-15 14:00:22'),(216,'Karen','2015-10-15 14:01:32','2015-10-15 14:01:32'),(217,'Karen','2015-10-15 14:08:54','2015-10-15 14:11:31'),(218,'Karen','2015-10-15 14:12:08','2015-10-15 14:12:18'),(219,'Randy','2015-10-15 14:12:44','2015-10-15 14:14:39'),(220,'Jerwin','2015-10-15 14:14:43','2015-10-15 14:16:37'),(221,'Randy','2015-10-15 14:16:41','2015-10-15 14:22:53'),(222,'Randy','2015-10-15 14:29:12','2015-10-15 14:33:31'),(223,'Karen','2015-10-15 14:33:40','2015-10-15 14:34:15'),(224,'Randy','2015-10-15 14:34:22','2015-10-15 14:35:47'),(225,'Jerwin','2015-10-15 14:36:27','2015-10-15 14:36:27'),(226,'Randy','2015-10-15 14:44:33','2015-10-15 14:46:02'),(227,'Randy','2015-10-15 14:47:52','2015-10-15 14:48:26'),(228,'Randy','2015-10-15 14:52:35','2015-10-15 14:53:26'),(229,'Randy','2015-10-15 14:55:26','2015-10-15 14:55:26'),(230,'Karen','2015-10-15 15:00:02','2015-10-15 15:00:06'),(231,'Randy','2015-10-15 15:01:45','2015-10-15 15:03:06'),(232,'Randy','2015-10-15 15:04:59','2015-10-15 15:06:01'),(233,'Jerwin','2015-10-15 15:14:32','2015-10-15 15:16:06'),(234,'Randy','2015-10-15 15:16:09','2015-10-15 15:17:04'),(235,'Jerwin','2015-10-15 15:18:25','2015-10-15 15:18:52'),(236,'Jerwin','2015-10-15 15:18:57','2015-10-15 15:18:57'),(237,'Jerwin','2015-10-15 15:22:59','2015-10-15 15:24:07'),(238,'Rabi','2015-10-15 15:24:36','2015-10-15 15:25:06'),(239,'Jerwin','2015-10-15 15:25:47','2015-10-15 15:26:09'),(240,'Jerwin','2015-10-15 15:26:36','2015-10-15 15:26:46'),(241,'Randy','2015-10-15 15:26:53','2015-10-15 15:27:06'),(242,'Randy','2015-10-15 15:28:58','2015-10-15 15:29:15'),(243,'Jerwin','2015-10-15 15:29:35','2015-10-15 15:30:29'),(244,'Jerwin','2015-10-15 15:30:38','2015-10-15 15:31:58'),(245,'Randy','2015-10-15 15:32:02','2015-10-15 15:33:12'),(246,'Karen','2015-10-15 15:33:16','2015-10-15 15:33:38'),(247,'Jerwin','2015-10-15 15:33:47','2015-10-15 15:34:05'),(248,'Jerwin','2015-10-15 15:40:25','2015-10-15 15:40:25'),(249,'Jerwin','2015-10-15 15:42:52','2015-10-15 15:43:20'),(250,'Karen','2015-10-15 15:44:39','2015-10-15 15:44:42'),(251,'Jerwin','2015-10-15 15:44:52','2015-10-15 15:45:20'),(252,'Jerwin','2015-10-15 15:45:23','2015-10-15 15:45:47'),(253,'Jerwin','2015-10-15 15:47:54','2015-10-15 15:48:49'),(254,'Karen','2015-10-15 15:48:54','2015-10-15 15:48:59'),(255,'Randy','2015-10-15 15:53:51','2015-10-15 15:53:51'),(256,'Randy','2015-10-15 16:00:07','2015-10-15 16:00:37'),(257,'Karen','2015-10-15 16:01:05','2015-10-15 16:01:36'),(258,'Randy','2015-10-15 16:10:41','2015-10-15 16:10:44'),(259,'Karen','2015-10-15 16:10:49','2015-10-15 16:10:57'),(260,'Karen','2015-10-15 16:11:23','2015-10-15 16:11:23'),(261,'Randy','2015-10-15 16:12:05','2015-10-15 16:12:15'),(262,'Randy','2015-10-15 16:12:51','2015-10-15 16:13:04'),(263,'Karen','2015-10-15 16:13:42','2015-10-15 16:13:42'),(264,'Randy','2015-10-15 16:14:16','2015-10-15 16:14:20'),(265,'Karen','2015-10-15 16:16:23','2015-10-15 16:17:34'),(266,'Jerwin','2015-10-15 16:18:22','2015-10-15 16:18:32'),(267,'Jerwin','2015-10-15 16:18:39','2015-10-15 16:18:44'),(268,'Randy','2015-10-15 16:18:39','2015-10-15 16:18:39'),(269,'Randy','2015-10-15 16:19:14','2015-10-15 16:19:34'),(270,'Randy','2015-10-15 16:19:40','2015-10-15 16:19:43'),(271,'Karen','2015-10-15 16:19:46','2015-10-15 16:20:07'),(272,'Randy','2015-10-15 16:21:17','2015-10-15 16:21:58'),(273,'Randy','2015-10-15 16:22:20','2015-10-15 16:22:57'),(274,'Randy','2015-10-15 16:23:01','2015-10-15 16:24:28'),(275,'Jerwin','2015-10-15 16:25:39','2015-10-15 16:25:49'),(276,'Karen','2015-10-15 16:25:53','2015-10-15 16:25:58'),(277,'Randy','2015-10-15 16:26:01','2015-10-15 16:26:10'),(278,'Jerwin','2015-10-15 16:27:18','2015-10-15 16:27:25'),(279,'Randy','2015-10-15 16:27:35','2015-10-15 16:27:35'),(280,'','2015-10-15 16:32:28','2015-10-15 16:32:28'),(281,'Randy','2015-10-15 16:32:46','2015-10-15 16:34:35'),(282,'Jerwin','2015-10-15 16:35:00','2015-10-15 16:35:02'),(283,'Karen','2015-10-15 16:35:05','2015-10-15 16:35:08'),(284,'Randy','2015-10-15 16:35:11','2015-10-15 16:35:29'),(285,'Randy','2015-10-15 16:36:19','2015-10-15 16:37:21'),(286,'','2015-10-15 16:37:24','2015-10-15 16:38:22'),(287,'Jerwin','2015-10-15 16:38:30','2015-10-15 16:38:34'),(288,'Randy','2015-10-15 16:43:04','2015-10-15 16:43:16'),(289,'Jerwin','2015-10-15 16:44:53','2015-10-15 16:45:01'),(290,'Randy','2015-10-15 16:45:15','2015-10-15 16:45:31'),(291,'Jerwin','2015-10-15 17:57:12','2015-10-15 17:57:12'),(292,'Rabi','2015-10-15 17:57:32','2015-10-15 17:57:32'),(293,'Randy','2015-10-15 17:57:48','2015-10-15 17:57:48'),(294,'Karen','2015-10-15 17:57:53','2015-10-15 17:58:13'),(295,'Rabi','2015-10-15 18:05:42','2015-10-15 18:06:01'),(296,'Rabi','2015-10-15 18:26:18','2015-10-15 18:37:31'),(297,'Rabi','2015-10-15 18:37:37','2015-10-15 18:37:37'),(298,'Jerwin','2015-10-15 18:40:53','2015-10-15 18:41:34'),(299,'','2015-10-15 18:42:55','2015-10-15 18:42:59'),(300,'Jerwin','2015-10-15 18:43:04','2015-10-15 18:51:51'),(301,'Jerwin','2015-10-15 18:51:57','2015-10-15 18:52:57'),(302,'Randy','2015-10-15 18:53:15','2015-10-15 18:53:15'),(303,'Karen','2015-10-15 19:16:40','2015-10-15 19:16:40'),(304,'Jerwin','2015-10-15 19:21:13','2015-10-15 19:25:57'),(305,'Rabi','2015-10-15 19:26:21','2015-10-15 19:26:21'),(306,'Jerwin','2015-10-15 19:31:32','2015-10-15 19:31:33'),(307,'','2015-10-15 19:31:51','2015-10-15 19:32:36'),(308,'','2015-10-29 09:45:25','2015-10-29 09:48:23'),(309,'Francis','2015-10-29 09:48:40','2015-10-29 09:49:00'),(310,'Jerwin','2015-10-29 09:49:04','2015-10-29 09:50:25'),(311,'Francis','2015-10-29 09:50:30','2015-10-29 09:51:28'),(312,'','2015-10-29 09:53:02','2015-10-29 09:53:03'),(313,'Karen','2015-10-29 09:53:07','2015-10-29 09:55:35'),(314,'Jerwin','2015-10-29 09:55:43','2015-10-29 09:55:54');
/*!40000 ALTER TABLE `login_trail_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `login_trail_view`
--

DROP TABLE IF EXISTS `login_trail_view`;
/*!50001 DROP VIEW IF EXISTS `login_trail_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `login_trail_view` (
  `employee_name` tinyint NOT NULL,
  `datetime_in` tinyint NOT NULL,
  `datetime_out` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `monthly_sales_report`
--

DROP TABLE IF EXISTS `monthly_sales_report`;
/*!50001 DROP VIEW IF EXISTS `monthly_sales_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `monthly_sales_report` (
  `Month_index` tinyint NOT NULL,
  `Month` tinyint NOT NULL,
  `Sales` tinyint NOT NULL,
  `Year` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_invoice_tbl`
--

DROP TABLE IF EXISTS `product_invoice_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_invoice_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `consumed` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `invoice_fk_idx` (`invoice_id`),
  KEY `product_fk_idx` (`product_id`),
  CONSTRAINT `invoice_fk` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_fk` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_invoice_tbl`
--

LOCK TABLES `product_invoice_tbl` WRITE;
/*!40000 ALTER TABLE `product_invoice_tbl` DISABLE KEYS */;
INSERT INTO `product_invoice_tbl` VALUES (1,1,'CTVB1D1015M00',50,15000.00,''),(2,5,'CTVB1D1015M00',1,300.00,''),(3,15,'CTVB1D1015M00',1,300.00,''),(4,28,'ACCB1D1015M30',100,20000.00,''),(5,28,'SWGB1D1015M09',7,1400.00,''),(6,28,'CTVB1D1015M00',2,600.00,'');
/*!40000 ALTER TABLE `product_invoice_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tbl`
--

DROP TABLE IF EXISTS `product_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tbl` (
  `id` varchar(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `specification` varchar(45) DEFAULT NULL,
  `warranty` varchar(45) DEFAULT NULL,
  `replacement` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `product_category_fk_idx` (`category_id`),
  CONSTRAINT `product_category_fk` FOREIGN KEY (`category_id`) REFERENCES `category_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tbl`
--

LOCK TABLES `product_tbl` WRITE;
/*!40000 ALTER TABLE `product_tbl` DISABLE KEYS */;
INSERT INTO `product_tbl` VALUES ('ACCB1D1015M30','Mechanical Safety Edge',1,200.00,'Safety Safe Product','2 months','2 months'),('CTVB1D1015M00','ATD-18040',2,400.00,'ATM','2 months','3 months'),('SWGB1D1015M09','FLAP BARRIER GATE',4,200.00,'fluppy','2 months','2 months');
/*!40000 ALTER TABLE `product_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `purchased_product_view`
--

DROP TABLE IF EXISTS `purchased_product_view`;
/*!50001 DROP VIEW IF EXISTS `purchased_product_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `purchased_product_view` (
  `Name` tinyint NOT NULL,
  `Barcode` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `unit_price` tinyint NOT NULL,
  `Sales` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `receipt_tbl`
--

DROP TABLE IF EXISTS `receipt_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt_tbl` (
  `invoice_id` int(11) NOT NULL,
  `net_price` decimal(10,2) NOT NULL,
  `cash_tender` decimal(10,2) NOT NULL,
  `changed` decimal(10,2) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  CONSTRAINT `receipt_invoice_fk` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_tbl`
--

LOCK TABLES `receipt_tbl` WRITE;
/*!40000 ALTER TABLE `receipt_tbl` DISABLE KEYS */;
INSERT INTO `receipt_tbl` VALUES (3,15000.00,20000.00,5000.00),(7,300.00,400.00,100.00),(17,300.00,300.00,0.00),(29,22000.00,22000.00,0.00),(33,15000.00,20000.00,5000.00);
/*!40000 ALTER TABLE `receipt_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve` (
  `invoice` varchar(45) NOT NULL,
  `productname` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `date` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sales_today_view`
--

DROP TABLE IF EXISTS `sales_today_view`;
/*!50001 DROP VIEW IF EXISTS `sales_today_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sales_today_view` (
  `Date` tinyint NOT NULL,
  `Total_Sales` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `supplier_tbl`
--

DROP TABLE IF EXISTS `supplier_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_tbl`
--

LOCK TABLES `supplier_tbl` WRITE;
/*!40000 ALTER TABLE `supplier_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tbl`
--

DROP TABLE IF EXISTS `user_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tbl` (
  `id` varchar(45) NOT NULL,
  `password` longtext,
  `access_level` enum('ADMIN','CASHIER','INVENTORY_PERSONNEL','STAFF') DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `session_status` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tbl`
--

LOCK TABLES `user_tbl` WRITE;
/*!40000 ALTER TABLE `user_tbl` DISABLE KEYS */;
INSERT INTO `user_tbl` VALUES ('CJ','1000:0kvsVNGnZ7YHYCyvXMrJClQKCyM3h828:E6n/fB2//+RrY6GzaPn1PxEyMXyKRXfa','ADMIN','2015-09-06 01:36:36','','\0'),('Francis','1000:cXsSfDJE5IpkCpPgsqZLjTAUbSUrwP3z:VdDAcu3dy/POkaLO9lo5S4HK5nvNpdJ7','STAFF','2015-09-13 11:02:09','','\0'),('Jerwin','1000:gBMaS7CPoPuWssMx7Mp62asrgwOA92sS:upbW17soJuVdyFv6uhZC+s9Uif7nE+Gt','INVENTORY_PERSONNEL','2015-09-13 11:24:38','','\0'),('jessea','1000:IV6vfxHd3+oZOpzhuvQqaWqKFWgnlxF7:QwX+pD/fdR9ceKrThIYMHoeiA3iBTlML','STAFF','2015-10-04 18:05:49','\0','\0'),('Karen','1000:MC2hqaVscON7bSPVsrdlPXJk1L6crrFD:0WgLdA1IbCGI2Ky0qmfO+8MyYoLDi+PA','CASHIER','2015-09-17 09:40:51','','\0'),('Rabi','1000:JQ7Krc6eL01CNWzahmeGl3cnE8UgfSDo:IVh/sn6SQvxcwn/qNRbxDMNcVAPobCib','ADMIN','2015-09-13 13:35:25','','\0'),('Randy','1000:f4SEmab2lco1yQqFfOqN+w4oSy0shM2d:HaURFbRfMKDTUUseYyzvlRdPnuR9gaAa','STAFF','2015-09-13 10:52:08','','\0');
/*!40000 ALTER TABLE `user_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `weekly_sales_report`
--

DROP TABLE IF EXISTS `weekly_sales_report`;
/*!50001 DROP VIEW IF EXISTS `weekly_sales_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `weekly_sales_report` (
  `Date` tinyint NOT NULL,
  `Week` tinyint NOT NULL,
  `Begin` tinyint NOT NULL,
  `End` tinyint NOT NULL,
  `Sales` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bestsellers`
--

/*!50001 DROP TABLE IF EXISTS `bestsellers`*/;
/*!50001 DROP VIEW IF EXISTS `bestsellers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `bestsellers` AS select `purchased_product_view`.`Name` AS `Name`,`purchased_product_view`.`quantity` AS `Item_Sold`,cast((`purchased_product_view`.`quantity` / (select sum(`purchased_product_view`.`quantity`) from `purchased_product_view`)) as decimal(3,2)) AS `Percent_Share` from `purchased_product_view` order by `purchased_product_view`.`quantity` limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daily_sales_report`
--

/*!50001 DROP TABLE IF EXISTS `daily_sales_report`*/;
/*!50001 DROP VIEW IF EXISTS `daily_sales_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `daily_sales_report` AS select `invoice_tbl`.`date` AS `Date`,sum(`receipt_tbl`.`net_price`) AS `Sales` from (`receipt_tbl` join `invoice_tbl` on((`receipt_tbl`.`invoice_id` = `invoice_tbl`.`id`))) group by `invoice_tbl`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inventory_view`
--

/*!50001 DROP TABLE IF EXISTS `inventory_view`*/;
/*!50001 DROP VIEW IF EXISTS `inventory_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `inventory_view` AS select `product_tbl`.`name` AS `Name`,`product_tbl`.`id` AS `Barcode`,`product_tbl`.`unit_price` AS `Unit_price`,`category_tbl`.`name` AS `Category`,`inventory_tbl`.`stockin_datetime` AS `Stock_since`,`inventory_tbl`.`supplier` AS `Supplier`,sum(`inventory_tbl`.`qty_received`) AS `Qty_Received`,sum(`inventory_tbl`.`qty_onhand`) AS `Qty_On_Hand` from ((`inventory_tbl` join `product_tbl` on((`inventory_tbl`.`product_id` = `product_tbl`.`id`))) join `category_tbl` on((`product_tbl`.`category_id` = `category_tbl`.`id`))) group by `inventory_tbl`.`product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `login_trail_view`
--

/*!50001 DROP TABLE IF EXISTS `login_trail_view`*/;
/*!50001 DROP VIEW IF EXISTS `login_trail_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `login_trail_view` AS select concat(`employee_tbl`.`firstname`,' ',`employee_tbl`.`lastname`) AS `employee_name`,`login_trail_tbl`.`datetime_in` AS `datetime_in`,`login_trail_tbl`.`datetime_out` AS `datetime_out` from ((`login_trail_tbl` left join `user_tbl` on((convert(`login_trail_tbl`.`user_id` using utf8) = `user_tbl`.`id`))) left join `employee_tbl` on((`user_tbl`.`id` = `employee_tbl`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthly_sales_report`
--

/*!50001 DROP TABLE IF EXISTS `monthly_sales_report`*/;
/*!50001 DROP VIEW IF EXISTS `monthly_sales_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_sales_report` AS select month(`invoice_tbl`.`date`) AS `Month_index`,monthname(`invoice_tbl`.`date`) AS `Month`,sum(`receipt_tbl`.`net_price`) AS `Sales`,year(`invoice_tbl`.`date`) AS `Year` from (`receipt_tbl` join `invoice_tbl` on((`receipt_tbl`.`invoice_id` = `invoice_tbl`.`id`))) group by `Month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `purchased_product_view`
--

/*!50001 DROP TABLE IF EXISTS `purchased_product_view`*/;
/*!50001 DROP VIEW IF EXISTS `purchased_product_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `purchased_product_view` AS select `ps`.`name` AS `Name`,`ps`.`id` AS `Barcode`,sum(`pt`.`quantity`) AS `quantity`,`ps`.`unit_price` AS `unit_price`,(sum(`pt`.`quantity`) * `ps`.`unit_price`) AS `Sales`,`ps`.`category_id` AS `category` from (`product_tbl` `ps` join `product_invoice_tbl` `pt` on((`pt`.`product_id` = `ps`.`id`))) group by `ps`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_today_view`
--

/*!50001 DROP TABLE IF EXISTS `sales_today_view`*/;
/*!50001 DROP VIEW IF EXISTS `sales_today_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_today_view` AS select `invoice_tbl`.`date` AS `Date`,sum(`receipt_tbl`.`net_price`) AS `Total_Sales` from (`receipt_tbl` join `invoice_tbl` on((`invoice_tbl`.`id` = `receipt_tbl`.`invoice_id`))) where (`invoice_tbl`.`date` = curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `weekly_sales_report`
--

/*!50001 DROP TABLE IF EXISTS `weekly_sales_report`*/;
/*!50001 DROP VIEW IF EXISTS `weekly_sales_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pos_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `weekly_sales_report` AS select `invoice_tbl`.`date` AS `Date`,week(`invoice_tbl`.`date`,0) AS `Week`,min(`invoice_tbl`.`date`) AS `Begin`,max(`invoice_tbl`.`date`) AS `End`,sum(`receipt_tbl`.`net_price`) AS `Sales` from (`receipt_tbl` join `invoice_tbl` on((`receipt_tbl`.`invoice_id` = `invoice_tbl`.`id`))) group by `Week` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-29  9:56:43
