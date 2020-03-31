/*
Navicat MySQL Data Transfer

Source Server         : UserM
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : mshop

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-01 21:00:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` varchar(50) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `lastdate` datetime DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '21232F297A57A5A743894A0E4A801FC3', '2018-05-01 20:53:35');

-- ----------------------------
-- Table structure for details
-- ----------------------------
DROP TABLE IF EXISTS `details`;
CREATE TABLE `details` (
  `odid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`odid`),
  KEY `fk_oid` (`oid`),
  KEY `fk_gid` (`gid`),
  CONSTRAINT `fk_gid` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`) ON DELETE SET NULL,
  CONSTRAINT `fk_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of details
-- ----------------------------
INSERT INTO `details` VALUES ('1', '1', '5', '佳洁士牙膏', '25.5', '4');
INSERT INTO `details` VALUES ('2', '1', '6', '平底锅', '65.8', '2');
INSERT INTO `details` VALUES ('3', '1', '8', '玩具车', '199', '1');
INSERT INTO `details` VALUES ('4', '1', '9', '手术钳', '30', '1');
INSERT INTO `details` VALUES ('5', '1', '10', '哑铃', '118.8', '1');
INSERT INTO `details` VALUES ('6', '2', '5', '佳洁士牙膏', '25.5', '1');
INSERT INTO `details` VALUES ('7', '2', '9', '手术钳', '30', '1');
INSERT INTO `details` VALUES ('8', '2', '10', '哑铃', '118.8', '1');
INSERT INTO `details` VALUES ('9', '2', '11', '黑色中性笔', '1.5', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT NULL,
  `aid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `pubdate` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `bow` int(11) DEFAULT NULL,
  `note` text,
  `photo` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `fk_iid` (`iid`),
  KEY `fi_aid` (`aid`),
  CONSTRAINT `fi_aid` FOREIGN KEY (`aid`) REFERENCES `admin` (`aid`) ON DELETE SET NULL,
  CONSTRAINT `fk_iid` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('5', '3', 'admin', '佳洁士牙膏', '2018-04-17 15:35:00', '25.5', '45', '7', '佳洁士牙膏。', '7e4a0138-38db-415e-a515-13cc3921213b.jpg', '1');
INSERT INTO `goods` VALUES ('6', '1', 'admin', '平底锅', '2018-04-19 00:28:08', '65.8', '58', '1', '平底锅可以用来煎鸡蛋。', '99200b4a-4abd-4816-97de-e467f38ff168.jpg', '1');
INSERT INTO `goods` VALUES ('8', '2', 'admin', '玩具车', '2018-04-19 17:21:08', '199', '29', '1', '儿童玩具车  红。', '291fc6f0-a3c6-4652-8d60-51b6a705ccec.jpg', '1');
INSERT INTO `goods` VALUES ('9', '3', 'admin', '手术钳', '2018-04-20 14:09:03', '30', '98', '0', '各类手术钳。', '84b75ed8-3aa6-4f62-bd75-8c304735ac8c.jpg', '1');
INSERT INTO `goods` VALUES ('10', '4', 'admin', '哑铃', '2018-04-20 14:10:53', '118.8', '58', '0', '重达16 kg哑铃。', '879e4d61-caa3-40aa-b06e-8dd0d2b720bc.jpg', '1');
INSERT INTO `goods` VALUES ('11', '5', 'admin', '黑色中性笔', '2018-04-20 14:12:25', '1.5', '199', '0', '黑色中性笔，0.5mm！', '4e174f2c-9ae2-4ba8-9b91-8ec08196b5a5.jpg', '1');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '厨房用品');
INSERT INTO `item` VALUES ('2', '儿童玩具');
INSERT INTO `item` VALUES ('3', '医疗器械');
INSERT INTO `item` VALUES ('4', '运动健身');
INSERT INTO `item` VALUES ('5', '办公用品');
INSERT INTO `item` VALUES ('6', '起居用品');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mid` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `regdate` datetime NOT NULL,
  `photo` varchar(50) DEFAULT 'nophoto.jpg',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('admin', 'E10ADC3949BA59ABBE56E057F20F883E', null, '123456', null, 'bd119bda-633f-45c0-a99b-ccfebb372e8c', '1', '2018-04-10 20:09:26', 'nophoto.jpg');
INSERT INTO `member` VALUES ('admin001', 'E10ADC3949BA59ABBE56E057F20F883E', null, '123456', null, 'cde54699-f9a0-4677-b9ac-baec470bd181', '1', '2018-04-10 20:11:44', 'nophoto.jpg');
INSERT INTO `member` VALUES ('admin002', 'E10ADC3949BA59ABBE56E057F20F883E', null, '123456', null, '0f40f09b-6e59-4b8a-8965-9d967e83b393', '1', '2018-04-10 20:17:45', 'nophoto.jpg');
INSERT INTO `member` VALUES ('mm', 'E10ADC3949BA59ABBE56E057F20F883E', '小李', '123456', '湖北武汉', 'b1e15616-9459-47d1-862e-6d19493d3af3', '1', '2018-04-06 13:26:35', 'nophoto.jpg');
INSERT INTO `member` VALUES ('root', 'E10ADC3949BA59ABBE56E057F20F883E', '小王', '123456', '湖北武汉', null, '1', '2018-04-05 00:00:00', '048da2bf-7c5b-4320-8c24-6d8c2070e435.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `credate` datetime DEFAULT NULL,
  `pay` float DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_mid` (`mid`),
  CONSTRAINT `fk_mid` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'mm', '小李', '123456', '湖北武汉', '2018-05-01 15:34:24', '581.4');
INSERT INTO `orders` VALUES ('2', 'root', '小王', '123456', '湖北武汉', '2018-05-01 17:24:07', '175.8');

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `gid` int(11) DEFAULT NULL,
  `mid` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  KEY `fk_gid3` (`gid`),
  KEY `fk_mid3` (`mid`),
  CONSTRAINT `fk_gid3` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`) ON DELETE CASCADE,
  CONSTRAINT `fk_mid3` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
