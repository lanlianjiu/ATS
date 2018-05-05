/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:13:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsr_user2role
-- ----------------------------
DROP TABLE IF EXISTS `tsr_user2role`;
CREATE TABLE `tsr_user2role` (
  `user2role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户2角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `create_uid` int(11) NOT NULL COMMENT '创建用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user2role_id`),
  UNIQUE KEY `XAK1_BM_USER2ROLE` (`user_id`,`role_id`),
  KEY `BM_04_R_3` (`role_id`),
  CONSTRAINT `BM_04_R_2` FOREIGN KEY (`user_id`) REFERENCES `tsi_users` (`user_id`),
  CONSTRAINT `BM_04_R_3` FOREIGN KEY (`role_id`) REFERENCES `tsi_roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='用户2角色';
