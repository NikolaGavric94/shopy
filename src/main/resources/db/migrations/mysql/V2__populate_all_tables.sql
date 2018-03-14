# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Database: shopy
# Generation Time: 2018-03-11 02:18:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table brands
# ------------------------------------------------------------

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`brand_id`, `code`, `name`)
VALUES
	(1,'AD','Addidas'),
	(2,'RB','Reebok'),
	(3,'NK','Nike'),
	(4,'AC','Active');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`category_id`, `code`, `name`)
VALUES
	(1,'M','Male'),
	(2,'F','Female'),
	(3,'C','Children');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table colors
# ------------------------------------------------------------

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;

INSERT INTO `colors` (`color_id`, `code`, `name`)
VALUES
	(1,'#0000FF','Blue'),
	(2,'#FF0000','Red'),
	(3,'#008000','Green'),
	(4,'#FFA500','Orange'),
	(5,'#800080','Purple');

/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_color
# ------------------------------------------------------------

LOCK TABLES `product_color` WRITE;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;

INSERT INTO `product_color` (`product_id`, `color_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(2,5),
	(3,1),
	(3,2),
	(3,3),
	(3,4),
	(3,5),
	(4,1),
	(4,2),
	(4,3),
	(4,4),
	(4,5),
	(5,1),
	(5,2),
	(5,3),
	(5,4),
	(5,5),
	(6,1),
	(6,2),
	(6,3),
	(6,4),
	(6,5),
	(7,1),
	(7,2),
	(7,3),
	(7,4),
	(7,5),
	(8,1),
	(8,2),
	(8,3),
	(8,4),
	(8,5),
	(9,1),
	(9,2),
	(9,3),
	(9,4),
	(9,5),
	(10,1),
	(10,2),
	(10,3),
	(10,4),
	(10,5),
	(11,1),
	(11,2),
	(11,3),
	(11,4),
	(12,1),
	(12,2),
	(12,3),
	(12,4),
	(13,1),
	(13,2),
	(13,3),
	(13,4),
	(14,1),
	(14,2),
	(14,3),
	(14,4),
	(15,1),
	(15,2),
	(15,3),
	(15,4),
	(16,1),
	(16,2),
	(16,3),
	(16,4),
	(17,1),
	(17,2),
	(17,3),
	(17,4),
	(18,1),
	(18,2),
	(18,3),
	(18,4),
	(19,1),
	(19,2),
	(19,3),
	(19,4),
	(20,1),
	(20,2),
	(20,3),
	(20,4),
	(21,1),
	(21,2),
	(21,3),
	(21,4),
	(22,1),
	(22,2),
	(22,3),
	(22,4),
	(23,1),
	(23,2),
	(23,3),
	(23,4);

/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_size
# ------------------------------------------------------------

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;

INSERT INTO `product_size` (`product_id`, `size_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(3,1),
	(3,2),
	(3,3),
	(3,4),
	(4,1),
	(4,2),
	(4,3),
	(4,4),
	(5,1),
	(5,2),
	(5,3),
	(5,4),
	(6,1),
	(6,2),
	(6,3),
	(6,4),
	(7,1),
	(7,2),
	(7,3),
	(7,4),
	(8,1),
	(8,2),
	(8,3),
	(8,4),
	(9,1),
	(9,2),
	(9,3),
	(9,4),
	(10,1),
	(10,2),
	(10,3),
	(10,4),
	(11,1),
	(11,2),
	(11,3),
	(11,4),
	(12,1),
	(12,2),
	(12,3),
	(12,4),
	(13,1),
	(13,2),
	(13,3),
	(13,4),
	(14,1),
	(14,2),
	(14,3),
	(14,4),
	(15,1),
	(15,2),
	(15,3),
	(15,4),
	(16,1),
	(16,2),
	(16,3),
	(16,4),
	(17,1),
	(17,2),
	(17,3),
	(17,4),
	(18,1),
	(18,2),
	(18,3),
	(18,4),
	(19,1),
	(19,2),
	(19,3),
	(19,4),
	(20,1),
	(20,2),
	(20,3),
	(20,4),
	(21,1),
	(21,2),
	(21,3),
	(21,4),
	(22,1),
	(22,2),
	(22,3),
	(22,4),
	(23,1),
	(23,2),
	(23,3),
	(23,4);

/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`product_id`, `code`, `image_url`, `hot_deal`, `name`, `price`, `brand_brand_id`, `category_category_id`)
VALUES
	(1,'#AB901912','http://via.placeholder.com/1280x1280',b'0','Track Jacket',720,2,1),
	(2,'#AB901913','http://via.placeholder.com/1280x1280',b'1','Track Jacket',25,1,2),
	(3,'#AB901914','http://via.placeholder.com/1280x1280',b'0','Track Jacket',450,3,3),
	(4,'#AB901915','http://via.placeholder.com/1280x1280',b'0','Track Jacket',350,4,1),
	(5,'#AB901916','http://via.placeholder.com/1280x1280',b'0','Jacket',245,2,1),
	(6,'#AB901917','http://via.placeholder.com/1280x1280',b'0','Jacket',250.25,1,1),
	(7,'#AB901918','http://via.placeholder.com/1280x1280',b'0','Jacket',122.22,3,2),
	(8,'#AB901919','http://via.placeholder.com/1280x1280',b'0','Jacket',101.01,4,1),
	(9,'#AB901920','http://via.placeholder.com/1280x1280',b'0','T-Shirt',99.12,2,2),
	(10,'#AB901921','http://via.placeholder.com/1280x1280',b'0','T-Shirt',652,1,2),
	(11,'#AB901922','http://via.placeholder.com/1280x1280',b'0','T-Shirt',522,3,1),
	(12,'#AB901923','http://via.placeholder.com/1280x1280',b'1','T-Shirt',325.87,4,3),
	(13,'#AB901924','http://via.placeholder.com/1280x1280',b'0','Shoes',300,2,1),
	(14,'#AB901925','http://via.placeholder.com/1280x1280',b'0','Shoes',200,1,2),
	(15,'#AB901926','http://via.placeholder.com/1280x1280',b'0','Shoes',100,3,2),
	(16,'#AB901927','http://via.placeholder.com/1280x1280',b'0','Shoes',750.98,4,1),
	(17,'#AB901928','http://via.placeholder.com/1280x1280',b'0','Shirt',679,2,3),
	(18,'#AB901929','http://via.placeholder.com/1280x1280',b'0','Shirt',490,1,3),
	(19,'#AB901930','http://via.placeholder.com/1280x1280',b'1','Shirt',329.54,3,1),
	(20,'#AB901931','http://via.placeholder.com/1280x1280',b'0','Shirt',672.08,4,2),
	(21,'#AB901932','http://via.placeholder.com/1280x1280',b'0','Sweater',48.92,2,2),
	(22,'#AB901933','http://via.placeholder.com/1280x1280',b'0','Sweater',24.52,1,2),
	(23,'#AB901934','http://via.placeholder.com/1280x1280',b'1','Sweater',811,3,2),
	(24,'#AB901935','http://via.placeholder.com/1280x1280',b'0','Sweater',856.87,4,3);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sizes
# ------------------------------------------------------------

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;

INSERT INTO `sizes` (`size_id`, `code`, `name`)
VALUES
	(1,'S','Small'),
	(2,'M','Medium'),
	(3,'L','Large'),
	(4,'XL','X Large');

/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`user_id`, `password`, `username`)
VALUES
	(1,'$2a$10$KLINEm1DBAkYRY/nnoSCc.VN6jl8hoiqyJm6rkeyhGwV8Kwu/fVUi','nikola');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
