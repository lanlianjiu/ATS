/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ats

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-06 16:31:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_menus
-- ----------------------------
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE `admin_menus` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `system_id` tinyint(4) NOT NULL COMMENT '系统ID',
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_dname` varchar(64) NOT NULL COMMENT '菜单显示名称',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `help_url` varchar(255) DEFAULT NULL COMMENT '帮助URL',
  `menu_p_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  `menu_tags` int(11) NOT NULL COMMENT '菜单标识',
  `menu_order` int(11) NOT NULL COMMENT '菜单显示顺序',
  `new_window_opened` tinyint(4) NOT NULL COMMENT '是否新建窗口',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `XAK1_BM_MENUS` (`system_id`,`menu_name`) USING BTREE,
  KEY `BM_03_R_14` (`menu_p_id`) USING BTREE,
  CONSTRAINT `admin_menus_ibfk_1` FOREIGN KEY (`menu_p_id`) REFERENCES `admin_menus` (`menu_id`),
  CONSTRAINT `admin_menus_ibfk_2` FOREIGN KEY (`system_id`) REFERENCES `common_system` (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of admin_menus
-- ----------------------------
INSERT INTO `admin_menus` VALUES ('1', '100', '首页', '首页', '', null, null, null, '0', '0', '0', '0');
INSERT INTO `admin_menus` VALUES ('2', '100', '订单管理', '订单管理', 'fa-pencil-square-o', null, null, null, '1', '0', '1', '0');
INSERT INTO `admin_menus` VALUES ('3', '100', '商品管理', '商品管理', 'fa-suitcase', null, null, null, '1', '0', '2', '0');
INSERT INTO `admin_menus` VALUES ('4', '100', '会员管理', '会员管理', 'fa-group', null, null, null, '1', '0', '3', '0');
INSERT INTO `admin_menus` VALUES ('5', '100', '系统管理', '系统管理', 'fa-sitemap', null, null, null, '1', '0', '4', '0');
INSERT INTO `admin_menus` VALUES ('6', '100', '系统配置', '系统配置', 'fa-cogs', null, null, null, '1', '0', '5', '0');
INSERT INTO `admin_menus` VALUES ('7', '100', '经营报表', '经营报表', 'fa-bar-chart', null, null, null, '1', '0', '6', '0');
INSERT INTO `admin_menus` VALUES ('2001', '100', '订单列表', '订单列表', null, 'OSM/orderList.html', null, '2', '1', '0', '0', '0');
INSERT INTO `admin_menus` VALUES ('3001', '100', '商品列表', '商品列表', null, null, null, '3', '1', '0', '1', '0');
INSERT INTO `admin_menus` VALUES ('3002', '100', '分类管理', '分类管理', null, null, null, '3', '1', '0', '2', '0');
INSERT INTO `admin_menus` VALUES ('3003', '100', '品牌管理', '品牌管理', null, null, null, '3', '1', '0', '3', '0');
INSERT INTO `admin_menus` VALUES ('4001', '100', '会员列表', '会员列表', null, null, null, '4', '1', '0', '1', '0');
INSERT INTO `admin_menus` VALUES ('5001', '100', '公司管理', '公司管理', null, 'UM/companyMgt.html', null, '5', '1', '0', '1', '0');
INSERT INTO `admin_menus` VALUES ('5002', '100', '用户列表', '用户列表', null, 'UM/adminUserlist.html', null, '5', '1', '0', '2', '0');
INSERT INTO `admin_menus` VALUES ('6001', '100', '参数配置', '参数配置', null, null, null, '6', '1', '0', '1', '0');
INSERT INTO `admin_menus` VALUES ('7001', '100', '报表统计', '报表统计', null, null, null, '7', '1', '0', '0', '0');
