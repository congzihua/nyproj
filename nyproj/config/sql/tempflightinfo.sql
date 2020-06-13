CREATE TABLE `temp_flightinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flight_info` varchar(300) NOT NULL DEFAULT '' COMMENT '航程',
  `flight_no` varchar(80) NOT NULL COMMENT '航班号',
  `origin` varchar(255) NOT NULL COMMENT '始发地',
  `gate_no` varchar(30) NOT NULL COMMENT '登机口',
  `flight_date` date NOT NULL COMMENT '起飞日期',
  `fly_time` varchar(30) NOT NULL COMMENT '起飞时间：时分',
  `create_time` datetime NOT NULL,
  `delete_flag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标识：1:删除0：正常数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='临时航班信息';
CREATE TABLE `temp_ordertickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEMP_FLIGHTINFO_ID` int(11) DEFAULT '0' COMMENT '临时航班信息id',
  `STATUS` varchar(10) DEFAULT NULL,
  `flight_info` varchar(50) DEFAULT NULL COMMENT '目的地即航程信息',
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `CERT_TYPE` varchar(10) DEFAULT NULL COMMENT '证件类型',
  `CERT_NO` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `LINKPHONE` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `VIP_FLAG` varchar(10) DEFAULT NULL COMMENT '是否vip',
  `REMARK` varchar(400) DEFAULT NULL COMMENT '备注',
  `GATE` varchar(50) DEFAULT NULL COMMENT '登机口',
  `CREATEDATE` datetime DEFAULT NULL COMMENT '创建时间',
  `DELETE_FLAG` char(3) DEFAULT NULL COMMENT '删除标识',
  `LUGG_SUM` int(11) DEFAULT NULL COMMENT '行李数',
  `WEIGHT_SUM` float DEFAULT NULL COMMENT '重量',
  `SEAT_NUM` varchar(20) DEFAULT NULL,
  `GATE_TIME` varchar(20) DEFAULT NULL,
  `BAG_NUM` varchar(800) DEFAULT NULL,
  `TEAM_NAME` varchar(300) DEFAULT NULL,
  `TEAMFLAG` char(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8 COMMENT='临时航班的订票新';

