/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:13:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsr_user2system
-- ----------------------------
DROP TABLE IF EXISTS `tsr_user2system`;
CREATE TABLE `tsr_user2system` (
  `user2system_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户2系统ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `system_id` tinyint(4) NOT NULL COMMENT '系统ID',
  PRIMARY KEY (`user2system_id`),
  UNIQUE KEY `XAK1_BM_USER2SYSTEM` (`user_id`,`system_id`),
  KEY `BM_04_R_8` (`system_id`),
  CONSTRAINT `BM_04_R_5` FOREIGN KEY (`user_id`) REFERENCES `tsi_users` (`user_id`),
  CONSTRAINT `BM_04_R_8` FOREIGN KEY (`system_id`) REFERENCES `tsi_systems` (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8 COMMENT='用户2系统';
