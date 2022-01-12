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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
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
INSERT INTO `documents` VALUES (1,'ΑΠΟΔΕΙΞΗ ΛΙΑΝΙΚΗΣ ΠΩΛΗΣΗΣ',0),(2,'ΤΙΜΟΛΟΓΙΟ',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ADMIN','ADMIN','c4ca4238a0b923820dcc509a6f75849b',2,0,'2022-01-12 10:05:32','2022-01-12 17:48:50',NULL,NULL),(2,'TAMEIO','TAMEIO','c4ca4238a0b923820dcc509a6f75849b',1,0,'2022-01-12 21:48:53','2022-01-07 19:45:58',NULL,NULL);
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

-- Dump completed on 2022-01-12 21:55:11
