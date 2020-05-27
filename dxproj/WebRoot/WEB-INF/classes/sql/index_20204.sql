ALTER TABLE `op_ordertickets`
ADD INDEX `ind_finfoId_tpointIndex` (`FLIGHTINFO_ID`, `TICKETPOINT_ID`) USING BTREE COMMENT '统计索引';

