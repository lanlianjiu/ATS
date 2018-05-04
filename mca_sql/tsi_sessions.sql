/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:15:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsi_sessions
-- ----------------------------
DROP TABLE IF EXISTS `tsi_sessions`;
CREATE TABLE `tsi_sessions` (
  `session_id` char(36) NOT NULL COMMENT '会话ID',
  `session_state_id` tinyint(4) NOT NULL COMMENT '会话状态ID',
  `system_id` tinyint(4) DEFAULT NULL COMMENT '系统ID',
  `remote_addr` varchar(16) DEFAULT NULL COMMENT '访问IP地址',
  `os_name` varchar(32) DEFAULT NULL COMMENT '操作系统名称',
  `os_ver` varchar(32) DEFAULT NULL COMMENT '操作系统版本',
  `browser_name` varchar(32) DEFAULT NULL COMMENT '浏览器名称',
  `browser_ver` varchar(32) DEFAULT NULL COMMENT '浏览器版本',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `destroy_time` datetime DEFAULT NULL COMMENT '注销时间',
  PRIMARY KEY (`session_id`),
  KEY `BM_09_R_249` (`system_id`),
  KEY `BM_09_R_253` (`session_state_id`),
  CONSTRAINT `BM_09_R_249` FOREIGN KEY (`system_id`) REFERENCES `tsi_systems` (`system_id`),
  CONSTRAINT `BM_09_R_253` FOREIGN KEY (`session_state_id`) REFERENCES `tst_sessionstate` (`session_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统会话';
