/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-04-14 10:03:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tst_rolescope
-- ----------------------------
DROP TABLE IF EXISTS `tst_rolescope`;
CREATE TABLE `tst_rolescope` (
  `role_scope_id` tinyint(4) NOT NULL COMMENT '适用范围ID',
  `role_scope_name` varchar(32) NOT NULL COMMENT '适用范围名称',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`role_scope_id`),
  UNIQUE KEY `XAK1_BM_ROLESCOPE` (`role_scope_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色适用范围';

-- ----------------------------
-- Records of tst_rolescope
-- ----------------------------
INSERT INTO `tst_rolescope` VALUES ('1', '平台', '1');
INSERT INTO `tst_rolescope` VALUES ('2', '公司', '1');
INSERT INTO `tst_rolescope` VALUES ('4', '部门', '1');
INSERT INTO `tst_rolescope` VALUES ('8', '个人', '1');
