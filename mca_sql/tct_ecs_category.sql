/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:16:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tct_ecs_category
-- ----------------------------
DROP TABLE IF EXISTS `tct_ecs_category`;
CREATE TABLE `tct_ecs_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `category_name` varchar(64) NOT NULL COMMENT '商品分类名称',
  `category_p_id` int(11) DEFAULT NULL COMMENT '父级分类ID',
  `sort_no` int(11) NOT NULL COMMENT '显示顺序',
  `category_tags` int(11) NOT NULL COMMENT '分类标识',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `XAK1_ECS_CATEGORY` (`category_name`),
  KEY `ECS_01_R_230` (`category_p_id`),
  CONSTRAINT `ECS_01_R_230` FOREIGN KEY (`category_p_id`) REFERENCES `tct_ecs_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2511 DEFAULT CHARSET=utf8 COMMENT='商品分类';
