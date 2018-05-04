/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-31 14:47:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_receiving_address`
-- ----------------------------
DROP TABLE IF EXISTS `user_receiving_address`;
CREATE TABLE `user_receiving_address` (
  `address_id` int(11) NOT NULL,
  `is_default` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `address_detail` varchar(20) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_uid` int(11) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  KEY `create_uid` (`create_uid`),
  KEY `update_uid` (`update_uid`),
  CONSTRAINT `user_receiving_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `web_user` (`id`),
  CONSTRAINT `user_receiving_address_ibfk_2` FOREIGN KEY (`create_uid`) REFERENCES `web_user` (`id`),
  CONSTRAINT `user_receiving_address_ibfk_3` FOREIGN KEY (`update_uid`) REFERENCES `web_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_receiving_address
-- ----------------------------
