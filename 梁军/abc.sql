-- MySQL dump 10.10
--
-- Host: localhost    Database: xuetu
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

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
-- Table structure for table `agreement`
--

DROP TABLE IF EXISTS `agreement`;
CREATE TABLE `agreement` (
  `agr_id` int(11) NOT NULL auto_increment,
  `ans_id` int(11) default NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY  (`agr_id`),
  KEY `FK_Reference_20` (`ans_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`ans_id`) REFERENCES `answer` (`ans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `agreement`
--

LOCK TABLES `agreement` WRITE;
/*!40000 ALTER TABLE `agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `ans_id` int(11) NOT NULL auto_increment,
  `ques_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `ans_text` varchar(1000) NOT NULL,
  `ans_ima` varchar(50) default NULL,
  `ans_time` date NOT NULL,
  PRIMARY KEY  (`ans_id`),
  KEY `FK_Reference_21` (`ques_id`),
  KEY `FK_Reference_22` (`stu_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `cls_id` int(11) NOT NULL auto_increment,
  `cls_name` varchar(60) NOT NULL,
  `cls_week` int(11) NOT NULL,
  `cls_few` int(11) NOT NULL,
  `cls_room` varchar(30) NOT NULL,
  PRIMARY KEY  (`cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectionquestion`
--

DROP TABLE IF EXISTS `collectionquestion`;
CREATE TABLE `collectionquestion` (
  `coqu_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) default NULL,
  `ques_id` int(11) NOT NULL,
  PRIMARY KEY  (`coqu_id`),
  KEY `FK_Relationship_7` (`stu_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `collectionquestion`
--

LOCK TABLES `collectionquestion` WRITE;
/*!40000 ALTER TABLE `collectionquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectionquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countdown`
--

DROP TABLE IF EXISTS `countdown`;
CREATE TABLE `countdown` (
  `codo_id` int(11) NOT NULL auto_increment,
  `code_time` date default NULL,
  `codo_text` varchar(100) default NULL,
  PRIMARY KEY  (`codo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `countdown`
--

LOCK TABLES `countdown` WRITE;
/*!40000 ALTER TABLE `countdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `cou_id` int(11) NOT NULL auto_increment,
  `sto_id` int(11) default NULL,
  `cou_info` varchar(500) NOT NULL,
  `cou_num` int(11) NOT NULL,
  `cou_Validity` date NOT NULL,
  `cou_redeem_points` int(11) NOT NULL,
  PRIMARY KEY  (`cou_id`),
  KEY `FK_Reference_18` (`sto_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`sto_id`) REFERENCES `storename` (`sto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courselist`
--

DROP TABLE IF EXISTS `courselist`;
CREATE TABLE `courselist` (
  `coul_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) default NULL,
  `cls_id` int(11) default NULL,
  PRIMARY KEY  (`coul_id`),
  KEY `FK_Relationship_22` (`stu_id`),
  KEY `FK_Relationship_23` (`cls_id`),
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`cls_id`) REFERENCES `class` (`cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `courselist`
--

LOCK TABLES `courselist` WRITE;
/*!40000 ALTER TABLE `courselist` DISABLE KEYS */;
/*!40000 ALTER TABLE `courselist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritescoupons`
--

DROP TABLE IF EXISTS `favoritescoupons`;
CREATE TABLE `favoritescoupons` (
  `faco_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) default NULL,
  `cou_id` int(11) NOT NULL,
  PRIMARY KEY  (`faco_id`),
  KEY `FK_Relationship_13` (`stu_id`),
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `favoritescoupons`
--

LOCK TABLES `favoritescoupons` WRITE;
/*!40000 ALTER TABLE `favoritescoupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritescoupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mycoupon`
--

DROP TABLE IF EXISTS `mycoupon`;
CREATE TABLE `mycoupon` (
  `mycou_id` int(11) NOT NULL auto_increment,
  `usta_id` int(11) default NULL,
  `cou_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `mycou_exchange_time` date NOT NULL,
  PRIMARY KEY  (`mycou_id`),
  KEY `FK_Reference_17` (`cou_id`),
  KEY `FK_Relationship_2` (`stu_id`),
  KEY `FK_Relationship_4` (`usta_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`cou_id`) REFERENCES `coupon` (`cou_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`usta_id`) REFERENCES `userstate` (`usta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `mycoupon`
--

LOCK TABLES `mycoupon` WRITE;
/*!40000 ALTER TABLE `mycoupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mycoupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pattern`
--

DROP TABLE IF EXISTS `pattern`;
CREATE TABLE `pattern` (
  `pattern_id` int(11) NOT NULL auto_increment,
  `pattern_text` varchar(300) NOT NULL,
  PRIMARY KEY  (`pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `pattern`
--

LOCK TABLES `pattern` WRITE;
/*!40000 ALTER TABLE `pattern` DISABLE KEYS */;
/*!40000 ALTER TABLE `pattern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `ques_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) default NULL,
  `ans_text` varchar(1000) NOT NULL,
  `ques_img` varchar(50) default NULL,
  `ques_time` date NOT NULL,
  PRIMARY KEY  (`ques_id`),
  KEY `FK_Relationship_19` (`stu_id`),
  CONSTRAINT `FK_Relationship_19` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `sch_id` int(11) NOT NULL auto_increment,
  `sch_name` varchar(20) NOT NULL,
  `sch_longitude` varchar(60) NOT NULL,
  `sch_latitude` varchar(60) NOT NULL,
  PRIMARY KEY  (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selfstudyplan`
--

DROP TABLE IF EXISTS `selfstudyplan`;
CREATE TABLE `selfstudyplan` (
  `plan_id` int(11) NOT NULL auto_increment,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `plan_text` varchar(300) NOT NULL,
  `plan_remind` int(11) NOT NULL,
  `pattern_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `plan_date` date NOT NULL,
  PRIMARY KEY  (`plan_id`),
  KEY `FK_Relationship_1` (`pattern_id`),
  KEY `FK_Relationship_20` (`stu_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`pattern_id`),
  CONSTRAINT `FK_Relationship_20` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `selfstudyplan`
--

LOCK TABLES `selfstudyplan` WRITE;
/*!40000 ALTER TABLE `selfstudyplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `selfstudyplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping`
--

DROP TABLE IF EXISTS `shopping`;
CREATE TABLE `shopping` (
  `shopID` int(11) NOT NULL auto_increment,
  `cou_id` int(11) default NULL,
  PRIMARY KEY  (`shopID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `shopping`
--

LOCK TABLES `shopping` WRITE;
/*!40000 ALTER TABLE `shopping` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storename`
--

DROP TABLE IF EXISTS `storename`;
CREATE TABLE `storename` (
  `sto_id` int(11) NOT NULL auto_increment,
  `sto_user_name` varchar(20) NOT NULL,
  `sto_tel` varchar(15) default NULL,
  `sto_address` varchar(50) NOT NULL,
  `sto_name` varchar(20) NOT NULL,
  `sto_introduction` varchar(500) NOT NULL,
  `sto_img` varchar(50) default NULL,
  `sto_pwd` varchar(20) NOT NULL,
  PRIMARY KEY  (`sto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `storename`
--

LOCK TABLES `storename` WRITE;
/*!40000 ALTER TABLE `storename` DISABLE KEYS */;
/*!40000 ALTER TABLE `storename` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL auto_increment,
  `stu_name` varchar(20) NOT NULL,
  `stu_email` varchar(60) NOT NULL,
  `stu_phone` varchar(14) NOT NULL,
  `stu_img` varchar(50) default NULL,
  `stu_sex` varchar(2) default NULL,
  `stu_age` int(11) default NULL,
  `stu_ugrade` varchar(5) NOT NULL,
  `stu_major` varchar(10) NOT NULL,
  `stu_signer` varchar(500) default NULL,
  `stu_points` int(11) NOT NULL,
  `sch_id` int(11) default NULL,
  `stu_pwd` varchar(20) default NULL,
  PRIMARY KEY  (`stu_id`),
  KEY `FK_Relationship_14` (`sch_id`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`sch_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studytime`
--

DROP TABLE IF EXISTS `studytime`;
CREATE TABLE `studytime` (
  `st_id` int(11) NOT NULL auto_increment,
  `st_date` date NOT NULL,
  `sto_time` int(50) default NULL,
  `stu_id` int(11) default NULL,
  PRIMARY KEY  (`st_id`),
  KEY `FK_Reference_16` (`stu_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `studytime`
--

LOCK TABLES `studytime` WRITE;
/*!40000 ALTER TABLE `studytime` DISABLE KEYS */;
/*!40000 ALTER TABLE `studytime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstate`
--

DROP TABLE IF EXISTS `userstate`;
CREATE TABLE `userstate` (
  `usta_id` int(11) NOT NULL auto_increment,
  `usta_name` varchar(10) default NULL,
  PRIMARY KEY  (`usta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `userstate`
--

LOCK TABLES `userstate` WRITE;
/*!40000 ALTER TABLE `userstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `userstate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-20  5:46:22
