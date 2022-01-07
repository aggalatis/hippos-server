-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hippos
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(155) DEFAULT NULL,
  `category_font_size` int(11) DEFAULT NULL,
  `category_color` varchar(55) DEFAULT NULL,
  `category_order` int(11) DEFAULT NULL,
  `category_date_created` datetime DEFAULT NULL,
  `category_deleted` tinyint(4) DEFAULT NULL,
  `category_date_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'ΨΩΜΙ',15,'blue',0,NULL,0,NULL),(2,'ΚΑΦΕΣ',15,'brown',0,NULL,0,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `company_vat` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `company_header` text CHARACTER SET utf8 COLLATE utf8_bin,
  `company_emails` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `company_myData_api` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `company_mydata_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `company_branch` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_fullname` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_phone` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_branch` int(11) DEFAULT NULL,
  `customer_address` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_address_number` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_area` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_vat_number` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_tax_office` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_postal_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_bussiness` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_load` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_destination` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'ΚΑΛΟΝΙΑΤΗ  ΚΑΛΛΙΟΠΗ ΓΕΩΡΓΙΟΣ','2109635472',0,'Γ ΓΕΝΝΗΜΑΤΑ','62','ΓΛΥΦΑΔΑ','045178749','ΓΛΥΦΑΔΑΣ','16562','ΥΠΗΡΕΣΙΕΣ ΜΗΧΑΝΙΚΩΝ ΓΙΑ ΟΙΚΟΔΟΜΙΚΑ ΕΡΓΑ','ΕΔΡΑ ΜΑΣ','ΕΔΡΑ ΤΟΥΣ','2021-12-08 21:04:29'),(2,'ΝΓ ΕΠΕΝΔΥΤΙΚΗ ΜΟΝΟΠΡΟΣΩΠΗ Ι Κ Ε','',0,'ΓΡΗΓΟΡΙΟΥ ΖΩΓΚΟΥ','12','ΖΩΓΡΑΦΟΥ','800890670','ΙΒ ΑΘΗΝΩΝ','15773','ΥΠΗΡΕΣΙΕΣ ΠΑΡΑΧΩΡΗΣΗΣ ΠΡΟΝΟΜΙΟΥ FRANCHISE ΚΑΙ ΠΑΡΟΧΗΣ ΣΧΕΤΙΚΩΝ ΣΥΜΒΟΥΛΩΝ','ΕΔΡΑ ΜΑΣ','ΕΔΡΑ ΤΟΥΣ','2021-12-08 21:07:26'),(3,'ΣΑΓΙΟΓΛΟΥ  ΣΩΤΗΡΙΟΣ ΔΗΜΗΤΡΙΟΣ','2101111111',0,'ΑΙΓΕΩΣ','74','ΚΑΛΛΙΘΕΑ','039610850','ΚΑΛΛΙΘΕΑΣ','17675','ΠΑΡΑΓΩΓΗ ΝΩΠΩΝ ΕΙΔΩΝ ΖΑΧΑΡΟΠΛΑΣΤΙΚΗΣ ΚΑΙ ΓΛΥΚΙΣΜΑΤΩΝ','ΕΔΡΑ ΜΑΣ','ΕΔΡΑ ΤΟΥΣ','2022-01-05 22:41:20'),(7,'ΓΕΥΣΤΙΚΕΣ ΑΠΟΛΑΥΣΕΙΣ ΜΟΝΟΠΡΟΣΩΠΗ ΙΔΙΩΤΙΚΗ ΚΕΦΑΛΑΙΟΥΧΙΚΗ ΕΤΑΙΡΕΙΑ','210111111111',0,'ΦΙΛΟΛΑΟΥ','87       ','ΑΘΗΝΑ','801567888','ΙΖ ΑΘΗΝΩΝ','11633','ΥΠΗΡΕΣΙΕΣ ΠΑΡΟΧΗΣ ΓΕΥΜΑΤΩΝ ΑΠΟ ΨΗΤΟΠΩΛΕΙΟ - ΣΟΥΒΛΑΤΖΙΔΙΚΟ), ΧΩΡΙΣ ΠΑΡΟΧΗ ΚΑΘΙΣΜΑΤΟΣ','ΕΔΡΑ ΜΑΣ','ΕΔΡΑ ΤΟΥΣ','2022-01-06 20:35:40');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_closure`
--

DROP TABLE IF EXISTS `day_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_closure` (
  `day_closure_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_closure_datetime` datetime NOT NULL,
  PRIMARY KEY (`day_closure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_closure`
--

LOCK TABLES `day_closure` WRITE;
/*!40000 ALTER TABLE `day_closure` DISABLE KEYS */;
INSERT INTO `day_closure` VALUES (1,'2000-10-20 00:01:00'),(2,'2022-01-06 19:45:44');
/*!40000 ALTER TABLE `day_closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `document_number` int(11) NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'ΑΠΟΔΕΙΞΗ ΛΙΑΝΙΚΗΣ ΠΩΛΗΣΗΣ',13),(2,'ΤΙΜΟΛΟΓΙΟ',21);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_products` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_order_id` int(11) NOT NULL,
  `order_product_product_id` int(11) NOT NULL,
  `order_product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_product_quantity` double DEFAULT NULL,
  `order_product_price` double DEFAULT NULL,
  `order_product_vat_id` int(11) DEFAULT NULL,
  `order_product_subtotal` double DEFAULT NULL,
  `order_product_discount` double DEFAULT NULL,
  `order_product_total` double DEFAULT NULL,
  `order_product_date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,1,1,'ΕΙΔΟΣ 13%',1,1,1,1,0,1,'2021-11-28 19:23:57'),(2,2,4,'test',2,1,2,2,0,2,'2021-12-07 21:10:50'),(3,3,3,'ΣΑΚΟΥΛΑ',4,0.09,2,0.36,0,0.36,'2021-12-07 21:20:27'),(4,3,4,'test',4,1,2,4,0,4,'2021-12-07 21:20:27'),(5,3,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,0,74.69,'2021-12-07 21:20:27'),(6,4,4,'test',5,1,2,5,0.2,4,'2021-12-07 21:22:25'),(7,4,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,26.14,48.55,'2021-12-07 21:22:26'),(8,5,2,'ΕΙΔΟΣ 24%',3,3.6,2,10.8,0,10.8,'2021-12-07 20:01:54'),(9,5,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',3,74.69,1,224.07,0,224.07,'2021-12-07 20:01:54'),(10,5,4,'test',2,1,2,2,0,2,'2021-12-07 20:01:54'),(11,5,3,'ΣΑΚΟΥΛΑ',1,0.09,2,0.09,0,0.09,'2021-12-07 20:01:54'),(12,5,2,'ΕΙΔΟΣ 24%',1,2,2,2,0,2,'2021-12-07 20:01:54'),(13,6,4,'test',6,1,2,6,0,6,'2021-12-13 19:05:25'),(14,6,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,22.41,52.28,'2021-12-13 19:05:25'),(15,7,4,'test',10,1,2,10,0.3,7,'2021-12-13 19:09:30'),(16,8,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-04 20:54:38'),(17,9,2,'ΕΙΔΟΣ 24%',1,30,2,30,0,30,'2022-01-04 20:57:13'),(18,10,2,'ΕΙΔΟΣ 24%',1,10,2,10,0,10,'2022-01-05 21:40:58'),(19,11,2,'ΕΙΔΟΣ 24%',1,10,2,10,0,10,'2022-01-05 21:41:25'),(20,12,2,'ΕΙΔΟΣ 24%',1,10,2,10,0,10,'2022-01-05 21:41:54'),(21,13,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,0,74.69,'2022-01-05 21:42:37'),(22,14,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-05 22:39:42'),(23,15,2,'ΕΙΔΟΣ 24%',1,30,2,30,0,30,'2022-01-05 22:41:32'),(24,16,2,'ΕΙΔΟΣ 24%',1,1,2,1,0,1,'2022-01-05 22:48:36'),(25,17,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-05 22:52:15'),(26,18,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,22.41,52.28,'2022-01-05 22:52:56'),(27,19,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,26.89,47.8,'2022-01-05 22:58:07'),(28,19,2,'ΕΙΔΟΣ 24%',2,15,2,30,0,30,'2022-01-05 22:58:07'),(29,19,2,'ΕΙΔΟΣ 24%',2,6.59,2,13.18,3.95,5.279999999999999,'2022-01-05 22:58:07'),(30,20,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-06 19:05:18'),(31,21,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-06 19:19:58'),(32,22,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-06 19:20:26'),(33,23,2,'ΕΙΔΟΣ 24%',1,15,2,15,0,15,'2022-01-06 19:23:14'),(34,24,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,0,74.69,'2022-01-06 19:24:39'),(35,25,2,'ΕΙΔΟΣ 24%',1,30,2,30,0,30,'2022-01-06 19:26:32'),(36,26,4,'test',5,1,2,5,0,5,'2022-01-06 19:29:17'),(37,27,4,'test',5,1,2,5,0,5,'2022-01-06 19:30:39'),(38,28,4,'test',5,1,2,5,0,5,'2022-01-06 19:32:36'),(39,29,4,'test',7,1,2,7,0,7,'2022-01-06 19:33:46'),(40,30,4,'test',5,1,2,5,0,5,'2022-01-06 19:37:14'),(41,30,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,0,74.69,'2022-01-06 19:37:15'),(42,30,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-06 19:37:15'),(43,30,3,'ΣΑΚΟΥΛΑ',1,0.09,2,0.09,0,0.09,'2022-01-06 19:37:15'),(44,31,2,'ΕΙΔΟΣ 24%',1,20,2,20,0,20,'2022-01-06 20:36:31'),(45,32,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',2,74.69,1,149.38,14.94,119.5,'2022-01-06 20:38:23'),(46,32,2,'ΕΙΔΟΣ 24%',3,30,2,90,0,90,'2022-01-06 20:38:23'),(47,32,4,'test',1,1,2,1,0,1,'2022-01-06 20:38:23'),(48,32,4,'test',6,1,2,6,0.33,4.02,'2022-01-06 20:38:23'),(49,32,4,'test',1,1,2,1,0,1,'2022-01-06 20:38:23'),(50,32,4,'test',1,1,2,1,0,1,'2022-01-06 20:38:23'),(51,33,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,0,74.69,'2022-01-06 21:37:32'),(52,34,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,0,74.69,'2022-01-06 21:38:11'),(53,35,2,'ΕΙΔΟΣ 24%',1,2.5,2,2.5,0,2.5,'2022-01-06 21:38:29'),(54,36,2,'ΕΙΔΟΣ 24%',1,2.5,2,2.5,0,2.5,'2022-01-06 21:38:49'),(55,36,3,'ΣΑΚΟΥΛΑ',1,0.09,2,0.09,0,0.09,'2022-01-06 21:38:49'),(56,36,4,'test',3,1,2,3,0,3,'2022-01-06 21:38:49'),(57,37,4,'test',4,1,2,4,0,4,'2022-01-06 21:39:39'),(58,38,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',1,74.69,1,74.69,0,74.69,'2022-01-07 21:45:55');
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_document_number` int(11) DEFAULT NULL,
  `order_document_type` int(11) DEFAULT NULL,
  `order_mark` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_user_id` int(11) NOT NULL,
  `order_customer_id` int(11) DEFAULT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_subtotal` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `order_total` double DEFAULT NULL,
  `order_payment_method` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `order_date_created` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,NULL,2,NULL,1,1,0,1,'cash','2021-11-28 19:23:57'),(2,2,1,NULL,2,NULL,2,2,0,2,'cash','2021-12-07 21:10:50'),(3,3,1,NULL,2,NULL,9,79.05,0,79.05,'cash','2021-12-07 21:20:27'),(4,4,1,NULL,2,NULL,6,79.69,27.14,52.55,'cash','2021-12-07 21:22:25'),(5,5,1,NULL,2,NULL,10,238.96,0,238.96,'cash','2021-12-07 20:01:54'),(6,6,1,NULL,2,NULL,7,80.69,22.41,58.28,'cash','2021-12-13 19:05:25'),(7,7,1,NULL,2,NULL,10,10,3,7,'cash','2021-12-13 19:09:30'),(8,1,2,'400001862472713',2,NULL,1,20,0,20,'cash','2022-01-04 20:54:38'),(9,2,2,'400001862472715',2,1,1,30,0,30,'cash','2022-01-04 20:57:13'),(10,3,2,'400001862719790',2,1,1,10,0,10,'cash','2022-01-05 21:40:58'),(11,3,2,'400001862719791',2,1,1,10,0,10,'cash','2022-01-05 21:41:25'),(12,3,2,'400001862719792',2,1,1,10,0,10,'cash','2022-01-05 21:41:54'),(13,4,2,'400001862719793',2,1,1,74.69,0,74.69,'cash','2022-01-05 21:42:37'),(14,5,2,NULL,2,2,1,20,0,20,'cash','2022-01-05 22:39:42'),(15,6,2,'400001862719838',2,3,1,30,0,30,'cash','2022-01-05 22:41:32'),(16,7,2,'400001862719847',2,1,1,1,0,1,'cash','2022-01-05 22:48:36'),(17,8,2,'400001862719850',2,3,1,20,0,20,'cash','2022-01-05 22:52:15'),(18,9,2,'400001862719851',2,3,1,74.69,22.41,52.28,'cash','2022-01-05 22:52:56'),(19,10,2,'400001862719855',2,1,5,117.87,34.79,83.08,'cash','2022-01-05 22:58:07'),(20,11,2,'400001862721221',2,1,1,20,0,20,'cash','2022-01-06 19:05:18'),(21,11,2,'400001862721230',2,1,1,20,0,20,'cash','2022-01-06 19:19:58'),(22,11,2,'400001862721231',2,1,1,20,0,20,'cash','2022-01-06 19:20:26'),(23,12,2,'400001862721235',2,3,1,15,0,15,'cash','2022-01-06 19:23:14'),(24,13,2,'400001862721237',2,1,1,74.69,0,74.69,'cash','2022-01-06 19:24:38'),(25,14,2,'400001862721241',2,1,1,30,0,30,'cash','2022-01-06 19:26:32'),(26,15,2,'400001862721243',2,1,5,5,0,5,'cash','2022-01-06 19:29:17'),(27,16,2,'400001862721246',2,3,5,5,0,5,'cash','2022-01-06 19:30:39'),(28,17,2,'400001862721255',2,1,5,5,0,5,'cash','2022-01-06 19:32:36'),(29,18,2,'400001862721257',2,3,7,7,0,7,'cash','2022-01-06 19:33:46'),(30,19,2,'400001862721260',2,1,8,99.78,0,99.78,'cash','2022-01-06 19:37:14'),(31,20,2,'400001862721312',2,7,1,20,0,20,'cash','2022-01-06 20:36:31'),(32,21,2,'400001862721315',2,7,14,248.38,31.86,216.52,'cash','2022-01-06 20:38:23'),(33,8,1,NULL,3,NULL,1,74.69,0,74.69,'cash','2022-01-06 21:37:32'),(34,9,1,NULL,3,NULL,1,74.69,0,74.69,'cash','2022-01-06 21:38:11'),(35,10,1,NULL,3,NULL,1,2.5,0,2.5,'cash','2022-01-06 21:38:29'),(36,11,1,NULL,3,NULL,5,5.59,0,5.59,'card','2022-01-06 21:38:49'),(37,12,1,NULL,3,NULL,4,4,0,4,'cash','2022-01-06 21:39:39'),(38,13,1,NULL,2,NULL,1,74.69,0,74.69,'cash','2022-01-07 21:45:55');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) DEFAULT NULL,
  `product_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_free_price` tinyint(1) DEFAULT '0',
  `product_price` double DEFAULT NULL,
  `product_vat_id` int(11) DEFAULT NULL,
  `product_vat_percent` varchar(45) DEFAULT NULL,
  `product_font_size` int(11) DEFAULT NULL,
  `product_color` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_order` int(11) DEFAULT NULL,
  `product_date_created` datetime DEFAULT NULL,
  `product_deleted` tinyint(4) DEFAULT NULL,
  `product_date_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `products_product_id_uindex` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'ΕΙΜΑΙ ΕΝΑ ΠΡΟΙΟΝ ΜΕ ΜΕΓΑΛΟ ΟΝΟΜΑ',0,74.69,1,'13%',10,'white',0,'2021-11-18 20:37:00',0,NULL),(2,1,'ΕΙΔΟΣ 24%',1,0,2,'24%',15,'red',1,'2021-11-18 20:37:00',0,NULL),(3,2,'ΣΑΚΟΥΛΑ',0,0.09,2,'24%',15,'white',2,'2021-11-18 20:37:00',0,NULL),(4,2,'test',0,1,2,'24%',15,'blue',4,'2021-11-18 20:37:00',0,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'ΤΑΜΕΙΑΣ'),(2,'ΔΙΑΧΕΙΡΙΣΤΗΣ');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(155) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(155) COLLATE utf8_bin NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `user_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `user_last_login` datetime DEFAULT NULL,
  `user_last_logout` datetime DEFAULT NULL,
  `user_date_created` datetime DEFAULT NULL,
  `user_date_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id_idx` (`user_role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ADMIN','ADMIN','c4ca4238a0b923820dcc509a6f75849b',2,0,'2022-01-07 21:46:00','2022-01-07 19:48:31',NULL,NULL),(2,'TAMEIO','TAMEIO','c4ca4238a0b923820dcc509a6f75849b',1,0,'2022-01-07 21:48:37','2022-01-07 19:45:58',NULL,NULL),(3,'KAFES11','KAFES','c4ca4238a0b923820dcc509a6f75849b',1,0,'2022-01-06 21:37:28',NULL,'2022-01-06 21:25:05',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vats`
--

DROP TABLE IF EXISTS `vats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vats` (
  `vat_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_percent` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vat_decimal` double DEFAULT NULL,
  `vat_decimal_full` double DEFAULT NULL,
  `vat_description` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `vat_date_created` datetime DEFAULT NULL,
  `vat_deleted` tinyint(1) DEFAULT '0',
  `vat_date_deleted` datetime DEFAULT NULL,
  `vat_rocket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vats`
--

LOCK TABLES `vats` WRITE;
/*!40000 ALTER TABLE `vats` DISABLE KEYS */;
INSERT INTO `vats` VALUES (1,'13%',0.13,1.13,'ΧΑΜΗΛΟΣ ΦΠΑ','2021-11-18 20:37:00',0,NULL,1),(2,'24%',0.24,1.24,'ΥΨΗΛΟΣ ΦΠΑ','2021-11-18 20:37:00',0,NULL,2);
/*!40000 ALTER TABLE `vats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hippos'
--

--
-- Dumping routines for database 'hippos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07 22:02:18
