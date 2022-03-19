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

CREATE DATABASE IF NOT EXISTS `hippos`;/*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hippos`;


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'ΤΑΜΕΙΟ',15,'#ff80ff',0,'2022-01-13 22:04:21',0,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'ΓΕΥΣΤΙΚΕΣ ΑΠΟΛΑΥΣΕΙΣ ΜΟΝ. ΙΚΕ','2109560111',0,'ΦΙΛΟΛΑΟΥ','87','ΑΘΗΝΑ','801567888','ΙΖ ΑΘΗΝΩΝ','11633','ΨΗΤΟΠΩΛΕΙΟ','ΕΔΡΑ ΜΑΣ','ΕΔΡΑ ΤΟΥΣ','2022-01-13 22:06:02'),(2,'ΚΑΛΟΝΙΑΤΗ  ΚΑΛΛΙΟΠΗ ΓΕΩΡΓΙΟΣ','6977980507',0,'Γ ΓΕΝΝΗΜΑΤΑ','63','ΓΛΥΦΑΔΑ','045178749','ΓΛΥΦΑΔΑΣ','16562','ΥΠΗΡΕΣΙΕΣ ΜΗΧΑΝΙΚΩΝ ΓΙΑ ΟΙΚΟΔΟΜΙΚΑ ΕΡΓΑ','ΕΔΡΑ ΜΑΣ','ΕΔΡΑ ΤΟΥΣ','2022-02-15 08:36:00'),(3,'ΠΑΡΑΔΟΣΙΑΚΑ ΑΡΤΟΣΚΕΥΑΣΜΑΤΑ ΜΟΝ ΙΚΕ','2107716781',0,'ΣΠΗΛΙΩΤΟΠΟΥΛΟΥ','22','ΖΩΓΡΑΦΟΥ','801467029','ΙΒ ΑΘΗΝΩΝ','15773','ΥΠΗΡΕΣΙΕΣ ΠΟΥ ΠΑΡΕΧΟΝΤΑΙ ΑΠΟ ΑΝΑΨΥΚΤΗΡΙΟ','ΕΔΡΑ ΜΑΣ','ΕΔΡΑ ΤΟΥΣ','2022-02-15 08:39:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_closure`
--

LOCK TABLES `day_closure` WRITE;
/*!40000 ALTER TABLE `day_closure` DISABLE KEYS */;
INSERT INTO `day_closure` VALUES (1,'2000-10-20 00:01:00');
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
INSERT INTO `documents` VALUES (1,'ΑΠΟΔΕΙΞΗ ΛΙΑΝΙΚΗΣ ΠΩΛΗΣΗΣ',18),(2,'ΤΙΜΟΛΟΓΙΟ',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,1,1,'ΕΙΔΟΣ 13%',1,1.58,1,1.58,0,1.58,'2022-01-13 22:06:09'),(2,1,2,'ΕΙΔΟΣ 24%',1,3.62,2,3.62,0,3.62,'2022-01-13 22:06:09'),(3,2,1,'ΕΙΔΟΣ 13%',1,3.65,1,3.65,0,3.65,'2022-01-13 22:06:40'),(4,2,2,'ΕΙΔΟΣ 24%',1,2.51,2,2.51,0,2.51,'2022-01-13 22:06:40'),(5,2,1,'ΕΙΔΟΣ 13%',1,8.5,1,8.5,0,8.5,'2022-01-13 22:06:40'),(6,3,3,'ΕΙΔΟΣ 6,5%',1,1,3,1,0,1,'2022-01-21 20:39:45'),(7,4,3,'ΕΙΔΟΣ 6,5%',1,2.5,3,2.5,0,2.5,'2022-01-21 20:43:01'),(8,5,3,'ΕΙΔΟΣ 6,5%',1,2,3,2,0,2,'2022-01-21 22:46:21'),(9,6,3,'ΕΙΔΟΣ 6,5%',1,2,3,2,0,2,'2022-01-21 23:03:20'),(10,7,1,'ΕΙΔΟΣ 13%',2,2.5,1,5,0,5,'2022-01-21 23:04:09'),(11,7,2,'ΕΙΔΟΣ 24%',1,3.6,2,3.6,0,3.6,'2022-01-21 23:04:09'),(12,7,3,'ΕΙΔΟΣ 6,5%',3,1.5,3,4.5,0,4.5,'2022-01-21 23:04:09'),(13,7,1,'ΕΙΔΟΣ 13%',1,2.3,1,2.3,0,2.3,'2022-01-21 23:04:09'),(14,8,3,'ΕΙΔΟΣ 6,5%',1,20,3,20,0,20,'2022-01-21 23:18:51'),(15,9,3,'ΕΙΔΟΣ 6,5%',1,10,3,10,0,10,'2022-01-21 23:27:31'),(16,10,3,'ΕΙΔΟΣ 6,5%',1,25,3,25,0,25,'2022-01-21 23:28:19'),(17,11,3,'ΕΙΔΟΣ 6,5%',1,10,3,10,0,10,'2022-01-21 23:30:43'),(18,12,3,'ΕΙΔΟΣ 6,5%',1,20,3,20,0,20,'2022-01-21 23:36:18'),(19,13,3,'ΕΙΔΟΣ 6,5%',1,35,3,35,0,35,'2022-01-21 23:36:52'),(20,14,1,'ΕΙΔΟΣ 13%',1,2.5,1,2.5,0,2.5,'2022-01-22 00:02:01'),(21,14,3,'ΕΙΔΟΣ 6,5%',1,1.5,3,1.5,0,1.5,'2022-01-22 00:02:01'),(22,14,2,'ΕΙΔΟΣ 24%',1,3,2,3,0,3,'2022-01-22 00:02:01'),(23,15,3,'ΕΙΔΟΣ 6,5%',1,6,3,6,0,6,'2022-01-22 00:03:25'),(24,16,1,'ΕΙΔΟΣ 13%',1,1,1,1,0,1,'2022-01-22 00:11:17'),(25,17,1,'ΕΙΔΟΣ 13%',1,2.5,1,2.5,0,2.5,'2022-01-22 00:11:21'),(26,18,1,'ΕΙΔΟΣ 13%',1,1,1,1,0,1,'2022-03-19 20:31:18'),(27,19,3,'ΕΙΔΟΣ 6,5% rwar',1,0.25,3,0.25,0,0.25,'2022-03-19 20:33:56'),(28,20,1,'ΕΙΔΟΣ 13%',1,0.1,1,0.1,0,0.1,'2022-03-19 20:37:50'),(29,21,1,'ΕΙΔΟΣ 13%',1,0.1,1,0.1,0,0.1,'2022-03-19 20:38:02'),(30,21,1,'ΕΙΔΟΣ 13%',1,2.5,1,2.5,0,2.5,'2022-03-19 20:38:02'),(31,21,1,'ΕΙΔΟΣ 13%',1,3.65,1,3.65,0,3.65,'2022-03-19 20:38:02'),(32,22,1,'ΕΙΔΟΣ 13%',1,100,1,100,0,100,'2022-03-19 20:40:30'),(33,23,1,'ΕΙΔΟΣ 13%',1,100,1,100,0,100,'2022-03-19 20:41:21'),(34,24,1,'ΕΙΔΟΣ 13%',1,0.15,1,0.15,0,0.15,'2022-03-19 22:02:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,NULL,2,NULL,2,5.2,0,5.2,'cash','2022-01-13 22:06:09'),(2,1,2,'400001867946488',2,1,3,14.66,0,14.66,'cash','2022-01-13 22:06:40'),(3,2,1,NULL,2,NULL,1,1,0,1,'cash','2022-01-21 20:39:45'),(4,3,1,NULL,2,NULL,1,2.5,0,2.5,'cash','2022-01-21 20:43:01'),(5,4,1,NULL,2,NULL,1,2,0,2,'cash','2022-01-21 22:46:21'),(6,5,1,NULL,2,NULL,1,2,0,2,'cash','2022-01-21 23:03:20'),(7,6,1,NULL,2,NULL,7,15.4,0,15.4,'cash','2022-01-21 23:04:09'),(8,2,2,NULL,2,1,1,20,0,20,'cash','2022-01-21 23:18:51'),(9,7,1,NULL,2,NULL,1,10,0,10,'cash','2022-01-21 23:27:31'),(10,3,2,NULL,2,1,1,25,0,25,'cash','2022-01-21 23:28:19'),(11,4,2,NULL,2,1,1,10,0,10,'cash','2022-01-21 23:30:43'),(12,5,2,NULL,2,1,1,20,0,20,'cash','2022-01-21 23:36:18'),(13,6,2,NULL,2,1,1,35,0,35,'cash','2022-01-21 23:36:52'),(14,8,1,NULL,2,NULL,3,7,0,7,'cash','2022-01-22 00:02:01'),(15,9,1,NULL,2,NULL,1,6,0,6,'cash','2022-01-22 00:03:25'),(16,10,1,NULL,2,NULL,1,1,0,1,'cash','2022-01-22 00:11:17'),(17,11,1,NULL,2,NULL,1,2.5,0,2.5,'cash','2022-01-22 00:11:21'),(18,12,1,NULL,2,NULL,1,1,0,1,'cash','2022-03-19 20:31:18'),(19,13,1,NULL,2,NULL,1,0.25,0,0.25,'cash','2022-03-19 20:33:56'),(20,14,1,NULL,2,NULL,1,0.1,0,0.1,'cash','2022-03-19 20:37:50'),(21,15,1,NULL,2,NULL,3,6.25,0,6.25,'cash','2022-03-19 20:38:02'),(22,16,1,NULL,2,NULL,1,100,0,100,'cash','2022-03-19 20:40:30'),(23,17,1,NULL,2,NULL,1,100,0,100,'cash','2022-03-19 20:41:21'),(24,18,1,NULL,2,NULL,1,0.15,0,0.15,'cash','2022-03-19 22:02:34');
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
INSERT INTO `products` VALUES (1,1,'ΕΙΔΟΣ 13%',1,0,1,'13%',15,'#ffffff',0,'2022-01-13 22:04:44',0,NULL),(2,1,'ΕΙΔΟΣ 24%',1,0,2,'24%',15,'#ffffff',1,'2022-01-13 22:05:01',0,NULL),(3,1,'ΕΙΔΟΣ 6,5% rwar',1,0,3,'6%',15,'#ffffff',3,'2022-01-21 20:39:23',0,NULL),(4,1,'test products',0,1.5,1,'13%',20,'#d25b5b',4,'2022-02-15 08:35:01',0,NULL);
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
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_settings_user_id` int(11) NOT NULL,
  `user_settings_value` json DEFAULT NULL,
  `user_settings_date_created` datetime DEFAULT NULL,
  `user_settings_date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,2,'{\"general\": {\"orderLimit\": 30}, \"catalogue\": {\"cart_div\": \"4\", \"cart_height\": \"380px\", \"products_div\": \"6\", \"tameiaki_view\": true, \"categories_div\": \"2\", \"products_width\": \"95%\", \"products_height\": \"100px\", \"categories_width\": \"95%\", \"categories_height\": \"70px\", \"send_order_height\": \"200px\", \"numpad_input_height\": \"100px\", \"numpad_numbers_height\": \"130px\"}}','2022-03-19 20:10:00',NULL);
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ADMIN','ADMIN','c4ca4238a0b923820dcc509a6f75849b',2,0,'2022-03-19 22:02:44','2022-03-19 20:03:34',NULL,NULL),(2,'TAMEIO','TAMEIO','c4ca4238a0b923820dcc509a6f75849b',1,0,'2022-03-19 22:11:10','2022-03-19 20:11:05',NULL,NULL),(3,'KAFES','KAFES','c4ca4238a0b923820dcc509a6f75849b',1,0,NULL,NULL,'2022-02-15 08:35:34',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vats`
--

LOCK TABLES `vats` WRITE;
/*!40000 ALTER TABLE `vats` DISABLE KEYS */;
INSERT INTO `vats` VALUES (1,'13%',0.13,1.13,'ΜΕΙΩΜΕΝΟΣ ΣΥΝΤΕΛΕΣΤΗΣ','2021-11-18 20:37:00',0,NULL,1),(2,'24%',0.24,1.24,'ΚΑΝΟΝΙΚΟΣ ΣΥΝΤΕΛΕΣΤΗΣ','2021-11-18 20:37:00',0,NULL,2),(3,'6%',0.06,1.06,'ΥΠΕΡΜΕΙΩΜΕΝΟΣ ΣΥΝΤΕΛΕΣΤΗΣ','2021-11-18 20:37:00',0,NULL,3);
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

-- Dump completed on 2022-03-19 22:41:33
