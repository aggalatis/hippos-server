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
DROP DATABASE IF EXISTS `hippos`;
CREATE DATABASE IF NOT EXISTS `hippos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hippos`;

-- Dumping structure for πίνακας hippos.companies
DROP TABLE IF EXISTS `companies`;
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
DROP TABLE IF EXISTS `customers`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.customers: ~0 rows (approximately)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.day_closure
DROP TABLE IF EXISTS `day_closure`;
CREATE TABLE IF NOT EXISTS `day_closure` (
  `day_closure_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_closure_datetime` datetime NOT NULL,
  PRIMARY KEY (`day_closure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.day_closure: ~1 rows (approximately)
DELETE FROM `day_closure`;
/*!40000 ALTER TABLE `day_closure` DISABLE KEYS */;
INSERT INTO `day_closure` (`day_closure_id`, `day_closure_datetime`) VALUES
	(1, '2000-10-20 00:01:00');
/*!40000 ALTER TABLE `day_closure` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.documents
DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `document_number` int(11) NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.documents: ~1 rows (approximately)
DELETE FROM `documents`;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` (`document_id`, `document_name`, `document_number`) VALUES
	(1, 'ΑΠΟΔΕΙΞΗ ΛΙΑΝΙΚΗΣ ΠΩΛΗΣΗΣ', 0),
	(2, 'ΤΙΜΟΛΟΓΙΟ', 0);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.orders
DROP TABLE IF EXISTS `orders`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.order_products
DROP TABLE IF EXISTS `order_products`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.order_products: ~0 rows (approximately)
DELETE FROM `order_products`;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.products
DROP TABLE IF EXISTS `products`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hippos.products: ~3 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`product_id`, `product_name`, `product_free_price`, `product_price`, `product_vat_id`, `product_vat_percent`, `product_font_size`, `product_color`, `product_order`, `product_date_created`, `product_deleted`, `product_date_deleted`) VALUES
	(1, 'ΕΙΔΟΣ 13%', 1, 0, 1, '13%', 15, '', 0, '2021-11-18 20:37:00', 0, NULL),
	(2, 'ΕΙΔΟΣ 24%', 1, 0, 2, '24%', 15, NULL, 1, '2021-11-18 20:37:00', 0, NULL),
	(3, 'ΣΑΚΟΥΛΑ', 0, 0.09, 2, '24%', 15, NULL, 2, '2021-11-18 20:37:00', 0, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.users
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table hippos.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `user_fullname`, `user_name`, `user_password`, `user_role_id`, `user_deleted`, `user_last_login`, `user_last_logout`, `user_date_created`, `user_date_deleted`) VALUES
	(1, 'ADMIN', 'ADMIN', 'c4ca4238a0b923820dcc509a6f75849b', 2, 0, NULL, NULL, NULL, NULL),
	(2, 'TAMEIO', 'TAMEIO', 'c4ca4238a0b923820dcc509a6f75849b', 1, 0, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for πίνακας hippos.user_roles
DROP TABLE IF EXISTS `user_roles`;
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
DROP TABLE IF EXISTS `vats`;
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

CREATE USER 'hippos_user'@'localhost' IDENTIFIED BY 'hippos_pass';
GRANT ALL PRIVILEGES ON hippos . * TO 'hippos_user'@'localhost';
FLUSH PRIVILEGES;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
