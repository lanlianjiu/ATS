/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-11 18:36:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mca_orders
-- ----------------------------
DROP TABLE IF EXISTS `mca_orders`;
CREATE TABLE `mca_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL,
  `order_status` int(11) DEFAULT NULL,
  `order_type_id` int(11) DEFAULT NULL,
  `comany_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_addr` varchar(20) DEFAULT NULL,
  `order_addr_id` int(11) NOT NULL,
  `order_amont` varchar(20) DEFAULT NULL,
  `create_time` date NOT NULL,
  `create_uid` int(11) NOT NULL,
  `update_date` varchar(255) DEFAULT NULL,
  `update_uid` int(11) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `consigneePhone` int(11) DEFAULT NULL,
  `provinceId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `countryId` smallint(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_type_id` (`order_type_id`),
  KEY `provinceId` (`provinceId`),
  KEY `cityId` (`cityId`),
  KEY `countryId` (`countryId`),
  CONSTRAINT `mca_orders_ibfk_1` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `mca_orders_ibfk_2` FOREIGN KEY (`provinceId`) REFERENCES `tci_regions` (`region_id`),
  CONSTRAINT `mca_orders_ibfk_3` FOREIGN KEY (`cityId`) REFERENCES `tci_regions` (`region_id`),
  CONSTRAINT `mca_orders_ibfk_4` FOREIGN KEY (`countryId`) REFERENCES `tci_regions` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mca_orders
-- ----------------------------
