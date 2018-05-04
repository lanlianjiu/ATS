/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mca

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-31 14:46:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mca_article`
-- ----------------------------
DROP TABLE IF EXISTS `mca_article`;
CREATE TABLE `mca_article` (
  `article_id` int(11) NOT NULL,
  `article_type_id` int(11) DEFAULT NULL,
  `article_content` varchar(20) DEFAULT NULL,
  `is_used` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `create_uid` int(11) DEFAULT NULL,
  `update_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  CONSTRAINT `mca_article_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article_type` (`article_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mca_article
-- ----------------------------
