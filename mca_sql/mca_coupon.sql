/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-31 14:46:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mca_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `mca_coupon`;
CREATE TABLE `mca_coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(20) DEFAULT NULL,
  `is_used` int(11) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `coupon_type_id` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_uid` int(11) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `coupon_type_id` (`coupon_type_id`),
  KEY `create_uid` (`create_uid`),
  KEY `update_uid` (`update_uid`),
  CONSTRAINT `mca_coupon_ibfk_1` FOREIGN KEY (`coupon_type_id`) REFERENCES `coupon_type` (`coupon_type_id`),
  CONSTRAINT `mca_coupon_ibfk_2` FOREIGN KEY (`create_uid`) REFERENCES `web_user` (`id`),
  CONSTRAINT `mca_coupon_ibfk_3` FOREIGN KEY (`update_uid`) REFERENCES `web_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mca_coupon
-- ----------------------------
