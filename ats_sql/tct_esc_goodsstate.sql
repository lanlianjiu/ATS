/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:16:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tct_esc_goodsstate
-- ----------------------------
DROP TABLE IF EXISTS `tct_esc_goodsstate`;
CREATE TABLE `tct_esc_goodsstate` (
  `goods_state_id` tinyint(4) NOT NULL COMMENT '商品状态ID',
  `goods_state_name` varchar(32) NOT NULL COMMENT '商品状态名称',
  `is_used` tinyint(4) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`goods_state_id`),
  UNIQUE KEY `XAK1_ECS_GOODSSTATE` (`goods_state_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品状态表';
