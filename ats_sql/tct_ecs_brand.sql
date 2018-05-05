/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:15:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tct_ecs_brand
-- ----------------------------
DROP TABLE IF EXISTS `tct_ecs_brand`;
CREATE TABLE `tct_ecs_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(32) NOT NULL COMMENT '品牌名称',
  `brand_logo` varchar(64) DEFAULT NULL COMMENT '品牌LOGO',
  `sort_no` smallint(6) NOT NULL COMMENT '显示顺序',
  `brand_tags` int(11) NOT NULL COMMENT '品牌标识',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品品牌';
