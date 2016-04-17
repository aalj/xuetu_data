/*
MySQL Data Transfer
Source Host: localhost
Source Database: xuetu
Target Host: localhost
Target Database: xuetu
Date: 2016/4/8 15:38:47
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for agreement
-- ----------------------------
CREATE TABLE `agreement` (
  `agr_id` int(11) NOT NULL auto_increment,
  `ans_id` int(11) NOT NULL,
  `agr_date` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY  (`agr_id`),
  KEY `FK_agr_ans` (`ans_id`),
  KEY `FK_agr_stu` (`stu_id`),
  CONSTRAINT `FK_agr_ans` FOREIGN KEY (`ans_id`) REFERENCES `answer` (`ans_id`),
  CONSTRAINT `FK_agr_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
CREATE TABLE `answer` (
  `ans_id` int(11) NOT NULL auto_increment,
  `ques_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `ans_text` varchar(1000) NOT NULL,
  `ans_ima` varchar(50) default 'no',
  `ans_time` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ans_id`),
  KEY `FK_Reference_21` (`ques_id`),
  KEY `FK_Reference_22` (`stu_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for check_ins
-- ----------------------------
CREATE TABLE `check_ins` (
  `chi_id` int(9) NOT NULL auto_increment,
  `stu_id` int(11) NOT NULL,
  `chi_time` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `chi_is` int(1) NOT NULL,
  PRIMARY KEY  (`chi_id`),
  UNIQUE KEY `chi_time` (`chi_time`),
  KEY `FK_chi_stu` (`stu_id`),
  CONSTRAINT `FK_chi_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class
-- ----------------------------
CREATE TABLE `class` (
  `cls_id` int(11) NOT NULL auto_increment,
  `cls_name` varchar(60) NOT NULL,
  `cls_week` int(11) NOT NULL,
  `cls_few` int(11) NOT NULL,
  `cls_room` varchar(30) NOT NULL,
  PRIMARY KEY  (`cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for collectionquestion
-- ----------------------------
CREATE TABLE `collectionquestion` (
  `coqu_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL,
  `ques_time_collect` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`coqu_id`),
  KEY `FK_coqu_stu` (`stu_id`),
  KEY `FK_coqu_ques` (`ques_id`),
  CONSTRAINT `FK_coqu_ques` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`),
  CONSTRAINT `FK_coqu_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for countdown
-- ----------------------------
CREATE TABLE `countdown` (
  `codo_id` int(11) NOT NULL auto_increment,
  `code_time` date default NULL,
  `codo_text` varchar(100) default NULL,
  PRIMARY KEY  (`codo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
CREATE TABLE `coupon` (
  `cou_id` int(11) NOT NULL auto_increment,
  `sto_id` int(11) default NULL,
  `cou_info` varchar(500) NOT NULL,
  `cou_num` int(11) NOT NULL,
  `cou_Validity` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cou_redeem_points` int(11) NOT NULL,
  `cou_name` varchar(50) NOT NULL,
  `cou_price` int(2) NOT NULL default '10',
  `cou_del` int(1) NOT NULL default '0',
  `cou_create_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `cou_img` varchar(50) default 'xuetuImg/wutu.png',
  PRIMARY KEY  (`cou_id`),
  KEY `FK_Reference_18` (`sto_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`sto_id`) REFERENCES `storename` (`sto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for courselist
-- ----------------------------
CREATE TABLE `courselist` (
  `coul_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) default NULL,
  `cls_id` int(11) default NULL,
  PRIMARY KEY  (`coul_id`),
  KEY `FK_Relationship_22` (`stu_id`),
  KEY `FK_Relationship_23` (`cls_id`),
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`cls_id`) REFERENCES `class` (`cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for favoritescoupons
-- ----------------------------
CREATE TABLE `favoritescoupons` (
  `faco_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) NOT NULL,
  `cou_id` int(11) NOT NULL,
  `cou_date` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`faco_id`),
  KEY `FK_faco_stu` (`stu_id`),
  KEY `FK_faco_cou` (`cou_id`),
  CONSTRAINT `FK_faco_cou` FOREIGN KEY (`cou_id`) REFERENCES `coupon` (`cou_id`),
  CONSTRAINT `FK_faco_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mycoupon
-- ----------------------------
CREATE TABLE `mycoupon` (
  `mycou_id` int(11) NOT NULL auto_increment,
  `usta_id` int(11) default '2',
  `cou_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `mycou_exchange_time` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`mycou_id`),
  KEY `FK_Reference_17` (`cou_id`),
  KEY `FK_Relationship_2` (`stu_id`),
  KEY `FK_Relationship_4` (`usta_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`cou_id`) REFERENCES `coupon` (`cou_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`usta_id`) REFERENCES `userstate` (`usta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pattern
-- ----------------------------
CREATE TABLE `pattern` (
  `pattern_id` int(11) NOT NULL auto_increment,
  `pattern_text` varchar(300) NOT NULL,
  PRIMARY KEY  (`pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for point_num
-- ----------------------------
CREATE TABLE `point_num` (
  `point_id` int(11) NOT NULL auto_increment,
  `imgUrl` varchar(80) default NULL,
  `point_num` int(3) default NULL,
  `point_text` varchar(100) default NULL,
  `point_create_time` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`point_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for question
-- ----------------------------
CREATE TABLE `question` (
  `ques_id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) default NULL,
  `ques_text` varchar(1000) NOT NULL,
  `ques_img` varchar(50) default 'no',
  `ques_time` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `acpo_num` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  PRIMARY KEY  (`ques_id`),
  KEY `FK_ques_stu` (`stu_id`),
  KEY `FK_sub_ques` (`sub_id`),
  CONSTRAINT `FK_ques_stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_sub_ques` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for school
-- ----------------------------
CREATE TABLE `school` (
  `sch_id` int(11) NOT NULL auto_increment,
  `sch_name` varchar(20) NOT NULL,
  `sch_longitude` varchar(60) NOT NULL,
  `sch_latitude` varchar(60) NOT NULL,
  PRIMARY KEY  (`sch_id`),
  UNIQUE KEY `sch_name` (`sch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for selfstudyplan
-- ----------------------------
CREATE TABLE `selfstudyplan` (
  `plan_id` int(11) NOT NULL auto_increment,
  `start_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `plan_text` varchar(300) NOT NULL,
  `plan_remind` int(11) NOT NULL,
  `pattern_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `plan_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `del_flag` int(1) NOT NULL default '0',
  `is_zhixing` int(1) default '0',
  PRIMARY KEY  (`plan_id`),
  KEY `FK_Relationship_1` (`pattern_id`),
  KEY `FK_Relationship_20` (`stu_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`pattern_id`),
  CONSTRAINT `FK_Relationship_20` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shopping
-- ----------------------------
CREATE TABLE `shopping` (
  `shopID` int(11) NOT NULL auto_increment,
  `cou_id` int(11) default NULL,
  PRIMARY KEY  (`shopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storename
-- ----------------------------
CREATE TABLE `storename` (
  `sto_id` int(11) NOT NULL auto_increment,
  `sto_user_name` varchar(20) NOT NULL,
  `sto_tel` varchar(15) default NULL,
  `sto_address` varchar(50) NOT NULL,
  `sto_name` varchar(20) NOT NULL,
  `sto_introduction` varchar(500) NOT NULL,
  `sto_img` varchar(50) default NULL,
  `sto_pwd` varchar(20) NOT NULL,
  `sto_create_date` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`sto_id`),
  UNIQUE KEY `sto_user_name` (`sto_user_name`),
  KEY `sto_tel` (`sto_tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL auto_increment,
  `stu_name` varchar(100) default NULL,
  `stu_email` varchar(60) default NULL,
  `stu_phone` varchar(100) NOT NULL,
  `stu_img` varchar(100) default 'xuetuImg/touxiang.png',
  `stu_sex` varchar(2) default '女',
  `stu_age` int(11) default NULL,
  `stu_ugrade` varchar(5) default NULL,
  `stu_major` varchar(10) default NULL,
  `stu_signer` varchar(500) default NULL,
  `sch_id` int(11) default NULL,
  `stu_pwd` varchar(100) NOT NULL,
  `stu_create_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`stu_id`),
  UNIQUE KEY `stu_phone` (`stu_phone`),
  UNIQUE KEY `stu_name` (`stu_name`),
  KEY `FK_Relationship_14` (`sch_id`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`sch_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for studytime
-- ----------------------------
CREATE TABLE `studytime` (
  `st_id` int(11) NOT NULL auto_increment,
  `st_date` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `sto_time` int(50) default NULL,
  `stu_id` int(11) NOT NULL,
  `acpo_num` int(11) NOT NULL,
  PRIMARY KEY  (`st_id`),
  KEY `FK_Reference_16` (`stu_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
CREATE TABLE `subject` (
  `sub_id` int(11) NOT NULL auto_increment,
  `sub_name` varchar(20) NOT NULL,
  PRIMARY KEY  (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userstate
-- ----------------------------
CREATE TABLE `userstate` (
  `usta_id` int(11) NOT NULL auto_increment,
  `usta_name` varchar(10) default NULL,
  PRIMARY KEY  (`usta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `agreement` VALUES ('88', '187', '2016-04-08 14:07:28', '16');
INSERT INTO `agreement` VALUES ('95', '188', '2016-04-08 14:09:00', '3');
INSERT INTO `agreement` VALUES ('97', '178', '2016-04-08 14:55:13', '16');
INSERT INTO `answer` VALUES ('160', '92', '3', '2', '', '2016-04-08 09:35:43');
INSERT INTO `answer` VALUES ('163', '92', '3', '等于2', '', '2016-04-08 09:39:06');
INSERT INTO `answer` VALUES ('164', '114', '16', '林晨请吃饭呀', '', '2016-04-08 11:54:28');
INSERT INTO `answer` VALUES ('165', '114', '14', '请不请啊！', '', '2016-04-08 11:54:56');
INSERT INTO `answer` VALUES ('166', '114', '46', '林晨喂。请吃饭', '', '2016-04-08 11:55:41');
INSERT INTO `answer` VALUES ('167', '113', '46', 'nothing', '', '2016-04-08 11:56:30');
INSERT INTO `answer` VALUES ('169', '114', '3', '这就是我！', 'xuetuImg/2016_04_08_13_04_11.jpg', '2016-04-08 13:04:41');
INSERT INTO `answer` VALUES ('171', '114', '3', '小气鬼林晨', 'xuetuImg/2016_04_08_13_07_07.jpg', '2016-04-08 13:07:37');
INSERT INTO `answer` VALUES ('173', '113', '3', '回答我的腿', 'xuetuImg/2016_04_08_13_08_05.jpg', '2016-04-08 13:08:25');
INSERT INTO `answer` VALUES ('177', '115', '3', '恩', '', '2016-04-08 13:16:54');
INSERT INTO `answer` VALUES ('178', '115', '3', '嗯嗯', '', '2016-04-08 13:17:10');
INSERT INTO `answer` VALUES ('180', '115', '3', '456', 'xuetuImg/2016_04_08_13_17_03.jpg', '2016-04-08 13:17:25');
INSERT INTO `answer` VALUES ('181', '115', '3', '88888888', 'xuetuImg/2016_04_08_13_19_19.jpg', '2016-04-08 13:19:33');
INSERT INTO `answer` VALUES ('182', '115', '3', '烟花三月下林晨', '', '2016-04-08 13:37:16');
INSERT INTO `answer` VALUES ('183', '115', '16', '桃花潭水深千尺，不及汪伦啪啪啪。', '', '2016-04-08 13:38:36');
INSERT INTO `answer` VALUES ('184', '114', '16', '林晨喂  男神！', '', '2016-04-08 13:38:56');
INSERT INTO `answer` VALUES ('185', '111', '14', '这个林晨知道。', '', '2016-04-08 13:43:23');
INSERT INTO `answer` VALUES ('186', '94', '14', '。。。。', '', '2016-04-08 13:43:37');
INSERT INTO `answer` VALUES ('187', '116', '16', '哦哦哦', '', '2016-04-08 14:07:09');
INSERT INTO `answer` VALUES ('188', '116', '3', '是说你好', '', '2016-04-08 14:08:36');
INSERT INTO `check_ins` VALUES ('1', '3', '2016-03-24 11:13:30', '1');
INSERT INTO `check_ins` VALUES ('2', '3', '2016-03-31 14:40:05', '1');
INSERT INTO `check_ins` VALUES ('3', '3', '2016-04-01 14:19:08', '1');
INSERT INTO `check_ins` VALUES ('4', '3', '2016-04-03 09:40:55', '1');
INSERT INTO `check_ins` VALUES ('5', '16', '2016-04-03 20:41:40', '1');
INSERT INTO `check_ins` VALUES ('6', '3', '2016-04-04 09:12:34', '1');
INSERT INTO `check_ins` VALUES ('7', '3', '2016-04-05 18:11:43', '1');
INSERT INTO `check_ins` VALUES ('8', '3', '2016-04-06 10:46:06', '1');
INSERT INTO `check_ins` VALUES ('9', '14', '2016-04-06 13:31:36', '1');
INSERT INTO `check_ins` VALUES ('10', '3', '2016-04-07 09:25:01', '1');
INSERT INTO `check_ins` VALUES ('11', '3', '2016-04-08 09:43:42', '1');
INSERT INTO `check_ins` VALUES ('12', '3', '2016-04-08 11:35:31', '1');
INSERT INTO `check_ins` VALUES ('13', '16', '2016-04-08 11:41:42', '1');
INSERT INTO `check_ins` VALUES ('14', '3', '2016-04-08 11:42:01', '1');
INSERT INTO `check_ins` VALUES ('15', '14', '2016-04-08 11:43:43', '1');
INSERT INTO `check_ins` VALUES ('16', '16', '2016-04-08 11:44:24', '1');
INSERT INTO `class` VALUES ('1', '西方宗教与艺术', '1', '4', '修远楼117');
INSERT INTO `class` VALUES ('2', '宏观经济学', '1', '2', 'P418');
INSERT INTO `class` VALUES ('3', '人文社科前沿讲座', '1', '3', '修远楼114');
INSERT INTO `class` VALUES ('4', '历史传感器网络', '2', '1', '西区1教429');
INSERT INTO `class` VALUES ('5', '通信系统仿真设计实验', '2', '2', '西二区6教308');
INSERT INTO `class` VALUES ('6', '现代程控交换实验', '2', '3', '西二区6教308');
INSERT INTO `class` VALUES ('7', '大学英语3', '3', '2', '中区1教440');
INSERT INTO `class` VALUES ('8', '舞蹈编导基础理论', '3', '3', '东区27教608');
INSERT INTO `class` VALUES ('9', '形体训练2', '4', '2', '东区27教排练室');
INSERT INTO `class` VALUES ('10', '中国音乐史与名作欣赏2', '4', '1', '东区25教424');
INSERT INTO `class` VALUES ('11', '和声学基础1', '4', '3', '东区27教608');
INSERT INTO `class` VALUES ('12', '中国历史地理', '4', '4', '东区25教515');
INSERT INTO `class` VALUES ('13', '史学论文写作', '5', '1', '东区25教311');
INSERT INTO `class` VALUES ('14', '播音与主持', '5', '4', '东区25教228');
INSERT INTO `class` VALUES ('15', '优秀新闻作品研究', '5', '5', '东区25教320');
INSERT INTO `class` VALUES ('16', '高等数学2', '7', '1', '中区11教512');
INSERT INTO `class` VALUES ('17', '信息检索', '7', '2', '西区图书馆306');
INSERT INTO `class` VALUES ('18', '数据分析与处理', '7', '4', '中区11教208');
INSERT INTO `class` VALUES ('19', '财务会计', '6', '4', '中区11教309');
INSERT INTO `class` VALUES ('20', 'CAD制图与绘画', '4', '5', '田家炳楼203');
INSERT INTO `class` VALUES ('21', '模拟电子技术', '4', '6', '逸夫楼408');
INSERT INTO `class` VALUES ('22', '数学', '6', '2', '哈哈哈');
INSERT INTO `class` VALUES ('23', '数学', '5', '3', 'jiaoshi ');
INSERT INTO `class` VALUES ('24', '数学', '5', '4', '454545');
INSERT INTO `countdown` VALUES ('1', '2016-03-08', '妇女节');
INSERT INTO `countdown` VALUES ('2', '2016-03-12', '植树节');
INSERT INTO `countdown` VALUES ('3', '2016-04-01', '愚人节');
INSERT INTO `countdown` VALUES ('4', '2016-04-04', '清明节');
INSERT INTO `countdown` VALUES ('5', '2016-04-22', '地球日');
INSERT INTO `countdown` VALUES ('6', '2016-05-01', '劳动节');
INSERT INTO `countdown` VALUES ('7', '2016-05-04', '青年节');
INSERT INTO `countdown` VALUES ('8', '2016-05-08', '母亲节');
INSERT INTO `countdown` VALUES ('9', '2016-06-01', '儿童节');
INSERT INTO `countdown` VALUES ('10', '2016-06-09', '端午节');
INSERT INTO `countdown` VALUES ('11', '2016-06-19', '父亲节');
INSERT INTO `countdown` VALUES ('12', '2016-07-01', '建党节');
INSERT INTO `countdown` VALUES ('13', '2016-07-27', '火把节');
INSERT INTO `countdown` VALUES ('14', '2016-08-01', '建军节');
INSERT INTO `countdown` VALUES ('15', '2016-09-10', '教室节');
INSERT INTO `countdown` VALUES ('16', '2016-09-15', '中秋节');
INSERT INTO `countdown` VALUES ('17', '2016-10-01', '国庆节');
INSERT INTO `coupon` VALUES ('1', '1', '尽快使用', '20', '2016-04-08 11:53:33', '10', '圣火营BBQ（新街口店', '9', '0', '2016-03-18 15:12:50', 'xuetuImg/1459994294606-coupon.jpg');
INSERT INTO `coupon` VALUES ('2', '1', '兑换吗你先要的', '10', '2016-04-08 00:00:00', '5', '隆聚', '5', '0', '2016-03-18 15:12:52', 'xuetuImg/1460093851735-coupon.jpg');
INSERT INTO `coupon` VALUES ('3', '3', '佳佳', '20', '2016-04-08 11:56:32', '5', '嘉旺港式茶餐厅', '9', '0', '2016-03-18 15:12:54', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('4', '1', '了了快快离开', '20', '2016-04-08 11:56:57', '12', '丰隆生态园', '5', '0', '2016-03-18 15:12:56', 'xuetuImg/1459785723810-coupon.jpg');
INSERT INTO `coupon` VALUES ('5', '1', '2', '2', '2016-04-08 12:27:13', '2', '阿山师傅小龙虾馆', '2', '0', '2016-03-18 15:12:59', 'xuetuImg/1459685791541-coupon.jpg');
INSERT INTO `coupon` VALUES ('12', '1', '34', '34', '2016-05-18 00:00:00', '0', '望湘园（德基店）', '10', '0', '2016-03-22 09:00:00', 'xuetuImg/1460093934725-coupon.jpg');
INSERT INTO `coupon` VALUES ('13', '1', '121', '12', '2016-06-07 13:25:16', '12', '14', '8', '0', '2016-03-18 15:13:12', 'xuetuImg/1459685850164-coupon.jpg');
INSERT INTO `coupon` VALUES ('14', '1', '324234234', '12', '2016-06-07 13:25:16', '12', '15', '8', '0', '2016-03-18 15:13:14', 'xuetuImg/1459685868798-coupon.jpg');
INSERT INTO `coupon` VALUES ('15', '1', '让我感到阿斯顿', '23', '2016-06-07 13:25:16', '23', '16', '8', '0', '2016-03-18 15:13:16', 'xuetuImg/1459685881271-coupon.jpg');
INSERT INTO `coupon` VALUES ('16', '1', '阿嘎多噶', '6', '2016-06-07 13:25:16', '10', '查看数据', '8', '0', '2016-03-22 09:04:03', 'xuetuImg/1459685892472-coupon.jpg');
INSERT INTO `coupon` VALUES ('17', '1', '啊哈SD个', '23', '2016-06-07 13:25:16', '13', '18', '8', '0', '2016-03-18 15:13:18', 'xuetuImg/1459685906611-coupon.jpg');
INSERT INTO `coupon` VALUES ('18', '1', '234234234234234', '56', '2016-06-07 13:25:16', '2', '19', '8', '0', '2016-03-18 15:13:21', 'xuetuImg/1459685917396-coupon.jpg');
INSERT INTO `coupon` VALUES ('19', '1', '65电话发快递发了', '24', '2016-06-07 13:25:16', '15', '20', '8', '0', '2016-03-18 15:13:24', 'xuetuImg/1459685929342-coupon.jpg');
INSERT INTO `coupon` VALUES ('20', '1', '发生的高科技的花费了公开', '11', '2016-06-07 13:25:16', '12', '21', '8', '0', '2016-03-18 15:13:28', 'xuetuImg/1459685942286-coupon.jpg');
INSERT INTO `coupon` VALUES ('21', '1', '34532452345', '23', '2016-06-07 13:25:16', '18', '22', '8', '0', '2016-03-18 15:13:31', 'xuetuImg/1459685957928-coupon.jpg');
INSERT INTO `coupon` VALUES ('22', '1', '1212365', '12', '2016-06-07 13:25:16', '12', '你好呀', '9', '0', '2016-03-18 15:12:48', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('23', '1', '花粉管', '12', '2016-06-07 13:25:16', '4', '华莱士', '8', '0', '2016-03-18 20:27:08', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('24', '1', '看看增加的是否好用', '10', '2016-06-07 13:25:16', '5', '徐州菜馆', '8', '0', '2016-03-21 13:31:36', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('25', '5', '吃吃吃', '20', '2016-05-18 00:00:00', '2', '包吃', '9', '0', '2016-03-27 21:54:58', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('26', '1', '实在优惠', '10', '2016-05-18 00:00:00', '10', '大优惠', '8', '0', '2016-04-01 16:05:27', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('27', '3', '看看刷你想你', '20', '2016-05-18 00:00:00', '10', '华莱士', '8', '0', '2016-04-01 16:45:44', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('28', '1', '21', '21', '2016-05-18 00:00:00', '12', 'a', '1', '0', '2016-04-03 15:41:23', 'xuetuImg/wutu.png');
INSERT INTO `coupon` VALUES ('29', '1', '1212', '12', '2016-06-07 13:25:16', '12', '12', '8', '0', '2016-04-03 16:33:27', 'xuetuImg/1459774753888-coupon.jpg');
INSERT INTO `coupon` VALUES ('30', '1', 'wewerwerwer', '23', '2016-04-08 00:00:00', '23', '赛里斯海鲜自助烤肉火锅', '8', '0', '2016-04-03 16:37:22', 'xuetuImg/1460094000447-coupon.jpg');
INSERT INTO `coupon` VALUES ('31', '1', '测试使用期限', '10', '2016-05-18 00:00:00', '10', '重庆秦妈火锅', '9', '0', '2016-04-04 22:19:29', 'xuetuImg/1460093978749-coupon.jpg');
INSERT INTO `coupon` VALUES ('32', '7', '仅售106元，价值191元盛泽分店单人餐！节假日通用，店内提供免费WiFi、停车位', '20', '2016-09-09 00:00:00', '10', '食在二胖私房龙虾盖浇饭', '8', '0', '2016-04-08 13:23:40', 'xuetuImg/1460093020942-coupon.jpg');
INSERT INTO `coupon` VALUES ('33', '7', '仅售79元！价值100元的火锅代金券1张，除锅底、香烟、饮料、酒水、调料及特价菜外全场通用，可叠加使用，提供免费WiFi', '45', '2016-05-09 00:00:00', '20', '【珠江路沿线】华阔RTV火锅', '8', '0', '2016-04-08 13:26:27', 'xuetuImg/1460093187112-coupon.jpg');
INSERT INTO `coupon` VALUES ('34', '6', '仅售88元！价值100元的晚市代金券1张，除香烟外全场通用，可叠加使用，提供免费WiFi。', '100', '2020-03-09 00:00:00', '15', '【新街口地区】杨四渔港', '8', '0', '2016-04-08 13:27:15', 'xuetuImg/1460093235786-coupon.jpg');
INSERT INTO `coupon` VALUES ('35', '7', '仅售129元！价值294元的3-4人鸳鸯套餐，提供免费WiFi。', '20', '2016-05-06 00:00:00', '20', '【珠江路沿线】华阔RTV火锅', '9', '0', '2016-04-08 13:28:14', 'xuetuImg/1460093294676-coupon.jpg');
INSERT INTO `coupon` VALUES ('36', '6', '秦淮区新街口时尚莱迪美食美客IP001号（莱迪负一楼餐饮街区）', '20', '2019-03-05 00:00:00', '30', ' 笑笑凉皮（莱迪店）', '5', '0', '2016-04-08 13:28:29', 'xuetuImg/1460093377630-coupon.jpg');
INSERT INTO `coupon` VALUES ('37', '7', '仅售49元！价值64元的自助通用券，提供免费WiFi。', '30', '2016-08-07 00:00:00', '20', '【万谷慧生活广场】咕叽咕叽自助火锅', '8', '0', '2016-04-08 13:29:21', 'xuetuImg/1460093384267-coupon.jpg');
INSERT INTO `coupon` VALUES ('38', '6', '仅售9.9元！价值28元的主食3选1，建议单人使用，提供免费WiFi', '10', '2020-03-08 00:00:00', '23', '津津咖喱（金轮店）', '6', '0', '2016-04-08 13:29:28', 'xuetuImg/1460093368614-coupon.jpg');
INSERT INTO `coupon` VALUES ('39', '6', '酒店采用简约的设计风格，融入欧式的豪华、典雅、尊贵，以及人性化的设计。是您旅行度假商务理想之选。', '5', '2016-06-08 00:00:00', '300', '华为大酒店', '8', '0', '2016-04-08 13:31:02', 'xuetuImg/1460093462385-coupon.jpg');
INSERT INTO `coupon` VALUES ('40', '7', '仅售8折！价值69元的一樽特级牛排套餐1位，有赠品。', '45', '2016-05-01 00:00:00', '15', '【15店通用】一樽牛排', '8', '0', '2016-04-08 13:31:29', 'xuetuImg/1460093489853-coupon.jpg');
INSERT INTO `coupon` VALUES ('41', '6', '龙津路8-301号（靠近龙津路与长江路交界，紧邻肯德基金宁广场店，', '2', '2016-07-03 00:00:00', '500', '如家快捷酒店（六合金宁广场步行街店）', '3', '0', '2016-04-08 13:32:19', 'xuetuImg/1460093539120-coupon.jpg');
INSERT INTO `coupon` VALUES ('42', '7', '仅售105元！价值153元的浪漫双人餐，有赠品，提供免费WiFi', '20', '2016-05-01 00:00:00', '25', '【15店通用】一樽牛排', '8', '0', '2016-04-08 13:33:08', 'xuetuImg/1460093588358-coupon.jpg');
INSERT INTO `coupon` VALUES ('43', '8', '仅售12.8元！价值15元的特色花甲3选1，建议单人使用，提供免费WiFi。', '90', '2016-09-09 00:00:00', '30', '香辣花甲', '7', '0', '2016-04-08 13:33:14', 'xuetuImg/1460093667131-coupon.jpg');
INSERT INTO `coupon` VALUES ('44', '6', '大厂新华路长冲街88号（苏宁电器后', '3', '2016-10-01 00:00:00', '360', ' 如家快捷酒店（大厂步行街店）', '9', '0', '2016-04-08 13:33:19', 'xuetuImg/1460093599226-coupon.jpg');
INSERT INTO `coupon` VALUES ('45', '7', '仅售78元！价值100元的代金劵1张，除特价产品外全场通用，可叠加使用，提供免费WiFi。', '20', '2016-05-01 00:00:00', '25', '一樽牛排', '9', '0', '2016-04-08 13:34:09', 'xuetuImg/1460093649064-coupon.jpg');
INSERT INTO `coupon` VALUES ('46', '6', '江宁区鹏山路9号江宁大学城商贸中心2楼（近江宁大学城体育馆）', '6', '2017-08-08 00:00:00', '100', '星河国际影城(江宁店)', '9', '0', '2016-04-08 13:34:59', 'xuetuImg/1460093699551-coupon.jpg');
INSERT INTO `coupon` VALUES ('47', '7', '仅售98元！价值100元的代金券1张，全场通用，可叠加使用，提供免费WiFi', '40', '2016-07-05 00:00:00', '30', '外婆私房菜', '8', '0', '2016-04-08 13:35:25', 'xuetuImg/1460093725561-coupon.jpg');
INSERT INTO `coupon` VALUES ('48', '8', '串串香以其独特的魅力和鲜明的特色遍布于全国众多城市，可以说只要有人的地方就有串串香的存在，甚至在一定程度上，串串香已成为四川重庆味道的代表。', '60', '2016-09-09 00:00:00', '25', '老坛泡椒花甲', '7', '0', '2016-04-08 13:35:34', 'xuetuImg/1460093734645-coupon.jpg');
INSERT INTO `coupon` VALUES ('49', '6', '秦淮区新街口丰富路20号(近建邺路)', '5', '2016-06-08 00:00:00', '150', ' 唯一造型（丰富路店）', '7', '0', '2016-04-08 13:35:57', 'xuetuImg/1460093757870-coupon.jpg');
INSERT INTO `coupon` VALUES ('50', '8', '仅售12.5元！价值15元的秘制花甲1份，提供免费WiFi。', '50', '2016-06-25 00:00:00', '35', '秘制花甲', '8', '0', '2016-04-08 13:37:07', 'xuetuImg/1460093827227-coupon.jpg');
INSERT INTO `coupon` VALUES ('51', '8', '花甲12.5元一份，蟹大脚22.5元一份', '90', '2016-10-07 00:00:00', '80', '蟹劲十足脚', '75', '0', '2016-04-08 13:38:29', 'xuetuImg/1460093909853-coupon.jpg');
INSERT INTO `coupon` VALUES ('52', '8', '仅售12.5元！价值15元的招牌花甲1份，提供免费WiFi。', '50', '2016-08-31 00:00:00', '20', '小幸福花甲', '6', '0', '2016-04-08 13:39:39', 'xuetuImg/1460093979663-coupon.jpg');
INSERT INTO `coupon` VALUES ('53', '8', '仅售18.8元！价值20元的秘制锡纸蛏子1份，提供免费WiFi。', '100', '2016-10-25 00:00:00', '80', '龙门花甲', '9', '0', '2016-04-08 13:40:32', 'xuetuImg/1460094032705-coupon.jpg');
INSERT INTO `coupon` VALUES ('54', '8', '仅售17元！价值20元的花甲（大份）1份，提供免费WiFi。', '90', '2016-11-11 00:00:00', '40', '五香烤花甲', '6', '0', '2016-04-08 13:43:00', 'xuetuImg/1460094189216-coupon.jpg');
INSERT INTO `courselist` VALUES ('31', '3', '1');
INSERT INTO `courselist` VALUES ('32', '3', '2');
INSERT INTO `courselist` VALUES ('35', '3', '5');
INSERT INTO `courselist` VALUES ('37', '3', '13');
INSERT INTO `courselist` VALUES ('38', '3', '8');
INSERT INTO `courselist` VALUES ('39', '3', '15');
INSERT INTO `courselist` VALUES ('46', '3', '9');
INSERT INTO `courselist` VALUES ('47', '3', '10');
INSERT INTO `courselist` VALUES ('48', '3', '11');
INSERT INTO `courselist` VALUES ('49', '3', '12');
INSERT INTO `courselist` VALUES ('50', '3', '20');
INSERT INTO `courselist` VALUES ('51', '3', '21');
INSERT INTO `courselist` VALUES ('52', '16', '21');
INSERT INTO `courselist` VALUES ('53', '16', '20');
INSERT INTO `courselist` VALUES ('54', '16', '12');
INSERT INTO `courselist` VALUES ('55', '16', '11');
INSERT INTO `courselist` VALUES ('56', '16', '10');
INSERT INTO `courselist` VALUES ('57', '16', '9');
INSERT INTO `courselist` VALUES ('58', '16', '15');
INSERT INTO `courselist` VALUES ('59', '16', '8');
INSERT INTO `courselist` VALUES ('60', '16', '13');
INSERT INTO `courselist` VALUES ('61', '16', '6');
INSERT INTO `courselist` VALUES ('62', '16', '5');
INSERT INTO `courselist` VALUES ('63', '16', '2');
INSERT INTO `courselist` VALUES ('64', '16', '1');
INSERT INTO `courselist` VALUES ('65', '3', '6');
INSERT INTO `courselist` VALUES ('66', '38', '5');
INSERT INTO `courselist` VALUES ('67', '38', '6');
INSERT INTO `courselist` VALUES ('68', '38', '4');
INSERT INTO `courselist` VALUES ('69', '38', '10');
INSERT INTO `courselist` VALUES ('70', '38', '7');
INSERT INTO `courselist` VALUES ('71', '38', '8');
INSERT INTO `courselist` VALUES ('72', '16', '23');
INSERT INTO `courselist` VALUES ('73', '16', '23');
INSERT INTO `courselist` VALUES ('74', '16', '24');
INSERT INTO `favoritescoupons` VALUES ('1', '1', '1', '2016-03-21 10:21:32');
INSERT INTO `favoritescoupons` VALUES ('15', '3', '23', '2016-03-25 20:32:03');
INSERT INTO `favoritescoupons` VALUES ('21', '14', '12', '2016-03-28 13:00:41');
INSERT INTO `favoritescoupons` VALUES ('22', '21', '25', '2016-03-28 13:06:44');
INSERT INTO `favoritescoupons` VALUES ('23', '21', '24', '2016-03-28 13:06:58');
INSERT INTO `favoritescoupons` VALUES ('24', '16', '21', '2016-03-28 13:40:03');
INSERT INTO `favoritescoupons` VALUES ('25', '16', '17', '2016-03-28 13:40:09');
INSERT INTO `favoritescoupons` VALUES ('26', '16', '25', '2016-03-28 13:42:49');
INSERT INTO `favoritescoupons` VALUES ('27', '25', '16', '2016-03-28 13:54:43');
INSERT INTO `favoritescoupons` VALUES ('29', '20', '25', '2016-03-31 14:11:45');
INSERT INTO `favoritescoupons` VALUES ('30', '20', '23', '2016-03-31 14:11:48');
INSERT INTO `favoritescoupons` VALUES ('31', '23', '1', '2016-04-03 20:06:22');
INSERT INTO `favoritescoupons` VALUES ('32', '23', '2', '2016-04-03 20:07:30');
INSERT INTO `favoritescoupons` VALUES ('33', '38', '31', '2016-04-06 14:12:55');
INSERT INTO `favoritescoupons` VALUES ('34', '3', '31', '2016-04-07 21:22:50');
INSERT INTO `favoritescoupons` VALUES ('35', '3', '28', '2016-04-08 10:59:18');
INSERT INTO `favoritescoupons` VALUES ('36', '3', '30', '2016-04-08 10:59:29');
INSERT INTO `mycoupon` VALUES ('61', '2', '26', '14', '2016-04-08 09:47:58');
INSERT INTO `mycoupon` VALUES ('62', '2', '26', '3', '2016-04-08 11:37:40');
INSERT INTO `mycoupon` VALUES ('63', '2', '28', '14', '2016-04-08 11:46:54');
INSERT INTO `mycoupon` VALUES ('64', '2', '53', '16', '2016-04-08 14:15:28');
INSERT INTO `pattern` VALUES ('1', '标准模式');
INSERT INTO `pattern` VALUES ('2', '温柔模式');
INSERT INTO `question` VALUES ('1', '2', '求极限怎么求', 'no', '2016-04-05 19:20:42', '10', '1');
INSERT INTO `question` VALUES ('18', '2', '煞笔王毅', 'no', '2016-04-05 19:20:31', '10', '2');
INSERT INTO `question` VALUES ('23', '2', '儃佪寻虹兮', 'xuetuImg/2016_03_19_17_38_27.jpg', '2016-03-31 13:24:55', '10', '2');
INSERT INTO `question` VALUES ('24', '2', '看悲风拂过凝霜渐起', 'xuetuImg/2016_03_19_15_38_30.jpg', '2016-03-31 13:24:56', '10', '3');
INSERT INTO `question` VALUES ('26', '2', '时亦冉冉而年华未凪', 'xuetuImg/2016_03_21_13_51_09.jpg', '2016-03-31 13:24:59', '10', '2');
INSERT INTO `question` VALUES ('27', '2', '晨起露日居月诸', 'xuetuImg/2016_03_21_21_05_25.jpg', '2016-03-31 13:25:01', '10', '3');
INSERT INTO `question` VALUES ('28', '1', '巡子于归遍凭难诉', 'xuetuImg/2016_03_22_16_07_08.jpg', '2016-03-28 18:35:02', '10', '1');
INSERT INTO `question` VALUES ('29', '1', '风雪尽覆与此心斩余雾', 'xuetuImg/2016_03_22_16_35_56.jpg', '2016-03-28 18:35:11', '10', '1');
INSERT INTO `question` VALUES ('30', '3', '试植梓为期掔(qian)发以恒', 'xuetuImg/2016_03_25_09_53_05.jpg', '2016-03-31 13:25:04', '10', '2');
INSERT INTO `question` VALUES ('31', '3', '心婵媛而无所遂从流', 'xuetuImg/2016_03_25_11_59_15.jpg', '2016-03-31 13:25:06', '10', '4');
INSERT INTO `question` VALUES ('32', '3', '留芳泽沃若', 'xuetuImg/2016_03_25_12_07_26.jpg', '2016-03-31 13:25:08', '10', '3');
INSERT INTO `question` VALUES ('33', '3', '我就问一句！', 'xuetuImg/2016_03_25_13_59_07.jpg', '2016-03-31 13:25:10', '10', '4');
INSERT INTO `question` VALUES ('34', '3', '我就是不传照片怎么了！', 'no', '2016-03-31 13:25:11', '10', '3');
INSERT INTO `question` VALUES ('36', '3', ' 还愿侧身 以玄鸟之资缤纷此尘荏', 'xuetuImg/2016_03_27_23_14_13.jpg', '2016-03-31 13:25:13', '10', '2');
INSERT INTO `question` VALUES ('37', '3', '微霜降而不自忱', 'no', '2016-03-28 18:35:39', '10', '2');
INSERT INTO `question` VALUES ('38', '3', '流年过情意深', 'xuetuImg/2016_03_28_11_33_45.jpg', '2016-03-28 18:35:43', '10', '2');
INSERT INTO `question` VALUES ('39', '3', '为君决此永心', 'xuetuImg/2016_03_28_12_37_57.jpg', '2016-03-31 13:25:16', '10', '4');
INSERT INTO `question` VALUES ('40', '29', '他是谁，为什么？', 'xuetuImg/2016_03_28_13_09_36.jpg', '2016-03-31 13:25:17', '10', '3');
INSERT INTO `question` VALUES ('41', '16', '负夏蒲而解羽兮', 'xuetuImg/2016_03_28_13_42_21.jpg', '2016-03-31 13:25:19', '10', '2');
INSERT INTO `question` VALUES ('42', '21', '抚苏筝而鸣纬兮', 'xuetuImg/2016_03_28_13_55_45.jpg', '2016-03-28 18:36:04', '10', '4');
INSERT INTO `question` VALUES ('43', '3', '愿首邱桃下誓姊于此命', 'no', '2016-03-31 13:25:21', '10', '3');
INSERT INTO `question` VALUES ('45', '20', '这个是什么品种的乌龟啊  好吓人哎', 'xuetuImg/2016_03_31_14_09_44.jpg', '2016-03-31 14:11:19', '10', '1');
INSERT INTO `question` VALUES ('46', '20', '这个人好帅啊   求个联系方式。', 'xuetuImg/2016_03_31_14_16_33.jpg', '2016-03-31 14:17:13', '10', '1');
INSERT INTO `question` VALUES ('49', '23', 'sadfasdfdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 'no', '2016-04-04 15:04:12', '10', '3');
INSERT INTO `question` VALUES ('88', '30', '测试问题9', 'no', '2016-04-06 14:00:36', '10', '2');
INSERT INTO `question` VALUES ('89', '38', '1*1=？', 'xuetuImg/2016_04_06_14_48_22.jpg', '2016-04-06 14:49:31', '10', '2');
INSERT INTO `question` VALUES ('90', '38', '1*1=？', 'xuetuImg/2016_04_06_14_48_22.jpg', '2016-04-06 14:49:34', '10', '2');
INSERT INTO `question` VALUES ('91', '38', '1*1=？', 'xuetuImg/2016_04_06_14_48_22.jpg', '2016-04-06 14:49:35', '10', '2');
INSERT INTO `question` VALUES ('92', '38', '1*1=？', 'xuetuImg/2016_04_06_14_48_22.jpg', '2016-04-06 14:49:42', '10', '2');
INSERT INTO `question` VALUES ('93', '38', '1*1=？', 'xuetuImg/2016_04_06_14_48_22.jpg', '2016-04-06 14:49:36', '10', '2');
INSERT INTO `question` VALUES ('94', '38', '1*1=？', 'xuetuImg/2016_04_06_14_48_22.jpg', '2016-04-06 14:49:37', '10', '2');
INSERT INTO `question` VALUES ('95', '38', '1*1=？', 'xuetuImg/2016_04_06_14_48_22.jpg', '2016-04-06 14:49:41', '10', '2');
INSERT INTO `question` VALUES ('111', '3', '大雁为什么南非', '', '2016-04-08 10:10:56', '10', '1');
INSERT INTO `question` VALUES ('112', '3', '这是什么教室？', 'xuetuImg/2016_04_08_10_55_41.jpg', '2016-04-08 10:56:23', '10', '2');
INSERT INTO `question` VALUES ('113', '14', 'who can tell me why?\n', '', '2016-04-08 11:52:52', '10', '1');
INSERT INTO `question` VALUES ('114', '14', '林晨请组员吃饭饭 好吗？', 'xuetuImg/2016_04_08_11_53_04.jpg', '2016-04-08 11:53:57', '10', '1');
INSERT INTO `question` VALUES ('115', '35', '关于黄鹤楼的诗句', '', '2016-04-08 12:32:39', '10', '1');
INSERT INTO `question` VALUES ('116', '3', '你说我要么你', 'xuetuImg/2016_04_08_14_04_28.jpg', '2016-04-08 14:04:48', '10', '1');
INSERT INTO `school` VALUES ('1', '社会大学', '101.0', '201.2');
INSERT INTO `selfstudyplan` VALUES ('49', '2016-03-28 13:55:30', '2016-04-28 13:55:30', '吃饭', '0', '1', '25', '2016-03-28 13:55:59', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('50', '2016-03-28 13:55:30', '2016-04-28 13:55:30', '吃饭', '0', '1', '25', '2016-03-28 13:56:02', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('51', '2016-03-28 13:55:30', '2016-04-28 13:55:30', '吃饭', '0', '1', '25', '2016-03-28 13:56:03', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('52', '2016-03-28 13:55:30', '2016-04-28 13:55:30', '吃饭', '0', '1', '25', '2016-03-28 13:56:04', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('53', '2016-04-08 10:02:31', '2016-03-28 14:37:13', '用英语', '1', '2', '14', '2016-03-28 14:29:25', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('54', '2016-03-28 14:33:27', '2016-03-28 16:35:34', '过眼云烟', '0', '1', '14', '2016-03-28 14:32:50', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('55', '2016-03-28 15:25:10', '2016-03-28 16:38:30', '测试', '0', '1', '14', '2016-03-28 14:33:55', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('59', '2016-04-08 15:25:20', '2016-04-08 15:33:20', '没有描述', '1', '1', '14', '2016-03-28 15:25:30', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('60', '2016-03-28 15:28:52', '2016-03-28 19:39:52', '嘎嘎嘎', '0', '1', '14', '2016-03-28 15:26:04', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('61', '2016-03-28 17:36:23', '2016-03-28 22:36:23', '', '0', '1', '14', '2016-03-28 15:34:30', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('77', '2016-04-03 20:49:28', '2016-03-30 08:32:58', '通天塔', '1', '2', '16', '2016-03-30 08:30:13', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('78', '2016-04-03 20:49:24', '2016-03-30 17:34:28', '学习一个小时', '1', '2', '16', '2016-03-30 08:34:51', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('79', '2016-04-03 20:49:26', '2016-03-30 11:35:24', '今天复习数学', '1', '2', '16', '2016-03-30 08:35:36', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('85', '2016-03-30 11:35:45', '2016-04-30 11:35:45', '', '0', '1', '20', '2016-03-30 11:36:00', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('101', '2016-04-03 20:22:38', '2016-04-03 20:23:38', '11111112123123123', '1', '1', '23', '2016-04-03 20:20:02', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('102', '2016-04-03 20:49:23', '2016-04-03 20:49:34', '从第三方', '1', '1', '16', '2016-04-03 20:47:45', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('103', '2016-04-03 21:22:09', '2016-04-03 21:24:29', '学习内容', '1', '1', '16', '2016-04-03 21:17:49', '0', '2');
INSERT INTO `selfstudyplan` VALUES ('104', '2016-04-03 21:46:33', '2016-04-03 21:47:02', '是的地方', '1', '1', '16', '2016-04-03 21:45:15', '0', '2');
INSERT INTO `selfstudyplan` VALUES ('110', '2016-04-06 14:22:55', '2016-04-06 14:20:53', 'DHC V\n', '0', '1', '38', '2016-04-06 14:20:37', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('111', '2016-04-06 14:18:59', '2016-04-06 14:20:53', '凤凰城', '1', '1', '38', '2016-04-06 14:21:20', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('112', '2016-04-06 14:23:34', '2016-04-06 14:25:34', '如果狗狗', '1', '1', '38', '2016-04-06 14:21:59', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('113', '2016-04-06 14:26:47', '2016-04-06 14:28:47', '发挥改革\n', '1', '1', '38', '2016-04-06 14:26:07', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('114', '2016-04-06 14:35:37', '2016-04-06 14:36:37', '国际飞机', '0', '1', '38', '2016-04-06 14:35:52', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('115', '2016-04-06 14:38:31', '2016-04-06 14:42:31', '经过反复', '1', '1', '38', '2016-04-06 14:36:49', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('117', '2016-04-06 15:06:32', '2016-04-06 15:10:32', '符合背后来\n', '1', '1', '38', '2016-04-06 15:07:07', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('153', '2016-04-08 09:46:32', '2016-04-08 09:48:32', '阿狄丽娜', '1', '1', '14', '2016-04-08 09:45:53', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('159', '2016-04-08 10:33:05', '2016-04-08 10:40:05', '睡午觉', '0', '1', '3', '2016-04-08 10:31:22', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('160', '2016-04-08 11:19:56', '2016-04-08 17:16:44', 'dddd', '0', '1', '3', '2016-04-08 11:15:03', '1', '0');
INSERT INTO `selfstudyplan` VALUES ('161', '2016-04-08 12:22:10', '2016-04-08 13:22:10', 'ggfhh', '0', '1', '3', '2016-04-08 11:20:25', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('162', '2016-04-08 12:46:10', '2016-04-08 13:46:10', '111111112345', '1', '1', '16', '2016-04-08 11:44:22', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('163', '2016-04-08 12:32:31', '2016-04-08 12:33:31', '去哪儿', '1', '1', '35', '2016-04-08 12:30:46', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('164', '2016-04-08 12:50:52', '2016-04-08 12:52:02', '啊啊啊', '1', '2', '47', '2016-04-08 12:49:32', '0', '2');
INSERT INTO `selfstudyplan` VALUES ('165', '2016-04-08 13:49:02', '2016-04-08 13:52:02', '他们呢', '1', '2', '49', '2016-04-08 13:47:37', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('166', '2016-04-08 14:02:55', '2016-04-08 15:03:55', '我就', '1', '1', '3', '2016-04-08 13:56:15', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('167', '2016-04-08 14:12:00', '2016-04-08 14:16:00', '那天', '1', '2', '3', '2016-04-08 14:10:21', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('168', '2016-04-08 14:12:42', '2016-04-08 14:15:42', '！也很有时候', '1', '2', '3', '2016-04-08 14:11:00', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('169', '2016-04-08 14:14:49', '2016-04-08 14:23:49', '‘同仁堂', '1', '1', '16', '2016-04-08 14:13:03', '0', '0');
INSERT INTO `selfstudyplan` VALUES ('170', '2016-04-08 14:18:31', '2016-04-08 14:19:28', '那天翼要是', '1', '2', '3', '2016-04-08 14:11:40', '0', '2');
INSERT INTO `selfstudyplan` VALUES ('171', '2016-04-08 14:47:59', '2016-05-04 15:32:03', '杨钰莹', '1', '1', '16', '2016-04-08 14:30:58', '0', '2');
INSERT INTO `selfstudyplan` VALUES ('172', '2016-04-08 14:44:19', '2016-04-08 14:46:19', '哈哈', '0', '1', '16', '2016-04-08 14:42:35', '0', '0');
INSERT INTO `storename` VALUES ('1', 'name', '13359746517', '那条街', '肯德基', '没有东西', 'xuetuImg/1459994270871-1.jpg', '123', '2016-04-07 09:57:50');
INSERT INTO `storename` VALUES ('3', 'abc', '13359746517', '那条加莪', '二家点', '不买东西', 'xuetuImg/1459217629456-3.jpg', '123', '2016-03-29 10:13:49');
INSERT INTO `storename` VALUES ('4', 'qqq', '13359746547', '4545', '4545', '45454', null, '1', '0000-00-00 00:00:00');
INSERT INTO `storename` VALUES ('5', 'wo', '13359746517', '第一条街', '店家', '好吃', 'xuetuImg/1459087264615-5.jpg', '1', '2016-03-27 22:01:04');
INSERT INTO `storename` VALUES ('6', '1212', '13843894138', '秦淮区中山南路234号(大洋百货往南200米) ', '杨四渔港', '店家说：“作为一个经营了11年的老知名餐饮品牌，我们就是想做第二个10年，眼下是品牌转型时期，一来我们要对我们10年的老顾客真心回报，二是想让更多的人认可全新的杨四渔港。诚信是品牌的根本。', 'xuetuImg/1460093116710-6.jpg', '1212', '2016-04-08 13:25:16');
INSERT INTO `storename` VALUES ('7', 'dianjia', '13359746517', '吴江市盛泽镇金城商业中心2-114', '食在二胖', '提供正宗的龙虾', 'xuetuImg/1460092922386-7.jpg', '12', '2016-04-08 13:22:02');
INSERT INTO `storename` VALUES ('8', 'long', '13843894138', '六合区金宁广场前街基督教堂对面', '小重庆勇子花甲火锅', '串串香，是四川重庆地区汉族传统小吃之一，也是草根美食最大众化的体现，它实际上是火锅的另一种形式，所以人们又往往称其为小火锅。', 'xuetuImg/1460093283487-8.jpg', 'long', '2016-04-08 13:28:03');
INSERT INTO `student` VALUES ('1', '钵钵鸡', '126@126.com', '12115246325', 'xuetuImg/touxiang.png', '女', '18', '大一', '通信', '学也没用', '1', '123', '2016-04-08 12:27:33');
INSERT INTO `student` VALUES ('2', '邢丽峰', '7045788@qq.com', 'ppp', 'xuetuImg/userimg.jpg', '女', '999', '上帝', '高数', '弄你没商量', '1', 'hhh', '2016-04-08 12:27:31');
INSERT INTO `student` VALUES ('3', '为什么这么帅了！也要', '784648@qq.com', '1', 'xuetuImg/2016_04_08_14_07_32.jpg', '女', '53', '初二', '好', '你在逗我？是说你', '1', '1', '2016-04-08 14:10:17');
INSERT INTO `student` VALUES ('14', '梁军硕鼠硕鼠硕鼠硕鼠', null, '181', 'xuetuImg/2016_03_28_13_26_13.jpg', '女', null, null, null, '哈里路亚', null, '1', '2016-04-08 12:27:42');
INSERT INTO `student` VALUES ('16', '我的昵称呢？喂！', null, '123', 'xuetuImg/2016_03_31_12_48_27.jpg', '女', '22', '幼稚园', null, '有趣啊！', null, '123', '2016-03-31 13:59:20');
INSERT INTO `student` VALUES ('20', '林晨', null, '1B1A835ACC0D6A239AF3C6A657F7A53B', 'xuetuImg/2016_03_27_16_39_39.jpg', '女', null, null, null, null, null, '1B1A835ACC0D6A239AF3C6A657F7A53B', '2016-03-31 14:15:41');
INSERT INTO `student` VALUES ('21', 'Ashes concept', null, 'C46DA4A8D2423DF26AD188088CCAD187', 'http://qzapp.qlogo.cn/qzapp/100424468/C46DA4A8D2423DF26AD188088CCAD187/100', '女', '66', '褰裳涉旖旎', null, '叩绯印 忆昨年之轩渠', null, 'C46DA4A8D2423DF26AD188088CCAD187', '2016-03-28 09:22:40');
INSERT INTO `student` VALUES ('23', '大头', null, '1335974651', 'xuetuImg/2016_03_27_22_07_21.jpg', '女', '78', '大一', null, '大头，下雨不愁', null, '1', '2016-03-28 11:51:53');
INSERT INTO `student` VALUES ('24', '         　   ', null, '7737C72FA212A5AAC94DC4D8B2600AFF', 'http://qzapp.qlogo.cn/qzapp/100424468/7737C72FA212A5AAC94DC4D8B2600AFF/100', '女', '66', '幼稚园', null, '某托', null, '7737C72FA212A5AAC94DC4D8B2600AFF', '2016-03-27 21:06:44');
INSERT INTO `student` VALUES ('25', 'nsdlmvb', null, 'CA5FAABC8863CF2845EC211373694610', 'http://qzapp.qlogo.cn/qzapp/100424468/CA5FAABC8863CF2845EC211373694610/100', '男', null, null, null, null, null, 'CA5FAABC8863CF2845EC211373694610', '2016-03-27 21:07:59');
INSERT INTO `student` VALUES ('29', '逝憶一笑っ', null, 'C71F6F3C429A514340A28478F040DA7C', 'http://qzapp.qlogo.cn/qzapp/100424468/C71F6F3C429A514340A28478F040DA7C/100', '男', null, null, null, null, null, 'C71F6F3C429A514340A28478F040DA7C', '2016-03-28 13:09:20');
INSERT INTO `student` VALUES ('30', '努力先生', null, 'E915EF56C76DA36E1921D6EBE1E6B168', 'http://qzapp.qlogo.cn/qzapp/100424468/E915EF56C76DA36E1921D6EBE1E6B168/100', '男', null, null, null, null, null, 'E915EF56C76DA36E1921D6EBE1E6B168', '2016-03-28 13:59:18');
INSERT INTO `student` VALUES ('31', '                    ❀', null, '640FC130E3301E65FF8F61F29FDC6ADB', 'http://qzapp.qlogo.cn/qzapp/100424468/640FC130E3301E65FF8F61F29FDC6ADB/100', '女', null, null, null, null, null, '640FC130E3301E65FF8F61F29FDC6ADB', '2016-03-29 18:13:35');
INSERT INTO `student` VALUES ('33', 'Remix.', null, 'C4F37C606890A5852C55AC389E053984', 'http://qzapp.qlogo.cn/qzapp/100424468/C4F37C606890A5852C55AC389E053984/100', '男', null, null, null, null, null, 'C4F37C606890A5852C55AC389E053984', '2016-03-31 14:24:08');
INSERT INTO `student` VALUES ('34', '？？？？？', null, '560098442D93E34D41511B05B8357C8D', 'http://qzapp.qlogo.cn/qzapp/100424468/560098442D93E34D41511B05B8357C8D/100', '男', null, null, null, null, null, '560098442D93E34D41511B05B8357C8D', '2016-04-05 18:12:48');
INSERT INTO `student` VALUES ('35', null, null, '1811', 'xuetuImg/touxiang.png', '女', null, '一年级', null, null, null, '1', '2016-04-08 12:41:20');
INSERT INTO `student` VALUES ('36', null, null, '2', 'xuetuImg/touxiang.png', '女', null, null, null, null, null, '2', '2016-04-08 12:27:37');
INSERT INTO `student` VALUES ('37', 'I*', null, 'DAAAA9C9CDE56F281D7F16E0BE49ED49', 'http://qzapp.qlogo.cn/qzapp/100424468/DAAAA9C9CDE56F281D7F16E0BE49ED49/100', '男', null, null, null, null, null, 'DAAAA9C9CDE56F281D7F16E0BE49ED49', '2016-04-06 13:12:00');
INSERT INTO `student` VALUES ('38', '使然二姨子', null, '18205253792', 'xuetuImg/2016_04_06_14_33_05.jpg', '女', '66', '大三', null, '查查', null, '456789', '2016-04-06 16:00:51');
INSERT INTO `student` VALUES ('45', null, null, '18860922136', 'xuetuImg/touxiang.png', '女', null, null, null, null, null, '1', '2016-04-08 12:27:36');
INSERT INTO `student` VALUES ('46', '林晨。', null, '13359746516', 'xuetuImg/touxiang.png', '女', null, null, null, '学生会主席。', null, '123', '2016-04-08 13:46:05');
INSERT INTO `student` VALUES ('47', '测试号', null, '18845294363', 'xuetuImg/touxiang.png', '男', null, '一年级', null, null, null, '1', '2016-04-08 12:48:33');
INSERT INTO `student` VALUES ('48', '45', null, '12', 'xuetuImg/touxiang.png', '女', null, null, null, null, null, '45', null);
INSERT INTO `student` VALUES ('49', null, null, '13359746517', 'xuetuImg/touxiang.png', '女', null, null, null, null, null, '1', '2016-04-08 13:46:08');
INSERT INTO `studytime` VALUES ('1', '2016-03-06 00:00:00', '20', '1', '5');
INSERT INTO `studytime` VALUES ('4', '2016-03-21 18:39:30', '50', '1', '25');
INSERT INTO `studytime` VALUES ('6', '2016-03-21 18:39:31', '3000', '1', '55');
INSERT INTO `studytime` VALUES ('7', '2016-03-21 18:39:31', '3000', '1', '55');
INSERT INTO `studytime` VALUES ('8', '2016-03-21 18:39:32', '3000', '1', '55');
INSERT INTO `studytime` VALUES ('9', '2016-03-21 18:39:33', '3000', '1', '55');
INSERT INTO `studytime` VALUES ('10', '2016-03-21 18:39:33', '10', '1', '5');
INSERT INTO `studytime` VALUES ('15', '2016-03-21 18:39:34', '10', '1', '5');
INSERT INTO `studytime` VALUES ('20', '2016-03-21 18:39:34', '10', '1', '5');
INSERT INTO `studytime` VALUES ('21', '2016-03-21 18:39:35', '10', '1', '5');
INSERT INTO `studytime` VALUES ('22', '2016-03-21 18:39:35', '10', '1', '5');
INSERT INTO `studytime` VALUES ('23', '2016-03-21 18:39:36', '10', '1', '5');
INSERT INTO `studytime` VALUES ('24', '2016-03-21 18:39:37', '10', '1', '5');
INSERT INTO `studytime` VALUES ('25', '2016-03-21 18:39:38', '10', '1', '5');
INSERT INTO `studytime` VALUES ('26', '2016-03-21 18:50:25', '10', '2', '5');
INSERT INTO `studytime` VALUES ('27', '2016-03-21 18:50:22', '10', '2', '5');
INSERT INTO `studytime` VALUES ('28', '2016-03-23 11:22:22', '10', '3', '5');
INSERT INTO `studytime` VALUES ('29', '2016-03-23 11:22:24', '10', '3', '5');
INSERT INTO `studytime` VALUES ('30', '2016-03-23 11:22:25', '10', '3', '5');
INSERT INTO `studytime` VALUES ('31', '2016-03-23 11:22:27', '10', '3', '5');
INSERT INTO `studytime` VALUES ('32', '2016-03-23 11:22:38', '10', '3', '5');
INSERT INTO `studytime` VALUES ('33', '2016-03-23 11:22:38', '0', '3', '0');
INSERT INTO `studytime` VALUES ('34', '2016-03-23 11:22:39', '0', '3', '0');
INSERT INTO `studytime` VALUES ('35', '2016-03-23 11:22:39', '0', '3', '0');
INSERT INTO `studytime` VALUES ('36', '2016-03-23 11:22:39', '0', '3', '0');
INSERT INTO `studytime` VALUES ('37', '2016-03-23 11:22:52', '0', '3', '0');
INSERT INTO `studytime` VALUES ('38', '2016-03-23 11:22:50', '0', '3', '0');
INSERT INTO `studytime` VALUES ('46', '2016-03-15 13:32:32', '100', '1', '10');
INSERT INTO `studytime` VALUES ('47', '2016-03-16 13:32:57', '100', '1', '10');
INSERT INTO `studytime` VALUES ('48', '2016-03-17 13:33:49', '10', '1', '1');
INSERT INTO `studytime` VALUES ('49', '2016-03-24 13:42:29', '13', '3', '5');
INSERT INTO `studytime` VALUES ('50', '2016-03-24 13:49:03', '11', '3', '5');
INSERT INTO `studytime` VALUES ('51', '2016-03-24 13:49:17', '11', '3', '5');
INSERT INTO `studytime` VALUES ('52', '2016-03-24 13:51:04', '14', '3', '5');
INSERT INTO `studytime` VALUES ('53', '2016-03-24 13:54:49', '4', '3', '0');
INSERT INTO `studytime` VALUES ('54', '2016-03-24 13:55:08', '13', '3', '5');
INSERT INTO `studytime` VALUES ('55', '2016-03-24 13:58:12', '11', '3', '5');
INSERT INTO `studytime` VALUES ('56', '2016-03-24 14:45:42', '3', '3', '0');
INSERT INTO `studytime` VALUES ('57', '2016-03-24 15:44:21', '11', '3', '5');
INSERT INTO `studytime` VALUES ('58', '2016-03-24 22:15:29', '5', '3', '0');
INSERT INTO `studytime` VALUES ('59', '2016-03-25 16:05:04', '62', '3', '30');
INSERT INTO `studytime` VALUES ('60', '2016-03-25 16:05:31', '11', '3', '5');
INSERT INTO `studytime` VALUES ('61', '2016-03-25 16:06:11', '2', '3', '0');
INSERT INTO `studytime` VALUES ('62', '2016-03-25 16:06:16', '2', '3', '0');
INSERT INTO `studytime` VALUES ('63', '2016-03-25 23:50:24', '70', '3', '35');
INSERT INTO `studytime` VALUES ('64', '2016-03-26 00:24:22', '52', '3', '25');
INSERT INTO `studytime` VALUES ('65', '2016-03-27 12:45:19', '48', '3', '20');
INSERT INTO `studytime` VALUES ('66', '2016-03-27 17:56:38', '7', '3', '0');
INSERT INTO `studytime` VALUES ('67', '2016-03-27 17:56:41', '2', '3', '0');
INSERT INTO `studytime` VALUES ('68', '2016-03-28 10:19:44', '2', '3', '0');
INSERT INTO `studytime` VALUES ('69', '2016-03-28 13:52:00', '4', '3', '0');
INSERT INTO `studytime` VALUES ('70', '2016-03-28 13:52:18', '9', '3', '0');
INSERT INTO `studytime` VALUES ('71', '2016-03-28 13:52:22', '2', '3', '0');
INSERT INTO `studytime` VALUES ('72', '2016-03-28 13:52:25', '2', '3', '0');
INSERT INTO `studytime` VALUES ('73', '2016-03-28 13:52:33', '3', '3', '0');
INSERT INTO `studytime` VALUES ('74', '2016-03-28 13:52:46', '7', '3', '0');
INSERT INTO `studytime` VALUES ('75', '2016-03-28 13:52:59', '5', '3', '0');
INSERT INTO `studytime` VALUES ('76', '2016-03-28 13:53:18', '3', '3', '0');
INSERT INTO `studytime` VALUES ('77', '2016-03-28 13:53:22', '2', '3', '0');
INSERT INTO `studytime` VALUES ('78', '2016-03-28 14:29:52', '25', '14', '10');
INSERT INTO `studytime` VALUES ('79', '2016-03-28 14:30:06', '3', '14', '0');
INSERT INTO `studytime` VALUES ('80', '2016-03-28 14:30:09', '2', '14', '0');
INSERT INTO `studytime` VALUES ('81', '2016-03-28 14:30:17', '2', '14', '0');
INSERT INTO `studytime` VALUES ('82', '2016-03-28 14:30:25', '2', '14', '0');
INSERT INTO `studytime` VALUES ('83', '2016-03-28 14:30:33', '3', '14', '0');
INSERT INTO `studytime` VALUES ('84', '2016-03-28 14:31:26', '47', '14', '20');
INSERT INTO `studytime` VALUES ('85', '2016-03-28 14:31:31', '2', '14', '0');
INSERT INTO `studytime` VALUES ('86', '2016-03-28 14:31:32', '2', '14', '0');
INSERT INTO `studytime` VALUES ('87', '2016-03-28 14:31:36', '2', '14', '0');
INSERT INTO `studytime` VALUES ('88', '2016-03-28 14:34:23', '11', '14', '5');
INSERT INTO `studytime` VALUES ('89', '2016-03-28 14:39:23', '77', '14', '35');
INSERT INTO `studytime` VALUES ('90', '2016-03-28 14:39:36', '3', '14', '0');
INSERT INTO `studytime` VALUES ('91', '2016-03-28 15:08:26', '92', '14', '45');
INSERT INTO `studytime` VALUES ('92', '2016-03-28 15:09:11', '6', '14', '0');
INSERT INTO `studytime` VALUES ('93', '2016-03-28 15:11:06', '2', '14', '0');
INSERT INTO `studytime` VALUES ('94', '2016-03-28 15:11:10', '2', '14', '0');
INSERT INTO `studytime` VALUES ('95', '2016-03-28 15:14:40', '2', '14', '0');
INSERT INTO `studytime` VALUES ('96', '2016-03-28 15:14:49', '3', '14', '0');
INSERT INTO `studytime` VALUES ('97', '2016-03-28 15:15:04', '9', '14', '0');
INSERT INTO `studytime` VALUES ('98', '2016-03-28 15:18:10', '2', '14', '0');
INSERT INTO `studytime` VALUES ('99', '2016-03-28 15:19:53', '2', '14', '0');
INSERT INTO `studytime` VALUES ('100', '2016-03-28 15:19:56', '2', '14', '0');
INSERT INTO `studytime` VALUES ('101', '2016-03-28 15:20:44', '6', '3', '0');
INSERT INTO `studytime` VALUES ('102', '2016-03-28 15:24:25', '151', '14', '75');
INSERT INTO `studytime` VALUES ('103', '2016-03-28 15:24:32', '3', '14', '0');
INSERT INTO `studytime` VALUES ('104', '2016-03-28 15:26:20', '4', '14', '0');
INSERT INTO `studytime` VALUES ('105', '2016-03-28 15:26:56', '18', '14', '5');
INSERT INTO `studytime` VALUES ('106', '2016-03-28 15:28:26', '27', '3', '10');
INSERT INTO `studytime` VALUES ('107', '2016-03-28 15:40:51', '266', '14', '130');
INSERT INTO `studytime` VALUES ('108', '2016-03-28 15:56:36', '97', '3', '45');
INSERT INTO `studytime` VALUES ('109', '2016-03-29 23:55:06', '2', '3', '0');
INSERT INTO `studytime` VALUES ('110', '2016-03-29 23:55:32', '11', '3', '5');
INSERT INTO `studytime` VALUES ('111', '2016-03-30 18:15:20', '8', '3', '0');
INSERT INTO `studytime` VALUES ('112', '2016-03-30 18:15:53', '30', '3', '15');
INSERT INTO `studytime` VALUES ('113', '2016-03-30 18:17:08', '30', '3', '15');
INSERT INTO `studytime` VALUES ('114', '2016-03-30 18:26:29', '2', '3', '0');
INSERT INTO `studytime` VALUES ('115', '2016-03-30 18:26:51', '2', '3', '0');
INSERT INTO `studytime` VALUES ('125', '2016-03-31 13:49:06', '126', '16', '60');
INSERT INTO `studytime` VALUES ('127', '2016-03-31 13:59:42', '10', '16', '5');
INSERT INTO `studytime` VALUES ('137', '2016-04-01 09:21:29', '11', '3', '5');
INSERT INTO `studytime` VALUES ('138', '2016-04-01 09:21:46', '5', '3', '0');
INSERT INTO `studytime` VALUES ('139', '2016-04-01 09:22:35', '18', '3', '5');
INSERT INTO `studytime` VALUES ('140', '2016-04-01 09:37:18', '3', '3', '0');
INSERT INTO `studytime` VALUES ('141', '2016-04-01 09:37:38', '19', '3', '5');
INSERT INTO `studytime` VALUES ('142', '2016-04-01 14:19:04', '2', '3', '0');
INSERT INTO `studytime` VALUES ('143', '2016-04-03 10:13:02', '40', '3', '20');
INSERT INTO `studytime` VALUES ('144', '2016-04-03 21:21:56', '240', '16', '120');
INSERT INTO `studytime` VALUES ('145', '2016-04-03 21:46:20', '60', '16', '30');
INSERT INTO `studytime` VALUES ('146', '2016-04-05 09:18:56', '0', '3', '0');
INSERT INTO `studytime` VALUES ('147', '2016-04-05 09:18:55', '73', '3', '35');
INSERT INTO `studytime` VALUES ('148', '2016-04-05 21:47:07', '12', '3', '5');
INSERT INTO `studytime` VALUES ('149', '2016-04-06 13:29:52', '16', '3', '5');
INSERT INTO `studytime` VALUES ('150', '2016-04-06 14:37:19', '22', '38', '10');
INSERT INTO `studytime` VALUES ('153', '2016-04-07 10:19:56', '137', '16', '65');
INSERT INTO `studytime` VALUES ('156', '2016-03-31 13:33:32', '1259', '3', '2');
INSERT INTO `studytime` VALUES ('157', '2016-04-07 13:35:36', '123', '3', '2');
INSERT INTO `studytime` VALUES ('158', '2016-04-07 14:59:32', '53', '3', '25');
INSERT INTO `studytime` VALUES ('159', '2016-04-07 15:00:20', '28', '3', '10');
INSERT INTO `studytime` VALUES ('160', '2016-04-07 15:04:47', '120', '3', '60');
INSERT INTO `studytime` VALUES ('161', '2016-04-07 20:03:30', '8', '3', '0');
INSERT INTO `studytime` VALUES ('162', '2016-04-08 10:30:43', '26', '3', '10');
INSERT INTO `studytime` VALUES ('163', '2016-04-08 10:32:24', '15', '3', '5');
INSERT INTO `studytime` VALUES ('164', '2016-04-08 10:32:48', '22', '3', '10');
INSERT INTO `studytime` VALUES ('165', '2016-04-08 11:16:47', '2', '3', '0');
INSERT INTO `studytime` VALUES ('166', '2016-04-08 11:21:58', '60', '3', '30');
INSERT INTO `studytime` VALUES ('167', '2016-04-08 12:28:17', '2630', '16', '1315');
INSERT INTO `studytime` VALUES ('168', '2016-04-08 12:32:15', '40', '35', '20');
INSERT INTO `studytime` VALUES ('169', '2016-04-08 12:50:34', '60', '47', '30');
INSERT INTO `studytime` VALUES ('170', '2016-04-08 14:14:57', '86', '16', '40');
INSERT INTO `studytime` VALUES ('171', '2016-04-08 14:16:30', '240', '3', '120');
INSERT INTO `studytime` VALUES ('172', '2016-04-08 14:25:41', '12', '16', '5');
INSERT INTO `studytime` VALUES ('173', '2016-04-08 14:26:23', '40', '16', '20');
INSERT INTO `studytime` VALUES ('174', '2016-04-08 14:27:41', '0', '16', '0');
INSERT INTO `studytime` VALUES ('175', '2016-04-08 14:47:35', '10', '16', '5');
INSERT INTO `studytime` VALUES ('176', '2016-04-08 14:47:40', '0', '16', '0');
INSERT INTO `subject` VALUES ('1', '英语');
INSERT INTO `subject` VALUES ('2', '物理');
INSERT INTO `subject` VALUES ('3', '地理');
INSERT INTO `subject` VALUES ('4', '化学');
INSERT INTO `userstate` VALUES ('1', '已经使用');
INSERT INTO `userstate` VALUES ('2', '未使用');
