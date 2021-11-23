-- --------------------------------------------------------
-- Διακομιστής:                  127.0.0.1
-- Έκδοση διακομιστή:            5.7.36 - MySQL Community Server (GPL)
-- Λειτ. σύστημα διακομιστή:     Linux
-- HeidiSQL Έκδοση:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for hippos
CREATE DATABASE IF NOT EXISTS `hippos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hippos`;

-- Dumping structure for πίνακας hippos.companies
CREATE TABLE IF NOT EXISTS `companies` (
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

-- Dumping data for table hippos.companies: 0 rows
DELETE FROM `companies`;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.customers
CREATE TABLE IF NOT EXISTS `customers` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.customers: ~2 rows (approximately)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`customer_id`, `customer_fullname`, `customer_phone`, `customer_branch`, `customer_address`, `customer_address_number`, `customer_area`, `customer_vat_number`, `customer_tax_office`, `customer_postal_code`, `customer_bussiness`, `customer_load`, `customer_destination`, `customer_date_created`) VALUES
	(1, 'ΚΑΛΟΝΙΑΤΗ  ΚΑΛΛΙΟΠΗ ΓΕΩΡΓΙΟΣ', '', 0, 'Γ ΓΕΝΝΗΜΑΤΑ', '62       ', 'ΓΛΥΦΑΔΑ', '045178749', 'ΓΛΥΦΑΔΑΣ', '16562', 'ΥΠΗΡΕΣΙΕΣ ΜΗΧΑΝΙΚΩΝ ΓΙΑ ΟΙΚΟΔΟΜΙΚΑ ΕΡΓΑ', 'ΕΔΡΑ ΜΑΣ', 'ΕΔΡΑ ΤΟΥΣ', '2021-11-21 08:51:59'),
	(2, 'ΝΓ ΕΠΕΝΔΥΤΙΚΗ ΜΟΝΟΠΡΟΣΩΠΗ Ι Κ Ε', '6906409560', 0, 'ΓΡΗΓΟΡΙΟΥ ΖΩΓΚΟΥ', '12       ', 'ΖΩΓΡΑΦΟΥ', '800890670', 'ΙΒ ΑΘΗΝΩΝ', '15773', 'ΥΠΗΡΕΣΙΕΣ ΠΑΡΑΧΩΡΗΣΗΣ ΠΡΟΝΟΜΙΟΥ FRANCHISE ΚΑΙ ΠΑΡΟΧΗΣ ΣΧΕΤΙΚΩΝ ΣΥΜΒΟΥΛΩΝ', 'ΕΔΡΑ ΜΑΣ', 'ΕΔΡΑ ΤΟΥΣ', '2021-11-21 09:00:25');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.day_closure
CREATE TABLE IF NOT EXISTS `day_closure` (
  `day_closure_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_closure_datetime` datetime NOT NULL,
  PRIMARY KEY (`day_closure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.day_closure: ~1 rows (approximately)
DELETE FROM `day_closure`;
/*!40000 ALTER TABLE `day_closure` DISABLE KEYS */;
INSERT INTO `day_closure` (`day_closure_id`, `day_closure_datetime`) VALUES
	(1, '2000-11-19 21:25:24');
/*!40000 ALTER TABLE `day_closure` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.documents
CREATE TABLE IF NOT EXISTS `documents` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `document_number` int(11) NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.documents: ~0 rows (approximately)
DELETE FROM `documents`;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` (`document_id`, `document_name`, `document_number`) VALUES
	(1, 'ΑΠΟΔΕΙΞΗ ΛΙΑΝΙΚΗΣ ΠΩΛΗΣΗΣ', 68);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.orders
CREATE TABLE IF NOT EXISTS `orders` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.orders: ~34 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`, `order_document_number`, `order_document_type`, `order_mark`, `order_user_id`, `order_customer_id`, `order_quantity`, `order_subtotal`, `order_discount`, `order_total`, `order_payment_method`, `order_date_created`) VALUES
	(1, 34, 1, NULL, 8, NULL, 6, 12, 6, 6, 'cash', '2021-11-19 21:25:24'),
	(2, 35, 1, NULL, 8, NULL, 5, 10, 0.6, 9.4, 'cash', '2021-11-19 21:34:23'),
	(3, 36, 1, NULL, 8, NULL, 4, 8, 1.6, 6.4, 'cash', '2021-11-19 21:35:56'),
	(4, 37, 1, NULL, 8, NULL, 7, 21.6, 4.4, 17.2, 'cash', '2021-11-19 21:36:43'),
	(5, 38, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 22:41:28'),
	(6, 39, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 22:45:34'),
	(7, 40, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 22:45:48'),
	(8, 41, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 22:46:01'),
	(9, 42, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 22:46:41'),
	(10, 43, 1, NULL, 8, NULL, 6, 12, 6, 6, 'cash', '2021-11-19 22:47:40'),
	(11, 44, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 22:48:05'),
	(12, 45, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 22:48:35'),
	(13, 46, 1, NULL, 8, NULL, 1, 2, 0, 2, 'cash', '2021-11-19 22:48:47'),
	(14, 47, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 23:00:56'),
	(15, 48, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 23:02:09'),
	(16, 49, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-19 23:02:19'),
	(17, 50, 1, NULL, 8, NULL, 1, 1000, 0, 1000, 'cash', '2021-11-19 23:02:50'),
	(18, 51, 1, NULL, 8, NULL, 1, 1000, 0, 1000, 'cash', '2021-11-19 23:03:34'),
	(19, 52, 1, NULL, 8, NULL, 1, 5, 0, 5, 'cash', '2021-11-19 23:03:41'),
	(20, 53, 1, NULL, 8, NULL, 1, 5, 0, 5, 'cash', '2021-11-19 23:04:06'),
	(21, 54, 1, NULL, 8, NULL, 1, 2, 0, 2, 'cash', '2021-11-20 09:49:36'),
	(22, 55, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-20 09:50:16'),
	(23, 56, 1, NULL, 8, NULL, 1, 15, 0, 15, 'cash', '2021-11-20 09:50:21'),
	(24, 57, 1, NULL, 8, NULL, 1, 1.1, 0, 1.1, 'cash', '2021-11-20 09:51:25'),
	(25, 58, 1, NULL, 8, NULL, 1, 0.25, 0, 0.25, 'cash', '2021-11-20 09:51:37'),
	(26, 59, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-20 09:52:44'),
	(27, 60, 1, NULL, 8, NULL, 1, 50, 0, 50, 'cash', '2021-11-20 09:52:48'),
	(28, 61, 1, NULL, 8, NULL, 3, 150.05, 0, 150.05, 'cash', '2021-11-20 09:52:59'),
	(29, 62, 1, NULL, 8, NULL, 1, 0.08, 0, 0.08, 'card', '2021-11-20 09:53:15'),
	(30, 63, 1, NULL, 8, NULL, 1, 1.7, 0, 1.7, 'cash', '2021-11-20 09:59:42'),
	(31, 64, 1, NULL, 8, NULL, 1, 1.7, 0, 1.7, 'cash', '2021-11-20 10:00:43'),
	(32, 65, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-20 10:02:30'),
	(33, 66, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-20 10:12:17'),
	(34, 67, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-20 10:12:50'),
	(35, 68, 1, NULL, 8, NULL, 1, 1, 0, 1, 'cash', '2021-11-20 10:13:33');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.order_products
CREATE TABLE IF NOT EXISTS `order_products` (
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.order_products: ~39 rows (approximately)
DELETE FROM `order_products`;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` (`order_product_id`, `order_product_order_id`, `order_product_product_id`, `order_product_name`, `order_product_quantity`, `order_product_price`, `order_product_vat_id`, `order_product_subtotal`, `order_product_discount`, `order_product_total`, `order_product_date_created`) VALUES
	(1, 1, 1, 'ΕΙΔΟΣ 13%', 6, 2, 1, 12, 1, 11, '2021-11-19 21:25:24'),
	(2, 2, 1, 'ΕΙΔΟΣ 13%', 3, 2, 1, 6, 0.2, 5.8, '2021-11-19 21:34:23'),
	(3, 2, 1, 'ΕΙΔΟΣ 13%', 1, 3, 1, 3, 0, 3, '2021-11-19 21:34:23'),
	(4, 2, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 21:34:23'),
	(5, 3, 1, 'ΕΙΔΟΣ 13%', 4, 2, 1, 8, 0.4, 6.4, '2021-11-19 21:35:56'),
	(6, 4, 1, 'ΕΙΔΟΣ 13%', 1, 3.6, 1, 3.6, 0, 3.6, '2021-11-19 21:36:43'),
	(7, 4, 1, 'ΕΙΔΟΣ 13%', 2, 5, 1, 10, 1, 8, '2021-11-19 21:36:43'),
	(8, 4, 1, 'ΕΙΔΟΣ 13%', 4, 2, 1, 8, 0.6, 5.6, '2021-11-19 21:36:43'),
	(9, 5, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 22:41:28'),
	(10, 6, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 22:45:34'),
	(11, 7, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 22:45:48'),
	(12, 8, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 22:46:01'),
	(13, 9, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 22:46:41'),
	(14, 10, 1, 'ΕΙΔΟΣ 13%', 6, 2, 1, 12, 1, 6, '2021-11-19 22:47:40'),
	(15, 11, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 22:48:05'),
	(16, 12, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 22:48:35'),
	(17, 13, 1, 'ΕΙΔΟΣ 13%', 1, 2, 1, 2, 0, 2, '2021-11-19 22:48:47'),
	(18, 14, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 23:00:56'),
	(19, 15, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 23:02:09'),
	(20, 16, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-19 23:02:19'),
	(21, 17, 1, 'ΕΙΔΟΣ 13%', 1, 1000, 1, 1000, 0, 1000, '2021-11-19 23:02:50'),
	(22, 18, 1, 'ΕΙΔΟΣ 13%', 1, 1000, 1, 1000, 0, 1000, '2021-11-19 23:03:34'),
	(23, 19, 1, 'ΕΙΔΟΣ 13%', 1, 5, 1, 5, 0, 5, '2021-11-19 23:03:41'),
	(24, 20, 1, 'ΕΙΔΟΣ 13%', 1, 5, 1, 5, 0, 5, '2021-11-19 23:04:06'),
	(25, 21, 1, 'ΕΙΔΟΣ 13%', 1, 2, 1, 2, 0, 2, '2021-11-20 09:49:36'),
	(26, 22, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-20 09:50:16'),
	(27, 23, 1, 'ΕΙΔΟΣ 13%', 1, 15, 1, 15, 0, 15, '2021-11-20 09:50:21'),
	(28, 24, 1, 'ΕΙΔΟΣ 13%', 1, 1.1, 1, 1.1, 0, 1.1, '2021-11-20 09:51:25'),
	(29, 25, 1, 'ΕΙΔΟΣ 13%', 1, 0.25, 1, 0.25, 0, 0.25, '2021-11-20 09:51:37'),
	(30, 26, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-20 09:52:44'),
	(31, 27, 1, 'ΕΙΔΟΣ 13%', 1, 50, 1, 50, 0, 50, '2021-11-20 09:52:48'),
	(32, 28, 1, 'ΕΙΔΟΣ 13%', 1, 0.05, 1, 0.05, 0, 0.05, '2021-11-20 09:52:59'),
	(33, 28, 1, 'ΕΙΔΟΣ 13%', 1, 60, 1, 60, 0, 60, '2021-11-20 09:52:59'),
	(34, 28, 1, 'ΕΙΔΟΣ 13%', 1, 90, 1, 90, 0, 90, '2021-11-20 09:52:59'),
	(35, 29, 1, 'ΕΙΔΟΣ 13%', 1, 0.08, 1, 0.08, 0, 0.08, '2021-11-20 09:53:15'),
	(36, 30, 1, 'ΕΙΔΟΣ 13%', 1, 1.7, 1, 1.7, 0, 1.7, '2021-11-20 09:59:42'),
	(37, 31, 1, 'ΕΙΔΟΣ 13%', 1, 1.7, 1, 1.7, 0, 1.7, '2021-11-20 10:00:43'),
	(38, 32, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-20 10:02:30'),
	(39, 33, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-20 10:12:17'),
	(40, 34, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-20 10:12:50'),
	(41, 35, 1, 'ΕΙΔΟΣ 13%', 1, 1, 1, 1, 0, 1, '2021-11-20 10:13:33');
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.products: ~1 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`product_id`, `product_name`, `product_free_price`, `product_price`, `product_vat_id`, `product_vat_percent`, `product_font_size`, `product_color`, `product_order`, `product_date_created`, `product_deleted`, `product_date_deleted`) VALUES
	(1, 'ΕΙΔΟΣ 13%', 1, 0, 1, '13%', 15, '', 0, '2021-11-18 20:37:00', 0, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.users
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table hippos.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `user_fullname`, `user_name`, `user_password`, `user_role_id`, `user_deleted`, `user_last_login`, `user_last_logout`, `user_date_created`, `user_date_deleted`) VALUES
	(8, 'TAMEIO', 'TAMEIO', 'c4ca4238a0b923820dcc509a6f75849b', 1, 0, '2021-11-21 08:33:49', NULL, NULL, NULL),
	(9, 'ADMIN', 'ADMIN', 'c4ca4238a0b923820dcc509a6f75849b', 2, 0, '2021-11-21 09:42:29', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table hippos.user_roles: ~2 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_role_id`, `user_role_name`) VALUES
	(1, 'ΤΑΜΕΙΑΣ'),
	(2, 'ΔΙΑΧΕΙΡΙΣΤΗΣ');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.vats
CREATE TABLE IF NOT EXISTS `vats` (
  `vat_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_percent` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vat_decimal` double DEFAULT NULL,
  `vat_decimal_full` double DEFAULT NULL,
  `vat_description` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `vat_date_created` datetime DEFAULT NULL,
  `vat_deleted` tinyint(1) DEFAULT '0',
  `vat_date_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`vat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.vats: ~2 rows (approximately)
DELETE FROM `vats`;
/*!40000 ALTER TABLE `vats` DISABLE KEYS */;
INSERT INTO `vats` (`vat_id`, `vat_percent`, `vat_decimal`, `vat_decimal_full`, `vat_description`, `vat_date_created`, `vat_deleted`, `vat_date_deleted`) VALUES
	(1, '13%', 0.13, 1.13, 'ΧΑΜΗΛΟΣ ΦΠΑ', '2021-11-18 20:37:00', 0, NULL),
	(2, '24%', 0.24, 1.24, 'ΥΨΗΛΟΣ ΦΠΑ', '2021-11-18 20:37:00', 0, NULL);
/*!40000 ALTER TABLE `vats` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
