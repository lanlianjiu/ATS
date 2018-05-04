/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:14:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsi_menufuncs
-- ----------------------------
DROP TABLE IF EXISTS `tsi_menufuncs`;
CREATE TABLE `tsi_menufuncs` (
  `func_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能项ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `func_name` varchar(64) NOT NULL COMMENT '功能项名称',
  `func_code` int(11) NOT NULL COMMENT '功能项编码',
  `func_memo` varchar(255) DEFAULT NULL COMMENT '功能项描述',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`func_id`),
  UNIQUE KEY `XAK1_BM_MENUFUNC` (`menu_id`,`func_name`),
  UNIQUE KEY `XAK2_BM_MENUFUNC` (`menu_id`,`func_code`),
  CONSTRAINT `BM_03_R_9` FOREIGN KEY (`menu_id`) REFERENCES `tsi_menus` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='系统功能项';
