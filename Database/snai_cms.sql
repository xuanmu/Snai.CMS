/*
Navicat MySQL Data Transfer

Source Server         : 本地mysql
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : snai_cms

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-11-29 17:02:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `last_logon_time` int(11) NOT NULL DEFAULT '0',
  `last_logon_ip` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `error_logon_time` int(11) NOT NULL DEFAULT '0',
  `error_logon_count` int(11) NOT NULL DEFAULT '0',
  `lock_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_admins_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'snai', '55F6E397AB652A987D12914F1766DA58', '1', '1', '1550937600', '0', '1575014602', '::1', '0', '0', '0');

-- ----------------------------
-- Table structure for cms_article_attach
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_attach`;
CREATE TABLE `cms_article_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_ext` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `down_num` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_article_attach
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_category`;
CREATE TABLE `cms_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_index` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `class_list` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_layer` int(11) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_lock` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_article_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_channel_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel_article`;
CREATE TABLE `cms_channel_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `call_index` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zhaiyao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `sort_id` int(11) NOT NULL,
  `click` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_msg` int(11) NOT NULL,
  `is_top` int(11) NOT NULL,
  `is_red` int(11) NOT NULL,
  `is_hot` int(11) NOT NULL,
  `is_slide` int(11) NOT NULL,
  `is_sys` int(11) NOT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_count` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_channel_article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_sites
-- ----------------------------
DROP TABLE IF EXISTS `cms_sites`;
CREATE TABLE `cms_sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `build_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templet_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qq` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crod` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `is_lock` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_sites
-- ----------------------------

-- ----------------------------
-- Table structure for cms_site_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_channel`;
CREATE TABLE `cms_site_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_comment` tinyint(4) DEFAULT NULL,
  `is_albums` tinyint(4) DEFAULT NULL,
  `is_attach` tinyint(4) DEFAULT NULL,
  `is_spec` tinyint(4) DEFAULT NULL,
  `is_contribute` tinyint(4) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `is_lock` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_site_channel
-- ----------------------------

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(32) CHARACTER SET utf8 NOT NULL,
  `controller` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `action` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '1',
  `state` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_modules_parent_id_title` (`parent_id`,`title`),
  KEY `ix_modules_controller_action` (`controller`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('1', '0', '首页', 'Home', 'Index', '1', '1');
INSERT INTO `modules` VALUES ('2', '1', '首页', '', '', '10', '1');
INSERT INTO `modules` VALUES ('3', '2', '登录信息', 'Home', 'LoginInfo', '11', '1');
INSERT INTO `modules` VALUES ('4', '2', '修改密码', 'Home', 'UpdatePassword', '12', '1');
INSERT INTO `modules` VALUES ('5', '0', '后台设置', 'BackManage', 'Index', '2', '1');
INSERT INTO `modules` VALUES ('6', '5', '管理员管理', '', '', '20', '1');
INSERT INTO `modules` VALUES ('7', '6', '账号管理', 'BackManage', 'AdminList', '21', '1');
INSERT INTO `modules` VALUES ('8', '7', '添加修改账号', 'BackManage', 'ModifyAdmin', '21', '1');
INSERT INTO `modules` VALUES ('9', '7', '禁启用账号', 'BackManage', 'UpdateAdminState', '21', '1');
INSERT INTO `modules` VALUES ('10', '7', '解锁账号', 'BackManage', 'UnlockAdmin', '21', '1');
INSERT INTO `modules` VALUES ('11', '7', '删除账号', 'BackManage', 'DeleteAdmin', '21', '1');
INSERT INTO `modules` VALUES ('12', '6', '菜单管理', 'BackManage', 'ModuleList', '22', '1');
INSERT INTO `modules` VALUES ('13', '12', '添加修改菜单', 'BackManage', 'ModifyModule', '22', '1');
INSERT INTO `modules` VALUES ('14', '12', '禁启用菜单', 'BackManage', 'UpdateModuleState', '22', '1');
INSERT INTO `modules` VALUES ('15', '12', '删除菜单', 'BackManage', 'DeleteModule', '22', '1');
INSERT INTO `modules` VALUES ('16', '6', '角色管理', 'BackManage', 'RoleList', '23', '1');
INSERT INTO `modules` VALUES ('17', '16', '添加修改角色', 'BackManage', 'ModifyRole', '23', '1');
INSERT INTO `modules` VALUES ('18', '16', '禁启用角色', 'BackManage', 'UpdateRoleState', '23', '1');
INSERT INTO `modules` VALUES ('19', '16', '删除角色', 'BackManage', 'DeleteRole', '23', '1');
INSERT INTO `modules` VALUES ('20', '16', '分配权限', 'BackManage', 'ModifyRoleRight', '23', '1');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_roles_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员', '1');

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_role_right_role_id_module_id` (`role_id`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_right
-- ----------------------------
INSERT INTO `role_right` VALUES ('1', '1', '1');
INSERT INTO `role_right` VALUES ('2', '1', '2');
INSERT INTO `role_right` VALUES ('3', '1', '3');
INSERT INTO `role_right` VALUES ('4', '1', '4');
INSERT INTO `role_right` VALUES ('5', '1', '5');
INSERT INTO `role_right` VALUES ('6', '1', '6');
INSERT INTO `role_right` VALUES ('7', '1', '7');
INSERT INTO `role_right` VALUES ('8', '1', '8');
INSERT INTO `role_right` VALUES ('9', '1', '9');
INSERT INTO `role_right` VALUES ('10', '1', '10');
INSERT INTO `role_right` VALUES ('11', '1', '11');
INSERT INTO `role_right` VALUES ('12', '1', '12');
INSERT INTO `role_right` VALUES ('13', '1', '13');
INSERT INTO `role_right` VALUES ('14', '1', '14');
INSERT INTO `role_right` VALUES ('15', '1', '15');
INSERT INTO `role_right` VALUES ('16', '1', '16');
INSERT INTO `role_right` VALUES ('17', '1', '17');
INSERT INTO `role_right` VALUES ('18', '1', '18');
INSERT INTO `role_right` VALUES ('19', '1', '19');
INSERT INTO `role_right` VALUES ('20', '1', '20');
