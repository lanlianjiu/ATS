/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:17:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tci_ecs_brands
-- ----------------------------
DROP TABLE IF EXISTS `tci_ecs_brands`;
CREATE TABLE `tci_ecs_brands` (
  `cbrand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自定义品牌ID',
  `company_id` smallint(6) NOT NULL COMMENT '公司ID',
  `brand_id` int(11) NOT NULL COMMENT '品牌ID',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '自定义品牌名称',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`cbrand_id`),
  KEY `ECS_02_R_247` (`company_id`),
  KEY `ECS_02_R_248` (`brand_id`),
  CONSTRAINT `ECS_02_R_247` FOREIGN KEY (`company_id`) REFERENCES `tsi_companies` (`company_id`),
  CONSTRAINT `ECS_02_R_248` FOREIGN KEY (`brand_id`) REFERENCES `tct_ecs_brand` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义商品品牌';
