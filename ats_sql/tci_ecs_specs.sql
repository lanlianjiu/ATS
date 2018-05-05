/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:17:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tci_ecs_specs
-- ----------------------------
DROP TABLE IF EXISTS `tci_ecs_specs`;
CREATE TABLE `tci_ecs_specs` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品规格ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `spec_name` varchar(64) NOT NULL COMMENT '品名规格',
  `spec_code` varchar(64) DEFAULT NULL COMMENT '规格编码',
  `sale_price` decimal(10,2) NOT NULL COMMENT '销售单价',
  `cost_price` decimal(10,2) NOT NULL COMMENT '成本单价',
  `cost_balance` decimal(10,2) NOT NULL COMMENT '成本差额',
  `stock_num` int(11) NOT NULL COMMENT '库存数量',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  `is_default` tinyint(4) NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`spec_id`),
  KEY `ECS_01_R_278` (`goods_id`),
  CONSTRAINT `ECS_01_R_278` FOREIGN KEY (`goods_id`) REFERENCES `tci_ecs_goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格表';
