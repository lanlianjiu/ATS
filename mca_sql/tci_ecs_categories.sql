/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:17:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tci_ecs_categories
-- ----------------------------
DROP TABLE IF EXISTS `tci_ecs_categories`;
CREATE TABLE `tci_ecs_categories` (
  `ccategory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自定义分类ID',
  `company_id` smallint(6) NOT NULL COMMENT '公司ID',
  `category_id` int(11) NOT NULL COMMENT '商品分类ID',
  `category_name` varchar(64) DEFAULT NULL COMMENT '自定义分类名称',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`ccategory_id`),
  KEY `ECS_02_R_245` (`company_id`),
  KEY `ECS_02_R_246` (`category_id`),
  CONSTRAINT `ECS_02_R_245` FOREIGN KEY (`company_id`) REFERENCES `tsi_companies` (`company_id`),
  CONSTRAINT `ECS_02_R_246` FOREIGN KEY (`category_id`) REFERENCES `tct_ecs_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义商品分类';
