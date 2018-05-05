/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:15:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsi_messages
-- ----------------------------
DROP TABLE IF EXISTS `tsi_messages`;
CREATE TABLE `tsi_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `system_id` tinyint(4) NOT NULL COMMENT '系统ID',
  `msgtype_id` int(11) NOT NULL COMMENT '消息类型ID',
  `msg_title` varchar(128) NOT NULL COMMENT '消息标题',
  `msg_time` datetime NOT NULL COMMENT '消息时间',
  `msg_context` varchar(2048) DEFAULT NULL COMMENT '消息正文',
  PRIMARY KEY (`message_id`),
  KEY `BM_03_R_10` (`msgtype_id`),
  KEY `BM_03_R_11` (`system_id`),
  CONSTRAINT `BM_03_R_10` FOREIGN KEY (`msgtype_id`) REFERENCES `tst_msgtype` (`msgtype_id`),
  CONSTRAINT `BM_03_R_11` FOREIGN KEY (`system_id`) REFERENCES `tsi_systems` (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统消息';
