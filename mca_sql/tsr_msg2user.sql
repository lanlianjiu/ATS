/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.231
Source Server Version : 50623
Source Host           : 192.168.1.231:3306
Source Database       : anjie

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-27 09:12:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsr_msg2user
-- ----------------------------
DROP TABLE IF EXISTS `tsr_msg2user`;
CREATE TABLE `tsr_msg2user` (
  `msg2user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息2用户ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `message_id` int(11) NOT NULL COMMENT '消息ID',
  `is_readed` int(11) NOT NULL COMMENT '查阅状态',
  `read_time` int(11) DEFAULT NULL COMMENT '查阅时间',
  PRIMARY KEY (`msg2user_id`),
  UNIQUE KEY `XAK1_BM_MSG2USER` (`user_id`,`message_id`),
  KEY `BM_03_R_17` (`message_id`),
  CONSTRAINT `BM_03_R_17` FOREIGN KEY (`message_id`) REFERENCES `tsi_messages` (`message_id`),
  CONSTRAINT `BM_03_R_20` FOREIGN KEY (`user_id`) REFERENCES `tsi_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='消息2用户';
