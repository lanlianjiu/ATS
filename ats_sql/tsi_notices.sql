/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:14:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsi_notices
-- ----------------------------
DROP TABLE IF EXISTS `tsi_notices`;
CREATE TABLE `tsi_notices` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `system_id` tinyint(4) NOT NULL COMMENT '系统ID',
  `msgtype_id` int(11) NOT NULL COMMENT '消息类型ID',
  `notice_title` varchar(128) NOT NULL COMMENT '公告标题',
  `notice_text` varchar(4096) NOT NULL COMMENT '公告正文',
  `notice_status` tinyint(4) NOT NULL COMMENT '公告状态',
  `release_uid` int(11) NOT NULL COMMENT '发布用户ID',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`notice_id`),
  KEY `BM_03_R_12` (`msgtype_id`),
  KEY `BM_03_R_13` (`system_id`),
  KEY `BM_03_R_18` (`release_uid`),
  CONSTRAINT `BM_03_R_12` FOREIGN KEY (`msgtype_id`) REFERENCES `tst_msgtype` (`msgtype_id`),
  CONSTRAINT `BM_03_R_13` FOREIGN KEY (`system_id`) REFERENCES `tsi_systems` (`system_id`),
  CONSTRAINT `BM_03_R_18` FOREIGN KEY (`release_uid`) REFERENCES `tsi_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统公告';
