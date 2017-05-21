-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.24a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dbims
--

CREATE DATABASE IF NOT EXISTS dbims;
USE dbims;

--
-- Definition of table `brandinfo`
--

DROP TABLE IF EXISTS `brandinfo`;
CREATE TABLE `brandinfo` (
  `id` int(11) NOT NULL auto_increment,
  `brandid` varchar(32) NOT NULL,
  `brandname` varchar(100) NOT NULL,
  `description` text,
  `userid` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY  (`brandid`),
  UNIQUE KEY `id` (`id`),
  KEY `user_brand_fk` (`userid`),
  CONSTRAINT `user_brand_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brandinfo`
--

/*!40000 ALTER TABLE `brandinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `brandinfo` ENABLE KEYS */;


--
-- Definition of table `categoryinfo`
--

DROP TABLE IF EXISTS `categoryinfo`;
CREATE TABLE `categoryinfo` (
  `id` int(11) NOT NULL auto_increment,
  `catid` varchar(32) NOT NULL,
  `catname` varchar(150) NOT NULL,
  `description` varchar(100) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY  (`catid`),
  UNIQUE KEY `id` (`id`),
  KEY `user_category_fk` (`userid`),
  CONSTRAINT `user_category_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoryinfo`
--

/*!40000 ALTER TABLE `categoryinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoryinfo` ENABLE KEYS */;


--
-- Definition of table `customerinfo`
--

DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo` (
  `id` int(11) NOT NULL auto_increment,
  `customerid` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) default NULL,
  `phone` varchar(15) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`customerid`),
  UNIQUE KEY `id` (`id`),
  KEY `user_customer_fk` (`userid`),
  CONSTRAINT `user_customer_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customerinfo`
--

/*!40000 ALTER TABLE `customerinfo` DISABLE KEYS */;
INSERT INTO `customerinfo` (`id`,`customerid`,`name`,`address`,`email`,`phone`,`userid`,`created_at`) VALUES 
 (27,'CUS-01','Humayun Kabir Sotun','Gazipur','bdamar@gmail.com','12345678910','kabir','2017-05-01 04:43:11'),
 (30,'CUS-030','Humayun Kabir','DUET,Gazipur','amisotun@gmail.com','01737895733','kabir','2017-05-03 03:14:53'),
 (31,'CUS-031','Baker Hossen','Dhaka','baker@gmail.com','01737895733','kabir','2017-05-03 03:16:38'),
 (32,'CUS-032','Mahbub','Tangail','mahbub@yahoo.com','017952626562','kabir','2017-05-03 03:20:16'),
 (35,'CUS-035','Baker Hossen','Rajshai, Bangladesh','a.noman_69@yahoo.com','12345678765432','kabir','2017-05-03 16:02:20'),
 (37,'CUS-037','Baker Hossen','Noakhali','taimur@gmail.com','2652526525265','kabir','2017-05-03 16:06:37'),
 (44,'CUS-039','Sharmin Sultana','Dhaka,Bangladesh','sharmin@gmail.com','0147895753654','kabir','2017-05-05 02:49:04'),
 (45,'CUS-045','Rubayet Hossain','Barishal','rubayer@gmail.com','01785485852','kabir','2017-05-12 02:05:31'),
 (46,'CUS-046','Murad','Rajshai','murad@gmail.com','01737895733','kabir','2017-05-14 16:15:57'),
 (47,'CUS-047','Munni','Dhaka','munni@gmil.com','01737895733','kabir','2017-05-14 17:57:40');
/*!40000 ALTER TABLE `customerinfo` ENABLE KEYS */;


--
-- Definition of table `entrydamageinfo`
--

DROP TABLE IF EXISTS `entrydamageinfo`;
CREATE TABLE `entrydamageinfo` (
  `id` int(11) NOT NULL auto_increment,
  `damageid` varchar(32) NOT NULL,
  `entryid` varchar(32) NOT NULL,
  `stockid` varchar(32) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text,
  `date` datetime NOT NULL,
  `userid` varchar(32) NOT NULL,
  PRIMARY KEY  (`damageid`),
  UNIQUE KEY `id` (`id`),
  KEY `entryrdamage_stock_fk` (`stockid`),
  KEY `user_entrydamage_fk` (`userid`),
  KEY `entrydamage_entry_fk` (`entryid`),
  CONSTRAINT `entrydamage_entry_fk` FOREIGN KEY (`entryid`) REFERENCES `entryinfo` (`entryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entryrdamage_stock_fk` FOREIGN KEY (`stockid`) REFERENCES `stockinfo` (`stockid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_entrydamage_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrydamageinfo`
--

/*!40000 ALTER TABLE `entrydamageinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrydamageinfo` ENABLE KEYS */;


--
-- Definition of table `entryinfo`
--

DROP TABLE IF EXISTS `entryinfo`;
CREATE TABLE `entryinfo` (
  `id` int(11) NOT NULL auto_increment,
  `entryid` varchar(32) NOT NULL,
  `entrydate` datetime default NULL,
  `invoiceid` varchar(32) NOT NULL,
  `invoicedate` datetime default NULL,
  `supplierId` varchar(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  PRIMARY KEY  (`entryid`),
  UNIQUE KEY `id` (`id`),
  KEY `entry_supplier_fk` (`supplierId`),
  KEY `user_entry_fk` (`userid`),
  CONSTRAINT `entry_supplier_fk` FOREIGN KEY (`supplierId`) REFERENCES `supplierinfo` (`supplierId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_entry_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entryinfo`
--

/*!40000 ALTER TABLE `entryinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `entryinfo` ENABLE KEYS */;


--
-- Definition of table `entryreturninfo`
--

DROP TABLE IF EXISTS `entryreturninfo`;
CREATE TABLE `entryreturninfo` (
  `id` int(11) NOT NULL auto_increment,
  `entryreturnid` varchar(32) NOT NULL,
  `entryid` varchar(32) NOT NULL,
  `stockid` varchar(32) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text,
  `returndate` datetime NOT NULL,
  `userid` varchar(32) NOT NULL,
  PRIMARY KEY  (`entryreturnid`),
  UNIQUE KEY `id` (`id`),
  KEY `user_entryreturn_fk` (`userid`),
  KEY `entryreturn_stock_fk` (`stockid`),
  KEY `entryreturn_entry_fk` (`entryid`),
  CONSTRAINT `entryreturn_entry_fk` FOREIGN KEY (`entryid`) REFERENCES `entryinfo` (`entryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entryreturn_stock_fk` FOREIGN KEY (`stockid`) REFERENCES `stockinfo` (`stockid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_entryreturn_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entryreturninfo`
--

/*!40000 ALTER TABLE `entryreturninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `entryreturninfo` ENABLE KEYS */;


--
-- Definition of table `issueinfo`
--

DROP TABLE IF EXISTS `issueinfo`;
CREATE TABLE `issueinfo` (
  `id` int(11) NOT NULL auto_increment,
  `issueid` varchar(32) NOT NULL,
  `issuedate` datetime NOT NULL,
  `customerid` varchar(32) NOT NULL,
  `brandid` varchar(32) NOT NULL,
  `catid` varchar(32) NOT NULL,
  `stockid` varchar(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `quantity` int(11) NOT NULL,
  `spi` decimal(18,2) NOT NULL,
  `payment` decimal(18,2) NOT NULL,
  `mode` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `description` text,
  PRIMARY KEY  (`issueid`),
  UNIQUE KEY `id` (`id`),
  KEY `issue_customer_fk` (`customerid`),
  KEY `user_issue_fk` (`userid`),
  KEY `issue_brand_fk` (`brandid`),
  KEY `issue_category_fk` (`catid`),
  KEY `issue_stock_fk` (`stockid`),
  CONSTRAINT `issue_brand_fk` FOREIGN KEY (`brandid`) REFERENCES `brandinfo` (`brandid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issue_category_fk` FOREIGN KEY (`catid`) REFERENCES `categoryinfo` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issue_customer_fk` FOREIGN KEY (`customerid`) REFERENCES `customerinfo` (`customerid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issue_stock_fk` FOREIGN KEY (`stockid`) REFERENCES `stockinfo` (`stockid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_issue_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issueinfo`
--

/*!40000 ALTER TABLE `issueinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `issueinfo` ENABLE KEYS */;


--
-- Definition of table `issuereturn`
--

DROP TABLE IF EXISTS `issuereturn`;
CREATE TABLE `issuereturn` (
  `id` int(11) NOT NULL auto_increment,
  `issuereturnid` varchar(32) NOT NULL,
  `issueid` varchar(32) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text,
  `date` datetime NOT NULL,
  `userid` varchar(32) NOT NULL,
  PRIMARY KEY  (`issuereturnid`),
  UNIQUE KEY `id` (`id`),
  KEY `user_issuereturn_fk` (`userid`),
  KEY `issuereturn_issue_fk` (`issueid`),
  CONSTRAINT `issuereturn_issue_fk` FOREIGN KEY (`issueid`) REFERENCES `issueinfo` (`issueid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_issuereturn_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issuereturn`
--

/*!40000 ALTER TABLE `issuereturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuereturn` ENABLE KEYS */;


--
-- Definition of table `stockinfo`
--

DROP TABLE IF EXISTS `stockinfo`;
CREATE TABLE `stockinfo` (
  `id` int(11) NOT NULL auto_increment,
  `stockid` varchar(32) NOT NULL,
  `entryid` varchar(32) NOT NULL,
  `brandid` varchar(32) NOT NULL,
  `catid` varchar(32) NOT NULL,
  `productmodel` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reorderlevel` int(11) NOT NULL,
  `ppi` decimal(18,2) NOT NULL,
  `spi` decimal(18,2) NOT NULL,
  `description` text,
  PRIMARY KEY  (`stockid`),
  UNIQUE KEY `id` (`id`),
  KEY `entry_stock_fk` (`entryid`),
  KEY `entry_brand_fk` (`brandid`),
  KEY `entry_category_fk` (`catid`),
  CONSTRAINT `entry_brand_fk` FOREIGN KEY (`brandid`) REFERENCES `brandinfo` (`brandid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_category_fk` FOREIGN KEY (`catid`) REFERENCES `categoryinfo` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_stock_fk` FOREIGN KEY (`entryid`) REFERENCES `entryinfo` (`entryid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stockinfo`
--

/*!40000 ALTER TABLE `stockinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockinfo` ENABLE KEYS */;


--
-- Definition of table `supplierinfo`
--

DROP TABLE IF EXISTS `supplierinfo`;
CREATE TABLE `supplierinfo` (
  `id` int(11) NOT NULL auto_increment,
  `supplierId` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) default NULL,
  `phone` varchar(15) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY  (`supplierId`),
  UNIQUE KEY `id` (`id`),
  KEY `user_supplier_fk` (`userid`),
  CONSTRAINT `user_supplier_fk` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplierinfo`
--

/*!40000 ALTER TABLE `supplierinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplierinfo` ENABLE KEYS */;


--
-- Definition of table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL auto_increment,
  `userid` varchar(32) NOT NULL,
  `type` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userinfo`
--

/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` (`id`,`userid`,`type`,`password`,`created_at`) VALUES 
 (1,'kabir','1','123456',NULL),
 (2,'rahat','2','rahat',NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
