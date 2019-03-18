CREATE DATABASE  IF NOT EXISTS `test_db`;
USE `test_db`;

DROP TABLE IF EXISTS `table1`;
CREATE TABLE `table1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field1` varchar(45) DEFAULT NULL,
  `field2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `table1` WRITE;
INSERT INTO `table1` VALUES (1,'Value 1','Value field2'),(2,'Text 1','Text field 2');
UNLOCK TABLES;