/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:15:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsi_roles
-- ----------------------------
DROP TABLE IF EXISTS `tsi_roles`;
CREATE TABLE `tsi_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `system_id` tinyint(4) NOT NULL COMMENT '系统ID',
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `role_memo` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  `role_tags` int(11) NOT NULL COMMENT '角色标识',
  `create_uid` int(11) NOT NULL COMMENT '创建用户ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_cid` smallint(6) NOT NULL COMMENT '创建公司ID',
  `create_did` int(11) NOT NULL COMMENT '创建部门ID',
  `role_scope_id` tinyint(4) NOT NULL COMMENT '适用范围ID',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `XAK1_BM_ROLES` (`role_name`,`create_cid`) USING BTREE,
  KEY `BM_04_R_6` (`system_id`),
  KEY `BM_04_R_1` (`create_uid`),
  KEY `BM_04_R_11` (`create_cid`),
  KEY `BM_04_R_12` (`create_did`),
  KEY `BM_04_R_13` (`role_scope_id`),
  CONSTRAINT `BM_04_R_1` FOREIGN KEY (`create_uid`) REFERENCES `tsi_users` (`user_id`),
  CONSTRAINT `BM_04_R_11` FOREIGN KEY (`create_cid`) REFERENCES `tsi_companies` (`company_id`),
  CONSTRAINT `BM_04_R_12` FOREIGN KEY (`create_did`) REFERENCES `tsi_departments` (`department_id`),
  CONSTRAINT `BM_04_R_13` FOREIGN KEY (`role_scope_id`) REFERENCES `tst_rolescope` (`role_scope_id`),
  CONSTRAINT `BM_04_R_6` FOREIGN KEY (`system_id`) REFERENCES `tsi_systems` (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='用户角色';
