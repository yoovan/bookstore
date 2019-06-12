/*
Navicat MySQL Data Transfer

Source Server         : yostar
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-06-13 03:21:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `area` varchar(15) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '广东省', '广州市', '黄埔区', '红山街道101广州航海学院', '星星', '12312312311', '1', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `level` smallint(2) NOT NULL DEFAULT '1' COMMENT '分类级别',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '分类的类型：0:普通分类 1:推荐分类',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父级id，0代表最高级别',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('6', '程序设计', '2', '1', '5', null);
INSERT INTO `category` VALUES ('5', '计算机', '1', '0', '0', null);
INSERT INTO `category` VALUES ('7', '计算机基础', '2', '1', '5', null);
INSERT INTO `category` VALUES ('8', '小说', '1', '0', '0', null);
INSERT INTO `category` VALUES ('9', '校园小说', '2', '1', '8', null);
INSERT INTO `category` VALUES ('10', '文学', '1', '0', '0', '2019-06-13 00:52:04');
INSERT INTO `category` VALUES ('11', '青春文学', '2', '1', '10', '2019-06-13 00:52:04');
INSERT INTO `category` VALUES ('12', '测试一级分类', '1', '0', '0', '2019-06-13 00:50:22');
INSERT INTO `category` VALUES ('13', '测试二级分类', '2', '0', '12', '2019-06-13 00:51:56');
INSERT INTO `category` VALUES ('14', '计算机子类', '2', '0', '5', null);
INSERT INTO `category` VALUES ('15', '测试顶级分类', '2', '0', '0', '2019-06-13 00:49:26');
INSERT INTO `category` VALUES ('16', '测试二级分类', '1', '0', '12', '2019-06-13 00:50:14');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片地址',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '图片的类型：0：缩略图；1：详情图；2：头像；3：轮播图',
  `product_id` int(10) DEFAULT NULL COMMENT '产品编号',
  `user_id` int(10) DEFAULT NULL COMMENT '用户编号，用于指定头像的所属',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/resources/home/img/java.jpg', '0', '1', null, null);
INSERT INTO `image` VALUES ('2', '/resources/home/img/go.jpg', '0', '2', null, null);
INSERT INTO `image` VALUES ('3', '/resources/home/img/1.jpg', '3', '3', null, null);
INSERT INTO `image` VALUES ('4', '/resources/home/img/sy2.jpg', '3', '4', null, null);
INSERT INTO `image` VALUES ('5', '/resources/home/img/1.jpg', '0', '3', null, null);
INSERT INTO `image` VALUES ('6', '/resources/home/img/sy2.jpg', '0', '4', null, null);
INSERT INTO `image` VALUES ('7', '/resources/upload/e62b8343-a9de-42a9-8042-4ed93a66759d_sy3.jpg', '0', '11', null, null);
INSERT INTO `image` VALUES ('8', '/resources/upload/e62b8343-a9de-42a9-8042-4ed93a66759d_sy3.jpg', '3', '11', null, null);
INSERT INTO `image` VALUES ('9', '/resources/upload/62e1d123-ac0e-4b20-a5d2-8e10a4dd2a99_sy5.jpg', '0', '9', null, null);
INSERT INTO `image` VALUES ('10', '/resources/upload/62e1d123-ac0e-4b20-a5d2-8e10a4dd2a99_sy5.jpg', '3', '9', null, null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) NOT NULL COMMENT '订单编号',
  `user_id` int(10) NOT NULL COMMENT '下单用户',
  `product_count` tinyint(4) NOT NULL COMMENT '订单产品数量',
  `product_amount_total` decimal(10,2) NOT NULL COMMENT '产品总额',
  `order_amount_total` decimal(10,2) NOT NULL COMMENT '订单实付金额',
  `logistics_fee` decimal(8,2) DEFAULT NULL COMMENT '运费',
  `address_id` int(10) DEFAULT NULL COMMENT '收货地址编号',
  `order_logistics_id` int(10) DEFAULT NULL COMMENT '订单物流编号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0：未付款，1：已付款，2：已发货，3：已签收:，4：取消交易',
  `pay_channel` tinyint(1) DEFAULT NULL COMMENT '付款渠道 0：支付宝。1，货到付款',
  `pay_trade_no` varchar(50) DEFAULT NULL COMMENT '订单支付流水号',
  `created_at` datetime DEFAULT NULL COMMENT '订单创建时间',
  `pay_at` datetime DEFAULT NULL COMMENT '订单支付时间',
  `send_at` datetime DEFAULT NULL COMMENT '订单发货时间',
  `finish_at` datetime DEFAULT NULL COMMENT '订单完成时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '订单删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'ahiudsfhjk-23423-23asd-12', '1', '8', '800.00', '788.00', '10.00', '1', null, '4', null, null, null, null, null, null, '2019-06-10 20:32:34');
INSERT INTO `order` VALUES ('2', '123123121', '1', '2', '100.00', '100.00', null, null, null, '4', null, null, '2019-06-10 20:08:20', null, null, null, '2019-06-10 20:34:36');
INSERT INTO `order` VALUES ('3', 'book-no201805290011', '1', '1', '53.72', '53.72', null, null, null, '4', null, null, '2019-06-10 20:25:38', null, null, null, null);
INSERT INTO `order` VALUES ('4', 'book-no201906100611', '1', '2', '121.04', '121.04', null, null, null, '1', null, null, '2019-06-10 20:30:13', null, null, null, null);
INSERT INTO `order` VALUES ('5', 'book-no201906100611', '1', '4', '228.48', '228.48', null, null, null, '1', null, null, '2019-06-10 20:32:20', null, null, null, null);
INSERT INTO `order` VALUES ('6', 'book-no201906120613', '30', '1', '67.32', '67.32', null, null, null, '1', null, null, '2019-06-12 20:35:29', null, null, null, null);
INSERT INTO `order` VALUES ('7', 'book-no201906120613', '30', '0', '0.00', '0.00', null, null, null, '1', null, null, '2019-06-12 20:35:47', null, null, null, null);
INSERT INTO `order` VALUES ('8', 'book-no201906120613', '30', '0', '0.00', '0.00', null, null, null, '4', null, null, '2019-06-12 20:37:06', null, null, null, '2019-06-12 20:38:01');
INSERT INTO `order` VALUES ('9', 'book-no201906120613', '30', '0', '0.00', '0.00', null, null, null, '4', null, null, '2019-06-12 20:37:49', null, null, null, '2019-06-12 20:38:04');
INSERT INTO `order` VALUES ('10', 'book-no201906120613', '30', '0', '0.00', '0.00', null, null, null, '0', null, null, '2019-06-12 20:41:24', null, null, null, null);
INSERT INTO `order` VALUES ('11', 'book-no201906120613', '30', '2', '134.64', '134.64', null, null, null, '0', null, null, '2019-06-12 20:45:45', null, null, null, null);
INSERT INTO `order` VALUES ('12', 'book-no201906122049154916', '1', '1', '67.32', '67.32', null, null, null, '1', null, null, '2019-06-12 20:49:15', null, null, null, null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `author` varchar(50) NOT NULL,
  `isbn` varchar(13) NOT NULL COMMENT '图书编号',
  `price` decimal(10,2) NOT NULL,
  `publishing_house` varchar(50) DEFAULT NULL COMMENT '出版社名称',
  `publishing_time` varchar(30) DEFAULT NULL COMMENT '出版日期',
  `upper_time` varchar(30) DEFAULT NULL COMMENT '上架时间',
  `format` varchar(10) DEFAULT NULL COMMENT '开本-图书的尺寸',
  `page_size` smallint(4) DEFAULT NULL COMMENT '页码',
  `edition` smallint(3) DEFAULT NULL COMMENT '版次',
  `category_id` int(10) DEFAULT NULL COMMENT '图书分类编号',
  `summary` varchar(255) DEFAULT NULL COMMENT '图书简介',
  `series` varchar(50) DEFAULT NULL COMMENT '丛书名',
  `catalogue` mediumtext COMMENT '图书目录',
  `type` smallint(3) DEFAULT '0' COMMENT '显示类型 0: 普通显示 1：轮播显示；2：精选分类显示',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间-软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'java语言导学（原书第6版）', '雷蒙德·盖拉多', '9787111573302', '67.32', '机械工业出版社', '2017 年7月', '2017-7-7', '16开', '300', '1', '6', '本书基于Java SE 8编写，清晰地介绍了面向对象编程的概念、语言基础等，涵盖了Lambda表达式、类型注解、默认方法、聚合操作、日期/时间API等Java SE 8的新特性，更新了限制恶意小程序的攻击和RIA等相关内容。每章后面的问题和练习可以帮助读者巩固所学知识，此外，附录中还给出Java编程语言认证考试的相关内容。\r\n本书可作为高等院校计算机等相关专业的基础教材，也可作为编程初学者和中级程序员的参考资料。 ', '计算机科学丛书', null, '2', null);
INSERT INTO `product` VALUES ('2', 'Go程序设计语言 ', '艾伦A. A.多诺万', '9787111558422', '53.72', '机械工业出版社', '2017 年4月', '2017-4-18', '16开', '300', '1', '6', '本书由《C程序设计语言》的作者Kernighan和谷歌公司Go团队主管Alan Donovan联袂撰写，是学习Go语言程序设计的权威指南。本书共13章，主要内容包括：Go的基础知识、基本结构、基本数据类型、复合数据类型、函数、方法、接口、goroutine、通道、共享变量的并发性、包、go工具、测试、反射等。', '计算机科学丛书', null, '2', null);
INSERT INTO `product` VALUES ('3', '这是测试的轮播图-路飞', '尾田荣一郎', '21312311231', '99.99', '株式', null, null, null, '0', '0', '13', null, null, null, '1', null);
INSERT INTO `product` VALUES ('4', '啊啊啊啊啊啊啊沈月！！！是沈月！！妈！我要娶她！！', '沈月', '32131231231', '9999999.99', '真功夫', null, null, null, null, null, '9', null, null, null, '1', null);
INSERT INTO `product` VALUES ('5', '2131', '2312', 'hahahhh', '213131.00', null, null, null, null, '0', '0', '11', null, null, null, '0', null);
INSERT INTO `product` VALUES ('6', '这是书名啊', '123', '123231', '123.00', null, null, null, null, '0', '0', '11', null, null, null, '0', null);
INSERT INTO `product` VALUES ('7', '1231', '1231', '123', '1231.00', null, null, null, null, null, null, '1', null, null, null, '0', null);
INSERT INTO `product` VALUES ('8', '1231212', '1231', '12312312', '5555.00', null, null, null, null, null, null, '1', null, null, null, '0', null);
INSERT INTO `product` VALUES ('9', '77777', '77', '77777', '77.00', null, null, null, null, '0', '0', '9', null, null, null, '2', null);
INSERT INTO `product` VALUES ('10', 'title test', 'test', '12312321', '100.00', null, null, null, null, null, null, '6', null, null, null, '0', '2019-06-12 23:30:59');
INSERT INTO `product` VALUES ('11', '哈哈哈哈哈', '哈哈', '21312311231', '100.00', null, null, null, null, '0', '0', '11', null, null, null, '2', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '角色类型 0：普通用户；1：管理员',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `created_at` datetime DEFAULT NULL COMMENT '注册时间',
  `default_address_id` int(10) DEFAULT NULL COMMENT '默认收货地址id',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'yostar', '123456', '1', '17818662066', null, '2019-06-01 17:18:04', '1', null);
INSERT INTO `user` VALUES ('7', 'test', '123445', '1', '1231231', null, '2019-06-11 20:40:17', null, null);
INSERT INTO `user` VALUES ('3', '441705982@qq.com', '123456', '0', '11111111111', null, '2019-06-11 18:38:22', null, null);
INSERT INTO `user` VALUES ('5', 'root', '123456', '0', null, null, '2019-06-11 18:38:27', null, '2019-06-11 19:44:50');
INSERT INTO `user` VALUES ('6', 'yoovanchan@163.com', '123456', '1', '12312312312', null, '2019-06-11 18:38:30', null, null);
INSERT INTO `user` VALUES ('8', 'ceshiyonghu', '123123', '0', '12312312312', null, '2019-06-11 20:48:44', null, null);
INSERT INTO `user` VALUES ('9', 'ceshiyonghu', '123123', '0', '12312312312', null, '2019-06-11 20:48:54', null, null);
INSERT INTO `user` VALUES ('10', '123123', '123123', '0', '12312312312', null, '2019-06-11 20:50:51', null, null);
INSERT INTO `user` VALUES ('11', 'aaaaa', 'aaaaa', '0', '12312312312', null, '2019-06-11 20:56:25', null, null);
INSERT INTO `user` VALUES ('12', '3121', '2312', '1', '12312312312', null, '2019-06-11 21:11:49', null, null);
INSERT INTO `user` VALUES ('13', '3121', '2312', '1', '12312312312', null, '2019-06-11 21:12:18', null, null);
INSERT INTO `user` VALUES ('14', '3121', '2312', '0', '12312312312', null, '2019-06-11 21:13:20', null, null);
INSERT INTO `user` VALUES ('15', '3121', '2312', '0', '12312312312', null, '2019-06-11 21:15:08', null, null);
INSERT INTO `user` VALUES ('16', 'jhhh', 'hhhhhh', '0', '12312312312', null, '2019-06-11 21:17:42', null, null);
INSERT INTO `user` VALUES ('17', 'yostar', '123123', '1', '12312312312', null, '2019-06-11 21:18:43', null, null);
INSERT INTO `user` VALUES ('18', '1231231', '123', '0', '12312312312', null, '2019-06-11 21:20:10', null, null);
INSERT INTO `user` VALUES ('19', '1233211', '123123', '0', '12312312312', null, '2019-06-11 21:21:00', null, null);
INSERT INTO `user` VALUES ('20', 'yostar', '123456', '0', '12312312312', null, '2019-06-11 21:22:12', null, null);
INSERT INTO `user` VALUES ('21', '1231231', '123123', '0', '12312312312', null, '2019-06-11 21:24:06', null, '2019-06-12 10:16:21');
INSERT INTO `user` VALUES ('22', '1231231', '123123', '0', '12312312312', null, '2019-06-11 21:24:19', null, '2019-06-11 23:00:08');
INSERT INTO `user` VALUES ('23', 'root', '123456', '0', '12312312312', null, '2019-06-11 21:26:04', null, '2019-06-11 22:59:46');
INSERT INTO `user` VALUES ('24', 'yovan', '123456', '0', '12312312312', null, '2019-06-11 23:15:15', null, null);
INSERT INTO `user` VALUES ('25', 'yostar', '123456', '1', '12312312312', null, '2019-06-12 10:32:55', null, null);
INSERT INTO `user` VALUES ('26', 'yostar', '213', '0', '11111111111', null, '2019-06-12 10:34:44', null, null);
INSERT INTO `user` VALUES ('27', '31231', '123123', '0', '12312312312', null, '2019-06-12 16:49:26', null, null);
INSERT INTO `user` VALUES ('28', '123', '12312', '0', '12312312312', null, '2019-06-12 16:51:25', null, null);
INSERT INTO `user` VALUES ('29', '', '', '0', '', null, '2019-06-12 16:51:42', null, null);
INSERT INTO `user` VALUES ('30', 'jsptest', 'jsptest', '0', null, null, null, null, null);
