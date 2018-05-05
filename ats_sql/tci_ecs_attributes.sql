/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:16:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tci_ecs_attributes
-- ----------------------------
DROP TABLE IF EXISTS `tci_ecs_attributes`;
CREATE TABLE `tci_ecs_attributes` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `spec_id` int(11) NOT NULL COMMENT '商品规格ID',
  `attr_type_id` int(11) NOT NULL COMMENT '属性类型ID',
  `attr_val` varchar(64) NOT NULL COMMENT '商品属性值',
  PRIMARY KEY (`attr_id`),
  UNIQUE KEY `XAK1_ECS_ATTRIBUTES` (`goods_id`,`attr_type_id`),
  KEY `ECS_01_R_238` (`attr_type_id`),
  KEY `ECS_01_R_279` (`spec_id`),
  CONSTRAINT `ECS_01_R_238` FOREIGN KEY (`attr_type_id`) REFERENCES `tct_ecs_attribute` (`attr_type_id`),
  CONSTRAINT `ECS_01_R_239` FOREIGN KEY (`goods_id`) REFERENCES `tci_ecs_goods` (`goods_id`),
  CONSTRAINT `ECS_01_R_279` FOREIGN KEY (`spec_id`) REFERENCES `tci_ecs_specs` (`spec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性';
