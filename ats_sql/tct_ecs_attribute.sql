/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:15:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tct_ecs_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tct_ecs_attribute`;
CREATE TABLE `tct_ecs_attribute` (
  `attr_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性类型ID',
  `category_id` int(11) NOT NULL COMMENT '商品分类ID',
  `attr_type_name` varchar(32) NOT NULL COMMENT '属性类型名称',
  `is_spec_attr` tinyint(4) NOT NULL COMMENT '是否规格属性',
  `sort_no` tinyint(4) NOT NULL COMMENT '显示顺序',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`attr_type_id`),
  UNIQUE KEY `XAK1_ECS_ATTRIBUTE` (`category_id`,`attr_type_name`),
  CONSTRAINT `ECS_01_R_237` FOREIGN KEY (`category_id`) REFERENCES `tct_ecs_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品属性类型';
