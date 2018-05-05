/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:13:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tst_company
-- ----------------------------
DROP TABLE IF EXISTS `tst_company`;
CREATE TABLE `tst_company` (
  `ctype_id` smallint(6) NOT NULL COMMENT '公司类型ID',
  `ctype_name` varchar(32) NOT NULL COMMENT '公司类型名称',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  `system_id` tinyint(4) DEFAULT NULL COMMENT '默认系统ID',
  `role_id` int(11) DEFAULT NULL COMMENT '默认角色ID',
  PRIMARY KEY (`ctype_id`),
  UNIQUE KEY `XAK1_BM_COMPANY` (`ctype_name`),
  KEY `BM_B01_R_428` (`system_id`),
  KEY `BM_B01_R_429` (`role_id`),
  CONSTRAINT `BM_B01_R_428` FOREIGN KEY (`system_id`) REFERENCES `tsi_systems` (`system_id`),
  CONSTRAINT `BM_B01_R_429` FOREIGN KEY (`role_id`) REFERENCES `tsi_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司类型';
