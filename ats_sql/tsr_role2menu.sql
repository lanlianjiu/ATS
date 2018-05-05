/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:12:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsr_role2menu
-- ----------------------------
DROP TABLE IF EXISTS `tsr_role2menu`;
CREATE TABLE `tsr_role2menu` (
  `role2menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色2菜单ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `func_tags` int(10) unsigned NOT NULL COMMENT '功能权限标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role2menu_id`),
  UNIQUE KEY `XAK1_BM_ROLE2MENU` (`role_id`,`menu_id`),
  KEY `BM_04_R_10` (`menu_id`),
  CONSTRAINT `BM_04_R_10` FOREIGN KEY (`menu_id`) REFERENCES `tsi_menus` (`menu_id`),
  CONSTRAINT `BM_04_R_7` FOREIGN KEY (`role_id`) REFERENCES `tsi_roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4484 DEFAULT CHARSET=utf8 COMMENT='用户角色2菜单';
