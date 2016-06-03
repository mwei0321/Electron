/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : mw_electrical

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-06-01 18:25:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mw_admin_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `mw_admin_system_menu`;
CREATE TABLE `mw_admin_system_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父级菜单',
  `name` varchar(20) DEFAULT NULL COMMENT '菜单名称',
  `key` varchar(20) DEFAULT NULL COMMENT '菜单别名 (一般为模型名)',
  `action` varchar(20) DEFAULT NULL COMMENT '执行动作，用去选中状态',
  `url` varchar(120) DEFAULT NULL COMMENT '链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '菜单显示状态　1为显示　0为隐藏',
  `sort` tinyint(2) DEFAULT '1' COMMENT '菜单排序',
  `position` tinyint(20) DEFAULT NULL COMMENT '位置  顶部0　左则1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='后台菜单设置';

-- ----------------------------
-- Table structure for mw_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `mw_admin_user`;
CREATE TABLE `mw_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL COMMENT '权限角色',
  `name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `passwd` varchar(40) DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `uptime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台用户';

-- ----------------------------
-- Table structure for mw_app
-- ----------------------------
DROP TABLE IF EXISTS `mw_app`;
CREATE TABLE `mw_app` (
  `id` int(11) NOT NULL,
  `app_name` varchar(25) DEFAULT NULL COMMENT 'app名称',
  `app_alias` varchar(25) CHARACTER SET utf8 DEFAULT NULL COMMENT 'App别名',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `app_entry` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT 'app入口，如 ‘Home/Index’',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mw_article
-- ----------------------------
DROP TABLE IF EXISTS `mw_article`;
CREATE TABLE `mw_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `cateid` int(11) NOT NULL COMMENT '分类ID',
  `tags` varchar(200) NOT NULL COMMENT '标签ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0 隐藏、1显示）',
  `title` varchar(150) NOT NULL COMMENT '文章标题',
  `author` int(11) NOT NULL COMMENT '作者ID',
  `hots` int(11) NOT NULL COMMENT '点击率',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `uptime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Table structure for mw_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `mw_article_comment`;
CREATE TABLE `mw_article_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artid` int(11) NOT NULL COMMENT '文章ID',
  `uid` int(11) NOT NULL DEFAULT '-1' COMMENT '用户ID',
  `content` text NOT NULL COMMENT '内容',
  `uname` varchar(15) DEFAULT NULL COMMENT '用户名',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0 隐藏、1显示）',
  `email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `homepage` varchar(80) DEFAULT NULL COMMENT '个人主页',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论、留言本';

-- ----------------------------
-- Table structure for mw_article_content
-- ----------------------------
DROP TABLE IF EXISTS `mw_article_content`;
CREATE TABLE `mw_article_content` (
  `artid` int(11) NOT NULL COMMENT '文章ID',
  `description` text NOT NULL COMMENT '描述',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`artid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章内容';

-- ----------------------------
-- Table structure for mw_category
-- ----------------------------
DROP TABLE IF EXISTS `mw_category`;
CREATE TABLE `mw_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(30) NOT NULL COMMENT '分类名',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0 隐藏、1显示）',
  `menu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单显示',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `sort` tinyint(3) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Table structure for mw_grade
-- ----------------------------
DROP TABLE IF EXISTS `mw_grade`;
CREATE TABLE `mw_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员等级名称',
  `level` tinyint(2) DEFAULT '0' COMMENT '等级',
  `grade` int(11) DEFAULT NULL COMMENT '需要的分数',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型',
  `face` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员等级头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mw_grade_type
-- ----------------------------
DROP TABLE IF EXISTS `mw_grade_type`;
CREATE TABLE `mw_grade_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型名称',
  `alias` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '别名(一般为英文）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mw_member
-- ----------------------------
DROP TABLE IF EXISTS `mw_member`;
CREATE TABLE `mw_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(35) NOT NULL COMMENT '用户名',
  `email` varchar(120) DEFAULT NULL COMMENT '邮箱',
  `passwd` varchar(40) NOT NULL COMMENT '密码',
  `role` tinyint(2) DEFAULT NULL COMMENT '角色',
  `avatar` varchar(120) DEFAULT NULL COMMENT '头像　150*150',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态　0未激活  ,.1激活 , -1禁用',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别　1男　2.女　3.无性别',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ',
  `home` varchar(120) DEFAULT NULL COMMENT '个人主页',
  `lasttime` int(11) DEFAULT NULL COMMENT '最后登入时间',
  `lastip` varchar(20) DEFAULT NULL COMMENT '最后登入IP',
  `registertime` int(11) DEFAULT NULL COMMENT '注册时间',
  `grade` int(11) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Table structure for mw_system_init_config
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_init_config`;
CREATE TABLE `mw_system_init_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '配置名称',
  `key` varchar(255) DEFAULT NULL COMMENT '设置key',
  `value` varchar(50) NOT NULL COMMENT '配置值',
  `explain` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `model` varchar(15) DEFAULT NULL COMMENT '配置模块(全局配置　Public)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统初始化配置';
