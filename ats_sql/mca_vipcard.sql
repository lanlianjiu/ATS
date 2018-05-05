/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-31 14:46:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mca_vipcard`
-- ----------------------------
DROP TABLE IF EXISTS `mca_vipcard`;
CREATE TABLE `mca_vipcard` (
  `card_id` char(18) NOT NULL,
  `vipcard_no` varchar(20) DEFAULT NULL,
  `vip_integral` int(11) DEFAULT NULL,
  `user_id` int(18) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `user_id` (`user_id`),
  KEY `create_uid` (`create_uid`),
  CONSTRAINT `mca_vipcard_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `web_user` (`id`),
  CONSTRAINT `mca_vipcard_ibfk_2` FOREIGN KEY (`create_uid`) REFERENCES `web_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mca_vipcard
-- ----------------------------
