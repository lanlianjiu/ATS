/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:13:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tst_department
-- ----------------------------
DROP TABLE IF EXISTS `tst_department`;
CREATE TABLE `tst_department` (
  `dtype_id` int(11) NOT NULL COMMENT '部门类型ID',
  `dtype_name` varchar(32) NOT NULL COMMENT '部门类型名称',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`dtype_id`),
  UNIQUE KEY `XAK1_BM_DEPARTMENT` (`dtype_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门类型';
