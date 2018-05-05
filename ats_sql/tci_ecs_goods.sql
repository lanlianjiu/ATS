/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:17:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tci_ecs_goods
-- ----------------------------
DROP TABLE IF EXISTS `tci_ecs_goods`;
CREATE TABLE `tci_ecs_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `company_id` smallint(6) NOT NULL COMMENT '公司ID',
  `category_id` int(11) DEFAULT NULL COMMENT '商品分类ID',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌ID',
  `goods_code` varchar(64) DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(64) NOT NULL COMMENT '商品名称',
  `goods_state_id` tinyint(4) NOT NULL COMMENT '商品状态ID',
  `goods_tags` int(11) NOT NULL COMMENT '商品标识',
  `goods_desc` text COMMENT ' 商品详情',
  `thumbnail_url` varchar(128) DEFAULT NULL COMMENT '商品缩略图',
  `image_url1` varchar(128) DEFAULT NULL COMMENT '商品图片1',
  `image_url2` varchar(128) DEFAULT NULL COMMENT '商品图片2',
  `image_url3` varchar(128) DEFAULT NULL COMMENT '商品图片3',
  `sort_no` int(11) NOT NULL COMMENT '显示顺序',
  `goods_brief` varchar(255) DEFAULT NULL COMMENT '商品简述',
  `online_time` datetime DEFAULT NULL COMMENT '上架时间',
  `offline_time` datetime DEFAULT NULL COMMENT '下架时间',
  `create_uid` int(11) NOT NULL COMMENT '创建用户ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_uid` int(11) DEFAULT NULL COMMENT '更新用户ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `sku_name` char(8) NOT NULL COMMENT 'SKU单位',
  `sku_weight` decimal(10,3) NOT NULL COMMENT 'SKU重量',
  `sku_volumn` decimal(10,2) NOT NULL COMMENT 'SKU体积',
  `sku_price` decimal(10,2) NOT NULL COMMENT 'SKU单价',
  `is_batch_enabled` tinyint(4) NOT NULL COMMENT '启用批次',
  `shelf_days` int(11) NOT NULL COMMENT '保质期（天）',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '条形码',
  `goods_pinyin` varchar(32) DEFAULT NULL COMMENT '拼音码',
  PRIMARY KEY (`goods_id`),
  KEY `ECS_01_R_231` (`category_id`),
  KEY `ECS_01_R_232` (`company_id`),
  KEY `ECS_01_R_233` (`brand_id`),
  KEY `ECS_01_R_241` (`goods_state_id`),
  KEY `ECS_01_R_291` (`create_uid`),
  KEY `ECS_01_R_292` (`update_uid`),
  CONSTRAINT `ECS_01_R_231` FOREIGN KEY (`category_id`) REFERENCES `tct_ecs_category` (`category_id`),
  CONSTRAINT `ECS_01_R_232` FOREIGN KEY (`company_id`) REFERENCES `tsi_companies` (`company_id`),
  CONSTRAINT `ECS_01_R_233` FOREIGN KEY (`brand_id`) REFERENCES `tct_ecs_brand` (`brand_id`),
  CONSTRAINT `ECS_01_R_241` FOREIGN KEY (`goods_state_id`) REFERENCES `tct_esc_goodsstate` (`goods_state_id`),
  CONSTRAINT `ECS_01_R_291` FOREIGN KEY (`create_uid`) REFERENCES `tsi_busers` (`user_id`),
  CONSTRAINT `ECS_01_R_292` FOREIGN KEY (`update_uid`) REFERENCES `tsi_busers` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品信息表';
