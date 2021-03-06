/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : mw_electron

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-08-19 18:31:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_navi_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_navi_menu`;
CREATE TABLE `admin_navi_menu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='后台菜单设置';

-- ----------------------------
-- Records of admin_navi_menu
-- ----------------------------
INSERT INTO `admin_navi_menu` VALUES ('1', '0', '系统管理', 'System', 'index', 'Admin/System/index', '1', '97', '0');
INSERT INTO `admin_navi_menu` VALUES ('2', '1', '后台导航菜单', 'System', 'adminmenu', 'Admin/System/menu', '1', '80', '1');
INSERT INTO `admin_navi_menu` VALUES ('11', '0', '元件管理', 'Electron', 'index', 'Admin/Electron/index', '1', '90', '0');
INSERT INTO `admin_navi_menu` VALUES ('12', '11', '元件列表', 'Electron', 'index', 'Admin/Electron/index', '1', '80', '1');
INSERT INTO `admin_navi_menu` VALUES ('13', '11', '元件分类', 'Electron', 'category', 'Admin/Electron/category', '1', '70', '1');
INSERT INTO `admin_navi_menu` VALUES ('14', '0', '文章管理', 'Article', 'index', 'Admin/Article/index', '1', '95', '0');
INSERT INTO `admin_navi_menu` VALUES ('15', '14', '文章列表', 'Article', 'index', 'Admin/Article/index', '1', '80', '1');
INSERT INTO `admin_navi_menu` VALUES ('17', '14', '文章分类', 'CateTag', 'index', 'Admin/CateTag/index/type/cate', '1', '75', '1');
INSERT INTO `admin_navi_menu` VALUES ('20', '0', '前端设置', 'Home', 'index', 'Admin/Home/index', '1', '60', '0');
INSERT INTO `admin_navi_menu` VALUES ('19', '14', '文章标签', 'CateTag', 'tagedit', 'Admin/CateTag/index/type/tag', '1', '60', '1');
INSERT INTO `admin_navi_menu` VALUES ('21', '20', '导航菜单', 'Home', 'naviMenu', 'Admin/WebConf/naviMenu', '1', '90', '1');
INSERT INTO `admin_navi_menu` VALUES ('22', '0', '用户权限管理', 'Rbac', 'index', 'Admin/Rbac/inde', '1', '50', '0');
INSERT INTO `admin_navi_menu` VALUES ('23', '22', '权限父节点', 'Rbac', 'parentNode', 'Admin/Rbac/parentNode', '1', '70', '1');
INSERT INTO `admin_navi_menu` VALUES ('24', '22', '权限子节点', 'Rbac', 'node', 'Admin/Rbac/node', '1', '80', '1');
INSERT INTO `admin_navi_menu` VALUES ('25', '22', '权限节点组', 'Rbac', 'nodeGroup', 'Admin/Rbac/nodeGroup', '1', '85', '1');
INSERT INTO `admin_navi_menu` VALUES ('26', '22', '用户权限', 'Rbac', 'index', 'Admin/Rbac/index', '1', '90', '1');
INSERT INTO `admin_navi_menu` VALUES ('27', '1', '焦点广告管理', 'WebConf', 'bannr', 'Admin/WebConf/bannr', '1', '70', '1');
INSERT INTO `admin_navi_menu` VALUES ('28', '11', '元件套装', 'Electron', 'suit', 'Admin/Electron/suit', '1', '70', '1');
INSERT INTO `admin_navi_menu` VALUES ('29', '14', '教程文章', 'Tutorial', 'index', 'Admin/Tutorial/index', '1', '85', '1');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL COMMENT '权限角色',
  `name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `passwd` varchar(40) DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `uptime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台用户';

-- ----------------------------
-- Records of admin_user
-- ----------------------------

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `id` int(11) NOT NULL,
  `app_name` varchar(25) DEFAULT NULL COMMENT 'app名称',
  `app_alias` varchar(25) CHARACTER SET utf8 DEFAULT NULL COMMENT 'App别名',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `app_entry` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT 'app入口，如 ‘Home/Index’',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of app
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `cateid` int(11) unsigned DEFAULT NULL COMMENT '分类ID',
  `tags` varchar(200) DEFAULT NULL COMMENT '标签ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态（0 隐藏、1显示）',
  `title` varchar(150) DEFAULT NULL COMMENT '文章标题',
  `author` int(11) DEFAULT NULL COMMENT '作者ID',
  `hots` int(11) unsigned DEFAULT '0' COMMENT '点击率',
  `com_num` int(11) unsigned DEFAULT '0' COMMENT '评论数',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `uptime` int(11) DEFAULT NULL COMMENT '更新时间',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', '9', '17,14,13', '1', 'debian 初始安装', '1', '834', '0', 'debian初始安装,debian安装设置,debian安装vim,debian安装代码提示,debian安装PHP环境,debian安装lnmp', '1463987952', '1371746494');
INSERT INTO `article` VALUES ('2', '1', '6', '18', '1', 'Js获取屏幕body宽高度', '1', '731', '0', 'Js获取屏幕高度，获取屏幕宽度。 ', '1401163229', '1371782692');
INSERT INTO `article` VALUES ('3', '1', '3', '16,19', '1', 'php空间的在线解压 ZIP', '1', '708', '0', 'php空间的在线解压 php空间的在线解压ZIP php空间解压ZIP 在线解压ZIP 在线解压zip 空间php解压 php空间解压', '1372669921', '1371871456');
INSERT INTO `article` VALUES ('4', '1', '6', '18', '1', 'Jquery随屏滚动特效', '1', '623', '0', 'Jquery随屏滚动特效 jquery滚动 jquery滚动特效 jquery特效', '1372756985', '1371872464');
INSERT INTO `article` VALUES ('6', '1', '3', '16,19', '1', 'php面试题 陷阱题', '1', '808', '0', 'php面试题 php陷阱题 php基础题 php常见面试题 php考题', '1372757248', '1371896734');
INSERT INTO `article` VALUES ('7', '1', '10', '16,19', '1', 'MySql常用语句', '1', '710', '0', 'MySql常用语句 有用的MySQL语句 MySql语句', '1373789463', '1371899755');
INSERT INTO `article` VALUES ('18', '1', '4', '16,21', '0', 'python mysql基础 学习', '1', '237', '0', 'python mysql连接,python mysql', '1374059025', '1373942637');
INSERT INTO `article` VALUES ('8', '1', '10', '16,19,20', '1', 'wamp虚拟主机配置', '1', '788', '0', 'wamp5,apache 虚拟主机配置 wamp5虚拟主机配置 apache虚拟主机配置', '1373451770', '1371961592');
INSERT INTO `article` VALUES ('9', '1', '9', '13,17', '1', 'Liunx配置IP和DNS', '1', '477', '0', 'Liunx配置IP和DNS debian配置ip debian配置dns liunx配置ip和dns', '1372757673', '1371987080');
INSERT INTO `article` VALUES ('10', '0', '9', null, '1', 'Linux配置`.bashrc`,  `vim`， Linux配置命令缩写', '1', '616', '0', 'Linux配置`.bashrc`,  `vim`  Linux配置命令缩写', '1468835805', '1371907485');
INSERT INTO `article` VALUES ('11', '1', '9', '13,15', '1', 'Linux安装git', '1', '658', '0', 'Linux安装git git linux配置安装 liunx git', '1373452568', '1371988171');
INSERT INTO `article` VALUES ('12', '1', '10', '16,19', '1', 'mysql分组group ', '1', '814', '0', 'mysql分组group mysql gorup mysql分组统计 mysql分组显示', '1372757732', '1372063686');
INSERT INTO `article` VALUES ('13', '1', '6', '18', '1', '  jQuery 获取高度宽度', '1', '409', '0', '  jQuery 获取屏幕高度、宽度,jquery 高度，jquery宽度', '1372757748', '1372415916');
INSERT INTO `article` VALUES ('15', '1', '9', '13,14', '1', 'vim基本命令,vim常用命令', '1', '664', '0', 'vim基本命令,vim常用命令', '1380112061', '1372865638');
INSERT INTO `article` VALUES ('14', '1', '4', '', '0', 'python各种类型转换-int,str,char,float,ord,hex,oct等', '1', '6', '0', 'python各种类型转换-int,str,char,float,ord,hex,oct等 ', '1372762175', '1372761865');
INSERT INTO `article` VALUES ('17', '1', '4', '21', '1', 'python 基础学习笔记1', '1', '522', '0', 'python 基础笔记 python基础 ', '1373440508', '1373437782');
INSERT INTO `article` VALUES ('19', '1', '4', '16,21', '1', 'python安装mysql', '1', '632', '0', 'python安装mysql', '1373957762', '1373956731');
INSERT INTO `article` VALUES ('20', '1', '3', '', '0', 'php 文件下载详解', '1', '11', '0', 'php 文件下载详解', '1375523177', '1375523177');
INSERT INTO `article` VALUES ('21', '1', '9', '13,14,17', '1', 'vim中tab转成空格', '1', '487', '0', 'vim中将tab自动转换成空格 ', '1377268337', '1377268337');
INSERT INTO `article` VALUES ('22', '1', '9', '13,17', '1', 'vps 安全登录的方法 ssh 登录', '1', '687', '0', 'vps 安全登录的方法 ssh  登录', '1377513177', '1377271802');
INSERT INTO `article` VALUES ('31', '1', '4', '22,21', '1', 'django 正则表达式－Python Django  学习笔记3', '1', '538', '0', '正则表达式用法，正则表达式详解，python中正则表达式。', '1401421189', '1382514720');
INSERT INTO `article` VALUES ('24', '1', '4', '21,22', '1', 'django 安装初始化-Python Django 学习笔记1', '1', '680', '0', 'django 初始化安装，python django学习笔记', '1395647313', '1377760757');
INSERT INTO `article` VALUES ('25', '1', '23', '14', '1', 'Sublime 快捷键', '1', '460', '0', 'Sublime 常用的快捷键。', '1378371170', '1378371104');
INSERT INTO `article` VALUES ('26', '1', '4', '13,17,19,21,22', '1', '反向代理', '1', '424', '0', 'Python使用反向代理，lnmp反向代理。', '1378779640', '1378779640');
INSERT INTO `article` VALUES ('27', '1', '10', '16', '1', 'mysql 数据库导入、导出', '1', '454', '0', 'mysql 数据库导入、导出', '1380795718', '1378909247');
INSERT INTO `article` VALUES ('28', '1', '4', '21,22', '0', 'django post csrf', '1', '180', '0', 'Python Django POST Forbidden (403)', '1380115380', '1380115040');
INSERT INTO `article` VALUES ('29', '1', '9', '13,17', '1', 'lftp 命令如何使用', '1', '492', '0', 'liunx lftp,debian lftp', '1380802115', '1380801134');
INSERT INTO `article` VALUES ('30', '1', '6', '18', '1', ' jQuery 如何为动态添加的元素绑定事件', '1', '466', '0', ' jQuery 如何为动态添加的元素绑定事件', '1381135077', '1381134321');
INSERT INTO `article` VALUES ('32', '1', '4', '22,21', '1', 'django url 详解 - Python Django  学习笔记4', '1', '820', '0', 'django的url配置、用法。', '1411890014', '1382521106');
INSERT INTO `article` VALUES ('33', '1', '4', '21,22', '1', 'django 新建工程和项目－Python Django 学习笔记2', '1', '451', '0', 'django如何新建工程和项目', '1384676829', '1382521966');
INSERT INTO `article` VALUES ('34', '1', '4', '21,22', '1', 'django 模板详解 － Python Django 学习笔记5', '1', '574', '0', 'django模型，django模型的新建。', '1384831398', '1384676770');
INSERT INTO `article` VALUES ('35', '1', '4', '16,21,22', '1', 'django模型详解之模型创建 － Python Django 学习笔记6', '1', '452', '0', '新建模型，模型语法', '1385279652', '1385174807');
INSERT INTO `article` VALUES ('36', '1', '4', '', '0', 'django模型详解之数据库操作 － Python Django 学习笔记7', '1', '16', '0', '', '1389189068', '1385279767');
INSERT INTO `article` VALUES ('37', '1', '4', '16,21,22', '1', 'django如何连接mysql,django如何安装mysql', '1', '424', '0', 'django如何安装mysql,django如何连接msyql.', '1389191862', '1389189913');
INSERT INTO `article` VALUES ('83', '0', '1', null, '1', '萝莉控教程', '1', '0', '0', '萝莉控教程', '1470795904', '1470795904');

-- ----------------------------
-- Table structure for article_attach
-- ----------------------------
DROP TABLE IF EXISTS `article_attach`;
CREATE TABLE `article_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artid` int(11) DEFAULT '0' COMMENT '文章ID',
  `type` tinyint(1) DEFAULT '1' COMMENT '文件类型（1.图片，2.文件）',
  `name` varchar(120) DEFAULT '' COMMENT '文件名称',
  `size` varchar(20) DEFAULT '' COMMENT '大小',
  `path` varchar(120) DEFAULT '' COMMENT '路径',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态（1.显示，0，隐藏）',
  `ctime` int(11) DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章附件表';

-- ----------------------------
-- Records of article_attach
-- ----------------------------

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(30) NOT NULL COMMENT '分类名',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0 隐藏、1显示）',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `sort` tinyint(3) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES ('1', '0', 'DIY制作', '1', '顶级分类', '0');
INSERT INTO `article_category` VALUES ('2', '0', '编程语言', '1', '编程语言主分类', '0');
INSERT INTO `article_category` VALUES ('3', '2', 'PHP', '1', 'php是一门很好学，很容易懂的语言，易学，想要精通得花的功夫。', '90');
INSERT INTO `article_category` VALUES ('4', '2', 'Python', '1', 'Python是一个很牛的语言，是应该好好学习的语言。', '99');
INSERT INTO `article_category` VALUES ('5', '2', 'Ruby', '1', 'Ruby分类，Ruby的相关文章。', '0');
INSERT INTO `article_category` VALUES ('6', '2', 'Jquery+Js', '1', 'js+jquery分类', '0');
INSERT INTO `article_category` VALUES ('7', '2', 'HTML', '1', 'HTML5语言的相关文章', '0');
INSERT INTO `article_category` VALUES ('8', '2', 'CSS', '1', '', '0');
INSERT INTO `article_category` VALUES ('9', '2', 'Linux', '1', 'Linux系统太牛了，又安全，又稳定，又易移植、家族又强大，一个字牛。', '50');
INSERT INTO `article_category` VALUES ('10', '2', 'Apache+MySQL', '1', 'Apache+Mysql是一个绝配啊！', '70');
INSERT INTO `article_category` VALUES ('23', '2', 'Other', '1', '', '0');
INSERT INTO `article_category` VALUES ('24', '2', 'MongoDB', '1', '', '0');

-- ----------------------------
-- Table structure for article_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artid` int(11) unsigned NOT NULL COMMENT '文章ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` text NOT NULL COMMENT '内容',
  `uname` varchar(15) DEFAULT NULL COMMENT '用户名',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0 隐藏、1显示）',
  `email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `homepage` varchar(80) DEFAULT NULL COMMENT '个人主页',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论、留言本';

-- ----------------------------
-- Records of article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for article_content
-- ----------------------------
DROP TABLE IF EXISTS `article_content`;
CREATE TABLE `article_content` (
  `artid` int(11) unsigned NOT NULL COMMENT '文章ID',
  `description` text NOT NULL COMMENT '描述',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`artid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章内容';

-- ----------------------------
-- Records of article_content
-- ----------------------------
INSERT INTO `article_content` VALUES ('1', 'debian初始安装,debian安装设置,debian安装vim,debian安装代码提示,debian安装PHP环境,debian安装lnmp,debian安装ctags', '<p>\r\n	1.下载debian&nbsp;网址:<a href=\"http://www.debian.org/distrib/\">http://www.debian.org/distrib/</a>&nbsp;\r\n</p>\r\n<p>\r\n	2.选择CD就可以了 32位 和 64 位随便选\r\n</p>\r\n<p>\r\n	3.安装debian 最好断网安装 网速快可以连网安装\r\n</p>\r\n<p>\r\n	3.安装好后修改源并更新\r\n</p>\r\n<p>\r\n	4.源\r\n</p>\r\n<p>\r\n	在更新源的时候，要注意查看自己的系统版本源名：\r\n</p>\r\n<pre class=\"brush:bash\">lsb_release -a</pre>\r\ncodename就是源名\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;操作如下：\r\n</p>\r\n<pre class=\"brush:bash\">cd /etc/apt/\r\n</pre>\r\n源名：jessie，适合Debian8.x版本\r\n<pre class=\"brush:bash\">wget -c http://mirrors.163.com/.help/sources.list.jessie\r\n</pre>\r\n源名：wheezy，适合Debian7.x版本\r\n<pre class=\"brush:bash\">wget -c http://mirrors.163.com/.help/sources.list.wheezy\r\n</pre>\r\n源名：squeeze，适合Debian6.x版本\r\n<pre class=\"brush:bash\">wget -c http://mirrors.163.com/.help/sources.list.squeeze\r\n</pre>\r\n<pre class=\"brush:bash\">cp sources.list sources.list.bak\r\nmv sources.list.squeeze sources.list\r\n</pre>\r\n<p>\r\n	然后开始更新源：\r\n</p>\r\n<pre class=\"brush:bash\">apt-get update\r\napt-get upgrade</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	5.安装`vim`, `ctags`, `postgresql`, `lnmp`, `setuptools`, `sqlite3`\r\n</p>\r\n<pre class=\"brush:bash\">apt-get install vim ctags sqlite3 libsqlite3-dev python-dev git  ruby rubygems postgresql </pre>\r\n<pre class=\"brush:bash\"># 要在安装 lnmp 之前安装 libmysqld-dev，否则安装 libmysqld-dev 就会破坏 lnmp 所安装的 mysql\r\napt-get install libmysqld-dev\r\n</pre>\r\n<pre class=\"brush:bash\">mkdir down\r\ncd down\r\nwget http://peak.telecommunity.com/dist/ez_setup.py\r\npython ez_setup.py\r\neasy_install mysql-python\r\n</pre>\r\n<pre class=\"brush:bash\">wget -c http://soft.vpser.net/lnmp/lnmp1.0-full.tar.gz &amp;&amp; tar zxvf lnmp1.0-full.tar.gz \r\ncd lnmp1.0-full \r\n./debian.sh\r\n</pre>\r\n<pre class=\"brush:bash\"># 修改 debian.sh 让安装后的 php-fpm 支持 postgresql，添加 `--with-pgsql=/var/lib/postgresql/8.4/main` 到374行的行尾\r\nvi debian.sh\r\n</pre>\r\n<pre class=\"brush:bash\"># 替换 vhost.sh 中所有的 wwwroot 为 www。让新建的站点默认的根目录在 /home/www 下\r\nvi vhost.sh\r\n</pre>\r\n<pre class=\"brush:bash\">./debian.sh\r\n\r\n./eaccelerator.sh\r\n./ionCube.sh\r\n./imageMagick.sh\r\n</pre>\r\n<pre class=\"brush:bash\"># 解决 memcached 找不到目录的问题\r\nmkdir -p /var/lock/subsys\r\n./memcached.sh</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n安装vim,命命别名等、请阅读 <a href=\"http://www.phpyrb.com/Article-index-artid-10.html\">Linux配置`.bashrc`, `vim`， Linux配置命令缩写</a>');
INSERT INTO `article_content` VALUES ('2', 'Js获取屏幕高度，获取屏幕宽度，body的高度，body的宽度，和各种不同的宽度。', '<h2 align=\"center\">\r\n	Js获取屏幕body宽高度\r\n</h2>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<p>\r\n		<span style=\"font-size:15px;\"><br />\r\n<span style=\"font-size:12px;\">window.screen.height;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //屏幕分辨率的高</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">window.screen.width;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //屏幕分辨率的宽</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">window.screen.availHeight;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //屏幕可用工作区的高</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">window.screen.availWidth;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //屏幕可用工作区的宽</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.clientWidth;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页可见区域宽(body</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.scrollTop;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页被卷去的Top(滚动条</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.scrollLeft;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页被卷去的Left(滚动条</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">window.screenTop;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //浏览器距离Top</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">window.screenLeft;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //浏览器距离Left</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.clientHeight;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页可见区域高(body</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.offsetWidth;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页可见区域宽(body，包括border、margin等</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.offsetHeight;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页可见区域宽(body，包括border、margin等</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.scrollWidth;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页正文全文宽，包括有滚动条时的未见区域</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">document.body.scrollHeight;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //网页正文全文高，包括有滚动条时的未见区域</span></span>\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:15px;\"><span style=\"line-height:1.5;\"></span></span>\r\n	</p>\r\n</p>');
INSERT INTO `article_content` VALUES ('3', 'php空间的在线解压 php空间的在线解压ZIP php空间解压ZIP 在线解压ZIP 在线解压zip 空间php解压 php空间解压 在线解压PHP空间 PHP空间在线解压方法', '<h2 align=\"center\">\r\n	php空间的在线解压 ZIP\r\n</h2>\r\n<p align=\"center\">\r\n	<br />\r\n</p>\r\n<h4 align=\"left\">\r\n	<span style=\"font-size:14px;\">把打包好的程序上传到空间后，在空间里面在线解压。步骤如下：（注：打包为ZIP）</span> \r\n</h4>\r\n<h4 align=\"left\">\r\n	&nbsp;\r\n</h4>\r\n<h4>\r\n	<span style=\"font-size:14px;\">可以通过php程序调用exec指令进行在线解压: 本地新建文档，内容如下：</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.&nbsp;&nbsp;&nbsp; </span><span style=\"font-size:14px;\"><!--?php exec(\"unzip abc.zip\"); ?--></span><br />\r\n<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.&nbsp; 然后保存为php格式的文件放在需要解压文件的同文件夹下运行(其中abc.zip替换成您的zip包文件名即可)；</span> \r\n</h4>\r\n<h4>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">请注意: 系统Linux默认UTF-8编码, Windows为GBK或等编码, 压缩包内部的文件夹或文件名不要使用中文,以免引起乱码</span> \r\n</h4>');
INSERT INTO `article_content` VALUES ('4', 'Jquery随屏滚动特效 jquery滚动 jquery滚动特效 jquery特效 ', '<h2 align=\"center\">\r\n	Jquery随屏滚动特效\r\n</h2>\r\n<p>\r\n	代码如下\r\n:\r\n</p>\r\n<pre class=\"brush:jscript\">$(function () {\r\n		var $offtop = $(\'.fdkf\').offset().top;\r\n		$(window).scroll(function () {\r\n			var $scrotop = $(window).scrollTop();\r\n			if($scrotop &gt; $offtop){\r\n				$(\'.fdkf\').stop(false,true).animate({\'top\':$offtop+$scrotop+\'px\'},300);\r\n			}\r\n			if($scrotop &lt; \'10\'){\r\n				$(\'.fdkf\').stop(false,true).animate({\'top\':$offtop+\'px\'},300);\r\n			}\r\n		});\r\n});</pre>');
INSERT INTO `article_content` VALUES ('6', 'php面试题 php陷阱题 php基础题 php常见面试题 php考题', '<h2 align=\"center\">\r\n	php面试题 陷阱题\r\n</h2>\r\n<p>\r\n	个人收集题目：<br />\r\n题1：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"brush:php\">$a=3;\r\n$b=6;\r\n$c=1;\r\nif($a=0||$b=7 &amp;&amp; $c=10){\r\n    $a++;   \r\n    $b++;\r\n}\r\nvar_dump($a, $b,$c);</pre>\r\n1.把$a = 0 看成 $a == 0;<br />\r\n2.认为$a=0赋值成功$b=7没执行<br />\r\n4.认为$a的值为0，或者为false<br />\r\n3.认为$b=7赋值成功为7\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	正确答案应该为 <br />\r\n$a = true $b = true $c = 10\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	题2：\r\n</p>\r\n<pre class=\"brush:php\">if(\'0\' == \'all\'){\r\n	echo 123;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}else{\r\n	echo 321;\r\n}</pre>\r\n<p>\r\n	1。错把字符转回int比较\r\n</p>\r\n<p>\r\n	答案：123；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('7', '计算年数MySql语句 两个时间的差的MySql语句 显示某一列出现过N次的值的MySql语句 查找表中的主键MySql语句 查看你的数库有多大MySql语句', '<h2 align=\"center\">\r\n	MySql常用语句\r\n</h2>\r\n<p>\r\n	1. 计算年数通过生日计算出有几岁。\r\n</p>\r\n<pre class=\"brush:sql\">SELECT DATE_FORMAT(FROM_DAYS(TO_DAYS(now()) - TO_DAYS(@dateofbirth)), \'%Y\') + 0;\r\n&nbsp;</pre>\r\n<p>\r\n	2.显示某一列出现过N次的值\r\n</p>\r\n<pre class=\"brush:sql\">SELECT id FROM tbl GROUP BY id HAVING COUNT(*) = N;</pre>\r\n<p>\r\n	3.查找表中的主键\r\n</p>\r\n<pre class=\"brush:sql\">SELECT COUNT(*) FROM calendar WHERE d BETWEEN Start AND Stop AND DAYOFWEEK(d) NOT IN(1,7) AND holiday=0</pre>\r\n<p>\r\n	4.查看你的数库有多大\r\n</p>\r\n<pre class=\"brush:sql\">SELECT k.column_name FROM information_schema.table_constraints t JOIN information_schema.key_column_usage k USING (constraint_name,table_schema,table_name) \r\nWHERE t.constraint_type=\'PRIMARY KEY\' AND t.table_schema=\'db\' AND t.table_name=tbl\'</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span id=\"__kindeditor_bookmark_start_2__\"></span> \r\n</p>');
INSERT INTO `article_content` VALUES ('18', 'python如何连接mysql,mysqld', '<p>\r\n	python mysql连接:\r\n</p>\r\n<p>\r\n	1.在python里面连接mysql，首先要安装MySqldb,详细的方法请看我的另一篇文章，<a href=\"http://phpyrb.com/Article/index/artid/18.html\" target=\"_blank\">python安装mysql</a>.\r\n</p>\r\n<p>\r\n	2.\r\n</p>');
INSERT INTO `article_content` VALUES ('8', 'wamp5虚拟主机配置 wamp虚拟主机配置 apache虚拟主机配置 虚拟主机配置', '<h2 align=\"center\">\r\n	wamp5虚拟主机配置\r\n</h2>\r\n<p align=\"center\">\r\n	<br />\r\n</p>\r\n<p>\r\n	1&nbsp; 编辑httpd.conf，查找Include conf/extra/httpd-vhosts.conf，把前面注释符号“#”删掉。<br />\r\n2&nbsp; 编辑httpd-vhosts.conf，我把WAMPServer安装在D:/wamp，所以我这里的路径是D:\\wamp\\Apache2\\conf\\extra。\r\n</p>\r\n<p>\r\n	3&nbsp; 把里面的内容清空掉，换成下面的内容：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n<pre class=\"brush:bash\">NameVirtualHost *:80\r\n<virtualhost *:80=\"\">\r\nServerName www.host1.com\r\nServerAlias www.host1.com\r\nDocumentRoot \"D:/wamp/www/host1\"<virtualhost *:80=\"\">\r\nServerName www.host2.com\r\nServerAlias www.host2.com\r\nDocumentRoot \"D:/wamp/www/host2\"</pre>\r\n<pre class=\"brush:bash\">&nbsp;</pre>\r\n	<p>\r\n		4&nbsp; 修改C:/WINDOWS/system3/drivers/etc/host这个文件，用记事本打开，加上如下内容:\r\n	</p>\r\n<pre class=\"brush:bash\">127.0.0.1  www.host1.com\r\n127.0.0.1  www.host2.com</pre>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n<span id=\"__kindeditor_bookmark_start_30__\"></span> \r\n	<p align=\"left\">\r\n		&nbsp;好了，然后重启apache，在浏览器里面输入www.host1.com，看看访问到的内容是不是host1这个目录呢\r\n	</p>');
INSERT INTO `article_content` VALUES ('9', 'Liunx配置IP和DNS debian配置ip debian配置dns liunx配置ip和dns', '<h2 align=\"center\">\r\n	配置 IP 和 DNS\r\n</h2>\r\n配置IP和NDS，把 /etc/network/interfaces 修改成\r\n<pre class=\"brush:bash\"># This file describes the network interfaces available on your system\r\n# and how to activate them. For more information, see interfaces(5).\r\n\r\n# The loopback network interface\r\nauto lo\r\niface lo inet loopback\r\n\r\n# The primary network interface\r\nallow-hotplug eth0\r\niface eth0 inet static\r\n\r\naddress 192.168.1.23\r\nnetmask 255.255.255.0\r\nnetwork 192.168.1.0\r\nbroadcast 192.168.1.255\r\ngateway 192.168.1.1\r\n# dns-* options are implemented by the resolvconf package, if installed\r\ndns-nameservers 192.168.1.1</pre>\r\nDNS，把 /etc/resolv.conf 修改成\r\n<pre class=\"brush:bash\">nameserver 192.168.1.1</pre>\r\n<p>\r\n	之后运行 reboot 重启电脑\r\n</p>\r\n<p align=\"left\">\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('10', 'Linux配置`.bashrc`,  `vim` Linux配置命令缩写 Linux配置git Linux配置vim vim配置', '<h2 align=\"center\">\r\n	Linux配置`.bashrc`,&nbsp; `vim`</h2><p>\r\n	linux 命令缩写，简写配置命令如下：</p><p>\r\n	配置&nbsp;`.bashrc`，修改成</p><p>\r\n	首先执行命令 cd</p><p>\r\n	然后输入 vi .bashrc 执行 然后把下面的的代码替换里面的找码，（复制需要升级VI 请看我的另一篇<a href=\"http://phpyrb.com/Article-content-artid-1.html\" target=\"_blank\"> debian 初始安装</a>）</p><pre class=\"brush:bash\">#&nbsp;You&nbsp;may&nbsp;uncomment&nbsp;the&nbsp;following&nbsp;lines&nbsp;if&nbsp;you&nbsp;want&nbsp;`ls&#39;&nbsp;to&nbsp;be&nbsp;colorized:\r\n#&nbsp;export&nbsp;LS_OPTIONS=&#39;--color=auto&#39;\r\n#&nbsp;eval&nbsp;&quot;`dircolors`&quot;\r\nalias&nbsp;ls=&#39;ls&nbsp;-Ah&nbsp;--color=auto&#39;\r\nalias&nbsp;grep=&#39;grep&nbsp;--color=auto&#39;\r\nalias&nbsp;fgrep=&#39;fgrep&nbsp;--color=auto&#39;\r\nalias&nbsp;egrep=&#39;egrep&nbsp;--color=auto&#39;\r\n\r\nalias&nbsp;la=&#39;ls&nbsp;-AF&#39;\r\nalias&nbsp;ll=&#39;ls&nbsp;-lF&#39;\r\nalias&nbsp;l=&#39;ls&nbsp;-CF&#39;\r\n\r\n#&nbsp;Some&nbsp;more&nbsp;alias&nbsp;to&nbsp;avoid&nbsp;making&nbsp;mistakes:\r\nalias&nbsp;rm=&#39;rm&nbsp;-i&#39;\r\nalias&nbsp;cp=&#39;cp&nbsp;-i&#39;\r\nalias&nbsp;mv=&#39;mv&nbsp;-i&#39;</pre><p>配置 `vim`</p><p>\r\n	clone github 已经配置好的。 已配置的相关插件：</p><ul><li>\r\n		blog	</li><li>\r\n		calendar	</li><li>\r\n		neocomplcache	</li><li>\r\n		NERD_commenter	</li><li>\r\n		NERD_tree	</li><li>\r\n		taglist	</li><li>\r\n		txtbrowser	</li><li>\r\n		vimwiki	</li><li>\r\n		voom	</li><li>\r\n		zencoding	</li></ul><p>\r\n	下载配置</p><pre class=\"brush:bash\">cd\r\nhttps://github.com/mwei0321/.vim.git\r\n\r\nln&nbsp;-s&nbsp;.vim/vimrc&nbsp;./.vimrc</pre><p>配置联动提示</p><pre class=\"brush:bash\">ctags&nbsp;-R&nbsp;--languages=php&nbsp;.</pre>');
INSERT INTO `article_content` VALUES ('11', 'Linux配置安装git git linux配置 liunx git配置安装 git如何安装配置 linux中git如何安装配置 git在linux中如何安装配置 ', '<h2 align=\"center\">\r\n	Linux配置git\r\n</h2>\r\n<p>\r\n	配置 git 的基本信息和命令缩写\r\n</p>\r\n<pre class=\"brush:bash\">cd\r\nvi .gitconfig</pre>\r\n<p>\r\n	写入\r\n</p>\r\n<pre class=\"brush:bash\">[user]\r\n    name = mawei\r\n    email = 491518132@qq.com\r\n[core]\r\n    excludesfile = /root/.gitignore_global\r\n    editor = vim\r\n[alias]\r\n    co = checkout\r\n    ci = commit\r\n    st = status\r\n    ca = commit -a\r\n    b = branch\r\n    lg = log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset - %C(yellow)%cn%Creset\' --abbrev-commit --date=relative\r\n[diff]\r\n    tool = vimdiff\r\n[difftool]\r\n    prompt = No</pre>\r\n配置 git 忽略文件规则\r\n<pre class=\"brush:bash\">cd\r\nvi .gitignore_global</pre>\r\n写入\r\n<pre class=\"brush:bash\">#compiled source #\r\n###################\r\n*.com\r\n*.class\r\n*.dll\r\n*.exe\r\n*.o\r\n*.so\r\n*.pyc\r\n\r\n# Packages #\r\n############\r\n# it\'s better to unpack these files and commit the raw source\r\n# git has its own built in compression methods\r\n*.7z\r\n*.dmg\r\n*.gz\r\n*.iso\r\n*.jar\r\n*.rar\r\n*.tar\r\n*.zip\r\n\r\n# Logs and databases #\r\n######################\r\n*.log\r\n*.sqlite\r\n\r\n# OS generated files #\r\n######################\r\n.DS_Store*\r\nehthumbs.db\r\n._*\r\n.Spotlight-V100\r\n.Trashes\r\nIcon?\r\nThumbs.db\r\n.svn\r\n*.bak\r\nehthumbs.db\r\nRuntime\r\n*.swp\r\ntags\r\n*~</pre>');
INSERT INTO `article_content` VALUES ('12', 'mysql分组group mysql gorup mysql分组统计 mysql分组显示 mysql分组并显示id mysql分组统计', '<p align=\"center\">\r\n	mysql分组group\r\n</p>\r\n<p align=\"left\">\r\n	mysql分组并显示id\r\n</p>\r\n<pre class=\"brush:sql\">SELECT *,group_concat(id) as ids FROM tablename WHERE condition GROUP BY field</pre>\r\n<p align=\"left\">\r\n	mysql分组统计\r\n</p>\r\n<pre class=\"brush:sql\">SELECT *,COUNT(id) as count FROM tablename WHERE condition GROUP BY field</pre>\r\n<p align=\"left\">\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('13', '浏览器当前窗口可视区域高度 浏览器当前窗口文档body的总高度 包括border padding margin 浏览器当前窗口文档对象宽度alert($(document.body).width());//浏览器当前窗口文档body的高度', '<h3 style=\"text-align:center;\">\r\n	&nbsp; jQuery 获取屏幕高度、宽度\r\n</h3>\r\n<blockquote>\r\n	<br />\r\nalert($(window).height());//浏览器当前窗口可视区域高度<br />\r\nalert($(document).height());//浏览器当前窗口文档的高度<br />\r\nalert($(document.body).height());//浏览器当前窗口文档body的高度<br />\r\nalert($(document.body).outerHeight(true));//浏览器当前窗口文档body的总高度 包括border padding margin<br />\r\nalert($(window).width());//浏览器当前窗口可视区域宽度<br />\r\nalert($(document).width());//浏览器当前窗口文档对象宽度alert($(document.body).width());//浏览器当前窗口文档body的高度<br />\r\nalert($(document.body).outerWidth(true));//浏览器当前窗口文档body的总宽度 包括border padding margin<br />\r\n&nbsp;// 获取页面的高度、宽度<br />\r\n<pre class=\"brush:jscript\">functiongetPageSize() {\r\n			varxScroll, yScroll;\r\n			if(window.innerHeight &amp;&amp; window.scrollMaxY) {\r\n				xScroll = window.innerWidth + window.scrollMaxX;\r\n				yScroll = window.innerHeight + window.scrollMaxY;\r\n			}else{\r\n				if(document.body.scrollHeight &gt; document.body.offsetHeight) {// all but Explorer Mac\r\n					xScroll = document.body.scrollWidth;\r\n					yScroll = document.body.scrollHeight;\r\n				}else{// Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari\r\n					xScroll = document.body.offsetWidth;\r\n					yScroll = document.body.offsetHeight;\r\n				}\r\n			}\r\n			varwindowWidth, windowHeight;\r\n			if(self.innerHeight) {// all except Explorer\r\n				if(document.documentElement.clientWidth) {\r\n					windowWidth = document.documentElement.clientWidth;\r\n				}else{\r\n					windowWidth = self.innerWidth;\r\n				}\r\n				windowHeight = self.innerHeight;\r\n			}else{\r\n				if(document.documentElement &amp;&amp; document.documentElement.clientHeight) {// Explorer 6 Strict Mode\r\n					windowWidth = document.documentElement.clientWidth;\r\n					windowHeight = document.documentElement.clientHeight;\r\n				}else{\r\n					if(document.body) {// other Explorers\r\n						windowWidth = document.body.clientWidth;\r\n						windowHeight = document.body.clientHeight;\r\n					}\r\n				}\r\n			}\r\n			// for small pages with total height less then height of the viewport\r\n			if(yScroll &lt; windowHeight) {\r\n				pageHeight = windowHeight;\r\n			}else{\r\n				pageHeight = yScroll;\r\n			}\r\n			// for small pages with total width less then width of the viewport\r\n			if(xScroll &lt; windowWidth) {\r\n				pageWidth = xScroll;\r\n			}else{\r\n				pageWidth = windowWidth;\r\n			}\r\n			arrayPageSize =newArray(pageWidth, pageHeight, windowWidth, windowHeight);\r\n			returnarrayPageSize;\r\n		}</pre>\r\n&nbsp;// 滚动条\r\n<pre class=\"brush:jscript\">document.body.scrollTop;\r\n$(document).scrollTop();\r\n</pre>\r\n<br />\r\n&nbsp;\r\n</blockquote>');
INSERT INTO `article_content` VALUES ('15', 'vim基本命令,linux下vim常用命令，vim常用命令', '<p>\r\n	vim是linux中很强大的文件编辑器，也是最基本的编辑器，他是用命令执行操作，如果不会命令，就没办法操作此编辑器\r\n</p>\r\n<p>\r\n	vim有两种基本模式 普通模式 和 插入模式\r\n</p>\r\n<p>\r\n	进入普通模式按 Esc ,进入插入模式按 i\r\n</p>\r\n<p>\r\n	vim基本命令如下：\r\n</p>\r\n<p>\r\n	vim file.txt 新建文件;\r\n</p>\r\n<p>\r\n	h(左) l(右) k(上) j(下) 移动光标，方向键也可以移动;\r\n</p>\r\n<p>\r\n	x 删除当前光标上的字符，\r\n</p>\r\n<p>\r\n	5x 在普通模式下删除当前光标为起点位置之后的5个字符\r\n</p>\r\n<p>\r\n	dd 在普通模式下删除一行\r\n</p>\r\n<p>\r\n	J 在普通模式下按大写J把当前光标和光标下一行合成一行\r\n</p>\r\n<p>\r\n	u 在普通模式下按u撤消操作\r\n</p>\r\n<p>\r\n	ctrl-r 返回之前的操作\r\n</p>\r\n<p>\r\n	a 在普通模式下输入a，表示把光标移动到下个位置并变成插入模式\r\n</p>\r\n<p>\r\n	o&nbsp;在普通模式下输入o，表示把光标移动到下行并变成插入模式\r\n</p>\r\n<p>\r\n	,+cc 注释\r\n</p>\r\n<p>\r\n	,+cu 删除注释\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	正则查找\r\n</p>\r\n<pre class=\"brush:bash\">：%s/aaa/bbb/</pre>\r\n<p>\r\n	%表示全文，s表示搜索替换，aaa表示查找的字符，bbb替换的字符\r\n</p>\r\n<p>\r\n	缩进\r\n</p>\r\n<pre class=\"brush:bash\">gg 表示跳到最前\r\n= 缩进\r\nG 跳到最后</pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('14', 'python各种类型转换-int,str,char,float,ord,hex,oct等 ', '<pre class=\"brush:python\">int(x [,base ])         将x转换为一个整数  \r\nlong(x [,base ])        将x转换为一个长整数  \r\nfloat(x )               将x转换到一个浮点数  \r\ncomplex(real [,imag ])  创建一个复数  \r\nstr(x )                 将对象 x 转换为字符串  \r\nrepr(x )                将对象 x 转换为表达式字符串  \r\neval(str )              用来计算在字符串中的有效Python表达式,并返回一个对象  \r\ntuple(s )               将序列 s 转换为一个元组  \r\nlist(s )                将序列 s 转换为一个列表  \r\nchr(x )                 将一个整数转换为一个字符  \r\nunichr(x )              将一个整数转换为Unicode字符  \r\nord(x )                 将一个字符转换为它的整数值  \r\nhex(x )                 将一个整数转换为一个十六进制字符串  \r\noct(x )                 将一个整数转换为一个八进制字符串  </pre>');
INSERT INTO `article_content` VALUES ('17', 'python的基础运算符，注释，逻辑运算符，运算优先级，字符串，列表，元组等', '<p>\r\n	1.python基础运算符：加(+)、减(-) 、乘(*)、除(/) 、除(//)、赋值(=) 、取余(%)、 乘方(**);说明是传统的除法，而是浮点除法，会对结果进行四舍五入。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2.python比较运算符：小于(&lt;) 、小于等于(&lt;=) 、大于(&gt;) 、大于等于(&gt;=)、 等于(==)&nbsp;、不等于(&nbsp;!=)、不等于(&lt;&gt;) ,python目前支持两种“不等于”，不过python日后会被淘汰，所以尽量使用 (!=)。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	3.Python 逻辑运算符:与(and)、 或(or)、 非(not);\r\n</p>\r\n<p>\r\n	4.python支持赋值有:整数、浮点数、字符、字符串、表达式等。\r\n</p>\r\n<p>\r\n	5.python不支持自增(++1)、自减(--1)，但支持 n *=5,n +=5等这样的运算式。\r\n</p>\r\n<p>\r\n	6.python的变量是区分大小写.\r\n</p>\r\n<p>\r\n	7.Python字符串是指引号之间的字符集合，包括单引号或双引号或三引号，可以用索引运算符( [ ] )和切片运算符( [ : ] )得到子字符串，第一个字符的索引是 0，最后一个字符的索引是－1.\r\n</p>\r\n<p>\r\n	8.Python字符连接可以用加号( + )，例：n=‘aa’+\'bb\';n=aabb。还可以用乘号(*),表示把字符串重复多少次，例：n=2*\'aa\';n=aaaa.\r\n</p>\r\n<p>\r\n	9.可以将列表和元组当成普通的“数组”，它能保存任意数量任意类型的Python 对象。和数组一样，通过从0 开始的数字索引访问元素，但是列表和元组可以存储不同类型的对象。列表和元组有几处重要的区别。列表元素用中括号( [ ])包裹，元素的个数及元素的值可以改变。元组元素用小括号(( ))包裹，不可以更改（尽管他们的内容可以）。元组可以看成是只读的列表。通过切片运算( [ ] 和 [ : ] )可以得到子集，这一点与字符串的使用方法一样。\r\n</p>');
INSERT INTO `article_content` VALUES ('19', '在python中如何安装mysql,mysql在python中如何安装,python安装mysql.', '<h4>\r\n	python安装mysql\r\n</h4>\r\n<p>\r\n	1.在python安装msyql之前，首先需要安装python的安装支持包，详细安装请看我的另一篇博客文章<a href=\"http://phpyrb.com/Article/index/artid/1.html\" target=\"_blank\">《debian的初始安装》</a> \r\n</p>\r\n<p>\r\n	2.安装好python的安装支持包后就可以安装mysql数据库支持了，详细安装方法如下：\r\n</p>\r\n<pre class=\"brush:bash\">cd\r\neasy_install mysql-python</pre>\r\n<p>\r\n	等待安装完成，安装时间视你的网速而定，而此安装环境为linux下。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('20', '', 'header(\"Content-type:text/html;charset=utf-8\")的作用：在服务器响应浏览器的请求时，告诉浏览器以编码格式为UTF-8的编码显示该内容 <br />\r\n关于file_exists()函数不支持中文路径的问题:因为php函数比较早，不支持中文，所以如果被下载的文件名是中文的话，需要对其进行字符编码转换，否则file_exists()函数不能识别，可以使用iconv()函数进行编码转换 <br />\r\n$file_sub_path() 我使用的是绝对路径，执行效率要比相对路径高 <br />\r\nHeader(\"Content-type: application/octet-stream\")的作用：通过这句代码客户端浏览器就能知道服务端返回的文件形式 <br />\r\nHeader(\"Accept-Ranges: bytes\")的作用：告诉客户端浏览器返回的文件大小是按照字节进行计算的 <br />\r\nHeader(\"Accept-Length:\".$file_size)的作用：告诉浏览器返回的文件大小 <br />\r\nHeader(\"Content-Disposition: attachment; filename=\".$file_name)的作用:告诉浏览器返回的文件的名称 <br />\r\n以上四个Header()是必需的 <br />\r\nfclose($fp)可以把缓冲区内最后剩余的数据输出到磁盘文件中，并释放文件指针和有关的缓冲区 <br />\r\n详细出处参考：<a href=\"http://www.jb51.net/article/30563.htm\">http://www.jb51.net/article/30563.htm</a>');
INSERT INTO `article_content` VALUES ('21', 'vim中如何将tab转换成空格.', '<p>\r\n	在vim中，很多时候需要将tab转换成空格(space)。可以使用ret命令（replace tab）。<br />\r\n[range]ret[ab]!&nbsp; [new-tabstop]<br />\r\n<br />\r\n例子：\r\n</p>\r\n<p>\r\n	将整篇文章由第一行到最后一行的 tab 转换成 space ，如果tab用4个空格(space)替换。\r\n</p>\r\n<p>\r\n	先把vim转成命令模式\r\n<pre class=\"brush:bash\">\r\n:set  expandtab\r\n:%ret! 4</pre>\r\n<br />\r\n假如没有写4的话，则表示用当前的tab宽度设定替换为空格（space）。<br />\r\n<br />\r\n其它相关命令如下：<br />\r\n:set&nbsp; tabstop=4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 设定tab宽度为4个字符<br />\r\n:set shiftwidth=4&nbsp;&nbsp;&nbsp;&nbsp; 设定自动缩进为4个字符<br />\r\n:set&nbsp; expandtab&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用space替代tab的输入<br />\r\n:set noexpandtab&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 不用space替代tab的输入\r\n</p>');
INSERT INTO `article_content` VALUES ('22', '如何让你的VPS的安全登录的方法，可以用ssh登录，拒绝登录攻击的方法。', '<p>\r\n	详细方法如下：\r\n</p>\r\n<p>\r\n	第一步：禁止让你的root用户可以直接用ssh、sshd、ftp登录.\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;但登录VPS总要有个用户名，你可以新建一个用户，普通用户就可以了，然后 su 命令临时提升成 root 用户的权限.\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;su 命令解释：把当前用户临时转成指定用户的命令。以用户 mw 为例：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;1.su root 临时切换到root用户，需要输入密码，切换后环境变量不变，取得root的部分权限，且只能使用trunk用户path路径中的命令，不能使用root用户path路径中的独有命令。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;2.su - root 切换为root用户，需要输入密码，切换后环境变量改变，几乎可以不受限制的做任何事。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;3。su -&nbsp;mw 从root切换回普通用户，无需输入密码，切换后只拥有 mw 权限。\r\n</p>\r\n<p>\r\n	第二步：可以通过修改 /etc/ssh/sshd_config 来禁止 root 直接登录控制你的VPS。用vim打开，找到\r\n</p>\r\n<p>\r\n	&nbsp;PermitRootLogin yes&nbsp;\r\n</p>\r\n<p>\r\n	把 yes 改成&nbsp;no.\r\n</p>\r\n<p>\r\n	第三步：启用 SSH Key 登录，现在用ssh登录到 root 用户不允许，会提示你没有权限。但可以使用一对公有SSH的 key来登录(ssh public/private key),详细的配置步骤如下：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;a.在你的客户端运行如下的命令，来创建一对 key 用户登录验证\r\n</p>\r\n<pre class=\"brush:bash\">ssh-keygen -t rsa</pre>\r\n<p>\r\n	运行该命令，会产生两个文件(rsa 是一种加密算法)：(id_rsa) 和 (id_rsa.pub),前面一个为私有的key，后面的为公有key,在生成key的时候会提示你输入文件路径，直接回车。然后接着提示输入 passphrase，相当于密码一样的东西，如果不想登录的时候还要输入密码的话，最好回车，用来保护 private key不被滥用。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	第四步：在你的VPS上创建一个文件，在/root/.ssh/authorized_keys文件，把生成的公KEY(id_rsa.pub)的内容完整的复制到刚刚新建的文件。注意不要多添加任何东西，包括空格，空行。最好用命令。命令如下：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"brush:bash\">cat id_rsa.pub &gt;&gt; authorized_keys</pre>\r\n<p></p>\r\n<p>\r\n	第五步：设置权限，.ssh目录权限是&nbsp; ssh-keygen自己生成的不要乱改，一般设置成 700 ，\r\n</p>\r\n<p>\r\n	id_rsa 权限为 600 ,设置权限的命令(chmod 600 filename);\r\n</p>\r\n<p>\r\n	.ssh 路径设置，在/etc/ssh/sshd_config<br />\r\n里面会有默认放key的位置 是 <br />\r\nAuthorizedKeysFile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ssh/authorized_keys<br />\r\n如果不配就把key放那里就好。\r\n</p>');
INSERT INTO `article_content` VALUES ('31', 'django url 正则表达式的应用，正则表达式用法，正则表达式详解，python中正则表达式.', '<p align=\"center\">\r\n	django 正则表达式－Python 学习笔记3\r\n</p>\r\n<p align=\"left\">\r\n	1.正则是做字符匹配，就元字符匹配，正则表达式元字符列表如下：\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;. ^ $ * + ? { } [ ] \\ | ( )\r\n</p>\r\n<p align=\"left\">\r\n	下面就一一解释这些元字符，\r\n</p>\r\n<p align=\"left\">\r\n	.&nbsp; 点号表示匹配除换行符外的任意一个字符，匹配包括换行符以内的任意一个字符。\r\n</p>\r\n<p align=\"left\">\r\n	^ 上尖括号表示开头匹配。\r\n</p>\r\n<p align=\"left\">\r\n	$ 表示匹配一个字符串的结尾或者字符串最后面的换行符。\r\n</p>\r\n<p align=\"left\">\r\n	* 星号表示指定前一个字符被匹配零次或多次，而不是一次。\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp; 例： “p*p” //里面的星号可以匹配：‘pp’,\'ppp\',\'pppp\'。中间星号可以匹配0个1个2个或者更多个。\r\n</p>\r\n<p align=\"left\">\r\n	+ 加号表示指定前一个字符被匹配 1 次或多次，至少要匹配 1 次。\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;例： “ph*p” //里面的星号可以匹配：‘php’,\'phhp\',\'phhhp\'。中间星号可以匹配1个2个3个或者更多个,至少要匹配1个。\r\n</p>\r\n<p align=\"left\">\r\n	?&nbsp; 问号表示将前面的字符匹配 0 次或者 1 次。\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp; 例：“ph?p” //里面的问号可以匹配: ‘pp’,\'php\'。中间问号匹配 0 次 或 1 次。\r\n</p>\r\n<p align=\"left\">\r\n	{} 大特号表示匹配多少次，{m,n} m 和 n 都是数字，指定将前面的字符重复 m 到 n 次。\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp; 例：‘ph{1,2}p’ //表示 h 匹配 1 次到 2 次。\r\n</p>\r\n<p align=\"left\">\r\n	[] 中括号表示你要匹配字符集，字符集区间。\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp; 例：[a-d] //表示匹配 a,b,c,d 都可以匹配。\r\n</p>\r\n<p align=\"left\">\r\n	\\&nbsp; <span id=\"__kindeditor_bookmark_start_15__\"></span>反斜杆，转义特殊字符。\r\n</p>\r\n<p align=\"left\">\r\n	|&nbsp; 管道，表示匹配管道两边的任意一个字符。\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp; 例：A|B 表示匹配 A 或者 B。\r\n</p>\r\n<p align=\"left\">\r\n	() 匹配圆括号里的字符内容，并指定组的开始和结束位置。组里面的内容可以被提取，也可以采用\\数字这样的特殊序列取里面的字符。\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp; 例：“ph(py)rb” 可以用\\1取出 ‘py’。\r\n</p>\r\n<p align=\"left\">\r\n	\\d 匹配任何十进制数；它相当于类 [0-9]。<br />\r\n\\D 匹配任何非数字字符；它相当于类 [^0-9]。<br />\r\n\\s 匹配任何空白字符；它相当于类 [ \\t\\n\\r\\f\\v]。<br />\r\n\\S 匹配任何非空白字符；它相当于类 [^ \\t\\n\\r\\f\\v]。<br />\r\n\\w 匹配任何字母数字字符；它相当于类 [a-zA-Z0-9_]。<br />\r\n\\W 匹配任何非字母数字字符；它相当于类 [â-zA-Z0-9_]。\r\n</p>');
INSERT INTO `article_content` VALUES ('24', '本人最近开始学习python django ，为了方便自己复习，所以做一个自己的小小笔记。本笔记为本人个人学习所总结，有不对的地方希望各位高手指点。', '<p>\r\n	python django 学习笔记第一篇：django 安装等，（注：本django版本为1.5.2 ,系统为debain）\r\n</p>\r\n<p>\r\n	1.安装django,直接运行如下命令：\r\n</p>\r\n<pre class=\"brush:bash\">easy_install django\r\n</pre>\r\n<p>\r\n	安装的时候如果没有报错，并运行如下的命令测试\r\n</p>\r\n<pre class=\"brush:bash\">python -c \"import django; print(django.get_version())\"</pre>\r\n<p>\r\n	如果能看到版本就说明安装成功了。如果不成功看你是否安装了 easy_install ,详细情况请看我的另一篇博客文章 <a href=\"http://www.phpyrb.com/Article-index-artid-1.html\" target=\"_blank\">《debian 初始安装》</a> \r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('25', 'Sublime 常用的快捷键列表。', '<p>\r\n	<strong>Sublime 常用的快捷键列表如下：</strong> \r\n</p>\r\n<p>\r\n	Ctrl+L 选择整行（按住-继续选择下行）\r\n</p>\r\n<p>\r\n	Ctrl+KK 从光标处删除至行尾\r\n</p>\r\n<p>\r\n	Ctrl+Shift+K 删除整行\r\n</p>\r\n<p>\r\n	Ctrl+Shift+D 复制光标所在整行，插入在该行之前\r\n</p>\r\n<p>\r\n	Ctrl+J 合并行（已选择需要合并的多行时）\r\n</p>\r\n<p>\r\n	Ctrl+KU 改为大写\r\n</p>\r\n<p>\r\n	Ctrl+KL 改为小写\r\n</p>\r\n<p>\r\n	Ctrl+D 选词 （按住-继续选择下个相同的字符串）\r\n</p>\r\n<p>\r\n	Ctrl+M 光标移动至括号内开始或结束的位置\r\n</p>\r\n<p>\r\n	Ctrl+Shift+M 选择括号内的内容（按住-继续选择父括号）\r\n</p>\r\n<p>\r\n	Ctrl+/ 注释整行（如已选择内容，同“Ctrl+Shift+/”效果）\r\n</p>\r\n<p>\r\n	Ctrl+Shift+/ 注释已选择内容\r\n</p>\r\n<p>\r\n	Ctrl+Z 撤销\r\n</p>\r\n<p>\r\n	Ctrl+Y 恢复撤销\r\n</p>\r\n<p>\r\n	Ctrl+M 光标跳至对应的括号\r\n</p>\r\n<p>\r\n	Alt+. 闭合当前标签\r\n</p>\r\n<p>\r\n	Ctrl+Shift+A 选择光标位置父标签对儿\r\n</p>\r\n<p>\r\n	Ctrl+Shift+[ 折叠代码\r\n</p>\r\n<p>\r\n	Ctrl+K0 展开所有\r\n</p>\r\n<p>\r\n	Ctrl+U 软撤销\r\n</p>\r\n<p>\r\n	Ctrl+T 词互换\r\n</p>\r\n<p>\r\n	Ctrl+Shift+] 展开代码\r\n</p>\r\n<p>\r\n	Ctrl+KT 折叠属性\r\n</p>\r\n<p>\r\n	Tab 缩进 自动完成\r\n</p>\r\n<p>\r\n	Shift+Tab 去除缩进\r\n</p>\r\n<p>\r\n	Ctrl+Shift+↑ 与上行互换\r\n</p>\r\n<p>\r\n	Ctrl+Shift+↓ 与下行互换\r\n</p>\r\n<p>\r\n	Ctrl+K Backspace 从光标处删除至行首\r\n</p>\r\n<p>\r\n	Ctrl+Enter 光标后插入行\r\n</p>\r\n<p>\r\n	Ctrl+Shift+Enter 光标前插入行\r\n</p>\r\n<p>\r\n	Ctrl+F2 设置书签\r\n</p>\r\n<p>\r\n	F2 下一个书签\r\n</p>\r\n<p>\r\n	Shift+F2 上一个书签\r\n</p>');
INSERT INTO `article_content` VALUES ('26', '如何使用反向代理，反向代理如何配置等。', '<p>\r\n	反向代理的配置如下：\r\n</p>\r\n<pre class=\"brush:bash\">\r\nupstream oeserver {\r\n    server 127.0.0.1:8000;\r\n}\r\nserver\r\n{\r\n    listen       80;\r\n    server_name www.phpyrb.com phpyrb.com;\r\n    root /www/mw;\r\n\r\n    location /\r\n    {\r\n        proxy_next_upstream http_502 http_504 error timeout invalid_header;\r\n        proxy_pass_header Set-Cookie;\r\n        proxy_set_header   Host             $host;\r\n        proxy_set_header   X-Real-IP        $remote_addr;\r\n        proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;\r\n        proxy_redirect  off;\r\n\r\n        proxy_pass http://oeserver;\r\n\r\n        proxy_buffering on;\r\n        proxy_cache_valid       1d;\r\n        expires 1d;\r\n    }\r\n\r\n    location ~* \\.(js|css|png|jpg|jpeg|gif|ico)$\r\n    {\r\n        proxy_buffering on;\r\n        proxy_cache_valid       1d;\r\n        expires 1d;\r\n    }\r\n\r\n    access_log off; \r\n}</pre>\r\n<p>\r\n	&nbsp;\r\n</p>');
INSERT INTO `article_content` VALUES ('27', 'mysql的数据库导入与导出的sql语句。', '<p>\r\n	mysql 数据库导入、导出\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1.设置MYSQL的环境变量\r\n</p>\r\n<p>\r\n	2.然后按 win+r 打开远行，在输入框里面输入 cmd,打开DOS命令窗口。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	导出命令如下：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"brush:bash\">mysqldump -u username -p password databasename &gt; d:\\\\test.sql (目录路径)</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	导入命令如下：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"brush:bash\">mysql -u username -p password databasename &lt; d:\\\\test.sql</pre>\r\n创建数据库命令如下：\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"brush:bash\">create database dbname</pre>\r\n<br />');
INSERT INTO `article_content` VALUES ('28', 'Python Django POST 方法运行时候会报错 Python Django POST Forbidden (403) ，解决办法如下', '<p>\r\n	在Django 中用POST提交时会报错，错误如下：\r\n</p>\r\n<h1 style=\"color:#000000;text-indent:0px;font-family:sans-serif;font-style:normal;font-weight:normal;\">\r\n	Forbidden<span class=\"Apple-converted-space\">&nbsp;</span><span style=\"color:#666666;font-size:16px;font-weight:normal;\">(403)</span> \r\n</h1>\r\n<p style=\"color:#000000;text-indent:0px;\">\r\n	CSRF verification failed. Request aborted.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	这注意是django开启了防 跨站请求伪造 （Cross Site Request Forgery），所以在用POST提交没有带验证 CSRF；\r\n</p>\r\n<p>\r\n	解决办法如下，有二种：\r\n</p>\r\n<p>\r\n	第一种，很好做，既然是开启，那就是把他关掉就好了。\r\n</p>\r\n<p>\r\n	在你的项目配置文件里，找到&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;“MIDDLEWARE_CLASSES =“\r\n</p>\r\n<p>\r\n	把里面的\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;\'django.middleware.csrf.CsrfViewMiddleware\',\r\n</p>\r\n<p>\r\n	注释掉就可以，就是在前面加个#号就ok了。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	第二种方法是就过滤这个错误消息\r\n</p>\r\n<p>\r\n	在你要用到post 的类里面导入：\r\n</p>\r\n<pre class=\"brush:python\">from django.views.decorators.csrf import csrf_exempt </pre>\r\n<p>\r\n	并你要用到的函数前面加上如下代码：\r\n</p>\r\n<pre class=\"brush:python\">@csrf_exempt </pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	好了，现在看看行不：\r\n</p>\r\n<p>\r\n	还有种方法，我不是太懂\r\n</p>\r\n<p>\r\n	详细就去官方的文档\r\n</p>\r\nhttps://docs.djangoproject.com/en/dev/ref/contrib/csrf/#ajax');
INSERT INTO `article_content` VALUES ('29', 'lftp命令参数解析帮忙，lftp如何传单文件，如何传文件夹，liunx下使用lftp命令，如何使用lftp命令。', '<p>\r\n	lftp 命令使用如下：\r\n</p>\r\n<p>\r\n	1.首先安装lftp,安装命令如下：（本命令默认为debian系统）\r\n</p>\r\n<pre class=\"brush:bash\">apt-get install lftp</pre>\r\n<p>\r\n	2.如何使用lftp连接，连接命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">lftp root:123@www.phpyrb.com\r\n</pre>\r\n<p>\r\n	命令解析如下：lftp 用户名：密码@你远端服务器域名，但这样一般如何你用户或密码错误是不会报错，所以你不知道到底连接正确没有，所以你要测试一下，很简单，只要用 ls 查看一下，如果能看到文件列表，那你就连接成功，否则就连接失败，那只能重新连接了。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	3.如何把你的连接加入到书签，这样以后就直接连，不用每回输入用户名和密码,连接正确后，输入命令，命令如下:\r\n</p>\r\n<pre class=\"brush:bash\">bookmark add phpyrb\r\n</pre>\r\n<p>\r\n	这样以后要连接，可以直接使用命令，命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">lftp phpyrb</pre>\r\n<p>\r\n	其中 <a target=\"_blank\" href=\"http://www.phpyrb.com\">phpyrb</a> 为书签名。\r\n</p>\r\n<p>\r\n	4.把本地的修改好的文件传到远端，单文件传命令如下：\r\n</p>\r\n<pre class=\"brush:bash\"> put localhost.php -o remote.php</pre>\r\n<p>\r\n	传文件夹使命如下：\r\n</p>\r\n<pre class=\"brush:bash\">put localhost -O remote</pre>\r\n<p>\r\n	命令解析：localhost.php为本地的文件名路径，localhost为本地文件夹路径。remote.php为本地的文件名路径，remote为本地文件夹路径。如果要传文件用小写的 ‘‘o’’,文件夹为大写的“O”。\r\n</p>');
INSERT INTO `article_content` VALUES ('30', '在使用 jquery 时，如何为动态新添加的元素绑定事件，找了很久，后来发jquery有这样的方法，我还用过，只是一直不知道他是可以支持动态绑定的。', '<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;今天在用jquery写脚本的时候，要做个用jquery添加的新元素绑定一个删除事件，发现怎么绑定都不行，想了很久才发现是因为默认的事件只支持页面已经加载过的元素，新添加的元素是没有加载的。如何为动态新添加的元素绑定事件，找了很久，后来发jquery有这样的方法，我还用过，只是一直不知道他是可以支持动态绑定的。好了不费话了.\r\n</p>\r\n<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 其实还有一个方法，就是要加载多一个插件，liveQuery. 这个插件我没有用过，有意是可以自己找资料。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; .live() 方法能对一个还没有添加进DOM的元素有效，是由于使用了事件委托，<br />\r\n&nbsp;&nbsp;&nbsp; live 函数具体使用方法如下 ：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;在jQuery 1.4.1 中，.live() 能接受多个，用空间分隔事件，在提供类似.bind()的功能 。例如，我们可以“live ” \r\n同时绑定mouseover和mouseout事件,像这样：\r\n</p>\r\n<pre class=\"brush:jscript\">$(\'.hoverme\').live(\'mouseover mouseout\', function(event) {\r\n  if (event.type == \'mouseover\') {\r\n    // do something on mouseover\r\n  } else {\r\n    // do something on mouseout\r\n  }\r\n});</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在jQuery 1.4.3中:你可以绑定一个或多个事件类型的字符串和函数的数据映射来执行他们\r\n<pre class=\"brush:jscript\">$(\"a\").live({\r\n  click: function() {\r\n    // do something on click\r\n  },\r\n  mouseover: function() {\r\n    // do something on mouseover\r\n  }\r\n});</pre>');
INSERT INTO `article_content` VALUES ('32', 'django url 详细配置，用法，说明，如何去配置url 等。', '<div align=\"center\">\r\n	<p>\r\n		<span style=\"font-size:16px;\">django url 详解</span> \r\n	</p>\r\n</div>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp;django的url是你网站访问的路径。配置好你的URL是建好一个网站的重要核心。下面将详细讲解 Django url配置过程：\r\n</p>\r\n<p align=\"left\">\r\n	1.url 的路径，如果你用django建好了一个工程项目，那么在这个工程项目文件里面会有一个同名的文件夹，在这个文件夹下有个文件，文件名为 urls.py ，此文件里面就是整个工程项目的URL配置文件。（新工建程项目详解请看)\r\n</p>\r\n<p align=\"left\">\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:12px;\">2.在视图文件里的每个函数就是一个视图网页，而且每个函数都必需至少有一个参数，在视图文件里的函数第一个参数的类型是HttpRequest；它返回一个HttpResponse实例。为了使一个Python的函数成为一个Django可识别的视图，它必须满足这两个条件。</span></span> \r\n</p>\r\n<p align=\"left\">\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:12px;\">3.<span style=\"font-size:16px;\"><span style=\"font-size:12px;\">在 django 里面的 url 配置</span></span>其实访问各个函数内容的映射表。url 配置文件在根目录项目文件夹里面的 urls.py ，这个python文件就是你整个项目的 url 总配置文件，也是 django url 配置的入口文件。你可以把你整个项目的 url 配置在这个文件里面。文件情况如下：</span></span> \r\n</p>\r\n<pre class=\"brush:python\">from django.conf.urls.defaults import *\r\n\r\n# Uncomment the next two lines to enable the admin:\r\n# from django.contrib import admin\r\n# admin.autodiscover()\r\n\r\nurlpatterns = patterns(\'\',\r\n    # Example:\r\n    # (r\'^mysite/\', include(\'mysite.foo.urls\')),\r\n\r\n    # Uncomment the admin/doc line below and add \'django.contrib.admindocs\'\r\n    # to INSTALLED_APPS to enable admin documentation:\r\n    # (r\'^admin/doc/\', include(\'django.contrib.admindocs.urls\')),\r\n\r\n    # Uncomment the next line to enable the admin:\r\n    # (r\'^admin/\', include(admin.site.urls)),\r\n    url(r\'^blog/$\',\'blog.views.index\'),\r\n)</pre>\r\n<p>\r\n	配置 url 有几种方法，\r\n</p>\r\n<p>\r\n	第一种，是导入你的视图文件。如下图\r\n</p>\r\n<pre class=\"brush:python\">from django.conf.urls.defaults import *\r\nfrom blog.views import index\r\n#导入你的视图文件类，有多个就导入多个，在 Python 的 import 语法中 blog/views.py 会转成包的访问，变成 blog.views。\r\nurlpatterns = patterns(\'\',\r\n    #通过url参数，访问你视图里面的那个函数，如：www.b.com/blog表示访问视图 views 文件里面的 index 函数。\r\n    (\'^blog/$\', index),\r\n&nbsp;&nbsp;&nbsp; #这个是 python 的元组应用，前面的是把 url 通过正则配置把参数提取出来，传给视图函数。\r\n&nbsp;&nbsp;&nbsp; # 为了简洁，看的更清楚，我移除了注释代码，可以不用移除，可以做为例子。\r\n)</pre>\r\n<p>\r\n	正则的详细情况请看我的另一篇文章<a href=\"http://phpyrb.com/Article-index-artid-31.html\">django 正则表达式－Python 学习笔记3</a> \r\n</p>\r\n<p>\r\n	4.其实 django 访问 url 是在配置文件里面定义的，在你项目里面的 setting.py 文件里面的\r\n</p>\r\n<pre class=\"brush:python\">ROOT_URLCONF = \'mysite.urls\'</pre>\r\n<p>\r\n	当通过 url 访问时，他会在配置文件里面找到 url 入口文件的路径。\r\n</p>\r\n<p>\r\n	5.第二种方法，\r\n</p>\r\n<pre class=\"brush:python\">from django.conf.urls.defaults import *\r\nfrom blog.views import *\r\n#导入你的视图文件类，有多个就导入多个，在 Python 的 import 语法中 blog/views.py 会转成包的访问，变成 blog.views。\r\nurlpatterns = patterns(\'\',\r\n    #通过url参数，访问你视图里面的那个函数，如：www.b.com/blog<span id=\"__kindeditor_bookmark_end_7__\"></span>表示访问视图 views 文件里面的 index 函数。\r\n    (\'^blog/$\', include(\'blog.views\'),\r\n&nbsp;&nbsp;&nbsp; #直接导入视图文件，然后在视图文件里面配置具体的 url 映射，这个种方法我个人认为是最好的，\r\n&nbsp;&nbsp;&nbsp; # 为了简洁，看的更清楚，我移除了注释代码，可以不用移除，可以做为例子。\r\n)\r\n</pre>\r\n在视图文件里面，把 url 配置写在所有的函数前面。如下：\r\n<pre class=\"brush:python\">from django.shortcuts import render_to_response\r\n\r\nurlpatterns = patterns(\'\',\r\n    (r\'^index/$\', index),\r\n)\r\n\r\ndef index(self):\r\n    return render_to_response(\'index.html\',{})</pre>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('64', '在学习django模板的时候 ，不能不学习模板标签，模板标签是模板的核心，下面看一个都有那些模板标签。', '<h3>\r\n	django模板标签\r\n</h3>\r\n<p>\r\n	1.<strong>if/else</strong>,if/else在模板上的使用格式：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 格式1:\r\n</p>\r\n<pre class=\"brush:python\">{% if false|true %}\r\n   show content\r\n{% endif %}</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 格式2:\r\n</p>\r\n<pre class=\"brush:jscript\">{% if false|true %}\r\n   show content\r\n{% else %}\r\n    show content\r\n{% endif %}</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 要注意点：1.使用{% if %}的时候，一点注意空格，不能靠着%号，{%这两个字符中间不是有空格，后面也一样。if和判断条件表达式中间有空格。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.表达式支持 or(或),and(与),not(非)，注意的是，支持单个多次，例：a and b and c,中间用空格隔开。不是支持多个多次，如： a and b or c这个是不支持的，因为里面不支持()。如果有需求，可以嵌套使用。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.最要注意的是，一定要有 <span style=\"color:#E53333;\">{% endif %}</span> 结束。不然你就悲剧了。\r\n</p>\r\n<p>\r\n	2.<strong>for</strong>,for就是迭代，说的通俗一点，就是循环，（费话，谁不知道啊），不费话，直接说for在模板上使用格式：\r\n</p>\r\n<pre class=\"brush:python\">{% for a in b %}\r\n  show content\r\n{% endfor %}\r\n\r\n{% for a in b %}\r\n  show content\r\n{% empty %}//支持为空时，显示\r\n  empty\r\n{% endfor %}</pre>\r\n<p>\r\n	同时，标签for还几个属性方法，可以调用， forloop.counter表式当前迭代到第几个，forloop.revcounter表达迭代还剩余的个数，注意，他们都是整数。forloop.first，第一个，forloop.last最后一个，注意他们是布尔值，例如，迭代到最后一个时，forloop.last为真，forloop.first表示迭代第一个为真。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('33', 'django如何新建一个项目，如何新建一个django工程项目.', '<p style=\"font-size:16px;\" align=\"center\">\r\n	django如何新建项目工程\r\n</p>\r\n<p>\r\n	1.新建一个django项目目录，运行如下的命令：\r\n</p>\r\n<pre class=\"brush:python\">django-admin.py startproject phpyrb</pre>\r\n<p>\r\n	运行后查看你当前的目录里是否多出一个文件夹，名为 phpyrb的文件夹。\r\n</p>\r\n<p>\r\n	里面有如下的文件或文件夹：\r\n</p>\r\n<p>\r\n	manage.py&nbsp;&nbsp;&nbsp;&nbsp; //可以理解为你的项目启动文件\r\n</p>\r\n<p>\r\n	phpyrb/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //项目的包文件夹\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; __init__.py //要初始化的引入的配置文件\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; settings.py //项目设置文件\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; urls.py&nbsp; //url路径文件\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; wsgi.py&nbsp; //一个入口点,WSGI-compatible网路服务\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2.新建项目前的一些基本设置,打开项目目录中的phpyrb中settings.py,命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">vi phpyrb/settings.py</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; A.数据库设置，找到 DATABASES 设置项，设置成你会的数据库，具体设置例子如下：\r\n</p>\r\n<pre class=\"brush:python\">DATABASES = {\r\n        \'default\': {\r\n        \'ENGINE\': \'django.db.backends.mysql\', # Add \'postgresql_psycopg2\', \'mysql\', \'sql    ite3\' or \'oracle\'.\r\n         \'NAME\': \'\',                      # Or path to database file if using sqlite3.\r\n         # The following settings are not used with sqlite3:\r\n         \'USER\': \'root\',\r\n         \'PASSWORD\': \'123\',\r\n         \'HOST\': \'localhost\',                      # Empty for localhost through domain s    ockets or \'127.0.0.1\' for localhost through TCP.\r\n          \'PORT\': \'3306\',                      # Set to empty string for default.\r\n      }\r\n  }\r\n</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; B.时区设置：TIME_ZONE，设置成中国时区，设置如下：\r\n</p>\r\n<pre class=\"brush:python\">TIME_ZONE = \'Asia/Shanghai\'</pre>\r\n&nbsp;&nbsp; C.语言设置：LANGUAGE_CODE，设置成中文，设置如下：\r\n<pre class=\"brush:python\">LANGUAGE_CODE = \'zh-cn\'</pre>\r\n<p>\r\n	&nbsp;&nbsp; D.项目名设置：INSTALLED_APPS ，设置你要新建的项目名，加在数组最下面，设置如下：\r\n</p>\r\n<pre class=\"brush:python\"> INSTALLED_APPS = (\r\n    \'django.contrib.auth\',\r\n    \'django.contrib.contenttypes\',\r\n    \'django.contrib.sessions\',\r\n     \'django.contrib.sites\',\r\n     \'django.contrib.messages\',\r\n    \'django.contrib.staticfiles\',\r\n    \'blog\',\r\n)</pre>\r\n<p>\r\n	如上面，新建了一个 blog 项目名。简单的基本设置就设置完了。\r\n</p>\r\n<p>\r\n	4.设置完了就可以新建一个django项目，运行如下的命令：\r\n</p>\r\n<pre class=\"brush:bash\">python manage.py startapp blog</pre>\r\n这里的 blog 要和上面的项目名一样，不错会报错。');
INSERT INTO `article_content` VALUES ('34', '如何新建django模板文件。django模板如何写。', '<h3 align=\"center\">\r\n	django 模板详解\r\n</h3>\r\n<p align=\"left\">\r\n	1.django模板其实是就是把处理好的数据按照一定的样式输出的静态文件，及html 文件。\r\n</p>\r\n<p align=\"left\">\r\n	2.其实python原始的输出方式就是用print函数打印字符。但这种方法我想是没有人去用的，先不说他麻烦，就是出错的BUG都让人不想去做。所有就产生出了许多的模板引擎。django也有自己的模板引擎。\r\n</p>\r\n<p align=\"left\">\r\n	3.django模板引擎最基本的用法如下 ：\r\n</p>\r\n<p align=\"left\">\r\n	<br />\r\n</p>\r\n<pre class=\"brush:python\">from django.http import HttpResponse\r\n\r\ndef index(request):\r\n    html = \"hello world !.\"\r\n    return HttpResponse(html)</pre>\r\n<p>\r\n	直接输出字符串。如果是这样，肯定不会有人用的。这样太麻烦了。\r\n</p>\r\n<p>\r\n	4.模板的第二种使用方法如下：但首先要在APP目录下建名为 Templates 的文件夹。然后把你要显示的模板文件放入在里面，视图文件\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('35', '如何新建一个模型。模型字段详解。', '<h3 align=\"center\">\r\n	django模型详解之模型创建\r\n</h3>\r\n<p>\r\n	1.模型就是视图和数据库沟通的桥梁。\r\n</p>\r\n<p>\r\n	2.模型就是跟数据库拿数据，那么首先肯定是连接数据库，第一次是连接数据库设置，设置文件的位置之前介绍过了，这里就不重复了。不知道请看另一篇文章<a href=\"http://phpyrb.com/Article/index/artid/33.html\" target=\"_blank\">django 新建工程和项目－Python Django 学习笔记2</a>， 具体设置如下：\r\n</p>\r\n<pre class=\"brush:python\">DATABASES = {\r\n        \'default\': {\r\n        \'ENGINE\': \'django.db.backends.mysql\', # 这个是设置你要选择什么数据库，你可以选择你会的。我选择mysql。\r\n         \'NAME\': \'blog\',                      # 这个是设置数据库名。不过你得选择新建好该数据库\r\n         \'USER\': \'root\',                      # 这个是数据库用户名。\r\n         \'PASSWORD\': \'123456\',                # 这个是数据库密码。\r\n         \'HOST\': \'localhost\',                 # 这个是数据库连接地址。本机为 localhost\r\n         \'PORT\': \'3306\',                      # 这个是数据库连接端口。默认为 3306\r\n      }\r\n  }\r\n</pre>\r\n<p>\r\n	3.设置好数据库后，那下步就是新建表，当然django有他自己一套规则语法。\r\n</p>\r\n<p>\r\n	4.检查模型写正确没有，运行如下的命令：\r\n</p>\r\n<pre class=\"brush:python\">python manage.py validate</pre>\r\n<p>\r\n	5.查看新建的表的SQL语句，运行如下的命令：\r\n</p>\r\n<pre class=\"brush:python\">python manage.py sqlall blog</pre>\r\n<p>\r\n	6.数据库连接，连接命令如下：\r\n</p>\r\n<pre class=\"brush:python\">from django.shortcuts import render_to_response\r\nimport MySQLdb\r\n\r\ndef book_list(request):\r\n    db = MySQLdb.connect(user=\'root\', db=\'blog\', passwd=\'123\', host=\'localhost\')\r\n    cursor = db.cursor()\r\n    cursor.execute(\'SELECT name FROM category ORDER BY name\')\r\n    names = [row[0] for row in cursor.fetchall()]\r\n    db.close()\r\n    return render_to_response(\'index.html\', {\'names\': names})</pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('36', '', '<h3 align=\"center\">\r\n	django模型详解之数据库操作\r\n</h3>\r\n<p>\r\n	数据库操作如下：\r\n</p>\r\n<p>\r\n	1.写入命令如下：\r\n</p>\r\n<pre class=\"brush:python\">from </pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('37', 'django安装mysql支持,django如何连接mysql,django连接mysql设置,django连接mysql代码.', '<div align=\"center\">\r\n	<h3>\r\n		<br />\r\n	</h3>\r\n	<h3>\r\n		django如何连接mysql\r\n	</h3>\r\n	<p align=\"left\">\r\n		1.django 连接 mysql 之前先要安装 MySQLdb.\r\n	</p>\r\n	<p align=\"left\">\r\n		2.如何你还没有安装 MySQLdb,可以用如下的命令安装：\r\n	</p>\r\n<pre class=\"brush:bash\">easy_install MySQLdb </pre>\r\n	<p align=\"left\">\r\n		3.如何确定 mysqldb 安装成功，可以用如下方法：\r\n	</p>\r\n<pre class=\"brush:python\">python\r\nimport MySQLdb\r\n</pre>\r\n	<p align=\"left\">\r\n		如何没有报错的话，那恭喜你，你安装成功了，如何没有，请重复上面的步骤.\r\n	</p>\r\n	<p align=\"left\">\r\n		4.django 连接 mysql 的原代码如下：\r\n	</p>\r\n<pre class=\"brush:python\">import MySQLdb\r\n\r\ndef __init__(self):\r\n    db = MySQLdb.connect(user=\'root\', db=\'mydb\', passwd=\'\', host=\'localhost\')\r\n    cursor = db.cursor()\r\n    cursor.execute(\'SELECT name FROM mydb\')\r\n    names = [row[0] for row in cursor.fetchall()]\r\n    db.close()\r\n\r\n</pre>\r\n	<p>\r\n		<br />\r\n	</p>\r\n</div>');
INSERT INTO `article_content` VALUES ('38', 'python的string类里面的函数列表和解释.python的字符串常用函数.', '<div align=\"center\">\r\n	<h3>\r\n		Python String详解\r\n	</h3>\r\n</div>\r\n<p>\r\n	string类里面的函数列表如下：\r\n</p>\r\n<p>\r\n	&nbsp; 1. find 函数（查找一个字符串在不在别一个字符串里面，找到就返回索引，没有找到返回 -1）\r\n</p>\r\n<pre class=\"brush:python\">import string\r\n\r\n#找出‘py’第一次出现的索引\r\nindex = string.find(\'www.phpyrb.com\', \"py\")\r\nprint (index)   #结果：6\r\n\r\n#表明从哪开始搜寻子串\r\nindex = string.find(\'www.phpyrb.com\', \"py\",2)\r\nprint (index)   #结果：6\r\n\r\n#确定寻找字符串的索引范围\r\nindex = string.find(\'www.phpyrb.com\', \"py\",2,6)\r\nprint (index)   #结果：-1 \r\n</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;2. string.lowercase 所有小写的英文字母\r\n</p>\r\n<pre class=\"brush:python\">import string\r\n\r\nprint string.lowercase #结果 abcdefghijklmnopqrstuvwxyz</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 3. string.uppercase 所有大写的英文字母\r\n<pre class=\"brush:python\">import string\r\n\r\nprint string.uppercase #结果 ABCDEFGHIJKLMNOPQRSTUVWXYZ</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 4. string.digits 从0到9的数字\r\n<pre class=\"brush:python\">import string\r\n\r\nprint string.digits #结果 0123456789</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&lt;&lt;&lt;&lt;待续……\r\n</p>');
INSERT INTO `article_content` VALUES ('39', '介绍一些python的常用的函数,如: index,in,extend,append,insert等式', '<h3 align=\"center\">\r\n	Python常用列表函数详解\r\n</h3>\r\n<p>\r\n	1. append 在列表的尾部追加元素:\r\n</p>\r\n<pre class=\"brush:python\">num = [0, 1, 2, 3]\r\nnum.append(4)\r\nprint number\r\n[0, 1, 2, 3, 4]\r\n</pre>\r\n<p>\r\n	2. insert在列表中插入元素:\r\n</p>\r\n<pre class=\"brush:python\">num.insert(3, 5)\r\nprint num\r\n[0, 1, 2, 5, 3, 4]\r\n</pre>\r\n<p>\r\n	3. extend合并两个列表:\r\n</p>\r\n<pre class=\"brush:python\">a = [1,2,3]\r\nb = [4,6,7]\r\na.extend(b)\r\nprint a #结果：[1,2,3,4,6,7]\r\nprint b #结果：[4,6,7]\r\n# 注意，extend的只有一个参数，也就是说他其实是一个添加操作，在一个列表里面加入另一个列表\r\n</pre>\r\n<p>\r\n	4. index取得元素的索引值:\r\n</p>\r\n<pre class=\"brush:python\">a = [1,2,3]\r\nprint a.index(3)  #结果： 2</pre>\r\n<p>\r\n	5.len返回列表的长度，即元素的个数：\r\n</p>\r\n<pre class=\"brush:python\"> a = [1,2,3,4]\r\n print len(a)  #结果: 4</pre>\r\n<p>\r\n	6.in是一个布尔操作符，它测试左边的操作数是否包含于列表:\r\n</p>\r\n<pre class=\"brush:python\">a = [1,2,3,4]\r\n\r\n1 in a #结果：True</pre>\r\n<p>\r\n	7. del删除列表中的元素:\r\n</p>\r\n<pre class=\"brush:python\"># 索引\r\na = [1,2,3,4]\r\ndel a[1]\r\nprint a #结果：[1,3,4]\r\n\r\na = [1,2,3,4]\r\ndel a[1:3]\r\nprint a #结果：[1,4]</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&lt;&lt;&lt;&lt;待续……\r\n</p>');
INSERT INTO `article_content` VALUES ('40', 'django request的属性，用法。', '<div align=\"center\">\r\n	<h3>\r\n		<br />\r\n	</h3>\r\n	<h3>\r\n		django request 详解 － Python Django 学习笔记8\r\n	</h3>\r\n	<p align=\"left\">\r\n		1.首先先了解 URL 的对象 HttpRequest 的一些常用属性方法：\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; a. request.path 除域名以外的请求路径，以正斜杠开头.\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; b. <span class=\"pre\">request.get_host()</span> 主机名（比如，通常所说的域名.\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; c. <span class=\"pre\">request.get_full_path()</span> 请求路径，可能包含查询字符串.\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; d. <span class=\"pre\">request.is_secure()</span> 如果通过HTTPS访问，则此方法返回True， 否则返回False.\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; e. request.META 是一个Python字典,里面有如下属性：\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.<span>HTTP_REFERER</span>，进站前链接网页<span>，如果有的话.（请注意，它是<span>REFERRER</span>的笔误.）</span> \r\n	</p>\r\n	<p align=\"left\">\r\n		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.<span>HTTP_USER_AGENT</span>，用户浏览器的user-agent字符串，如果有的话.</span> \r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.<span>REMOTE_ADDR</span>客户端IP,如果申请是经过代理服务器的话，那么它可能是以逗号分割的多个IP地址,如:\"211.162.78.1,211.162.78.3\".\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用法如：request.META[\'<span>HTTP_REFERER</span>\'].\r\n	</p>\r\n	<p align=\"left\">\r\n		2. 注意，当你访问的键不存在时，会触发一个KeyError异常。因为 HTTP header信息是由用户的浏览器所提交的，是可以伪造的，因些可以艇以下的两种为法解决：\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; a.可以使用 try/except 语句：\r\n	</p>\r\n<pre class=\"brush:python\">def test_request(request):\r\n    try:\r\n        req = request.META[\'HTTP_USER_AGENT\']\r\n    except KeyError:\r\n        req = \'unkown\'\r\n    return HttpResponse(\"Your browser is %s\" % req)</pre>\r\n</div>\r\n<p align=\"left\">\r\n	&nbsp;&nbsp;&nbsp; b.可以使用Python字典的 get() 方法来处理这些可能不存在的键：\r\n</p>\r\n<pre class=\"brush:python\">def test_request(request):\r\n    req = request.META.get(\'HTTP_USER_AGENT\', \'unknown\')\r\n    return HttpResponse(\"Your browser is %s\" % req)</pre>\r\n<p align=\"left\">\r\n	3. 当然最要注意是，在使用 request 前，先要导入一个 HttpRequest 对象：\r\n</p>\r\n<pre class=\"brush:python\">from django.http import HttpResponse</pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('42', '这是一篇讲mongodb如何安装的文章。mongodb是一种nosql数据库.', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 1.下载MongoDB，可以去MongoDB官网上下载，下载前面看你的系统的是32位还是64位，MongoDB不支持XP系统，网址：http://www.mongodb.org/downloads\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;2.下载下来后，到一个盘里面建两个文件夹，一个放mongodb的程序，一个放mongodb数据库，盘和文件夹名可以自定义。我建在D盘根目录：MongoDB文件夹放mongodb程序，MongoDBDataBase文件夹放mongodb数据库.把下载下来的mongodb程序解压到MongoDB文件夹里面。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 3.把你的mongo程序路径添加到你的系统环境变量里面，这样以后运行的时候不用输入路径。方法如下：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a.右击我的电脑选择属性-&gt;系统高级设置-&gt;环境变量。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b.选择系统变量里面的Path选项，然后在最后面添加mongo程序路径：‘D:\\MongoDB\\bin；’，然后确认。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 4.现在就开始运行安装程序，把数据路径添加到mongo远行环境里面，首先打开运行输入‘cmd’，打开命令窗口，输入台下命令：\r\n</p>\r\n<pre class=\"brush:bash\">D:\\MongoDB\\bin\\mongod.exe --dbpath D:\\MongoDBDataBase\\\r\n</pre>\r\n运行后，会弹出防火墙警告，让你选择网络，然后把它们都钩上，然后确认。<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 5.现在检查安装成功没有，另外再打开一个命令窗口。然后输入：mongo.exe，显示如下：\r\n</p>\r\n<pre class=\"brush:bash\">Microsoft Windows [Version 6.1.7601]\r\nCopyright (c) 2009 Microsoft Corporation.  All rights reserved.\r\n\r\nC:\\Users\\MaWei&gt;mongo.exe\r\nMongoDB shell version: 2.4.9\r\nconnecting to: test\r\nServer has startup warnings:\r\nThu Mar 13 16:00:53.174 [initandlisten]\r\nThu Mar 13 16:00:53.174 [initandlisten] ** NOTE: This is a 32 bit MongoDB binary</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 6.现在介绍一个简单的方法，不然每次都这样，很麻烦，方法是这样的。在你的桌面上建一个批处理文件（mongo.bat）,在里面输入如下字符：\r\n</p>\r\n<pre class=\"brush:bash\">mongod --dbpath D:\\MongoDBDateBase\r\nmongo 127.0.0.1:27017/admin</pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('44', 'git客户端详细配置，git配置，第一次初始化git配置，第一次如何使用git。', '<h3 align=\"center\">\r\n	git配置－客户端\r\n</h3>\r\n<p>\r\n	1.在使用 git 版本控制器，如何远程服务器已经配置好了，那使用起来会很简单，只要拿到远端地址，然后用命令拖下来就可以了，如何远程做了验证，那么你拖的时候，会要求你输入用户名。请直接看第三步。命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">git clone url filename //url 远端项目地址， filename 存放本地的地址，不写就在当前目录\r\n</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 注：如果连接远端用的是 ssh 的话，如 github就是用的这个协议，那需要用到 key 的使用，如何生成 KEY 可以参考我的别一篇博文 《<a href=\"http://phpyrb.com/Article-content-artid-22.html\" target=\"_blank\">vps 安全登录的方法 ssh 登录</a>》，那你需要在拖的时候把你的 KEY 告诉 Git 。方法有两种\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; a.使用配置文件，在你的 .ssh 文件夹里面新建一个文件 config ,(如何是windows的话，你是没有办法建的，你可以从各种编辑器的安装目录里面的配置文件拷过来，然后再改），然后在里面输入如下内容：\r\n</p>\r\n<pre class=\"brush:bash\">Host name //这个名字可以随便取，只做为这个配置的名称\r\nhostname hostname //项目主机地址\r\nuser username //服务器登入的用户名\r\nIdentityFile *.ppk //登入服务器的安全钥匙</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; b.使用 git 配置命令，命令如下：\r\n</p>\r\nwindow7下：\r\n<pre class=\"brush:bash\">eval $(ssh-agent)\r\nssh-add *.ppk</pre>\r\ndebian下：\r\n<pre class=\"brush:bash\">exec ssh-agent bash\r\nssh-add *.ppk</pre>\r\n<p>\r\n	2.如果你在远端建好了一个空的仓库后，想把本地的项目推送到远端仓库，（如果你要自己配置一个git版本服务器，请看我的另一篇博客 <a target=\"_blank\" href=\"http://www.phpyrb.com/Article-catags-tag-15.html\">git服务器配置</a>）例如你的github网站上新建一个空的项目仓库，想把你本地的项目推送到github上，那首先git初始化，如何你是从远端拖下来的，这一步可以跳过。在你需要推送项目目录文件中右击选择 git bash ，会打开一个命令窗口，首先初始化项目：\r\n</p>\r\n<pre class=\"brush:bash\">git init\r\n</pre>\r\n<p>\r\n	3.设置你的基本信息，这个是必须配置的，如果你之前设置了就不用，不然不管在你拉取还是推送的时候，会提示验证，命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">git config --global user.email \'1123265518@qq.com\'\r\ngit config --global user.name mawei</pre>\r\n4.上面设置好后，把你的远端项目的地址添加到git配置中去，命令如下：\r\n<pre class=\"brush:bash\">git remote add orgin user@host:project_path/project_name.git</pre>\r\n<p>\r\n	其中user对应上面的四个参数配置里面的user,host对就上面的host,project_path为服务器的文件路径，后面的是项目名，要以git结尾。\r\n</p>\r\n<p>\r\n	5.这些都设置好后，就可以拉取项目，命令如下：\r\n</p>\r\n<pre class=\"brush:jscript\">git pull</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	6.在你的项目里面肯定会有些不需要提交到版本库的文件，所以你要把不需要的文件过滤掉，方法是在你的项目根目录里面建一个名为 .gitignore文件，window上是无法直接新建的，你可以你当前git shell窗口远行DOS命令新建。命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">cat .gitignore</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	7.提交你的改好的项目文件到远端，命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">git add -A  //这个命令会把你修改过的文件添加到临时库里面\r\ngit commit -m \'修改说明\'   //把临时库里面的添加到本地版本库里\r\ngit push  //把本地的版本库推送到远端</pre>\r\n8.如果你是做合做做项目开发，那你肯定是从你公司的开发服务器上拉取，那么就更简单了，在你运行环境网站根目录里打开git shell,先做第一步，然后第三步，最后在里面输入一条命令搞定，命令如下：\r\n<pre class=\"brush:jscript\">git clone project_path</pre>\r\n然后拉取，推送都是一样的命令了。如果还有什么不清楚，不懂可以在下面给我留言。\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('45', 'curl_init()函数不可用或报错的解决办法.开启curlr方法。', '<h2 align=\"center\">\r\n	curl_init()函数不可用或报错的解决办法\r\n</h2>\r\n<p>\r\n	1. curl是利用URL语法在命令行方式下工作的开源文件传输工具.\r\n</p>\r\n<p>\r\n	2. curl_init函数不可用，或者报错，其实是因为 curl 库没有开启。\r\n</p>\r\n<p>\r\n	3. curl 库需要几个动态链接库的支持：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; php_curl.dll<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;php5ts.dll<br />\r\n&nbsp; &nbsp; &nbsp;libeay32.dll<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ssleay32.dll\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 一般情况这几个都自带了，理论上是不需要处理。但如果按第四步做还不行，就把在PHP安装目录里面这个四个库拷到\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; C:/windows/system32 里面。然后重启。\r\n</p>\r\n<p>\r\n	4. 开启 curl 的方法：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; a.找到php.ini ,修改extension=php_curl.dll 把前面的分号去掉.\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; b.然后重启服务器.\r\n</p>\r\n<p>\r\n	5. curl 常用函数：\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<ul class=\"chunklist chunklist_reference\">\r\n	<li>\r\n		curl_close — 关闭一个cURL会话\r\n	</li>\r\n	<li>\r\n		curl_copy_handle — 复制一个cURL句柄和它的所有选项\r\n	</li>\r\n	<li>\r\n		curl_errno — 返回最后一次的错误号\r\n	</li>\r\n	<li>\r\n		curl_error — 返回一个保护当前会话最近一次错误的字符串\r\n	</li>\r\n	<li>\r\n		curl_exec — 执行一个cURL会话\r\n	</li>\r\n	<li>\r\n		curl_getinfo — 获取一个cURL连接资源句柄的信息\r\n	</li>\r\n	<li>\r\n		curl_init — 初始化一个cURL会话\r\n	</li>\r\n	<li>\r\n		curl_multi_add_handle — 向curl批处理会话中添加单独的curl句柄\r\n	</li>\r\n	<li>\r\n		curl_multi_close — 关闭一组cURL句柄\r\n	</li>\r\n	<li>\r\n		curl_multi_exec — 解析一个cURL批处理句柄\r\n	</li>\r\n	<li>\r\n		curl_multi_getcontent — 如果设置了CURLOPT_RETURNTRANSFER，则返回获取的输出的文本流\r\n	</li>\r\n	<li>\r\n		curl_multi_info_read — 获取当前解析的cURL的相关传输信息\r\n	</li>\r\n        <li>\r\n		curl_multi_remove_handle — 移除curl批处理句柄资源中的某个句柄资源\r\n	</li>\r\n	<li>\r\n		curl_multi_select — 等待所有cURL批处理中的活动连接\r\n	</li>\r\n	<li>\r\n		curl_setopt_array — 为cURL传输会话批量设置选项\r\n	</li>\r\n	<li>\r\n		curl_setopt — 设置一个cURL传输选项\r\n	</li>\r\n	<li>\r\n		curl_version — 获取cURL版本信息\r\n	</li>\r\n	<li>\r\n		curl_multi_init — 返回一个新cURL批处理句柄\r\n	</li>\r\n	\r\n</ul>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('46', 'mysql如何把一表的某个字体更新到另一表的相同字段。', '<div align=\"center\">\r\n	<h2>\r\n		<br />\r\n	</h2>\r\n	<h2>\r\n		mysql如何把一表的某个字体更新到另一表的相同字段\r\n	</h2>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p align=\"left\">\r\n		1.当你想把一个表里的某个字段里的值更新到另一个表里面相同的字段的值，用insert into肯定是不行，因为他会写入一条新的记录，而且要做到批量更新。找了很多地方，才找到，现在把他发上来。\r\n	</p>\r\n	<p align=\"left\">\r\n		2.表的结构如下：\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; table1:\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id B C D\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp; table 2:\r\n	</p>\r\n	<p align=\"left\">\r\n		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id E F G D\r\n	</p>\r\n	<p align=\"left\">\r\n		想要把table2里面的 D 字段更新到table1里面的 D 字段，而且是table1.id = table2.id，记录一一对应：\r\n	</p>\r\n	<p align=\"left\">\r\n		那么想要完成这个需求，sql语句如下：\r\n	</p>\r\n	<div align=\"left\">\r\n<pre class=\"brush:sql\">UPDATE table1 t1,table2 t2 SET t1.D=t2.D WHERE t1.id=t2.id</pre>\r\n	</div>\r\n</div>');
INSERT INTO `article_content` VALUES ('47', 'wamp5下的虚拟主机的配置，wamp5如何配置虚拟主机。', '<h2 style=\"text-align:center;\">\r\n	wamp5虚拟主机的配置\r\n</h2>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre>wamp5虚拟主机的配置如下：</pre>\r\n<pre><span style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;\">1.首先打你安装目录下的Apache配置文件C:\\wamp\\bin\\apache\\apache2.2.22\\conf\\htttpd.conf ,在里面查找 </span></pre>\r\n<pre><span style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;\">&nbsp;&nbsp;&nbsp;&nbsp;#Include conf/extra/httpd-vhosts.conf</span></pre>\r\n<pre><span style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;\">&nbsp;&nbsp;&nbsp;&nbsp;找到后把前面的 ‘‘#’’号去掉。 </span></pre>\r\n<pre><span style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;\">2.在Apache配置目录里面找到C:\\wamp\\bin\\apache\\apache2.2.22\\conf\\extra\\httpd-vhosts.conf, 把里面的所有删除，然后在里面添加如下的内容：\r\n#默认端口，不需要修改\r\nNameVirtualHost *:80 \r\n\r\n#虚拟主机的相关配置，需要多个，复制多少，然后改一下域名和路径.\r\n<xmp>\r\n<VirtualHost *:80>\r\nServerName www.a.com\r\nServerAlias www.a.com\r\nDocumentRoot \"D:/wamp/www/a\"\r\n</VirtualHost>\r\n</xmp>\r\n需要多个虚拟主机时，就复制多个。改一下域名和路径就可以了。\r\n<pre><span style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;\"><span style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;\">3.修改你的host文件，把域名指向本机,host文件路径为C:\\Windows\\System32\\drivers\\etc\\hosts，在里面添加如下代码：\r\n127.0.0.1       www.a.com a.com www.b.com b.com\r\n4.重启你的服务器就可以了。</span><span style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;\"></span></span></pre>\r\n</span></pre>');
INSERT INTO `article_content` VALUES ('48', '如何用scp命令把本地的文件或文件夹复制到远端，或者把远端的文件或文件夹复制到本地。', '<h3 align=\"center\">\r\n	scp命令的用法\r\n</h3>\r\n<p>\r\n	1.用scp 命令把本地的文件或文件夹复制到远端：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; a.文件复制命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">scp local_file remote_username@remote_address:remote_file_path</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; b.文件夹的复制命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">scp local_folder remote_username@remote_ip:remote_folder_path</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2.用 scp 命令把远端的文件或文件夹复制到本地来，其实就是把后面的这个参数转换一下位置，其命令参数如下：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; a.文件复制命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">scp remote_username@remote_ip:remote_file_path local_file_path</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; b.文件夹复制命令如下：\r\n<pre class=\"brush:bash\">scp -r remote_username@remote_ip:remote_folder_path local_folder_path</pre>\r\n<p>\r\n	3.常用参数说明：\r\n</p>\r\n<p>\r\n	－C 压缩传输\r\n</p>\r\n<p>\r\n	－P 端口，一般在远程服务器有防火墙，不能用时，就用特殊端口，命令如下：\r\n</p>\r\n<pre class=\"brush:bash\">scp -p 5000 remote_uersname@remote_address:remote_path local_path</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	－v 显示传输过程中的一些信息，比如速度，进度，大小等\r\n</p>\r\n<p>\r\n	4.最后要注意的，你的用户是否有远端的操作权限。\r\n</p>');
INSERT INTO `article_content` VALUES ('49', 'js验证如何限制输入框input只能输入数字,字母，等的正则表达式。', '<h2 align=\"center\">\r\n	<br />\r\n&nbsp;&nbsp; &nbsp;JS只能输入数字,数字和字母等的正则表达式<br />\r\n</h2>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;1.input框里面只能输入自然数：\r\n</p>\r\n<pre class=\"brush:jscript\"><input name=\"\" onkeyup=\"value=value.replace(/[^\\d]/,\'\');\" type=\"text\" /></pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 2.input框里面只能输入数字，小数：\r\n</p>\r\n<pre class=\"brush:jscript\"><input name=\"\" onkeyup=\"value=value.replace(/[^\\d\\.]/,\'\');\" type=\"text\" /></pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 3.input框里面只能输入字母：\r\n</p>\r\n<pre class=\"brush:jscript\"><input name=\"\" onkeyup=\"value=value.replace(/[^A-Za-z]/,\'\');\" type=\"text\" /></pre>');
INSERT INTO `article_content` VALUES ('50', 'jquery自定义扩展函数，在jquery中定义自己的函数。', '<h3>\r\n	jquery 自定义函数\r\n</h3>\r\n<p>\r\n	方法1：\r\n</p>\r\n<pre class=\"brush:jscript\">$.fn.diyfun = function(index){\r\n    return index;\r\n}\r\n//调用方法\r\n$(this).diyfun(1);\r\n//注意，$后面要接选择器，不选择也要用this.\r\n</pre>\r\n<p>\r\n	方法2：\r\n</p>\r\n<pre class=\"brush:jscript\">$.extend({\r\n    diyfun:function(index){\r\n        return index;\r\n    }\r\n});\r\n//调用方法\r\n$.diyfun(index);\r\n//注意这种方法 $ 后面直接接点，不能有括号。</pre>\r\n<p>\r\n	方法3：\r\n</p>\r\n<pre class=\"brush:jscript\">$.diyfun = function(index){\r\n    return index;\r\n}\r\n//调用方法\r\n$.diyfun(1231);\r\n//这个方法最简单，Jquery最简单的扩展方法</pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('51', 'jquery获取元素离顶部的高度，jquery获取元素在浏览器的位置等。', '<h3>\r\n	jquery获取元素位置偏移高度\r\n</h3>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1.jquery获取元素相对于父元素的偏移位置用 .position()<span style=\"line-height:1.5;\">,</span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">这个函数是不需要任何参数的，他会返回这个元素的 top、left值。例子如下： </span> \r\n</p>\r\n<pre class=\"brush:jscript\">var pos = $(\'element\').position();\r\n//相对父元素的左偏移量\r\nalert(pos.left);\r\n//相对父元素的上偏移量\r\nalert(pos.top);\r\n</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2.jquery获取元素在浏览器中的位置高度用 .offset(),\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\">这个函数也是不用任何参数的，他会返回 top、left值。例子如下：</span> \r\n</p>\r\n<pre class=\"brush:jscript\">var pos = $(\'element\').offset();\r\n//相对浏览器的左边偏移量\r\nalert(pos.left);\r\n//相对浏览器的顶部偏移量\r\nalert(pos.top);\r\n</pre>\r\n<p>\r\n	3.jquery获取垂直流动条的偏移高度 .scrollTop(), jquery获取水平滚动条离左边的偏移量 .scrollLeft(),\r\n</p>\r\n<p>\r\n	这个函数不接受参数，他会返回流动条离顶部的高度偏移量。例子如下：\r\n</p>\r\n<pre class=\"brush:jscript\">//滚动条离顶部的偏移量\r\nvar pos = $(\'elenment\').scrollTop();\r\nalert(pos);\r\n\r\n//滚动条离左边的偏移量\r\nvar pos = $(\'elenment\').scrollLeft();\r\nalert(pos);</pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('52', 'html5做一个表的动画特效。使用html5 nav做一个时钟。每行都有详细注释。', '<h3>\r\n	html5时钟动画\r\n</h3>\r\n<p>\r\n	1.用html5做一个表，效果如下：\r\n</p>\r\n<canvas id=\"can\" width=\"300\" height=\"300\" style=\"margin:0 auto;\">\r\n			你的浏览器不支持html5和css3\r\n		</canvas>\r\n<script type=\"text/javascript\">\r\n			//获取画布\r\n			var ct = document.getElementById(\'can\').getContext(\'2d\');\r\n			//设置多久刷新一下画布\r\n			setInterval(clock, 1000);\r\n			//调用函数\r\n			clock();\r\n			//时钟的函数\r\n			function clock() {\r\n				//设置画布大小\r\n				ct.clearRect(0, 0, 300, 300);\r\n				//实例化一个时间对象，获取当前时间\r\n				var date = new Date();\r\n				//还原24小时为12制\r\n				var hour = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();\r\n				//获取分\r\n				var minu = date.getMinutes();\r\n				//获取秒\r\n				var sec = date.getSeconds();\r\n				//计算时针偏转量，防止分针过半，时针还对着整点\r\n				hour = hour + minu / 60;\r\n				//设置表盘边框线粗细\r\n				ct.lineWidth = 5;\r\n				//设置表盘线颜色\r\n				ct.strokeStyle = \'yellow\';\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//arc为画圆的一个函数，参数为(圆心x轴,圆心y轴,半径x,半径y,偏转度(0-360),顺时针（true）逆时针(false))\r\n				ct.arc(150, 150, 100, 0, 360, false);\r\n				//结束画笔\r\n				ct.closePath();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//表盘内分刻度\r\n				for ( i = 0; i < 60; i++) {\r\n					//保存画布，\r\n					ct.save();\r\n					//设置分刻度宽度\r\n					ct.lineWidth = 2;\r\n					//设置分刻度颜色\r\n					ct.strokeStyle = \'green\';\r\n					//设置异次元空间的0，0点，意思是另一个地方创建一个画布，然后定位中心点\r\n					//其它这个时针是由多个画布叠加在一起形成的效果\r\n					ct.translate(150, 150);\r\n					//设置每次旋转角度\r\n					ct.rotate(6 * i * Math.PI / 180);\r\n					//开始确定画笔\r\n					ct.beginPath();\r\n					//画笔开始点\r\n					ct.moveTo(0, -89);\r\n					//移动到目标点\r\n					ct.lineTo(0, -95);\r\n					//结束画画\r\n					ct.closePath();\r\n					//保存你画的图案\r\n					ct.stroke();\r\n					//回到之前的画布\r\n					ct.restore();\r\n				}\r\n				//时刻度\r\n				for ( i = 0; i < 12; i++) {\r\n					//保存画布\r\n					ct.save();\r\n					//设置时刻度宽度\r\n					ct.lineWidth = 3;\r\n					//设置时刻度颜色\r\n					ct.strokeStyle = \'red\';\r\n					//设置异次元空间的0，0点\r\n					ct.translate(150, 150);\r\n					//设置旋转角度\r\n					ct.rotate(i * 30 * Math.PI / 180);\r\n					//开始确定画笔\r\n					ct.beginPath();\r\n					//画笔开始点\r\n					ct.moveTo(0, -85);\r\n					//移动到目标点\r\n					ct.lineTo(0, -95);\r\n					//结束画画\r\n					ct.closePath();\r\n					//保存你画的图案\r\n					ct.stroke();\r\n					//回到之前的画布\r\n					ct.restore();\r\n				}\r\n				//时针\r\n				ct.save();\r\n				//设置时针的宽度\r\n				ct.lineWidth = 5;\r\n				//设置时针的颜色\r\n				ct.strokeStyle = \'orange\';\r\n				//设置异次元空间的0，0点\r\n				ct.translate(150, 150);\r\n				//设置旋转角度\r\n				ct.rotate(hour * 30 * Math.PI / 180);\r\n				//开始确定画笔				\r\n				ct.beginPath();\r\n				//画笔开始点\r\n				ct.moveTo(0, -65);\r\n				//移动到目标点\r\n				ct.lineTo(0, 8);\r\n				//结束画画\r\n				ct.closePath();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//回到之前的画布\r\n				ct.restore();\r\n				//分钟\r\n				ct.save();\r\n				//设置分针的宽度\r\n				ct.lineWidth = 3;\r\n				//设置分针的颜色\r\n				ct.strokeStyle = \"green\";\r\n				//设置异次元空间的0，0点\r\n				ct.translate(150, 150);\r\n				//设置旋转角度\r\n				ct.rotate(minu * 6 * Math.PI / 180);\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//画笔开始点\r\n				ct.moveTo(0, -75);\r\n				//移动到目标点\r\n				ct.lineTo(0, 12);\r\n				//结束画画\r\n				ct.closePath();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//回到之前的画布\r\n				ct.restore();\r\n				//秒针\r\n				ct.save();\r\n				//设置秒针的宽度\r\n				ct.lineWidth = 2;\r\n				//设置秒针的颜色\r\n				ct.strokeStyle = \'red\';\r\n				//设置异次元空间的0，0点\r\n				ct.translate(150, 150);\r\n				//设置旋转角度\r\n				ct.rotate(sec * 6 * Math.PI / 180);\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//移动到目标点\r\n				ct.moveTo(0, -83);\r\n				//结束画画\r\n				ct.lineTo(0, 15);\r\n				//保存你画的图案\r\n				ct.closePath();\r\n				//回到之前的画布\r\n				ct.stroke();\r\n				//设置圆心样式\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//arc为画圆的一个函数，参数为(圆心x轴,圆心y轴,半径x,半径y,偏转度(0-360),顺时针（true）逆时针(false))\r\n				ct.arc(0, 0, 3, 0, 360, false);\r\n				//保存你画的图案\r\n				ct.closePath();\r\n				//填充颜色\r\n				ct.fillStyle = \'#FFF\';\r\n				//填充\r\n				ct.fill();\r\n				//回到之前的画布\r\n				ct.stroke();\r\n				//设置秒针上的圆心样式\r\n				ct.beginPath();\r\n				//arc为画圆的一个函数，参数为(圆心x轴,圆心y轴,半径x,半径y,偏转度(0-360),顺时针（true）逆时针(false))\r\n				ct.arc(0, -70, 3, 0, 360, false);\r\n				//保存你画的图案\r\n				ct.closePath();\r\n				//填充颜色\r\n				ct.fillStyle = \'#FFF\';\r\n				//填充\r\n				ct.fill();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//回到之前的画布\r\n				ct.restore();\r\n			}\r\n		</script>\r\n<p>\r\n	具体代码如下：\r\n</p>\r\n<pre class=\"brush:jscript\">\r\n<meta charset=\"utf-8\" />\r\n<title>\r\n	html5动画－表\r\n</title>\r\n<canvas id=\"can\" width=\"300\" height=\"300\">你的浏览器不支持html5和css3</canvas>\r\n<script type=\"text/javascript\">\r\n			//获取画布\r\n			var ct = document.getElementById(\'can\').getContext(\'2d\');\r\n			//设置多久刷新一下画布\r\n			setInterval(clock, 1000);\r\n			//调用函数\r\n			clock();\r\n			//时钟的函数\r\n			function clock() {\r\n				//设置画布大小\r\n				ct.clearRect(0, 0, 300, 300);\r\n				//实例化一个时间对象，获取当前时间\r\n				var date = new Date();\r\n				//还原24小时为12制\r\n				var hour = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();\r\n				//获取分\r\n				var minu = date.getMinutes();\r\n				//获取秒\r\n				var sec = date.getSeconds();\r\n				//计算时针偏转量，防止分针过半，时针还对着整点\r\n				hour = hour + minu / 60;\r\n				//设置表盘边框线粗细\r\n				ct.lineWidth = 5;\r\n				//设置表盘线颜色\r\n				ct.strokeStyle = \'yellow\';\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//arc为画圆的一个函数，参数为(圆心x轴,圆心y轴,半径x,半径y,偏转度(0-360),顺时针（true）逆时针(false))\r\n				ct.arc(150, 150, 100, 0, 360, false);\r\n				//结束画笔\r\n				ct.closePath();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//表盘内分刻度\r\n				for ( i = 0; i < 60; i++) {\r\n					//保存画布，\r\n					ct.save();\r\n					//设置分刻度宽度\r\n					ct.lineWidth = 2;\r\n					//设置分刻度颜色\r\n					ct.strokeStyle = \'green\';\r\n					//设置异次元空间的0，0点，意思是另一个地方创建一个画布，然后定位中心点\r\n					//其它这个时针是由多个画布叠加在一起形成的效果\r\n					ct.translate(150, 150);\r\n					//设置每次旋转角度\r\n					ct.rotate(6 * i * Math.PI / 180);\r\n					//开始确定画笔\r\n					ct.beginPath();\r\n					//画笔开始点\r\n					ct.moveTo(0, -89);\r\n					//移动到目标点\r\n					ct.lineTo(0, -95);\r\n					//结束画画\r\n					ct.closePath();\r\n					//保存你画的图案\r\n					ct.stroke();\r\n					//回到之前的画布\r\n					ct.restore();\r\n\r\n				}\r\n				//时刻度\r\n				for ( i = 0; i < 12; i++) {\r\n					//保存画布\r\n					ct.save();\r\n					//设置时刻度宽度\r\n					ct.lineWidth = 3;\r\n					//设置时刻度颜色\r\n					ct.strokeStyle = \'red\';\r\n					//设置异次元空间的0，0点\r\n					ct.translate(150, 150);\r\n					//设置旋转角度\r\n					ct.rotate(i * 30 * Math.PI / 180);\r\n					//开始确定画笔\r\n					ct.beginPath();\r\n					//画笔开始点\r\n					ct.moveTo(0, -85);\r\n					//移动到目标点\r\n					ct.lineTo(0, -95);\r\n					//结束画画\r\n					ct.closePath();\r\n					//保存你画的图案\r\n					ct.stroke();\r\n					//回到之前的画布\r\n					ct.restore();\r\n\r\n				}\r\n				//时针\r\n				ct.save();\r\n				//设置时针的宽度\r\n				ct.lineWidth = 5;\r\n				//设置时针的颜色\r\n				ct.strokeStyle = \'orange\';\r\n				//设置异次元空间的0，0点\r\n				ct.translate(150, 150);\r\n				//设置旋转角度\r\n				ct.rotate(hour * 30 * Math.PI / 180);\r\n				//开始确定画笔				\r\n				ct.beginPath();\r\n				//画笔开始点\r\n				ct.moveTo(0, -65);\r\n				//移动到目标点\r\n				ct.lineTo(0, 8);\r\n				//结束画画\r\n				ct.closePath();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//回到之前的画布\r\n				ct.restore();\r\n				\r\n				//分钟\r\n				ct.save();\r\n				//设置分针的宽度\r\n				ct.lineWidth = 3;\r\n				//设置分针的颜色\r\n				ct.strokeStyle = \"green\";\r\n				//设置异次元空间的0，0点\r\n				ct.translate(150, 150);\r\n				//设置旋转角度\r\n				ct.rotate(minu * 6 * Math.PI / 180);\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//画笔开始点\r\n				ct.moveTo(0, -75);\r\n				//移动到目标点\r\n				ct.lineTo(0, 12);\r\n				//结束画画\r\n				ct.closePath();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//回到之前的画布\r\n				ct.restore();\r\n\r\n				//秒针\r\n				ct.save();\r\n				//设置秒针的宽度\r\n				ct.lineWidth = 2;\r\n				//设置秒针的颜色\r\n				ct.strokeStyle = \'red\';\r\n				//设置异次元空间的0，0点\r\n				ct.translate(150, 150);\r\n				//设置旋转角度\r\n				ct.rotate(sec * 6 * Math.PI / 180);\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//移动到目标点\r\n				ct.moveTo(0, -83);\r\n				//结束画画\r\n				ct.lineTo(0, 15);\r\n				//保存你画的图案\r\n				ct.closePath();\r\n				//回到之前的画布\r\n				ct.stroke();\r\n\r\n				//设置圆心样式\r\n				//开始确定画笔\r\n				ct.beginPath();\r\n				//arc为画圆的一个函数，参数为(圆心x轴,圆心y轴,半径x,半径y,偏转度(0-360),顺时针（true）逆时针(false))\r\n				ct.arc(0, 0, 3, 0, 360, false);\r\n				//保存你画的图案\r\n				ct.closePath();\r\n				//填充颜色\r\n				ct.fillStyle = \'#FFF\';\r\n				//填充\r\n				ct.fill();\r\n				//回到之前的画布\r\n				ct.stroke();\r\n\r\n				//设置秒针上的圆心样式\r\n				ct.beginPath();\r\n				//arc为画圆的一个函数，参数为(圆心x轴,圆心y轴,半径x,半径y,偏转度(0-360),顺时针（true）逆时针(false))\r\n				ct.arc(0, -70, 3, 0, 360, false);\r\n				//保存你画的图案\r\n				ct.closePath();\r\n				//填充颜色\r\n				ct.fillStyle = \'#FFF\';\r\n				//填充\r\n				ct.fill();\r\n				//保存你画的图案\r\n				ct.stroke();\r\n				//回到之前的画布\r\n				ct.restore();\r\n			}\r\n		</script>\r\n</pre>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('53', 'git在服务器的配置，新建一个版本库。', '<h2>\r\n	git服务端配置\r\n</h2>\r\n<p>\r\n	1.在开始架设Git服务器之前，你首先要在你的Linux服务器上安装Git，安装命令如下：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; a.在debian上安装命令为：\r\n</p>\r\n<pre class=\"brush:bash\">apt-get install git</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; b.在centos上安装GIT命令为：\r\n<pre class=\"brush:bash\">yum install git</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2.开始架设Git服务器前，首先会需要一个空的仓库，做为你项目的仓库，在这个空仓库里面是不能有东西的。新建的空仓库一般是以.git为结尾的。新建的命令为：\r\n</p>\r\n<pre class=\"brush:bash\">git clone --bare your_project_name your_project_name.git</pre>\r\n<p>\r\n	3.\r\n</p>');
INSERT INTO `article_content` VALUES ('54', '在图上传前预览你的图片，看看上传前预览效果。', '<h3>\r\n	jquery图片上传前预览代码\r\n</h3>\r\n<p>\r\n	1.在上传图片前，默认是没有办法看到预览的，这是现在浏览器很头痛的问题，想预览可以用如下js,这个代码是来自网络，他原来的代码是只是看一个，你多选也只能看最后一个，我改了一下，注释起来为他原来的代码。具体找码如下：\r\n</p>\r\n<pre class=\"brush:jscript\">&lt;script&gt;	\r\n	$(\"#infile\").change(function(){\r\n		// var objUrl = getObjectURL(this.files[0]) ;\r\n		// console.log(\"objUrl = \"+objUrl) ;\r\n			// if (objUrl) {\r\n			 // $(\"#img0\").attr(\"src\", objUrl) ;\r\n		 // }\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	$(this.files).each(function (index,Obj){\r\n			objUrl = getObjectURL(Obj);\r\n			console.log(\"objUrl = \"+objUrl) ;\r\n			if (objUrl) {\r\n				var html = \"&lt;img src=\'\"+objUrl+\"\'/&gt;\";\r\n					$(\'.img\').append(html) ;\r\n				}\r\n			});\r\n	}) ;\r\n	//建立一個可存取到該file的url\r\n	function getObjectURL(file) {\r\n		var url = null ; \r\n		if (window.createObjectURL!=undefined) { // basic\r\n			url = window.createObjectURL(file) ;\r\n		} else if (window.URL!=undefined) { // mozilla(firefox)\r\n			url = window.URL.createObjectURL(file) ;\r\n		} else if (window.webkitURL!=undefined) { // webkit or chrome\r\n			url = window.webkitURL.createObjectURL(file) ;\r\n		}\r\n			return url ;\r\n		}\r\n&lt;/script&gt;</pre>\r\n<p>\r\n	2.html的代码部分如下：\r\n<pre class=\"brush:jscript\">\r\n&lt;input type=\"file\" name=\"file[]\" id=\"infile\" /&gt;\r\n&lt;div class=\"img\"&gt;&lt;/div&gt;</pre>\r\n</p>');
INSERT INTO `article_content` VALUES ('55', 'jquery获取选中的文字,js获取选中的文字.', '<h3>\r\n	jquery获取选中的文字,js获取选中的文字\r\n</h3>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	js获取选择中文字的js代码：\r\n</p>\r\n<p>\r\n<pre class=\"brush:jscript\">\r\nvar text = \'\';\r\nif(document.selection) {\r\n	text = document.selection.createRange().text;\r\n} else {\r\n	text = document.getSelection();\r\n}\r\n\r\nalert(text);</pre>\r\n</p>');
INSERT INTO `article_content` VALUES ('56', 'Fatal error: Unsupported operand types', '<p>\r\n	Unsupported operand types报错\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1.Fatal error: Unsupported operand types\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2.当程序报错，错的信息为上面的错识，该错误的意思是：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;致命错误：不支持的操作数据类型，\r\n</p>\r\n<p>\r\n	3.一般情况是因为你为转参数的时候，传入一个不对的数据类型，例如他需要一个字符型 ，你给他传一个数组型，好好查看一下你的传入值的数据类型\r\n</p>');
INSERT INTO `article_content` VALUES ('57', 'php如何生成真正的静态文件。', '<h3>\r\n	php生成静态\r\n</h3>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1.静态方法有两种，一种是伪静态，一种真静态。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; a.伪静态，通常的做法是url的操作，把url最后访问的文件改静态页面的后缀。这种一般要改写 url 规则。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; b.真静态，是把所有动态的页面生成真正的 html 文件，访问的时候不需要再通过PHP处理了。\r\n</p>\r\n<p>\r\n	2.php生成静态的方法，有好几种方法，但实现结果是一样的，我这里介绍常用的。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"brush:php\">ob_start();//开启静态缓存，注意的是，开启这个的时候，前面是不能有输出。\r\necho \'这里输出你要生成的静态文件的字符\';//把你要生成静态文件的字符串缓存到内存中， 注：这个用了一些常用的模板系统的，都有生成的，你直接用echo输出。\r\n//当然，如果你没有模板的时候，可以用到下面的方法。直接访问你要生成静态的网页。然后保存成文件\r\n$content = ob_get_contents();  //获取内存中缓存的静态字符串\r\nob_end_clean(); //结束获取，并清除内存中的缓存\r\nif(file_exists(\'./index.html\')){  //判断力之前生成没有，有就删除\r\n	unlink(\'./index.html\');\r\n}\r\nfile_put_contents(\'./navi.html\',$content); //把获取的缓存写入文件并保存成文件。\r\n//这样怎么样静态就生成</pre>\r\n<p>\r\n	3.如何没有用到模板系统，就没有办法直接输出静态的字符串，那只能有更直接的方法，直接去访问你要生成的页面，方法如下：\r\n</p>\r\n<pre class=\"brush:php\">$html = file_get_contents(\'你要缓存成静态文件的url\');\r\nfile_put_contents(\'./index.html\',$content);</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('58', 'jquery判断密码强度，js判断密码强度。', '<h3>\r\n	jquery判断密码强度\r\n</h3>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1.如何用jquery判断密码的强度，一般都有正则，不多说，直接贴代码吧：\r\n</p>\r\n<p>\r\n	首先是HTML：\r\n</p>\r\n<pre class=\"brush:css\">\r\n<table>\r\n	\r\n	<tbody>\r\n		\r\n		<tr>\r\n			\r\n			<td>\r\n				<i>*</i>原密码：\r\n			</td>\r\n\r\n			<td>\r\n				<input name=\"oldpassword\" type=\"text\" />\r\n			</td>\r\n\r\n		</tr>\r\n\r\n		<tr>\r\n			\r\n			<td>\r\n				<i>*</i>新密码：\r\n			</td>\r\n\r\n			<td>\r\n				<inputname=\"password\" type=\"text\" /><span id=\"passstrength\">(至少六个字符)</span>\r\n			</td>\r\n\r\n		</tr>\r\n\r\n		<tr>\r\n			\r\n			<td>\r\n				<i>*</i>确认密码：\r\n			</td>\r\n\r\n			<td>\r\n				<input name=\"repassword\" type=\"text\" />\r\n			</td>\r\n\r\n		</tr>\r\n\r\n	</tbody>\r\n\r\n</table>\r\n</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2.下面是正则操作的JS,代码如下：\r\n</p>\r\n<pre class=\"brush:jscript\">$(function () {\r\n            $(\'#pass\').keyup(function(e) {\r\n             var strongRegex = new RegExp(\"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\\\W).*$\", \"g\");\r\n             var mediumRegex = new RegExp(\"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$\", \"g\");\r\n             var enoughRegex = new RegExp(\"(?=.{6,}).*\", \"g\");\r\n             if (false == enoughRegex.test($(this).val())) {\r\n                     $(\'#passstrength\').css(\'color\',\'red\');\r\n             } else if (strongRegex.test($(this).val())) {\r\n                     $(\'#passstrength\').html(\'(强)\').css(\'color\',\'green\');\r\n             } else if (mediumRegex.test($(this).val())) {\r\n                     $(\'#passstrength\').html(\'(中)\').css(\'color\',\'#E6941A\');\r\n             } else {\r\n                     $(\'#passstrength\').html(\'(弱)\').css(\'color\',\'red\');\r\n                 }\r\n                 return true;\r\n            });\r\n        }); </pre>\r\n当然，这个特别比较粗糙，如果不合意，自己做做，这个主要是正则JS，\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('59', 'python文件操作函数详情列表，python open函数用法', '<h3>\r\n	python文件操作函数，python open函数用法\r\n</h3>\r\n<p>\r\n	1.python文件操作常用函数：\r\n</p>\r\n<pre class=\"brush:python\">output = open(r\'D:\\test\',\'w\')   #创建输出文件(\'w\' 写入,\'r\'读写,\'a\'文件末尾追加)\r\ninput = open(\'data\',r)或 open(\'data\'s) #创建输入文件\r\naString = input.read() #把整个文件当成一个字符串\r\naString = input.read(N) #读取N个字符当成一个字符串\r\naString = input.readline() #读取下一行包括行末标识符成一个字符串\r\naList = input.readlines() #读取整个文件到字符串列表\r\noutput.write(aString) #写入字符串到文件\r\noutput.writelines(aList)#把列表中所有的字符串写入文件\r\noutput.close()#手动关闭\r\noutput.flush()#把输出缓冲区写入硬盘中，但不关闭文件\r\nanyFile.seek(N)#修改文件位置到偏移量N处后进行下一操作\r\nfor line in open(\'data\'): use line #文件迭代一行一行的读\r\nopen(\'t.txt\',encoding=\'latin-1\') #Python 3.0 Unicode 文本文件(str字符串）\r\nopen(\'t.bin\',\'rb\') #Python 3.0二进制byte文件(bytes字符串）\r\n</pre>\r\n<p>\r\n	2.版本区别：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 1.open(\'t.txt\',\'w\').write(\'aaa\')：2.x版本是没有返回值，3.x版本会返回写入的字符数；\r\n</p>\r\n<p>\r\n	3.注意：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>');
INSERT INTO `article_content` VALUES ('60', '在php中如何获取文件中的扩展名', '<h3>\r\n	php获取文件的扩展名\r\n</h3>\r\n<p>\r\n	方法1：\r\n</p>\r\n<pre class=\"brush:php\">	function exname($_file){\r\n		$file = basename($_file);\r\n		$exname = substr($file,strrpos($file,\'.\')+1);\r\n		return  strtolower($exname);\r\n	}</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	方法2：\r\n</p>\r\n<pre class=\"brush:php\">	function exname($_file){\r\n		$file = basename($_file);\r\n		$exname = substr(strrchr($file,\'.\'), 1);\r\n		return  strtolower($exname);\r\n	}\r\n</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	方法3:\r\n<pre class=\"brush:php\">\r\n	function exname($_file){\r\n		$file = basename($_file);\r\n		$tmp = explode(\'.\', $file);\r\n		$exname = end($tmp);\r\n		return  strtolower($exname);\r\n	}</pre>\r\n方法4：\r\n<pre class=\"brush:php\">\r\n	function exname($_file){\r\n		$file = basename($_file);\r\n		$exname = pathinfo($file);\r\n		$exname = $exname[\'extension\'];\r\n		return  strtolower($exname);\r\n	}</pre>\r\n推荐用前三种方法，最后的方法需要环境的支持。\r\n</p>');
INSERT INTO `article_content` VALUES ('61', 'php如何循环创建文件夹的方法', '<h3>\r\n	php循环创建文件夹\r\n</h3>\r\n<p>\r\n	不能多说了，直接上代码，（费话，要说也没什么说的啊）：\r\n<pre class=\"brush:php\">\r\n	/**\r\n	 * 创建文件夹\r\n	 * @param  string $_path 文件夹路径\r\n	 * @return array\r\n	 * @author MaWei (http://www.phpyrb.com)\r\n	 * @date 2014-8-3  下午2:10:22\r\n	 */\r\n	function createDir($_path){\r\n		if (!file_exists($_path)){\r\n			createDir(dirname($_path));\r\n			mkdir($_path, 0777);\r\n		}\r\n	}</pre>\r\n</p>');
INSERT INTO `article_content` VALUES ('62', 'php从网络上下载图片，并保存，用php把远端的图片下载到本地。', '<h4>\r\n	php下载图片\r\n</h4>\r\n<p>\r\n	1.还是一惯的风格，不多费话，直接上代码，（这还叫不费话啊）：\r\n</p>\r\n<pre class=\"brush:php\">	/**\r\n	 * 创建文件夹\r\n	 * @param  string $_path 文件夹路径\r\n	 * @return array\r\n	 * @author MaWei (http://www.phpyrb.com)\r\n	 * @date 2014-8-3  下午2:10:22\r\n         * @qq群号：341411327\r\n	 */\r\n	function download_img($_url,$_path = null,$_name = null){\r\n		ob_start();\r\n		readfile($_url);\r\n		$img = ob_get_contents();\r\n		ob_end_clean();\r\n		if(! $_name){\r\n			$exname = exname($_url);\r\n			$_name = date(\'YmdHms\').rand(10).\'.\'.$exname;\r\n		}\r\n		if(! $_path){\r\n			$_path = UPLOAD_PATH.\'/avatar\'.\'/\';\r\n		}\r\n		createDir($_path);\r\n		$path = $_path.$_name;\r\n		file_put_contents($path, $img);\r\n		if(is_file($path)){\r\n                        chmod($path, 0444);//这步不能少，放病毒攻击\r\n			return $path;\r\n		}\r\n                return null;\r\n	}</pre>\r\n下面是文件创建函数：\r\n<pre class=\"brush:php\">	/**\r\n	 * 创建文件夹\r\n	 * @param  string $_path 文件夹路径\r\n	 * @return array\r\n	 * @author MaWei (http://www.phpyrb.com)\r\n	 * @date 2014-8-3  下午2:10:22\r\n	 */\r\n	function createDir($_path){\r\n		if (!file_exists($_path)){\r\n			createDir(dirname($_path));\r\n			mkdir($_path, 0777);\r\n		}\r\n	}</pre>\r\n<p>\r\n	下面是获取文件扩展名函数：\r\n<pre class=\"brush:php\">\r\n	/**\r\n	 * 返回文件的后缀名\r\n	 * @param string $_file\r\n	 * @return string $exname\r\n	 * @author MaWei ( http://www.phpyrb.com )\r\n	 * @date 2014-4-17 下午1:50:15\r\n	 */\r\n	function exname($_file){\r\n		$file = basename($_file);\r\n		$exname = substr(strrchr($file,\'.\'), 1);\r\n		return  strtolower($exname);\r\n	}</pre>\r\n</p>');
INSERT INTO `article_content` VALUES ('63', 'php如何发送http请求并且返回结果，php请求http并且返回结果。', '<p>\r\n	最近一个项目要用到php请求http://的需求，到网上找了好久，也没有找到什么好的例子，最后自己费了好大的精力，查手册，终于搞定了。哈哈……现在分享一下。\r\n</p>\r\n<p>\r\n	php请求http方法如下：\r\n</p>\r\n<pre class=\"brush:php\">//初始化curl模块\r\n$requery=curl_init();\r\n\r\n//设置你要请求的url\r\ncurl_setopt($requery,CURLOPT_URL,\"http://www.phpyrb.com\");\r\n\r\n//参数提交方式\r\ncurl_setopt($requery,CURLOPT_POST,true);\r\n\r\n//提交的参数，以数组的方式。例：$data = array(\'name\'=&gt;\'value\');\r\ncurl_setopt($requery, CURLOPT_POSTFIELDS, $data);\r\n\r\n//设置请求返回方式，添加此项为以字符串返回，如果没有此项则会直接输出到浏览器上，如果你想到用到结果，就设置此项\r\ncurl_setopt($requery, CURLOPT_RETURNTRANSFER, true);\r\n\r\n//获取返回的数据，没有设置上面那项则会直接输出到浏览器上，当然你也取到了结果\r\n$retstr=curl_exec($requery);\r\n\r\n//关闭\r\ncurl_close($requery);</pre>\r\n<p>\r\n	这个还是常用的。网上又基本找不到，所以然记录下来，方便自己也方便你。如果这些还不能满足你的话，那抱歉了，只能自行查手册脑补了。\r\n</p>');
INSERT INTO `article_content` VALUES ('65', '如何用正则匹配网址，匹配网址的正则表达式。', '<h3>\r\n	网址正则匹配\r\n</h3>\r\n<p>\r\n	最近做社交网址，要用到正则匹配网址，到网上找了好多，都不太行，看了很多论坛，\r\n</p>\r\n<p>\r\n	最后在国外论坛看到一个网址正则匹配表达达，不多说了，直接上表达式：\r\n<pre class=\"brush:php\">\r\nif(preg_match_all(\'/((?:https?|ftp):\\/\\/(?:www\\.)?(?:[a-zA-Z0-9][a-zA-Z0-9\\-]*\\.)?[a-zA-Z0-9][a-zA-Z0-9\\-]*(?:\\.[a-zA-Z0-9]+)+(?:\\:[0-9]*)?(?:\\/[^\\x{2e80}-\\x{9fff}\\s&lt;\\\'\\\"“”‘’,，。]*)?)/u\',$_html,$matches)){\r\n    return $mathches\r\n}</pre>\r\n至于匹配后要做的操作，各位看官自行处理，一般情况是会用到替换，不然找出来干什么了，可以用，str_replace()方法就可以了;\r\n</p>');
INSERT INTO `article_content` VALUES ('66', 'php短网址功能如何实现，php短网址的功能详解，可以直接拷过去用。', '<h3>\r\n	php短网址\r\n</h3>\r\n<p>\r\n	相信php短网址各位都会有用到吧，现在有个功能需求就是要做网址生成，我找了好多个办法，\r\n</p>\r\n<p>\r\n	开始的时候自己写了一个生成算法，后来没有用上，因为老大说要用百度的，去他的API是去看了，好是好，\r\n</p>\r\n<p>\r\n	不过他好的网址都会报错，最后没有，在网上找了一个开源的，不费话了，直接上代码：\r\n<pre class=\"brush:php\">\r\n/**\r\n * 短网址替换\r\n * @return string $_url\r\n * @author MaWei (http://www.phpyrb.com)\r\n * @date 2014-9-3 下午5:46:50\r\n */\r\nfunction vwzShortUrl($_url){\r\n	$requery=curl_init();\r\n	curl_setopt($requery,CURLOPT_URL,\"http://vwz.me/API.php?url=$_url\");\r\n	curl_setopt($requery, CURLOPT_RETURNTRANSFER, true);\r\n	$retstr=curl_exec($requery);\r\n	curl_close($requery);\r\n	$retstr = json_decode($retstr);\r\n	if($retstr-&gt;status != \'error\'){\r\n		$shorturl = $retstr-&gt;msg;\r\n	}else{\r\n		$shorturl = $_url;\r\n	}\r\n	return $shorturl;\r\n}</pre>\r\n这个用问题，可以直接留言，或者直接去官网看API；\r\n</p>');
INSERT INTO `article_content` VALUES ('67', '', '<h3>\r\n	debian常用命令\r\n</h3>\r\n<p>\r\n	1.pwd　显示当前路径\r\n</p>');
INSERT INTO `article_content` VALUES ('68', 'ps常用快捷键', '<h3>\r\n	ps常用快捷键\r\n</h3>\r\n<p>\r\n	1.Ctrl+j 复制一个图层\r\n</p>\r\n<p>\r\n	2.Ctrl+z,Ctrl+Alt+z退后\r\n</p>\r\n<p>\r\n	3.Ctrl+G编组\r\n</p>\r\n<p>\r\n	4.Ctrl+D取消选择\r\n</p>\r\n<p>\r\n	5.Ctrl+O打开文件\r\n</p>');
INSERT INTO `article_content` VALUES ('69', '如果你忘记mysql root密码，怎么办，方法如下……', '<h2>\r\n	mysql忘记密码<br />\r\n</h2>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 前阵子买了个服务器，然后装了nginx服务，当时没怎么注意mysql密码，结果今天登入的时候，发现在不知道密码，所以在网上找了些方法试试，有成功有失败，现在整理一个最有效的方法，些方法只限有管理员权限的用户，\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 1.关闭服务器，只是关闭nginx服务，因为等下修改的是mysql启动配置，跳过密码验证，如何nginx开启可能出现安全问题，所以建意关闭nginx服务，方法如下：\r\n</p>\r\n<pre class=\"brush:jscript\">//方法1：这命令简单方便\r\n~/lnmp stop\r\n//方法2：有些人可能上面的命令提示无效，那只能用下面的命令，\r\n/usr/local/nginx/sbin/nginx -s stop\r\n//这个方法就是直接进入安装目录\r\n</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 2.修复mysql启动配置，打开/etc/my.cnf，找到里面的 [mysql]，在下面加入如下的命令并保存：\r\n</p>\r\n<pre class=\"brush:jscript\">skip-grant-tables</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 3.重启mysql服务，注意是mysql服务，不是nginx服务，启动命令如下：\r\n<pre class=\"brush:jscript\">/etc/init.d/mysqld restart </pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 4.重设mysql root密码，首先打开mysql控制台，这时候是不用密码，直接输入命令，mysql回车，就打开了控制台，输入如下 的命令：\r\n<pre class=\"brush:jscript\">//选择数据库,大小写无所谓\r\nUSE mysql；\r\n//修改root,sql命令\r\nUPDATE user SET Password = password ( ‘new-password’ ) WHERE User = ‘root’ ; \r\nflush privileges ;\r\n//退出\r\nexit;\r\n</pre>\r\n<p>\r\n&nbsp;&nbsp;&nbsp; 5.把mysql启动配置修改回来，就是打开 /etc/my.cnf把刚刚加入的命令删除，保存，\r\n</p>\r\n<p>\r\n&nbsp;&nbsp;&nbsp; 6.重启nginx服务器，就OK了…… \r\n</p>');
INSERT INTO `article_content` VALUES ('70', '修改crontab的默认编辑器方法。', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 今天做项目的时候，需要用到计划任务，执行PHP任务。用crontab -e，打开，一下子傻眼了，一看用的nano编辑器，\r\n</p>\r\n<p>\r\n	这个编辑我只听过，不会用啊，跟VIM命令完全不一样，我想要换编辑器，在网上查了一下，我自己又总结了一下，方法如下，\r\n</p>\r\n<p>\r\n	下面的是把默认的nano修改为vim;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 方法1：（此方法只是临时生效）\r\n</p>\r\n<pre class=\"brush:bash\">export EDITOR=/usr/bin/vim;</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 方法2：（此方法相对上面要好一点，但要重启服务器）\r\n<pre class=\"brush:bash\">\r\necho export EDITOR=/usr/bin/vim &gt;&gt; ~/.bashrc</pre>\r\n&nbsp;&nbsp; 方法3： （此方法也要重启）\r\n<pre class=\"brush:jscript\">\r\n#查看当前系统有那些编辑器可用 \r\nupdate-alternatives --list editor\r\n#修改系统默认编辑器，输入如下的命令后，然后会提示你选择那个，直接输入数字\r\nupdate-alternatives --config editor\r\n</pre>\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 方法4：（这种方法更直接，而且不用重启）\r\n<pre class=\"brush:bash\">\r\napt-get remove nano</pre>\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 直接卸载nano编辑器，我个人推荐这种，不用这个编辑器，直接卸载更好\r\n</p>');
INSERT INTO `article_content` VALUES ('71', 'linux计划任务的命令相关的详细解释。', '<p>\r\n	&nbsp;&nbsp;&nbsp; 最近项目要用到计划任务，学习了一下linux计划任务命令：crontab，这个命令是linux定时任务服务命令，下面我总结了一下，共大家一起共同学习一下：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 1.安装crontab命令服务：\r\n</p>\r\n<pre class=\"brush:bash\">#debian安装\r\napt-get install cron\r\n#centos安装\r\nyum install crontabs</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 2.开启crontab服务：\r\n<pre class=\"brush:bash\">/etc/init.d/cron restart｜reload|start|stop #重启｜重载配置｜开启｜停止</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 3.查看crontab服务状态\r\n<pre class=\"brush:bash\">service cron status</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 4.crontab命令格式：\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crontab user command #crontab 执行程序的用户名 执行的命令，\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 5.crontab命令完整格式：\r\n</p>\r\n<pre class=\"brush:bash\">* * * * * user command  #前面五个星号为时期，依次表示，分 时 天 周 月,user为执行的用户名,command为执行命令</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; 6.Crontab执行时间说明：\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 星号表示全部，为任意时间\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ,&nbsp; 逗号表示范围，例：1,2,3&nbsp; 如果写的周上，表示 星期一到星期三\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp; 中横杠表示一个连续的整数范围 例：1-3 如果写的周上，表示 星期一到星期三\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&nbsp; 正斜线表示时间间隔频率 例：0-23/4写在时上，表示一天24小时每四小时执行一次\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 7.crontab编辑：\r\n</p>\r\n<pre class=\"brush:bash\">crontab -e</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 用上面的命令，会打开crontab计划任务的编辑文件，在里面输入你执行的计划任务，详细请看第六步，例：\r\n<pre class=\"brush:bash\">* */2 * * * www curl http://www.phpyrb.com #意思为每二分钟访问一个这个网站</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 以上我个人理解，整理。\r\n</p>');
INSERT INTO `article_content` VALUES ('72', '在lnmp里面给php安装rar模块,给php5安装rar模块,给nginx里面的php安装rar解压模块方法', '<p>\r\n	&nbsp;&nbsp;&nbsp; 最近项目需要用到php解压rar,不知道怎么搞,这几天一直在折腾php解压rar,搞的我都没有脾气了,在网上找各种资料,发现真的没有什么这方面的资料,http://www.phpyrb.com/Admin-Article-edit.html\r\n</p>\r\n<p>\r\n	可能这个需求比较少吧,搞了好久,今天终于搞定了,下面说一下方法:\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 1.下载php扩展rar包,网址为 http://pecl.php.net/package/rar;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 2.首先还是来说一下window版本的,这个容易,直接下载一个dll动态链接库包都放在php扩展包目录里面的,然后改一下配置文件重启就可以了.具体如下:\r\n</p>\r\n<p>\r\n	网址:http://pecl.php.net/package/rar/3.0.2/windows,已经在上面的网址中选择最新版本的rar扩展包,后面有个window DLL的图标点击进去下载,下载后把\r\n</p>\r\n<p>\r\n	里面的php_rar.dll这个文件放在你的php安装目录/php/ext/文件夹里面,然后再修改 php.ini ,在里面加上:\r\n</p>\r\n<pre class=\"brush:bash\">extension=php_rar.dll</pre>\r\n然后重启你的服务器就可以,这个很简单,主要是linux服务器难搞,下面来说说liunx的安装方法:\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 3.我用的是debian的系统,装的是 nginx 也就是lnmp包,\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 4.第一步还是先下载并解压,命令如下:\r\n</p>\r\n<pre class=\"brush:bash\">wget http://pecl.php.net/get/rar-3.0.2.tgz\r\ntar -xvf rar-3.0.2.tgz\r\ncd rar-3.0.2\r\n</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 5.然后是编译,首页你要安装一个编译插件:\r\n<pre class=\"brush:bash\">#Debianhttp://www.phpyrb.com/Admin-Article-edit.html\r\napt-get install libc-client-dev\r\n#CentOS\r\nyum install libc-client-devel</pre>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 6.下面两步很关键,我就是这步没有搞好,所以一直不行,在官方文档里面,安装是直接运行 phpize,这是他包里面默认就有的,我照着他里面做就是不行,这个应该用你安装的php里面的phpize再编译,如果没有你修改\r\n</p>\r\n<p>\r\n	nginx安装路径,那么命令应该如下,反正就是用你安装好的php里面的phpize来编辑,不要用包里面自带这的.命令如下:\r\n</p>\r\n<pre class=\"brush:bash\">/usr/local/php/bin/phpize</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	可能这步会出现一些警告,如下的一样\r\n</p>\r\n<pre class=\"brush:bash\">Configuring for:\r\nPHP Api Version:         20090626\r\nZend Module Api No:      20090626\r\nZend Extension Api No:   220090626\r\nconfigure.in:3: warning: prefer named diversions\r\nconfigure.in:3: warning: prefer named diversions</pre>\r\n这个没有关系 ,不要影响后面的.\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; 7.这步是最关键的,就是告诉编译环境你的php路径,这步非常重要,我就是被这步给搞死的,命令如下,如果你没有修改默认路径的话:\r\n</p>\r\n<pre class=\"brush:bash\">./configure --with-php-config=/usr/local/php/bin/php-config</pre>\r\n&nbsp;&nbsp;&nbsp;&nbsp; 8.最后一步就是添加配置,然后重启,修改php.ini配置:\r\n<pre class=\"brush:bash\">vi /usr/local/php/etc/php.ini</pre>\r\n然后在里面的添加:\r\n<pre class=\"brush:bash\">extension=rar.so</pre>\r\n然后保存,退出,重启nginx:\r\n<pre class=\"brush:bash\">~/lnmp restart</pre>\r\n如果没有报错,那就OK了.如果有问题,重新来一遍.嘿嘿^<br />\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `article_content` VALUES ('83', '萝莉控教程', '<p>萝莉控教程萝莉控教程萝莉控教程萝莉控教程萝莉控教程</p>');

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) unsigned DEFAULT '0' COMMENT '分类ID',
  `name` char(10) DEFAULT NULL COMMENT '标签名称',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `sort` tinyint(2) unsigned DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='文章标签表';

-- ----------------------------
-- Records of article_tag
-- ----------------------------
INSERT INTO `article_tag` VALUES ('11', '2', 'Skill', '', '50', '1');
INSERT INTO `article_tag` VALUES ('12', '2', 'Program', '', '50', '1');
INSERT INTO `article_tag` VALUES ('13', '2', 'Linux', '', '50', '1');
INSERT INTO `article_tag` VALUES ('14', '2', 'Vim', '', '50', '1');
INSERT INTO `article_tag` VALUES ('15', '2', 'git', '', '50', '1');
INSERT INTO `article_tag` VALUES ('16', '2', 'mysql', '', '50', '1');
INSERT INTO `article_tag` VALUES ('17', '2', 'debian', '', '50', '1');
INSERT INTO `article_tag` VALUES ('18', '2', 'jquery', '', '50', '1');
INSERT INTO `article_tag` VALUES ('19', '2', 'php', '', '50', '1');
INSERT INTO `article_tag` VALUES ('20', '2', 'wamp', '', '50', '1');
INSERT INTO `article_tag` VALUES ('21', '2', 'python', '', '50', '1');
INSERT INTO `article_tag` VALUES ('22', '2', 'django', '', '50', '1');
INSERT INTO `article_tag` VALUES ('25', '2', 'NoSQL', '', '50', '1');
INSERT INTO `article_tag` VALUES ('26', '2', 'MongoDB', '', '50', '1');

-- ----------------------------
-- Table structure for article_tutorial
-- ----------------------------
DROP TABLE IF EXISTS `article_tutorial`;
CREATE TABLE `article_tutorial` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(11) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(10) NOT NULL DEFAULT '' COMMENT '文章标题',
  `author` int(11) DEFAULT '1' COMMENT '作者',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态（0 隐藏、1显示）',
  `hots` int(11) unsigned DEFAULT '0' COMMENT '点击率',
  `com_num` int(11) unsigned DEFAULT '0' COMMENT '评论数',
  `keyword` varchar(120) DEFAULT '' COMMENT '关键字',
  `description` mediumtext COMMENT '简介',
  `content` text COMMENT '文章内容简介',
  `uptime` int(11) DEFAULT '0' COMMENT '更新时间',
  `ctime` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `cateid` (`cateid`) COMMENT '分类ID'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教程文章表';

-- ----------------------------
-- Records of article_tutorial
-- ----------------------------
INSERT INTO `article_tutorial` VALUES ('1', '1', '工', '1', '1', '0', '0', '工', '工a', '<p>&nbsp;工工工工a</p>', '0', '0');

-- ----------------------------
-- Table structure for article_tutorial_content
-- ----------------------------
DROP TABLE IF EXISTS `article_tutorial_content`;
CREATE TABLE `article_tutorial_content` (
  `directory_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '目录ID',
  `artid` int(11) unsigned NOT NULL,
  `content` text COMMENT '文章内容',
  PRIMARY KEY (`directory_id`),
  KEY `artid` (`artid`) USING BTREE COMMENT '文章ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教程内容表';

-- ----------------------------
-- Records of article_tutorial_content
-- ----------------------------

-- ----------------------------
-- Table structure for article_tutorial_directory
-- ----------------------------
DROP TABLE IF EXISTS `article_tutorial_directory`;
CREATE TABLE `article_tutorial_directory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0' COMMENT '父目录',
  `title` varchar(50) DEFAULT NULL COMMENT '目录标题',
  `hots` int(11) unsigned DEFAULT '0' COMMENT '点击率',
  `com_num` int(11) unsigned DEFAULT '0' COMMENT '评论数',
  `keyword` varchar(120) DEFAULT '' COMMENT '关键字',
  `uptime` int(11) DEFAULT '0' COMMENT '更新时间',
  `ctime` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教程文章目录';

-- ----------------------------
-- Records of article_tutorial_directory
-- ----------------------------

-- ----------------------------
-- Table structure for electron_category
-- ----------------------------
DROP TABLE IF EXISTS `electron_category`;
CREATE TABLE `electron_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0' COMMENT '元件父分类',
  `name` char(10) DEFAULT NULL COMMENT '元件分类名',
  `mark` char(10) DEFAULT NULL COMMENT '元件分类别名',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 (1:有效，0:失效)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='电子元件分类表';

-- ----------------------------
-- Records of electron_category
-- ----------------------------
INSERT INTO `electron_category` VALUES ('1', '0', '电阻', 'R', '0');
INSERT INTO `electron_category` VALUES ('2', '0', '电容', 'C', '0');

-- ----------------------------
-- Table structure for electron_componet
-- ----------------------------
DROP TABLE IF EXISTS `electron_componet`;
CREATE TABLE `electron_componet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elect_cate_id` int(11) DEFAULT '1' COMMENT '电子元件分类ID',
  `name` char(30) DEFAULT NULL COMMENT '元件名称',
  `model` char(20) DEFAULT NULL COMMENT '型号',
  `packaging` char(20) DEFAULT NULL COMMENT '封装类型',
  `value` char(20) DEFAULT NULL COMMENT '值',
  `minnum` int(11) DEFAULT '1' COMMENT '最小数量',
  `price` int(11) DEFAULT '0' COMMENT '价格(单位：分）',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 (1:有效，0:失效)',
  `uptime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='电子元件表';

-- ----------------------------
-- Records of electron_componet
-- ----------------------------
INSERT INTO `electron_componet` VALUES ('1', '1', 'aaab', 'AAAABF', 'AAAABF', 'AAABF', '1', null, '1', null);
INSERT INTO `electron_componet` VALUES ('2', '1', '贴片电容', '0805', 'SOT－223', '107C', '1', null, '1', null);
INSERT INTO `electron_componet` VALUES ('3', '1', 'nnnn', 'NNN', 'NNNN', 'NNNN', '1', null, '1', null);

-- ----------------------------
-- Table structure for electron_suit
-- ----------------------------
DROP TABLE IF EXISTS `electron_suit`;
CREATE TABLE `electron_suit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 (1:有效，0:失效)',
  `stime` int(11) DEFAULT NULL COMMENT '开始时间',
  `etime` int(11) DEFAULT NULL COMMENT '结束时间',
  `uptime` int(11) DEFAULT NULL COMMENT '更新时间',
  `description` text COMMENT '套装说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='套装列表';

-- ----------------------------
-- Records of electron_suit
-- ----------------------------

-- ----------------------------
-- Table structure for electron_suit_list
-- ----------------------------
DROP TABLE IF EXISTS `electron_suit_list`;
CREATE TABLE `electron_suit_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `elect_id` int(11) unsigned DEFAULT NULL COMMENT '元件ID',
  `num` int(11) unsigned DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`),
  KEY `elect_id` (`elect_id`) USING BTREE COMMENT '元件ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='套装元件列表';

-- ----------------------------
-- Records of electron_suit_list
-- ----------------------------

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员等级名称',
  `level` tinyint(2) DEFAULT '0' COMMENT '等级',
  `grade` int(11) DEFAULT NULL COMMENT '需要的分数',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型',
  `face` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员等级头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grade
-- ----------------------------

-- ----------------------------
-- Table structure for grade_type
-- ----------------------------
DROP TABLE IF EXISTS `grade_type`;
CREATE TABLE `grade_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型名称',
  `alias` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '别名(一般为英文）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grade_type
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
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
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for member_electron_order
-- ----------------------------
DROP TABLE IF EXISTS `member_electron_order`;
CREATE TABLE `member_electron_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT '会员ID',
  `electr_id` int(11) DEFAULT '0' COMMENT '元件ID',
  `num` int(11) DEFAULT '0' COMMENT '数量',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 (1:有效，0:失效 , 2:已完成)',
  `uptime` int(11) DEFAULT NULL COMMENT '订单时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员元件订单表';

-- ----------------------------
-- Records of member_electron_order
-- ----------------------------

-- ----------------------------
-- Table structure for rbac_node
-- ----------------------------
DROP TABLE IF EXISTS `rbac_node`;
CREATE TABLE `rbac_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '1' COMMENT '控制器',
  `action` varchar(20) NOT NULL DEFAULT '' COMMENT '动作',
  `controller` varchar(20) NOT NULL DEFAULT '' COMMENT '父节点名',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 （0：不生效，1：生效）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限节点表';

-- ----------------------------
-- Records of rbac_node
-- ----------------------------

-- ----------------------------
-- Table structure for rbac_node_group
-- ----------------------------
DROP TABLE IF EXISTS `rbac_node_group`;
CREATE TABLE `rbac_node_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `node_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '节点IDS，多个用，分割',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 （0：不生效，1：生效）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限节点组';

-- ----------------------------
-- Records of rbac_node_group
-- ----------------------------

-- ----------------------------
-- Table structure for rbac_parent_node
-- ----------------------------
DROP TABLE IF EXISTS `rbac_parent_node`;
CREATE TABLE `rbac_parent_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) NOT NULL COMMENT '动作名',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 （0：不生效，1：生效）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `controller` (`controller`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='动作管理表';

-- ----------------------------
-- Records of rbac_parent_node
-- ----------------------------

-- ----------------------------
-- Table structure for rbac_user
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `group_id` varchar(100) NOT NULL DEFAULT '-1' COMMENT '节点组ID (-1:超级管理员)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_user
-- ----------------------------

-- ----------------------------
-- Table structure for system_init_config
-- ----------------------------
DROP TABLE IF EXISTS `system_init_config`;
CREATE TABLE `system_init_config` (
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

-- ----------------------------
-- Records of system_init_config
-- ----------------------------

-- ----------------------------
-- Table structure for web_navi_menu
-- ----------------------------
DROP TABLE IF EXISTS `web_navi_menu`;
CREATE TABLE `web_navi_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父ID',
  `name` varchar(15) DEFAULT NULL COMMENT '名称',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 (1:有效，0:失效)',
  `sort` tinyint(3) DEFAULT '0' COMMENT '排序',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='前端主导航菜单管理';

-- ----------------------------
-- Records of web_navi_menu
-- ----------------------------
INSERT INTO `web_navi_menu` VALUES ('1', '0', '首页', 'Home/Index/index', '1', '95', '首页');
INSERT INTO `web_navi_menu` VALUES ('2', '0', '文章', 'Home/Index/index', '1', '90', '文章');
