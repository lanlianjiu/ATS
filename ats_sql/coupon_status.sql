/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-31 14:45:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `coupon_status`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_status`;
CREATE TABLE `coupon_status` (
  `coupon_status_id` int(11) NOT NULL,
  `coupon_status_name` char(18) DEFAULT NULL,
  PRIMARY KEY (`coupon_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_status
-- ----------------------------
