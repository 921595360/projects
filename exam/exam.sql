/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-12-06 15:05:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ques_id`,`exam_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_answer
-- ----------------------------
INSERT INTO `t_answer` VALUES ('2', '1', '1', null);
INSERT INTO `t_answer` VALUES ('3', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('4', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('5', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('6', '1', '1', 'B');
INSERT INTO `t_answer` VALUES ('7', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('8', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('9', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('10', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('11', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('12', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('13', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('14', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('15', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('16', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('17', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('18', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('19', '1', '1', 'B,C');
INSERT INTO `t_answer` VALUES ('2', '1', '2', null);
INSERT INTO `t_answer` VALUES ('3', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('4', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('5', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('6', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('7', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('8', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('9', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('10', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('11', '1', '2', 'A,B');
INSERT INTO `t_answer` VALUES ('12', '1', '2', 'A,B');
INSERT INTO `t_answer` VALUES ('13', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('14', '1', '2', 'A,C');
INSERT INTO `t_answer` VALUES ('15', '1', '2', 'A,B');
INSERT INTO `t_answer` VALUES ('16', '1', '2', 'A,B');
INSERT INTO `t_answer` VALUES ('17', '1', '2', 'A,B');
INSERT INTO `t_answer` VALUES ('18', '1', '2', 'B,C');
INSERT INTO `t_answer` VALUES ('19', '1', '2', 'A,B');
INSERT INTO `t_answer` VALUES ('2', '1', '3', null);
INSERT INTO `t_answer` VALUES ('3', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('4', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('5', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('6', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('7', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('8', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('9', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('10', '1', '3', 'B,C');
INSERT INTO `t_answer` VALUES ('11', '1', '3', 'B,C');
INSERT INTO `t_answer` VALUES ('12', '1', '3', 'B,C');
INSERT INTO `t_answer` VALUES ('13', '1', '3', 'A,B,C');
INSERT INTO `t_answer` VALUES ('14', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('15', '1', '3', 'B,C');
INSERT INTO `t_answer` VALUES ('16', '1', '3', 'B,C');
INSERT INTO `t_answer` VALUES ('17', '1', '3', 'A,C');
INSERT INTO `t_answer` VALUES ('18', '1', '3', 'A,B');
INSERT INTO `t_answer` VALUES ('19', '1', '3', 'A,B,C');
INSERT INTO `t_answer` VALUES ('2', '1', '4', null);
INSERT INTO `t_answer` VALUES ('3', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('4', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('5', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('6', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('7', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('8', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('9', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('10', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('11', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('12', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('13', '1', '4', 'A,C');
INSERT INTO `t_answer` VALUES ('14', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('15', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('16', '1', '4', 'B,C,D');
INSERT INTO `t_answer` VALUES ('17', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('18', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('19', '1', '4', 'A,B');
INSERT INTO `t_answer` VALUES ('2', '1', '5', null);
INSERT INTO `t_answer` VALUES ('3', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('4', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('5', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('6', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('7', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('8', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('9', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('10', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('11', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('12', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('13', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('14', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('15', '1', '5', 'A,C');
INSERT INTO `t_answer` VALUES ('16', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('17', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('18', '1', '5', 'B,C');
INSERT INTO `t_answer` VALUES ('19', '1', '5', 'B,D');
INSERT INTO `t_answer` VALUES ('2', '1', '6', null);
INSERT INTO `t_answer` VALUES ('3', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('4', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('5', '1', '6', 'B,C');
INSERT INTO `t_answer` VALUES ('6', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('7', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('8', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('9', '1', '6', 'A,D');
INSERT INTO `t_answer` VALUES ('10', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('11', '1', '6', 'A,C');
INSERT INTO `t_answer` VALUES ('12', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('13', '1', '6', 'A,C');
INSERT INTO `t_answer` VALUES ('14', '1', '6', 'B,C');
INSERT INTO `t_answer` VALUES ('15', '1', '6', 'A,B');
INSERT INTO `t_answer` VALUES ('16', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('17', '1', '6', 'B,D');
INSERT INTO `t_answer` VALUES ('18', '1', '6', 'B,C');
INSERT INTO `t_answer` VALUES ('19', '1', '6', 'B,C');
INSERT INTO `t_answer` VALUES ('2', '1', '7', null);
INSERT INTO `t_answer` VALUES ('3', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('4', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('5', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('6', '1', '7', 'A,B,C');
INSERT INTO `t_answer` VALUES ('7', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('8', '1', '7', '');
INSERT INTO `t_answer` VALUES ('9', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('10', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('11', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('12', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('13', '1', '7', 'B,C');
INSERT INTO `t_answer` VALUES ('14', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('15', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('16', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('17', '1', '7', 'D');
INSERT INTO `t_answer` VALUES ('18', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('19', '1', '7', 'A,B');
INSERT INTO `t_answer` VALUES ('2', '1', '8', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('4', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('5', '1', '8', 'D');
INSERT INTO `t_answer` VALUES ('6', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('7', '1', '8', 'A');
INSERT INTO `t_answer` VALUES ('8', '1', '8', 'D');
INSERT INTO `t_answer` VALUES ('9', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('10', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('11', '1', '8', 'A');
INSERT INTO `t_answer` VALUES ('12', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('13', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('14', '1', '8', 'A');
INSERT INTO `t_answer` VALUES ('15', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('16', '1', '8', 'B');
INSERT INTO `t_answer` VALUES ('17', '1', '8', 'A');
INSERT INTO `t_answer` VALUES ('18', '1', '8', 'C');
INSERT INTO `t_answer` VALUES ('19', '1', '8', 'A');
INSERT INTO `t_answer` VALUES ('2', '1', '9', null);
INSERT INTO `t_answer` VALUES ('3', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('4', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('5', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('6', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('7', '1', '9', 'A,C');
INSERT INTO `t_answer` VALUES ('8', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('9', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('10', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('11', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('12', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('13', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('14', '1', '9', 'A,C');
INSERT INTO `t_answer` VALUES ('15', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('16', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('17', '1', '9', 'B,C');
INSERT INTO `t_answer` VALUES ('18', '1', '9', 'A,B');
INSERT INTO `t_answer` VALUES ('19', '1', '9', 'A,C');
INSERT INTO `t_answer` VALUES ('2', '1', '10', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('4', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('5', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('6', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('7', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('8', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('9', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('10', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('11', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('12', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('13', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('14', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('15', '1', '10', 'B');
INSERT INTO `t_answer` VALUES ('16', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('17', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('18', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('19', '1', '10', 'A');
INSERT INTO `t_answer` VALUES ('2', '1', '11', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('4', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('5', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('6', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('7', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('8', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('9', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('10', '1', '11', 'D');
INSERT INTO `t_answer` VALUES ('11', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('12', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('13', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('14', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('15', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('16', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('17', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('18', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('19', '1', '11', 'B');
INSERT INTO `t_answer` VALUES ('2', '1', '12', null);
INSERT INTO `t_answer` VALUES ('3', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('4', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('5', '1', '12', 'B,D');
INSERT INTO `t_answer` VALUES ('6', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('7', '1', '12', 'B,D');
INSERT INTO `t_answer` VALUES ('8', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('9', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('10', '1', '12', 'A,D');
INSERT INTO `t_answer` VALUES ('11', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('12', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('13', '1', '12', 'B,C');
INSERT INTO `t_answer` VALUES ('14', '1', '12', 'B,D');
INSERT INTO `t_answer` VALUES ('15', '1', '12', 'A,B,D');
INSERT INTO `t_answer` VALUES ('16', '1', '12', 'A,C');
INSERT INTO `t_answer` VALUES ('17', '1', '12', 'B,C,D');
INSERT INTO `t_answer` VALUES ('18', '1', '12', 'B,D');
INSERT INTO `t_answer` VALUES ('19', '1', '12', 'B,D');
INSERT INTO `t_answer` VALUES ('2', '1', '13', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('4', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('5', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('6', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('7', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('8', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('9', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('10', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('11', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('12', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('13', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('14', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('15', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('16', '1', '13', 'D');
INSERT INTO `t_answer` VALUES ('17', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('18', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('19', '1', '13', 'C');
INSERT INTO `t_answer` VALUES ('2', '1', '14', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('4', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('5', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('6', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('7', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('8', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('9', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('10', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('11', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('12', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('13', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('14', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('15', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('16', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('17', '1', '14', 'D');
INSERT INTO `t_answer` VALUES ('18', '1', '14', 'C');
INSERT INTO `t_answer` VALUES ('19', '1', '14', 'A');
INSERT INTO `t_answer` VALUES ('2', '1', '15', null);
INSERT INTO `t_answer` VALUES ('3', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('4', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('5', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('6', '1', '15', 'A,C,D');
INSERT INTO `t_answer` VALUES ('7', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('8', '1', '15', 'B,C,D');
INSERT INTO `t_answer` VALUES ('9', '1', '15', 'B,C,D');
INSERT INTO `t_answer` VALUES ('10', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('11', '1', '15', 'B,C,D');
INSERT INTO `t_answer` VALUES ('12', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('13', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('14', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('15', '1', '15', 'B,D');
INSERT INTO `t_answer` VALUES ('16', '1', '15', 'B,C,D');
INSERT INTO `t_answer` VALUES ('17', '1', '15', 'A,B,C,D');
INSERT INTO `t_answer` VALUES ('18', '1', '15', 'B,C,D');
INSERT INTO `t_answer` VALUES ('19', '1', '15', 'B,C');
INSERT INTO `t_answer` VALUES ('2', '1', '16', null);
INSERT INTO `t_answer` VALUES ('3', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('4', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('5', '1', '16', 'A,B,C');
INSERT INTO `t_answer` VALUES ('6', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('7', '1', '16', 'A,C,D');
INSERT INTO `t_answer` VALUES ('8', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('9', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('10', '1', '16', 'A,C');
INSERT INTO `t_answer` VALUES ('11', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('12', '1', '16', 'A,D');
INSERT INTO `t_answer` VALUES ('13', '1', '16', 'A,D');
INSERT INTO `t_answer` VALUES ('14', '1', '16', 'A,C,D');
INSERT INTO `t_answer` VALUES ('15', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('16', '1', '16', 'C,D');
INSERT INTO `t_answer` VALUES ('17', '1', '16', 'A,D');
INSERT INTO `t_answer` VALUES ('18', '1', '16', 'D');
INSERT INTO `t_answer` VALUES ('19', '1', '16', 'A,C,D');
INSERT INTO `t_answer` VALUES ('2', '1', '17', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '17', 'B');
INSERT INTO `t_answer` VALUES ('4', '1', '17', 'D');
INSERT INTO `t_answer` VALUES ('5', '1', '17', 'A');
INSERT INTO `t_answer` VALUES ('6', '1', '17', 'B');
INSERT INTO `t_answer` VALUES ('7', '1', '17', 'B');
INSERT INTO `t_answer` VALUES ('8', '1', '17', 'A');
INSERT INTO `t_answer` VALUES ('9', '1', '17', 'D');
INSERT INTO `t_answer` VALUES ('10', '1', '17', 'D');
INSERT INTO `t_answer` VALUES ('11', '1', '17', 'A');
INSERT INTO `t_answer` VALUES ('12', '1', '17', 'B');
INSERT INTO `t_answer` VALUES ('13', '1', '17', 'C');
INSERT INTO `t_answer` VALUES ('14', '1', '17', 'A');
INSERT INTO `t_answer` VALUES ('15', '1', '17', 'A');
INSERT INTO `t_answer` VALUES ('16', '1', '17', 'A');
INSERT INTO `t_answer` VALUES ('17', '1', '17', 'A');
INSERT INTO `t_answer` VALUES ('18', '1', '17', 'D');
INSERT INTO `t_answer` VALUES ('19', '1', '17', 'B');
INSERT INTO `t_answer` VALUES ('2', '1', '18', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '18', 'A');
INSERT INTO `t_answer` VALUES ('4', '1', '18', 'A');
INSERT INTO `t_answer` VALUES ('5', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('6', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('7', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('8', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('9', '1', '18', 'A');
INSERT INTO `t_answer` VALUES ('10', '1', '18', 'A');
INSERT INTO `t_answer` VALUES ('11', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('12', '1', '18', 'A');
INSERT INTO `t_answer` VALUES ('13', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('14', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('15', '1', '18', 'A');
INSERT INTO `t_answer` VALUES ('16', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('17', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('18', '1', '18', 'C');
INSERT INTO `t_answer` VALUES ('19', '1', '18', 'B');
INSERT INTO `t_answer` VALUES ('2', '1', '19', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('4', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('5', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('6', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('7', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('8', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('9', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('10', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('11', '1', '19', 'C');
INSERT INTO `t_answer` VALUES ('12', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('13', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('14', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('15', '1', '19', 'C');
INSERT INTO `t_answer` VALUES ('16', '1', '19', 'C');
INSERT INTO `t_answer` VALUES ('17', '1', '19', 'C');
INSERT INTO `t_answer` VALUES ('18', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('19', '1', '19', 'D');
INSERT INTO `t_answer` VALUES ('2', '1', '20', 'undefined');
INSERT INTO `t_answer` VALUES ('3', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('4', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('5', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('6', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('7', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('8', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('9', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('10', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('11', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('12', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('13', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('14', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('15', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('16', '1', '20', 'A');
INSERT INTO `t_answer` VALUES ('17', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('18', '1', '20', 'C');
INSERT INTO `t_answer` VALUES ('19', '1', '20', 'C');

-- ----------------------------
-- Table structure for t_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题（如：第三次月考）',
  `begin_time` varchar(19) NOT NULL COMMENT '考试时间（年月日）',
  `need_time` int(11) NOT NULL COMMENT '所需时间（单位分钟）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exam
-- ----------------------------
INSERT INTO `t_exam` VALUES ('1', '2017-12-01周考试题', '16：30', '60');

-- ----------------------------
-- Table structure for t_exam_ques
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_ques`;
CREATE TABLE `t_exam_ques` (
  `exam_id` int(11) NOT NULL COMMENT '考试编号',
  `ques_id` int(11) NOT NULL COMMENT '题目编号',
  PRIMARY KEY (`exam_id`,`ques_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exam_ques
-- ----------------------------
INSERT INTO `t_exam_ques` VALUES ('1', '1');
INSERT INTO `t_exam_ques` VALUES ('1', '2');
INSERT INTO `t_exam_ques` VALUES ('1', '3');
INSERT INTO `t_exam_ques` VALUES ('1', '4');
INSERT INTO `t_exam_ques` VALUES ('1', '5');
INSERT INTO `t_exam_ques` VALUES ('1', '6');
INSERT INTO `t_exam_ques` VALUES ('1', '7');
INSERT INTO `t_exam_ques` VALUES ('1', '8');
INSERT INTO `t_exam_ques` VALUES ('1', '9');
INSERT INTO `t_exam_ques` VALUES ('1', '10');
INSERT INTO `t_exam_ques` VALUES ('1', '11');
INSERT INTO `t_exam_ques` VALUES ('1', '12');
INSERT INTO `t_exam_ques` VALUES ('1', '13');
INSERT INTO `t_exam_ques` VALUES ('1', '14');
INSERT INTO `t_exam_ques` VALUES ('1', '15');
INSERT INTO `t_exam_ques` VALUES ('1', '16');
INSERT INTO `t_exam_ques` VALUES ('1', '17');
INSERT INTO `t_exam_ques` VALUES ('1', '18');
INSERT INTO `t_exam_ques` VALUES ('1', '19');
INSERT INTO `t_exam_ques` VALUES ('1', '20');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` text NOT NULL COMMENT '题目',
  `answer` varchar(20) NOT NULL COMMENT '答案',
  `score` smallint(2) NOT NULL COMMENT '分值',
  `choose` text,
  `type` smallint(1) DEFAULT '0' COMMENT '题型：0:单选,1:多选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '下面关于Spring的说话正确的是', 'B,C', '5', ' A:Spring是一个重量级的框架>B:Spring是一个轻量级的框架>C:Spring是一个IOC和AOP容器>D:Spring是一个入侵式的框架', '1');
INSERT INTO `t_question` VALUES ('2', '下面关于IOC的理解，正确的是', 'A,B', '5', 'A:控制反转>B:对象被动的接受依赖类>C:对象主动的去找依赖类>D:一定要用接口', '1');
INSERT INTO `t_question` VALUES ('3', 'Spring各模块之间关系', 'B,C', '5', 'A:Spring各模块之间是紧密联系的，相互依赖的>B:Spring各模块之间可以单独存在>C:Spring的核心模块是必须的，其他模块是基于核心模块>D:Spring的核心模块不是必须的，可以不要 ', '1');
INSERT INTO `t_question` VALUES ('4', '下面是Spring依赖注入方式的是', 'A,B', '5', 'A:set方法注入>B:构造方法的注入>C:get方法的注入>D:接口的注入', '1');
INSERT INTO `t_question` VALUES ('5', '下面关于在Spring中配置Bean的id属性的说法正确的是', 'B,D', '5', 'A:id属性是必须，没有id属性就会报错 >B:id属性不是必须的，可以没有> C:id属性的值可以重复>D:id属性的值不可以重复', '1');
INSERT INTO `t_question` VALUES ('6', '下面关于在Spring中配置Bean的name属性的说法正确的是', 'B,D', '5', ' A:name属性是必须，没有name属性就会报错>B:name属性不是必须的，可以没有>C:name属性的值可以重复>D:name属性的值不可以重复', '1');
INSERT INTO `t_question` VALUES ('7', '下面是IOC自动装载方法的是', 'A,B,C', '5', 'A:byName>B:byType>C:constructor>D:byMethod', '1');
INSERT INTO `t_question` VALUES ('8', '下面关于在Spring中配置Bean的init-method的说法正确的是', 'C', '5', ' A:init-method是在最前面执行的>B:init-method在构造方法后，依赖注入前执行> C:init-method在依赖注入之后执行>D:init-method在依赖注入之后，构造函数之前执行', '0');
INSERT INTO `t_question` VALUES ('9', '下面关于Spring配置文件说话正确的是', 'B,C', '5', 'A:Spring配置文件必须叫applicationContext.xml>B:Spring配置文件可以不叫applicationContext.xml>C:Spring配置文件可以有多个>D:Spring配置文件只能有一个', '1');
INSERT INTO `t_question` VALUES ('10', '下面关于Spring管理Bean的说法正确的是', 'B', '5', 'A:Bean在Spring容器中有两种管理方式，工厂模式和单例模式> B:Bean在 Spring容器中有两种管理方式，原型模式和单例模式>C:Spring默认的利用工厂模式管理Bean>D:Spring默认利用原型模式管理Bean', '0');
INSERT INTO `t_question` VALUES ('11', '下面关于在spring中配置bean的id属性的说法正确的是', 'B', '5', 'A、Id属性是必须，没有id属性就会报错>B、id属性不是必须的，可以没有>C、Id属性的值可以重复>D、除了id必须再配置name属性，不然会报错', '0');
INSERT INTO `t_question` VALUES ('12', '关于FORM表单提交的HTTP的GET方法', 'B,D', '5', 'A．不能向服务器提交两进制数据>B．不能向服务器提交无限长度的数据>C．不能向服务器提交多值参数>D．参数附在URL后面', '1');
INSERT INTO `t_question` VALUES ('13', '在web.xml中下面哪一个标签表示servlet的URL的映射', 'D', '5', 'A．mapping>B．servlet-url>C．url_mapping>D．servlet-mapping', '0');
INSERT INTO `t_question` VALUES ('14', '下列哪一个方法用于从session中得到对象 ', 'D', '5', 'A．Session接口的getAttribute()方法 >B．HttpSession接口的getValue方法 >C．Session接口的getValue()方法 >D．HttpSession接口的getAttribute()方法', '0');
INSERT INTO `t_question` VALUES ('15', '在浏览器禁用cookie前提下，下列哪些技术能够记住客户端状态 ', 'B,C,D', '5', 'A．Http headers>B．Httpsession>C．隐藏域>D．URL重写', '1');
INSERT INTO `t_question` VALUES ('16', '下列哪些表达式所存储的对象可以被servlet或jsp在session里使用', 'C,D', '5', 'A．request.setAttribute(name,value);>B．response.setAttribute(name,value);>C．request.getSession().setAttribute(name,value);>D．servlet.getServletContext().setAttribute(name,value);', '1');
INSERT INTO `t_question` VALUES ('17', '下列哪个方法用于URL重写', 'D', '5', 'A．HttpServletResponse接口的rewriteURL()方法>B．HttpServlet接口的rewriteURL()方法>C．HttpServletRequest接口的encodeURL()方法>D．HttpServletResponse接口的encodeURL()方法', '0');
INSERT INTO `t_question` VALUES ('18', 'ServletContext对象是由（）创建的? ', 'C', '5', 'A .由Servlet容器负责创建，对于每个HTTP请求， Servlet容器都会创建一个ServletContext对象>B.由JavaWeb应用本身负责为自己创建一个ServletContext对象>C.由Servlet容器负责创建，对于每个JavaWeb应用，在启动时，Servlet容器都会创建一个ServletContext对象>D.由用户访问的时候自己创建。', '0');
INSERT INTO `t_question` VALUES ('19', '下列叙述正确的是', 'D', '5', 'A、abstact可修饰属性、方法和类//(不能修饰类)>B、抽象方法有方法体>C、声明抽象方法，大括号可有可无>D、声明抽象方法不可写出大括号', '0');
INSERT INTO `t_question` VALUES ('20', '下列表达式正确的是', 'C', '5', 'A、byte b = 128;>B、boolean flag = null;>C、long a = 2147483648L;>D、float f = 0.9239;//0.9293f', '0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_pass` varchar(20) NOT NULL,
  `age` int(3) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '18');
INSERT INTO `t_user` VALUES ('2', '张三', '123', null);
INSERT INTO `t_user` VALUES ('3', '刘春风', '123', null);
INSERT INTO `t_user` VALUES ('4', '李志鹏', '123', null);
INSERT INTO `t_user` VALUES ('5', '蒋涵', '123', null);
INSERT INTO `t_user` VALUES ('6', '柏志成', '23541201', null);
INSERT INTO `t_user` VALUES ('7', '谢美银', 'xiemeiyin1989', null);
INSERT INTO `t_user` VALUES ('8', '汪珉玉', '10010', null);
INSERT INTO `t_user` VALUES ('9', '邱世勇', '123456', null);
INSERT INTO `t_user` VALUES ('10', '范运祥', '110787', null);
INSERT INTO `t_user` VALUES ('11', '黄婕', '123', null);
INSERT INTO `t_user` VALUES ('12', '吕文峰', '100', null);
INSERT INTO `t_user` VALUES ('13', '王海宁', '1234', null);
INSERT INTO `t_user` VALUES ('14', '杨振宇', '123', null);
INSERT INTO `t_user` VALUES ('15', '袁龙威', ' ', null);
INSERT INTO `t_user` VALUES ('16', '王波', '110', null);
INSERT INTO `t_user` VALUES ('17', '蒋友建', '111', null);
INSERT INTO `t_user` VALUES ('18', '郑健', '1314520', null);
INSERT INTO `t_user` VALUES ('19', '张开宇', '123456', null);

-- ----------------------------
-- View structure for v_result
-- ----------------------------
DROP VIEW IF EXISTS `v_result`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_result` AS select `t3`.`user_id` AS `user_id`,`t4`.`user_name` AS `user_name`,`t3`.`exam_id` AS `exam_id`,`t2`.`id` AS `ques_id`,`t2`.`title` AS `title`,`t2`.`choose` AS `choose`,`t2`.`score` AS `score`,`t2`.`answer` AS `answer`,`t3`.`answer` AS `myAnswer` from (((`t_exam_ques` `t1` left join `t_question` `t2` on((`t1`.`ques_id` = `t2`.`id`))) left join `t_answer` `t3` on(((`t1`.`exam_id` = `t3`.`exam_id`) and (`t2`.`id` = `t3`.`ques_id`)))) left join `t_user` `t4` on((`t3`.`user_id` = `t4`.`user_id`))) ;

-- ----------------------------
-- View structure for v_score
-- ----------------------------
DROP VIEW IF EXISTS `v_score`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_score` AS select `t1`.`user_id` AS `user_id`,`t1`.`exam_id` AS `exam_id`,sum(`t2`.`score`) AS `score`,`t3`.`user_name` AS `user_name` from ((`t_answer` `t1` left join `t_question` `t2` on(((`t1`.`ques_id` = `t2`.`id`) and (`t1`.`answer` = `t2`.`answer`)))) left join `t_user` `t3` on((`t1`.`user_id` = `t3`.`user_id`))) group by `t1`.`user_id`,`t1`.`exam_id` ;
