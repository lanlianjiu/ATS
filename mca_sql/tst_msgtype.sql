/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:14:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tst_msgtype
-- ----------------------------
DROP TABLE IF EXISTS `tst_msgtype`;
CREATE TABLE `tst_msgtype` (
  `msgtype_id` int(11) NOT NULL COMMENT '消息类型ID',
  `system_id` tinyint(4) NOT NULL COMMENT '系统ID',
  `msgcategory_id` tinyint(4) NOT NULL COMMENT '消息类别ID',
  `msgtype_name` varchar(32) NOT NULL COMMENT '消息类型名称',
  PRIMARY KEY (`msgtype_id`),
  UNIQUE KEY `XAK1_BM_MSG` (`msgtype_name`,`system_id`),
  KEY `BM_03_R_2` (`msgcategory_id`),
  KEY `BM_03_R_7` (`system_id`),
  CONSTRAINT `BM_03_R_2` FOREIGN KEY (`msgcategory_id`) REFERENCES `tst_msgcategory` (`msgcategory_id`),
  CONSTRAINT `BM_03_R_7` FOREIGN KEY (`system_id`) REFERENCES `tsi_systems` (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息类型';
