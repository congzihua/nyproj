/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : db_gwlz

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2012-08-22 17:34:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ba_flight`
-- ----------------------------
DROP TABLE IF EXISTS `ba_flight`;
CREATE TABLE `ba_flight` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `FLIGHT` varchar(50) DEFAULT NULL,
  `CREATEDATE` timestamp NULL DEFAULT NULL,
  `DELETE_FLAG` char(3) DEFAULT NULL,
  `ENGLISHNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用于维护航程信息';

-- ----------------------------
-- Records of ba_flight
-- ----------------------------
INSERT INTO `ba_flight` VALUES ('1', '库尔勒', '2011-12-05 14:35:25', '0', 'kuerle');
INSERT INTO `ba_flight` VALUES ('2', '鼎新', '2011-12-05 14:35:37', '0', 'dingxin');

-- ----------------------------
-- Table structure for `ba_flightinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ba_flightinfo`;
CREATE TABLE `ba_flightinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLIGHT_ID` int(11) DEFAULT NULL,
  `FLIGHT_DATE` date DEFAULT NULL,
  `FLY_TIME` varchar(20) DEFAULT NULL,
  `CREATEDATE` timestamp NULL DEFAULT NULL,
  `DELETE_FLAG` char(3) DEFAULT NULL,
  `FLIGHT_NO` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ba_flightinfo
-- ----------------------------
INSERT INTO `ba_flightinfo` VALUES ('355', '2', '2012-01-02', '09:00', '2011-12-14 13:49:15', '0', '4009');
INSERT INTO `ba_flightinfo` VALUES ('356', '2', '2012-01-04', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('357', '2', '2012-01-06', '09:00', '2011-12-14 13:49:15', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('358', '2', '2012-01-09', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('359', '2', '2012-01-11', '09:00', '2011-12-14 13:49:15', '0', '4008');
INSERT INTO `ba_flightinfo` VALUES ('360', '2', '2012-01-13', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('361', '2', '2012-01-16', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('362', '2', '2012-01-18', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('363', '2', '2012-01-20', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('364', '2', '2012-01-23', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('365', '2', '2012-01-25', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('366', '2', '2012-01-27', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('367', '2', '2012-01-30', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('368', '2', '2012-02-01', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('369', '2', '2012-02-03', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('370', '2', '2012-02-06', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('371', '2', '2012-02-08', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('372', '2', '2012-02-10', '09:00', '2011-12-14 13:49:15', '0', '4009');
INSERT INTO `ba_flightinfo` VALUES ('373', '2', '2012-02-13', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('374', '2', '2012-02-15', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('375', '2', '2012-02-17', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('376', '2', '2012-02-20', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('377', '2', '2012-02-22', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('378', '2', '2012-02-24', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('379', '2', '2012-02-27', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('380', '2', '2012-02-29', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('381', '2', '2012-03-02', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('382', '2', '2012-03-05', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('383', '2', '2012-03-07', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('384', '2', '2012-03-09', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('385', '2', '2012-03-12', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('386', '2', '2012-03-14', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('387', '2', '2012-03-16', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('388', '2', '2012-03-19', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('389', '2', '2012-03-21', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('390', '2', '2012-03-23', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('391', '2', '2012-03-26', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('392', '2', '2012-03-28', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('393', '2', '2012-03-30', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('394', '2', '2012-04-02', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('395', '2', '2012-04-04', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('396', '2', '2012-04-06', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('397', '2', '2012-04-09', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('398', '2', '2012-04-11', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('399', '2', '2012-04-13', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('400', '2', '2012-04-16', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('401', '2', '2012-04-18', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('402', '2', '2012-04-20', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('403', '2', '2012-04-23', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('404', '2', '2012-04-25', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('405', '2', '2012-04-27', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('406', '2', '2012-04-30', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('407', '2', '2012-05-02', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('408', '2', '2012-05-04', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('409', '2', '2012-05-07', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('410', '1', '2012-05-09', '09:00', '2011-12-14 15:15:50', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('411', '2', '2012-05-11', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('412', '2', '2012-05-14', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('413', '2', '2012-05-16', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('414', '2', '2012-05-18', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('415', '2', '2012-05-21', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('416', '2', '2012-05-23', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('417', '2', '2012-05-25', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('418', '2', '2012-05-28', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('419', '2', '2012-05-30', '09:00', '2011-12-14 13:49:15', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('420', '2', '2012-04-01', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('421', '2', '2012-04-07', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('422', '2', '2012-04-08', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('423', '2', '2012-04-14', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('424', '2', '2012-04-15', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('425', '2', '2012-04-21', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('426', '2', '2012-04-22', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('427', '2', '2012-04-28', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('428', '2', '2012-04-29', '09:00', '2011-12-14 13:50:32', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('429', '2', '2012-04-06', '09:00', '2011-12-14 13:52:07', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('430', '2', '2012-04-13', '09:00', '2011-12-14 13:52:07', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('431', '2', '2012-04-20', '09:00', '2011-12-14 13:52:07', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('432', '2', '2012-04-27', '09:00', '2011-12-14 13:52:07', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('433', '1', '2012-01-02', '09:00', '2011-12-16 11:39:41', '0', '5001');
INSERT INTO `ba_flightinfo` VALUES ('434', '2', '2011-12-06', '09:00', '2011-12-16 18:16:41', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('435', '2', '2013-01-04', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('436', '2', '2013-01-07', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('437', '2', '2013-01-09', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('438', '2', '2013-01-11', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('439', '2', '2013-01-14', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('440', '2', '2013-01-16', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('441', '2', '2013-01-18', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('442', '2', '2013-01-21', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('443', '2', '2013-01-23', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('444', '2', '2013-01-25', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('445', '2', '2013-01-28', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('446', '2', '2013-01-30', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('447', '2', '2013-02-01', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('448', '2', '2013-02-04', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('449', '2', '2013-02-06', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('450', '2', '2013-02-08', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('451', '2', '2013-02-11', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('452', '2', '2013-02-13', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('453', '2', '2013-02-15', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('454', '2', '2013-02-18', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('455', '2', '2013-02-20', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('456', '2', '2013-02-22', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('457', '2', '2013-02-25', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('458', '2', '2013-02-27', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('459', '2', '2013-03-01', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('460', '2', '2013-03-04', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('461', '2', '2013-03-06', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('462', '2', '2013-03-08', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('463', '2', '2013-03-11', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('464', '2', '2013-03-13', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('465', '2', '2013-03-15', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('466', '2', '2013-03-18', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('467', '2', '2013-03-20', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('468', '2', '2013-03-22', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('469', '2', '2013-03-25', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('470', '2', '2013-03-27', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('471', '2', '2013-03-29', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('472', '2', '2013-04-01', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('473', '2', '2013-04-03', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('474', '2', '2013-04-05', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('475', '2', '2013-04-08', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('476', '2', '2013-04-10', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('477', '2', '2013-04-12', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('478', '2', '2013-04-15', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('479', '2', '2013-04-17', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('480', '2', '2013-04-19', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('481', '2', '2013-04-22', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('482', '2', '2013-04-24', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('483', '2', '2013-04-26', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('484', '2', '2013-04-29', '09:00', '2011-12-16 18:18:02', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('485', '2', '2013-05-01', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('486', '2', '2013-05-03', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('487', '2', '2013-05-06', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('488', '2', '2013-05-08', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('489', '2', '2013-05-10', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('490', '2', '2013-05-13', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('491', '2', '2013-05-15', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('492', '2', '2013-05-17', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('493', '2', '2013-05-20', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('494', '2', '2013-05-22', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('495', '2', '2013-05-24', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('496', '2', '2013-05-27', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('497', '2', '2013-05-29', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('498', '2', '2013-05-31', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('499', '2', '2013-06-03', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('500', '2', '2013-06-05', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('501', '2', '2013-06-07', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('502', '2', '2013-06-10', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('503', '2', '2013-06-12', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('504', '2', '2013-06-14', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('505', '2', '2013-06-17', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('506', '2', '2013-06-19', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('507', '2', '2013-06-21', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('508', '2', '2013-06-24', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('509', '2', '2013-06-26', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('510', '2', '2013-06-28', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('511', '2', '2013-07-01', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('512', '2', '2013-07-03', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('513', '2', '2013-07-05', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('514', '2', '2013-07-08', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('515', '2', '2013-07-10', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('516', '2', '2013-07-12', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('517', '2', '2013-07-15', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('518', '2', '2013-07-17', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('519', '2', '2013-07-19', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('520', '2', '2013-07-22', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('521', '2', '2013-07-24', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('522', '2', '2013-07-26', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('523', '2', '2013-07-29', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('524', '2', '2013-07-31', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('525', '2', '2013-08-02', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('526', '2', '2013-08-05', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('527', '2', '2013-08-07', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('528', '2', '2013-08-09', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('529', '2', '2013-08-12', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('530', '2', '2013-08-14', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('531', '2', '2013-08-16', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('532', '2', '2013-08-19', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('533', '2', '2013-08-21', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('534', '2', '2013-08-23', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('535', '2', '2013-08-26', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('536', '2', '2013-08-28', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('537', '2', '2013-08-30', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('538', '2', '2013-09-02', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('539', '2', '2013-09-04', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('540', '2', '2013-09-06', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('541', '2', '2013-09-09', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('542', '2', '2013-09-11', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('543', '2', '2013-09-13', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('544', '2', '2013-09-16', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('545', '2', '2013-09-18', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('546', '2', '2013-09-20', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('547', '2', '2013-09-23', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('548', '2', '2013-09-25', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('549', '2', '2013-09-27', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('550', '2', '2013-09-30', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('551', '2', '2013-10-02', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('552', '2', '2013-10-04', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('553', '2', '2013-10-07', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('554', '2', '2013-10-09', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('555', '2', '2013-10-11', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('556', '2', '2013-10-14', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('557', '2', '2013-10-16', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('558', '2', '2013-10-18', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('559', '2', '2013-10-21', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('560', '2', '2013-10-23', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('561', '2', '2013-10-25', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('562', '2', '2013-10-28', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('563', '2', '2013-10-30', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('564', '2', '2013-11-01', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('565', '2', '2013-11-04', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('566', '2', '2013-11-06', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('567', '2', '2013-11-08', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('568', '2', '2013-11-11', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('569', '2', '2013-11-13', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('570', '2', '2013-11-15', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('571', '2', '2013-11-18', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('572', '2', '2013-11-20', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('573', '2', '2013-11-22', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('574', '2', '2013-11-25', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('575', '2', '2013-11-27', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('576', '2', '2013-11-29', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('577', '2', '2013-12-02', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('578', '2', '2013-12-04', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('579', '2', '2013-12-06', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('580', '2', '2013-12-09', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('581', '2', '2013-12-11', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('582', '2', '2013-12-13', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('583', '2', '2013-12-16', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('584', '2', '2013-12-18', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('585', '2', '2013-12-20', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('586', '2', '2013-12-23', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('587', '2', '2013-12-25', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('588', '2', '2013-12-27', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('589', '2', '2013-12-30', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('590', '2', '2014-01-01', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('591', '2', '2014-01-03', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('592', '2', '2014-01-06', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('593', '2', '2014-01-08', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('594', '2', '2014-01-10', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('595', '2', '2014-01-13', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('596', '2', '2014-01-15', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('597', '2', '2014-01-17', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('598', '2', '2014-01-20', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('599', '2', '2014-01-22', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('600', '2', '2014-01-24', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('601', '2', '2014-01-27', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('602', '2', '2014-01-29', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('603', '2', '2014-01-31', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('604', '2', '2014-02-03', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('605', '2', '2014-02-05', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('606', '2', '2014-02-07', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('607', '2', '2014-02-10', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('608', '2', '2014-02-12', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('609', '2', '2014-02-14', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('610', '2', '2014-02-17', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('611', '2', '2014-02-19', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('612', '2', '2014-02-21', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('613', '2', '2014-02-24', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('614', '2', '2014-02-26', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('615', '2', '2014-02-28', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('616', '2', '2014-03-03', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('617', '2', '2014-03-05', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('618', '2', '2014-03-07', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('619', '2', '2014-03-10', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('620', '2', '2014-03-12', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('621', '2', '2014-03-14', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('622', '2', '2014-03-17', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('623', '2', '2014-03-19', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('624', '2', '2014-03-21', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('625', '2', '2014-03-24', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('626', '2', '2014-03-26', '09:00', '2011-12-16 18:18:02', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('627', '1', '2011-12-09', '09:00', '2011-12-16 18:19:13', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('628', '1', '2011-12-31', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('629', '1', '2012-01-01', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('630', '1', '2012-01-02', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('631', '1', '2012-01-03', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('632', '1', '2012-01-04', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('633', '1', '2012-01-05', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('634', '1', '2012-01-06', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('635', '1', '2012-01-07', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('636', '1', '2012-01-08', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('637', '1', '2012-01-09', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('638', '1', '2012-01-10', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('639', '1', '2012-01-11', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('640', '1', '2012-01-12', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('641', '1', '2012-01-13', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('642', '1', '2012-01-14', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('643', '1', '2012-01-15', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('644', '1', '2012-01-16', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('645', '1', '2012-01-17', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('646', '1', '2012-01-18', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('647', '1', '2012-01-19', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('648', '1', '2012-01-20', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('649', '1', '2012-01-21', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('650', '1', '2012-01-22', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('651', '1', '2012-01-23', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('652', '1', '2012-01-24', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('653', '1', '2012-01-25', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('654', '1', '2012-01-26', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('655', '1', '2012-01-27', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('656', '1', '2012-01-28', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('657', '1', '2012-01-29', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('658', '1', '2012-01-30', '09:00', '2011-12-21 18:38:33', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('659', '2', '2012-01-06', '09:10', '2012-01-08 19:40:39', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('660', '2', '2012-01-31', '09:10', '2012-01-08 19:43:36', '1', null);
INSERT INTO `ba_flightinfo` VALUES ('661', '2', '2012-01-28', '09:10', '2012-01-08 19:54:07', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('662', '2', '2012-01-28', '09:00', '2012-01-08 19:54:33', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('663', '2', '2012-01-16', '09:10', '2012-01-08 20:49:03', '0', null);
INSERT INTO `ba_flightinfo` VALUES ('665', '2', '2012-01-02', '09:30', '2012-07-20 15:29:34', '0', '4009');

-- ----------------------------
-- Table structure for `ba_ticketlocked`
-- ----------------------------
DROP TABLE IF EXISTS `ba_ticketlocked`;
CREATE TABLE `ba_ticketlocked` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLIGHT_ID` int(11) DEFAULT NULL,
  `TICKETPOINT_ID` int(11) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `CREATEDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DELETE_FLAG` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ba_ticketlocked
-- ----------------------------

-- ----------------------------
-- Table structure for `ba_ticketpoint`
-- ----------------------------
DROP TABLE IF EXISTS `ba_ticketpoint`;
CREATE TABLE `ba_ticketpoint` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `TELEPHONE` varchar(30) DEFAULT NULL,
  `CREATEDATE` timestamp NULL DEFAULT NULL,
  `DELETE_FLAG` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ba_ticketpoint
-- ----------------------------
INSERT INTO `ba_ticketpoint` VALUES ('1', '南苑', '010-88999988', '2011-12-01 15:15:41', '0');
INSERT INTO `ba_ticketpoint` VALUES ('2', '总装一招', '010-88996688', '2011-12-01 15:58:16', '0');
INSERT INTO `ba_ticketpoint` VALUES ('3', '专机办', '13855555', '2011-12-14 14:15:33', '0');
INSERT INTO `ba_ticketpoint` VALUES ('4', '20驻京办', '3899999999', '2011-12-14 14:15:55', '0');
INSERT INTO `ba_ticketpoint` VALUES ('5', '转运站', '22888000', '2011-12-14 14:16:17', '0');

-- ----------------------------
-- Table structure for `ba_ticketprice`
-- ----------------------------
DROP TABLE IF EXISTS `ba_ticketprice`;
CREATE TABLE `ba_ticketprice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLIGHT_ID` int(11) DEFAULT NULL,
  `DISCOUNT_TYPE` varchar(80) DEFAULT NULL,
  `REAL_AMOUNT` double DEFAULT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DELETE_FLAG` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ba_ticketprice
-- ----------------------------
INSERT INTO `ba_ticketprice` VALUES ('1', '1', '全价1651', '1652', '2011-12-05 17:57:02', '1');
INSERT INTO `ba_ticketprice` VALUES ('2', '2', '全价1578', '1578', '2011-12-05 17:57:38', '1');
INSERT INTO `ba_ticketprice` VALUES ('3', '2', '半价780', '780', '2011-12-05 17:57:38', '1');
INSERT INTO `ba_ticketprice` VALUES ('4', '2', '全价1650', '1650', '2011-12-14 14:22:52', '0');
INSERT INTO `ba_ticketprice` VALUES ('5', '2', '半价1350', '1350', '2012-06-20 14:20:54', '0');
INSERT INTO `ba_ticketprice` VALUES ('6', '2', '三折450', '450', '2011-12-14 14:23:33', '0');
INSERT INTO `ba_ticketprice` VALUES ('7', '2', '全免', '0', '2011-12-14 14:23:49', '0');
INSERT INTO `ba_ticketprice` VALUES ('8', '1', '全价1400', '1400', '2011-12-14 14:24:03', '0');
INSERT INTO `ba_ticketprice` VALUES ('9', '1', '半价700', '700', '2011-12-14 14:24:19', '0');
INSERT INTO `ba_ticketprice` VALUES ('10', '1', '三折420', '420', '2011-12-14 14:24:47', '0');
INSERT INTO `ba_ticketprice` VALUES ('11', '1', '全免0', '0', '2011-12-14 14:25:04', '0');
INSERT INTO `ba_ticketprice` VALUES ('12', '2', '二折', '330', '2012-02-16 11:29:56', '0');

-- ----------------------------
-- Table structure for `ba_ticketsalloc`
-- ----------------------------
DROP TABLE IF EXISTS `ba_ticketsalloc`;
CREATE TABLE `ba_ticketsalloc` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLIGHT_ID` int(11) DEFAULT NULL,
  `TICKETPOINT_ID` int(11) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `LOCKEDNUM` int(11) DEFAULT '0',
  `ORDERTIME` varchar(20) DEFAULT NULL,
  `ORDERDATE` date DEFAULT NULL,
  `CREATEDATE` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DELETE_FLAG` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ba_ticketsalloc
-- ----------------------------
INSERT INTO `ba_ticketsalloc` VALUES ('1', '2', '1', '43', '0', '09:00', '2012-01-11', '2012-01-11 15:01:58', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('2', '2', '2', '10', '0', '09:00', '2012-01-11', '2012-01-11 15:01:58', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('3', '2', '3', '15', '0', '09:00', '2012-01-11', '2012-01-11 15:01:58', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('4', '2', '4', '10', '0', '09:00', '2012-01-11', '2012-01-11 15:01:58', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('5', '2', '5', '10', '0', '09:00', '2012-01-11', '2012-01-11 15:01:58', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('6', '2', '1', '43', '0', '09:00', '2012-01-12', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('7', '2', '1', '43', '0', '09:00', '2012-01-14', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('8', '2', '2', '10', '0', '09:00', '2012-01-12', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('9', '2', '2', '10', '0', '09:00', '2012-01-14', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('10', '2', '3', '15', '0', '09:00', '2012-01-12', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('11', '2', '3', '15', '0', '09:00', '2012-01-14', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('12', '2', '4', '10', '0', '09:00', '2012-01-12', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('13', '2', '4', '10', '0', '09:00', '2012-01-14', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('14', '2', '5', '10', '0', '09:00', '2012-01-12', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('15', '2', '5', '10', '0', '09:00', '2012-01-14', '2012-01-11 15:04:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('16', '2', '1', '43', '0', '09:00', '2012-01-06', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('17', '2', '1', '43', '0', '09:00', '2012-01-09', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('18', '2', '1', '43', '0', '09:00', '2012-01-13', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('19', '2', '1', '43', '0', '09:00', '2012-01-16', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('20', '2', '1', '43', '0', '09:00', '2012-01-18', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('21', '2', '1', '43', '0', '09:00', '2012-01-20', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('22', '2', '1', '43', '0', '09:00', '2012-01-23', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('23', '2', '1', '43', '0', '09:00', '2012-01-25', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('24', '2', '1', '43', '0', '09:00', '2012-01-27', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('25', '2', '1', '43', '0', '09:00', '2012-01-30', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('26', '2', '2', '10', '0', '09:00', '2012-01-06', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('27', '2', '2', '10', '0', '09:00', '2012-01-09', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('28', '2', '2', '10', '0', '09:00', '2012-01-13', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('29', '2', '2', '10', '0', '09:00', '2012-01-16', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('30', '2', '2', '10', '0', '09:00', '2012-01-18', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('31', '2', '2', '10', '0', '09:00', '2012-01-20', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('32', '2', '2', '10', '0', '09:00', '2012-01-23', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('33', '2', '2', '10', '0', '09:00', '2012-01-25', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('34', '2', '2', '10', '0', '09:00', '2012-01-27', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('35', '2', '2', '10', '0', '09:00', '2012-01-30', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('36', '2', '3', '10', '0', '09:00', '2012-01-06', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('37', '2', '3', '10', '0', '09:00', '2012-01-09', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('38', '2', '3', '10', '0', '09:00', '2012-01-13', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('39', '2', '3', '10', '0', '09:00', '2012-01-16', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('40', '2', '3', '10', '0', '09:00', '2012-01-18', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('41', '2', '3', '10', '0', '09:00', '2012-01-20', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('42', '2', '3', '10', '0', '09:00', '2012-01-23', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('43', '2', '3', '10', '0', '09:00', '2012-01-25', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('44', '2', '3', '10', '0', '09:00', '2012-01-27', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('45', '2', '3', '10', '0', '09:00', '2012-01-30', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('46', '2', '4', '15', '0', '09:00', '2012-01-06', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('47', '2', '4', '15', '0', '09:00', '2012-01-09', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('48', '2', '4', '15', '0', '09:00', '2012-01-13', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('49', '2', '4', '15', '0', '09:00', '2012-01-16', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('50', '2', '4', '15', '0', '09:00', '2012-01-18', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('51', '2', '4', '15', '0', '09:00', '2012-01-20', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('52', '2', '4', '15', '0', '09:00', '2012-01-23', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('53', '2', '4', '15', '0', '09:00', '2012-01-25', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('54', '2', '4', '15', '0', '09:00', '2012-01-27', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('55', '2', '4', '15', '0', '09:00', '2012-01-30', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('56', '2', '5', '10', '0', '09:00', '2012-01-06', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('57', '2', '5', '10', '0', '09:00', '2012-01-09', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('58', '2', '5', '10', '0', '09:00', '2012-01-13', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('59', '2', '5', '10', '0', '09:00', '2012-01-16', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('60', '2', '5', '10', '0', '09:00', '2012-01-18', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('61', '2', '5', '10', '0', '09:00', '2012-01-20', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('62', '2', '5', '10', '0', '09:00', '2012-01-23', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('63', '2', '5', '10', '0', '09:00', '2012-01-25', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('64', '2', '5', '10', '0', '09:00', '2012-01-27', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('65', '2', '5', '10', '0', '09:00', '2012-01-30', '2012-01-11 15:05:34', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('66', '2', '1', '63', '0', '09:00', '2012-02-10', '2012-02-02 09:52:46', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('67', '2', '2', '10', '0', '09:00', '2012-02-10', '2012-02-02 09:52:46', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('68', '2', '3', '15', '0', '09:00', '2012-02-10', '2012-02-02 09:52:46', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('69', '2', '4', '10', '0', '09:00', '2012-02-10', '2012-02-02 09:52:46', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('70', '2', '5', '10', '0', '09:00', '2012-02-10', '2012-02-02 09:52:46', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('71', '2', '1', '63', '0', '09:00', '2012-01-02', '2012-06-20 13:39:42', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('72', '2', '2', '20', '0', '09:00', '2012-01-02', '2012-06-20 13:39:42', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('73', '2', '3', '10', '0', '09:00', '2012-01-02', '2012-06-20 13:39:42', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('74', '2', '4', '10', '0', '09:00', '2012-01-02', '2012-06-20 13:39:42', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('75', '2', '5', '10', '0', '09:00', '2012-01-02', '2012-06-20 13:39:42', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('76', '2', '1', '63', '0', '09:30', '2012-01-02', '2012-07-20 15:37:15', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('77', '2', '2', '10', '0', '09:30', '2012-01-02', '2012-07-20 15:37:15', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('78', '2', '3', '15', '0', '09:30', '2012-01-02', '2012-07-20 15:37:15', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('79', '2', '4', '5', '0', '09:30', '2012-01-02', '2012-07-20 15:37:15', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('80', '2', '5', '10', '0', '09:30', '2012-01-02', '2012-07-20 15:37:15', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('81', '1', '1', '60', '0', '09:00', '2012-01-02', '2012-07-20 15:38:04', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('82', '1', '2', '50', '0', '09:00', '2012-01-02', '2012-07-20 15:38:04', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('83', '1', '3', '5', '0', '09:00', '2012-01-02', '2012-07-20 15:38:04', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('84', '1', '4', '5', '0', '09:00', '2012-01-02', '2012-07-20 15:38:04', '0');
INSERT INTO `ba_ticketsalloc` VALUES ('85', '1', '5', '5', '0', '09:00', '2012-01-02', '2012-07-20 15:38:04', '0');

-- ----------------------------
-- Table structure for `ba_usreleation`
-- ----------------------------
DROP TABLE IF EXISTS `ba_usreleation`;
CREATE TABLE `ba_usreleation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `STAFF_NUM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniq` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ba_usreleation
-- ----------------------------
INSERT INTO `ba_usreleation` VALUES ('1', '10', '0100101');
INSERT INTO `ba_usreleation` VALUES ('2', '11', '001200');
INSERT INTO `ba_usreleation` VALUES ('3', '12', '10001');
INSERT INTO `ba_usreleation` VALUES ('4', '13', '2001007');

-- ----------------------------
-- Table structure for `bagnum`
-- ----------------------------
DROP TABLE IF EXISTS `bagnum`;
CREATE TABLE `bagnum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MONDAY` char(10) DEFAULT NULL,
  `MAXNUM` int(12) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bagnum
-- ----------------------------
INSERT INTO `bagnum` VALUES ('2', '120723', '120723004');

-- ----------------------------
-- Table structure for `dis_accountie`
-- ----------------------------
DROP TABLE IF EXISTS `dis_accountie`;
CREATE TABLE `dis_accountie` (
  `tieid` int(4) NOT NULL AUTO_INCREMENT,
  `Userid` int(4) NOT NULL,
  `leaderid` int(4) NOT NULL,
  PRIMARY KEY (`tieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_accountie
-- ----------------------------

-- ----------------------------
-- Table structure for `dis_advices`
-- ----------------------------
DROP TABLE IF EXISTS `dis_advices`;
CREATE TABLE `dis_advices` (
  `adsid` int(4) NOT NULL AUTO_INCREMENT,
  `Userid` int(4) NOT NULL,
  `advice` varchar(1024) NOT NULL,
  PRIMARY KEY (`adsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_advices
-- ----------------------------

-- ----------------------------
-- Table structure for `dis_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `dis_attachments`;
CREATE TABLE `dis_attachments` (
  `attacheid` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `filetype` varchar(40) NOT NULL,
  `Filename` varchar(128) NOT NULL,
  `Docid` int(4) NOT NULL,
  PRIMARY KEY (`attacheid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_attachments
-- ----------------------------
INSERT INTO `dis_attachments` VALUES ('1', '记者协会', 'txt', '1321259477759.txt', '24');
INSERT INTO `dis_attachments` VALUES ('2', '记者大会', 'txt', '1321259968697.txt', '25');

-- ----------------------------
-- Table structure for `dis_department`
-- ----------------------------
DROP TABLE IF EXISTS `dis_department`;
CREATE TABLE `dis_department` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `parentid` int(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_department
-- ----------------------------
INSERT INTO `dis_department` VALUES ('2', '业务部', '0');
INSERT INTO `dis_department` VALUES ('3', '事业部', '0');
INSERT INTO `dis_department` VALUES ('4', '人事部', '0');
INSERT INTO `dis_department` VALUES ('7', '财务部', '0');
INSERT INTO `dis_department` VALUES ('9', '审核部', '0');
INSERT INTO `dis_department` VALUES ('11', '南苑', '0');

-- ----------------------------
-- Table structure for `dis_docnum`
-- ----------------------------
DROP TABLE IF EXISTS `dis_docnum`;
CREATE TABLE `dis_docnum` (
  `docnumid` int(4) NOT NULL AUTO_INCREMENT,
  `doctypeid` int(4) NOT NULL,
  `year` int(4) NOT NULL,
  `nextnum` int(4) NOT NULL,
  PRIMARY KEY (`docnumid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_docnum
-- ----------------------------
INSERT INTO `dis_docnum` VALUES ('1', '1', '2011', '1');
INSERT INTO `dis_docnum` VALUES ('2', '2', '2011', '1');

-- ----------------------------
-- Table structure for `dis_docs`
-- ----------------------------
DROP TABLE IF EXISTS `dis_docs`;
CREATE TABLE `dis_docs` (
  `docid` int(4) NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) NOT NULL,
  `createtime` datetime NOT NULL,
  `maketime` datetime DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `typename` varchar(40) NOT NULL,
  `Urgency` varchar(40) NOT NULL,
  `publishtime` datetime DEFAULT NULL,
  `createOrg` varchar(40) DEFAULT NULL,
  `docnum` varchar(60) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `ToOrg` varchar(128) DEFAULT NULL,
  `printnum` int(4) DEFAULT NULL,
  `secretime` varchar(10) DEFAULT NULL,
  `createmode` varchar(40) DEFAULT NULL,
  `publishlevel` varchar(40) DEFAULT NULL,
  `copyto` varchar(128) DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  `result` varchar(256) DEFAULT NULL,
  `event` varchar(256) DEFAULT NULL,
  `publishOrg` varchar(40) DEFAULT NULL,
  `creator` varchar(128) NOT NULL,
  PRIMARY KEY (`docid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_docs
-- ----------------------------
INSERT INTO `dis_docs` VALUES ('17', 'docx测试用例', '2011-04-11 16:08:45', null, '1302509241093.docx', '请示', '平急', null, '中国记协办公室', null, '秘密', 'docx测试用例', null, '', '', '', 'docx测试用例', '', null, null, '中国记协办公室', '张晓亮');
INSERT INTO `dis_docs` VALUES ('18', '测试查看', '2011-04-11 18:25:10', null, '1302517233906.docx', '请示', '平急', null, '中国记协办公室', null, '秘密', '测试查看', null, '', '', '', '测试查看', '', null, null, '中国记协办公室', '张晓亮');
INSERT INTO `dis_docs` VALUES ('19', '批注', '2011-04-12 09:32:36', null, '1302571755781.docx', '请示', '平急', null, '中国记协办公室', null, '秘密', '批注', null, '', '', '', '批注', '批注', null, null, '中国记协办公室', 'czh');
INSERT INTO `dis_docs` VALUES ('20', '23', '2011-04-12 16:56:51', null, '1302598539265.docx', '请示', '加急', null, '中国记协办公室', null, '秘密', '23', null, '一年', '', '', '23', '', null, null, '中国记协办公室', 'czh');
INSERT INTO `dis_docs` VALUES ('21', '12', '2011-06-14 10:42:11', null, '1308019304656.doc', '请示', '平急', null, '中国记协办公室', null, '秘密', '12', null, '', '', '', '12', '12', null, null, '中国记协办公室', '张晓亮');
INSERT INTO `dis_docs` VALUES ('22', '1', '2011-11-11 19:26:36', null, '1321010736949.doc', '请示', '平急', null, '中国记协办公室', null, '秘密', '1', null, '', '', '', '1', '1', null, null, '中国记协办公室', '张亮');
INSERT INTO `dis_docs` VALUES ('23', '12', '2011-11-11 19:38:02', null, '1321011425800.5/gwlz/template/[object]', '请示', '平急', null, '中国记协办公室', null, '秘密', '12', null, '一年', '', '', '12', '', null, null, '中国记协办公室', '张亮');
INSERT INTO `dis_docs` VALUES ('24', '记者协会', '2011-11-14 16:31:37', null, '1321259396103.doc', '报告', '加急', null, '中国记协办公室', null, '机密', '记者协会记者协会', null, '', '', '', '记者协会记者协会记者协会', '', null, null, '中国记协办公室', '张亮');
INSERT INTO `dis_docs` VALUES ('25', '关于全国记者大会在京举行的安排事项', '2011-11-14 16:39:23', null, '1321259801384.doc', '通知', '加急', null, '中国记协办公室', null, '秘密', '记者协会', null, '', '', '', '人民代表大会', '', null, null, '中国记协办公室', '张良');

-- ----------------------------
-- Table structure for `dis_doctemplets`
-- ----------------------------
DROP TABLE IF EXISTS `dis_doctemplets`;
CREATE TABLE `dis_doctemplets` (
  `templetid` int(4) NOT NULL AUTO_INCREMENT,
  `templetname` varchar(128) NOT NULL,
  `Filename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`templetid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_doctemplets
-- ----------------------------
INSERT INTO `dis_doctemplets` VALUES ('7', '党组', '1302505346031.doc');
INSERT INTO `dis_doctemplets` VALUES ('8', '记台港澳字', '1302505366265.doc');
INSERT INTO `dis_doctemplets` VALUES ('9', '记外接字', '1302505383953.doc');
INSERT INTO `dis_doctemplets` VALUES ('10', '记外字', '1302505398390.doc');
INSERT INTO `dis_doctemplets` VALUES ('11', '记协办发', '1302505412265.doc');
INSERT INTO `dis_doctemplets` VALUES ('12', '记协办函', '1302505430359.doc');
INSERT INTO `dis_doctemplets` VALUES ('13', '记协办内', '1302505443296.doc');
INSERT INTO `dis_doctemplets` VALUES ('14', '记协办字', '1302505458718.doc');
INSERT INTO `dis_doctemplets` VALUES ('15', '记协发', '1302505500234.doc');
INSERT INTO `dis_doctemplets` VALUES ('16', '记协函', '1302505514265.doc');
INSERT INTO `dis_doctemplets` VALUES ('17', '记协内', '1302505530265.doc');
INSERT INTO `dis_doctemplets` VALUES ('18', '记协字', '1302505542281.doc');
INSERT INTO `dis_doctemplets` VALUES ('19', '党组docx', '1302505766765.docx');
INSERT INTO `dis_doctemplets` VALUES ('21', 'docxtemple', '1302507002687.docx');
INSERT INTO `dis_doctemplets` VALUES ('22', '新测试', '1321011120769.docx');
INSERT INTO `dis_doctemplets` VALUES ('23', '测试', '1321341613531.docx');

-- ----------------------------
-- Table structure for `dis_doctypes`
-- ----------------------------
DROP TABLE IF EXISTS `dis_doctypes`;
CREATE TABLE `dis_doctypes` (
  `doctypeid` int(4) NOT NULL AUTO_INCREMENT,
  `typename` varchar(40) NOT NULL,
  `templetid` int(4) NOT NULL,
  PRIMARY KEY (`doctypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_doctypes
-- ----------------------------
INSERT INTO `dis_doctypes` VALUES ('1', '加急', '0');
INSERT INTO `dis_doctypes` VALUES ('2', '文件', '0');

-- ----------------------------
-- Table structure for `dis_flows`
-- ----------------------------
DROP TABLE IF EXISTS `dis_flows`;
CREATE TABLE `dis_flows` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `powergroup` int(4) NOT NULL,
  `docid` int(4) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `sendtime` datetime NOT NULL,
  `Fatherid` int(4) NOT NULL,
  `flag` int(4) NOT NULL,
  `processorid` int(4) NOT NULL,
  `version` int(4) NOT NULL,
  `opertime` datetime DEFAULT NULL,
  `operationtor` varchar(128) DEFAULT NULL,
  `advice` varchar(1024) DEFAULT NULL,
  `flowName` varchar(40) DEFAULT NULL,
  `flowtor` varchar(128) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_flows
-- ----------------------------
INSERT INTO `dis_flows` VALUES ('35', '0', '17', '承办处审核', '2011-04-11 16:08:45', '0', '1', '10', '1', '2011-04-11 16:09:10', 'czh', '去审核', '起草', '张晓亮');
INSERT INTO `dis_flows` VALUES ('36', '2', '17', '承办处审核', '2011-04-11 16:09:10', '35', '1', '12', '1', '2011-04-11 16:09:10', '张晓亮', null, '承办处审核', 'czh');
INSERT INTO `dis_flows` VALUES ('37', '0', '18', '待核稿', '2011-04-11 18:25:10', '0', '1', '10', '1', '2011-04-11 18:27:25', 'czh', '多大', '起草', '张晓亮');
INSERT INTO `dis_flows` VALUES ('38', '1', '18', '待核稿', '2011-04-11 18:27:25', '37', '0', '12', '1', '2011-04-11 18:27:25', '张晓亮', null, '待核稿', 'czh');
INSERT INTO `dis_flows` VALUES ('39', '0', '19', '待核稿', '2011-04-12 09:32:36', '0', '1', '12', '1', '2011-04-12 09:32:50', '张晓亮', '12', '起草', 'czh');
INSERT INTO `dis_flows` VALUES ('40', '1', '19', '待核稿', '2011-04-12 09:32:50', '39', '0', '10', '1', '2011-04-12 09:32:50', 'czh', null, '待核稿', '张晓亮');
INSERT INTO `dis_flows` VALUES ('41', '0', '20', '起草中', '2011-04-12 16:56:51', '0', '0', '12', '1', '2011-04-12 16:56:51', 'czh', null, '起草', 'czh');
INSERT INTO `dis_flows` VALUES ('42', '0', '21', '起草中', '2011-06-14 10:42:11', '0', '1', '10', '1', '2011-06-14 10:42:11', '张晓亮', null, '起草', '张晓亮');
INSERT INTO `dis_flows` VALUES ('43', '0', '22', '起草中', '2011-11-11 19:26:36', '0', '1', '11', '1', '2011-11-11 19:26:36', '张亮', null, '起草', '张亮');
INSERT INTO `dis_flows` VALUES ('44', '0', '23', '起草中', '2011-11-11 19:38:02', '0', '1', '11', '1', '2011-11-11 19:38:02', '张亮', null, '起草', '张亮');
INSERT INTO `dis_flows` VALUES ('45', '0', '24', '待核稿', '2011-11-14 16:31:37', '0', '1', '11', '0', '2011-11-14 16:32:26', '张晓亮', '记者协会记者协会记者协会记者协会记者协会', '起草', '张亮');
INSERT INTO `dis_flows` VALUES ('46', '1', '24', '已撤回', '2011-11-14 16:32:19', '45', '4', '10', '0', '2011-11-14 16:41:41', '张亮', '', '待核稿', '张晓亮');
INSERT INTO `dis_flows` VALUES ('47', '0', '25', '待核稿', '2011-11-14 16:39:23', '0', '1', '16', '1', '2011-11-14 16:40:06', '张亮', '大会举行注意事项', '起草', '张良');
INSERT INTO `dis_flows` VALUES ('48', '1', '25', '待核稿', '2011-11-14 16:39:55', '47', '0', '11', '0', '2011-11-14 16:39:55', '张良', null, '待核稿', '张亮');
INSERT INTO `dis_flows` VALUES ('49', '1', '25', '承办处审核', '2011-11-14 16:39:59', '47', '1', '11', '1', '2011-11-14 16:41:08', '张良', '大会信息', '待核稿', '张亮');
INSERT INTO `dis_flows` VALUES ('50', '2', '25', '承办处审核', '2011-11-14 16:41:00', '49', '1', '16', '1', '2011-11-14 16:41:00', '张亮', null, '承办处审核', '张良');
INSERT INTO `dis_flows` VALUES ('51', '0', '24', '待核稿', '2011-11-14 16:41:33', '0', '1', '11', '0', '2011-11-14 16:42:01', '张良', '记者协会 大会举行', '起草', '张亮');
INSERT INTO `dis_flows` VALUES ('52', '1', '24', '已撤回', '2011-11-14 16:41:54', '51', '4', '16', '0', '2011-11-14 16:44:31', '张亮', '', '待核稿', '张良');
INSERT INTO `dis_flows` VALUES ('53', '0', '24', '已撤回', '2011-11-14 16:44:24', '0', '1', '11', '1', '2011-11-14 16:44:24', '张亮', '记者协会 大会举行', '起草', '张亮');

-- ----------------------------
-- Table structure for `dis_gpreleation`
-- ----------------------------
DROP TABLE IF EXISTS `dis_gpreleation`;
CREATE TABLE `dis_gpreleation` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `groupid` int(4) NOT NULL,
  `powerid` int(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_gpreleation
-- ----------------------------
INSERT INTO `dis_gpreleation` VALUES ('55', '7', '0');
INSERT INTO `dis_gpreleation` VALUES ('56', '7', '1');
INSERT INTO `dis_gpreleation` VALUES ('57', '7', '2');
INSERT INTO `dis_gpreleation` VALUES ('58', '7', '3');
INSERT INTO `dis_gpreleation` VALUES ('59', '7', '4');
INSERT INTO `dis_gpreleation` VALUES ('60', '7', '7');
INSERT INTO `dis_gpreleation` VALUES ('61', '6', '0');
INSERT INTO `dis_gpreleation` VALUES ('62', '6', '1');
INSERT INTO `dis_gpreleation` VALUES ('63', '6', '2');
INSERT INTO `dis_gpreleation` VALUES ('64', '6', '3');
INSERT INTO `dis_gpreleation` VALUES ('65', '6', '4');
INSERT INTO `dis_gpreleation` VALUES ('66', '6', '5');
INSERT INTO `dis_gpreleation` VALUES ('67', '6', '6');
INSERT INTO `dis_gpreleation` VALUES ('68', '8', '0');
INSERT INTO `dis_gpreleation` VALUES ('71', '9', '3');

-- ----------------------------
-- Table structure for `dis_group`
-- ----------------------------
DROP TABLE IF EXISTS `dis_group`;
CREATE TABLE `dis_group` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mem` varchar(40) DEFAULT NULL,
  `dpmid` int(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_group
-- ----------------------------
INSERT INTO `dis_group` VALUES ('6', '系统管理', '', '2');
INSERT INTO `dis_group` VALUES ('7', '业务审核', '', '2');
INSERT INTO `dis_group` VALUES ('8', '南苑售票', '订售票人员', '2');
INSERT INTO `dis_group` VALUES ('9', '普通系统管理', '', '2');

-- ----------------------------
-- Table structure for `dis_logs`
-- ----------------------------
DROP TABLE IF EXISTS `dis_logs`;
CREATE TABLE `dis_logs` (
  `Logid` int(4) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `Actiontype` varchar(64) NOT NULL,
  `Action` varchar(64) DEFAULT NULL,
  `IP` varchar(32) NOT NULL,
  `Logtime` datetime NOT NULL,
  PRIMARY KEY (`Logid`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_logs
-- ----------------------------
INSERT INTO `dis_logs` VALUES ('169', 'admin', '部门管理', '增加部门成功', '127.0.0.1', '2011-04-11 14:13:13');
INSERT INTO `dis_logs` VALUES ('170', 'admin', '组别设置', '添加组别成功', '127.0.0.1', '2011-04-11 14:13:29');
INSERT INTO `dis_logs` VALUES ('171', 'admin', '组别设置', '添加组别成功', '127.0.0.1', '2011-04-11 14:13:43');
INSERT INTO `dis_logs` VALUES ('172', 'admin', '组别设置', '设置权限成功', '127.0.0.1', '2011-04-11 14:14:21');
INSERT INTO `dis_logs` VALUES ('173', 'admin', '组别设置', '设置权限成功', '127.0.0.1', '2011-04-11 14:14:32');
INSERT INTO `dis_logs` VALUES ('174', 'admin', '用户管理', '增加用户成功', '127.0.0.1', '2011-04-11 14:15:16');
INSERT INTO `dis_logs` VALUES ('175', 'admin', '用户管理', '增加用户成功', '127.0.0.1', '2011-04-11 14:15:40');
INSERT INTO `dis_logs` VALUES ('176', 'admin', '用户管理', '增加用户成功', '127.0.0.1', '2011-04-11 14:15:59');
INSERT INTO `dis_logs` VALUES ('177', 'admin', '用户管理', '修改用户成功', '127.0.0.1', '2011-04-11 14:16:18');
INSERT INTO `dis_logs` VALUES ('178', 'admin', '用户管理', '修改用户成功', '127.0.0.1', '2011-04-11 14:16:34');
INSERT INTO `dis_logs` VALUES ('179', 'zhangliang', '参数设置', '更新参数设置成功', '127.0.0.1', '2011-04-11 14:58:54');
INSERT INTO `dis_logs` VALUES ('180', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:02:26');
INSERT INTO `dis_logs` VALUES ('181', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:02:46');
INSERT INTO `dis_logs` VALUES ('182', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:03:03');
INSERT INTO `dis_logs` VALUES ('183', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:03:18');
INSERT INTO `dis_logs` VALUES ('184', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:03:32');
INSERT INTO `dis_logs` VALUES ('185', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:03:50');
INSERT INTO `dis_logs` VALUES ('186', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:04:03');
INSERT INTO `dis_logs` VALUES ('187', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:04:18');
INSERT INTO `dis_logs` VALUES ('188', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:05:00');
INSERT INTO `dis_logs` VALUES ('189', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:05:14');
INSERT INTO `dis_logs` VALUES ('190', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:05:30');
INSERT INTO `dis_logs` VALUES ('191', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:05:42');
INSERT INTO `dis_logs` VALUES ('192', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:09:26');
INSERT INTO `dis_logs` VALUES ('193', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:23:54');
INSERT INTO `dis_logs` VALUES ('194', 'zhangliang', '模板管理', '删除模板成功', '127.0.0.1', '2011-04-11 15:24:48');
INSERT INTO `dis_logs` VALUES ('195', 'zhangliang', '参数设置', '更新参数设置成功', '127.0.0.1', '2011-04-11 15:25:57');
INSERT INTO `dis_logs` VALUES ('196', 'zhangliang', '参数设置', '更新参数设置成功', '127.0.0.1', '2011-04-11 15:29:38');
INSERT INTO `dis_logs` VALUES ('197', 'zhangliang', '模板管理', '添加模板成功', '127.0.0.1', '2011-04-11 15:30:02');
INSERT INTO `dis_logs` VALUES ('198', 'zhangxiaoliang', '起草公文', '起草公文成功', '127.0.0.1', '2011-04-11 16:08:45');
INSERT INTO `dis_logs` VALUES ('199', 'zhangxiaoliang', '提交公文', '提交公文成功', '127.0.0.1', '2011-04-11 16:09:10');
INSERT INTO `dis_logs` VALUES ('200', 'czh', '修改公文', '修改公文成功', '127.0.0.1', '2011-04-11 17:08:03');
INSERT INTO `dis_logs` VALUES ('201', 'zhangxiaoliang', '起草公文', '起草公文成功', '127.0.0.1', '2011-04-11 18:25:10');
INSERT INTO `dis_logs` VALUES ('202', 'zhangxiaoliang', '提交公文', '提交公文成功', '127.0.0.1', '2011-04-11 18:27:25');
INSERT INTO `dis_logs` VALUES ('203', 'czh', '起草公文', '起草公文成功', '127.0.0.1', '2011-04-12 09:32:36');
INSERT INTO `dis_logs` VALUES ('204', 'czh', '提交公文', '提交公文成功', '127.0.0.1', '2011-04-12 09:32:50');
INSERT INTO `dis_logs` VALUES ('205', 'czh', '起草公文', '起草公文成功', '127.0.0.1', '2011-04-12 16:56:51');
INSERT INTO `dis_logs` VALUES ('206', 'zhangliang', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-14 18:37:40');
INSERT INTO `dis_logs` VALUES ('207', 'zhangliang', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-14 18:57:05');
INSERT INTO `dis_logs` VALUES ('208', 'zhangliang', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-15 09:20:09');
INSERT INTO `dis_logs` VALUES ('209', 'zhangliang', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-15 18:28:23');
INSERT INTO `dis_logs` VALUES ('210', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-25 14:03:21');
INSERT INTO `dis_logs` VALUES ('211', 'zhangliang', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-25 18:21:19');
INSERT INTO `dis_logs` VALUES ('212', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-26 09:54:26');
INSERT INTO `dis_logs` VALUES ('213', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-26 09:57:28');
INSERT INTO `dis_logs` VALUES ('214', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-26 12:53:15');
INSERT INTO `dis_logs` VALUES ('215', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-26 14:29:23');
INSERT INTO `dis_logs` VALUES ('216', 'admin', '部门管理', '增加部门成功', '127.0.0.1', '2011-04-26 14:29:34');
INSERT INTO `dis_logs` VALUES ('217', 'admin', '用户管理', '增加用户成功', '127.0.0.1', '2011-04-26 14:30:08');
INSERT INTO `dis_logs` VALUES ('218', 'admin', '部门管理', '增加部门成功', '127.0.0.1', '2011-04-26 14:41:48');
INSERT INTO `dis_logs` VALUES ('219', 'admin', '用户管理', '增加用户成功', '127.0.0.1', '2011-04-26 14:42:17');
INSERT INTO `dis_logs` VALUES ('220', 'admin', '用户管理', '增加用户成功', '127.0.0.1', '2011-04-26 14:42:36');
INSERT INTO `dis_logs` VALUES ('221', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-04-26 18:23:22');
INSERT INTO `dis_logs` VALUES ('222', 'admin', '用户监控', '取消上网成功', '192.168.1.10', '2011-05-03 10:48:13');
INSERT INTO `dis_logs` VALUES ('223', 'admin', '用户监控', '取消上网成功', '192.168.1.10', '2011-05-03 13:36:10');
INSERT INTO `dis_logs` VALUES ('224', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-05 10:28:04');
INSERT INTO `dis_logs` VALUES ('225', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-05 14:50:09');
INSERT INTO `dis_logs` VALUES ('226', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-05 15:27:22');
INSERT INTO `dis_logs` VALUES ('227', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-10 16:51:51');
INSERT INTO `dis_logs` VALUES ('228', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-10 19:13:13');
INSERT INTO `dis_logs` VALUES ('229', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-10 19:21:46');
INSERT INTO `dis_logs` VALUES ('230', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-10 19:23:16');
INSERT INTO `dis_logs` VALUES ('231', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-10 19:33:08');
INSERT INTO `dis_logs` VALUES ('232', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-10 19:36:49');
INSERT INTO `dis_logs` VALUES ('233', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-11 09:34:04');
INSERT INTO `dis_logs` VALUES ('234', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-11 09:39:04');
INSERT INTO `dis_logs` VALUES ('235', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-11 11:51:25');
INSERT INTO `dis_logs` VALUES ('236', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-11 11:59:29');
INSERT INTO `dis_logs` VALUES ('237', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-11 15:22:38');
INSERT INTO `dis_logs` VALUES ('238', 'admin', '用户监控', '取消上网成功', '127.0.0.1', '2011-05-13 09:25:31');
INSERT INTO `dis_logs` VALUES ('299', 'admin', '日志管理', '删除系统日志成功', '127.0.0.1', '2011-11-17 10:03:29');
INSERT INTO `dis_logs` VALUES ('300', 'admin', '部门管理', '增加部门成功', '127.0.0.1', '2011-11-17 11:20:42');
INSERT INTO `dis_logs` VALUES ('301', 'admin', '部门管理', '增加部门成功', '127.0.0.1', '2011-11-17 11:21:01');
INSERT INTO `dis_logs` VALUES ('302', 'admin', '部门管理', '删除部门成功', '127.0.0.1', '2011-11-23 09:58:39');
INSERT INTO `dis_logs` VALUES ('303', 'admin', '部门管理', '增加部门失败', '127.0.0.1', '2011-11-30 17:44:44');
INSERT INTO `dis_logs` VALUES ('304', 'admin', '用户管理', '删除用户成功', '127.0.0.1', '2011-12-19 20:21:34');
INSERT INTO `dis_logs` VALUES ('305', 'admin', '用户管理', '增加用户成功', '127.0.0.1', '2011-12-19 20:22:02');
INSERT INTO `dis_logs` VALUES ('306', 'admin', '组别设置', '删除组别失败', '127.0.0.1', '2011-12-25 14:02:40');
INSERT INTO `dis_logs` VALUES ('307', 'admin', '用户管理', '修改用户成功', '127.0.0.1', '2011-12-25 14:10:56');
INSERT INTO `dis_logs` VALUES ('308', 'czh', '组别设置', '添加组别成功', '127.0.0.1', '2011-12-25 15:43:32');
INSERT INTO `dis_logs` VALUES ('309', 'czh', '组别设置', '设置权限成功', '127.0.0.1', '2011-12-25 15:43:41');
INSERT INTO `dis_logs` VALUES ('310', 'czh', '用户管理', '增加用户成功', '127.0.0.1', '2011-12-25 15:44:25');
INSERT INTO `dis_logs` VALUES ('311', 'czh', '组别设置', '修改组别成功', '127.0.0.1', '2011-12-27 17:26:39');
INSERT INTO `dis_logs` VALUES ('312', 'czh', '用户管理', '增加用户成功', '192.168.1.116', '2012-01-07 19:23:13');
INSERT INTO `dis_logs` VALUES ('313', 'czh', '用户管理', '删除用户成功', '127.0.0.1', '2012-01-09 15:37:42');
INSERT INTO `dis_logs` VALUES ('314', 'czh', '用户管理', '删除用户成功', '127.0.0.1', '2012-01-09 15:41:12');
INSERT INTO `dis_logs` VALUES ('315', 'czh', '用户管理', '删除用户成功', '127.0.0.1', '2012-01-09 15:42:08');
INSERT INTO `dis_logs` VALUES ('316', 'czh', '组别设置', '添加组别成功', '127.0.0.1', '2012-01-17 14:49:55');
INSERT INTO `dis_logs` VALUES ('317', 'czh', '组别设置', '设置权限成功', '127.0.0.1', '2012-01-17 14:50:07');
INSERT INTO `dis_logs` VALUES ('318', 'czh', '用户管理', '增加用户成功', '127.0.0.1', '2012-01-17 14:50:40');
INSERT INTO `dis_logs` VALUES ('319', 'czh', '组别设置', '设置权限成功', '127.0.0.1', '2012-01-17 14:51:40');
INSERT INTO `dis_logs` VALUES ('320', 'gzf', '组别设置', '设置权限成功', '127.0.0.1', '2012-01-17 14:57:08');

-- ----------------------------
-- Table structure for `dis_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `dis_parameter`;
CREATE TABLE `dis_parameter` (
  `templateip` varchar(128) NOT NULL,
  `attacheip` varchar(128) NOT NULL,
  `contentip` varchar(128) NOT NULL,
  `docsbackip` varchar(128) NOT NULL,
  `httpupload` varchar(128) NOT NULL,
  `httpdnload` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_parameter
-- ----------------------------
INSERT INTO `dis_parameter` VALUES ('E:\\gwlz\\template\\', 'E:\\gwlz\\attache\\', 'E:\\gwlz\\content\\', 'E:\\gwlz\\back\\', 'http://192.168.1.56/gwlz/upload/receiveFile.asp', 'http://192.168.1.56/gwlz/');

-- ----------------------------
-- Table structure for `dis_ugrelation`
-- ----------------------------
DROP TABLE IF EXISTS `dis_ugrelation`;
CREATE TABLE `dis_ugrelation` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` int(4) NOT NULL,
  `groupid` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_ugrelation
-- ----------------------------
INSERT INTO `dis_ugrelation` VALUES ('26', '19', '6');
INSERT INTO `dis_ugrelation` VALUES ('27', '19', '7');
INSERT INTO `dis_ugrelation` VALUES ('28', '20', '8');
INSERT INTO `dis_ugrelation` VALUES ('29', '21', '6');
INSERT INTO `dis_ugrelation` VALUES ('30', '22', '9');

-- ----------------------------
-- Table structure for `dis_userpage`
-- ----------------------------
DROP TABLE IF EXISTS `dis_userpage`;
CREATE TABLE `dis_userpage` (
  `fileTempPath` varchar(128) NOT NULL,
  `fileNumber` int(4) NOT NULL,
  `selectLogin` int(4) NOT NULL,
  `userid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_userpage
-- ----------------------------
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '10');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '11');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '12');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '13');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '14');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '15');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '16');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '17');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '18');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '19');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '20');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '21');
INSERT INTO `dis_userpage` VALUES ('c:\\\\founder', '20', '0', '22');

-- ----------------------------
-- Table structure for `dis_users`
-- ----------------------------
DROP TABLE IF EXISTS `dis_users`;
CREATE TABLE `dis_users` (
  `delete_flag` char(3) DEFAULT NULL,
  `userid` int(4) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `name` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dmpid` int(4) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `other` varchar(1024) DEFAULT NULL,
  `type` int(4) NOT NULL,
  `im` varchar(20) DEFAULT NULL,
  `orders` int(4) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_users
-- ----------------------------
INSERT INTO `dis_users` VALUES ('0', '9', 'admin', 'admin', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `dis_users` VALUES ('0', '13', 'wangming', '王明', '1', '3', '', '', '', '0', '', '3');
INSERT INTO `dis_users` VALUES ('0', '14', 'wangliang', '王亮', '1', '4', '', '', '', '0', '', '1');
INSERT INTO `dis_users` VALUES ('0', '15', 'liming', '黎明', '1', '4', '', '', '', '0', '', '1');
INSERT INTO `dis_users` VALUES ('0', '17', 'wangxiaoming', '王小明', '1', '3', 'wangxiaoming@126.com', '13800138000', 'agagaagag', '0', '888888888', '2');
INSERT INTO `dis_users` VALUES ('0', '18', 'caiwu', '财务', '1', '7', 'caiwu@126.com', '13800138000', '财务', '0', '888888888', '1');
INSERT INTO `dis_users` VALUES ('0', '19', 'czh', 'czh', '1', '2', 'zihua2005@163.com', '1380', '8990', '0', '0110', '1');
INSERT INTO `dis_users` VALUES ('0', '20', 'huhongliang', '胡红亮', '111111', '2', '', '', '', '0', '01001', '1');
INSERT INTO `dis_users` VALUES ('0', '21', 'test', '测试', '1', '2', '', '', '', '0', '0001', '1');
INSERT INTO `dis_users` VALUES ('0', '22', 'gzf', '龚再飞', '1', '2', '', '', '', '0', '1', '1');

-- ----------------------------
-- Table structure for `dis_watches`
-- ----------------------------
DROP TABLE IF EXISTS `dis_watches`;
CREATE TABLE `dis_watches` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Userid` int(4) NOT NULL,
  `ipaddress` varchar(40) NOT NULL,
  `logintime` datetime NOT NULL,
  `refreshtime` datetime NOT NULL,
  `docid` int(4) NOT NULL,
  `doctypeid` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dis_watches
-- ----------------------------

-- ----------------------------
-- Table structure for `gwlz_admin`
-- ----------------------------
DROP TABLE IF EXISTS `gwlz_admin`;
CREATE TABLE `gwlz_admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gwlz_admin
-- ----------------------------
INSERT INTO `gwlz_admin` VALUES ('2', 'admin', '1', 'admin');

-- ----------------------------
-- Table structure for `op_ordertickets`
-- ----------------------------
DROP TABLE IF EXISTS `op_ordertickets`;
CREATE TABLE `op_ordertickets` (
  `FLIGHTINFO_ID` int(11) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `CERT_TYPE` varchar(10) DEFAULT NULL,
  `CERT_NO` varchar(50) DEFAULT NULL,
  `LINKPHONE` varchar(50) DEFAULT NULL,
  `VIP_FLAG` varchar(10) DEFAULT NULL,
  `TICKETPOINT_ID` int(11) DEFAULT NULL,
  `FLIGHT_NO` varchar(20) DEFAULT NULL,
  `PAYMENT` varchar(20) DEFAULT NULL,
  `TICKETPRICE` int(11) DEFAULT NULL,
  `REMARK` varchar(400) DEFAULT NULL,
  `GATE` varchar(50) DEFAULT NULL,
  `HALFPRICECARD` varchar(50) DEFAULT NULL,
  `ZEROPRICECARD` varchar(50) DEFAULT NULL,
  `CREATEDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DELETE_FLAG` char(3) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LUGG_SUM` int(11) DEFAULT NULL,
  `WEIGHT_SUM` float DEFAULT NULL,
  `SEAT_NUM` varchar(20) DEFAULT NULL,
  `GATE_TIME` varchar(20) DEFAULT NULL,
  `PRICE_ID` int(11) DEFAULT NULL,
  `BAG_NUM` varchar(800) DEFAULT NULL,
  `TEAM_NAME` varchar(300) DEFAULT NULL,
  `TEAMFLAG` char(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of op_ordertickets
-- ----------------------------
INSERT INTO `op_ordertickets` VALUES ('1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2012-06-08 09:59:53', '0', '1', '1', '1', null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('1', '2', '1', '1', '1', '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '2012-06-08 09:59:53', '0', '2', '1', '11', null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '4', '网名', '身份证', '22011111111111', '010668899966', '1', '1', '4009', null, null, '22222', '4-6', null, null, '2012-06-20 13:13:30', '0', '3', null, null, null, '08:30', '5', null, '', '0');
INSERT INTO `op_ordertickets` VALUES ('355', '4', '测试', '身份证', '12', '12', '0', '1', '4009', '现金', '1650', '12', '4-6', '12', '12', '2012-06-20 13:13:31', '0', '4', null, null, null, '08:30', '5', null, '', '0');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '闪金', '身份证', '12', '忘记', '0', '2', '4009', '现金', '850', '12', '4-6', '12', '12', '2012-06-20 13:13:33', '0', '5', null, null, null, '08:30', '5', null, '', '0');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '成都', '其他', '2001', '12', '0', '3', '4008', '现金', '850', '无', '4-6', '', '', '2012-06-20 13:13:36', '0', '6', '3', '2', '1B', '09:00', null, null, '', '0');
INSERT INTO `op_ordertickets` VALUES ('356', '2', '我是', '身份证', '12', '1212', '0', '1', '4008', '现金', '1650', '12', null, '12', '12', '2012-06-08 09:59:53', '0', '7', '3', '2', null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '张三', '身份证', '200111', '13800138000', '0', '1', '4009', null, null, '12', '4-6', null, null, '2012-06-08 15:39:17', '0', '8', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '王磊', '军人证', '2201111', '0201', '1', '4', '4009', null, null, '12', '4-6', null, null, '2012-06-08 15:39:17', '0', '9', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '1', '身份证', '1', '1', '0', '2', '4009', null, null, '1', '4-6', null, null, '2012-06-08 15:39:17', '0', '10', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '1', '身份证', '2', '2', '0', '2', '4009', null, null, '2', '4-6', null, null, '2012-06-08 15:39:17', '0', '11', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '4', '谢耳朵', '1', '1', '1', '1', '1', '1', '1', '1', '1', '4-6', '1', '1', '2012-06-20 15:24:24', '0', '12', null, null, '6B', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '4', '刘芳', '户口簿', '4005555', '010889999', '1', '3', '4009', '现金', '1650', '修改', '4-6', '10101010', '202020', '2012-06-20 15:29:55', '0', '13', null, null, '7C', '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '4', '艾米', '1', '1', '1', '1', '1', '1', '1', '1', '1', '4-6', '1', '1', '2012-06-28 13:47:35', '0', '14', null, null, '1D', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '4', '拍你', '1', '1', '1', '1', '1', '1', '1', '1', '1', '4-6', '1', '1', '2012-06-20 15:30:05', '0', '15', null, null, '5F', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('13', '2', '刘芳', '户口簿', '4005555', '010889999', '1', '3', '4009', null, null, '备注', null, null, null, '2012-06-28 14:06:34', '0', '16', null, null, null, null, null, null, '测试团1', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '王老吉', '户口簿', '220111111111', '13800138000', '0', '2', '4009', '现金', null, '有备注', '4-6', '', '', '2012-06-28 14:07:11', '0', '17', null, null, '2B', '08:30', '5', null, '测试团1', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', 'czh', '身份证', '12121', '1212', '0', '5', '4009', null, null, '12', '4-6', null, null, '2012-06-28 14:07:11', '0', '18', null, null, null, '08:30', '5', null, '测试团1', '1');
INSERT INTO `op_ordertickets` VALUES ('356', '2', '王家', '身份证', '12', '12', '0', '1', '4008', '现金', null, '12', null, '11111', '', '2012-06-08 09:59:53', '0', '19', null, null, null, null, '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '张龙', '军人证', '12121212', '12', '0', '3', '1212', '现金', null, '我的备注信息 ', '4-6', '', '', '2012-06-08 15:39:17', '0', '20', null, null, '8B', '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('630', '2', '望江', '身份证', '101010', '1010', '0', '1', '4008', '现金', null, '1010', null, '', '', '2012-06-08 09:59:53', '0', '21', null, null, null, null, '8', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('630', '2', '10', '身份证', '10', '10', '0', '1', '4008', '现金', null, '10', null, '10', '10', '2012-06-08 09:59:53', '0', '22', null, null, null, null, '8', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '胡红亮', '身份证', '1111111111', '13800138000', '1', '1', '', '现金', null, '南苑机场', '4-6', '20002', '', '2012-06-08 15:39:17', '0', '23', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '留春', '身份证', '11111101010', '1010', '1', '1', '4008', '现金', null, '1010', '4-6', '100001', '', '2012-06-08 15:39:17', '0', '24', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '流明', '军人证', '225144', '225444122', '0', '1', '', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '25', null, null, '5C', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '李四', '户口簿', '999566', '138940888', '1', '1', '4008', null, null, '备注1', '4-6', null, null, '2012-06-08 15:39:17', '0', '26', null, null, '4B', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '王锦涛', '身份证', '1212', '1212', '0', '5', '4008', null, null, '12', '4-6', null, null, '2012-06-08 15:39:17', '0', '27', null, null, null, '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '121', '身份证', '12', '121', '0', '5', '4008', null, null, '12', '4-6', null, null, '2012-06-08 15:39:17', '0', '28', null, null, null, '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '1212', '身份证', '121', '12', '1', '5', '4008', null, null, '12', '4-6', null, null, '2012-06-08 15:39:17', '0', '29', null, null, null, '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '12', '户口簿', '12', '12', '1', '5', '4008', '现金', null, '12', '4-6', '', '', '2012-06-08 15:39:17', '0', '30', null, null, null, '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '12', '身份证', '', '12', '0', '3', '12', '现金', null, '12', '4-6', '2500', '', '2012-06-08 15:39:17', '0', '31', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '12', '军人证', '12', '12', '0', '5', '12', '现金', null, '12', '4-6', '555', '', '2012-06-08 15:39:17', '0', '32', null, null, null, '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '龚再飞', '军人证', '2008', '13800138000', '0', '1', '4008', '现金', null, '', '4-6', '1212', '', '2012-06-08 15:39:16', '0', '33', null, null, '1E', '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '王晓明', '户口簿', '440', '13892555', '0', '2', '4008', '现金', null, '', '4-6', '111111', '', '2012-06-08 15:39:17', '0', '34', null, null, '7B', '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '1', '身份证', '123456789012536', '1', '0', '1', '1', '现金', null, '111', '4-6', '11', '', '2012-06-08 15:39:16', '0', '35', null, null, null, '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '1212', '身份证', '222222222222222', '12', '0', '1', '', '现金', null, '', '4-6', '220000', '', '2012-06-08 15:39:16', '0', '36', null, null, null, '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', 'aaa', '身份证', '555555555555555555', 'aa', '0', '1', '', '现金', null, 'aaa', '4-6', '1111111', '', '2012-06-08 15:39:16', '0', '37', null, null, null, '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('356', '2', '王楠', '军人证', '200811001', '13800138000', '0', '1', '4008', null, null, '1', null, null, null, '2012-06-08 09:59:53', '0', '38', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '张潮阳', '军人证', '0132000', '13800013800', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '39', null, null, '2B', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('361', '2', '玉伽小妹妹', '身份证', '231083198404194413', '12345678', '0', '1', '4002', '现金', null, '123', null, '', '', '2012-06-08 09:59:53', '0', '40', null, null, null, null, '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('361', '2', '121', '身份证', '111111111111111', '11111111111111111', '0', '1', '4002', null, null, '11', null, null, null, '2012-06-08 09:59:53', '0', '41', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '222', '户口簿', '222', '2', '0', '5', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '42', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '佘立钦', '军人证', '空字第0782629号', '13830747837', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '43', null, null, 'V2-A', '09:00', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '徐燕', '军人证', '空字第0783343号', '13649379185', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '44', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '姚广峰', '军人证', '空文字第0122167号', '13811410460', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '45', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '刘广', '军人证', '警字第030100079号', '13811174589', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '46', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '王成', '身份证', '110102197208293312', '13811175979', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '47', null, null, '6A', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王建宗', '身份证', '210105196103152239', '132388302349', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '48', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '刘丽', '身份证', '622123197912150028', '18001222399', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '49', null, null, '5A', '08:30', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '回莹', '身份证', '130902198205111220', '15009489080', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '50', null, null, '2E', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '代小提', '户口簿', '130902200912150020', '15009489080', '0', '1', '4008', '现金', null, '', '5', '', '', '2012-06-08 09:59:53', '0', '51', null, null, '1F', '08:40', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '童亚湘', '警官证', '北字第0420207号', '13521809859', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '52', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '刘杰', '身份证', '12010519630126001X', '18622651693', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '53', null, null, '4F', '08:30', '6', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王俊', '军人证', '空字第0781740号', '13830775868', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '54', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '马晓明', '军人证', '空字第0783018号', '13993720609', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '55', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '申贵', '军人证', '空字第0783558号', '13993720609', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '56', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '任胜利', '军人证', '空字第0782296号', '13993720609', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '57', null, null, 'V2-D', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '刘波', '身份证', '430105195806291311', '13651199520', '1', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '58', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '张欢', '身份证', '610581198708131627', '13651199520', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '59', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '李寒松', '身份证', '630104197612292519', '13651199520', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '60', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '魏法杰', '身份证', '11010819540701221X', '15010268442', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '61', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '周晟瀚', '身份证', '41302219810305003X', '15010268442', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '62', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '刘安英', '身份证', '342401198311221527', '15010268442', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '63', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '曾军崴', '身份证', '430722198802014774', '15010268442', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '64', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '乐耀东', '身份证', '330211198901110032', '15010268442', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '65', null, null, '3D', '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '董夕林', '军人证', '空字第0122136号', '13552008057', '1', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '66', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '贺峰', '军人证', '空字第0421218号', '13552008057', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:16', '0', '67', null, null, '2D', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王桂玲', '身份证', '22010619701012333X', '13552008057', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '68', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '林涛', '身份证', '11010619701012333X', '13552008057', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '69', null, null, '4D', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '立宗星', '身份证', '371427198201040039', '13905112796', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '70', null, null, '4C', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '李瑞光', '户口簿', '371427199512302510', '13905112796', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '71', null, null, '4A', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '张义利', '身份证', '372801197404124833', '13830730178', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '72', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王俊芬', '军人证', '空字第0782319号', '13830160761', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '73', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王家乐', '身份证', '130427200111133912', '13830160761', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '74', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '杨俊伟', '身份证', '610103196602073617', '15982388269', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '75', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '刘明', '身份证', '410402197301302014', '15982388269', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '76', null, null, '5B', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '夏超', '身份证', '513624198107054395', '15982388269', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '77', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王冉', '身份证', '110108198008293716', '13520695330', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '78', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '吴路刚', '军人证', '空字第0404141号', '13661317339', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '79', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '初明阳', '军人证', '空字第0784258号', '13661317339', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '80', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '申洋', '军人证', '空字第0404153号', '15811057267', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '81', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '方新', '军人证', '空字第0103108号', '15811057267', '0', '1', '4008', '现金', null, '*****', '4-6', '', '', '2012-06-08 09:59:53', '0', '82', null, null, 'V2-A', '09:00', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '李鸿鹏', '军人证', '空字第09079963号', '15811057267', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '83', null, null, '3F', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王广航', '军人证', '空字第201313号', '13641268577', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '84', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '康军', '身份证', '620103196401180610', '01067141618', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '85', null, null, '2F', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '刘继军', '身份证', '342221198102160558', '01067141618', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '86', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '杨琼', '军人证', '空字第20310447号', '15133617323', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '87', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '贾润', '身份证', '230103196602116715', '13820035055', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '88', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '聂望青', '军人证', '空字第0784227号', '13809377891', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '89', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '刘胜利', '军人证', '空文字第51080019号', '01066361178', '0', '2', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '90', '2', '26', '1D', '08:40', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王晓杰', '身份证', '210603196507096025', '18911108227', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '91', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王婷', '军人证', '空字第0423384号', '18911108222', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '92', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '刘郁林', '身份证', '430403198410311512', '18610319493', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '93', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '杨清', '军人证', '空字第078772号', '18001222399', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '94', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王金安', '军人证', '空字第20110406号', '18709378898', '0', '2', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '95', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '立树芬', '军人证', '空字第20110648号', '18709378898', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '96', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '郑顺利', '军人证', '空字第0420348号', '13366185825', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '97', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '张影', '身份证', '210321195705140506', '18741299458', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '98', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '姚小虹', '身份证', '339005197901031129', '01068389651', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '99', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '朱晶', '军人证', '装字第52000539号', '13911043320', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '100', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '庞东栋', '军人证', '装文字第52000567号', '13911043320', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '101', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '杜芳', '军人证', '空字第20110651号', '15101718359', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '102', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '赵嘉慧', '户口簿', '620105201106029375', '15101718359', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '103', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '崔焱', '军人证', '空字第20270607号', '15609370567', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '104', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王媛媛', '身份证', '370105198203293745', '15609370567', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '105', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '崔世恒', '户口簿', '370105201104011024', '15609370567', '0', '3', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '106', null, null, '8C', '09:00', '6', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '魏全生', '身份证', '62212319650125141X', '13301371791', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '107', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '姜翠娟', '身份证', '62212319701105002X', '13301371791', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '108', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '赵惠勤', '身份证', '110105196003271325', '13810097637', '0', '3', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '109', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('358', '2', '苏庆元', '身份证', '23092119750718081X', '13810097637', '0', '3', '4008', '现金', null, '*****', null, '', '', '2012-06-08 09:59:53', '0', '110', null, null, null, null, '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '于永新', '身份证', '110106195601132714', '13811097637', '0', '4', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '111', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '刘德胜', '身份证', '220502197602131212', '13810097637', '0', '4', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '112', null, null, null, '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '王磊', '军人证', '空字第1785635号', '13830776380', '0', '4', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '113', null, null, '1B', '08:30', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '武鹏', '军人证', '空字第06064069号', '15097220022', '0', '4', '4008', '现金', null, '', null, '', '', '2012-06-08 09:59:53', '0', '114', null, null, null, null, '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '彭苗苗', '军人证', '空字第06067545号', '15097220022', '0', '4', '4008', '现金', null, '', null, '', '', '2012-06-08 09:59:53', '0', '115', null, null, null, null, '6', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '李丹丹', '身份证', '622102196609239904', '01066915534', '0', '4', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '116', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('358', '2', '夏秀军', '军人证', '空字第0780033号', '01066915534', '0', '4', '4008', null, null, '***', null, null, null, '2012-06-08 09:59:53', '0', '117', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '李向东', '身份证', '620202196710130018', '13811256729', '0', '4', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '118', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '董玉军', '军人证', '济字第05-17256号', '13910593271', '0', '4', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '119', null, null, '4D', '09:00', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '郭吉升', '身份证', '37242319740908251X', '13910593271', '0', '4', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '120', null, null, 'V1-B', '08:30', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '尤明春', '身份证', '132626196005190523', '13651065539', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '121', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王孝江', '身份证', '512921296902215511', '18610213282', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '122', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '周建华', '身份证', '370502196604163269', '13999122998', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '123', null, null, '6C', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '马延安', '身份证', '37048119590728845X', '13475211111', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '124', null, null, '5D', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('358', '2', '董在军', '身份证', '370481196103154370', '13475211111', '0', '1', '4008', '现金', null, '***', null, '', '', '2012-06-08 09:59:53', '0', '125', null, null, null, null, '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '张士成', '身份证', '37042119620102563X', '13475211111', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '126', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王平安', '身份证', '132801196310052817', '13930601582', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '127', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '孙元军', '身份证', '133029195803180015', '123691511911', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '128', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '陈宗奎', '身份证', '110224198008154017', '18910900310', '0', '1', '4008', '现金', null, '', null, '', '', '2012-06-08 09:59:53', '0', '129', null, null, null, null, '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '杨振波', '身份证', '110224196910144341', '18910900310', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '130', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '米合古丽', '身份证', '652827196405050043', '139999008018', '0', '1', '4008', null, null, '', '4-6', null, null, '2012-06-08 15:39:17', '0', '131', null, null, '5E', '08:30', null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '张姣', '身份证', '512901197201200842', '13201350409', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '132', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '杨丹', '身份证', '652822198410060024', '18999028282', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '133', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '何文英', '身份证', '652826197001312922', '13369864554', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:16', '0', '134', null, null, '1F', '08:30', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '周良峰', '身份证', '652822196312030017', '13899083440', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '135', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '秦山清', '身份证', '622102197307069617', '13611351298', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '136', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王麒淇', '户口簿', '410926201003180087', '15801033332', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '137', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '李才民', '身份证', '130902195501150212', '03172724720', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '138', null, null, '3E', '08:30', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '王海林', '身份证', '652801197902211646', '13801192970', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '139', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '高桂枝', '身份证', '37243119540209632X', '13801192970', '1', '1', '4008', '现金', null, '*', '4-6', '', '', '2012-06-08 09:59:53', '0', '140', null, null, '', '09:00', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '3', '刘广', '军人证', '警字第030100079号', '13811175979', '0', '1', '4008', '现金', null, '', '4-6', '', '', '2012-06-08 15:39:17', '0', '141', null, null, '4E', '08:30', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '方毅', '军人证', '空字第0812222', '01066166632', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '142', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '方一', '军人证', '空字第0813313', '01066166632', '0', '1', '4008', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '143', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '方一', '军人证', '空字第0813313', '01066166632', '0', '1', '4008', null, null, '**', null, null, null, '2012-06-08 09:59:53', '0', '144', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '方毅', '军人证', '空字第0816616', '01066166632', '0', '1', '4008', '现金', null, '*****', '4-6', '', '', '2012-06-08 09:59:53', '0', '145', null, null, '', '09:00', '7', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('358', '2', '方毅', '军人证', '空字第0312223', '01066322263', '0', '1', '', null, null, '……', null, null, null, '2012-06-08 09:59:53', '0', '146', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('661', '2', '方亦', '军人证', '空字第', '0109191191', '0', '1', '', '现金', null, '*****okdflnladf', '4-6', '', '', '2012-06-08 09:59:53', '0', '147', null, null, '4C', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '方怡', '军人证', '空字第0812254', '01066166632', '0', '4', '', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '148', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('357', '2', '看到啦', '军人证', '12446', '01066166632', '0', '3', '', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '149', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('590', '2', '吗', '军人证', '22', '22', '0', '1', '', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '150', null, null, 'V2-B', '09:00', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('590', '2', '看', '军人证', '66', '22', '0', '1', '', null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '151', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('663', '2', '的', '军人证', '88', '88', '0', '1', '', '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '152', null, null, '', '09:00', '6', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('359', '2', '王辉', '军人证', '01000', '13800138000', '0', '1', '', null, null, '010', null, null, null, '2012-06-08 09:59:53', '0', '153', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('359', '2', '董欣', '军人证', '2201111', '010668899966', '0', '1', null, null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '154', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('359', '2', '王东喜', '军人证', '200111', '13800', '0', '1', null, '现金', null, 'bz', null, '555', '000', '2012-06-08 09:59:53', '0', '155', null, null, null, null, '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('359', '2', '王军', '其他', '0101', '010-255880', '0', '1', null, '现金', null, '000', '4-6', '3000', '200', '2012-06-08 09:59:53', '0', '156', null, null, 'V2-B', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '董欣', '军人证', '01020110122', '1389400', '1', '1', '', '现金', null, '012', '4-6', '', '', '2012-06-08 09:59:53', '0', '157', '1', '1', '1B', '08:30', '4', '120206005;120206006;120206009;120215001;120215002;120220004;120220005', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '郭传', '身份证', '110011198804153361', '13800138000', '1', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '158', '2', '23', '', '09:00', '5', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '杨晓龙', '身份证', '130981200808086686', '13800138000', '0', '2', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '159', '5', '22', '1A', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '财务', '身份证', '130981198904206032', '13800138000', '0', '2', null, null, null, '', null, null, null, '2012-06-08 09:59:53', '0', '160', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '程丽', '户口簿', '130981198904206032', '13800138000', '0', '2', null, '现金', null, '', null, '', '', '2012-06-08 09:59:53', '0', '161', null, null, null, null, '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '王一', '户口簿', '436712201105060000', '13800138000', '1', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '162', '2', '2', '4C', '09:00', '5', '120321006', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '杨晓龙', '身份证', '13098119890420603X', '13718783921', '1', '1', null, '现金', null, '', null, '', '', '2012-06-08 09:59:53', '0', '163', null, null, null, null, '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '王小明', '军人证', '军4301', '13844889911', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '164', '6', '6', '6C', '09:00', '4', '120305006;120305007;120305008', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '李小明', '军人证', '220111', '13844889911', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '165', '2', '12', '4A', '09:00', '4', '120229005;120229006;120229009;120229010', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '111', '军人证', '111', '13844889911', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:59:53', '0', '166', '8', '61', '2C', '09:00', '5', '120229008;120229011;120229012;120229013;120305003;120305004;120305005;120318044;120318045;120318046;120318047;120318048;120318049;120318050;120318051;120318052;120318053;120318054;120318055;120318001;120318002;120318003;120318004;120318001;120318002;120321001;120321002;120321003;120321005', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '王晓放', '军人证', '01455', '13800', '0', '1', null, '现金', null, '12', '4-6', '', '12', '2012-06-08 09:56:25', '0', '167', '2', '11', '6B', '09:00', '5', '120227022;120227023;120227022;120227023;120227030;120227031;120229003;120229004', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '团一', '军人证', '12', '12', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '168', '7', '12', '3B', '09:00', '4', '120227022;120227023;120227030;120227031;120229001;120229002;120229003;120229004;120318056;120318057;120318058;120318059;120318003;120318004;120321004', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '网军', '军人证', '10', '130', '1', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '169', '2', '11', '3C', '09:00', '4', '120229003;120229004', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '小名', '军人证', '012', '3001', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '170', '2', '12', '7C', '09:00', '6', '120229005;120229006;120229009;120229010', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '小王', '军人证', '军0155', '138000', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '171', null, null, '', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '小龙', '警官证', '军011', '1010', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '172', null, null, '5A', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '王军', '军人证', '2001', '198', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '173', '6', '6', '5C', '09:00', '4', '120305001;120305002', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '121', '军人证', '121', '198', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '174', '6', '6', '4C', '09:00', '5', '120305001;120305002', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '王天', '军人证', '00.', '13800138000', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '175', null, null, '1B', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '小王', '军人证', '121123', '1382200', '1', '1', null, '现金', null, '', null, '', '', '2012-06-08 09:59:53', '0', '176', null, null, null, null, '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '向往', '警官证', '12', '1382200', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '177', null, null, '2A', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '111', '警官证', '1111', '1382200', '0', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '178', null, null, '1C', '09:00', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '1212', '军人证', '121', '12', '1', '1', null, '现金', null, '12', '4-6', '', '', '2012-06-08 09:56:25', '0', '179', '1', '1', '1E', '09:00', '4', '120321007', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '23', '军人证', '23', '12', '1', '1', null, '现金', null, '', '4-6', '', '', '2012-06-08 09:56:25', '0', '180', '1', '1', '1F', '09:00', '4', '120321007', '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '55', '军人证', '5', '5', '0', '1', null, '现金', null, '', '4-6', '', '5', '2012-06-08 09:56:25', '0', '181', '2', '22', null, '08:30', '4', null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('372', '2', '1212', '军人证', '1212', '121', '0', '1', null, null, null, '', null, null, null, '2012-06-08 09:56:25', '0', '182', null, null, null, null, null, null, '测试团', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '2', '邹助', '军人证', '203300', '13800138000', '0', '1', null, '支票', null, '', null, '', '', '2012-06-20 13:43:04', '0', '183', null, null, null, null, '5', null, null, null);
INSERT INTO `op_ordertickets` VALUES ('355', '2', '测试用户', '军人证', '0211', '13800138000', '0', '1', null, '现金', null, '', null, '', '', '2012-06-20 13:49:13', '0', '184', null, null, null, null, '5', null, null, null);
INSERT INTO `op_ordertickets` VALUES ('355', '0', '1212', '军人证', '12121', '13800138000', '0', '1', null, null, null, '', null, null, null, '2012-06-20 13:51:03', '0', '185', null, null, null, null, null, null, null, '0');
INSERT INTO `op_ordertickets` VALUES ('355', '2', '11', '军人证', '1', '111', '0', '1', null, '现金', null, '', null, '', '', '2012-06-20 13:56:28', '0', '186', null, null, null, null, '4', null, '', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '0', '222', '军人证', '222', '22', '0', '1', null, null, null, '', null, null, null, '2012-06-20 13:59:06', '0', '187', null, null, null, null, null, null, '22', '1');
INSERT INTO `op_ordertickets` VALUES ('355', '0', '33', '军人证', '33', '22', '0', '1', null, null, null, '', null, null, null, '2012-06-20 13:59:16', '0', '188', null, null, null, null, null, null, null, '0');
INSERT INTO `op_ordertickets` VALUES ('355', '2', '121', '军人证', 'gg12', '11', '0', '1', null, '现金', null, '', null, '', '', '2012-06-20 14:01:54', '0', '189', null, null, null, null, '4', null, '', '1');
INSERT INTO `op_ordertickets` VALUES ('665', '3', '小张', '警官证', '386600', '136000', '0', '1', null, '现金', null, '', '4-6', '12', '12', '2012-07-23 14:50:54', '0', '190', '2', '2', null, '09:00', '4', null, '1212', '1');
INSERT INTO `op_ordertickets` VALUES ('433', '3', '王麻子', '军人证', '0.112', '138005800', '1', '1', null, '现金', null, '', '5', '', '', '2012-07-23 14:53:28', '0', '191', '2', '2', '', '08:30', '8', null, null, '0');

-- ----------------------------
-- Table structure for `op_secondwage_change`
-- ----------------------------
DROP TABLE IF EXISTS `op_secondwage_change`;
CREATE TABLE `op_secondwage_change` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL,
  `ORIG_DUTY` varchar(120) DEFAULT NULL,
  `NOW_DUTY` varchar(120) DEFAULT NULL,
  `OTHER_CHANG` varchar(120) DEFAULT NULL,
  `WOKS_SUBSID` varchar(64) DEFAULT NULL,
  `LIEF_SUBSID` varchar(64) DEFAULT NULL,
  `PH_SUBSID` varchar(64) DEFAULT NULL,
  `TZSUBSID` varchar(64) DEFAULT NULL,
  `GFSUBSID` varchar(64) DEFAULT NULL,
  `BCSUBSID` varchar(64) DEFAULT NULL,
  `KJSUBSID` varchar(64) DEFAULT NULL,
  `JSZHZH` varchar(64) DEFAULT NULL,
  `GZXJT` varchar(64) DEFAULT NULL,
  `NOW_SHXSUBSID` varchar(64) DEFAULT NULL,
  `NOW_PHCOST` varchar(64) DEFAULT NULL,
  `NOW_TZCOST` varchar(64) DEFAULT NULL,
  `NOW_GFSUBSID` varchar(64) DEFAULT NULL,
  `NOW_BCSUBSID` varchar(64) DEFAULT NULL,
  `NOW_KJSUBSID` varchar(64) DEFAULT NULL,
  `NOW_JSHPOST` varchar(64) DEFAULT NULL,
  `ADDMONEY` varchar(64) DEFAULT NULL,
  `SUPPLYWAGE` varchar(64) DEFAULT NULL,
  `SUPPLYMONTHS` varchar(64) DEFAULT NULL,
  `REMARK` varchar(64) DEFAULT NULL,
  `GRANTDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of op_secondwage_change
-- ----------------------------
INSERT INTO `op_secondwage_change` VALUES ('1', '张亮', '副主席', '主席', '没有', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '22', '222', '2222', '2222', '222222', '2011-04-01 00:00:00');

-- ----------------------------
-- Table structure for `op_useroper`
-- ----------------------------
DROP TABLE IF EXISTS `op_useroper`;
CREATE TABLE `op_useroper` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of op_useroper
-- ----------------------------
INSERT INTO `op_useroper` VALUES ('1', '19', '1', '18', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('2', '19', '1', '19', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('3', '19', '5', '6', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('4', '19', '5', '7', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('5', '19', '9', '4', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('6', '19', '5', '18', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('7', '19', '8', '18', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('8', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('9', '19', '5', '11', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('10', '19', '3', '3', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('11', '19', '5', '5', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('12', '19', '1', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('13', '19', '2', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('14', '19', '2', '19', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('15', '19', '2', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('16', '19', '1', '21', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('17', '19', '1', '22', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('18', '19', '2', '22', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('19', '19', '2', '21', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('20', '19', '3', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('21', '19', '3', '5', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('22', '19', '2', '19', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('23', '19', '1', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('24', '19', '5', '19', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('25', '19', '5', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('26', '19', '2', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('27', '19', '3', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('28', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('29', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('30', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('31', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('32', '19', '3', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('33', '19', '1', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('34', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('35', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('36', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('37', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('38', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('39', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('40', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('41', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('42', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('43', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('44', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('45', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('46', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('47', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('48', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('49', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('50', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('51', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('52', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('53', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('54', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('55', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('56', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('57', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('58', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('59', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('60', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('61', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('62', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('63', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('64', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('65', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('66', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('67', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('68', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('69', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('70', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('71', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('72', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('73', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('74', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('75', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('76', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('77', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('78', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('79', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('80', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('81', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('82', '19', '1', '25', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('83', '19', '8', '25', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('84', '19', '1', '26', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('85', '19', '2', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('86', '19', '1', '27', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('87', '19', '1', '28', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('88', '19', '1', '29', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('89', '19', '1', '30', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('90', '19', '1', '31', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('91', '19', '1', '32', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('92', '19', '0', '33', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('93', '19', '0', '34', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('94', '19', '1', '34', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('95', '19', '6', '26', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('96', '19', '6', '26', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('97', '19', '8', '26', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('98', '19', '5', '34', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('99', '19', '0', '35', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('100', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('101', '19', '3', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('102', '19', '0', '36', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('103', '19', '5', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('104', '19', '0', '37', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('105', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('106', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('107', '19', '3', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('108', '19', '5', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('109', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('110', '19', '5', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('111', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('112', '19', '6', '35', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('113', '19', '5', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('114', '19', '3', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('115', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('116', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('117', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('118', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('119', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('120', '19', '3', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('121', '19', '3', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('122', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('123', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('124', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('125', '19', '3', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('126', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('127', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('128', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('129', '19', '3', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('130', '19', '5', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('131', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('132', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('133', '19', '5', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('134', '19', '5', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('135', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('136', '19', '5', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('137', '19', '5', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('138', '19', '5', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('139', '19', '5', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('140', '19', '5', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('141', '19', '5', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('142', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('143', '19', '5', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('144', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('145', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('146', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('147', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('148', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('149', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('150', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('151', '19', '5', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('152', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('153', '19', '5', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('154', '19', '5', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('155', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('156', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('157', '19', '5', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('158', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('159', '19', '5', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('160', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('161', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('162', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('163', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('164', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('165', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('166', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('167', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('168', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('169', '19', '5', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('170', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('171', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('172', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('173', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('174', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('175', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('176', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('177', '19', '3', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('178', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('179', '19', '3', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('180', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('181', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('182', '19', '5', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('183', '19', '3', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('184', '19', '5', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('185', '19', '5', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('186', '19', '2', '35', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('187', '19', '2', '36', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('188', '19', '2', '37', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('189', '19', '2', '33', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('190', '19', '2', '34', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('191', '19', '2', '31', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('192', '19', '2', '32', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('193', '19', '2', '30', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('194', '19', '0', '38', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('195', '19', '0', '39', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('196', '19', '2', '39', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('197', '19', '3', '6', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('198', '19', '3', '39', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('199', '19', '5', '39', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('200', '19', '0', '40', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('201', '19', '2', '40', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('202', '19', '0', '41', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('203', '19', '5', '6', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('204', '19', '0', '42', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('205', '19', '2', '39', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('206', '19', '9', '39', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('207', '21', '8', '6', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('208', '21', '8', '42', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('209', '21', '0', '43', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('210', '21', '0', '44', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('211', '21', '0', '45', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('212', '21', '0', '46', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('213', '21', '0', '47', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('214', '21', '0', '48', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('215', '21', '0', '49', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('216', '21', '0', '50', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('217', '21', '0', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('218', '21', '0', '52', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('219', '21', '0', '53', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('220', '21', '0', '54', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('221', '21', '0', '55', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('222', '21', '0', '56', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('223', '21', '0', '57', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('224', '21', '0', '58', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('225', '21', '0', '59', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('226', '21', '0', '60', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('227', '21', '0', '61', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('228', '21', '0', '62', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('229', '21', '0', '63', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('230', '21', '0', '64', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('231', '21', '0', '65', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('232', '21', '0', '66', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('233', '21', '0', '67', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('234', '21', '0', '68', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('235', '21', '0', '69', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('236', '21', '0', '70', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('237', '21', '0', '71', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('238', '21', '0', '72', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('239', '21', '0', '73', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('240', '21', '0', '74', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('241', '21', '0', '75', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('242', '21', '0', '76', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('243', '21', '0', '77', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('244', '21', '0', '78', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('245', '21', '0', '79', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('246', '21', '0', '80', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('247', '21', '0', '81', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('248', '21', '0', '82', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('249', '21', '6', '75', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('250', '21', '0', '83', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('251', '21', '0', '84', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('252', '21', '0', '85', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('253', '21', '0', '86', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('254', '21', '0', '87', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('255', '21', '0', '88', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('256', '21', '0', '89', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('257', '21', '0', '90', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('258', '21', '0', '91', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('259', '21', '0', '92', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('260', '21', '0', '93', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('261', '21', '0', '94', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('262', '21', '0', '95', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('263', '21', '0', '96', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('264', '21', '0', '97', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('265', '21', '0', '98', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('266', '21', '0', '99', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('267', '21', '0', '100', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('268', '21', '0', '101', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('269', '21', '0', '102', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('270', '21', '0', '103', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('271', '21', '0', '104', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('272', '21', '0', '105', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('273', '21', '0', '106', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('274', '21', '0', '107', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('275', '21', '0', '108', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('276', '21', '0', '109', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('277', '21', '0', '110', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('278', '21', '0', '111', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('279', '21', '0', '112', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('280', '21', '0', '113', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('281', '21', '0', '114', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('282', '21', '0', '115', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('283', '21', '0', '116', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('284', '21', '0', '117', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('285', '21', '0', '118', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('286', '21', '0', '119', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('287', '21', '0', '120', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('288', '21', '0', '121', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('289', '21', '0', '122', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('290', '21', '0', '123', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('291', '21', '0', '124', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('292', '21', '0', '125', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('293', '21', '0', '126', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('294', '21', '0', '127', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('295', '21', '0', '128', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('296', '21', '0', '129', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('297', '21', '0', '130', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('298', '21', '0', '131', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('299', '21', '0', '132', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('300', '21', '0', '133', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('301', '21', '0', '134', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('302', '21', '0', '135', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('303', '21', '0', '136', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('304', '21', '0', '137', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('305', '21', '0', '138', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('306', '21', '0', '139', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('307', '21', '0', '140', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('308', '21', '2', '65', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('309', '21', '2', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('310', '21', '8', '46', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('311', '21', '0', '141', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('312', '21', '2', '57', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('313', '21', '2', '43', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('314', '21', '2', '134', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('315', '21', '2', '49', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('316', '21', '2', '141', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('317', '21', '2', '53', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('318', '21', '2', '120', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('319', '21', '2', '119', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('320', '21', '2', '113', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('321', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('322', '19', '3', '113', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('323', '19', '3', '134', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('324', '19', '3', '119', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('325', '19', '3', '120', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('326', '19', '3', '65', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('327', '19', '3', '141', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('328', '19', '3', '43', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('329', '19', '3', '49', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('330', '19', '3', '57', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('331', '19', '3', '53', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('332', '19', '3', '113', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('333', '21', '6', '66', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('334', '19', '2', '129', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('335', '19', '2', '90', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('336', '19', '2', '106', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('337', '19', '3', '90', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('338', '19', '1', '138', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('339', '19', '1', '111', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('340', '19', '1', '117', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('341', '19', '2', '138', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('342', '19', '8', '80', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('343', '19', '8', '66', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('344', '19', '0', '142', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('345', '19', '0', '143', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('346', '19', '8', '143', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('347', '19', '8', '142', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('348', '19', '0', '144', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('349', '19', '0', '145', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('350', '19', '6', '125', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('351', '19', '6', '82', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('352', '19', '6', '140', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('353', '19', '2', '110', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('354', '19', '6', '67', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('355', '19', '5', '125', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('356', '19', '5', '110', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('357', '19', '6', '117', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('358', '19', '5', '117', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('359', '19', '0', '146', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('360', '19', '2', '125', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('361', '19', '6', '67', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('362', '19', '0', '147', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('363', '19', '3', '106', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('364', '19', '2', '82', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('365', '19', '2', '147', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('366', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('367', '19', '3', '119', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('368', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('369', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('370', '19', '3', '147', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('371', '19', '3', '134', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('372', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('373', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('374', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('375', '19', '0', '148', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('376', '19', '0', '149', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('377', '19', '8', '144', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('378', '19', '2', '145', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('379', '19', '1', '114', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('380', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('381', '19', '3', '138', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('382', '19', '3', '106', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('383', '19', '3', '51', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('384', '19', '3', '147', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('385', '19', '6', '58', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('386', '19', '6', '140', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('387', '19', '1', '131', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('388', '19', '1', '85', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('389', '19', '1', '123', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('390', '19', '1', '70', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('391', '19', '2', '115', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('392', '19', '5', '140', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('393', '19', '5', '67', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('394', '19', '5', '50', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('395', '19', '5', '60', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('396', '19', '5', '83', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('397', '19', '5', '71', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('398', '19', '5', '63', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('399', '19', '5', '49', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('400', '19', '5', '43', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('401', '19', '5', '112', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('402', '19', '5', '114', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('403', '19', '5', '65', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('404', '19', '5', '138', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('405', '19', '5', '53', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('406', '19', '5', '47', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('407', '19', '5', '76', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('408', '19', '5', '124', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('409', '19', '5', '82', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('410', '19', '5', '145', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('411', '19', '5', '134', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('412', '19', '5', '113', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('413', '19', '5', '120', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('414', '19', '5', '147', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('415', '19', '5', '141', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('416', '19', '5', '85', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('417', '19', '5', '70', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('418', '19', '5', '131', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('419', '19', '5', '123', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('420', '19', '2', '114', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('421', '19', '5', '67', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('422', '19', '5', '147', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('423', '19', '3', '82', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('424', '19', '5', '82', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('425', '19', '0', '150', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('426', '19', '0', '151', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('427', '19', '2', '150', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('428', '19', '3', '150', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('429', '19', '5', '69', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('430', '19', '2', '140', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('431', '19', '2', '112', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('432', '19', '3', '140', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('433', '19', '5', '140', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('434', '19', '3', '145', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('435', '19', '5', '145', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('436', '19', '0', '152', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('437', '19', '1', '152', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('438', '19', '2', '152', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('439', '19', '3', '152', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('440', '19', '5', '152', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('441', '19', '0', '153', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('442', '19', '0', '154', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('443', '19', '2', '155', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('444', '19', '2', '156', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('445', '19', '3', '156', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('446', '19', '0', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('447', '19', '2', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('448', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('449', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('450', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('451', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('452', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('453', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('454', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('455', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('456', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('457', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('458', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('459', '19', '2', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('460', '19', '1', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('461', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('462', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('463', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('464', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('465', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('466', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('467', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('468', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('469', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('470', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('471', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('472', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('473', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('474', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('475', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('476', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('477', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('478', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('479', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('480', '19', '5', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('481', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('482', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('483', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('484', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('485', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('486', '19', '0', '158', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('487', '19', '0', '159', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('488', '19', '0', '160', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('489', '19', '0', '161', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('490', '19', '0', '162', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('491', '19', '0', '163', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('492', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('493', '19', '3', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('494', '19', '0', '164', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('495', '19', '0', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('496', '19', '0', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('497', '19', '2', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('498', '19', '2', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('499', '19', '2', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('500', '19', '0', '170', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('501', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('502', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('503', '19', '2', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('504', '19', '2', '158', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('505', '19', '2', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('506', '19', '2', '170', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('507', '19', '0', '171', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('508', '19', '2', '171', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('509', '19', '0', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('510', '19', '2', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('511', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('512', '19', '3', '158', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('513', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('514', '19', '0', '173', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('515', '19', '0', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('516', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('517', '19', '6', '164', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('518', '19', '1', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('519', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('520', '19', '3', '170', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('521', '19', '3', '158', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('522', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('523', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('524', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('525', '19', '3', '171', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('526', '19', '3', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('527', '19', '3', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('528', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('529', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('530', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('531', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('532', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('533', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('534', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('535', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('536', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('537', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('538', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('539', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('540', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('541', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('542', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('543', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('544', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('545', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('546', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('547', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('548', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('549', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('550', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('551', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('552', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('553', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('554', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('555', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('556', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('557', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('558', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('559', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('560', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('561', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('562', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('563', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('564', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('565', '19', '3', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('566', '19', '3', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('567', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('568', '19', '3', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('569', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('570', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('571', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('572', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('573', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('574', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('575', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('576', '19', '3', '172', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('577', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('578', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('579', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('580', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('581', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('582', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('583', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('584', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('585', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('586', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('587', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('588', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('589', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('590', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('591', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('592', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('593', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('594', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('595', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('596', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('597', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('598', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('599', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('600', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('601', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('602', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('603', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('604', '19', '3', '170', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('605', '19', '3', '171', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('606', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('607', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('608', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('609', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('610', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('611', '19', '3', '170', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('612', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('613', '19', '3', '170', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('614', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('615', '19', '3', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('616', '19', '3', '170', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('617', '19', '3', '167', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('618', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('619', '19', '3', '158', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('620', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('621', '19', '3', '169', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('622', '19', '0', '175', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('623', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('624', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('625', '19', '2', '173', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('626', '19', '2', '164', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('627', '19', '2', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('628', '19', '3', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('629', '19', '3', '173', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('630', '19', '3', '164', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('631', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('632', '19', '3', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('633', '19', '3', '173', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('634', '19', '3', '164', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('635', '19', '2', '159', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('636', '19', '3', '159', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('637', '19', '3', '159', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('638', '19', '3', '159', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('639', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('640', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('641', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('642', '19', '3', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('643', '19', '3', '173', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('644', '19', '3', '164', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('645', '19', '3', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('646', '19', '3', '173', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('647', '19', '3', '164', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('648', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('649', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('650', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('651', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('652', '19', '9', '157', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('653', '19', '9', '174', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('654', '19', '2', '175', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('655', '19', '2', '162', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('656', '19', '9', '165', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('657', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('658', '19', '3', '175', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('659', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('660', '19', '3', '166', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('661', '19', '3', '168', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('662', '19', '2', '176', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('663', '19', '2', '177', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('664', '19', '2', '178', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('665', '19', '3', '162', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('666', '19', '3', '178', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('667', '19', '3', '177', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('668', '19', '2', '179', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('669', '19', '2', '180', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('670', '19', '3', '179', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('671', '19', '3', '180', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('672', '19', '3', '179', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('673', '19', '3', '180', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('674', '19', '2', '181', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('675', '19', '0', '182', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('676', '19', '3', '181', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('677', '19', '3', '175', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('678', '19', '3', '181', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('679', '19', '2', '163', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('680', '19', '2', '161', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('681', '19', '9', '31', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('682', '19', '9', '34', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('683', '19', '3', '35', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('684', '19', '3', '36', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('685', '19', '3', '37', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('686', '19', '3', '14', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('687', '19', '3', '4', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('688', '19', '3', '33', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('689', '19', '3', '134', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('690', '19', '3', '67', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('691', '19', '3', '23', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('692', '19', '3', '50', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('693', '19', '3', '85', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('694', '19', '3', '65', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('695', '19', '3', '138', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('696', '19', '3', '83', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('697', '19', '3', '71', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('698', '19', '3', '26', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('699', '19', '3', '70', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('700', '19', '3', '69', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('701', '19', '3', '141', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('702', '19', '3', '53', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('703', '19', '3', '49', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('704', '19', '3', '76', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('705', '19', '3', '25', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('706', '19', '3', '24', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('707', '19', '3', '124', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('708', '19', '3', '131', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('709', '19', '3', '15', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('710', '19', '3', '47', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('711', '19', '3', '3', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('712', '19', '3', '12', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('713', '19', '3', '8', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('714', '19', '3', '123', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('715', '19', '3', '10', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('716', '19', '3', '11', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('717', '19', '3', '5', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('718', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('719', '19', '3', '34', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('720', '19', '3', '31', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('721', '19', '3', '13', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('722', '19', '3', '20', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('723', '19', '3', '120', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('724', '19', '3', '112', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('725', '19', '3', '113', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('726', '19', '3', '9', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('727', '19', '3', '30', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('728', '19', '3', '32', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('729', '19', '3', '28', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('730', '19', '3', '29', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('731', '19', '3', '18', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('732', '19', '3', '27', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('733', '19', '0', '183', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('734', '19', '2', '183', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('735', '19', '0', '184', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('736', '19', '2', '184', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('737', '19', '0', '185', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('738', '19', '2', '186', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('739', '19', '0', '187', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('740', '19', '0', '188', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('741', '19', '2', '189', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('742', '19', '3', '35', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('743', '19', '3', '35', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('744', '19', '3', '17', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('745', '19', '3', '18', '2012-01-08 20:42:44');
INSERT INTO `op_useroper` VALUES ('746', '19', '2', '190', '2012-07-20 15:39:08');
INSERT INTO `op_useroper` VALUES ('747', '19', '3', '190', '2012-07-23 14:50:36');
INSERT INTO `op_useroper` VALUES ('748', '19', '3', '190', '2012-07-23 14:50:54');
INSERT INTO `op_useroper` VALUES ('749', '19', '2', '191', '2012-07-23 14:52:29');
INSERT INTO `op_useroper` VALUES ('750', '19', '3', '191', '2012-07-23 14:53:16');

-- ----------------------------
-- Table structure for `op_wage_changecheck`
-- ----------------------------
DROP TABLE IF EXISTS `op_wage_changecheck`;
CREATE TABLE `op_wage_changecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORG_CODE` varchar(36) DEFAULT NULL,
  `ORG_NAME` varchar(180) DEFAULT NULL,
  `DEPART` varchar(180) DEFAULT NULL,
  `NAME` varchar(36) DEFAULT NULL,
  `STAFF_NUM` varchar(120) DEFAULT NULL,
  `ORIG_DUTY` varchar(180) DEFAULT NULL,
  `NOW_DUTY` varchar(180) DEFAULT NULL,
  `OTHER_CHANG` varchar(180) DEFAULT NULL,
  `ORIG_SYQWAGE` varchar(180) DEFAULT NULL,
  `ORIG_BASICWAGE` varchar(180) DEFAULT NULL,
  `ORIG_JOBGRADE` varchar(180) DEFAULT NULL,
  `ORIG_GWWAGE` varchar(180) DEFAULT NULL,
  `ORIG_TELLEV` varchar(180) DEFAULT NULL,
  `ORIG_TELLEVWAGE` varchar(180) DEFAULT NULL,
  `ORIG_NZJ` varchar(180) DEFAULT NULL,
  `ORIG_JBTOTAL` varchar(180) DEFAULT NULL,
  `ORIG_GGTOTAL` varchar(180) DEFAULT NULL,
  `ORIG_GJJGBT` varchar(180) DEFAULT NULL,
  `ORIG_GXALLOW` varchar(180) DEFAULT NULL,
  `ORIG_ZHFSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_BGCOST` varchar(180) DEFAULT NULL,
  `ORIG_WXTXTOOLSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_GJGBBMZGCOST` varchar(180) DEFAULT NULL,
  `ORIG_DSZNCOST` varchar(180) DEFAULT NULL,
  `ORIG_YYESUBSID` varchar(180) DEFAULT NULL,
  `ORIG_MILKCOST` varchar(180) DEFAULT NULL,
  `ORIG_FYJCYSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_SPJCSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_SHJSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_JJJCBARYSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_RMJCZQPOSSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_GJXFJXFPOSSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_JSHZZHCYSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_MMRYGWSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_GYSHCOST` varchar(180) DEFAULT NULL,
  `ORIG_GFSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_WSHTSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_SHSHMZSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_QTSUBSID` varchar(180) DEFAULT NULL,
  `ORIG_ZCHWAGE` varchar(180) DEFAULT NULL,
  `ORIG_YSHZCHWAGE` varchar(180) DEFAULT NULL,
  `ORIG_YINGFATOTAL` varchar(180) DEFAULT NULL,
  `ORIG_DKOUTOTAL` varchar(180) DEFAULT NULL,
  `ORIG_ZFGJJ` varchar(180) DEFAULT NULL,
  `ORIG_GRSDSH` varchar(180) DEFAULT NULL,
  `ORIG_QTDK` varchar(180) DEFAULT NULL,
  `ORIG_SHIFATOTAL` varchar(180) DEFAULT NULL,
  `ORIG_SHYQWAGE` varchar(180) DEFAULT NULL,
  `NOW_BASICWAGE` varchar(180) DEFAULT NULL,
  `NOW_JOBGRADE` varchar(180) DEFAULT NULL,
  `NOW_GWWAGE` varchar(180) DEFAULT NULL,
  `NOW_TELLEV` varchar(180) DEFAULT NULL,
  `NOW_TELLEVWAGE` varchar(180) DEFAULT NULL,
  `ENDYEAR_PRIZE` varchar(180) DEFAULT NULL,
  `NOW_JBTOTAL` varchar(180) DEFAULT NULL,
  `NOW_GGTOTAL` varchar(180) DEFAULT NULL,
  `NOW_GJJGBT` varchar(180) DEFAULT NULL,
  `NOW_JXSUBSID` varchar(180) DEFAULT NULL,
  `NOW_ZFTZSUBSID` varchar(180) DEFAULT NULL,
  `NOW_BGCOST` varchar(180) DEFAULT NULL,
  `NOW_WXTXTOOLSUBSID` varchar(180) DEFAULT NULL,
  `NOW_GJGBBMCOST` varchar(180) DEFAULT NULL,
  `NOW_DSZNCOST` varchar(180) DEFAULT NULL,
  `NOW_YYESUBSID` varchar(180) DEFAULT NULL,
  `NOW_MLIKCOST` varchar(180) DEFAULT NULL,
  `NOW_FYJCYSUBSID` varchar(180) DEFAULT NULL,
  `NOW_SPJCSUBSID` varchar(180) DEFAULT NULL,
  `NOW_SJSUBSID` varchar(180) DEFAULT NULL,
  `NOW_JCJCBASUBSID` varchar(180) DEFAULT NULL,
  `NOW_RMJCZQSUBSID` varchar(180) DEFAULT NULL,
  `NOW_GJXFJGWSUBSID` varchar(180) DEFAULT NULL,
  `NOW_JSHZZHSUBSID` varchar(180) DEFAULT NULL,
  `NOW_MMRYGWSUBSID` varchar(180) DEFAULT NULL,
  `NOW_GYSHHFCOST` varchar(180) DEFAULT NULL,
  `NOW_GFBCOST` varchar(180) DEFAULT NULL,
  `NOW_WSTSUBSID` varchar(180) DEFAULT NULL,
  `NOW_SSHMZSUBSID` varchar(180) DEFAULT NULL,
  `NOW_QTSUBSID` varchar(180) DEFAULT NULL,
  `NOW_ZCWAGE` varchar(180) DEFAULT NULL,
  `NOW_YSHZCWAGE` varchar(180) DEFAULT NULL,
  `NOW_YINGFATOTAL` varchar(180) DEFAULT NULL,
  `NOW_DKTOTAL` varchar(180) DEFAULT NULL,
  `NOW_ZHFGJJ` varchar(180) DEFAULT NULL,
  `NOW_GRSDSH` varchar(180) DEFAULT NULL,
  `NOW_QTDK` varchar(180) DEFAULT NULL,
  `NOW_SHIFATOTAL` varchar(180) DEFAULT NULL,
  `ADD_MONEY` varchar(180) DEFAULT NULL,
  `BUFA_WAGE` varchar(180) DEFAULT NULL,
  `SUPPLY_MONTHS` varchar(36) DEFAULT NULL,
  `LESSWAGE` varchar(180) DEFAULT NULL,
  `LESS_MONTHS` varchar(36) DEFAULT NULL,
  `ORIG_WAGEACCOUNT` varchar(36) DEFAULT NULL,
  `NOW_WAGEACCOUNT` varchar(36) DEFAULT NULL,
  `REMARK` varchar(580) DEFAULT NULL,
  `GRANTDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of op_wage_changecheck
-- ----------------------------
INSERT INTO `op_wage_changecheck` VALUES ('1', '23', '国务院', '国务院', '张亮', '1', '副主席', '主席', '无', '1', '2', '大哥级的', '3', '高级', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '高级', '40', '高级', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '终于完了', '2011-04-01 00:00:00');

-- ----------------------------
-- Table structure for `op_wage_grant`
-- ----------------------------
DROP TABLE IF EXISTS `op_wage_grant`;
CREATE TABLE `op_wage_grant` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORG_CODE` varchar(36) DEFAULT NULL,
  `ORG_NAME` varchar(180) DEFAULT NULL,
  `DEPART` varchar(180) DEFAULT NULL,
  `NAME` varchar(180) DEFAULT NULL,
  `STAFF_NUM` varchar(180) DEFAULT NULL,
  `ID_NUMBER` varchar(180) DEFAULT NULL,
  `BASIC_WAGE` varchar(180) DEFAULT NULL,
  `JOB_GRADE` varchar(180) DEFAULT NULL,
  `POST_WAGE` varchar(180) DEFAULT NULL,
  `LEV_TECGRADE` varchar(180) DEFAULT NULL,
  `LEV_TECGRADE_WAGE` varchar(180) DEFAULT NULL,
  `ENDYEAR_REWARD` varchar(180) DEFAULT NULL,
  `TRIAL_WAGE` varchar(180) DEFAULT NULL,
  `ALLOW_SUBTOTAL` varchar(180) DEFAULT NULL,
  `HOLD_SUBSID` varchar(180) DEFAULT NULL,
  `AUTH_SUBSID` varchar(180) DEFAULT NULL,
  `JXSUBSID` varchar(180) DEFAULT NULL,
  `ZFTZHSUBSID` varchar(180) DEFAULT NULL,
  `SERTEL_COST` varchar(180) DEFAULT NULL,
  `WXTXTOOLSUBSID` varchar(180) DEFAULT NULL,
  `GJGBBMCOST` varchar(180) DEFAULT NULL,
  `CHILD_FEES` varchar(36) DEFAULT NULL,
  `YOUNGCHILD_SUBSID` varchar(36) DEFAULT NULL,
  `MILK_POWER` varchar(36) DEFAULT NULL,
  `FYJCYSUBSID` varchar(180) DEFAULT NULL,
  `SPJCHSUBSID` varchar(180) DEFAULT NULL,
  `SHJSUBSID` varchar(180) DEFAULT NULL,
  `JJBANPERSUBSI` varchar(180) DEFAULT NULL,
  `POLZHQSUBSID` varchar(180) DEFAULT NULL,
  `GJXFJXFSUBSID` varchar(180) DEFAULT NULL,
  `JSHHZZHSUBSID` varchar(180) DEFAULT NULL,
  `MMPERSUBSID` varchar(180) DEFAULT NULL,
  `GYSHHCOST` varchar(180) DEFAULT NULL,
  `GFBCOST` varchar(180) DEFAULT NULL,
  `WSHTSUBSID` varchar(180) DEFAULT NULL,
  `MINORITY_SUBSID` varchar(36) DEFAULT NULL,
  `QTSUBSID` varchar(180) DEFAULT NULL,
  `ZCHWAGE` varchar(180) DEFAULT NULL,
  `YSHZCHWAGE` varchar(180) DEFAULT NULL,
  `YINGFA_TOTAL` varchar(36) DEFAULT NULL,
  `DKTOTAL` varchar(180) DEFAULT NULL,
  `ZHFGJJ` varchar(180) DEFAULT NULL,
  `GRSDSH` varchar(180) DEFAULT NULL,
  `QTDK` varchar(180) DEFAULT NULL,
  `MONTHSUPPLY_WAGE` varchar(36) DEFAULT NULL,
  `DYJFWAGE` varchar(180) DEFAULT NULL,
  `WAGEACCOUNT` varchar(180) DEFAULT NULL,
  `ZHFGJJKHH` varchar(180) DEFAULT NULL,
  `ZHFGJJACCOUNT` varchar(180) DEFAULT NULL,
  `GRSDSHBANK` varchar(180) DEFAULT NULL,
  `GRSDSHUACC` varchar(180) DEFAULT NULL,
  `SHIFA_TOTAL` varchar(36) DEFAULT NULL,
  `GRANTDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of op_wage_grant
-- ----------------------------
INSERT INTO `op_wage_grant` VALUES ('3', '2', '国务院', '安全部', '张亮', '2', '100000', '1', '高级', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '41', '42', '43', '44', '45', '40', '2011-04-01 00:00:00');

-- ----------------------------
-- Table structure for `op_wagesend_second`
-- ----------------------------
DROP TABLE IF EXISTS `op_wagesend_second`;
CREATE TABLE `op_wagesend_second` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL,
  `ENG_ALLOW` varchar(64) DEFAULT NULL,
  `PHONE_CHARGE` varchar(64) DEFAULT NULL,
  `FAMPLAN_FULLTIME` varchar(64) DEFAULT NULL,
  `ACCOUN_ALLOW` varchar(64) DEFAULT NULL,
  `FANGZU_SUBSID` varchar(64) DEFAULT NULL,
  `GOUFANG_SUBSID` varchar(64) DEFAULT NULL,
  `BANCHE_SUBSID` varchar(64) DEFAULT NULL,
  `ADDWORKS_FEE` varchar(64) DEFAULT NULL,
  `GAO_FEE` varchar(64) DEFAULT NULL,
  `COLLING_FEE` varchar(64) DEFAULT NULL,
  `SUPPLY_WAG` varchar(64) DEFAULT NULL,
  `YINGFA_TOTAL` varchar(64) DEFAULT NULL,
  `MANPOWER` varchar(64) DEFAULT NULL,
  `PROV_FUND` varchar(64) DEFAULT NULL,
  `BUKOU_FUND` varchar(64) DEFAULT NULL,
  `BUTTON_DRUGS` varchar(64) DEFAULT NULL,
  `PERSONINCOME_TAX` varchar(64) DEFAULT NULL,
  `KOUKUAN_TOTAL` varchar(64) DEFAULT NULL,
  `SHIFA_TOTAL` varchar(64) DEFAULT NULL,
  `GRANTDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of op_wagesend_second
-- ----------------------------
INSERT INTO `op_wagesend_second` VALUES ('7', '张亮', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '2011-04-01 00:00:00');
