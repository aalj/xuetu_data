-- MySQL dump 10.13  Distrib 5.6.21, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: xuetu
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `cls_id` int(11) NOT NULL AUTO_INCREMENT,
  `cls_name` varchar(60) NOT NULL,
  `cls_week` int(11) NOT NULL,
  `cls_few` int(11) NOT NULL,
  `cls_room` varchar(30) NOT NULL,
  PRIMARY KEY (`cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `countdown`
--

DROP TABLE IF EXISTS `countdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countdown` (
  `codo_id` int(11) NOT NULL AUTO_INCREMENT,
  `code_time` date DEFAULT NULL,
  `codo_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown`
--

LOCK TABLES `countdown` WRITE;
/*!40000 ALTER TABLE `countdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `pattern`
--

DROP TABLE IF EXISTS `pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pattern` (
  `pattern_id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern_text` varchar(300) NOT NULL,
  PRIMARY KEY (`pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pattern`
--

LOCK TABLES `pattern` WRITE;
/*!40000 ALTER TABLE `pattern` DISABLE KEYS */;
/*!40000 ALTER TABLE `pattern` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(20) NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstate`
--

DROP TABLE IF EXISTS `userstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userstate` (
  `usta_id` int(11) NOT NULL AUTO_INCREMENT,
  `usta_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstate`
--

LOCK TABLES `userstate` WRITE;
/*!40000 ALTER TABLE `userstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `userstate` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `sch_id` int(11) NOT NULL AUTO_INCREMENT,
  `sch_name` varchar(20) NOT NULL,
  `sch_longitude` varchar(60) NOT NULL,
  `sch_latitude` varchar(60) NOT NULL,
  PRIMARY KEY (`sch_id`),
  UNIQUE KEY `sch_name` (`sch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `shopping`
--

DROP TABLE IF EXISTS `shopping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping` (
  `shopID` int(11) NOT NULL AUTO_INCREMENT,
  `cou_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storename` (
  `sto_id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_user_name` varchar(20) NOT NULL,
  `sto_tel` varchar(15) DEFAULT NULL,
  `sto_address` varchar(50) NOT NULL,
  `sto_name` varchar(20) NOT NULL,
  `sto_introduction` varchar(500) NOT NULL,
  `sto_img` varchar(50) DEFAULT NULL,
  `sto_pwd` varchar(20) NOT NULL,
  PRIMARY KEY (`sto_id`),
  UNIQUE KEY `sto_user_name` (`sto_user_name`),
  UNIQUE KEY `sto_tel` (`sto_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storename`
--

LOCK TABLES `storename` WRITE;
/*!40000 ALTER TABLE `storename` DISABLE KEYS */;
INSERT INTO `storename` VALUES (1,'name','13359746517','那条街','顶啊一点','没有东西','xuetuImg/1456651424942-1.jpg','123');
/*!40000 ALTER TABLE `storename` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(20) NOT NULL,
  `stu_email` varchar(60) NOT NULL,
  `stu_phone` varchar(14) NOT NULL,
  `stu_img` varchar(50) DEFAULT NULL,
  `stu_sex` varchar(2) DEFAULT NULL,
  `stu_age` int(11) DEFAULT NULL,
  `stu_ugrade` varchar(5) NOT NULL,
  `stu_major` varchar(10) NOT NULL,
  `stu_signer` varchar(500) DEFAULT NULL,
  `sch_id` int(11) DEFAULT NULL,
  `stu_pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  UNIQUE KEY `stu_email` (`stu_email`),
  UNIQUE KEY `stu_phone` (`stu_phone`),
  UNIQUE KEY `stu_name` (`stu_name`),
  KEY `FK_Relationship_14` (`sch_id`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`sch_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studytime` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_date` date NOT NULL,
  `sto_time` int(50) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `acpo_num` int(11) NOT NULL,
  PRIMARY KEY (`st_id`),
  KEY `FK_Reference_16` (`stu_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studytime`
--

LOCK TABLES `studytime` WRITE;
/*!40000 ALTER TABLE `studytime` DISABLE KEYS */;
/*!40000 ALTER TABLE `studytime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon` (
  `cou_id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_id` int(11) DEFAULT NULL,
  `cou_info` varchar(500) NOT NULL,
  `cou_num` int(11) NOT NULL,
  `cou_Validity` date NOT NULL,
  `cou_redeem_points` int(11) NOT NULL,
  `cou_name` varchar(50) NOT NULL,
  `cou_price` int(2) NOT NULL DEFAULT '10',
  `cou_del` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cou_id`),
  KEY `FK_Reference_18` (`sto_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`sto_id`) REFERENCES `storename` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,1,'大泽',20,'2016-03-25',10,'第一优惠券',9,0);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `ques_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `ques_text` varchar(1000) NOT NULL,
  `ques_img` varchar(50) DEFAULT NULL,
  `ques_time` date NOT NULL,
  `acpo_num` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  PRIMARY KEY (`ques_id`),
  KEY `FK_ques_stu` (`stu_id`),
  KEY `FK_sub_ques` (`sub_id`),
  CONSTRAINT `FK_ques_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_sub_ques` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `ques_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `ans_text` varchar(1000) NOT NULL,
  `ans_ima` varchar(50) DEFAULT NULL,
  `ans_time` date NOT NULL,
  PRIMARY KEY (`ans_id`),
  KEY `FK_Reference_21` (`ques_id`),
  KEY `FK_Reference_22` (`stu_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `collectionquestion`
--

DROP TABLE IF EXISTS `collectionquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionquestion` (
  `coqu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `ques_id` int(11) NOT NULL,
  PRIMARY KEY (`coqu_id`),
  KEY `FK_coqu_stu` (`stu_id`),
  KEY `FK_coqu_ques` (`ques_id`),
  CONSTRAINT `FK_coqu_ques` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`),
  CONSTRAINT `FK_coqu_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectionquestion`
--

LOCK TABLES `collectionquestion` WRITE;
/*!40000 ALTER TABLE `collectionquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectionquestion` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `courselist`
--

DROP TABLE IF EXISTS `courselist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courselist` (
  `coul_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `cls_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`coul_id`),
  KEY `FK_Relationship_22` (`stu_id`),
  KEY `FK_Relationship_23` (`cls_id`),
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`cls_id`) REFERENCES `class` (`cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courselist`
--

LOCK TABLES `courselist` WRITE;
/*!40000 ALTER TABLE `courselist` DISABLE KEYS */;
/*!40000 ALTER TABLE `courselist` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `agreement`
--

DROP TABLE IF EXISTS `agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreement` (
  `agr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ans_id` int(11) DEFAULT NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY (`agr_id`),
  KEY `FK_agr_ans` (`ans_id`),
  KEY `FK_agr_stu` (`stu_id`),
  CONSTRAINT `FK_agr_ans` FOREIGN KEY (`ans_id`) REFERENCES `answer` (`ans_id`),
  CONSTRAINT `FK_agr_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement`
--

LOCK TABLES `agreement` WRITE;
/*!40000 ALTER TABLE `agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `agreement` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `favoritescoupons`
--

DROP TABLE IF EXISTS `favoritescoupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoritescoupons` (
  `faco_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `cou_id` int(11) NOT NULL,
  PRIMARY KEY (`faco_id`),
  KEY `FK_faco_stu` (`stu_id`),
  KEY `FK_faco_cou` (`cou_id`),
  CONSTRAINT `FK_faco_cou` FOREIGN KEY (`cou_id`) REFERENCES `coupon` (`cou_id`),
  CONSTRAINT `FK_faco_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mycoupon` (
  `mycou_id` int(11) NOT NULL AUTO_INCREMENT,
  `usta_id` int(11) DEFAULT NULL,
  `cou_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `mycou_exchange_time` date NOT NULL,
  PRIMARY KEY (`mycou_id`),
  KEY `FK_Reference_17` (`cou_id`),
  KEY `FK_Relationship_2` (`stu_id`),
  KEY `FK_Relationship_4` (`usta_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`cou_id`) REFERENCES `coupon` (`cou_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`usta_id`) REFERENCES `userstate` (`usta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mycoupon`
--

LOCK TABLES `mycoupon` WRITE;
/*!40000 ALTER TABLE `mycoupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mycoupon` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `selfstudyplan`
--

DROP TABLE IF EXISTS `selfstudyplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selfstudyplan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `plan_text` varchar(300) NOT NULL,
  `plan_remind` int(11) NOT NULL,
  `pattern_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `plan_date` date NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `FK_Relationship_1` (`pattern_id`),
  KEY `FK_Relationship_20` (`stu_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`pattern_id`),
  CONSTRAINT `FK_Relationship_20` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selfstudyplan`
--

LOCK TABLES `selfstudyplan` WRITE;
/*!40000 ALTER TABLE `selfstudyplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `selfstudyplan` ENABLE KEYS */;
UNLOCK TABLES;





































/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-29 22:23:42
