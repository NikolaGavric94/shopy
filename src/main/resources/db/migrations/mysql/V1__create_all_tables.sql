# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Database: shopy
# Generation Time: 2018-03-11 02:18:25 +0000
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

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `UKjwckdguv8xkq16jq8tq5k3pn9` (`code`),
  UNIQUE KEY `UKoce3937d2f4mpfqrycbr0l93m` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UKiwylx6fb2dqdw8kfc31vaiiyp` (`code`),
  UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table colors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `colors`;

CREATE TABLE `colors` (
  `color_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `UK6vmj5qtb0urun0ah2mvy18ege` (`code`),
  UNIQUE KEY `UKkfulqa7c70otb7t3uwkgcpy43` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table product_color
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_color`;

CREATE TABLE `product_color` (
  `product_id` bigint(20) NOT NULL,
  `color_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_id`,`color_id`),
  KEY `FKpk6riqswj8f8ldulumm9hmpq` (`color_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table product_size
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_size`;

CREATE TABLE `product_size` (
  `product_id` bigint(20) NOT NULL,
  `size_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_id`,`size_id`),
  KEY `FK1yl8bbmokvonm64131xlscnci` (`size_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `hot_deal` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `brand_brand_id` bigint(20) DEFAULT NULL,
  `category_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `UK57ivhy5aj3qfmdvl6vxdfjs4p` (`code`),
  KEY `FKt4pno3idixynatfosymilx0jn` (`brand_brand_id`),
  KEY `FK5se73bafmlv16jgbdjyepeg0l` (`category_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sizes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sizes`;

CREATE TABLE `sizes` (
  `size_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`size_id`),
  UNIQUE KEY `UKtiy1btcyx8sbf9s1fsa9xeg16` (`code`),
  UNIQUE KEY `UKrmd719hqv99q34v9yfelrkq3v` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
