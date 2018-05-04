/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-31 14:47:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `user_coupon_id` int(11) NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_uid` int(11) DEFAULT NULL,
  `coupon_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `user_id` (`user_id`),
  KEY `create_uid` (`create_uid`),
  KEY `coupon_status` (`coupon_status`),
  CONSTRAINT `user_coupon_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `mca_coupon` (`coupon_id`),
  CONSTRAINT `user_coupon_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `web_user` (`id`),
  CONSTRAINT `user_coupon_ibfk_3` FOREIGN KEY (`create_uid`) REFERENCES `web_user` (`id`),
  CONSTRAINT `user_coupon_ibfk_4` FOREIGN KEY (`coupon_status`) REFERENCES `coupon_status` (`coupon_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_coupon
-- ----------------------------
