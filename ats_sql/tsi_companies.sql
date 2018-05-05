/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:14:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsi_companies
-- ----------------------------
DROP TABLE IF EXISTS `tsi_companies`;
CREATE TABLE `tsi_companies` (
  `company_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `company_name` varchar(64) NOT NULL COMMENT '公司名称',
  `company_code` varchar(32) NOT NULL COMMENT '公司编码',
  `ctype_id` smallint(6) NOT NULL COMMENT '公司类型ID',
  `is_used` tinyint(4) NOT NULL COMMENT '是否启用',
  `company_p_id` smallint(6) DEFAULT NULL COMMENT '上级公司ID',
  `level_key` varchar(255) NOT NULL COMMENT '层级Key',
  `region_id` int(11) DEFAULT NULL COMMENT '所在区域ID',
  `office_address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `office_tel` varchar(32) DEFAULT NULL COMMENT '公司电话',
  `contacts` varchar(16) DEFAULT NULL COMMENT '联系人',
  `contacts_tel` varchar(32) DEFAULT NULL COMMENT '联系人电话',
  `inner_code` varchar(32) DEFAULT NULL COMMENT '内部编码',
  `account_id` int(11) DEFAULT NULL COMMENT '结算账户ID',
  `create_uid` int(11) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `XAK1_BM_COMPANIES` (`company_name`),
  UNIQUE KEY `XAK2_BM_COMPANIES` (`company_code`),
  KEY `BM_B01_R_2` (`region_id`),
  KEY `BM_B01_R_7` (`company_p_id`),
  KEY `BM_B01_R_1` (`ctype_id`),
  KEY `BM_B01_R_383` (`account_id`),
  KEY `BM_B01_R_321` (`create_uid`),
  CONSTRAINT `BM_B01_R_1` FOREIGN KEY (`ctype_id`) REFERENCES `tst_company` (`ctype_id`),
  CONSTRAINT `BM_B01_R_2` FOREIGN KEY (`region_id`) REFERENCES `tci_regions` (`region_id`),
  CONSTRAINT `BM_B01_R_321` FOREIGN KEY (`create_uid`) REFERENCES `tsi_users` (`user_id`),
  CONSTRAINT `BM_B01_R_383` FOREIGN KEY (`account_id`) REFERENCES `tfi_accounts` (`account_id`),
  CONSTRAINT `BM_B01_R_7` FOREIGN KEY (`company_p_id`) REFERENCES `tsi_companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COMMENT='公司档案';
