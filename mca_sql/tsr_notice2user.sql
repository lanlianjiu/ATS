/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:12:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsr_notice2user
-- ----------------------------
DROP TABLE IF EXISTS `tsr_notice2user`;
CREATE TABLE `tsr_notice2user` (
  `notice2user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告2用户ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `notice_id` int(11) NOT NULL COMMENT '公告ID',
  `read_status` int(11) NOT NULL COMMENT '查阅状态',
  `read_time` int(11) DEFAULT NULL COMMENT '查阅时间',
  PRIMARY KEY (`notice2user_id`),
  UNIQUE KEY `XAK1_BM_NOTICE2USER` (`user_id`,`notice_id`),
  KEY `BM_03_R_16` (`notice_id`),
  CONSTRAINT `BM_03_R_16` FOREIGN KEY (`notice_id`) REFERENCES `tsi_notices` (`notice_id`),
  CONSTRAINT `BM_03_R_19` FOREIGN KEY (`user_id`) REFERENCES `tsi_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告2用户';
