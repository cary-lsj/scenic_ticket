/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ticket

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-02-17 15:29:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user` varchar(16) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(32) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('admin', '74D839D98630E280DF752E8939454A6B');

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user` (
  `user_name` varchar(16) NOT NULL,
  `user_pwd` varchar(32) NOT NULL,
  `avatar_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of common_user
-- ----------------------------
INSERT INTO `common_user` VALUES ('admin', '9C70EA7F3264F3E7284853BE80DD3865', '9c77f9e7-6334-49df-a444-149e7bd49f81.png');
INSERT INTO `common_user` VALUES ('test', 'F59BD65F7EDAFB087A81D4DCA06C4910', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户Id',
  `content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `message_date` datetime DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'test', '上海迪士尼乐园太好玩了！！！', '2020-02-17 00:00:00');
INSERT INTO `message` VALUES ('4', 'test', '上海迪士尼乐园太好玩了！！！', '2020-02-17 15:14:42');
INSERT INTO `message` VALUES ('3', 'test', '上海迪士尼乐园太好玩了！！！', '2020-02-17 00:00:00');
INSERT INTO `message` VALUES ('5', 'test', '上海迪士尼乐园太好玩了！！！', '2020-02-17 15:19:01');

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenic_name` varchar(255) DEFAULT '' COMMENT '景区名字',
  `open_time` varchar(255) DEFAULT '' COMMENT '景区开放时间',
  `price_adults` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '成人票价格',
  `price_children` float(11,0) DEFAULT '0' COMMENT '儿童票价格',
  `scenic_describe` varchar(255) DEFAULT '' COMMENT '景区描述',
  `scenic_position` varchar(255) DEFAULT '' COMMENT '景区地理位置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('1', '上海迪士尼乐园', '8:00至22:00', '00000000500', '300', '一座神奇王国经典迪士尼乐园', '上海市浦东新区申迪北路753号');
INSERT INTO `scenic` VALUES ('7', '郑州方特梦幻王国', '全天', '00000000200', '120', '方特梦幻王国是以中国神话为背景的文化科技主题乐园', ' 河南省郑州市中牟县郑开大道与人文路交叉口');
INSERT INTO `scenic` VALUES ('8', ' 北京富国海底世界', '8:00-18:00(旺季)  8:30-17:30(淡季) ', '00000000100', '60', '寓教于乐的海底主题乐园,炫酷的极光世界，震撼您的感官视听,异域风情的俄罗斯美人鱼和水下芭蕾表演,120米的超长海底隧道', '北京市朝阳区三里屯工体北路工体南门');

-- ----------------------------
-- Table structure for ticket_order
-- ----------------------------
DROP TABLE IF EXISTS `ticket_order`;
CREATE TABLE `ticket_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '联系人名字',
  `user_id` varchar(11) DEFAULT NULL COMMENT '用户id',
  `enter_time` datetime DEFAULT NULL COMMENT '入场时间',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `children_num` int(11) DEFAULT NULL,
  `adults_num` int(11) DEFAULT NULL,
  `user_id_card` varchar(255) DEFAULT NULL,
  `scenic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket_order
-- ----------------------------
INSERT INTO `ticket_order` VALUES ('1', '张三', 'test', '2020-02-12 00:00:00', '13659632541', '1', '1', '410728199606121436', '1');
INSERT INTO `ticket_order` VALUES ('2', '李四', 'test', '2020-02-29 00:00:00', '15538612536', '0', '1', '410728199707171214', '8');
INSERT INTO `ticket_order` VALUES ('3', '李四', 'test', '2020-02-15 00:00:00', '15538612536', '3', '2', '410728199707171214', '1');
INSERT INTO `ticket_order` VALUES ('4', '赵武', 'test', '2020-02-15 00:00:00', '15538612536', '3', '2', '410728199832171214', '1');
INSERT INTO `ticket_order` VALUES ('5', '赵六', 'test', '2020-02-15 00:00:00', '15538612536', '2', '2', '410728199832171214', '1');
