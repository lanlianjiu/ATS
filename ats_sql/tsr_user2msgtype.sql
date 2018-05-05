/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:13:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsr_user2msgtype
-- ----------------------------
DROP TABLE IF EXISTS `tsr_user2msgtype`;
CREATE TABLE `tsr_user2msgtype` (
  `user2msgtype_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户2消息类型ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `msgtype_id` int(11) NOT NULL COMMENT '消息类型ID',
  PRIMARY KEY (`user2msgtype_id`),
  UNIQUE KEY `XAK1_BM_USER2MSGTYPE` (`user_id`,`msgtype_id`),
  KEY `BM_03_R_6` (`msgtype_id`),
  CONSTRAINT `BM_03_R_22` FOREIGN KEY (`user_id`) REFERENCES `tsi_users` (`user_id`),
  CONSTRAINT `BM_03_R_6` FOREIGN KEY (`msgtype_id`) REFERENCES `tst_msgtype` (`msgtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户2消息类型';
