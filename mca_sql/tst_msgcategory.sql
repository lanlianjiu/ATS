/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:14:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tst_msgcategory
-- ----------------------------
DROP TABLE IF EXISTS `tst_msgcategory`;
CREATE TABLE `tst_msgcategory` (
  `msgcategory_id` tinyint(4) NOT NULL COMMENT '消息类别ID',
  `msgcategory_name` varchar(32) NOT NULL COMMENT '消息类别名称',
  PRIMARY KEY (`msgcategory_id`),
  UNIQUE KEY `XAK1_BM_MSGCATEGORY` (`msgcategory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息类别';
