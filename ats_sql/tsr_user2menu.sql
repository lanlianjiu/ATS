/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:12:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsr_user2menu
-- ----------------------------
DROP TABLE IF EXISTS `tsr_user2menu`;
CREATE TABLE `tsr_user2menu` (
  `user2menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户2菜单ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `func_tags` int(11) NOT NULL COMMENT '功能权限标识',
  PRIMARY KEY (`user2menu_id`),
  UNIQUE KEY `XAK1_BM_USER2MENU` (`user_id`,`menu_id`),
  KEY `BM_04_R_9` (`menu_id`),
  CONSTRAINT `BM_04_R_4` FOREIGN KEY (`user_id`) REFERENCES `tsi_users` (`user_id`),
  CONSTRAINT `BM_04_R_9` FOREIGN KEY (`menu_id`) REFERENCES `tsi_menus` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户2菜单';
