/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : vtms

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:22:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tci_menutags
-- ----------------------------
DROP TABLE IF EXISTS `tci_menutags`;
CREATE TABLE `tci_menutags` (
  `tag_id` int(11) NOT NULL COMMENT '菜单标识ID',
  `tag_name` varchar(32) NOT NULL COMMENT '菜单标识名称',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `XAK1_MENUTAGS` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单标识';
