/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-31 14:45:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tsi_systems`
-- ----------------------------
DROP TABLE IF EXISTS `tsi_systems`;
CREATE TABLE `tsi_systems` (
  `system_id` tinyint(11) DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  KEY `system_id` (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tsi_systems
-- ----------------------------
INSERT INTO `tsi_systems` VALUES ('100', '后台系统');
