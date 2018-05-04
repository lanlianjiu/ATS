/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:17:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tci_ecs_packagings
-- ----------------------------
DROP TABLE IF EXISTS `tci_ecs_packagings`;
CREATE TABLE `tci_ecs_packagings` (
  `packaging_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '包装ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `packaging_name` varchar(32) NOT NULL COMMENT '包装名称',
  `packaging_code` varchar(32) DEFAULT NULL COMMENT '包装编码',
  `sku_coefficient` decimal(10,2) NOT NULL COMMENT 'SKU系数',
  `packaging_volume` decimal(10,2) NOT NULL COMMENT '包装总体积',
  `packaging_weight` decimal(10,2) NOT NULL COMMENT '包装总重量',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  `sale_price` decimal(10,2) NOT NULL COMMENT '商品售价',
  `is_default` tinyint(4) NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`packaging_id`),
  UNIQUE KEY `XAK1_ECS_PACKAGING` (`goods_id`,`packaging_name`),
  CONSTRAINT `ECS_01_R_535` FOREIGN KEY (`goods_id`) REFERENCES `tci_ecs_goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品包装信息';
