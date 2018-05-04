/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:14:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsi_departments
-- ----------------------------
DROP TABLE IF EXISTS `tsi_departments`;
CREATE TABLE `tsi_departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `company_id` smallint(6) NOT NULL COMMENT '公司ID',
  `dtype_id` int(11) NOT NULL COMMENT '部门类型ID',
  `department_name` varchar(64) NOT NULL COMMENT '部门名称',
  `department_code` varchar(32) DEFAULT NULL COMMENT '部门编码',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  `department_tags` int(11) NOT NULL COMMENT '部门标识',
  `department_p_id` int(11) DEFAULT NULL COMMENT '上级部门ID',
  `level_key` varchar(255) NOT NULL COMMENT '层级Key',
  `region_id` int(11) DEFAULT NULL COMMENT '所在区域ID',
  `office_address` varchar(255) DEFAULT NULL COMMENT '部门地址',
  `office_tel` varchar(32) DEFAULT NULL COMMENT '部门电话',
  `contacts` varchar(16) DEFAULT NULL COMMENT '联系人',
  `contacts_tel` varchar(32) DEFAULT NULL COMMENT '联系人电话',
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `XAK1_BM_DEPARTMENTS` (`company_id`,`department_name`),
  KEY `BM_B01_R_4` (`region_id`),
  KEY `BM_B01_R_10` (`department_p_id`),
  KEY `BM_B01_R_9` (`dtype_id`),
  CONSTRAINT `BM_B01_R_4` FOREIGN KEY (`region_id`) REFERENCES `tci_regions` (`region_id`),
  CONSTRAINT `BM_B01_R_5` FOREIGN KEY (`company_id`) REFERENCES `tsi_companies` (`company_id`),
  CONSTRAINT `BM_B01_R_9` FOREIGN KEY (`dtype_id`) REFERENCES `tst_department` (`dtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COMMENT='部门档案';
