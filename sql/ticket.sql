/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ticket

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-02-12 20:58:59
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
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight` (
  `f_n` varchar(6) NOT NULL COMMENT '航班号',
  `f_s_p` varchar(4) NOT NULL COMMENT '航班起点',
  `f_e_p` varchar(4) NOT NULL COMMENT '航班终点',
  `f_s_a` varchar(12) NOT NULL COMMENT '航班起飞机场',
  `f_a_a` varchar(12) NOT NULL COMMENT '航班到达机场',
  `f_d_t` varchar(5) NOT NULL COMMENT '起飞(departure)时间',
  `f_a_t` varchar(5) NOT NULL COMMENT '到达时间',
  `f_f_c_p` int(11) NOT NULL COMMENT '头等舱价格First class price',
  `f_s_c_p` int(11) NOT NULL COMMENT '商务舱价格',
  `f_t_c_p` int(11) NOT NULL COMMENT '经济舱价格',
  PRIMARY KEY (`f_n`),
  UNIQUE KEY `f_n` (`f_n`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='航班信息';

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES ('SU2312', '北京', '郑州', '大兴机场', '新郑机场', '07:30', '12:00', '2100', '1500', '800');
INSERT INTO `flight` VALUES ('CA3060', '北京', '上海', '首都机场', '虹桥机场', '08:30', '12:30', '2100', '1600', '1200');

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenic_name` varchar(255) DEFAULT '' COMMENT '景区名字',
  `open_time` varchar(255) DEFAULT '' COMMENT '开放时间',
  `price_adults` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '价格',
  `price_children` float(11,0) DEFAULT '0' COMMENT '儿童价格',
  `scenic_describe` varchar(255) DEFAULT '' COMMENT '描述',
  `scenic_position` varchar(255) DEFAULT '' COMMENT '地理位置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('1', '上海迪士尼乐园', '8:00至22:00', '00000000500', '300', '一座神奇王国经典迪士尼乐园', '上海市浦东新区申迪北路753号');
INSERT INTO `scenic` VALUES ('7', '郑州方特梦幻王国', '全天', '00000000200', '120', '方特梦幻王国是以中国神话为背景的文化科技主题乐园', ' 河南省郑州市中牟县郑开大道与人文路交叉口');

-- ----------------------------
-- Table structure for scenic_order
-- ----------------------------
DROP TABLE IF EXISTS `scenic_order`;
CREATE TABLE `scenic_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '联系人名字',
  `user_id` varchar(11) DEFAULT NULL COMMENT '联系人身份证',
  `enter_time` datetime DEFAULT NULL COMMENT '入场时间',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `children_num` int(11) DEFAULT NULL,
  `ticket_num` int(11) DEFAULT NULL,
  `user_id_card` varchar(255) DEFAULT NULL,
  `scenic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic_order
-- ----------------------------
INSERT INTO `scenic_order` VALUES ('1', '张三', 'test', '2020-02-12 00:00:00', '13659632541', '1', '1', '410728199606121436', null);
