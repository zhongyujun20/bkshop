/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.105.129
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 192.168.105.129:3306
 Source Schema         : bkshop

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 15/09/2024 12:22:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '客户 ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `country_id` int(10) unsigned NOT NULL COMMENT '国家 ID',
  `zone_id` int(10) unsigned NOT NULL COMMENT '省份 ID',
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省份名称',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '城市 ID',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市名称',
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮编',
  `address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址1',
  `address_2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户地址表';

-- ----------------------------
-- Records of addresses
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_user_tokens
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_tokens`;
CREATE TABLE `admin_user_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `active` tinyint(1) NOT NULL COMMENT '是否启用',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '语言',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台管理员表';

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', 'admin@gmail.com', '$2y$10$d4qdLEP8.FeZl1nidvfZB.34o3CuK2a0Vt4iyhJncM2iKBKfxnN22', 1, 'zh_cn', '2024-08-03 23:23:37', '2024-08-03 23:27:10');
COMMIT;

-- ----------------------------
-- Table structure for attribute_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `attribute_descriptions`;
CREATE TABLE `attribute_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL COMMENT '属性 ID',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '语言',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id_locale` (`attribute_id`,`locale`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='属性描述表';

-- ----------------------------
-- Records of attribute_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `attribute_descriptions` VALUES (1, 1, 'zh_cn', '功能', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (2, 1, 'en', 'Features', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (3, 2, 'zh_cn', '面料', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (4, 2, 'en', 'Fabric', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (5, 3, 'zh_cn', '样式', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (6, 3, 'en', 'Style', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (7, 4, 'zh_cn', '缓震', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (8, 4, 'en', 'Cushioning', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (9, 5, 'zh_cn', 'CUP', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (10, 5, 'en', 'CUP', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (11, 6, 'zh_cn', '内存', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_descriptions` VALUES (12, 6, 'en', 'Memory', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for attribute_group_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group_descriptions`;
CREATE TABLE `attribute_group_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(10) unsigned NOT NULL COMMENT '属性组 ID',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '语言',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_group_id_locale` (`attribute_group_id`,`locale`),
  KEY `attribute_group_id` (`attribute_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='属性组描述表';

-- ----------------------------
-- Records of attribute_group_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `attribute_group_descriptions` VALUES (1, 1, 'zh_cn', '默认', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_group_descriptions` VALUES (2, 1, 'en', 'Default', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_group_descriptions` VALUES (3, 2, 'zh_cn', '衣服', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_group_descriptions` VALUES (4, 2, 'en', 'Clothing', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_group_descriptions` VALUES (5, 3, 'zh_cn', '运动户外', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_group_descriptions` VALUES (6, 3, 'en', 'Outdoor sport', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_group_descriptions` VALUES (7, 4, 'zh_cn', '数码', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_group_descriptions` VALUES (8, 4, 'en', 'Digital', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for attribute_groups
-- ----------------------------
DROP TABLE IF EXISTS `attribute_groups`;
CREATE TABLE `attribute_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='属性组表';

-- ----------------------------
-- Records of attribute_groups
-- ----------------------------
BEGIN;
INSERT INTO `attribute_groups` VALUES (1, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_groups` VALUES (2, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_groups` VALUES (3, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_groups` VALUES (4, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for attribute_value_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value_descriptions`;
CREATE TABLE `attribute_value_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_value_id` int(10) unsigned NOT NULL COMMENT '属性值 ID',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '语言',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_value_id_locale` (`attribute_value_id`,`locale`),
  KEY `attribute_value_id` (`attribute_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='属性值描述表';

-- ----------------------------
-- Records of attribute_value_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `attribute_value_descriptions` VALUES (1, 1, 'zh_cn', '棉', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (2, 1, 'en', 'Cotton', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (3, 2, 'zh_cn', '麻', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (4, 2, 'en', 'Numb', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (5, 5, 'en', 'Silk', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (6, 5, 'zh_cn', '丝', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (7, 6, 'en', 'Hair', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (8, 6, 'zh_cn', '毛', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (9, 7, 'zh_cn', '化纤', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (10, 7, 'en', 'Chemical fiber', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (11, 4, 'zh_cn', '圆领', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (12, 4, 'en', 'Round neck', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (13, 8, 'en', 'Collarless', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (14, 8, 'zh_cn', '无领', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (15, 9, 'en', 'Short sleeve', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (16, 9, 'zh_cn', '短袖', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (17, 10, 'zh_cn', 'T恤', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (18, 10, 'en', 'T-shirt', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (19, 3, 'zh_cn', '防水', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (20, 3, 'en', 'Water proof', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (21, 11, 'zh_cn', '保暖', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (22, 11, 'en', 'keep warm', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (23, 12, 'zh_cn', '防晒', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (24, 12, 'en', 'Sun protection', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (25, 13, 'zh_cn', 'Zoom气垫', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (26, 13, 'en', 'Zoom Air Cushion', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (27, 14, 'zh_cn', 'Max气垫', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (28, 14, 'en', 'Max Air Cushion', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (29, 15, 'zh_cn', 'Boost缓震材料', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (30, 15, 'en', 'Boost cushioning material', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (31, 16, 'zh_cn', 'Lightstrike科技', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (32, 16, 'en', 'Lightstrike Technology', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (33, 17, 'en', 'Fuel Cell Technology', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (34, 17, 'zh_cn', 'FuelCell科技', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (35, 18, 'zh_cn', 'i3', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (36, 18, 'en', 'i3', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (37, 19, 'zh_cn', 'i5', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (38, 19, 'en', 'i5', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (39, 20, 'zh_cn', 'i7', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (40, 20, 'en', 'i7', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (41, 21, 'zh_cn', 'i9', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (42, 21, 'en', 'i9', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (43, 22, 'zh_cn', 'DDR3', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (44, 22, 'en', 'DDR3', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (45, 23, 'zh_cn', 'DDR4', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_value_descriptions` VALUES (46, 23, 'en', 'DDR4', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL COMMENT '属性 ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='属性值表';

-- ----------------------------
-- Records of attribute_values
-- ----------------------------
BEGIN;
INSERT INTO `attribute_values` VALUES (1, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (2, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (3, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (4, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (5, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (6, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (7, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (8, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (9, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (10, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (11, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (12, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (13, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (14, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (15, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (16, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (17, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (18, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (19, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (20, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (21, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (22, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attribute_values` VALUES (23, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(10) unsigned NOT NULL COMMENT '属性组 ID',
  `sort_order` int(11) NOT NULL COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_group_id` (`attribute_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='属性表';

-- ----------------------------
-- Records of attributes
-- ----------------------------
BEGIN;
INSERT INTO `attributes` VALUES (1, 2, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attributes` VALUES (2, 2, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attributes` VALUES (3, 2, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attributes` VALUES (4, 3, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attributes` VALUES (5, 4, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `attributes` VALUES (6, 4, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `first` char(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '首字母',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图标',
  `sort_order` int(11) NOT NULL COMMENT '排序',
  `status` int(11) NOT NULL COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品品牌';

-- ----------------------------
-- Records of brands
-- ----------------------------
BEGIN;
INSERT INTO `brands` VALUES (1, 'New Balance', 'B', 'catalog/demo/brands/1.png', 1, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (2, 'BROOKS', 'B', 'catalog/demo/brands/10.png', 2, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (3, 'Columbia', 'C', 'catalog/demo/brands/11.png', 3, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (4, 'RayBan', 'R', 'catalog/demo/brands/12.png', 4, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (5, 'PUMA', 'P', 'catalog/demo/brands/2.png', 5, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (6, 'HERMES', 'H', 'catalog/demo/brands/3.png', 6, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (7, 'Dior', 'D', 'catalog/demo/brands/4.png', 7, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (8, 'NIKE', 'N', 'catalog/demo/brands/5.png', 8, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (9, 'FILA', 'F', 'catalog/demo/brands/7.png', 9, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (10, 'Adidas', 'A', 'catalog/demo/brands/9.png', 10, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (11, 'American Eagle', 'A', 'catalog/demo/brands/8.png', 11, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `brands` VALUES (12, 'Tommy Hilfiger', 'T', 'catalog/demo/brands/6.png', 12, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for cart_products
-- ----------------------------
DROP TABLE IF EXISTS `cart_products`;
CREATE TABLE `cart_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_id` int(11) NOT NULL COMMENT '客户 ID',
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '当前用户会话 ID',
  `selected` tinyint(1) NOT NULL COMMENT '是否选中',
  `product_id` int(11) NOT NULL COMMENT '产品 ID',
  `product_sku` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品 SKU ID',
  `quantity` int(10) unsigned NOT NULL COMMENT '购买数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  KEY `product_sku_id` (`product_sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车产品明细';

-- ----------------------------
-- Records of cart_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_id` int(11) NOT NULL COMMENT '客户 ID',
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '当前用户会话 ID',
  `shipping_address_id` int(11) NOT NULL COMMENT '配送地址 ID',
  `guest_shipping_address` json DEFAULT NULL COMMENT '游客配送地址',
  `shipping_method_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送方式 Code',
  `payment_address_id` int(11) NOT NULL COMMENT '发票地址 ID',
  `guest_payment_address` json DEFAULT NULL COMMENT '游客发票地址',
  `payment_method_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付方式 Code',
  `extra` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `shipping_address_id` (`shipping_address_id`),
  KEY `payment_address_id` (`payment_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车';

-- ----------------------------
-- Records of carts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `active` tinyint(1) NOT NULL COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品分类';

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (100002, 100007, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100003, 0, '', 1, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100004, 100007, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100005, 0, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100006, 0, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100007, 0, '', 9, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100008, 100006, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100010, 0, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100011, 100010, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100012, 0, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100013, 100010, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100014, 100010, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100015, 100013, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100016, 100014, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100017, 100018, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `categories` VALUES (100018, 0, '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for category_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `category_descriptions`;
CREATE TABLE `category_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` bigint(20) unsigned NOT NULL COMMENT '分类 ID',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'meta 标题',
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'meta 描述',
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'meta 关键词',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品分类名称、描述等详情';

-- ----------------------------
-- Records of category_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `category_descriptions` VALUES (1, 100002, 'zh_cn', '平板耳机', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (2, 100002, 'en', 'Pad', 'Pad', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (3, 100003, 'zh_cn', '时尚潮流', '时尚潮流', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (4, 100003, 'en', 'Fashion', 'Fashion', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (5, 100004, 'zh_cn', '相机', '相机', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (6, 100004, 'en', 'Camera', 'Camera', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (7, 100005, 'zh_cn', '特价购买', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (8, 100005, 'en', 'Special', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (9, 100006, 'zh_cn', '运动户外', '运动户外', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (10, 100006, 'en', 'Sports', 'Sports', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (11, 100007, 'zh_cn', '电子数码', '电子数码', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (12, 100007, 'en', 'Electron', 'Electron', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (13, 100008, 'zh_cn', '帐篷', '帐篷', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (14, 100008, 'en', 'Tent', 'Tent', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (15, 100010, 'zh_cn', '男装女装', '男装女装', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (16, 100010, 'en', 'Clothes', 'Fashion', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (17, 100011, 'zh_cn', '男装', '男装', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (18, 100011, 'en', 'Men', 'Men', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (19, 100012, 'zh_cn', '夏季促销', '夏季促销', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (20, 100012, 'en', 'Summer Promotion', 'Summer promotion', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (21, 100013, 'zh_cn', '上装', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (22, 100013, 'en', 'Top', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (23, 100014, 'zh_cn', '下装', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (24, 100014, 'en', 'Bottom', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (25, 100015, 'zh_cn', '棉衣', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (26, 100015, 'en', 'Cotton', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (27, 100016, 'zh_cn', '棉毛裤', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (28, 100016, 'en', 'Cotton Pants', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (29, 100017, 'zh_cn', '智能冰箱', '智能冰箱', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (30, 100017, 'en', 'IceBox', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (31, 100018, 'zh_cn', '家用电器', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_descriptions` VALUES (32, 100018, 'en', 'Electric', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for category_paths
-- ----------------------------
DROP TABLE IF EXISTS `category_paths`;
CREATE TABLE `category_paths` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` bigint(20) unsigned NOT NULL COMMENT '分类 ID',
  `path_id` bigint(20) unsigned NOT NULL COMMENT '分类路径 ID',
  `level` int(11) NOT NULL COMMENT '层级',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `path_id` (`path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品分类上下级关系';

-- ----------------------------
-- Records of category_paths
-- ----------------------------
BEGIN;
INSERT INTO `category_paths` VALUES (1, 100003, 100003, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (2, 100005, 100005, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (3, 100006, 100006, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (4, 100008, 100006, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (5, 100008, 100008, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (6, 100007, 100007, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (7, 100002, 100007, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (8, 100002, 100002, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (9, 100004, 100007, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (10, 100004, 100004, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (11, 100010, 100010, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (12, 100011, 100010, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (13, 100011, 100011, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (14, 100013, 100010, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (15, 100013, 100013, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (16, 100015, 100010, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (17, 100015, 100013, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (18, 100015, 100015, 2, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (19, 100014, 100010, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (20, 100014, 100014, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (21, 100016, 100010, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (22, 100016, 100014, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (23, 100016, 100016, 2, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (24, 100012, 100012, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (25, 100018, 100018, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (26, 100017, 100018, 0, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `category_paths` VALUES (27, 100017, 100017, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码',
  `continent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所属大洲',
  `sort_order` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='国家';

-- ----------------------------
-- Records of countries
-- ----------------------------
BEGIN;
INSERT INTO `countries` VALUES (1, 'Afghanistan', 'AF', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (2, 'Albania', 'AL', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (3, 'Algeria', 'DZ', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (4, 'American Samoa', 'AS', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (5, 'Andorra', 'AD', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (6, 'Angola', 'AO', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (7, 'Anguilla', 'AI', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (8, 'Antarctica', 'AQ', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (9, 'Antigua and Barbuda', 'AG', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (10, 'Argentina', 'AR', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (11, 'Armenia', 'AM', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (12, 'Aruba', 'AW', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (13, 'Australia', 'AU', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (14, 'Austria', 'AT', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (15, 'Azerbaijan', 'AZ', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (16, 'Bahamas', 'BS', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (17, 'Bahrain', 'BH', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (18, 'Bangladesh', 'BD', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (19, 'Barbados', 'BB', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (20, 'Belarus', 'BY', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (21, 'Belgium', 'BE', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (22, 'Belize', 'BZ', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (23, 'Benin', 'BJ', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (24, 'Bermuda', 'BM', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (25, 'Bhutan', 'BT', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (26, 'Bolivia', 'BO', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (27, 'Bosnia and Herzegovina', 'BA', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (28, 'Botswana', 'BW', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (29, 'Bouvet Island', 'BV', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (30, 'Brazil', 'BR', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (31, 'British Indian Ocean Territory', 'IO', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (32, 'Brunei Darussalam', 'BN', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (33, 'Bulgaria', 'BG', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (34, 'Burkina Faso', 'BF', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (35, 'Burundi', 'BI', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (36, 'Cambodia', 'KH', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (37, 'Cameroon', 'CM', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (38, 'Canada', 'CA', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (39, 'Cape Verde', 'CV', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (40, 'Cayman Islands', 'KY', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (41, 'Central African Republic', 'CF', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (42, 'Chad', 'TD', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (43, 'Chile', 'CL', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (44, '中国', 'CN', 'AS', -1, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (45, 'Christmas Island', 'CX', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (46, 'Cocos (Keeling) Islands', 'CC', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (47, 'Colombia', 'CO', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (48, 'Comoros', 'KM', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (49, 'Congo', 'CG', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (50, 'Cook Islands', 'CK', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (51, 'Costa Rica', 'CR', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (52, 'Cote D\'Ivoire', 'CI', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (53, 'Croatia', 'HR', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (54, 'Cuba', 'CU', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (55, 'Cyprus', 'CY', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (56, 'Czech Republic', 'CZ', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (57, 'Denmark', 'DK', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (58, 'Djibouti', 'DJ', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (59, 'Dominica', 'DM', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (60, 'Dominican Republic', 'DO', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (61, 'East Timor', 'TL', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (62, 'Ecuador', 'EC', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (63, 'Egypt', 'EG', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (64, 'El Salvador', 'SV', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (65, 'Equatorial Guinea', 'GQ', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (66, 'Eritrea', 'ER', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (67, 'Estonia', 'EE', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (68, 'Ethiopia', 'ET', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (69, 'Falkland Islands (Malvinas)', 'FK', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (70, 'Faroe Islands', 'FO', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (71, 'Fiji', 'FJ', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (72, 'Finland', 'FI', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (74, 'France, Metropolitan', 'FR', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (75, 'French Guiana', 'GF', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (76, 'French Polynesia', 'PF', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (77, 'French Southern Territories', 'TF', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (78, 'Gabon', 'GA', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (79, 'Gambia', 'GM', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (80, 'Georgia', 'GE', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (81, 'Germany', 'DE', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (82, 'Ghana', 'GH', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (83, 'Gibraltar', 'GI', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (84, 'Greece', 'GR', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (85, 'Greenland', 'GL', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (86, 'Grenada', 'GD', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (87, 'Guadeloupe', 'GP', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (88, 'Guam', 'GU', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (89, 'Guatemala', 'GT', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (90, 'Guinea', 'GN', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (91, 'Guinea-Bissau', 'GW', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (92, 'Guyana', 'GY', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (93, 'Haiti', 'HT', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (94, 'Heard and Mc Donald Islands', 'HM', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (95, 'Honduras', 'HN', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (97, 'Hungary', 'HU', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (98, 'Iceland', 'IS', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (99, 'India', 'IN', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (100, 'Indonesia', 'ID', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (101, 'Iran (Islamic Republic of)', 'IR', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (102, 'Iraq', 'IQ', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (103, 'Ireland', 'IE', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (104, 'Israel', 'IL', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (105, 'Italy', 'IT', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (106, 'Jamaica', 'JM', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (107, 'Japan', 'JP', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (108, 'Jordan', 'JO', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (109, 'Kazakhstan', 'KZ', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (110, 'Kenya', 'KE', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (111, 'Kiribati', 'KI', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (112, 'North Korea', 'KP', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (113, 'South Korea', 'KR', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (114, 'Kuwait', 'KW', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (115, 'Kyrgyzstan', 'KG', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (116, 'Lao People\'s Democratic Republic', 'LA', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (117, 'Latvia', 'LV', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (118, 'Lebanon', 'LB', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (119, 'Lesotho', 'LS', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (120, 'Liberia', 'LR', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (121, 'Libyan Arab Jamahiriya', 'LY', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (122, 'Liechtenstein', 'LI', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (123, 'Lithuania', 'LT', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (124, 'Luxembourg', 'LU', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (126, 'FYROM', 'MK', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (127, 'Madagascar', 'MG', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (128, 'Malawi', 'MW', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (129, 'Malaysia', 'MY', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (130, 'Maldives', 'MV', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (131, 'Mali', 'ML', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (132, 'Malta', 'MT', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (133, 'Marshall Islands', 'MH', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (134, 'Martinique', 'MQ', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (135, 'Mauritania', 'MR', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (136, 'Mauritius', 'MU', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (137, 'Mayotte', 'YT', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (138, 'Mexico', 'MX', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (139, 'Micronesia, Federated States of', 'FM', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (140, 'Moldova, Republic of', 'MD', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (141, 'Monaco', 'MC', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (142, 'Mongolia', 'MN', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (143, 'Montserrat', 'MS', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (144, 'Morocco', 'MA', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (145, 'Mozambique', 'MZ', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (146, 'Myanmar', 'MM', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (147, 'Namibia', 'NA', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (148, 'Nauru', 'NR', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (149, 'Nepal', 'NP', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (150, 'Netherlands', 'NL', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (151, 'Netherlands Antilles', 'AN', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (152, 'New Caledonia', 'NC', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (153, 'New Zealand', 'NZ', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (154, 'Nicaragua', 'NI', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (155, 'Niger', 'NE', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (156, 'Nigeria', 'NG', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (157, 'Niue', 'NU', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (158, 'Norfolk Island', 'NF', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (159, 'Northern Mariana Islands', 'MP', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (160, 'Norway', 'NO', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (161, 'Oman', 'OM', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (162, 'Pakistan', 'PK', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (163, 'Palau', 'PW', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (164, 'Panama', 'PA', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (165, 'Papua New Guinea', 'PG', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (166, 'Paraguay', 'PY', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (167, 'Peru', 'PE', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (168, 'Philippines', 'PH', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (169, 'Pitcairn', 'PN', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (170, 'Poland', 'PL', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (171, 'Portugal', 'PT', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (172, 'Puerto Rico', 'PR', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (173, 'Qatar', 'QA', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (174, 'Reunion', 'RE', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (175, 'Romania', 'RO', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (176, 'Russian Federation', 'RU', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (177, 'Rwanda', 'RW', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (178, 'Saint Kitts and Nevis', 'KN', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (179, 'Saint Lucia', 'LC', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (180, 'Saint Vincent and the Grenadines', 'VC', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (181, 'Samoa', 'WS', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (182, 'San Marino', 'SM', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (183, 'Sao Tome and Principe', 'ST', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (184, 'Saudi Arabia', 'SA', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (185, 'Senegal', 'SN', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (186, 'Seychelles', 'SC', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (187, 'Sierra Leone', 'SL', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (188, 'Singapore', 'SG', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (189, 'Slovak Republic', 'SK', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (190, 'Slovenia', 'SI', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (191, 'Solomon Islands', 'SB', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (192, 'Somalia', 'SO', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (193, 'South Africa', 'ZA', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (195, 'Spain', 'ES', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (196, 'Sri Lanka', 'LK', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (197, 'St. Helena', 'SH', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (198, 'St. Pierre and Miquelon', 'PM', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (199, 'Sudan', 'SD', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (200, 'Suriname', 'SR', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (201, 'Svalbard and Jan Mayen Islands', 'SJ', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (202, 'Swaziland', 'SZ', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (203, 'Sweden', 'SE', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (204, 'Switzerland', 'CH', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (205, 'Syrian Arab Republic', 'SY', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (207, 'Tajikistan', 'TJ', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (208, 'Tanzania, United Republic of', 'TZ', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (209, 'Thailand', 'TH', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (210, 'Togo', 'TG', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (211, 'Tokelau', 'TK', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (212, 'Tonga', 'TO', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (213, 'Trinidad and Tobago', 'TT', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (214, 'Tunisia', 'TN', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (215, 'Turkey', 'TR', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (216, 'Turkmenistan', 'TM', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (217, 'Turks and Caicos Islands', 'TC', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (218, 'Tuvalu', 'TV', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (219, 'Uganda', 'UG', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (220, 'Ukraine', 'UA', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (221, 'United Arab Emirates', 'AE', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (222, 'United Kingdom', 'GB', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (223, 'United States', 'US', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (224, 'United States Minor Outlying Islands', 'UM', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (225, 'Uruguay', 'UY', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (226, 'Uzbekistan', 'UZ', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (227, 'Vanuatu', 'VU', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (228, 'Vatican City State (Holy See)', 'VA', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (229, 'Venezuela', 'VE', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (230, 'Viet Nam', 'VN', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (231, 'Virgin Islands (British)', 'VG', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (232, 'Virgin Islands (U.S.)', 'VI', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (233, 'Wallis and Futuna Islands', 'WF', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (234, 'Western Sahara', 'EH', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (235, 'Yemen', 'YE', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (237, 'Democratic Republic of Congo', 'CD', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (238, 'Zambia', 'ZM', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (239, 'Zimbabwe', 'ZW', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (242, 'Montenegro', 'ME', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (243, 'Serbia', 'RS', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (244, 'Aaland Islands', 'AX', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (246, 'Curacao', 'CW', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (247, 'Palestinian Territory, Occupied', 'PS', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (248, 'South Sudan', 'SS', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (249, 'St. Barthelemy', 'BL', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (250, 'St. Martin (French part)', 'MF', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (251, 'Canary Islands', 'IC', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (252, 'Ascension Island (British)', 'AC', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (253, 'Kosovo, Republic of', 'XK', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (254, 'Isle of Man', 'IM', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (255, 'Tristan da Cunha', 'TA', 'none', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (256, 'Guernsey', 'GG', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `countries` VALUES (257, 'Jersey', 'JE', 'EU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码',
  `symbol_left` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '左标识, 比如 $ ￥',
  `symbol_right` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '右标识, 比如 $ ￥',
  `decimal_place` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小数位数',
  `value` double(15,8) NOT NULL COMMENT '默认货币相对当前货币汇率',
  `status` tinyint(4) NOT NULL COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='货币';

-- ----------------------------
-- Records of currencies
-- ----------------------------
BEGIN;
INSERT INTO `currencies` VALUES (1, '人民币', 'CNY', '￥', '', '2', 7.11210000, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `currencies` VALUES (2, 'USD', 'USD', '$', '', '2', 1.00000000, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `currencies` VALUES (3, '欧元', 'EUR', '€', '', '2', 0.97900000, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for customer_group_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `customer_group_descriptions`;
CREATE TABLE `customer_group_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT '客户组 ID',
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言',
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_group_id` (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户组名称、描述';

-- ----------------------------
-- Records of customer_group_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `customer_group_descriptions` VALUES (1, 1, 'zh_cn', '白银', '白银组', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `customer_group_descriptions` VALUES (2, 1, 'en', 'Silver', 'Silver Group', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `customer_group_descriptions` VALUES (3, 2, 'zh_cn', '黄金', '黄金组', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `customer_group_descriptions` VALUES (4, 2, 'en', 'Golden', 'Golden Group', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE `customer_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `total` decimal(12,4) NOT NULL COMMENT '最低消费额度',
  `reward_point_factor` decimal(12,4) NOT NULL COMMENT '奖励积分系数',
  `use_point_factor` decimal(12,4) NOT NULL COMMENT '使用积分系数',
  `discount_factor` decimal(12,4) NOT NULL COMMENT '优惠折扣系数',
  `level` int(11) NOT NULL COMMENT '等级',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户组';

-- ----------------------------
-- Records of customer_groups
-- ----------------------------
BEGIN;
INSERT INTO `customer_groups` VALUES (1, 100.0000, 2.0000, 2.0000, 2.0000, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `customer_groups` VALUES (2, 200.0000, 2.0000, 2.0000, 2.0000, 2, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for customer_wishlists
-- ----------------------------
DROP TABLE IF EXISTS `customer_wishlists`;
CREATE TABLE `customer_wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '客户 ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '产品 ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户收藏夹';

-- ----------------------------
-- Records of customer_wishlists
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved' COMMENT '审核状态',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT '用户组 ID',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认地址 ID',
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '找回密码 code',
  `from` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册来源',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户';

-- ----------------------------
-- Records of customers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '唯一ID',
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接',
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '队列',
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行数据',
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常',
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='队列失败任务';

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码',
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器语言标识',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言图标',
  `sort_order` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='语言';

-- ----------------------------
-- Records of languages
-- ----------------------------
BEGIN;
INSERT INTO `languages` VALUES (1, '中文', 'zh_cn', '', 'catalog/favicon.png', 1, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `languages` VALUES (2, 'English', 'en', '', 'catalog/demo/services-icon/3.png', 1, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (2, '2021_12_26_111435_create_tables', 1);
INSERT INTO `migrations` VALUES (3, '2022_08_01_033755_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (4, '2022_12_16_095559_create_order_shipments', 1);
INSERT INTO `migrations` VALUES (5, '2022_12_22_022326_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (6, '2022_12_22_061843_order_add_field', 1);
INSERT INTO `migrations` VALUES (7, '2022_12_28_171057_alter_cart_table', 1);
INSERT INTO `migrations` VALUES (8, '2022_12_30_110019_create_product_related', 1);
INSERT INTO `migrations` VALUES (9, '2022_12_30_165725_guest_checkout', 1);
INSERT INTO `migrations` VALUES (10, '2023_01_03_111459_product_attribute', 1);
INSERT INTO `migrations` VALUES (11, '2023_01_06_104545_change_meta_keywords', 1);
INSERT INTO `migrations` VALUES (12, '2023_01_10_115702_add_sales2_product', 1);
INSERT INTO `migrations` VALUES (13, '2023_02_09_021051_create_page_category', 1);
INSERT INTO `migrations` VALUES (14, '2023_03_20_091423_product_weight', 1);
INSERT INTO `migrations` VALUES (15, '2023_04_20_013537_create_admin_user_tokens', 1);
INSERT INTO `migrations` VALUES (16, '2023_05_11_055643_create_order_payments', 1);
INSERT INTO `migrations` VALUES (17, '2023_08_17_030409_add_category_image', 1);
INSERT INTO `migrations` VALUES (18, '2023_08_25_091143_add_order_comment', 1);
INSERT INTO `migrations` VALUES (19, '2023_09_07_094009_add_page_image', 1);
INSERT INTO `migrations` VALUES (20, '2023_09_13_023955_update_product_video', 1);
INSERT INTO `migrations` VALUES (21, '2023_09_14_021228_product_shipping', 1);
INSERT INTO `migrations` VALUES (22, '2023_11_29_074502_create_product_views', 1);
INSERT INTO `migrations` VALUES (23, '2023_11_30_094209_add_approved_to_customer', 1);
INSERT INTO `migrations` VALUES (24, '2023_12_05_065322_add_country_continent', 1);
INSERT INTO `migrations` VALUES (25, '2024_01_04_090506_update_cart_sku', 1);
INSERT INTO `migrations` VALUES (26, '2024_01_24_145803_add_field_images_to_rma', 1);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '权限 ID',
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模型类型',
  `model_id` bigint(20) unsigned NOT NULL COMMENT '模型 ID',
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型权限';

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色 ID',
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模型类型',
  `model_id` bigint(20) unsigned NOT NULL COMMENT '模型 ID',
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型角色';

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'UUID',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知数据',
  `read_at` timestamp NULL DEFAULT NULL COMMENT '打开时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
BEGIN;
INSERT INTO `notifications` VALUES ('764f2236-69ba-47f5-a3eb-375de2e1f368', 'Beike\\Notifications\\NewOrderNotification', 'Beike\\Models\\Order', 1, '{\"order\":{\"id\":1,\"number\":\"2024080497625\",\"customer_id\":0,\"customer_group_id\":0,\"shipping_address_id\":0,\"payment_address_id\":0,\"customer_name\":\"\",\"email\":\"aaa@gmail.com\",\"calling_code\":0,\"telephone\":\"\",\"total\":\"1098.9000\",\"locale\":\"en\",\"currency_code\":\"USD\",\"currency_value\":\"1\",\"ip\":\"192.168.105.1\",\"user_agent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.6 Mobile\\/15E148 Safari\\/604.1\",\"comment\":\"\",\"status\":\"unpaid\",\"shipping_method_code\":\"flat_shipping.0\",\"shipping_method_name\":\"Flat Rate Shipping\",\"shipping_customer_name\":\"aa\",\"shipping_calling_code\":\"0\",\"shipping_telephone\":\"\",\"shipping_country\":\"\\u4e2d\\u56fd\",\"shipping_country_id\":44,\"shipping_zone_id\":710,\"shipping_zone\":\"\\u56db\\u5ddd\\u7701\",\"shipping_city\":\"dd\",\"shipping_address_1\":\"aaa\",\"shipping_address_2\":\"\",\"shipping_zipcode\":\"\",\"payment_method_code\":\"paypal\",\"payment_method_name\":\"PayPal\",\"payment_customer_name\":\"aa\",\"payment_calling_code\":\"0\",\"payment_telephone\":\"\",\"payment_country\":\"\\u4e2d\\u56fd\",\"payment_country_id\":44,\"payment_zone_id\":710,\"payment_zone\":\"\\u56db\\u5ddd\\u7701\",\"payment_city\":\"dd\",\"payment_address_1\":\"aaa\",\"payment_address_2\":\"\",\"payment_zipcode\":\"\",\"created_at\":\"2024-08-04 07:26:22\",\"updated_at\":\"2024-08-04 07:26:22\",\"deleted_at\":null,\"status_format\":\"Unpaid\",\"total_format\":\"$1,098.90\"}}', NULL, '2024-08-03 23:26:22', '2024-08-03 23:26:22');
COMMIT;

-- ----------------------------
-- Table structure for order_histories
-- ----------------------------
DROP TABLE IF EXISTS `order_histories`;
CREATE TABLE `order_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(11) NOT NULL COMMENT '订单 ID',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单变更状态',
  `notify` tinyint(1) NOT NULL COMMENT '是否通知',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变更备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单状态变更历史';

-- ----------------------------
-- Records of order_histories
-- ----------------------------
BEGIN;
INSERT INTO `order_histories` VALUES (1, 1, 'unpaid', 1, '', '2024-08-03 23:26:22', '2024-08-03 23:26:22');
COMMIT;

-- ----------------------------
-- Table structure for order_payments
-- ----------------------------
DROP TABLE IF EXISTS `order_payments`;
CREATE TABLE `order_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `callback` text COLLATE utf8mb4_unicode_ci,
  `receipt` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_payments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_products
-- ----------------------------
DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(11) NOT NULL COMMENT '订单 ID',
  `product_id` int(11) NOT NULL COMMENT '产品 ID',
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `product_sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品 SKU',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品图片',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `price` decimal(16,4) NOT NULL COMMENT '单价',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单产品明细';

-- ----------------------------
-- Records of order_products
-- ----------------------------
BEGIN;
INSERT INTO `order_products` VALUES (1, 1, 5, '2024080497625', 'sku273', 'High sense men\'s summer fashion brand American vintage short sleeve T-shirt men', 'catalog/demo/product/4.jpg', 1, 999.0000, '2024-08-03 23:26:22', '2024-08-03 23:26:22', NULL);
COMMIT;

-- ----------------------------
-- Table structure for order_shipments
-- ----------------------------
DROP TABLE IF EXISTS `order_shipments`;
CREATE TABLE `order_shipments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `express_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司编码',
  `express_company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司名称',
  `express_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运单号',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_shipments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_totals
-- ----------------------------
DROP TABLE IF EXISTS `order_totals`;
CREATE TABLE `order_totals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(11) NOT NULL COMMENT '订单 ID',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型编码',
  `value` decimal(8,2) NOT NULL COMMENT '金额',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `reference` json NOT NULL COMMENT '附加信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单金额构成';

-- ----------------------------
-- Records of order_totals
-- ----------------------------
BEGIN;
INSERT INTO `order_totals` VALUES (1, 1, 'sub_total', 999.00, 'Product Total', '\"\"', '2024-08-03 23:26:22', '2024-08-03 23:26:22');
INSERT INTO `order_totals` VALUES (2, 1, 'shipping', 99.90, 'Shipping Fee', '\"\"', '2024-08-03 23:26:22', '2024-08-03 23:26:22');
INSERT INTO `order_totals` VALUES (3, 1, 'order_total', 1098.90, 'Order Total', '\"\"', '2024-08-03 23:26:22', '2024-08-03 23:26:22');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `customer_id` int(11) NOT NULL COMMENT '客户 ID',
  `customer_group_id` int(11) NOT NULL COMMENT '客户组 ID',
  `shipping_address_id` int(11) NOT NULL COMMENT '配送地址 ID',
  `payment_address_id` int(11) NOT NULL COMMENT '发票地址 ID',
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户名称',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户 Email',
  `calling_code` int(11) NOT NULL COMMENT '电话区号',
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话号码',
  `total` decimal(16,4) NOT NULL COMMENT '总金额',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言',
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '当前货币',
  `currency_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '当前汇率',
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下单时 IP',
  `user_agent` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下单时浏览器信息',
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '客户备注',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单状态',
  `shipping_method_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送方式编码',
  `shipping_method_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送方式名称',
  `shipping_customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址姓名',
  `shipping_calling_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址电话区号',
  `shipping_telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址电话号码',
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址国家',
  `shipping_country_id` int(10) unsigned NOT NULL COMMENT '国家id',
  `shipping_zone_id` int(10) unsigned NOT NULL COMMENT '省份ID',
  `shipping_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址省份',
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址城市',
  `shipping_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址详情1',
  `shipping_address_2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址详情2',
  `shipping_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送地址邮编',
  `payment_method_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付方式编码',
  `payment_method_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付方式名称',
  `payment_customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址姓名',
  `payment_calling_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址电话区号',
  `payment_telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址电话号码',
  `payment_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址国家',
  `payment_country_id` int(10) unsigned NOT NULL COMMENT '国家id',
  `payment_zone_id` int(10) unsigned NOT NULL COMMENT '省份ID',
  `payment_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址省份',
  `payment_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址城市',
  `payment_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址详情1',
  `payment_address_2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址详情1',
  `payment_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票地址邮编',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `shipping_address_id` (`shipping_address_id`),
  KEY `payment_address_id` (`payment_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单';

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (1, '2024080497625', 0, 0, 0, 0, '', 'aaa@gmail.com', 0, '', 1098.9000, 'en', 'USD', '1', '192.168.105.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '', 'unpaid', 'flat_shipping.0', 'Flat Rate Shipping', 'aa', '0', '', '中国', 44, 710, '四川省', 'dd', 'aaa', '', '', 'paypal', 'PayPal', 'aa', '0', '', '中国', 44, 710, '四川省', 'dd', 'aaa', '', '', '2024-08-03 23:26:22', '2024-08-03 23:26:22', NULL);
COMMIT;

-- ----------------------------
-- Table structure for page_categories
-- ----------------------------
DROP TABLE IF EXISTS `page_categories`;
CREATE TABLE `page_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(11) NOT NULL COMMENT 'parent_id',
  `position` int(11) NOT NULL COMMENT '排序',
  `active` tinyint(1) NOT NULL COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章分类';

-- ----------------------------
-- Records of page_categories
-- ----------------------------
BEGIN;
INSERT INTO `page_categories` VALUES (1, 0, 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_categories` VALUES (2, 0, 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_categories` VALUES (3, 0, 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_categories` VALUES (4, 0, 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_categories` VALUES (5, 0, 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_categories` VALUES (6, 0, 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for page_category_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `page_category_descriptions`;
CREATE TABLE `page_category_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `page_category_id` int(11) NOT NULL COMMENT '分类 ID',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类简介',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meta 标题',
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meta 描述',
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meta 关键字',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_category_id` (`page_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章分类描述';

-- ----------------------------
-- Records of page_category_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `page_category_descriptions` VALUES (1, 1, 'zh_cn', '公司新闻', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (2, 1, 'en', 'News', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (3, 2, 'zh_cn', '行业新闻', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (4, 2, 'en', 'Industry News', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (5, 3, 'zh_cn', '聚焦热点', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (6, 3, 'en', 'Focus on hot spots', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (7, 4, 'zh_cn', '时尚潮流', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (8, 4, 'en', 'Fashion', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (9, 5, 'zh_cn', '顶尖设计', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (10, 5, 'en', 'Top design', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (11, 6, 'zh_cn', '尖货大卖', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_category_descriptions` VALUES (12, 6, 'en', 'Good Deals', '', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for page_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `page_descriptions`;
CREATE TABLE `page_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `page_id` int(11) NOT NULL COMMENT '单页 ID',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `summary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章摘要',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meta 标题',
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meta 描述',
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meta 关键字',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单页名称、描述等详情';

-- ----------------------------
-- Records of page_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `page_descriptions` VALUES (55, 18, 'en', 'Distribution information', '', '<p><span style=\"color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff;\">Delivery Information</span></p>', '', '', '', '2022-08-11 17:19:03', '2022-08-11 17:19:03');
INSERT INTO `page_descriptions` VALUES (56, 18, 'zh_cn', '配送信息', '', '<p><span style=\"color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff;\">Delivery Information</span></p>', '', '', '', '2022-08-11 17:19:03', '2022-08-11 17:19:03');
INSERT INTO `page_descriptions` VALUES (63, 12, 'en', 'Privacy policy', '', '<h1 style=\"box-sizing: border-box; font-size: 24px; margin: 0px 0px 18px; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-weight: 500; line-height: 1.1; color: #333333; background-color: #ffffff; outline: none !important;\">Privacy policy</h1>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">1、 Collection and use of personal information</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">When you use Everbright mall services, we may ask you to provide personal information. Everbright mall will use this information in accordance with this privacy policy. You do not have to provide the personal information we require, but in many cases, if you choose not to provide it, we will not be able to provide you with our products or services or respond to any problems you encounter.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">The following provides some examples of the types of personal information that Everbright mall may collect and how we use such information:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">2、 What personal information do we collect</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">When you create an account, buy products, download software updates and contact us, we may collect various information, including your name, mailing address, telephone number, e-mail address, contact information and preferences.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">When you use Everbright mall to purchase goods or gift cards, Everbright mall may collect information related to the above persons provided by you, such as name, mailing address, e-mail address and telephone number. Everbright mall will use this information to meet your requirements, provide relevant products or services, or achieve anti fraud purposes.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">In some jurisdictions, for the purpose of complying with the law, we may require users to provide identification issued by the government, but only in a few cases, such as customs declaration.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">4、 How do we use your personal information</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We will inform you of the latest product release, software update and activity forecast in time. If you don\'t want to be on our mailing list, you can opt out at any time by updating your preferences.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We may use your personal information (such as email address or mobile phone number) to verify and determine the user\'s identity.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We may use personal information to send important notices, such as order information about purchases. Since this information is very important for your communication with the mall, you cannot refuse to receive such information.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We will also use personal information for internal purposes such as audit, data analysis and research to improve Everbright mall\'s products, services and communication with customers.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">5、 Collection and use of non personal information</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We will also collect and use data that cannot be directly linked to any particular individual by itself. We may collect, use, transfer and disclose non personal information for any purpose. Below are some examples of non personal information we may collect and how we use it.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We will collect information such as occupation, language, zip code, area code, unique device identifier, referral URL, location and time zone when users use the product, so that we can better understand customers\' behavior and improve our products, services and advertising.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We collect information about our customers\' activities on our website. We will summarize such information to help us provide customers with more useful information and understand which parts of our website, products and services customers are most interested in. For the purposes of this privacy policy, aggregated data is considered non personal information.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We may collect and store detailed information about how you use our services, including search queries. Such information may be used to improve the results of our service delivery and make it more relevant. Such information usually does not involve your IP address, except for the following few cases: we need to ensure the quality of services provided through the Internet.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">6、 Cookies and other technologies</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">Everbright mall or email and advertising may use cookies and other technologies, such as pixel tags and website beacons. These technologies help us better understand user behavior, tell us what parts of our website people visit, measure and improve the effectiveness of advertising and web search. We treat information collected through cookies and other technologies as non personal information. However, if local laws treat Internet Protocol (IP) addresses or similar identification marks as personal information, we also treat such identification marks as personal information. Similarly, for the purpose of this privacy policy, in the case of combining non personal information with personal information, we treat the combined information as personal information.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">Like most Internet services, we automatically collect certain information and store it in log files. Such information includes IP address, browser type and language, operating system, date \\/ time stamp, etc.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We use this information to understand and analyze trends, manage the website, understand user behavior on the website, improve our products and services, and collect information on the overall audience characteristics of the user base. Everbright mall can use this information for our marketing and advertising services.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">Pixel tags allow us to send email in a format that customers can read and tell us whether the email is open. We can use this information to reduce or eliminate email to customers.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">7、 Other</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">It may be necessary for Everbright mall to disclose your personal information according to the laws, legal procedures, litigation and or the requirements of public institutions and government departments at home and abroad. We may also disclose information about you if we determine that disclosure is necessary or appropriate for national security, law enforcement or other matters of public importance.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">We may also disclose information about you if we determine that disclosure is reasonably necessary to enforce our terms and conditions or protect our operations or users. In addition, in case of reorganization, merger or sale, we can transfer all personal information we collect to relevant third parties.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">Protection of personal information Everbright mall attaches great importance to the security of your personal information. Everbright mall will use encryption technologies such as transport layer security protocol (TLS) to protect your personal information during transmission. When storing your personal data in Everbright mall, we will use computer systems with limited access rights, which are deployed in facilities protected by physical security measures. Your account and password are stored in encrypted form, which is also true when we use third-party storage space.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">8、 Privacy issues</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">If you have any questions or questions about Everbright mall\'s privacy policy or data processing, or want to complain about possible violations of local privacy laws, please contact us. You can call the support number of Everbright mall to contact us at any time.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">When receiving privacy issues or access \\/ download requests, we will screen and classify the contacts and try to solve the specific problems or questions you raise. If your question itself involves more important matters, we may ask you for more information. These contacts who ask more important questions will receive replies. If you are not satisfied with the response received, you can refer the complaint to the relevant regulatory authority in your jurisdiction. If you consult us, we will provide information on possible applicable complaint channels according to your actual situation. Everbright mall can update its privacy policy at any time. If we make significant changes to our privacy policy, we will publish announcements and updated privacy policies on the company\'s website.</p>', '23', '', '213123', '2022-08-11 17:54:01', '2022-08-11 17:54:01');
INSERT INTO `page_descriptions` VALUES (64, 12, 'zh_cn', '隐私政策', '', '<h1 style=\"box-sizing: border-box; font-size: 24px; margin: 0px 0px 18px; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-weight: 500; line-height: 1.1; color: #333333; background-color: #ffffff; outline: none !important;\">隐私政策</h1>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">一、个人信息的收集和使用</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">当您使用《成都光大网络科技有限公司》商城服务时，我们有可能会要求你提供个人信息。《成都光大网络科技有限公司》商城将按本隐私政策使用这些信息。你不是一定要提供我们要求的个人信息，但在许多情况下，如果你选择不提供，我们将无法为你提供我们的产品或服务，也无法回应你遇到的任何问题。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">以下提供了一些成都光大网络科技有限公司商城可能收集的个人信息类型以及我们如何使用此类信息的示例：</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">二、我们收集哪些个人信息</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">当你创建账号、购买产品、下载软件更新、联系我们时，我们可能会收集各种信息，包括你的姓名、邮寄地址、电话号码、电子邮件地址、联系方式偏好等信息。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">当你使用成都光大网络科技有限公司商城购买商品或礼品卡时，成都光大网络科技有限公司商城可能会收集你提供的与上述人士有关的信息，如姓名、邮寄地址、电子邮件地址以及电话号码。成都光大网络科技有限公司商城将使用此类信息来满足你的要求，提供相关的产品或服务，或实现反欺诈目的。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">在某些司法辖区，出于遵守法律规定的目的，我们可能会要求用户提供由政府发放的身份证明，但仅限于为数不多的情形，例如海关报关。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">四、我们如何使用你的个人信息</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们将最新产品发布、软件更新及活动预告及时通知你。如果你不希望列入我们的邮寄列表，可随时通过更新偏好设置选择退出。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们可能会使用你的个人信息（例如电子邮件地址或手机号码）来验证及确定用户身份。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们可能会使用个人信息发送重要通知，例如关于购买的相关订单信息。由于这些信息对你与商城之间的沟通至关重要，你不能拒绝接收此类信息。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们还会将个人信息用于审计、数据分析和研究等内部目的，以改进成都光大网络科技有限公司商城的产品、服务和与客户之间的沟通。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们系统集成了cn.jpush.android(极光;极光推送) com.huawei.hms(华为;华为推送) com.alipay(支付宝;阿里乘车码;阿里芝麻信用实名认证;芝麻认证) com.tencent.bugly(Bugly;腾讯Bugly)等SDK，将在APP推送消息时推送给您，用于发送系统最新消息。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">五、非个人信息的收集和使用</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们还会收集利用其本身无法与任何特定个人直接建立联系的数据。我们可出于任何目的而收集、使用、转让和披露非个人信息。下文是我们可能收集的非个人信息以及我们如何使用这些信息的一些示例。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们会收集诸如职业、语言、邮编、区号、唯一设备标识符、引荐 URL、位置以及用户在使用产品时所处时区等信息，以便我们能更好地了解客户的行为，改进我们的产品、服务和广告宣传。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们会收集与客户在我们的网站上活动有关的信息。我们会将此类信息汇总，用于帮助我们向客户提供更有用的信息，了解客户对我们网站、产品和服务中的哪些部分最感兴趣。就本隐私政策而言，汇总数据被视为非个人信息。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们可能会收集和存储有关你如何使用我们的服务的详细信息，包括搜索查询。此类信息可能会用于改进我们的服务提供的结果，使其更具相关性。此类信息通常不会涉及你的 IP 地址，但以下少数情况除外：我们需要确保通过互联网提供的服务的质量。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">六、Cookie 和其他技术</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">成都光大网络科技有限公司商城或电子邮件和广告可能会使用 Cookie 和其他技术，如像素标签和网站信标。此等技术帮助我们更好地了解用户的行为，告诉我们人们浏览了我们网站的哪些部分，衡量广告和网络搜索的效果并加以改善。我们将通过 Cookie 和其他技术收集的信息视为非个人信息。但是，如果当地法律将 Internet 协议 (IP) 地址或类似识别标记视为个人信息，则我们亦将此等识别标记视为个人信息。同样，就本隐私政策而言，在将非个人信息与个人信息结合使用的情况下，我们将结合使用的信息视为个人信息。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">如同大多数互联网服务一样，我们也会自动收集某些信息，将其存储在日志文件中。这类信息包括 IP 地址、浏览器类型和语言、操作系统、日期\\/时间戳等。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">我们使用此等信息来了解和分析趋势、管理网站、了解网站上的用户行为、改进我们的产品和服务，以及收集用户群的整体受众特征信息。成都光大网络科技有限公司商城可将此类信息用于我们的营销和广告服务。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">像素标签使我们可以用客户可阅读的格式发送电子邮件，并告知我们邮件是否被打开。我们可利用这些信息来减少或免除向客户发送的电子邮件。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">七、其他</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">根据你居住国境内外的法律、法律程序、诉讼和或公共机构和政府部门的要求，成都光大网络科技有限公司商城可能有必要披露你的个人信息。如果我们确定就国家安全、执法或具有公众重要性的其他事宜而言，披露是必须的或适当的，我们也可能会披露关于你的信息。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">如果我们确定为了执行我们的条款和条件或保护我们的经营或用户，披露是合理必要的，我们也可能会披露关于你的信息。此外，如果发生重组、合并或出售，则我们可将我们收集的一切个人信息转让给相关第三方。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">个人信息的保护成都光大网络科技有限公司商城非常重视你的个人信息的安全。成都光大网络科技有限公司商城会使用传输层安全协议 (TLS) 等加密技术，在传输过程中保护你的个人信息。在成都光大网络科技有限公司商城存储你的个人数据时，我们会使用具有有限访问权限的电脑系统，这些系统部署在通过物理安全措施加以保护的设施之中。您的账号密码以加密形式存储，在我们使用第三方存储空间时也是如此。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">八、隐私问题</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">如果你对成都光大网络科技有限公司商城的隐私政策或数据处理有任何问题或疑问，或者想就可能违反当地隐私权法律的情况进行投诉，请联系我们。你可以随时拨打成都光大网络科技有限公司商城支持电话号码与我们联系。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">当收到隐私问题或访问\\/下载请求时，我们将对联系人进行甄别分类，并将设法解决您提出的具体问题或疑问。如果您的问题本身涉及比较重大的事项，我们可能会要求您提供更多信息。这些提出比较重大问题的联系人均将收到回复。如果您对收到的答复不满意，您可以将投诉移交给所在司法辖区的相关监管机构。如果您咨询我们，我们会根据您的实际情况，提供可能适用的相关投诉途径的信息。 成都光大网络科技有限公司商城可随时对其隐私政策加以更新。如果我们对隐私政策作出重大变更，我们将在公司网站上发布通告和经更新的隐私政策。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">权限说明：</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">&nbsp; &nbsp; &nbsp;1、&lt;android.permission.WRITE_EXTERNAL_STORAGE&gt; 获取用户sd卡文件，在用户授权的情况下用于个人中心修改头像以及商品购买前联系客服咨询相关商品信息。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">&nbsp; &nbsp; &nbsp;2、&lt;android.permission.CAMERA&gt; 调用摄像头权限，在用户授权的情况下 用于个人中心修改头像以及商品购买前联系客服咨询相关商品信息，以及首页扫描二维码帮助参加砍价、团购等商品促销&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 活动。</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">&nbsp; &nbsp; &nbsp;3、&lt;android.permission.RECORD_AUDIO&gt; 录音权限，在用户授权的情况下商品购买前联系客服发送语音咨询相关商品信息</p>\r\n<p>&nbsp;</p>', '', '', '', '2022-08-11 17:54:01', '2022-08-11 17:54:01');
INSERT INTO `page_descriptions` VALUES (167, 20, 'en', 'Terms of use', '', '<p><span style=\"color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff;\">Terms &amp; Conditions</span></p>', '', '', '', '2022-08-31 08:05:49', '2022-08-31 08:05:49');
INSERT INTO `page_descriptions` VALUES (168, 20, 'zh_cn', '使用条款', '', '<p><span style=\"color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\">Terms &amp; Conditions</span></p>', '', '', '', '2022-08-31 08:05:49', '2022-08-31 08:05:49');
INSERT INTO `page_descriptions` VALUES (179, 21, 'en', 'About', '', '<div style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\">\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Chengdu Guangda Network Technology Co., Ltd.</span></span><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">&nbsp;is a high-tech enterprise mainly engaged in the development of Internet independent station systems.</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">We provide commercial technical support, secondary development, mobile app customization and template design related to cross-border open source e-commerce website construction.</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">&nbsp;</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">- Cutting-edge open source e-commerce independent station system</span></span></span></div>\r\n<ul>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">An integrated website building package from PC to mobile phone, suitable for various devices, one-stop e-commerce website building</span></span></span></li>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">It can solve the data exchange between mobile users and PC users, one core and two stores</span></span></span></li>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">100% open source system code</span></span></span></li>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Developed based on Laravel framework</span></span></span></li>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Powerful plug-in mechanism, easy function expansion</span></span></span></li>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">The mall supports multi-language\\/multi-currency, various payment methods, and supports PayPal, stripe and other payments</span></span></span></li>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Strictly follow the MVC architecture</span></span></span></li>\r\n<li style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">The homepage UI layout is up to you</span></span></span></li>\r\n</ul>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">&nbsp;</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">contact details:</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">The company brings together industry elites and has a high-end, honest, professional and efficient service team and technical team to provide our customers with safe and stable system software and services. For business cooperation, please contact us!</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">&nbsp;</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Working hours: Monday to Friday (9:00 - 18:00)</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Contact: Mr. Liang</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Company Email: support@example.com</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Postal Code: 611731</span></span></span></div>\r\n<div style=\"box-sizing: border-box; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; outline: none !important;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif;\"><span style=\"font-size: 14px;\">Address:&nbsp;</span></span><span style=\"font-size: 14px; white-space: pre-wrap;\">G8 Tianfu Software Park Chengdu China</span></span></div>\r\n</div>\r\n</div>', '', '', '', '2022-09-02 03:04:30', '2022-09-02 03:04:30');
INSERT INTO `page_descriptions` VALUES (180, 21, 'zh_cn', '关于我们', '', '<div style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\"><span style=\"box-sizing: border-box; color: #3ca6f2; outline: none !important;\"><strong style=\"box-sizing: border-box; outline: none !important;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #175199; text-decoration-line: none; outline: none !important;\" href=\"http:\\/\\/www.guangdawangluo.com\\/\" target=\"_blank\" rel=\"noopener\">成都光大网络科技有限公司</a></strong></span>，是一家主要从事互联网独立站系统开发的高科技企业。</div>\r\n<div style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\"><hr style=\"box-sizing: content-box; height: 0px; margin-top: 20px; margin-bottom: 20px; border-right-style: initial; border-bottom-style: initial; border-left-style: initial; border-image: initial; outline: none !important; border-color: #eeeeee initial initial initial;\" \\/></div>\r\n<div style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">我们提供跨境开源电商建站相关的商业技术支持、二次开发、手机商城 App 定制和模板设计。</div>\r\n<div style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">&nbsp;</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">- 前沿的开源电商独立站系统</p>\r\n<ul>\r\n<li style=\"list-style-type: none;\">\r\n<ul>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\">从pc到手机一体化的建站套餐，适配各种设备，一站式电子商务建站</li>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\">可以解决移动端用户和PC端用户数据互通，一核双店</li>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\"><span style=\"color: #333333; font-family: Microsoft YaHei, tahoma, arial, Hiragino Sans GB, 宋体, sans-serif;\"><span style=\"font-size: 14px;\">系统代码100%开源</span></span></li>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\"><span style=\"color: #333333; font-family: Microsoft YaHei, tahoma, arial, Hiragino Sans GB, 宋体, sans-serif;\"><span style=\"font-size: 14px;\">基于Laravel框架开发</span></span></li>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\"><span style=\"color: #333333; font-family: Microsoft YaHei, tahoma, arial, Hiragino Sans GB, 宋体, sans-serif;\"><span style=\"font-size: 14px;\">强大的插件机制，轻松的功能拓展</span></span></li>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\">商城支持多语言\\/多货币，支付方式多样，支持PayPal、stripe等支付</li>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\"><span style=\"color: #333333; font-family: Microsoft YaHei, tahoma, arial, Hiragino Sans GB, 宋体, sans-serif;\"><span style=\"font-size: 14px;\">严格遵循MVC架构</span></span></li>\r\n<li style=\"box-sizing: border-box; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', 宋体, sans-serif; font-size: 14px; background-color: #ffffff;\">首页UI布局由你选</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<hr style=\"box-sizing: content-box; height: 0px; margin-top: 20px; margin-bottom: 20px; border-right-style: initial; border-bottom-style: initial; border-left-style: initial; border-image: initial; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important; border-color: #eeeeee initial initial initial;\" \\/>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">联系方式:</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">公司汇聚行业精英，拥有高端、诚信、专业、高效的服务团队和技术团队，为广大客户提供安全、稳定的系统软件和服务。如需商业合作，请联系我们！</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">工作时间：周一到周五（9:00 - 18:00）</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">联系人：梁先生</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">公司邮箱：support@example.com</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">邮政编码：611731</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 14px; color: #333333; font-family: \'Microsoft YaHei\', tahoma, arial, \'Hiragino Sans GB\', \'\\宋体\', sans-serif; font-size: 14px; background-color: #ffffff; padding-left: 30px; outline: none !important;\">地址：成都天府软软件园</p>', '', '', '', '2022-09-02 03:04:30', '2022-09-02 03:04:30');
INSERT INTO `page_descriptions` VALUES (199, 22, 'zh_cn', 'Beikeshop 1.5.5.4 新版版本发布！！！', '新闻博客做为重要的文字营销工具，是电商网站必不可少的功能之一。博客正文内容支持 HTML 常用标签等.....', '<p>Beikeshop 1.5.5.4 新版版本发布！！！</p>', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_descriptions` VALUES (200, 22, 'en', 'Beikeshop 1.5.5.4 new version released! ! !', 'As an important text marketing tool, news blogs are one of the essential functions of e-commerce websites. Blog body content supports HTML common tags, etc.....', '<p>Beikeshop 1.5.5.4 new version released! ! !</p>', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_descriptions` VALUES (203, 23, 'zh_cn', '新一代开源跨境电商系统，BeikeShop重磅上线！', '新闻博客做为重要的文字营销工具，是电商网站必不可少的功能之一。博客正文内容支持 HTML 常用标签等...', '随着一带一路的蓬勃发展，以及中国制造亟需出海拓展全球市场，外贸行业仍然是大国创造GDP的核心引擎.光大网络科技长期深耕跨境电商行业，经过多年的摸索与思考，开发出了一套更加符合国内出海企业需求的开源电商系统&mdash;&mdash;BeikeShop&mdash;&mdash;助力企业品牌出海。', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_descriptions` VALUES (204, 23, 'en', 'A new generation of open source cross-border e-commerce system, BeikeShop is launched!', 'As an important text marketing tool, news blogs are one of the essential functions of e-commerce websites. Blog body content supports HTML common tags, etc.....', '随着一带一路的蓬勃发展，以及中国制造亟需出海拓展全球市场，外贸行业仍然是大国创造GDP的核心引擎.光大网络科技长期深耕跨境电商行业，经过多年的摸索与思考，开发出了一套更加符合国内出海企业需求的开源电商系统&mdash;&mdash;BeikeShop&mdash;&mdash;助力企业品牌出海', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_descriptions` VALUES (209, 24, 'zh_cn', 'BeikeShop 多语言支持助您一臂之力', '新闻博客做为重要的文字营销工具，是电商网站必不可少的功能之一。博客正文内容支持 HTML 常用标签等.....', '新闻博客做为重要的文字营销工具，是电商网站必不可少的功能之一。博客正文内容支持 HTML 常用标签等.....', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_descriptions` VALUES (210, 24, 'en', 'BeikeShop multi-language support helps you', 'As an important text marketing tool, news blogs are one of the essential functions of e-commerce websites. Blog body content supports HTML common tags, etc.....', 'As an important text marketing tool, news blogs are one of the essential functions of e-commerce websites. Blog body content supports HTML common tags, etc.....', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_descriptions` VALUES (211, 25, 'zh_cn', '性能提升秘籍 | 如何打造闪电般快速的 BeikeShop', '新闻博客做为重要的文字营销工具，是电商网站必不可少的功能之一。博客正文内容支持 HTML 常用标签等.....', '新闻博客做为重要的文字营销工具，是电商网站必不可少的功能之一。博客正文内容支持 HTML 常用标签等.....', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `page_descriptions` VALUES (212, 25, 'en', 'Performance Tips | How to Build a Lightning-Fast BeikeShop', 'As an important text marketing tool, news blogs are one of the essential functions of e-commerce websites. Blog body content supports HTML common tags, etc.....', 'As an important text marketing tool, news blogs are one of the essential functions of e-commerce websites. Blog body content supports HTML common tags, etc.....', '', '', '', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for page_products
-- ----------------------------
DROP TABLE IF EXISTS `page_products`;
CREATE TABLE `page_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `page_id` int(11) NOT NULL COMMENT '文章 ID',
  `product_id` int(11) NOT NULL COMMENT '产品 ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章产品关联';

-- ----------------------------
-- Records of page_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `page_category_id` int(11) NOT NULL COMMENT '文章分类ID',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `position` int(11) NOT NULL COMMENT '排序',
  `views` int(11) NOT NULL COMMENT '查看数',
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `active` tinyint(1) NOT NULL COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_category_id` (`page_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单页';

-- ----------------------------
-- Records of pages
-- ----------------------------
BEGIN;
INSERT INTO `pages` VALUES (12, 0, '', 0, 0, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `pages` VALUES (18, 0, '', 0, 0, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `pages` VALUES (20, 0, '', 0, 0, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `pages` VALUES (21, 0, '', 0, 0, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `pages` VALUES (22, 1, '/catalog/demo/blog/post-1.png', 0, 1, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `pages` VALUES (23, 1, '/catalog/demo/blog/post-2.png', 0, 1, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `pages` VALUES (24, 1, '/catalog/demo/blog/post-3.png', 0, 1, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `pages` VALUES (25, 1, '/catalog/demo/blog/post-4.png', 0, 1, 'BeikeShop', 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名称',
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属权限组',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员权限';

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for plugins
-- ----------------------------
DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型: shipping, payment',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码, 唯一标识',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='插件';

-- ----------------------------
-- Records of plugins
-- ----------------------------
BEGIN;
INSERT INTO `plugins` VALUES (39, 'payment', 'bk_stripe', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `plugins` VALUES (42, 'view', 'header_menu', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `plugins` VALUES (44, 'total', 'service_charge', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `plugins` VALUES (52, 'view', 'latest_products', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `plugins` VALUES (55, 'shipping', 'flat_shipping', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `plugins` VALUES (56, 'payment', 'paypal', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `plugins` VALUES (57, 'payment', 'stripe', '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL COMMENT '商品 ID',
  `attribute_id` int(10) unsigned NOT NULL COMMENT '属性 ID',
  `attribute_value_id` int(10) unsigned NOT NULL COMMENT '属性值 ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_attribute_id` (`product_id`,`attribute_id`),
  KEY `product_id` (`product_id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `attribute_value_id` (`attribute_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品属性关联表';

-- ----------------------------
-- Records of product_attributes
-- ----------------------------
BEGIN;
INSERT INTO `product_attributes` VALUES (1, 5, 1, 11, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (2, 5, 2, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (3, 5, 5, 20, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (4, 5, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (5, 5, 3, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (6, 6, 3, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (7, 6, 2, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (8, 6, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (9, 6, 4, 14, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (10, 7, 1, 11, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (11, 7, 3, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (12, 7, 5, 21, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (13, 7, 2, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (14, 7, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (15, 8, 1, 12, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (16, 8, 4, 14, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (17, 8, 5, 21, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (18, 8, 6, 22, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (19, 8, 3, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (20, 8, 2, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (21, 9, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (22, 9, 2, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (23, 9, 3, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (24, 9, 6, 22, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (25, 9, 4, 16, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (26, 9, 5, 19, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (27, 10, 4, 17, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (28, 10, 2, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (29, 10, 5, 20, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (30, 10, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (31, 10, 3, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (32, 11, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (33, 11, 2, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (34, 11, 3, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (35, 11, 4, 14, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (36, 11, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (37, 12, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (38, 12, 2, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (39, 12, 4, 13, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (40, 12, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (41, 12, 5, 20, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (42, 12, 3, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (43, 13, 1, 11, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (44, 13, 2, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (45, 13, 3, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (46, 13, 4, 14, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (47, 13, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (48, 13, 5, 19, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (49, 14, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (50, 14, 2, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (51, 14, 3, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (52, 14, 4, 14, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (53, 14, 5, 20, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (54, 14, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (55, 15, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (56, 15, 2, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (57, 15, 2, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (58, 15, 5, 20, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (59, 15, 4, 16, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (60, 15, 6, 22, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (61, 35, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (62, 35, 2, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (63, 35, 3, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (64, 35, 4, 15, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (65, 35, 5, 21, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (66, 35, 6, 22, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (67, 39, 1, 11, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (68, 39, 2, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (69, 39, 3, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (70, 39, 4, 15, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (71, 39, 5, 19, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (72, 39, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (73, 1, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (74, 1, 2, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (75, 1, 4, 15, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (76, 1, 3, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (77, 1, 5, 21, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (78, 1, 6, 22, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (79, 2, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (80, 2, 2, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (81, 2, 3, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (82, 2, 4, 13, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (83, 2, 5, 18, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (84, 2, 6, 22, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (85, 3, 1, 12, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (86, 3, 2, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (87, 3, 4, 14, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (88, 3, 5, 20, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (89, 3, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (90, 4, 1, 11, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (91, 4, 2, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (92, 4, 3, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (93, 4, 5, 21, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_attributes` VALUES (94, 4, 6, 23, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '产品 ID',
  `category_id` bigint(20) unsigned NOT NULL COMMENT '分类 ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品所属分类';

-- ----------------------------
-- Records of product_categories
-- ----------------------------
BEGIN;
INSERT INTO `product_categories` VALUES (1, 2, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (2, 2, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (3, 2, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (4, 2, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (5, 2, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (6, 2, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (7, 14, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (8, 14, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (9, 14, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (10, 14, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (11, 14, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (12, 14, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (13, 15, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (14, 15, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (15, 15, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (16, 15, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (17, 15, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (18, 15, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (19, 16, 100000, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (20, 16, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (21, 16, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (22, 16, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (23, 16, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (24, 16, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (25, 16, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (26, 16, 100009, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (27, 17, 100000, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (28, 17, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (29, 17, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (30, 17, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (31, 17, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (32, 17, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (33, 17, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (34, 17, 100009, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (35, 18, 100000, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (36, 18, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (37, 18, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (38, 18, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (39, 18, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (40, 18, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (41, 18, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (42, 18, 100009, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (43, 19, 100000, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (44, 19, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (45, 19, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (46, 19, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (47, 19, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (48, 19, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (49, 19, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (50, 19, 100009, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (51, 20, 100000, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (52, 20, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (53, 20, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (54, 20, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (55, 20, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (56, 20, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (57, 20, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (58, 20, 100009, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (59, 1, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (60, 2, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (61, 2, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (62, 2, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (63, 2, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (64, 2, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (65, 2, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (66, 2, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (67, 31, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (68, 32, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (69, 32, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (70, 32, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (71, 32, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (72, 34, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (73, 35, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (74, 35, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (75, 39, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (76, 39, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (77, 39, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (78, 39, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (79, 39, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (80, 39, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (81, 39, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (82, 39, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (83, 39, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (84, 39, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (85, 39, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (86, 2, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (87, 2, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (88, 3, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (89, 3, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (90, 3, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (91, 3, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (92, 3, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (93, 3, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (94, 3, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (95, 3, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (96, 3, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (97, 3, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (98, 3, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (99, 3, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (100, 3, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (101, 3, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (102, 3, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (103, 3, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (104, 4, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (105, 4, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (106, 4, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (107, 4, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (108, 4, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (109, 4, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (110, 4, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (111, 4, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (112, 4, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (113, 4, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (114, 4, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (115, 4, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (116, 4, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (117, 4, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (118, 4, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (119, 4, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (120, 6, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (121, 6, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (122, 6, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (123, 6, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (124, 6, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (125, 6, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (126, 6, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (127, 6, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (128, 6, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (129, 6, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (130, 6, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (131, 6, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (132, 6, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (133, 6, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (134, 6, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (135, 1, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (136, 1, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (137, 1, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (138, 1, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (139, 1, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (140, 1, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (141, 1, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (142, 1, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (143, 1, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (144, 1, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (145, 1, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (146, 1, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (147, 1, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (148, 1, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (149, 1, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (150, 39, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (151, 39, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (152, 39, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (153, 39, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (154, 35, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (155, 35, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (156, 35, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (157, 35, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (158, 35, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (159, 35, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (160, 35, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (161, 35, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (162, 35, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (163, 35, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (164, 35, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (165, 35, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (166, 35, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (167, 35, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (168, 15, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (169, 15, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (170, 15, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (171, 15, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (172, 15, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (173, 15, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (174, 15, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (175, 15, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (176, 15, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (177, 15, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (178, 14, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (179, 14, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (180, 14, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (181, 14, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (182, 14, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (183, 14, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (184, 14, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (185, 14, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (186, 14, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (187, 14, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (188, 13, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (189, 13, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (190, 13, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (191, 13, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (192, 13, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (193, 13, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (194, 13, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (195, 13, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (196, 13, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (197, 13, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (198, 13, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (199, 13, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (200, 13, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (201, 13, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (202, 13, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (203, 13, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (204, 12, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (205, 12, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (206, 12, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (207, 12, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (208, 12, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (209, 12, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (210, 12, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (211, 12, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (212, 12, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (213, 12, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (214, 12, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (215, 12, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (216, 12, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (217, 12, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (218, 12, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (219, 12, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (220, 11, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (221, 11, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (222, 11, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (223, 11, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (224, 11, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (225, 11, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (226, 11, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (227, 11, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (228, 11, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (229, 11, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (230, 11, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (231, 11, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (232, 11, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (233, 11, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (234, 11, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (235, 11, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (236, 10, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (237, 10, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (238, 10, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (239, 10, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (240, 10, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (241, 10, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (242, 10, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (243, 10, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (244, 10, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (245, 10, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (246, 10, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (247, 10, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (248, 10, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (249, 10, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (250, 10, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (251, 10, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (252, 9, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (253, 9, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (254, 9, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (255, 9, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (256, 9, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (257, 9, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (258, 9, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (259, 9, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (260, 9, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (261, 9, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (262, 9, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (263, 9, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (264, 9, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (265, 9, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (266, 9, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (267, 9, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (268, 8, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (269, 8, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (270, 8, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (271, 8, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (272, 8, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (273, 8, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (274, 8, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (275, 8, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (276, 8, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (277, 8, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (278, 8, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (279, 8, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (280, 8, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (281, 8, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (282, 8, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (283, 8, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (284, 7, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (285, 7, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (286, 7, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (287, 7, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (288, 7, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (289, 7, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (290, 7, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (291, 7, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (292, 7, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (293, 7, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (294, 7, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (295, 7, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (296, 7, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (297, 7, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (298, 7, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (299, 7, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (300, 6, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (301, 5, 100012, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (302, 5, 100018, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (303, 5, 100017, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (304, 5, 100003, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (305, 5, 100005, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (306, 5, 100007, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (307, 5, 100002, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (308, 5, 100004, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (309, 5, 100010, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (310, 5, 100013, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (311, 5, 100015, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (312, 5, 100014, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (313, 5, 100016, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (314, 5, 100011, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (315, 5, 100006, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_categories` VALUES (316, 5, 100008, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for product_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `product_descriptions`;
CREATE TABLE `product_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '产品 ID',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品描述',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'meta 标题',
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'meta 描述',
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'meta 关键字',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品名称、描述等详情';

-- ----------------------------
-- Records of product_descriptions
-- ----------------------------
BEGIN;
INSERT INTO `product_descriptions` VALUES (19, 16, 'zh_cn', 'ddasda', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (20, 16, 'en', '3213123', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (23, 17, 'zh_cn', 'ddasda', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (24, 17, 'en', '3213123', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (27, 18, 'zh_cn', 'ddasda', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (28, 18, 'en', '3213123', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (31, 19, 'zh_cn', 'ddasda', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (32, 19, 'en', '3213123', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (35, 20, 'zh_cn', 'ddasda', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (36, 20, 'en', '3213123', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (65, 2, 'zh_cn', '中长款牛仔半身裙女春夏季2021新款薄款高腰开叉包臀长裙A字裙子', 'fdsfsd', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (66, 2, 'en', 'Mid-length denim skirt woman Spring/summer 2021 new thin high waisted slit hip wrap skirt A-line skirt', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (67, 3, 'zh_cn', '双肩包书包男女笔记本电脑包时尚潮流旅行背包', '测试下商品详情', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (68, 3, 'en', 'Backpack Men and women laptop bag fashion trend travel backpack', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (75, 7, 'zh_cn', '轻便跑鞋女夏新款跑步运动鞋减震软底网面透气休闲运动鞋女鞋', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (76, 7, 'en', 'Lightweight running shoes female summer new running shoes shock absorption soft bottom', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (79, 9, 'zh_cn', '春夏新品暗黑系甜辣风吊带裙欧根纱蓬蓬裙冷淡法式连衣裙女', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (80, 9, 'en', 'Spring and summer NEW dark department of sweet hot wind sling skirt organza skirt cold French dress female', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (83, 11, 'zh_cn', '夏季新款polo领连衣裙女学院风减龄不规则下摆长裙子', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (84, 11, 'en', 'New polo collar dress for summer women\'s college style aging irregular hem long skirt', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (85, 12, 'zh_cn', '凉鞋女款夏季2022年新款坡跟女鞋夏款松糕鞋高跟鞋子爆款女士', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (86, 12, 'en', 'Sandal women\'s Summer 2022 new wedge women\'s shoes summer style', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (87, 13, 'zh_cn', '休闲polo衬衫连衣裙大码女装高级感夏2022新款小个子御姐', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (88, 13, 'en', 'Casual Polo shirt dress large size women\'s senior sense summer 2022 new small royal sister', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (89, 14, 'zh_cn', '夏季套装短袖T恤男装一套搭配帅气潮情侣男生半袖上衣服', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (90, 14, 'en', 'Summer suit short sleeve T-shirt men\'s suit with handsome fashionable couple boys half sleeve clothes', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (101, 28, 'zh_cn', '321', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (102, 28, 'en', '3123', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (105, 30, 'zh_cn', '1', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (106, 30, 'en', '1', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (115, 31, 'zh_cn', '中国乔丹', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (116, 31, 'en', '中国乔丹', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (125, 34, 'zh_cn', '芦荟胶', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (126, 34, 'en', 'English芦荟胶', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (149, 32, 'zh_cn', '虎牌保温杯', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (150, 32, 'en', '虎牌保温杯', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (203, 6, 'zh_cn', '冰丝褶皱垂感圆领长袖T恤男宽松薄款高级感v领男装上衣', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (204, 6, 'en', 'Ice silk drape feel round neck long sleeve T-shirt men loose thin senior sense', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (291, 39, 'zh_cn', '夏季新款女装法式气质洋气高级感温柔风吊带仙女连衣裙', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (292, 39, 'en', 'Summer new women\'s French temperament Western style high-end gentle wind sling fairy dress', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2022-08-26 01:20:14', '2022-08-26 01:20:14');
INSERT INTO `product_descriptions` VALUES (293, 35, 'zh_cn', '气质通勤高街蛋青色挺括烟管裤9分裤套装下装22秋女', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (294, 35, 'en', 'Temperament commuter high street egg cyan stiff cigarette pants 9 points pants suit bottoms 22 autumn women', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (295, 4, 'zh_cn', '男子 休闲鞋 TANJUN 天君 休闲鞋 运动鞋 812654', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (296, 4, 'en', 'Men\'s casual shoes TANJUN Tianjun casual shoes sneakers 812654', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (297, 8, 'zh_cn', '夏季新款模糊数码直喷短袖上衣男装情侣纯棉t恤ins潮', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (298, 8, 'en', 'Summer new fuzzy digital direct spray short sleeve top men\'s pair of cotton T-shirt Instagram trend', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (299, 5, 'zh_cn', '高级感男装夏季潮牌美式复古短袖t恤男士重磅纯棉宽松半袖男体恤', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (300, 5, 'en', 'High sense men\'s summer fashion brand American vintage short sleeve T-shirt men', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (301, 10, 'zh_cn', '法式小众设计高级感连衣裙2022年新款收腰显瘦中长款裙子女夏', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (302, 10, 'en', 'French niche design haute couture dress 2022 new waist', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (303, 1, 'zh_cn', '欧洲站夏季新款时尚休闲短裤热裤女裤运动家具纯棉韩版宽松百搭裤', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (304, 1, 'en', 'European station summer new FASHION casual shorts hot pants female pants sports furniture pure cotton Korean version loose pants', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (305, 15, 'zh_cn', '男鞋2022夏季透气冲孔时尚休闲板鞋压花耐磨小白鞋男', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_descriptions` VALUES (306, 15, 'en', 'Male shoes 2022 summer breathable punching fashion casual shoes embossed wear resistant small white shoes male', '<p><img class=\"img-fluid\" src=\"/catalog/demo/product/xq_01.jpg\" /></p>', '', '', '', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for product_relations
-- ----------------------------
DROP TABLE IF EXISTS `product_relations`;
CREATE TABLE `product_relations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL COMMENT '商品 ID',
  `relation_id` int(10) unsigned NOT NULL COMMENT '关联商品 ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='相关商品表';

-- ----------------------------
-- Records of product_relations
-- ----------------------------
BEGIN;
INSERT INTO `product_relations` VALUES (1, 1, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (2, 1, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (3, 1, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (4, 1, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (5, 1, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (6, 1, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (7, 4, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (8, 4, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (9, 4, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (10, 4, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (11, 4, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (12, 4, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (13, 4, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (14, 6, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (15, 6, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (16, 6, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (17, 6, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (18, 39, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (19, 39, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (20, 39, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (21, 39, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (22, 39, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (23, 39, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (24, 39, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (25, 35, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (26, 35, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (27, 35, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (28, 35, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (29, 35, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (30, 35, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (31, 35, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (32, 15, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (33, 15, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (34, 15, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (35, 15, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (36, 15, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (37, 14, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (38, 14, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (39, 14, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (40, 14, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (41, 14, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (42, 14, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (43, 13, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (44, 13, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (45, 13, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (46, 13, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (47, 13, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (48, 13, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (49, 12, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (50, 12, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (51, 12, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (52, 12, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (53, 12, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (54, 12, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (55, 11, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (56, 11, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (57, 11, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (58, 11, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (59, 11, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (60, 10, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (61, 10, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (62, 10, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (63, 10, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (64, 10, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (65, 10, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (66, 9, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (67, 9, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (68, 9, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (69, 9, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (70, 9, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (71, 8, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (72, 8, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (73, 8, 3, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (74, 8, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (75, 8, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (76, 7, 5, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (77, 7, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (78, 7, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (79, 7, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (80, 7, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (81, 5, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (82, 5, 6, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (83, 5, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (84, 5, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (85, 5, 7, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (86, 3, 2, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (87, 3, 8, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (88, 3, 9, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (89, 3, 10, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_relations` VALUES (90, 3, 4, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for product_skus
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '产品 ID',
  `variants` json DEFAULT NULL COMMENT 'SKU 规格',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `images` json DEFAULT NULL COMMENT '图片',
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SKU',
  `price` double NOT NULL DEFAULT '0' COMMENT '价格',
  `origin_price` double NOT NULL DEFAULT '0' COMMENT '划线价',
  `cost_price` double NOT NULL DEFAULT '0' COMMENT '成本价',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '库存数',
  `is_default` tinyint(1) NOT NULL COMMENT '是否默认',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_skus_sku_unique` (`sku`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品SKU';

-- ----------------------------
-- Records of product_skus
-- ----------------------------
BEGIN;
INSERT INTO `product_skus` VALUES (273, 5, '\"\"', 0, NULL, 'model273', 'sku273', 999, 2222, 222, 42131, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (274, 6, '\"\"', 0, NULL, 'model274', 'sku274', 423, 44232, 3, 123123, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (275, 7, '\"\"', 0, NULL, 'model275', 'sku275', 99, 299, 299, 3333, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (276, 8, '\"\"', 0, NULL, 'model276', 'sku276', 99, 333, 222, 2222, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (277, 9, '\"\"', 0, NULL, 'model277', 'sku277', 299, 999, 99, 99, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (278, 10, '\"\"', 0, NULL, 'model278', 'sku278', 169, 334, 55, 33, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (279, 11, '\"\"', 0, NULL, 'model279', 'sku279', 98, 234, 223, 2223, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (280, 12, '\"\"', 0, NULL, 'model280', 'sku280', 79, 222, 333, 2222, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (281, 13, '\"\"', 0, NULL, 'model281', 'sku281', 199, 333, 333, 3445, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (282, 14, '\"\"', 0, NULL, 'model282', 'sku282', 299, 433, 234, 423, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (283, 15, '\"\"', 0, NULL, 'model283', 'sku283', 324, 35, 43, 546, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (284, 35, '\"\"', 0, NULL, 'model284', 'sku284', 100.99, 50.99, 30.99, 999, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (285, 39, '[\"0\", \"0\"]', 0, '[\"catalog/demo/product/12.jpg\"]', 'model285', 'sku285', 100, 3534, 3453, 999, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (286, 39, '[\"0\", \"1\"]', 1, '[\"catalog/demo/product/15.jpg\"]', 'model286', 'sku286', 56, 353, 454, 454, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (287, 39, '[\"1\", \"0\"]', 2, '[\"catalog/demo/product/18.jpg\"]', 'model287', 'sku287', 454, 353, 345, 45, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (288, 39, '[\"1\", \"1\"]', 3, '[\"catalog/demo/product/4.jpg\"]', 'model288', 'sku288', 3534, 353, 4545, 45, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (289, 1, '[\"0\", \"0\"]', 0, '[\"catalog/demo/product/17.jpg\"]', 'model289', 'sku289', 88.3, 2312, 2312, 2222, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (290, 1, '[\"0\", \"1\"]', 1, '[\"catalog/demo/product/10.jpg\"]', 'model290', 'sku290', 448.3, 2312, 2312, 0, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (291, 1, '[\"1\", \"0\"]', 2, '[\"catalog/demo/product/17.jpg\"]', 'model291', 'sku291', 18.3, 2312, 2312, 22, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (292, 1, '[\"1\", \"1\"]', 3, '[\"catalog/demo/product/10.jpg\"]', 'model292', 'sku292', 78.3, 2312, 2312, 3333, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (299, 2, '[\"0\", \"0\"]', 0, '[\"catalog/demo/product/13.jpg\"]', 'model299', 'sku299', 324, 213, 312, 546, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (300, 2, '[\"0\", \"1\"]', 1, '[\"catalog/demo/product/2.jpg\"]', 'model300', 'sku300', 231, 213, 31, 2312, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (301, 2, '[\"1\", \"0\"]', 2, NULL, 'model301', 'sku301', 123, 3123, 23, 432, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (302, 2, '[\"1\", \"1\"]', 3, NULL, 'model302', 'sku302', 542, 12321, 123, 555, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (303, 2, '[\"2\", \"0\"]', 4, NULL, 'model303', 'sku303', 671, 213, 123, 12, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (304, 2, '[\"2\", \"1\"]', 5, NULL, 'model304', 'sku304', 231, 12, 213123, 31231, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (305, 3, '[\"0\", \"0\"]', 0, '[\"catalog/demo/product/11.jpg\"]', 'model305', 'sku305', 299, 312312, 311, 444, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (306, 3, '[\"0\", \"1\"]', 1, '[\"catalog/demo/product/12.jpg\"]', 'model306', 'sku306', 123, 321, 451, 312, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (307, 3, '[\"1\", \"0\"]', 2, '[\"catalog/demo/product/11.jpg\"]', 'model307', 'sku307', 123, 312, 6423, 312, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (308, 3, '[\"1\", \"1\"]', 3, '[\"catalog/demo/product/12.jpg\"]', 'model308', 'sku308', 775, 3, 123, 0, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (309, 3, '[\"2\", \"0\"]', 4, '[\"catalog/demo/product/11.jpg\"]', 'model309', 'sku309', 313, 32, 14423, 333, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (310, 3, '[\"2\", \"1\"]', 5, '[\"catalog/demo/product/12.jpg\"]', 'model310', 'sku310', 2349, 435, 434, 111, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (311, 3, '[\"3\", \"0\"]', 6, '[\"catalog/demo/product/11.jpg\"]', 'model311', 'sku311', 2349, 4678, 654, 0, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (312, 3, '[\"3\", \"1\"]', 7, '[\"catalog/demo/product/12.jpg\"]', 'model312', 'sku312', 1299, 6578, 123, 11, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (313, 4, '[\"0\", \"0\"]', 0, NULL, 'model313', 'sku313', 99, 123, 312, 333, 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (314, 4, '[\"0\", \"1\"]', 1, NULL, 'model314', 'sku314', 23, 33, 312, 123, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (315, 4, '[\"1\", \"0\"]', 2, NULL, 'model315', 'sku315', 34, 123, 3, 33, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (316, 4, '[\"1\", \"1\"]', 3, NULL, 'model316', 'sku316', 55, 13, 32112, 3312, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (317, 4, '[\"2\", \"0\"]', 4, NULL, 'model317', 'sku317', 66, 2312, 32, 3, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (318, 4, '[\"2\", \"1\"]', 5, NULL, 'model318', 'sku318', 77, 13, 123, 3312, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (319, 4, '[\"3\", \"0\"]', 6, NULL, 'model319', 'sku319', 113, 123, 213, 33, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `product_skus` VALUES (320, 4, '[\"3\", \"1\"]', 7, NULL, 'model320', 'sku320', 33, 3123, 3, 3123, 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for product_views
-- ----------------------------
DROP TABLE IF EXISTS `product_views`;
CREATE TABLE `product_views` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_views
-- ----------------------------
BEGIN;
INSERT INTO `product_views` VALUES (1, 5, 0, '192.168.105.1', 'gd7Ak0xHCSjGnexGSZwGY3xsPMU9PWHb6KYIQAD5', '2024-08-03 23:25:04', '2024-08-03 23:25:04');
INSERT INTO `product_views` VALUES (2, 5, 0, '192.168.105.1', 'gd7Ak0xHCSjGnexGSZwGY3xsPMU9PWHb6KYIQAD5', '2024-08-03 23:47:17', '2024-08-03 23:47:17');
INSERT INTO `product_views` VALUES (3, 1, 0, '192.168.105.1', 'QpaFvr6irgXjZCk41gTEQg81SK0J5yYdpaSr8riP', '2024-09-05 17:51:25', '2024-09-05 17:51:25');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌 ID',
  `images` json DEFAULT NULL COMMENT '图片',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `video` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `shipping` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要配送',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `variables` json DEFAULT NULL COMMENT '多规格数据',
  `tax_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '税类 ID',
  `weight` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `weight_class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '重量单位',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `tax_class_id` (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品';

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (1, 10, '[\"catalog/demo/product/1.jpg\", \"catalog/demo/product/2.jpg\", \"catalog/demo/product/4.jpg\"]', 0.00, '', 0, 1, 1, '[{\"name\": {\"en\": \"chima\", \"zh_cn\": \"尺码\"}, \"values\": [{\"name\": {\"en\": \"L\", \"zh_cn\": \"L\"}, \"image\": \"\"}, {\"name\": {\"en\": \"M\", \"zh_cn\": \"M\"}, \"image\": \"\"}], \"isImage\": false}, {\"name\": {\"en\": \"yanse\", \"zh_cn\": \"颜色\"}, \"values\": [{\"name\": {\"en\": \"黄色\", \"zh_cn\": \"黄色\"}, \"image\": \"\"}, {\"name\": {\"en\": \"绿色\", \"zh_cn\": \"绿色\"}, \"image\": \"\"}], \"isImage\": false}]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (2, 11, '[\"catalog/demo/product/13.jpg\", \"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\"]', 0.00, '', 1, 1, 1, '[{\"name\": {\"en\": \"Size\", \"zh_cn\": \"尺寸\"}, \"values\": [{\"name\": {\"en\": \"S\", \"zh_cn\": \"S\"}, \"image\": \"\"}, {\"name\": {\"en\": \"M\", \"zh_cn\": \"M\"}, \"image\": \"\"}, {\"name\": {\"en\": \"L\", \"zh_cn\": \"L\"}, \"image\": \"\"}], \"isImage\": false}, {\"name\": {\"en\": \"颜色\", \"zh_cn\": \"颜色\"}, \"values\": [{\"name\": {\"en\": \"Yellow\", \"zh_cn\": \"黄色\"}, \"image\": \"\"}, {\"name\": {\"en\": \"Blue\", \"zh_cn\": \"蓝色\"}, \"image\": \"\"}], \"isImage\": false}]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (3, 4, '[\"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\", \"catalog/demo/product/17.jpg\"]', 0.00, '', 1, 1, 1, '[{\"name\": {\"en\": \"Size\", \"zh_cn\": \"尺码\"}, \"values\": [{\"name\": {\"en\": \"S\", \"zh_cn\": \"S\"}, \"image\": \"\"}, {\"name\": {\"en\": \"M\", \"zh_cn\": \"M\"}, \"image\": \"\"}, {\"name\": {\"en\": \"L\", \"zh_cn\": \"L\"}, \"image\": \"\"}, {\"name\": {\"en\": \"XL\", \"zh_cn\": \"XL\"}, \"image\": \"\"}], \"isImage\": false}, {\"name\": {\"en\": \"Color\", \"zh_cn\": \"颜色\"}, \"values\": [{\"name\": {\"en\": \"Green\", \"zh_cn\": \"绿色\"}, \"image\": \"\"}, {\"name\": {\"en\": \"White\", \"zh_cn\": \"白色\"}, \"image\": \"\"}], \"isImage\": false}]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (4, 7, '[\"catalog/demo/product/3.jpg\", \"catalog/demo/product/16.jpg\", \"catalog/demo/product/15.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[{\"name\": {\"en\": \"Size\", \"zh_cn\": \"尺码\"}, \"values\": [{\"name\": {\"en\": \"S\", \"zh_cn\": \"S\"}, \"image\": \"\"}, {\"name\": {\"en\": \"M\", \"zh_cn\": \"M\"}, \"image\": \"\"}, {\"name\": {\"en\": \"L\", \"zh_cn\": \"L\"}, \"image\": \"\"}, {\"name\": {\"en\": \"XL\", \"zh_cn\": \"XL\"}, \"image\": \"\"}], \"isImage\": false}, {\"name\": {\"en\": \"Color\", \"zh_cn\": \"颜色\"}, \"values\": [{\"name\": {\"en\": \"White\", \"zh_cn\": \"白色\"}, \"image\": \"\"}, {\"name\": {\"en\": \"Green\", \"zh_cn\": \"绿色\"}, \"image\": \"\"}], \"isImage\": false}]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (5, 3, '[\"catalog/demo/product/4.jpg\", \"catalog/demo/product/15.jpg\", \"catalog/demo/product/16.jpg\", \"catalog/demo/product/17.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (6, 2, '[\"catalog/demo/product/7.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (7, 8, '[\"catalog/demo/product/5.jpg\", \"catalog/demo/product/16.jpg\", \"catalog/demo/product/3.jpg\", \"catalog/demo/product/9.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (8, 5, '[\"catalog/demo/product/12.jpg\", \"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (9, 2, '[\"catalog/demo/product/14.jpg\", \"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (10, 1, '[\"catalog/demo/product/9.jpg\", \"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (11, 2, '[\"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (12, 2, '[\"catalog/demo/product/16.jpg\", \"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (13, 8, '[\"catalog/demo/product/2.jpg\", \"catalog/demo/product/3.jpg\", \"catalog/demo/product/4.jpg\", \"catalog/demo/product/5.jpg\", \"catalog/demo/product/6.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (14, 9, '[\"catalog/demo/product/6.jpg\", \"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (15, 6, '[\"catalog/demo/product/15.jpg\", \"catalog/demo/product/10.jpg\", \"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (35, 1, '[\"catalog/demo/product/18.jpg\", \"catalog/demo/product/2.jpg\", \"catalog/demo/product/3.jpg\", \"catalog/demo/product/4.jpg\", \"catalog/demo/product/5.jpg\", \"catalog/demo/product/6.jpg\", \"catalog/demo/product/7.jpg\", \"catalog/demo/product/9.jpg\", \"catalog/demo/product/xq_01.jpg\"]', 0.00, '', 1, 1, 1, '[]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
INSERT INTO `products` VALUES (39, 4, '[\"catalog/demo/product/11.jpg\", \"catalog/demo/product/12.jpg\", \"catalog/demo/product/13.jpg\", \"catalog/demo/product/14.jpg\", \"catalog/demo/product/15.jpg\", \"catalog/demo/product/16.jpg\", \"catalog/demo/product/17.jpg\", \"catalog/demo/product/18.jpg\", \"catalog/demo/product/2.jpg\"]', 0.00, '', 1, 1, 1, '[{\"name\": {\"en\": \"color\", \"zh_cn\": \"颜色\"}, \"values\": [{\"name\": {\"en\": \"yellow\", \"zh_cn\": \"黄色\"}, \"image\": \"\"}, {\"name\": {\"en\": \"green\", \"zh_cn\": \"绿色\"}, \"image\": \"\"}], \"isImage\": true}, {\"name\": {\"en\": \"规格\", \"zh_cn\": \"规格\"}, \"values\": [{\"name\": {\"en\": \"450ML\", \"zh_cn\": \"450ML\"}, \"image\": \"\"}, {\"name\": {\"en\": \"500ml\", \"zh_cn\": \"500ml\"}, \"image\": \"\"}], \"isImage\": false}]', 1, 0.00, '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37', NULL);
COMMIT;

-- ----------------------------
-- Table structure for region_zones
-- ----------------------------
DROP TABLE IF EXISTS `region_zones`;
CREATE TABLE `region_zones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `region_id` int(11) NOT NULL COMMENT '区域组 ID',
  `country_id` int(11) NOT NULL COMMENT '国家 ID',
  `zone_id` int(11) NOT NULL COMMENT '省份 ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='区域组与国家省市县关联表';

-- ----------------------------
-- Records of region_zones
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '区域组名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='区域组, 比如江浙沪, 中国西部';

-- ----------------------------
-- Records of regions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rma_histories
-- ----------------------------
DROP TABLE IF EXISTS `rma_histories`;
CREATE TABLE `rma_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rma_id` int(10) unsigned NOT NULL COMMENT '售后 ID',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `notify` tinyint(4) NOT NULL COMMENT '是否通知',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_id` (`rma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='售后状态记录';

-- ----------------------------
-- Records of rma_histories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rma_reasons
-- ----------------------------
DROP TABLE IF EXISTS `rma_reasons`;
CREATE TABLE `rma_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` json NOT NULL COMMENT '售后原因, 示例: {"en":"cannot to use","zh_cn":"无法使用"}',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='售后原因';

-- ----------------------------
-- Records of rma_reasons
-- ----------------------------
BEGIN;
INSERT INTO `rma_reasons` VALUES (1, '{\"en\": \"Dead On Arrival\", \"zh_cn\": \"未收到货\"}', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `rma_reasons` VALUES (2, '{\"en\": \"Received Wrong Item\", \"zh_cn\": \"发错商品\"}', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `rma_reasons` VALUES (3, '{\"en\": \"Order Error\", \"zh_cn\": \"错误下单\"}', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `rma_reasons` VALUES (4, '{\"en\": \"Faulty, please supply remark\", \"zh_cn\": \"商品损坏，请添加备注\"}', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `rma_reasons` VALUES (5, '{\"en\": \"Other, please supply remark\", \"zh_cn\": \"其他，请添加备注\"}', '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for rmas
-- ----------------------------
DROP TABLE IF EXISTS `rmas`;
CREATE TABLE `rmas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单 ID',
  `order_product_id` int(10) unsigned NOT NULL COMMENT '订单商品明细 ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '客户 ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户姓名',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户 Email',
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户电话',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SKU',
  `quantity` int(11) NOT NULL COMMENT '退货数量',
  `images` json NOT NULL COMMENT '售后单附件图片',
  `opened` tinyint(4) NOT NULL COMMENT '是否已打开包装',
  `rma_reason_id` int(10) unsigned NOT NULL COMMENT '售后原因 ID',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '售后服务类型：退货、换货、维修、补发商品、仅退款',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_product_id` (`order_product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `rma_reason_id` (`rma_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='售后表';

-- ----------------------------
-- Records of rmas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '权限 ID',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色 ID',
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员角色权限';

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属权限组',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员角色';

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型,包括 system、plugin',
  `space` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置组, 比如 stripe, paypal, flat_shipping',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名称, 类似字段名',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置值',
  `json` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否json',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统设置';

-- ----------------------------
-- Records of settings
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES (1, 'system', 'base', 'country_id', '44', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (2, 'system', 'base', 'locale', 'en', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (3, 'system', 'base', 'theme', 'default', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (4, 'plugin', 'service_charge', 'status', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (5, 'system', 'base', 'status', '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (6, 'system', 'base', 'admin_name', 'admin', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (7, 'system', 'base', 'tax', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (8, 'system', 'base', 'tax_address', 'payment', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (9, 'system', 'base', 'currency', 'USD', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (10, 'system', 'base', 'zone_id', '710', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (11, 'plugin', 'header_menu', 'status', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (12, 'plugin', 'stripe', 'publishable_key', 'pk_test_Flhi0NU77hK1IBFNpl02o5hN', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (13, 'plugin', 'stripe', 'secret_key', 'sk_test_FlsXnYjhoqLb6d5JzvpgKdMM', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (14, 'plugin', 'stripe', 'test_mode', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (15, 'plugin', 'paypal', 'sandbox_client_id', 'AUd6ePa2vrHkWWbbl82VS9mhQ1cLlPO868bulTOgVuejU4Lt4aFHRX1rasJ8-jZmPln48iLfni8nvbn7', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (16, 'plugin', 'paypal', 'sandbox_secret', 'EDRgLo5BWC_SBREGRY0X1-58h4j_4lntiavsFEiAXqnorulFXYzUAFHSNNIzaE1SZomBR3ObX-26E58i', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (17, 'plugin', 'paypal', 'live_client_id', 'AUd6ePa2vrHkWWbbl82VS9mhQ1cLlPO868bulTOgVuejU4Lt4aFHRX1rasJ8-jZmPln48iLfni8nvbn7', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (18, 'plugin', 'paypal', 'live_secret', 'EDRgLo5BWC_SBREGRY0X1-58h4j_4lntiavsFEiAXqnorulFXYzUAFHSNNIzaE1SZomBR3ObX-26E58i', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (19, 'plugin', 'paypal', 'sandbox_mode', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (20, 'system', 'base', 'logo', 'catalog/logo.png', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (21, 'system', 'base', 'placeholder', 'catalog/placeholder.png', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (22, 'system', 'base', 'favicon', 'catalog/favicon.png', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (23, 'system', 'base', 'meta_title', '开源好用的跨境电商系统', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (24, 'system', 'base', 'meta_description', 'BeikeShop 是一款开源好用的跨境电商建站系统，基于 Laravel 开发。主要面向外贸，和跨境行业。系统提供商品管理、订单管理、会员管理、支付、物流、系统管理等丰富功能', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (25, 'system', 'base', 'meta_keywords', '开源电商,开源代码,开源电商项目,b2b独立站,dtc独立站,跨境电商网', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (26, 'system', 'base', 'telephone', '028-88888888', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (27, 'system', 'base', 'email', 'support@example.com', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (28, 'plugin', 'flat_shipping', 'type', 'percent', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (29, 'plugin', 'flat_shipping', 'value', '10', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (30, 'system', 'base', 'default_customer_group_id', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (31, 'plugin', 'stripe', 'status', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (32, 'plugin', 'latest_products', 'status', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (33, 'plugin', 'flat_shipping', 'status', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (34, 'plugin', 'paypal', 'status', '1', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (35, 'system', 'base', 'rate_api_key', '', 0, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (36, 'system', 'base', 'menu_setting', '{\"menus\":[{\"isFull\":false,\"badge\":{\"isShow\":false,\"name\":{\"en\":\"\",\"zh_cn\":\"\"},\"bg_color\":\"#fd560f\",\"text_color\":\"#ffffff\"},\"link\":{\"type\":\"category\",\"value\":100006,\"text\":[],\"link\":\"\"},\"name\":{\"en\":\"Sports\",\"zh_cn\":\"\\u8fd0\\u52a8\\u6f6e\\u5427\"},\"isChildren\":false,\"childrenGroup\":[{\"name\":{\"en\":\"leading the fashion\",\"zh_cn\":\"\\u5f15\\u9886\\u65f6\\u5c1a\"},\"type\":\"\",\"image\":{\"image\":[],\"link\":{\"type\":\"product\",\"value\":\"\",\"text\":[]}},\"children\":[{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":3,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100008,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":5,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100003,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100010,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100010,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}}]},{\"name\":{\"en\":\"Special offer\",\"zh_cn\":\"\\u7279\\u4ef7\\u4f18\\u60e0\"},\"type\":\"link\",\"image\":{\"image\":[],\"link\":{\"type\":\"product\",\"value\":\"\",\"text\":[]}},\"children\":[{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100008,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":6,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100003,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":7,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":8,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":2,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}}]},{\"name\":{\"en\":\"Popular products\",\"zh_cn\":\"\\u7206\\u6b3e\\u5546\\u54c1\"},\"type\":\"image\",\"image\":{\"image\":{\"en\":\"catalog\\/demo\\/banner\\/2_en.jpg\",\"zh_cn\":\"catalog\\/demo\\/banner\\/2.jpg\"},\"link\":{\"type\":\"product\",\"value\":1,\"text\":[],\"link\":\"\"}},\"children\":[]}]},{\"isFull\":false,\"badge\":{\"isShow\":false,\"name\":{\"en\":\"NEW\",\"zh_cn\":\"\\u65b0\\u54c1\"},\"bg_color\":\"#7628A2\",\"text_color\":\"#ffffff\"},\"link\":{\"type\":\"category\",\"value\":100003,\"text\":[],\"link\":\"\"},\"name\":{\"en\":\"Fashion\",\"zh_cn\":\"\\u65f6\\u5c1a\\u6f6e\\u6d41\"},\"isChildren\":false,\"childrenGroup\":[{\"name\":{\"en\":\"global purchase\",\"zh_cn\":\"\\u5168\\u7403\\u8d2d\"},\"type\":\"link\",\"image\":{\"image\":[],\"link\":{\"type\":\"product\",\"value\":\"\",\"text\":[]}},\"children\":[{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":8,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\",\"new_window\":true}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100003,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":7,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"page\",\"value\":21,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}}]},{\"name\":{\"en\":\"Fashion\",\"zh_cn\":\"\\u65f6\\u5c1a\"},\"type\":\"image\",\"image\":{\"image\":{\"en\":\"catalog\\/demo\\/product\\/16.jpg\",\"zh_cn\":\"catalog\\/demo\\/product\\/16.jpg\"},\"link\":{\"type\":\"product\",\"value\":4,\"text\":[],\"link\":\"\"}},\"children\":[{\"name\":[],\"link\":{\"type\":\"custom\",\"value\":\"https:\\/\\/www.baidu.com\",\"text\":{\"en\":\"\",\"zh_cn\":\"baidu \"},\"link\":\"\",\"new_window\":true}}]},{\"name\":{\"en\":\"recommended\",\"zh_cn\":\"\\u5e97\\u957f\\u63a8\\u8350\"},\"type\":\"image\",\"image\":{\"image\":{\"en\":\"catalog\\/demo\\/product\\/13.jpg\",\"zh_cn\":\"catalog\\/demo\\/product\\/13.jpg\"},\"link\":{\"type\":\"product\",\"value\":2,\"text\":[],\"link\":\"\"}},\"children\":[]}]},{\"isFull\":false,\"badge\":{\"isShow\":false,\"name\":{\"en\":\"\",\"zh_cn\":\"\"},\"bg_color\":\"#fd560f\",\"text_color\":\"#ffffff\"},\"link\":{\"type\":\"category\",\"value\":100007,\"text\":[],\"link\":\"\"},\"name\":{\"en\":\"Digital\",\"zh_cn\":\"\\u6570\\u7801\\u4ea7\\u54c1\"},\"isChildren\":false,\"childrenGroup\":[{\"name\":{\"en\":\"Big promotion\",\"zh_cn\":\"\\u5927\\u724c\\u4fc3\\u9500\"},\"type\":\"\",\"image\":{\"image\":[],\"link\":{\"type\":\"product\",\"value\":\"\",\"text\":[]}},\"children\":[{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":2,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":8,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":9,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":1,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":6,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}}]},{\"name\":{\"en\":\"Activity of gift\",\"zh_cn\":\"\\u6d3b\\u52a8\\u793c\\u54c1\"},\"type\":\"\",\"image\":{\"image\":[],\"link\":{\"type\":\"product\",\"value\":\"\",\"text\":[]}},\"children\":[{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100003,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100006,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100012,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100006,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"category\",\"value\":100010,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}}]},{\"name\":{\"en\":\"All three fold\",\"zh_cn\":\"\\u5168\\u573a\\u4e09\\u6298\"},\"type\":\"\",\"image\":{\"image\":[],\"link\":{\"type\":\"product\",\"value\":\"\",\"text\":[]}},\"children\":[{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":1,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":3,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":7,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":8,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}},{\"name\":[],\"link\":{\"type\":\"brand\",\"value\":9,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}}]}]},{\"isFull\":false,\"badge\":{\"isShow\":false,\"name\":{\"en\":\"Hot\",\"zh_cn\":\"\\u70ed\\u5356\"},\"bg_color\":\"#FF4D00\",\"text_color\":\"#ffffff\"},\"link\":{\"type\":\"category\",\"value\":100018,\"text\":[],\"link\":\"\"},\"name\":{\"en\":\"Hot\",\"zh_cn\":\"\\u70ed\\u5356\\u7279\\u60e0\"},\"isChildren\":false,\"childrenGroup\":[]},{\"isFull\":false,\"badge\":{\"isShow\":false,\"name\":{\"en\":\"Sales\",\"zh_cn\":\"\\u5927\\u724c\\u76f4\\u9500\"},\"bg_color\":\"#00C5C5\",\"text_color\":\"#ffffff\"},\"link\":{\"type\":\"static\",\"value\":\"brands.index\",\"text\":[],\"link\":\"\"},\"name\":{\"en\":\"Brand\",\"zh_cn\":\"\\u56fd\\u9645\\u6f6e\\u724c\"},\"isChildren\":false,\"childrenGroup\":[]},{\"isFull\":false,\"badge\":{\"isShow\":false,\"name\":{\"en\":\"\",\"zh_cn\":\"\"},\"bg_color\":\"\",\"text_color\":\"\"},\"link\":{\"type\":\"page_category\",\"value\":\"1\",\"text\":[],\"link\":\"\"},\"name\":{\"en\":\"News\",\"zh_cn\":\"\\u516c\\u53f8\\u65b0\\u95fb\"},\"isChildren\":false,\"childrenGroup\":[]}]}', 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (37, 'system', 'base', 'design_setting', '{\"modules\":[{\"content\":{\"style\":{\"background_color\":\"\"},\"full\":true,\"floor\":{\"2\":\"\",\"3\":\"\"},\"images\":[{\"image\":{\"en\":\"catalog\\/demo\\/banner\\/banner-4-en.jpg\",\"zh_cn\":\"catalog\\/demo\\/banner\\/banner-4.jpg\"},\"show\":true,\"link\":{\"type\":\"category\",\"value\":100012,\"link\":\"\"}},{\"image\":{\"en\":\"catalog\\/demo\\/banner\\/banner-3-en.jpg\",\"zh_cn\":\"catalog\\/demo\\/banner\\/banner-3.jpg\"},\"show\":false,\"link\":{\"type\":\"category\",\"value\":100008,\"link\":\"\"}}]},\"code\":\"slideshow\",\"name\":\"\\u5e7b\\u706f\\u7247\",\"module_id\":\"b0448efb0989\"},{\"code\":\"image402\",\"content\":{\"style\":{\"background_color\":\"\"},\"floor\":{\"zh_cn\":\"\",\"en\":\"\"},\"title\":{\"zh_cn\":\"\\u65f6\\u5c1a\\u7a7f\\u642d\\u63a8\\u8350\",\"en\":\"Minimalist style outfit\"},\"sub_title\":{\"zh_cn\":\"\\u6781\\u7b80\\u98ce\\u7684\\u7a7f\\u642d\\uff0c\\u8d8a\\u7b80\\u5355\\u5c31\\u8d8a\\u9ad8\\u7ea7\\uff0c\\u8fd9\\u4e00\\u5957\\u7740\\u88c5\\u6253\\u626e\\u6574\\u4f53\\u662f\\u6bd4\\u8f83\\u4f11\\u95f2\\u8212\\u9002\\u7684\",\"en\":\"Minimalist style, the simpler, the more advanced, this outfit is casual and comfortable\"},\"images\":[{\"image\":\"catalog\\/demo\\/banner\\/banner-402-1.jpg\",\"show\":false,\"title\":{\"zh_cn\":\"\\u5973\\u4e0a\\u88c5\",\"en\":\"women\'s tops\"},\"link\":{\"type\":\"product\",\"value\":\"\",\"link\":\"\"}},{\"image\":\"catalog\\/demo\\/banner\\/banner-402-2.jpg\",\"show\":false,\"title\":{\"zh_cn\":\"\\u773c\\u955c\",\"en\":\"Glasses\"},\"link\":{\"type\":\"product\",\"value\":\"\",\"link\":\"\"}},{\"image\":\"catalog\\/demo\\/banner\\/banner-402-3.jpg\",\"show\":false,\"title\":{\"zh_cn\":\"\\u624b\\u8868\",\"en\":\"watch\"},\"link\":{\"type\":\"product\",\"value\":\"\",\"link\":\"\"}},{\"image\":\"catalog\\/demo\\/banner\\/banner-402-4.jpg\",\"show\":false,\"title\":{\"zh_cn\":\"\\u62a4\\u80a4\\u54c1\",\"en\":\"Skin care products\"},\"link\":{\"type\":\"product\",\"value\":\"\",\"link\":\"\"}}]},\"module_id\":\"00pS1Akotn8h58YZ\",\"name\":\"\\u4e00\\u884c\\u56db\\u56fe-2\",\"view_path\":\"\"},{\"code\":\"tab_product\",\"content\":{\"style\":{\"background_color\":\"\"},\"floor\":{\"zh_cn\":\"\",\"en\":\"\"},\"editableTabsValue\":\"0\",\"tabs\":[{\"title\":{\"zh_cn\":\"\\u65f6\\u5c1a\\u5355\\u54c1\",\"en\":\"Fashion sheet\"},\"products\":[5,9,10,11,12,13,14,15]},{\"title\":{\"zh_cn\":\"\\u6f6e\\u6d41\\u7a7f\\u642d\",\"en\":\"Trendy outfits\"},\"products\":[39,15,1,4,13,7,8,4]},{\"title\":{\"zh_cn\":\"\\u6700\\u65b0\\u4fc3\\u9500\",\"en\":\"Latest promotions\"},\"products\":[1,2,3,4,5,7,8,11]}],\"title\":{\"zh_cn\":\"\\u63a8\\u8350\\u5546\\u54c1\",\"en\":\"Fashion items\"}},\"module_id\":\"s6e7e3vucriazzbi\",\"name\":\"\\u9009\\u9879\\u5361\\u5546\\u54c1\"},{\"code\":\"image100\",\"content\":{\"style\":{\"background_color\":\"\"},\"floor\":{\"zh_cn\":\"\",\"en\":\"\"},\"full\":true,\"images\":[{\"image\":{\"zh_cn\":\"catalog\\/demo\\/banner\\/banner-2.jpg\",\"en\":\"\\/catalog\\/demo\\/banner\\/banner-2.jpg\"},\"show\":true,\"link\":{\"type\":\"category\",\"value\":100003,\"link\":\"\"}}]},\"module_id\":\"0htwy33z3xcituyx\",\"name\":\"\\u5355\\u56fe\\u6a21\\u5757\"},{\"code\":\"brand\",\"content\":{\"style\":{\"background_color\":\"\"},\"floor\":{\"en\":\"\",\"zh_cn\":\"\"},\"full\":true,\"title\":{\"en\":\"Recommended Brand\",\"zh_cn\":\"\\u63a8\\u8350\\u54c1\\u724c\"},\"brands\":[1,2,3,4,5,6,7,8,9,10,11,12]},\"module_id\":\"yln7isoqlxovqz3k\",\"name\":\"\\u54c1\\u724c\\u6a21\\u5757\"},{\"code\":\"page\",\"content\":{\"style\":{\"background_color\":\"\"},\"floor\":{\"zh_cn\":\"\",\"en\":\"\"},\"items\":[22,23,24,25],\"title\":{\"zh_cn\":\"\\u65b0\\u95fb\\u535a\\u5ba2\",\"en\":\"News Blog\"}},\"module_id\":\"24P9p4bRwk1nbtXE\",\"name\":\"\\u6587\\u7ae0\\u6a21\\u5757\",\"view_path\":\"\"}]}', 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
INSERT INTO `settings` VALUES (38, 'system', 'base', 'footer_setting', '{\"services\":{\"enable\":true,\"items\":[{\"image\":\"catalog\\/demo\\/services-icon\\/4.png\",\"title\":{\"en\":\"Material world\",\"zh_cn\":\"\\u7269\\u884c\\u5929\\u4e0b\"},\"sub_title\":{\"en\":\"Multi - warehouse fast delivery\",\"zh_cn\":\"\\u591a\\u4ed3\\u76f4\\u53d1 \\u6781\\u901f\\u914d\\u9001\\u591a\\u4ed3\\u76f4\\u53d1 \\u6781\\u901f\\u914d\\u9001\"},\"show\":false},{\"image\":\"catalog\\/demo\\/services-icon\\/3.png\",\"title\":{\"en\":\"Return all\",\"zh_cn\":\"\\u9000\\u6362\\u65e0\\u5fe7\"},\"sub_title\":{\"en\":\"Rest assured shopping return worry\",\"zh_cn\":\"\\u653e\\u5fc3\\u8d2d\\u7269 \\u9000\\u8fd8\\u65e0\\u5fe7\\u653e\\u5fc3\\u8d2d\\u7269 \\u9000\\u8fd8\\u65e0\\u5fe7\"},\"show\":false},{\"image\":\"catalog\\/demo\\/services-icon\\/1.png\",\"title\":{\"en\":\"Delicate service\",\"zh_cn\":\"\\u7cbe\\u81f4\\u670d\\u52a1\"},\"sub_title\":{\"en\":\"Exquisite service and after-sales guarantee\",\"zh_cn\":\"\\u7cbe\\u81f4\\u670d\\u52a1 \\u552e\\u540e\\u4fdd\\u969c\\u7cbe\\u81f4\\u670d\\u52a1 \\u552e\\u540e\\u4fdd\\u969c\"},\"show\":false},{\"image\":\"catalog\\/demo\\/services-icon\\/2.png\",\"title\":{\"en\":\"With reduced activity\",\"zh_cn\":\"\\u6ee1\\u51cf\\u6d3b\\u52a8\"},\"sub_title\":{\"en\":\"If 500 yuan is exceeded, a reduction of 90 yuan will be given\",\"zh_cn\":\"\\u6ee1500\\u5143\\u7acb\\u51cf90\\uff0c\\u65b0\\u7528\\u6237\\u7acb\\u51cf200\"},\"show\":true}]},\"content\":{\"intro\":{\"logo\":\"catalog\\/logo.png\",\"text\":{\"en\":\"<p>Chengdu Guangda Network Technology Co., Ltd. is a high-tech enterprise mainly engaged in Internet development. The company was established in August 2014.<\\/p>\",\"zh_cn\":\"<p style=\\\"line-height: 1.4;\\\"><strong>\\u6210\\u90fd\\u5149\\u5927\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8<\\/strong><\\/p>\\n<p style=\\\"line-height: 1.4;\\\">\\u662f\\u4e00\\u5bb6\\u4e13\\u4e1a\\u4e92\\u8054\\u7f51\\u5f00\\u53d1\\u7684\\u9ad8\\u79d1\\u6280\\u4f01\\u4e1a\\uff0c\\u516c\\u53f8\\u6210\\u7acb\\u4e8e2014\\u5e748\\u6708\\u3002<\\/p>\\n<p style=\\\"line-height: 1.4;\\\">\\u516c\\u53f8\\u4ee5\\u4e3a\\u5ba2\\u6237\\u521b\\u9020\\u4ef7\\u503c\\u4e3a\\u6838\\u5fc3\\u4ef7\\u503c\\u89c2\\uff0c\\u5e2e\\u52a9\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u5229\\u7528\\u4e92\\u8054\\u7f51\\u5de5\\u5177\\u63d0\\u5347\\u4ea7\\u54c1\\u9500\\u552e\\u3002<\\/p>\"},\"social_network\":[{\"image\":\"\\/catalog\\/demo\\/social\\/twitter.png\",\"link\":\"\\/\",\"show\":false},{\"image\":\"\\/catalog\\/demo\\/social\\/facebook.png\",\"link\":\"\\/\",\"show\":false},{\"image\":\"\\/catalog\\/demo\\/social\\/youtube.png\",\"link\":\"\\/\",\"show\":false},{\"image\":\"\\/catalog\\/demo\\/social\\/instagram.png\",\"link\":\"\\/\",\"show\":false},{\"image\":\"\\/catalog\\/demo\\/social\\/pinterest.png\",\"link\":\"\\/\",\"show\":false}]},\"link1\":{\"title\":{\"en\":\"About us\",\"zh_cn\":\"\\u5173\\u4e8e\\u6211\\u4eec\"},\"links\":[{\"link\":\"\",\"type\":\"page\",\"value\":21,\"text\":{\"en\":\"About us\",\"zh_cn\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}},{\"type\":\"page\",\"value\":18,\"text\":[],\"link\":\"\"},{\"type\":\"page\",\"value\":12,\"text\":[],\"link\":\"\"},{\"type\":\"static\",\"value\":\"account.order.index\",\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}]},\"link2\":{\"title\":{\"en\":\"Account\",\"zh_cn\":\"\\u4f1a\\u5458\\u4e2d\\u5fc3\"},\"links\":[{\"type\":\"static\",\"value\":\"account.index\",\"text\":[],\"link\":\"\"},{\"type\":\"static\",\"value\":\"account.order.index\",\"text\":[],\"link\":\"\"},{\"type\":\"static\",\"value\":\"account.wishlist.index\",\"text\":[],\"link\":\"\"},{\"type\":\"static\",\"value\":\"brands.index\",\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}]},\"link3\":{\"title\":{\"en\":\"Other\",\"zh_cn\":\"\\u5176\\u4ed6\"},\"links\":[{\"type\":\"static\",\"value\":\"brands.index\",\"text\":[],\"link\":\"\"},{\"type\":\"static\",\"value\":\"account.index\",\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"},{\"type\":\"page\",\"value\":20,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"},{\"type\":\"page\",\"value\":21,\"text\":{\"en\":\"\",\"zh_cn\":\"\"},\"link\":\"\"}]},\"contact\":{\"telephone\":\"028-88888888\",\"address\":{\"en\":\"Your company address\",\"zh_cn\":\"\\u60a8\\u7684\\u516c\\u53f8\\u5730\\u5740\"},\"email\":\"support@example.com\"}},\"bottom\":{\"copyright\":{\"en\":\"<div>Chengdu Guangda Network Technology &copy; 2023<\\/div>\",\"zh_cn\":\"<div>\\u6210\\u90fd\\u5149\\u5927\\u7f51\\u7edc\\u79d1\\u6280 &copy; 2023<\\/div>\"},\"image\":\"catalog\\/demo\\/banner\\/pay_icons.png\"}}', 1, '2024-08-03 23:23:37', '2024-08-03 23:23:37');
COMMIT;

-- ----------------------------
-- Table structure for tax_classes
-- ----------------------------
DROP TABLE IF EXISTS `tax_classes`;
CREATE TABLE `tax_classes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税类标题',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税类描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='税类';

-- ----------------------------
-- Records of tax_classes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `region_id` int(11) NOT NULL COMMENT '区域组 ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税率值',
  `type` enum('percent','flat') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型, percent:百分比, flat:固定值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='税率';

-- ----------------------------
-- Records of tax_rates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_rules
-- ----------------------------
DROP TABLE IF EXISTS `tax_rules`;
CREATE TABLE `tax_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tax_class_id` int(11) NOT NULL COMMENT '税类 ID',
  `tax_rate_id` int(11) NOT NULL COMMENT '税率 ID',
  `based` enum('store','payment','shipping') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址类型',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_class_id` (`tax_class_id`),
  KEY `tax_rate_id` (`tax_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='税费规则';

-- ----------------------------
-- Records of tax_rules
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for verify_codes
-- ----------------------------
DROP TABLE IF EXISTS `verify_codes`;
CREATE TABLE `verify_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='验证码';

-- ----------------------------
-- Records of verify_codes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for zones
-- ----------------------------
DROP TABLE IF EXISTS `zones`;
CREATE TABLE `zones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `country_id` int(10) unsigned NOT NULL COMMENT '国家 ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码',
  `sort_order` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '是否启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='省份、州';

-- ----------------------------
-- Records of zones
-- ----------------------------
BEGIN;
INSERT INTO `zones` VALUES (1, 1, 'Badakhshan', 'BDS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2, 1, 'Badghis', 'BDG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3, 1, 'Baghlan', 'BGL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4, 1, 'Balkh', 'BAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (5, 1, 'Bamian', 'BAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (6, 1, 'Farah', 'FRA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (7, 1, 'Faryab', 'FYB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (8, 1, 'Ghazni', 'GHA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (9, 1, 'Ghowr', 'GHO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (10, 1, 'Helmand', 'HEL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (11, 1, 'Herat', 'HER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (12, 1, 'Jowzjan', 'JOW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (13, 1, 'Kabul', 'KAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (14, 1, 'Kandahar', 'KAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (15, 1, 'Kapisa', 'KAP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (16, 1, 'Khost', 'KHO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (17, 1, 'Konar', 'KNR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (18, 1, 'Kondoz', 'KDZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (19, 1, 'Laghman', 'LAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (20, 1, 'Lowgar', 'LOW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (21, 1, 'Nangrahar', 'NAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (22, 1, 'Nimruz', 'NIM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (23, 1, 'Nurestan', 'NUR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (24, 1, 'Oruzgan', 'ORU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (25, 1, 'Paktia', 'PIA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (26, 1, 'Paktika', 'PKA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (27, 1, 'Parwan', 'PAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (28, 1, 'Samangan', 'SAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (29, 1, 'Sar-e Pol', 'SAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (30, 1, 'Takhar', 'TAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (31, 1, 'Wardak', 'WAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (32, 1, 'Zabol', 'ZAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (33, 2, 'Berat', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (34, 2, 'Bulqize', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (35, 2, 'Delvine', 'DL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (36, 2, 'Devoll', 'DV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (37, 2, 'Diber', 'DI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (38, 2, 'Durres', 'DR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (39, 2, 'Elbasan', 'EL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (40, 2, 'Kolonje', 'ER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (41, 2, 'Fier', 'FR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (42, 2, 'Gjirokaster', 'GJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (43, 2, 'Gramsh', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (44, 2, 'Has', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (45, 2, 'Kavaje', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (46, 2, 'Kurbin', 'KB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (47, 2, 'Kucove', 'KC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (48, 2, 'Korce', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (49, 2, 'Kruje', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (50, 2, 'Kukes', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (51, 2, 'Librazhd', 'LB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (52, 2, 'Lezhe', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (53, 2, 'Lushnje', 'LU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (54, 2, 'Malesi e Madhe', 'MM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (55, 2, 'Mallakaster', 'MK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (56, 2, 'Mat', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (57, 2, 'Mirdite', 'MR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (58, 2, 'Peqin', 'PQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (59, 2, 'Permet', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (60, 2, 'Pogradec', 'PG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (61, 2, 'Puke', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (62, 2, 'Shkoder', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (63, 2, 'Skrapar', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (64, 2, 'Sarande', 'SR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (65, 2, 'Tepelene', 'TE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (66, 2, 'Tropoje', 'TP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (67, 2, 'Tirane', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (68, 2, 'Vlore', 'VL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (69, 3, 'Adrar', 'ADR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (70, 3, 'Ain Defla', 'ADE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (71, 3, 'Ain Temouchent', 'ATE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (72, 3, 'Alger', 'ALG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (73, 3, 'Annaba', 'ANN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (74, 3, 'Batna', 'BAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (75, 3, 'Bechar', 'BEC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (76, 3, 'Bejaia', 'BEJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (77, 3, 'Biskra', 'BIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (78, 3, 'Blida', 'BLI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (79, 3, 'Bordj Bou Arreridj', 'BBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (80, 3, 'Bouira', 'BOA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (81, 3, 'Boumerdes', 'BMD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (82, 3, 'Chlef', 'CHL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (83, 3, 'Constantine', 'CON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (84, 3, 'Djelfa', 'DJE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (85, 3, 'El Bayadh', 'EBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (86, 3, 'El Oued', 'EOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (87, 3, 'El Tarf', 'ETA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (88, 3, 'Ghardaia', 'GHA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (89, 3, 'Guelma', 'GUE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (90, 3, 'Illizi', 'ILL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (91, 3, 'Jijel', 'JIJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (92, 3, 'Khenchela', 'KHE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (93, 3, 'Laghouat', 'LAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (94, 3, 'Muaskar', 'MUA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (95, 3, 'Medea', 'MED', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (96, 3, 'Mila', 'MIL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (97, 3, 'Mostaganem', 'MOS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (98, 3, 'M\'Sila', 'MSI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (99, 3, 'Naama', 'NAA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (100, 3, 'Oran', 'ORA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (101, 3, 'Ouargla', 'OUA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (102, 3, 'Oum el-Bouaghi', 'OEB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (103, 3, 'Relizane', 'REL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (104, 3, 'Saida', 'SAI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (105, 3, 'Setif', 'SET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (106, 3, 'Sidi Bel Abbes', 'SBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (107, 3, 'Skikda', 'SKI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (108, 3, 'Souk Ahras', 'SAH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (109, 3, 'Tamanghasset', 'TAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (110, 3, 'Tebessa', 'TEB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (111, 3, 'Tiaret', 'TIA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (112, 3, 'Tindouf', 'TIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (113, 3, 'Tipaza', 'TIP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (114, 3, 'Tissemsilt', 'TIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (115, 3, 'Tizi Ouzou', 'TOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (116, 3, 'Tlemcen', 'TLE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (117, 4, 'Eastern', 'E', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (118, 4, 'Manu\'a', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (119, 4, 'Rose Island', 'R', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (120, 4, 'Swains Island', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (121, 4, 'Western', 'W', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (122, 5, 'Andorra la Vella', 'ALV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (123, 5, 'Canillo', 'CAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (124, 5, 'Encamp', 'ENC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (125, 5, 'Escaldes-Engordany', 'ESE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (126, 5, 'La Massana', 'LMA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (127, 5, 'Ordino', 'ORD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (128, 5, 'Sant Julia de Loria', 'SJL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (129, 6, 'Bengo', 'BGO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (130, 6, 'Benguela', 'BGU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (131, 6, 'Bie', 'BIE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (132, 6, 'Cabinda', 'CAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (133, 6, 'Cuando-Cubango', 'CCU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (134, 6, 'Cuanza Norte', 'CNO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (135, 6, 'Cuanza Sul', 'CUS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (136, 6, 'Cunene', 'CNN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (137, 6, 'Huambo', 'HUA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (138, 6, 'Huila', 'HUI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (139, 6, 'Luanda', 'LUA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (140, 6, 'Lunda Norte', 'LNO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (141, 6, 'Lunda Sul', 'LSU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (142, 6, 'Malange', 'MAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (143, 6, 'Moxico', 'MOX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (144, 6, 'Namibe', 'NAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (145, 6, 'Uige', 'UIG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (146, 6, 'Zaire', 'ZAI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (147, 9, 'Saint George', 'ASG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (148, 9, 'Saint John', 'ASJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (149, 9, 'Saint Mary', 'ASM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (150, 9, 'Saint Paul', 'ASL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (151, 9, 'Saint Peter', 'ASR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (152, 9, 'Saint Philip', 'ASH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (153, 9, 'Barbuda', 'BAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (154, 9, 'Redonda', 'RED', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (155, 10, 'Antartida e Islas del Atlantico', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (156, 10, 'Buenos Aires', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (157, 10, 'Catamarca', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (158, 10, 'Chaco', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (159, 10, 'Chubut', 'CU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (160, 10, 'Cordoba', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (161, 10, 'Corrientes', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (162, 10, 'Distrito Federal', 'DF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (163, 10, 'Entre Rios', 'ER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (164, 10, 'Formosa', 'FO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (165, 10, 'Jujuy', 'JU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (166, 10, 'La Pampa', 'LP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (167, 10, 'La Rioja', 'LR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (168, 10, 'Mendoza', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (169, 10, 'Misiones', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (170, 10, 'Neuquen', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (171, 10, 'Rio Negro', 'RN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (172, 10, 'Salta', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (173, 10, 'San Juan', 'SJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (174, 10, 'San Luis', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (175, 10, 'Santa Cruz', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (176, 10, 'Santa Fe', 'SF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (177, 10, 'Santiago del Estero', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (178, 10, 'Tierra del Fuego', 'TF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (179, 10, 'Tucuman', 'TU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (180, 11, 'Aragatsotn', 'AGT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (181, 11, 'Ararat', 'ARR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (182, 11, 'Armavir', 'ARM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (183, 11, 'Geghark\'unik\'', 'GEG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (184, 11, 'Kotayk\'', 'KOT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (185, 11, 'Lorri', 'LOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (186, 11, 'Shirak', 'SHI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (187, 11, 'Syunik\'', 'SYU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (188, 11, 'Tavush', 'TAV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (189, 11, 'Vayots\' Dzor', 'VAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (190, 11, 'Yerevan', 'YER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (191, 13, 'Australian Capital Territory', 'ACT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (192, 13, 'New South Wales', 'NSW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (193, 13, 'Northern Territory', 'NT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (194, 13, 'Queensland', 'QLD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (195, 13, 'South Australia', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (196, 13, 'Tasmania', 'TAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (197, 13, 'Victoria', 'VIC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (198, 13, 'Western Australia', 'WA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (199, 14, 'Burgenland', 'BUR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (200, 14, 'Kärnten', 'KAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (201, 14, 'Niederösterreich', 'NOS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (202, 14, 'Oberösterreich', 'OOS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (203, 14, 'Salzburg', 'SAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (204, 14, 'Steiermark', 'STE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (205, 14, 'Tirol', 'TIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (206, 14, 'Vorarlberg', 'VOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (207, 14, 'Wien', 'WIE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (208, 15, 'Ali Bayramli', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (209, 15, 'Abseron', 'ABS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (210, 15, 'AgcabAdi', 'AGC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (211, 15, 'Agdam', 'AGM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (212, 15, 'Agdas', 'AGS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (213, 15, 'Agstafa', 'AGA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (214, 15, 'Agsu', 'AGU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (215, 15, 'Astara', 'AST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (216, 15, 'Baki', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (217, 15, 'BabAk', 'BAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (218, 15, 'BalakAn', 'BAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (219, 15, 'BArdA', 'BAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (220, 15, 'Beylaqan', 'BEY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (221, 15, 'Bilasuvar', 'BIL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (222, 15, 'Cabrayil', 'CAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (223, 15, 'Calilabab', 'CAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (224, 15, 'Culfa', 'CUL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (225, 15, 'Daskasan', 'DAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (226, 15, 'Davaci', 'DAV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (227, 15, 'Fuzuli', 'FUZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (228, 15, 'Ganca', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (229, 15, 'Gadabay', 'GAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (230, 15, 'Goranboy', 'GOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (231, 15, 'Goycay', 'GOY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (232, 15, 'Haciqabul', 'HAC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (233, 15, 'Imisli', 'IMI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (234, 15, 'Ismayilli', 'ISM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (235, 15, 'Kalbacar', 'KAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (236, 15, 'Kurdamir', 'KUR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (237, 15, 'Lankaran', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (238, 15, 'Lacin', 'LAC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (239, 15, 'Lankaran', 'LAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (240, 15, 'Lerik', 'LER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (241, 15, 'Masalli', 'MAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (242, 15, 'Mingacevir', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (243, 15, 'Naftalan', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (244, 15, 'Neftcala', 'NEF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (245, 15, 'Oguz', 'OGU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (246, 15, 'Ordubad', 'ORD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (247, 15, 'Qabala', 'QAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (248, 15, 'Qax', 'QAX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (249, 15, 'Qazax', 'QAZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (250, 15, 'Qobustan', 'QOB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (251, 15, 'Quba', 'QBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (252, 15, 'Qubadli', 'QBI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (253, 15, 'Qusar', 'QUS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (254, 15, 'Saki', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (255, 15, 'Saatli', 'SAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (256, 15, 'Sabirabad', 'SAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (257, 15, 'Sadarak', 'SAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (258, 15, 'Sahbuz', 'SAH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (259, 15, 'Saki', 'SAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (260, 15, 'Salyan', 'SAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (261, 15, 'Sumqayit', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (262, 15, 'Samaxi', 'SMI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (263, 15, 'Samkir', 'SKR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (264, 15, 'Samux', 'SMX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (265, 15, 'Sarur', 'SAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (266, 15, 'Siyazan', 'SIY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (267, 15, 'Susa', 'SS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (268, 15, 'Susa', 'SUS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (269, 15, 'Tartar', 'TAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (270, 15, 'Tovuz', 'TOV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (271, 15, 'Ucar', 'UCA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (272, 15, 'Xankandi', 'XA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (273, 15, 'Xacmaz', 'XAC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (274, 15, 'Xanlar', 'XAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (275, 15, 'Xizi', 'XIZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (276, 15, 'Xocali', 'XCI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (277, 15, 'Xocavand', 'XVD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (278, 15, 'Yardimli', 'YAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (279, 15, 'Yevlax', 'YEV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (280, 15, 'Zangilan', 'ZAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (281, 15, 'Zaqatala', 'ZAQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (282, 15, 'Zardab', 'ZAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (283, 15, 'Naxcivan', 'NX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (284, 16, 'Acklins', 'ACK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (285, 16, 'Berry Islands', 'BER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (286, 16, 'Bimini', 'BIM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (287, 16, 'Black Point', 'BLK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (288, 16, 'Cat Island', 'CAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (289, 16, 'Central Abaco', 'CAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (290, 16, 'Central Andros', 'CAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (291, 16, 'Central Eleuthera', 'CEL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (292, 16, 'City of Freeport', 'FRE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (293, 16, 'Crooked Island', 'CRO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (294, 16, 'East Grand Bahama', 'EGB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (295, 16, 'Exuma', 'EXU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (296, 16, 'Grand Cay', 'GRD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (297, 16, 'Harbour Island', 'HAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (298, 16, 'Hope Town', 'HOP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (299, 16, 'Inagua', 'INA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (300, 16, 'Long Island', 'LNG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (301, 16, 'Mangrove Cay', 'MAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (302, 16, 'Mayaguana', 'MAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (303, 16, 'Moore\'s Island', 'MOO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (304, 16, 'North Abaco', 'NAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (305, 16, 'North Andros', 'NAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (306, 16, 'North Eleuthera', 'NEL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (307, 16, 'Ragged Island', 'RAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (308, 16, 'Rum Cay', 'RUM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (309, 16, 'San Salvador', 'SAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (310, 16, 'South Abaco', 'SAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (311, 16, 'South Andros', 'SAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (312, 16, 'South Eleuthera', 'SEL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (313, 16, 'Spanish Wells', 'SWE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (314, 16, 'West Grand Bahama', 'WGB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (315, 17, 'Capital', 'CAP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (316, 17, 'Central', 'CEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (317, 17, 'Muharraq', 'MUH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (318, 17, 'Northern', 'NOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (319, 17, 'Southern', 'SOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (320, 18, 'Barisal', 'BAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (321, 18, 'Chittagong', 'CHI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (322, 18, 'Dhaka', 'DHA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (323, 18, 'Khulna', 'KHU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (324, 18, 'Rajshahi', 'RAJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (325, 18, 'Sylhet', 'SYL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (326, 19, 'Christ Church', 'CC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (327, 19, 'Saint Andrew', 'AND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (328, 19, 'Saint George', 'GEO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (329, 19, 'Saint James', 'JAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (330, 19, 'Saint John', 'JOH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (331, 19, 'Saint Joseph', 'JOS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (332, 19, 'Saint Lucy', 'LUC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (333, 19, 'Saint Michael', 'MIC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (334, 19, 'Saint Peter', 'PET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (335, 19, 'Saint Philip', 'PHI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (336, 19, 'Saint Thomas', 'THO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (337, 20, 'Brestskaya (Brest)', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (338, 20, 'Homyel\'skaya (Homyel\')', 'HO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (339, 20, 'Horad Minsk', 'HM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (342, 20, 'Minskaya', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (344, 21, 'Antwerpen', 'VAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (345, 21, 'Brabant Wallon', 'WBR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (346, 21, 'Hainaut', 'WHT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (347, 21, 'Liège', 'WLG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (348, 21, 'Limburg', 'VLI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (349, 21, 'Luxembourg', 'WLX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (350, 21, 'Namur', 'WNA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (351, 21, 'Oost-Vlaanderen', 'VOV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (352, 21, 'Vlaams Brabant', 'VBR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (353, 21, 'West-Vlaanderen', 'VWV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (354, 22, 'Belize', 'BZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (355, 22, 'Cayo', 'CY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (356, 22, 'Corozal', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (357, 22, 'Orange Walk', 'OW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (358, 22, 'Stann Creek', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (359, 22, 'Toledo', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (360, 23, 'Alibori', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (361, 23, 'Atakora', 'AK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (362, 23, 'Atlantique', 'AQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (363, 23, 'Borgou', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (364, 23, 'Collines', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (365, 23, 'Donga', 'DO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (366, 23, 'Kouffo', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (367, 23, 'Littoral', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (368, 23, 'Mono', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (369, 23, 'Oueme', 'OU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (370, 23, 'Plateau', 'PL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (371, 23, 'Zou', 'ZO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (372, 24, 'Devonshire', 'DS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (373, 24, 'Hamilton City', 'HC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (374, 24, 'Hamilton', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (375, 24, 'Paget', 'PG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (376, 24, 'Pembroke', 'PB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (377, 24, 'Saint George City', 'GC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (378, 24, 'Saint George\'s', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (379, 24, 'Sandys', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (380, 24, 'Smith\'s', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (381, 24, 'Southampton', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (382, 24, 'Warwick', 'WA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (383, 25, 'Bumthang', 'BUM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (384, 25, 'Chukha', 'CHU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (385, 25, 'Dagana', 'DAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (386, 25, 'Gasa', 'GAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (387, 25, 'Haa', 'HAA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (388, 25, 'Lhuntse', 'LHU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (389, 25, 'Mongar', 'MON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (390, 25, 'Paro', 'PAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (391, 25, 'Pemagatshel', 'PEM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (392, 25, 'Punakha', 'PUN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (393, 25, 'Samdrup Jongkhar', 'SJO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (394, 25, 'Samtse', 'SAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (395, 25, 'Sarpang', 'SAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (396, 25, 'Thimphu', 'THI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (397, 25, 'Trashigang', 'TRG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (398, 25, 'Trashiyangste', 'TRY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (399, 25, 'Trongsa', 'TRO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (400, 25, 'Tsirang', 'TSI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (401, 25, 'Wangdue Phodrang', 'WPH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (402, 25, 'Zhemgang', 'ZHE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (403, 26, 'Beni', 'BEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (404, 26, 'Chuquisaca', 'CHU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (405, 26, 'Cochabamba', 'COC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (406, 26, 'La Paz', 'LPZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (407, 26, 'Oruro', 'ORU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (408, 26, 'Pando', 'PAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (409, 26, 'Potosi', 'POT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (410, 26, 'Santa Cruz', 'SCZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (411, 26, 'Tarija', 'TAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (412, 27, 'Brcko district', 'BRO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (413, 27, 'Unsko-Sanski Kanton', 'FUS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (414, 27, 'Posavski Kanton', 'FPO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (415, 27, 'Tuzlanski Kanton', 'FTU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (418, 27, 'Srednjebosanski Kanton', 'FSB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (421, 27, 'Kanton Sarajevo', 'FSA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (422, 27, 'Zapadnobosanska', 'FZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (423, 27, 'Banja Luka', 'SBL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (424, 27, 'Doboj', 'SDO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (425, 27, 'Bijeljina', 'SBI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (426, 27, 'Vlasenica', 'SVL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (428, 27, 'Foca', 'SFO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (429, 27, 'Trebinje', 'STR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (430, 28, 'Central', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (431, 28, 'Ghanzi', 'GH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (432, 28, 'Kgalagadi', 'KD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (433, 28, 'Kgatleng', 'KT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (434, 28, 'Kweneng', 'KW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (435, 28, 'Ngamiland', 'NG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (436, 28, 'North East', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (437, 28, 'North West', 'NW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (438, 28, 'South East', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (439, 28, 'Southern', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (440, 30, 'Acre', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (441, 30, 'Alagoas', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (442, 30, 'Amapá', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (443, 30, 'Amazonas', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (444, 30, 'Bahia', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (445, 30, 'Ceará', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (446, 30, 'Distrito Federal', 'DF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (447, 30, 'Espírito Santo', 'ES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (448, 30, 'Goiás', 'GO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (449, 30, 'Maranhão', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (450, 30, 'Mato Grosso', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (451, 30, 'Mato Grosso do Sul', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (452, 30, 'Minas Gerais', 'MG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (453, 30, 'Pará', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (454, 30, 'Paraíba', 'PB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (455, 30, 'Paraná', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (456, 30, 'Pernambuco', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (457, 30, 'Piauí', 'PI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (458, 30, 'Rio de Janeiro', 'RJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (459, 30, 'Rio Grande do Norte', 'RN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (460, 30, 'Rio Grande do Sul', 'RS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (461, 30, 'Rondônia', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (462, 30, 'Roraima', 'RR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (463, 30, 'Santa Catarina', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (464, 30, 'São Paulo', 'SP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (465, 30, 'Sergipe', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (466, 30, 'Tocantins', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (467, 31, 'Peros Banhos', 'PB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (468, 31, 'Salomon Islands', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (469, 31, 'Nelsons Island', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (470, 31, 'Three Brothers', 'TB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (471, 31, 'Eagle Islands', 'EA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (472, 31, 'Danger Island', 'DI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (473, 31, 'Egmont Islands', 'EG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (474, 31, 'Diego Garcia', 'DG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (475, 32, 'Belait', 'BEL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (476, 32, 'Brunei and Muara', 'BRM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (477, 32, 'Temburong', 'TEM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (478, 32, 'Tutong', 'TUT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (479, 33, 'Blagoevgrad', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (480, 33, 'Burgas', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (481, 33, 'Dobrich', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (482, 33, 'Gabrovo', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (483, 33, 'Haskovo', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (484, 33, 'Kardjali', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (485, 33, 'Kyustendil', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (486, 33, 'Lovech', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (487, 33, 'Montana', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (488, 33, 'Pazardjik', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (489, 33, 'Pernik', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (490, 33, 'Pleven', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (491, 33, 'Plovdiv', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (492, 33, 'Razgrad', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (493, 33, 'Shumen', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (494, 33, 'Silistra', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (495, 33, 'Sliven', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (496, 33, 'Smolyan', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (497, 33, 'Sofia', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (498, 33, 'Sofia - town', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (499, 33, 'Stara Zagora', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (500, 33, 'Targovishte', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (501, 33, 'Varna', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (502, 33, 'Veliko Tarnovo', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (503, 33, 'Vidin', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (504, 33, 'Vratza', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (505, 33, 'Yambol', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (506, 34, 'Bale', 'BAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (507, 34, 'Bam', 'BAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (508, 34, 'Banwa', 'BAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (509, 34, 'Bazega', 'BAZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (510, 34, 'Bougouriba', 'BOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (511, 34, 'Boulgou', 'BLG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (512, 34, 'Boulkiemde', 'BOK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (513, 34, 'Comoe', 'COM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (514, 34, 'Ganzourgou', 'GAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (515, 34, 'Gnagna', 'GNA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (516, 34, 'Gourma', 'GOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (517, 34, 'Houet', 'HOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (518, 34, 'Ioba', 'IOA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (519, 34, 'Kadiogo', 'KAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (520, 34, 'Kenedougou', 'KEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (521, 34, 'Komondjari', 'KOD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (522, 34, 'Kompienga', 'KOP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (523, 34, 'Kossi', 'KOS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (524, 34, 'Koulpelogo', 'KOL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (525, 34, 'Kouritenga', 'KOT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (526, 34, 'Kourweogo', 'KOW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (527, 34, 'Leraba', 'LER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (528, 34, 'Loroum', 'LOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (529, 34, 'Mouhoun', 'MOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (530, 34, 'Nahouri', 'NAH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (531, 34, 'Namentenga', 'NAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (532, 34, 'Nayala', 'NAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (533, 34, 'Noumbiel', 'NOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (534, 34, 'Oubritenga', 'OUB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (535, 34, 'Oudalan', 'OUD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (536, 34, 'Passore', 'PAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (537, 34, 'Poni', 'PON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (538, 34, 'Sanguie', 'SAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (539, 34, 'Sanmatenga', 'SAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (540, 34, 'Seno', 'SEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (541, 34, 'Sissili', 'SIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (542, 34, 'Soum', 'SOM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (543, 34, 'Sourou', 'SOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (544, 34, 'Tapoa', 'TAP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (545, 34, 'Tuy', 'TUY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (546, 34, 'Yagha', 'YAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (547, 34, 'Yatenga', 'YAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (548, 34, 'Ziro', 'ZIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (549, 34, 'Zondoma', 'ZOD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (550, 34, 'Zoundweogo', 'ZOW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (551, 35, 'Bubanza', 'BB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (552, 35, 'Bujumbura', 'BJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (553, 35, 'Bururi', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (554, 35, 'Cankuzo', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (555, 35, 'Cibitoke', 'CI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (556, 35, 'Gitega', 'GI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (557, 35, 'Karuzi', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (558, 35, 'Kayanza', 'KY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (559, 35, 'Kirundo', 'KI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (560, 35, 'Makamba', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (561, 35, 'Muramvya', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (562, 35, 'Muyinga', 'MY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (563, 35, 'Mwaro', 'MW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (564, 35, 'Ngozi', 'NG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (565, 35, 'Rutana', 'RT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (566, 35, 'Ruyigi', 'RY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (567, 36, 'Phnom Penh', 'PP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (569, 36, 'Pailin', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (570, 36, 'Keb', 'KB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (571, 36, 'Banteay Meanchey', 'BM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (572, 36, 'Battambang', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (573, 36, 'Kampong Cham', 'KM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (574, 36, 'Kampong Chhnang', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (575, 36, 'Kampong Speu', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (576, 36, 'Kampong Som', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (577, 36, 'Kampong Thom', 'KT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (578, 36, 'Kampot', 'KP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (579, 36, 'Kandal', 'KL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (580, 36, 'Kaoh Kong', 'KK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (581, 36, 'Kratie', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (582, 36, 'Mondul Kiri', 'MK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (583, 36, 'Oddar Meancheay', 'OM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (584, 36, 'Pursat', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (585, 36, 'Preah Vihear', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (586, 36, 'Prey Veng', 'PG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (587, 36, 'Ratanak Kiri', 'RK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (588, 36, 'Siemreap', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (589, 36, 'Stung Treng', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (590, 36, 'Svay Rieng', 'SR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (591, 36, 'Takeo', 'TK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (592, 37, 'Adamawa (Adamaoua)', 'ADA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (593, 37, 'Centre', 'CEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (594, 37, 'East (Est)', 'EST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (596, 37, 'Littoral', 'LIT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (597, 37, 'North (Nord)', 'NOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (598, 37, 'Northwest (Nord-Ouest)', 'NOT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (599, 37, 'West (Ouest)', 'OUE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (600, 37, 'South (Sud)', 'SUD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (601, 37, 'Southwest (Sud-Ouest).', 'SOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (602, 38, 'Alberta', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (603, 38, 'British Columbia', 'BC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (604, 38, 'Manitoba', 'MB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (605, 38, 'New Brunswick', 'NB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (606, 38, 'Newfoundland and Labrador', 'NL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (607, 38, 'Northwest Territories', 'NT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (608, 38, 'Nova Scotia', 'NS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (609, 38, 'Nunavut', 'NU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (610, 38, 'Ontario', 'ON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (611, 38, 'Prince Edward Island', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (612, 38, 'Qu&eacute;bec', 'QC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (613, 38, 'Saskatchewan', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (614, 38, 'Yukon Territory', 'YT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (615, 39, 'Boa Vista', 'BV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (616, 39, 'Brava', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (617, 39, 'Calheta de Sao Miguel', 'CS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (618, 39, 'Maio', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (619, 39, 'Mosteiros', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (620, 39, 'Paul', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (621, 39, 'Porto Novo', 'PN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (622, 39, 'Praia', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (623, 39, 'Ribeira Grande', 'RG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (624, 39, 'Sal', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (625, 39, 'Santa Catarina', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (626, 39, 'Santa Cruz', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (627, 39, 'Sao Domingos', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (628, 39, 'Sao Filipe', 'SF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (629, 39, 'Sao Nicolau', 'SN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (630, 39, 'Sao Vicente', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (631, 39, 'Tarrafal', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (632, 40, 'Creek', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (633, 40, 'Eastern', 'EA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (634, 40, 'Midland', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (635, 40, 'South Town', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (636, 40, 'Spot Bay', 'SP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (637, 40, 'Stake Bay', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (638, 40, 'West End', 'WD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (639, 40, 'Western', 'WN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (640, 41, 'Bamingui-Bangoran', 'BBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (641, 41, 'Basse-Kotto', 'BKO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (642, 41, 'Haute-Kotto', 'HKO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (643, 41, 'Haut-Mbomou', 'HMB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (644, 41, 'Kemo', 'KEM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (645, 41, 'Lobaye', 'LOB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (646, 41, 'Mambere-KadeÔ', 'MKD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (647, 41, 'Mbomou', 'MBO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (648, 41, 'Nana-Mambere', 'NMM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (649, 41, 'Ombella-M\'Poko', 'OMP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (650, 41, 'Ouaka', 'OUK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (651, 41, 'Ouham', 'OUH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (652, 41, 'Ouham-Pende', 'OPE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (653, 41, 'Vakaga', 'VAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (654, 41, 'Nana-Grebizi', 'NGR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (655, 41, 'Sangha-Mbaere', 'SMB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (656, 41, 'Bangui', 'BAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (657, 42, 'Batha', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (658, 42, 'Biltine', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (660, 42, 'Chari-Baguirmi', 'CB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (661, 42, 'Guera', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (662, 42, 'Kanem', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (663, 42, 'Lac', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (664, 42, 'Logone Occidental', 'LC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (665, 42, 'Logone Oriental', 'LR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (666, 42, 'Mayo-Kebbi', 'MK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (667, 42, 'Moyen-Chari', 'MC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (668, 42, 'Ouaddai', 'OU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (669, 42, 'Salamat', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (670, 42, 'Tandjile', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (671, 43, 'Aisen del General Carlos Ibanez', 'AI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (672, 43, 'Antofagasta', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (673, 43, 'Araucania', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (674, 43, 'Atacama', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (675, 43, 'Bio-Bio', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (676, 43, 'Coquimbo', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (678, 43, 'Los Lagos', 'LL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (680, 43, 'Maule', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (681, 43, 'Region Metropolitana', 'RM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (682, 43, 'Tarapaca', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (683, 43, 'Valparaiso', 'VS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (684, 44, '安徽省', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (685, 44, '北京市', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (686, 44, '重庆市', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (687, 44, '福建省', 'FU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (688, 44, '甘肃省', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (689, 44, '广东省', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (690, 44, '广西壮族自治区', 'GX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (691, 44, '贵州省', 'GZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (692, 44, '海南省', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (693, 44, '河北省', 'HB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (694, 44, '黑龙江省', 'HL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (695, 44, '河南省', 'HE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (696, 44, '香港特别行政区', 'HK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (697, 44, '湖北省', 'HU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (698, 44, '湖南省', 'HN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (699, 44, '内蒙古自治区', 'IM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (700, 44, '江苏省', 'JI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (701, 44, '江西省', 'JX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (702, 44, '吉林省', 'JL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (703, 44, '辽宁省', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (704, 44, '澳门特别行政区', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (705, 44, '宁夏回族自治区', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (706, 44, '山西省', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (707, 44, '山东省', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (708, 44, '上海市', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (709, 44, '陕西省', 'SX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (710, 44, '四川省', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (711, 44, '天津市', 'TI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (712, 44, '新疆维吾尔自治区', 'XI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (713, 44, '云南省', 'YU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (714, 44, '浙江省', 'ZH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (715, 46, 'Direction Island', 'D', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (716, 46, 'Home Island', 'H', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (717, 46, 'Horsburgh Island', 'O', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (718, 46, 'South Island', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (719, 46, 'West Island', 'W', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (720, 47, 'Amazonas', 'AMZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (721, 47, 'Antioquia', 'ANT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (722, 47, 'Arauca', 'ARA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (723, 47, 'Atlantico', 'ATL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (724, 47, 'Bogota D.C.', 'BDC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (725, 47, 'Bolivar', 'BOL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (726, 47, 'Boyaca', 'BOY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (727, 47, 'Caldas', 'CAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (728, 47, 'Caqueta', 'CAQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (729, 47, 'Casanare', 'CAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (730, 47, 'Cauca', 'CAU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (731, 47, 'Cesar', 'CES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (732, 47, 'Choco', 'CHO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (733, 47, 'Cordoba', 'COR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (734, 47, 'Cundinamarca', 'CAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (735, 47, 'Guainia', 'GNA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (736, 47, 'Guajira', 'GJR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (737, 47, 'Guaviare', 'GVR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (738, 47, 'Huila', 'HUI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (739, 47, 'Magdalena', 'MAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (740, 47, 'Meta', 'MET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (741, 47, 'Narino', 'NAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (742, 47, 'Norte de Santander', 'NDS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (743, 47, 'Putumayo', 'PUT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (744, 47, 'Quindio', 'QUI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (745, 47, 'Risaralda', 'RIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (746, 47, 'San Andres y Providencia', 'SAP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (747, 47, 'Santander', 'SAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (748, 47, 'Sucre', 'SUC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (749, 47, 'Tolima', 'TOL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (750, 47, 'Valle del Cauca', 'VDC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (751, 47, 'Vaupes', 'VAU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (752, 47, 'Vichada', 'VIC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (753, 48, 'Grande Comore', 'G', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (754, 48, 'Anjouan', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (755, 48, 'Moheli', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (756, 49, 'Bouenza', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (757, 49, 'Brazzaville', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (758, 49, 'Cuvette', 'CU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (759, 49, 'Cuvette-Ouest', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (760, 49, 'Kouilou', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (761, 49, 'Lekoumou', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (762, 49, 'Likouala', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (763, 49, 'Niari', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (764, 49, 'Plateaux', 'PL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (765, 49, 'Pool', 'PO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (766, 49, 'Sangha', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (767, 50, 'Pukapuka', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (768, 50, 'Rakahanga', 'RK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (769, 50, 'Manihiki', 'MK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (770, 50, 'Penrhyn', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (771, 50, 'Nassau Island', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (772, 50, 'Surwarrow', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (773, 50, 'Palmerston', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (774, 50, 'Aitutaki', 'AI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (775, 50, 'Manuae', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (776, 50, 'Takutea', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (777, 50, 'Mitiaro', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (778, 50, 'Atiu', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (779, 50, 'Mauke', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (780, 50, 'Rarotonga', 'RR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (781, 50, 'Mangaia', 'MG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (782, 51, 'Alajuela', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (783, 51, 'Cartago', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (784, 51, 'Guanacaste', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (785, 51, 'Heredia', 'HE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (786, 51, 'Limon', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (787, 51, 'Puntarenas', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (788, 51, 'San Jose', 'SJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (789, 52, 'Abengourou', 'ABE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (790, 52, 'Abidjan', 'ABI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (791, 52, 'Aboisso', 'ABO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (792, 52, 'Adiake', 'ADI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (793, 52, 'Adzope', 'ADZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (794, 52, 'Agboville', 'AGB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (795, 52, 'Agnibilekrou', 'AGN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (796, 52, 'Alepe', 'ALE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (797, 52, 'Bocanda', 'BOC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (798, 52, 'Bangolo', 'BAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (799, 52, 'Beoumi', 'BEO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (800, 52, 'Biankouma', 'BIA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (801, 52, 'Bondoukou', 'BDK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (802, 52, 'Bongouanou', 'BGN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (803, 52, 'Bouafle', 'BFL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (804, 52, 'Bouake', 'BKE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (805, 52, 'Bouna', 'BNA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (806, 52, 'Boundiali', 'BDL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (807, 52, 'Dabakala', 'DKL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (808, 52, 'Dabou', 'DBU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (809, 52, 'Daloa', 'DAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (810, 52, 'Danane', 'DAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (811, 52, 'Daoukro', 'DAO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (812, 52, 'Dimbokro', 'DIM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (813, 52, 'Divo', 'DIV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (814, 52, 'Duekoue', 'DUE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (815, 52, 'Ferkessedougou', 'FER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (816, 52, 'Gagnoa', 'GAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (817, 52, 'Grand-Bassam', 'GBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (818, 52, 'Grand-Lahou', 'GLA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (819, 52, 'Guiglo', 'GUI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (820, 52, 'Issia', 'ISS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (821, 52, 'Jacqueville', 'JAC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (822, 52, 'Katiola', 'KAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (823, 52, 'Korhogo', 'KOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (824, 52, 'Lakota', 'LAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (825, 52, 'Man', 'MAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (826, 52, 'Mankono', 'MKN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (827, 52, 'Mbahiakro', 'MBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (828, 52, 'Odienne', 'ODI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (829, 52, 'Oume', 'OUM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (830, 52, 'Sakassou', 'SAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (831, 52, 'San-Pedro', 'SPE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (832, 52, 'Sassandra', 'SAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (833, 52, 'Seguela', 'SEG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (834, 52, 'Sinfra', 'SIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (835, 52, 'Soubre', 'SOU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (836, 52, 'Tabou', 'TAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (837, 52, 'Tanda', 'TAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (838, 52, 'Tiebissou', 'TIE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (839, 52, 'Tingrela', 'TIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (840, 52, 'Tiassale', 'TIA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (841, 52, 'Touba', 'TBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (842, 52, 'Toulepleu', 'TLP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (843, 52, 'Toumodi', 'TMD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (844, 52, 'Vavoua', 'VAV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (845, 52, 'Yamoussoukro', 'YAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (846, 52, 'Zuenoula', 'ZUE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (847, 53, 'Bjelovarsko-bilogorska', 'BB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (848, 53, 'Grad Zagreb', 'GZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (849, 53, 'Dubrovačko-neretvanska', 'DN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (850, 53, 'Istarska', 'IS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (851, 53, 'Karlovačka', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (852, 53, 'Koprivničko-križevačka', 'KK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (853, 53, 'Krapinsko-zagorska', 'KZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (854, 53, 'Ličko-senjska', 'LS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (855, 53, 'Međimurska', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (856, 53, 'Osječko-baranjska', 'OB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (857, 53, 'Požeško-slavonska', 'PS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (858, 53, 'Primorsko-goranska', 'PG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (859, 53, 'Šibensko-kninska', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (860, 53, 'Sisačko-moslavačka', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (861, 53, 'Brodsko-posavska', 'BP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (862, 53, 'Splitsko-dalmatinska', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (863, 53, 'Varaždinska', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (864, 53, 'Virovitičko-podravska', 'VP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (865, 53, 'Vukovarsko-srijemska', 'VS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (866, 53, 'Zadarska', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (867, 53, 'Zagrebačka', 'ZG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (868, 54, 'Camaguey', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (869, 54, 'Ciego de Avila', 'CD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (870, 54, 'Cienfuegos', 'CI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (871, 54, 'Ciudad de La Habana', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (872, 54, 'Granma', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (873, 54, 'Guantanamo', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (874, 54, 'Holguin', 'HO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (875, 54, 'Isla de la Juventud', 'IJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (876, 54, 'La Habana', 'LH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (877, 54, 'Las Tunas', 'LT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (878, 54, 'Matanzas', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (879, 54, 'Pinar del Rio', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (880, 54, 'Sancti Spiritus', 'SS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (881, 54, 'Santiago de Cuba', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (882, 54, 'Villa Clara', 'VC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (883, 55, 'Famagusta', 'F', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (884, 55, 'Kyrenia', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (885, 55, 'Larnaca', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (886, 55, 'Limassol', 'I', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (887, 55, 'Nicosia', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (888, 55, 'Paphos', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (889, 56, 'Ústecký', 'U', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (890, 56, 'Jihočeský', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (891, 56, 'Jihomoravský', 'B', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (892, 56, 'Karlovarský', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (893, 56, 'Královehradecký', 'H', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (894, 56, 'Liberecký', 'L', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (895, 56, 'Moravskoslezský', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (896, 56, 'Olomoucký', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (897, 56, 'Pardubický', 'E', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (898, 56, 'Plzeňský', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (899, 56, 'Praha', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (900, 56, 'Středočeský', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (901, 56, 'Vysočina', 'J', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (902, 56, 'Zlínský', 'Z', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (903, 57, 'Arhus', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (904, 57, 'Bornholm', 'BH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (905, 57, 'Copenhagen', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (906, 57, 'Faroe Islands', 'FO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (907, 57, 'Frederiksborg', 'FR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (908, 57, 'Fyn', 'FY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (909, 57, 'Kobenhavn', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (910, 57, 'Nordjylland', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (911, 57, 'Ribe', 'RI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (912, 57, 'Ringkobing', 'RK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (913, 57, 'Roskilde', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (914, 57, 'Sonderjylland', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (915, 57, 'Storstrom', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (916, 57, 'Vejle', 'VK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (917, 57, 'Vestj&aelig;lland', 'VJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (918, 57, 'Viborg', 'VB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (919, 58, '\'Ali Sabih', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (920, 58, 'Dikhil', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (921, 58, 'Djibouti', 'J', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (922, 58, 'Obock', 'O', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (923, 58, 'Tadjoura', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (924, 59, 'Saint Andrew Parish', 'AND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (925, 59, 'Saint David Parish', 'DAV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (926, 59, 'Saint George Parish', 'GEO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (927, 59, 'Saint John Parish', 'JOH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (928, 59, 'Saint Joseph Parish', 'JOS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (929, 59, 'Saint Luke Parish', 'LUK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (930, 59, 'Saint Mark Parish', 'MAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (931, 59, 'Saint Patrick Parish', 'PAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (932, 59, 'Saint Paul Parish', 'PAU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (933, 59, 'Saint Peter Parish', 'PET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (934, 60, 'Distrito Nacional', 'DN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (935, 60, 'Azua', 'AZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (936, 60, 'Baoruco', 'BC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (937, 60, 'Barahona', 'BH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (938, 60, 'Dajabon', 'DJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (939, 60, 'Duarte', 'DU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (940, 60, 'Elias Pina', 'EL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (941, 60, 'El Seybo', 'SY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (942, 60, 'Espaillat', 'ET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (943, 60, 'Hato Mayor', 'HM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (944, 60, 'Independencia', 'IN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (945, 60, 'La Altagracia', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (946, 60, 'La Romana', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (947, 60, 'La Vega', 'VE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (948, 60, 'Maria Trinidad Sanchez', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (949, 60, 'Monsenor Nouel', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (950, 60, 'Monte Cristi', 'MC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (951, 60, 'Monte Plata', 'MP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (952, 60, 'Pedernales', 'PD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (953, 60, 'Peravia (Bani)', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (954, 60, 'Puerto Plata', 'PP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (955, 60, 'Salcedo', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (956, 60, 'Samana', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (957, 60, 'Sanchez Ramirez', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (958, 60, 'San Cristobal', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (959, 60, 'San Jose de Ocoa', 'JO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (960, 60, 'San Juan', 'SJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (961, 60, 'San Pedro de Macoris', 'PM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (962, 60, 'Santiago', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (963, 60, 'Santiago Rodriguez', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (964, 60, 'Santo Domingo', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (965, 60, 'Valverde', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (966, 61, 'Aileu', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (967, 61, 'Ainaro', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (968, 61, 'Baucau', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (969, 61, 'Bobonaro', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (970, 61, 'Cova Lima', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (971, 61, 'Dili', 'DI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (972, 61, 'Ermera', 'ER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (973, 61, 'Lautem', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (974, 61, 'Liquica', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (975, 61, 'Manatuto', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (976, 61, 'Manufahi', 'MF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (977, 61, 'Oecussi', 'OE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (978, 61, 'Viqueque', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (979, 62, 'Azuay', 'AZU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (980, 62, 'Bolivar', 'BOL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (981, 62, 'Ca&ntilde;ar', 'CAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (982, 62, 'Carchi', 'CAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (983, 62, 'Chimborazo', 'CHI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (984, 62, 'Cotopaxi', 'COT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (985, 62, 'El Oro', 'EOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (986, 62, 'Esmeraldas', 'ESM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (987, 62, 'Gal&aacute;pagos', 'GPS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (988, 62, 'Guayas', 'GUA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (989, 62, 'Imbabura', 'IMB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (990, 62, 'Loja', 'LOJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (991, 62, 'Los Rios', 'LRO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (992, 62, 'Manab&iacute;', 'MAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (993, 62, 'Morona Santiago', 'MSA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (994, 62, 'Napo', 'NAP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (995, 62, 'Orellana', 'ORE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (996, 62, 'Pastaza', 'PAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (997, 62, 'Pichincha', 'PIC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (998, 62, 'Sucumb&iacute;os', 'SUC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (999, 62, 'Tungurahua', 'TUN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1000, 62, 'Zamora Chinchipe', 'ZCH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1001, 63, 'Ad Daqahliyah', 'DHY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1002, 63, 'Al Bahr al Ahmar', 'BAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1003, 63, 'Al Buhayrah', 'BHY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1004, 63, 'Al Fayyum', 'FYM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1005, 63, 'Al Gharbiyah', 'GBY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1006, 63, 'Al Iskandariyah', 'IDR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1007, 63, 'Al Isma\'iliyah', 'IML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1008, 63, 'Al Jizah', 'JZH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1009, 63, 'Al Minufiyah', 'MFY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1010, 63, 'Al Minya', 'MNY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1011, 63, 'Al Qahirah', 'QHR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1012, 63, 'Al Qalyubiyah', 'QLY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1013, 63, 'Al Wadi al Jadid', 'WJD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1014, 63, 'Ash Sharqiyah', 'SHQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1015, 63, 'As Suways', 'SWY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1016, 63, 'Aswan', 'ASW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1017, 63, 'Asyut', 'ASY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1018, 63, 'Bani Suwayf', 'BSW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1019, 63, 'Bur Sa\'id', 'BSD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1020, 63, 'Dumyat', 'DMY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1021, 63, 'Janub Sina\'', 'JNS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1022, 63, 'Kafr ash Shaykh', 'KSH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1023, 63, 'Matruh', 'MAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1024, 63, 'Qina', 'QIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1025, 63, 'Shamal Sina\'', 'SHS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1026, 63, 'Suhaj', 'SUH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1027, 64, 'Ahuachapan', 'AH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1028, 64, 'Cabanas', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1029, 64, 'Chalatenango', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1030, 64, 'Cuscatlan', 'CU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1031, 64, 'La Libertad', 'LB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1032, 64, 'La Paz', 'PZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1033, 64, 'La Union', 'UN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1034, 64, 'Morazan', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1035, 64, 'San Miguel', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1036, 64, 'San Salvador', 'SS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1037, 64, 'San Vicente', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1038, 64, 'Santa Ana', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1039, 64, 'Sonsonate', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1040, 64, 'Usulutan', 'US', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1041, 65, 'Provincia Annobon', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1042, 65, 'Provincia Bioko Norte', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1043, 65, 'Provincia Bioko Sur', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1044, 65, 'Provincia Centro Sur', 'CS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1045, 65, 'Provincia Kie-Ntem', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1046, 65, 'Provincia Litoral', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1047, 65, 'Provincia Wele-Nzas', 'WN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1048, 66, 'Central (Maekel)', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1049, 66, 'Anseba (Keren)', 'KE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1052, 66, 'Southern (Debub)', 'DE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1053, 66, 'Gash-Barka (Barentu)', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1054, 67, 'Harjumaa (Tallinn)', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1055, 67, 'Hiiumaa (Kardla)', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1057, 67, 'Jarvamaa (Paide)', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1058, 67, 'Jogevamaa (Jogeva)', 'JO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1060, 67, 'Laanemaa (Haapsalu)', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1061, 67, 'Parnumaa (Parnu)', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1062, 67, 'Polvamaa (Polva)', 'PO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1063, 67, 'Raplamaa (Rapla)', 'RA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1064, 67, 'Saaremaa (Kuessaare)', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1065, 67, 'Tartumaa (Tartu)', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1066, 67, 'Valgamaa (Valga)', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1067, 67, 'Viljandimaa (Viljandi)', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1068, 67, 'Vorumaa (Voru)', 'VO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1069, 68, 'Afar', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1070, 68, 'Amhara', 'AH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1071, 68, 'Benishangul-Gumaz', 'BG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1072, 68, 'Gambela', 'GB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1073, 68, 'Hariai', 'HR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1074, 68, 'Oromia', 'OR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1075, 68, 'Somali', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1077, 68, 'Tigray', 'TG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1078, 68, 'Addis Ababa', 'AA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1079, 68, 'Dire Dawa', 'DD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1080, 71, 'Central Division', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1081, 71, 'Northern Division', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1082, 71, 'Eastern Division', 'E', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1083, 71, 'Western Division', 'W', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1084, 71, 'Rotuma', 'R', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1085, 72, 'Ahvenanmaan lääni', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1086, 72, 'Etelä-Suomen lääni', 'ES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1087, 72, 'Itä-Suomen lääni', 'IS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1088, 72, 'Länsi-Suomen lääni', 'LS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1089, 72, 'Lapin lääni', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1090, 72, 'Oulun lääni', 'OU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1114, 74, 'Ain', '01', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1115, 74, 'Aisne', '02', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1116, 74, 'Allier', '03', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1117, 74, 'Alpes de Haute Provence', '04', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1118, 74, 'Hautes-Alpes', '05', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1119, 74, 'Alpes Maritimes', '06', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1120, 74, 'Ard&egrave;che', '07', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1121, 74, 'Ardennes', '08', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1122, 74, 'Ari&egrave;ge', '09', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1123, 74, 'Aube', '10', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1124, 74, 'Aude', '11', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1125, 74, 'Aveyron', '12', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1126, 74, 'Bouches du Rh&ocirc;ne', '13', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1127, 74, 'Calvados', '14', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1128, 74, 'Cantal', '15', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1129, 74, 'Charente', '16', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1130, 74, 'Charente Maritime', '17', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1131, 74, 'Cher', '18', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1132, 74, 'Corr&egrave;ze', '19', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1133, 74, 'Corse du Sud', '2A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1134, 74, 'Haute Corse', '2B', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1135, 74, 'C&ocirc;te d&#039;or', '21', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1137, 74, 'Creuse', '23', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1138, 74, 'Dordogne', '24', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1139, 74, 'Doubs', '25', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1140, 74, 'Dr&ocirc;me', '26', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1141, 74, 'Eure', '27', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1142, 74, 'Eure et Loir', '28', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1143, 74, 'Finist&egrave;re', '29', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1144, 74, 'Gard', '30', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1145, 74, 'Haute Garonne', '31', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1146, 74, 'Gers', '32', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1147, 74, 'Gironde', '33', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1148, 74, 'H&eacute;rault', '34', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1149, 74, 'Ille et Vilaine', '35', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1150, 74, 'Indre', '36', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1151, 74, 'Indre et Loire', '37', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1152, 74, 'Is&eacute;re', '38', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1153, 74, 'Jura', '39', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1154, 74, 'Landes', '40', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1155, 74, 'Loir et Cher', '41', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1156, 74, 'Loire', '42', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1157, 74, 'Haute Loire', '43', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1158, 74, 'Loire Atlantique', '44', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1159, 74, 'Loiret', '45', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1160, 74, 'Lot', '46', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1161, 74, 'Lot et Garonne', '47', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1162, 74, 'Loz&egrave;re', '48', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1163, 74, 'Maine et Loire', '49', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1164, 74, 'Manche', '50', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1165, 74, 'Marne', '51', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1166, 74, 'Haute Marne', '52', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1167, 74, 'Mayenne', '53', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1168, 74, 'Meurthe et Moselle', '54', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1169, 74, 'Meuse', '55', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1170, 74, 'Morbihan', '56', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1171, 74, 'Moselle', '57', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1172, 74, 'Ni&egrave;vre', '58', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1173, 74, 'Nord', '59', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1174, 74, 'Oise', '60', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1175, 74, 'Orne', '61', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1176, 74, 'Pas de Calais', '62', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1177, 74, 'Puy de D&ocirc;me', '63', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1181, 74, 'Bas Rhin', '67', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1182, 74, 'Haut Rhin', '68', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1183, 74, 'Rh&ocirc;ne', '69', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1184, 74, 'Haute Sa&ocirc;ne', '70', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1185, 74, 'Sa&ocirc;ne et Loire', '71', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1186, 74, 'Sarthe', '72', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1187, 74, 'Savoie', '73', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1188, 74, 'Haute Savoie', '74', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1189, 74, 'Paris', '75', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1190, 74, 'Seine Maritime', '76', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1191, 74, 'Seine et Marne', '77', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1192, 74, 'Yvelines', '78', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1193, 74, 'Deux S&egrave;vres', '79', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1194, 74, 'Somme', '80', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1195, 74, 'Tarn', '81', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1196, 74, 'Tarn et Garonne', '82', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1197, 74, 'Var', '83', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1198, 74, 'Vaucluse', '84', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1199, 74, 'Vend&eacute;e', '85', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1200, 74, 'Vienne', '86', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1201, 74, 'Haute Vienne', '87', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1202, 74, 'Vosges', '88', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1203, 74, 'Yonne', '89', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1204, 74, 'Territoire de Belfort', '90', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1205, 74, 'Essonne', '91', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1206, 74, 'Hauts de Seine', '92', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1207, 74, 'Seine St-Denis', '93', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1208, 74, 'Val de Marne', '94', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1209, 74, 'Val d\'Oise', '95', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1210, 76, 'Archipel des Marquises', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1211, 76, 'Archipel des Tuamotu', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1212, 76, 'Archipel des Tubuai', 'I', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1213, 76, 'Iles du Vent', 'V', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1214, 76, 'Iles Sous-le-Vent', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1215, 77, 'Iles Crozet', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1216, 77, 'Iles Kerguelen', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1217, 77, 'Ile Amsterdam', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1218, 77, 'Ile Saint-Paul', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1219, 77, 'Adelie Land', 'D', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1220, 78, 'Estuaire', 'ES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1221, 78, 'Haut-Ogooue', 'HO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1222, 78, 'Moyen-Ogooue', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1223, 78, 'Ngounie', 'NG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1224, 78, 'Nyanga', 'NY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1225, 78, 'Ogooue-Ivindo', 'OI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1226, 78, 'Ogooue-Lolo', 'OL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1227, 78, 'Ogooue-Maritime', 'OM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1228, 78, 'Woleu-Ntem', 'WN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1229, 79, 'Banjul', 'BJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1230, 79, 'Basse', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1231, 79, 'Brikama', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1232, 79, 'Janjangbure', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1233, 79, 'Kanifeng', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1234, 79, 'Kerewan', 'KE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1235, 79, 'Kuntaur', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1236, 79, 'Mansakonko', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1237, 79, 'Lower River', 'LR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1238, 79, 'Central River', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1239, 79, 'North Bank', 'NB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1240, 79, 'Upper River', 'UR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1241, 79, 'Western', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1242, 80, 'Abkhazia', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1243, 80, 'Ajaria', 'AJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1244, 80, 'Tbilisi', 'TB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1245, 80, 'Guria', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1246, 80, 'Imereti', 'IM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1247, 80, 'Kakheti', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1248, 80, 'Kvemo Kartli', 'KK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1249, 80, 'Mtskheta-Mtianeti', 'MM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1252, 80, 'Samtskhe-Javakheti', 'SJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1253, 80, 'Shida Kartli', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1254, 81, 'Baden-Württemberg', 'BAW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1255, 81, 'Bayern', 'BAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1256, 81, 'Berlin', 'BER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1257, 81, 'Brandenburg', 'BRG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1258, 81, 'Bremen', 'BRE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1259, 81, 'Hamburg', 'HAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1260, 81, 'Hessen', 'HES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1262, 81, 'Niedersachsen', 'NDS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1263, 81, 'Nordrhein-Westfalen', 'NRW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1264, 81, 'Rheinland-Pfalz', 'RHE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1265, 81, 'Saarland', 'SAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1266, 81, 'Sachsen', 'SAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1267, 81, 'Sachsen-Anhalt', 'SAC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1268, 81, 'Schleswig-Holstein', 'SCN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1269, 81, 'Thüringen', 'THE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1270, 82, 'Ashanti Region', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1271, 82, 'Brong-Ahafo Region', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1272, 82, 'Central Region', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1273, 82, 'Eastern Region', 'EA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1274, 82, 'Greater Accra Region', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1275, 82, 'Northern Region', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1276, 82, 'Upper East Region', 'UE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1277, 82, 'Upper West Region', 'UW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1278, 82, 'Volta Region', 'VO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1279, 82, 'Western Region', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1280, 84, 'Attica', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1281, 84, 'Central Greece', 'CN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1282, 84, 'Central Macedonia', 'CM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1283, 84, 'Crete', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1284, 84, 'East Macedonia and Thrace', 'EM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1285, 84, 'Epirus', 'EP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1286, 84, 'Ionian Islands', 'II', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1287, 84, 'North Aegean', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1288, 84, 'Peloponnesos', 'PP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1289, 84, 'South Aegean', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1290, 84, 'Thessaly', 'TH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1291, 84, 'West Greece', 'WG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1292, 84, 'West Macedonia', 'WM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1293, 85, 'Avannaa', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1294, 85, 'Tunu', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1295, 85, 'Kitaa', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1296, 86, 'Saint Andrew', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1297, 86, 'Saint David', 'D', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1298, 86, 'Saint George', 'G', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1299, 86, 'Saint John', 'J', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1300, 86, 'Saint Mark', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1301, 86, 'Saint Patrick', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1302, 86, 'Carriacou', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1303, 86, 'Petit Martinique', 'Q', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1304, 89, 'Alta Verapaz', 'AV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1305, 89, 'Baja Verapaz', 'BV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1306, 89, 'Chimaltenango', 'CM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1307, 89, 'Chiquimula', 'CQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1308, 89, 'El Peten', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1309, 89, 'El Progreso', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1310, 89, 'El Quiche', 'QC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1311, 89, 'Escuintla', 'ES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1312, 89, 'Guatemala', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1313, 89, 'Huehuetenango', 'HU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1314, 89, 'Izabal', 'IZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1315, 89, 'Jalapa', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1316, 89, 'Jutiapa', 'JU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1317, 89, 'Quetzaltenango', 'QZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1318, 89, 'Retalhuleu', 'RE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1319, 89, 'Sacatepequez', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1320, 89, 'San Marcos', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1321, 89, 'Santa Rosa', 'SR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1322, 89, 'Solola', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1323, 89, 'Suchitepequez', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1324, 89, 'Totonicapan', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1325, 89, 'Zacapa', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1326, 90, 'Conakry', 'CNK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1327, 90, 'Beyla', 'BYL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1328, 90, 'Boffa', 'BFA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1329, 90, 'Boke', 'BOK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1330, 90, 'Coyah', 'COY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1331, 90, 'Dabola', 'DBL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1332, 90, 'Dalaba', 'DLB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1333, 90, 'Dinguiraye', 'DGR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1334, 90, 'Dubreka', 'DBR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1335, 90, 'Faranah', 'FRN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1336, 90, 'Forecariah', 'FRC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1337, 90, 'Fria', 'FRI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1338, 90, 'Gaoual', 'GAO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1339, 90, 'Gueckedou', 'GCD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1340, 90, 'Kankan', 'KNK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1341, 90, 'Kerouane', 'KRN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1342, 90, 'Kindia', 'KND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1343, 90, 'Kissidougou', 'KSD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1344, 90, 'Koubia', 'KBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1345, 90, 'Koundara', 'KDA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1346, 90, 'Kouroussa', 'KRA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1347, 90, 'Labe', 'LAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1348, 90, 'Lelouma', 'LLM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1349, 90, 'Lola', 'LOL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1350, 90, 'Macenta', 'MCT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1351, 90, 'Mali', 'MAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1352, 90, 'Mamou', 'MAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1353, 90, 'Mandiana', 'MAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1354, 90, 'Nzerekore', 'NZR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1355, 90, 'Pita', 'PIT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1356, 90, 'Siguiri', 'SIG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1357, 90, 'Telimele', 'TLM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1358, 90, 'Tougue', 'TOG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1359, 90, 'Yomou', 'YOM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1360, 91, 'Bafata Region', 'BF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1361, 91, 'Biombo Region', 'BB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1362, 91, 'Bissau Region', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1363, 91, 'Bolama Region', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1364, 91, 'Cacheu Region', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1365, 91, 'Gabu Region', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1366, 91, 'Oio Region', 'OI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1367, 91, 'Quinara Region', 'QU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1368, 91, 'Tombali Region', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1369, 92, 'Barima-Waini', 'BW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1370, 92, 'Cuyuni-Mazaruni', 'CM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1371, 92, 'Demerara-Mahaica', 'DM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1372, 92, 'East Berbice-Corentyne', 'EC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1373, 92, 'Essequibo Islands-West Demerara', 'EW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1374, 92, 'Mahaica-Berbice', 'MB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1375, 92, 'Pomeroon-Supenaam', 'PM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1376, 92, 'Potaro-Siparuni', 'PI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1377, 92, 'Upper Demerara-Berbice', 'UD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1379, 93, 'Artibonite', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1380, 93, 'Centre', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1381, 93, 'Grand\'Anse', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1382, 93, 'Nord', 'ND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1383, 93, 'Nord-Est', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1384, 93, 'Nord-Ouest', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1385, 93, 'Ouest', 'OU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1386, 93, 'Sud', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1387, 93, 'Sud-Est', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1388, 94, 'Flat Island', 'F', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1389, 94, 'McDonald Island', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1390, 94, 'Shag Island', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1391, 94, 'Heard Island', 'H', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1392, 95, 'Atlantida', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1393, 95, 'Choluteca', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1394, 95, 'Colon', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1395, 95, 'Comayagua', 'CM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1396, 95, 'Copan', 'CP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1397, 95, 'Cortes', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1398, 95, 'El Paraiso', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1399, 95, 'Francisco Morazan', 'FM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1400, 95, 'Gracias a Dios', 'GD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1401, 95, 'Intibuca', 'IN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1403, 95, 'La Paz', 'PZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1404, 95, 'Lempira', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1405, 95, 'Ocotepeque', 'OC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1406, 95, 'Olancho', 'OL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1407, 95, 'Santa Barbara', 'SB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1408, 95, 'Valle', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1409, 95, 'Yoro', 'YO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1467, 98, 'Austurland', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1468, 98, 'Hofuoborgarsvaeoi', 'HF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1469, 98, 'Norourland eystra', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1470, 98, 'Norourland vestra', 'NV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1471, 98, 'Suourland', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1472, 98, 'Suournes', 'SN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1473, 98, 'Vestfiroir', 'VF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1474, 98, 'Vesturland', 'VL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1475, 99, 'Andaman and Nicobar Islands', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1476, 99, 'Andhra Pradesh', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1477, 99, 'Arunachal Pradesh', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1478, 99, 'Assam', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1479, 99, 'Bihar', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1480, 99, 'Chandigarh', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1481, 99, 'Dadra and Nagar Haveli', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1482, 99, 'Daman and Diu', 'DM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1483, 99, 'Delhi', 'DE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1484, 99, 'Goa', 'GO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1485, 99, 'Gujarat', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1486, 99, 'Haryana', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1487, 99, 'Himachal Pradesh', 'HP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1488, 99, 'Jammu and Kashmir', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1489, 99, 'Karnataka', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1490, 99, 'Kerala', 'KE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1491, 99, 'Lakshadweep Islands', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1492, 99, 'Madhya Pradesh', 'MP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1493, 99, 'Maharashtra', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1494, 99, 'Manipur', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1495, 99, 'Meghalaya', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1496, 99, 'Mizoram', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1497, 99, 'Nagaland', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1498, 99, 'Orissa', 'OR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1499, 99, 'Puducherry', 'PO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1500, 99, 'Punjab', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1501, 99, 'Rajasthan', 'RA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1502, 99, 'Sikkim', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1503, 99, 'Tamil Nadu', 'TN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1504, 99, 'Tripura', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1505, 99, 'Uttar Pradesh', 'UP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1506, 99, 'West Bengal', 'WB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1507, 100, 'Aceh', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1508, 100, 'Bali', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1509, 100, 'Banten', 'BT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1510, 100, 'Bengkulu', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1511, 100, 'Kalimantan Utara', 'BD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1512, 100, 'Gorontalo', 'GO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1513, 100, 'Jakarta', 'JK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1514, 100, 'Jambi', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1515, 100, 'Jawa Barat', 'JB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1516, 100, 'Jawa Tengah', 'JT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1517, 100, 'Jawa Timur', 'JI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1518, 100, 'Kalimantan Barat', 'KB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1519, 100, 'Kalimantan Selatan', 'KS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1520, 100, 'Kalimantan Tengah', 'KT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1521, 100, 'Kalimantan Timur', 'KI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1522, 100, 'Kepulauan Bangka Belitung', 'BB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1523, 100, 'Lampung', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1524, 100, 'Maluku', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1525, 100, 'Maluku Utara', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1526, 100, 'Nusa Tenggara Barat', 'NB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1527, 100, 'Nusa Tenggara Timur', 'NT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1528, 100, 'Papua', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1529, 100, 'Riau', 'RI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1530, 100, 'Sulawesi Selatan', 'SN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1531, 100, 'Sulawesi Tengah', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1532, 100, 'Sulawesi Tenggara', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1533, 100, 'Sulawesi Utara', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1534, 100, 'Sumatera Barat', 'SB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1535, 100, 'Sumatera Selatan', 'SS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1536, 100, 'Sumatera Utara', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1537, 100, 'Yogyakarta', 'YO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1538, 101, 'Tehran', 'TEH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1539, 101, 'Qom', 'QOM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1540, 101, 'Markazi', 'MKZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1541, 101, 'Qazvin', 'QAZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1542, 101, 'Gilan', 'GIL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1543, 101, 'Ardabil', 'ARD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1544, 101, 'Zanjan', 'ZAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1545, 101, 'East Azarbaijan', 'EAZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1546, 101, 'West Azarbaijan', 'WEZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1547, 101, 'Kurdistan', 'KRD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1548, 101, 'Hamadan', 'HMD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1549, 101, 'Kermanshah', 'KRM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1550, 101, 'Ilam', 'ILM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1551, 101, 'Lorestan', 'LRS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1552, 101, 'Khuzestan', 'KZT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1555, 101, 'Bushehr', 'BSH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1556, 101, 'Fars', 'FAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1557, 101, 'Hormozgan', 'HRM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1558, 101, 'Sistan and Baluchistan', 'SBL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1559, 101, 'Kerman', 'KRB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1560, 101, 'Yazd', 'YZD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1561, 101, 'Esfahan', 'EFH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1562, 101, 'Semnan', 'SMN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1563, 101, 'Mazandaran', 'MZD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1564, 101, 'Golestan', 'GLS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1565, 101, 'North Khorasan', 'NKH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1566, 101, 'Razavi Khorasan', 'RKH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1567, 101, 'South Khorasan', 'SKH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1568, 102, 'Baghdad', 'BD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1569, 102, 'Salah ad Din', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1570, 102, 'Diyala', 'DY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1571, 102, 'Wasit', 'WS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1572, 102, 'Maysan', 'MY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1573, 102, 'Al Basrah', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1574, 102, 'Dhi Qar', 'DQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1575, 102, 'Al Muthanna', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1576, 102, 'Al Qadisyah', 'QA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1577, 102, 'Babil', 'BB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1578, 102, 'Al Karbala', 'KB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1579, 102, 'An Najaf', 'NJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1580, 102, 'Al Anbar', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1581, 102, 'Ninawa', 'NN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1582, 102, 'Dahuk', 'DH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1583, 102, 'Arbil', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1584, 102, 'At Ta\'mim', 'TM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1585, 102, 'As Sulaymaniyah', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1586, 103, 'Carlow', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1587, 103, 'Cavan', 'CV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1588, 103, 'Clare', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1589, 103, 'Cork', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1590, 103, 'Donegal', 'DO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1591, 103, 'Dublin', 'DU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1592, 103, 'Galway', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1593, 103, 'Kerry', 'KE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1594, 103, 'Kildare', 'KI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1595, 103, 'Kilkenny', 'KL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1596, 103, 'Laois', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1597, 103, 'Leitrim', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1598, 103, 'Limerick', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1599, 103, 'Longford', 'LO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1600, 103, 'Louth', 'LU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1601, 103, 'Mayo', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1602, 103, 'Meath', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1603, 103, 'Monaghan', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1604, 103, 'Offaly', 'OF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1605, 103, 'Roscommon', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1606, 103, 'Sligo', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1607, 103, 'Tipperary', 'TI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1608, 103, 'Waterford', 'WA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1609, 103, 'Westmeath', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1610, 103, 'Wexford', 'WX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1611, 103, 'Wicklow', 'WI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1612, 104, 'Be\'er Sheva', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1613, 104, 'Bika\'at Hayarden', 'BH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1614, 104, 'Eilat and Arava', 'EA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1615, 104, 'Galil', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1616, 104, 'Haifa', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1617, 104, 'Jehuda Mountains', 'JM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1618, 104, 'Jerusalem', 'JE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1619, 104, 'Negev', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1620, 104, 'Semaria', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1621, 104, 'Sharon', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1643, 106, 'Clarendon Parish', 'CLA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1644, 106, 'Hanover Parish', 'HAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1645, 106, 'Kingston Parish', 'KIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1646, 106, 'Manchester Parish', 'MAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1647, 106, 'Portland Parish', 'POR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1648, 106, 'Saint Andrew Parish', 'AND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1649, 106, 'Saint Ann Parish', 'ANN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1650, 106, 'Saint Catherine Parish', 'CAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1651, 106, 'Saint Elizabeth Parish', 'ELI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1652, 106, 'Saint James Parish', 'JAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1653, 106, 'Saint Mary Parish', 'MAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1654, 106, 'Saint Thomas Parish', 'THO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1655, 106, 'Trelawny Parish', 'TRL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1656, 106, 'Westmoreland Parish', 'WML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1657, 107, 'Aichi', 'AI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1658, 107, 'Akita', 'AK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1659, 107, 'Aomori', 'AO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1660, 107, 'Chiba', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1661, 107, 'Ehime', 'EH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1662, 107, 'Fukui', 'FK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1663, 107, 'Fukuoka', 'FU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1664, 107, 'Fukushima', 'FS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1665, 107, 'Gifu', 'GI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1666, 107, 'Gumma', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1667, 107, 'Hiroshima', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1668, 107, 'Hokkaido', 'HO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1669, 107, 'Hyogo', 'HY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1670, 107, 'Ibaraki', 'IB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1671, 107, 'Ishikawa', 'IS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1672, 107, 'Iwate', 'IW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1673, 107, 'Kagawa', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1674, 107, 'Kagoshima', 'KG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1675, 107, 'Kanagawa', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1676, 107, 'Kochi', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1677, 107, 'Kumamoto', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1678, 107, 'Kyoto', 'KY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1679, 107, 'Mie', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1680, 107, 'Miyagi', 'MY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1681, 107, 'Miyazaki', 'MZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1682, 107, 'Nagano', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1683, 107, 'Nagasaki', 'NG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1684, 107, 'Nara', 'NR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1685, 107, 'Niigata', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1686, 107, 'Oita', 'OI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1687, 107, 'Okayama', 'OK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1688, 107, 'Okinawa', 'ON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1689, 107, 'Osaka', 'OS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1690, 107, 'Saga', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1691, 107, 'Saitama', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1692, 107, 'Shiga', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1693, 107, 'Shimane', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1694, 107, 'Shizuoka', 'SZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1695, 107, 'Tochigi', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1696, 107, 'Tokushima', 'TS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1697, 107, 'Tokyo', 'TK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1698, 107, 'Tottori', 'TT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1699, 107, 'Toyama', 'TY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1700, 107, 'Wakayama', 'WA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1701, 107, 'Yamagata', 'YA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1702, 107, 'Yamaguchi', 'YM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1703, 107, 'Yamanashi', 'YN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1704, 108, '\'Amman', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1705, 108, 'Ajlun', 'AJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1706, 108, 'Al \'Aqabah', 'AA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1707, 108, 'Al Balqa\'', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1708, 108, 'Al Karak', 'AK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1709, 108, 'Al Mafraq', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1710, 108, 'At Tafilah', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1711, 108, 'Az Zarqa\'', 'AZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1712, 108, 'Irbid', 'IR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1713, 108, 'Jarash', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1714, 108, 'Ma\'an', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1715, 108, 'Madaba', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1716, 109, 'Almaty', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1717, 109, 'Almaty City', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1718, 109, 'Aqmola', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1719, 109, 'Aqtobe', 'AQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1720, 109, 'Astana City', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1721, 109, 'Atyrau', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1722, 109, 'Batys Qazaqstan', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1723, 109, 'Bayqongyr City', 'BY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1724, 109, 'Mangghystau', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1725, 109, 'Ongtustik Qazaqstan', 'ON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1726, 109, 'Pavlodar', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1727, 109, 'Qaraghandy', 'QA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1728, 109, 'Qostanay', 'QO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1729, 109, 'Qyzylorda', 'QY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1730, 109, 'Shyghys Qazaqstan', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1731, 109, 'Soltustik Qazaqstan', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1732, 109, 'Zhambyl', 'ZH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1733, 110, 'Central', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1734, 110, 'Coast', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1735, 110, 'Eastern', 'EA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1736, 110, 'Nairobi Area', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1737, 110, 'North Eastern', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1738, 110, 'Nyanza', 'NY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1739, 110, 'Rift Valley', 'RV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1740, 110, 'Western', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1741, 111, 'Abaiang', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1742, 111, 'Abemama', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1743, 111, 'Aranuka', 'AK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1744, 111, 'Arorae', 'AO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1745, 111, 'Banaba', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1746, 111, 'Beru', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1747, 111, 'Butaritari', 'bT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1748, 111, 'Kanton', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1749, 111, 'Kiritimati', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1750, 111, 'Kuria', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1751, 111, 'Maiana', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1752, 111, 'Makin', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1753, 111, 'Marakei', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1754, 111, 'Nikunau', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1755, 111, 'Nonouti', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1756, 111, 'Onotoa', 'ON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1757, 111, 'Tabiteuea', 'TT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1758, 111, 'Tabuaeran', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1759, 111, 'Tamana', 'TM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1760, 111, 'Tarawa', 'TW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1761, 111, 'Teraina', 'TE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1762, 112, 'Chagang-do', 'CHA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1763, 112, 'Hamgyong-bukto', 'HAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1764, 112, 'Hamgyong-namdo', 'HAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1765, 112, 'Hwanghae-bukto', 'HWB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1766, 112, 'Hwanghae-namdo', 'HWN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1767, 112, 'Kangwon-do', 'KAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1768, 112, 'P\'yongan-bukto', 'PYB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1769, 112, 'P\'yongan-namdo', 'PYN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1771, 112, 'Rason Directly Governed City', 'NAJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1772, 112, 'P\'yongyang Special City', 'PYO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1775, 113, 'Cheju-do', 'CD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1776, 113, 'Cholla-bukto', 'CB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1777, 113, 'Cholla-namdo', 'CN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1778, 113, 'Inch\'on-gwangyoksi', 'IG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1779, 113, 'Kangwon-do', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1780, 113, 'Kwangju-gwangyoksi', 'KG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1781, 113, 'Kyonggi-do', 'KD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1782, 113, 'Kyongsang-bukto', 'KB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1783, 113, 'Kyongsang-namdo', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1784, 113, 'Pusan-gwangyoksi', 'PG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1785, 113, 'Soul-t\'ukpyolsi', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1786, 113, 'Taegu-gwangyoksi', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1787, 113, 'Taejon-gwangyoksi', 'TG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1788, 114, 'Al \'Asimah', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1789, 114, 'Al Ahmadi', 'AA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1790, 114, 'Al Farwaniyah', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1791, 114, 'Al Jahra\'', 'AJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1792, 114, 'Hawalli', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1793, 115, 'Bishkek', 'GB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1794, 115, 'Batken', 'B', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1795, 115, 'Chu', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1796, 115, 'Jalal-Abad', 'J', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1797, 115, 'Naryn', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1798, 115, 'Osh', 'O', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1799, 115, 'Talas', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1800, 115, 'Ysyk-Kol', 'Y', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1801, 116, 'Vientiane', 'VT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1802, 116, 'Attapu', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1803, 116, 'Bokeo', 'BK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1804, 116, 'Bolikhamxai', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1805, 116, 'Champasak', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1806, 116, 'Houaphan', 'HO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1807, 116, 'Khammouan', 'KH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1808, 116, 'Louang Namtha', 'LM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1809, 116, 'Louangphabang', 'LP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1810, 116, 'Oudomxai', 'OU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1811, 116, 'Phongsali', 'PH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1812, 116, 'Salavan', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1813, 116, 'Savannakhet', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1814, 116, 'Vientiane', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1815, 116, 'Xaignabouli', 'XA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1816, 116, 'Xekong', 'XE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1817, 116, 'Xiangkhoang', 'XI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1818, 116, 'Xaisomboun', 'XN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1852, 119, 'Berea', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1853, 119, 'Butha-Buthe', 'BB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1854, 119, 'Leribe', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1855, 119, 'Mafeteng', 'MF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1856, 119, 'Maseru', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1857, 119, 'Mohale\'s Hoek', 'MH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1858, 119, 'Mokhotlong', 'MK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1859, 119, 'Qacha\'s Nek', 'QN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1860, 119, 'Quthing', 'QT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1861, 119, 'Thaba-Tseka', 'TT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1862, 120, 'Bomi', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1863, 120, 'Bong', 'BG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1864, 120, 'Grand Bassa', 'GB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1865, 120, 'Grand Cape Mount', 'CM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1866, 120, 'Grand Gedeh', 'GG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1867, 120, 'Grand Kru', 'GK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1868, 120, 'Lofa', 'LO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1869, 120, 'Margibi', 'MG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1870, 120, 'Maryland', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1871, 120, 'Montserrado', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1872, 120, 'Nimba', 'NB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1873, 120, 'River Cess', 'RC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1874, 120, 'Sinoe', 'SN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1875, 121, 'Ajdabiya', 'AJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1876, 121, 'Al \'Aziziyah', 'AZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1877, 121, 'Al Fatih', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1878, 121, 'Al Jabal al Akhdar', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1879, 121, 'Al Jufrah', 'JU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1880, 121, 'Al Khums', 'KH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1881, 121, 'Al Kufrah', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1882, 121, 'An Nuqat al Khams', 'NK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1883, 121, 'Ash Shati\'', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1884, 121, 'Awbari', 'AW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1885, 121, 'Az Zawiyah', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1886, 121, 'Banghazi', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1887, 121, 'Darnah', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1888, 121, 'Ghadamis', 'GD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1889, 121, 'Gharyan', 'GY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1890, 121, 'Misratah', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1891, 121, 'Murzuq', 'MZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1892, 121, 'Sabha', 'SB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1893, 121, 'Sawfajjin', 'SW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1894, 121, 'Surt', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1895, 121, 'Tarabulus (Tripoli)', 'TL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1896, 121, 'Tarhunah', 'TH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1897, 121, 'Tubruq', 'TU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1898, 121, 'Yafran', 'YA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1899, 121, 'Zlitan', 'ZL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1900, 122, 'Vaduz', 'V', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1901, 122, 'Schaan', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1902, 122, 'Balzers', 'B', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1903, 122, 'Triesen', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1904, 122, 'Eschen', 'E', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1905, 122, 'Mauren', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1906, 122, 'Triesenberg', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1907, 122, 'Ruggell', 'R', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1908, 122, 'Gamprin', 'G', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1909, 122, 'Schellenberg', 'L', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1910, 122, 'Planken', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1911, 123, 'Alytus', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1912, 123, 'Kaunas', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1913, 123, 'Klaipeda', 'KL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1914, 123, 'Marijampole', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1915, 123, 'Panevezys', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1916, 123, 'Siauliai', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1917, 123, 'Taurage', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1918, 123, 'Telsiai', 'TE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1919, 123, 'Utena', 'UT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1920, 123, 'Vilnius', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1921, 124, 'Diekirch', 'DD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1922, 124, 'Clervaux', 'DC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1923, 124, 'Redange', 'DR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1924, 124, 'Vianden', 'DV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1925, 124, 'Wiltz', 'DW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1926, 124, 'Grevenmacher', 'GG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1927, 124, 'Echternach', 'GE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1928, 124, 'Remich', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1929, 124, 'Luxembourg', 'LL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1930, 124, 'Capellen', 'LC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1931, 124, 'Esch-sur-Alzette', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1932, 124, 'Mersch', 'LM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1938, 127, 'Antananarivo', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1939, 127, 'Antsiranana', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1940, 127, 'Fianarantsoa', 'FN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1941, 127, 'Mahajanga', 'MJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1942, 127, 'Toamasina', 'TM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1943, 127, 'Toliara', 'TL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1944, 128, 'Balaka', 'BLK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1945, 128, 'Blantyre', 'BLT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1946, 128, 'Chikwawa', 'CKW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1947, 128, 'Chiradzulu', 'CRD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1948, 128, 'Chitipa', 'CTP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1949, 128, 'Dedza', 'DDZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1950, 128, 'Dowa', 'DWA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1951, 128, 'Karonga', 'KRG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1952, 128, 'Kasungu', 'KSG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1953, 128, 'Likoma', 'LKM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1954, 128, 'Lilongwe', 'LLG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1955, 128, 'Machinga', 'MCG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1956, 128, 'Mangochi', 'MGC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1957, 128, 'Mchinji', 'MCH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1958, 128, 'Mulanje', 'MLJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1959, 128, 'Mwanza', 'MWZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1960, 128, 'Mzimba', 'MZM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1961, 128, 'Ntcheu', 'NTU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1962, 128, 'Nkhata Bay', 'NKB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1963, 128, 'Nkhotakota', 'NKH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1964, 128, 'Nsanje', 'NSJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1965, 128, 'Ntchisi', 'NTI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1966, 128, 'Phalombe', 'PHL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1967, 128, 'Rumphi', 'RMP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1968, 128, 'Salima', 'SLM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1969, 128, 'Thyolo', 'THY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1970, 128, 'Zomba', 'ZBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1971, 129, 'Johor', 'MY-01', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1972, 129, 'Kedah', 'MY-02', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1973, 129, 'Kelantan', 'MY-03', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1974, 129, 'Labuan', 'MY-15', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1975, 129, 'Melaka', 'MY-04', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1976, 129, 'Negeri Sembilan', 'MY-05', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1977, 129, 'Pahang', 'MY-06', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1978, 129, 'Perak', 'MY-08', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1979, 129, 'Perlis', 'MY-09', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1980, 129, 'Pulau Pinang', 'MY-07', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1981, 129, 'Sabah', 'MY-12', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1982, 129, 'Sarawak', 'MY-13', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1983, 129, 'Selangor', 'MY-10', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1984, 129, 'Terengganu', 'MY-11', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1985, 129, 'Kuala Lumpur', 'MY-14', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1986, 130, 'Thiladhunmathi Uthuru', 'THU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1992, 130, 'Faadhippolhu', 'FAA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1993, 130, 'Male Atoll', 'MAA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1994, 130, 'Ari Atoll Uthuru', 'AAU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1995, 130, 'Ari Atoll Dheknu', 'AAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1996, 130, 'Felidhe Atoll', 'FEA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1997, 130, 'Mulaku Atoll', 'MUA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2000, 130, 'Kolhumadulu', 'KLH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2001, 130, 'Hadhdhunmathi', 'HDH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2004, 130, 'Fua Mulaku', 'FMU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2005, 130, 'Addu', 'ADD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2006, 131, 'Gao', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2007, 131, 'Kayes', 'KY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2008, 131, 'Kidal', 'KD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2009, 131, 'Koulikoro', 'KL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2010, 131, 'Mopti', 'MP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2011, 131, 'Segou', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2012, 131, 'Sikasso', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2013, 131, 'Tombouctou', 'TB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2014, 131, 'Bamako Capital District', 'CD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2015, 132, 'Attard', 'ATT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2016, 132, 'Balzan', 'BAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2017, 132, 'Birgu', 'BGU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2018, 132, 'Birkirkara', 'BKK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2019, 132, 'Birzebbuga', 'BRZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2020, 132, 'Bormla', 'BOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2021, 132, 'Dingli', 'DIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2022, 132, 'Fgura', 'FGU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2023, 132, 'Floriana', 'FLO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2024, 132, 'Gudja', 'GDJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2025, 132, 'Gzira', 'GZR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2026, 132, 'Gargur', 'GRG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2027, 132, 'Gaxaq', 'GXQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2028, 132, 'Hamrun', 'HMR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2029, 132, 'Iklin', 'IKL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2030, 132, 'Isla', 'ISL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2031, 132, 'Kalkara', 'KLK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2032, 132, 'Kirkop', 'KRK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2033, 132, 'Lija', 'LIJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2034, 132, 'Luqa', 'LUQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2035, 132, 'Marsa', 'MRS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2036, 132, 'Marsaskala', 'MKL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2037, 132, 'Marsaxlokk', 'MXL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2038, 132, 'Mdina', 'MDN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2039, 132, 'Melliea', 'MEL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2040, 132, 'Mgarr', 'MGR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2041, 132, 'Mosta', 'MST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2042, 132, 'Mqabba', 'MQA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2043, 132, 'Msida', 'MSI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2044, 132, 'Mtarfa', 'MTF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2045, 132, 'Naxxar', 'NAX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2046, 132, 'Paola', 'PAO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2047, 132, 'Pembroke', 'PEM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2048, 132, 'Pieta', 'PIE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2049, 132, 'Qormi', 'QOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2050, 132, 'Qrendi', 'QRE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2051, 132, 'Rabat', 'RAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2052, 132, 'Safi', 'SAF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2053, 132, 'San Giljan', 'SGI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2054, 132, 'Santa Lucija', 'SLU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2055, 132, 'San Pawl il-Bahar', 'SPB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2056, 132, 'San Gwann', 'SGW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2057, 132, 'Santa Venera', 'SVE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2058, 132, 'Siggiewi', 'SIG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2059, 132, 'Sliema', 'SLM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2060, 132, 'Swieqi', 'SWQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2061, 132, 'Ta Xbiex', 'TXB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2062, 132, 'Tarxien', 'TRX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2063, 132, 'Valletta', 'VLT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2064, 132, 'Xgajra', 'XGJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2065, 132, 'Zabbar', 'ZBR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2066, 132, 'Zebbug', 'ZBG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2067, 132, 'Zejtun', 'ZJT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2068, 132, 'Zurrieq', 'ZRQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2069, 132, 'Fontana', 'FNT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2070, 132, 'Ghajnsielem', 'GHJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2071, 132, 'Gharb', 'GHR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2072, 132, 'Ghasri', 'GHS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2073, 132, 'Kercem', 'KRC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2074, 132, 'Munxar', 'MUN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2075, 132, 'Nadur', 'NAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2076, 132, 'Qala', 'QAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2077, 132, 'Victoria', 'VIC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2078, 132, 'San Lawrenz', 'SLA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2079, 132, 'Sannat', 'SNT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2080, 132, 'Xagra', 'ZAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2081, 132, 'Xewkija', 'XEW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2082, 132, 'Zebbug', 'ZEB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2083, 133, 'Ailinginae', 'ALG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2084, 133, 'Ailinglaplap', 'ALL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2085, 133, 'Ailuk', 'ALK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2086, 133, 'Arno', 'ARN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2087, 133, 'Aur', 'AUR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2088, 133, 'Bikar', 'BKR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2089, 133, 'Bikini', 'BKN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2090, 133, 'Bokak', 'BKK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2091, 133, 'Ebon', 'EBN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2092, 133, 'Enewetak', 'ENT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2093, 133, 'Erikub', 'EKB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2094, 133, 'Jabat', 'JBT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2095, 133, 'Jaluit', 'JLT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2096, 133, 'Jemo', 'JEM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2097, 133, 'Kili', 'KIL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2098, 133, 'Kwajalein', 'KWJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2099, 133, 'Lae', 'LAE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2100, 133, 'Lib', 'LIB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2101, 133, 'Likiep', 'LKP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2102, 133, 'Majuro', 'MJR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2103, 133, 'Maloelap', 'MLP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2104, 133, 'Mejit', 'MJT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2105, 133, 'Mili', 'MIL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2106, 133, 'Namorik', 'NMK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2107, 133, 'Namu', 'NAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2108, 133, 'Rongelap', 'RGL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2109, 133, 'Rongrik', 'RGK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2110, 133, 'Toke', 'TOK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2111, 133, 'Ujae', 'UJA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2112, 133, 'Ujelang', 'UJL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2113, 133, 'Utirik', 'UTK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2114, 133, 'Wotho', 'WTH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2115, 133, 'Wotje', 'WTJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2116, 135, 'Adrar', 'AD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2117, 135, 'Assaba', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2118, 135, 'Brakna', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2119, 135, 'Dakhlet Nouadhibou', 'DN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2120, 135, 'Gorgol', 'GO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2121, 135, 'Guidimaka', 'GM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2122, 135, 'Hodh Ech Chargui', 'HC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2123, 135, 'Hodh El Gharbi', 'HG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2124, 135, 'Inchiri', 'IN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2125, 135, 'Tagant', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2126, 135, 'Tiris Zemmour', 'TZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2127, 135, 'Trarza', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2128, 135, 'Nouakchott', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2129, 136, 'Beau Bassin-Rose Hill', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2130, 136, 'Curepipe', 'CU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2131, 136, 'Port Louis', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2132, 136, 'Quatre Bornes', 'QB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2133, 136, 'Vacoas-Phoenix', 'VP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2134, 136, 'Agalega Islands', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2136, 136, 'Rodrigues', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2137, 136, 'Black River', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2138, 136, 'Flacq', 'FL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2139, 136, 'Grand Port', 'GP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2140, 136, 'Moka', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2141, 136, 'Pamplemousses', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2142, 136, 'Plaines Wilhems', 'PW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2143, 136, 'Port Louis', 'PL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2144, 136, 'Riviere du Rempart', 'RR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2145, 136, 'Savanne', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2146, 138, 'Baja California Norte', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2147, 138, 'Baja California Sur', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2148, 138, 'Campeche', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2149, 138, 'Chiapas', 'CI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2150, 138, 'Chihuahua', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2151, 138, 'Coahuila de Zaragoza', 'CZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2152, 138, 'Colima', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2153, 138, 'Distrito Federal', 'DF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2154, 138, 'Durango', 'DU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2155, 138, 'Guanajuato', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2156, 138, 'Guerrero', 'GE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2157, 138, 'Hidalgo', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2158, 138, 'Jalisco', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2159, 138, 'Mexico', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2160, 138, 'Michoacan de Ocampo', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2161, 138, 'Morelos', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2162, 138, 'Nayarit', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2163, 138, 'Nuevo Leon', 'NL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2164, 138, 'Oaxaca', 'OA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2165, 138, 'Puebla', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2166, 138, 'Queretaro de Arteaga', 'QA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2167, 138, 'Quintana Roo', 'QR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2168, 138, 'San Luis Potosi', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2169, 138, 'Sinaloa', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2170, 138, 'Sonora', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2171, 138, 'Tabasco', 'TB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2172, 138, 'Tamaulipas', 'TM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2173, 138, 'Tlaxcala', 'TL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2174, 138, 'Veracruz-Llave', 'VE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2175, 138, 'Yucatan', 'YU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2176, 138, 'Zacatecas', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2177, 139, 'Chuuk', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2178, 139, 'Kosrae', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2179, 139, 'Pohnpei', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2180, 139, 'Yap', 'Y', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2181, 140, 'Gagauzia', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2182, 140, 'Chisinau', 'CU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2183, 140, 'Balti', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2184, 140, 'Cahul', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2185, 140, 'Edinet', 'ED', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2186, 140, 'Lapusna', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2187, 140, 'Orhei', 'OR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2188, 140, 'Soroca', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2189, 140, 'Tighina', 'TI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2190, 140, 'Ungheni', 'UN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2191, 140, 'St‚nga Nistrului', 'SN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2192, 141, 'Fontvieille', 'FV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2193, 141, 'La Condamine', 'LC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2194, 141, 'Monaco-Ville', 'MV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2195, 141, 'Monte-Carlo', 'MC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2196, 142, 'Ulanbaatar', '1', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2197, 142, 'Orhon', '035', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2198, 142, 'Darhan uul', '037', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2199, 142, 'Hentiy', '039', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2200, 142, 'Hovsgol', '041', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2201, 142, 'Hovd', '043', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2202, 142, 'Uvs', '046', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2203, 142, 'Tov', '047', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2204, 142, 'Selenge', '049', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2205, 142, 'Suhbaatar', '051', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2206, 142, 'Omnogovi', '053', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2207, 142, 'Ovorhangay', '055', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2208, 142, 'Dzavhan', '057', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2209, 142, 'DundgovL', '059', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2210, 142, 'Dornod', '061', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2211, 142, 'Dornogov', '063', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2212, 142, 'Govi-Sumber', '064', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2213, 142, 'Govi-Altay', '065', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2214, 142, 'Bulgan', '067', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2215, 142, 'Bayanhongor', '069', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2216, 142, 'Bayan-Olgiy', '071', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2217, 142, 'Arhangay', '073', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2218, 143, 'Saint Anthony', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2219, 143, 'Saint Georges', 'G', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2220, 143, 'Saint Peter', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2221, 144, 'Agadir', 'AGD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2222, 144, 'Al Hoceima', 'HOC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2223, 144, 'Azilal', 'AZI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2224, 144, 'Beni Mellal', 'BME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2225, 144, 'Ben Slimane', 'BSL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2226, 144, 'Boulemane', 'BLM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2227, 144, 'Casablanca', 'CBL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2228, 144, 'Chaouen', 'CHA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2229, 144, 'El Jadida', 'EJA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2230, 144, 'El Kelaa des Sraghna', 'EKS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2231, 144, 'Er Rachidia', 'ERA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2232, 144, 'Essaouira', 'ESS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2233, 144, 'Fes', 'FES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2234, 144, 'Figuig', 'FIG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2235, 144, 'Guelmim', 'GLM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2236, 144, 'Ifrane', 'IFR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2237, 144, 'Kenitra', 'KEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2238, 144, 'Khemisset', 'KHM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2239, 144, 'Khenifra', 'KHN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2240, 144, 'Khouribga', 'KHO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2241, 144, 'Laayoune', 'LYN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2242, 144, 'Larache', 'LAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2243, 144, 'Marrakech', 'MRK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2244, 144, 'Meknes', 'MKN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2245, 144, 'Nador', 'NAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2246, 144, 'Ouarzazate', 'ORZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2247, 144, 'Oujda', 'OUJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2248, 144, 'Rabat-Sale', 'RSA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2249, 144, 'Safi', 'SAF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2250, 144, 'Settat', 'SET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2251, 144, 'Sidi Kacem', 'SKA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2252, 144, 'Tangier', 'TGR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2253, 144, 'Tan-Tan', 'TAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2254, 144, 'Taounate', 'TAO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2255, 144, 'Taroudannt', 'TRD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2256, 144, 'Tata', 'TAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2257, 144, 'Taza', 'TAZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2258, 144, 'Tetouan', 'TET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2259, 144, 'Tiznit', 'TIZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2260, 144, 'Ad Dakhla', 'ADK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2261, 144, 'Boujdour', 'BJD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2262, 144, 'Es Smara', 'ESM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2263, 145, 'Cabo Delgado', 'CD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2264, 145, 'Gaza', 'GZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2265, 145, 'Inhambane', 'IN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2266, 145, 'Manica', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2267, 145, 'Maputo (city)', 'MC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2268, 145, 'Maputo', 'MP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2269, 145, 'Nampula', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2270, 145, 'Niassa', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2271, 145, 'Sofala', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2272, 145, 'Tete', 'TE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2273, 145, 'Zambezia', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2274, 146, 'Ayeyarwady', 'AY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2275, 146, 'Bago', 'BG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2276, 146, 'Magway', 'MG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2277, 146, 'Mandalay', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2278, 146, 'Sagaing', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2279, 146, 'Tanintharyi', 'TN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2280, 146, 'Yangon', 'YG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2281, 146, 'Chin State', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2282, 146, 'Kachin State', 'KC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2283, 146, 'Kayah State', 'KH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2284, 146, 'Kayin State', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2285, 146, 'Mon State', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2286, 146, 'Rakhine State', 'RK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2287, 146, 'Shan State', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2288, 147, 'Caprivi', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2289, 147, 'Erongo', 'ER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2290, 147, 'Hardap', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2291, 147, 'Karas', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2292, 147, 'Kavango', 'KV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2293, 147, 'Khomas', 'KH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2294, 147, 'Kunene', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2295, 147, 'Ohangwena', 'OW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2296, 147, 'Omaheke', 'OK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2297, 147, 'Omusati', 'OT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2298, 147, 'Oshana', 'ON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2299, 147, 'Oshikoto', 'OO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2300, 147, 'Otjozondjupa', 'OJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2301, 148, 'Aiwo', 'AO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2302, 148, 'Anabar', 'AA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2303, 148, 'Anetan', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2304, 148, 'Anibare', 'AI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2305, 148, 'Baiti', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2306, 148, 'Boe', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2307, 148, 'Buada', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2308, 148, 'Denigomodu', 'DE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2309, 148, 'Ewa', 'EW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2310, 148, 'Ijuw', 'IJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2311, 148, 'Meneng', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2312, 148, 'Nibok', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2313, 148, 'Uaboe', 'UA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2314, 148, 'Yaren', 'YA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2315, 149, 'Bagmati', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2316, 149, 'Bheri', 'BH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2317, 149, 'Dhawalagiri', 'DH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2318, 149, 'Gandaki', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2319, 149, 'Janakpur', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2320, 149, 'Karnali', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2321, 149, 'Kosi', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2322, 149, 'Lumbini', 'LU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2323, 149, 'Mahakali', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2324, 149, 'Mechi', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2325, 149, 'Narayani', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2326, 149, 'Rapti', 'RA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2327, 149, 'Sagarmatha', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2328, 149, 'Seti', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2329, 150, 'Drenthe', 'DR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2330, 150, 'Flevoland', 'FL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2331, 150, 'Friesland', 'FR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2332, 150, 'Gelderland', 'GE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2333, 150, 'Groningen', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2334, 150, 'Limburg', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2335, 150, 'Noord-Brabant', 'NB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2336, 150, 'Noord-Holland', 'NH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2337, 150, 'Overijssel', 'OV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2338, 150, 'Utrecht', 'UT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2339, 150, 'Zeeland', 'ZE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2340, 150, 'Zuid-Holland', 'ZH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2341, 152, 'Iles Loyaute', 'L', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2342, 152, 'Nord', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2343, 152, 'Sud', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2344, 153, 'Auckland', 'AUK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2345, 153, 'Bay of Plenty', 'BOP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2346, 153, 'Canterbury', 'CAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2347, 153, 'Coromandel', 'COR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2348, 153, 'Gisborne', 'GIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2349, 153, 'Fiordland', 'FIO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2350, 153, 'Hawke\'s Bay', 'HKB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2351, 153, 'Marlborough', 'MBH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2352, 153, 'Manawatu-Wanganui', 'MWT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2353, 153, 'Mt Cook-Mackenzie', 'MCM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2354, 153, 'Nelson', 'NSN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2355, 153, 'Northland', 'NTL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2356, 153, 'Otago', 'OTA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2357, 153, 'Southland', 'STL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2358, 153, 'Taranaki', 'TKI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2359, 153, 'Wellington', 'WGN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2360, 153, 'Waikato', 'WKO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2361, 153, 'Wairarapa', 'WAI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2362, 153, 'West Coast', 'WTC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2363, 154, 'Atlantico Norte', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2364, 154, 'Atlantico Sur', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2365, 154, 'Boaco', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2366, 154, 'Carazo', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2367, 154, 'Chinandega', 'CI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2368, 154, 'Chontales', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2369, 154, 'Esteli', 'ES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2370, 154, 'Granada', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2371, 154, 'Jinotega', 'JI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2372, 154, 'Leon', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2373, 154, 'Madriz', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2374, 154, 'Managua', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2375, 154, 'Masaya', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2376, 154, 'Matagalpa', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2377, 154, 'Nuevo Segovia', 'NS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2378, 154, 'Rio San Juan', 'RS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2379, 154, 'Rivas', 'RI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2380, 155, 'Agadez', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2381, 155, 'Diffa', 'DF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2382, 155, 'Dosso', 'DS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2383, 155, 'Maradi', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2384, 155, 'Niamey', 'NM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2385, 155, 'Tahoua', 'TH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2386, 155, 'Tillaberi', 'TL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2387, 155, 'Zinder', 'ZD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2388, 156, 'Abia', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2389, 156, 'Abuja Federal Capital Territory', 'CT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2390, 156, 'Adamawa', 'AD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2391, 156, 'Akwa Ibom', 'AK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2392, 156, 'Anambra', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2393, 156, 'Bauchi', 'BC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2394, 156, 'Bayelsa', 'BY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2395, 156, 'Benue', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2396, 156, 'Borno', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2397, 156, 'Cross River', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2398, 156, 'Delta', 'DE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2399, 156, 'Ebonyi', 'EB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2400, 156, 'Edo', 'ED', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2401, 156, 'Ekiti', 'EK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2402, 156, 'Enugu', 'EN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2403, 156, 'Gombe', 'GO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2404, 156, 'Imo', 'IM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2405, 156, 'Jigawa', 'JI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2406, 156, 'Kaduna', 'KD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2407, 156, 'Kano', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2408, 156, 'Katsina', 'KT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2409, 156, 'Kebbi', 'KE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2410, 156, 'Kogi', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2411, 156, 'Kwara', 'KW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2412, 156, 'Lagos', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2413, 156, 'Nassarawa', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2414, 156, 'Niger', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2415, 156, 'Ogun', 'OG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2416, 156, 'Ondo', 'ONG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2417, 156, 'Osun', 'OS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2418, 156, 'Oyo', 'OY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2419, 156, 'Plateau', 'PL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2420, 156, 'Rivers', 'RI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2421, 156, 'Sokoto', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2422, 156, 'Taraba', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2423, 156, 'Yobe', 'YO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2424, 156, 'Zamfara', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2425, 159, 'Northern Islands', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2426, 159, 'Rota', 'R', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2427, 159, 'Saipan', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2428, 159, 'Tinian', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2429, 160, 'Akershus', 'AK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2430, 160, 'Aust-Agder', 'AA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2431, 160, 'Buskerud', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2432, 160, 'Finnmark', 'FM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2433, 160, 'Hedmark', 'HM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2434, 160, 'Hordaland', 'HL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2435, 160, 'More og Romdal', 'MR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2436, 160, 'Nord-Trondelag', 'NT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2437, 160, 'Nordland', 'NL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2438, 160, 'Ostfold', 'OF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2439, 160, 'Oppland', 'OP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2440, 160, 'Oslo', 'OL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2441, 160, 'Rogaland', 'RL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2442, 160, 'Sor-Trondelag', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2443, 160, 'Sogn og Fjordane', 'SJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2444, 160, 'Svalbard', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2445, 160, 'Telemark', 'TM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2446, 160, 'Troms', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2447, 160, 'Vest-Agder', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2448, 160, 'Vestfold', 'VF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2449, 161, 'Ad Dakhiliyah', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2450, 161, 'Al Batinah', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2451, 161, 'Al Wusta', 'WU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2452, 161, 'Ash Sharqiyah', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2453, 161, 'Az Zahirah', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2454, 161, 'Masqat', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2455, 161, 'Musandam', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2456, 161, 'Zufar', 'ZU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2457, 162, 'Balochistan', 'B', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2458, 162, 'Federally Administered Tribal Areas', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2459, 162, 'Islamabad Capital Territory', 'I', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2460, 162, 'North-West Frontier', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2461, 162, 'Punjab', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2462, 162, 'Sindh', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2463, 163, 'Aimeliik', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2464, 163, 'Airai', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2465, 163, 'Angaur', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2466, 163, 'Hatohobei', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2467, 163, 'Kayangel', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2468, 163, 'Koror', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2469, 163, 'Melekeok', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2470, 163, 'Ngaraard', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2471, 163, 'Ngarchelong', 'NG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2472, 163, 'Ngardmau', 'ND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2473, 163, 'Ngatpang', 'NT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2474, 163, 'Ngchesar', 'NC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2475, 163, 'Ngeremlengui', 'NR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2476, 163, 'Ngiwal', 'NW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2477, 163, 'Peleliu', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2478, 163, 'Sonsorol', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2479, 164, 'Bocas del Toro', 'BT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2480, 164, 'Chiriqui', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2481, 164, 'Cocle', 'CC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2482, 164, 'Colon', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2483, 164, 'Darien', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2484, 164, 'Herrera', 'HE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2485, 164, 'Los Santos', 'LS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2486, 164, 'Panama', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2487, 164, 'San Blas', 'SB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2488, 164, 'Veraguas', 'VG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2489, 165, 'Bougainville', 'BV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2490, 165, 'Central', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2491, 165, 'Chimbu', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2492, 165, 'Eastern Highlands', 'EH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2493, 165, 'East New Britain', 'EB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2494, 165, 'East Sepik', 'ES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2495, 165, 'Enga', 'EN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2496, 165, 'Gulf', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2497, 165, 'Madang', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2498, 165, 'Manus', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2499, 165, 'Milne Bay', 'MB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2500, 165, 'Morobe', 'MR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2501, 165, 'National Capital', 'NC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2502, 165, 'New Ireland', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2503, 165, 'Northern', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2504, 165, 'Sandaun', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2505, 165, 'Southern Highlands', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2506, 165, 'Western', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2507, 165, 'Western Highlands', 'WH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2508, 165, 'West New Britain', 'WB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2509, 166, 'Alto Paraguay', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2510, 166, 'Alto Parana', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2511, 166, 'Amambay', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2512, 166, 'Asuncion', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2513, 166, 'Boqueron', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2514, 166, 'Caaguazu', 'CG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2515, 166, 'Caazapa', 'CZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2516, 166, 'Canindeyu', 'CN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2517, 166, 'Central', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2518, 166, 'Concepcion', 'CC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2519, 166, 'Cordillera', 'CD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2520, 166, 'Guaira', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2521, 166, 'Itapua', 'IT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2522, 166, 'Misiones', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2523, 166, 'Neembucu', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2524, 166, 'Paraguari', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2525, 166, 'Presidente Hayes', 'PH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2526, 166, 'San Pedro', 'SP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2527, 167, 'Amazonas', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2528, 167, 'Ancash', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2529, 167, 'Apurimac', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2530, 167, 'Arequipa', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2531, 167, 'Ayacucho', 'AY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2532, 167, 'Cajamarca', 'CJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2533, 167, 'Callao', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2534, 167, 'Cusco', 'CU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2535, 167, 'Huancavelica', 'HV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2536, 167, 'Huanuco', 'HO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2537, 167, 'Ica', 'IC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2538, 167, 'Junin', 'JU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2539, 167, 'La Libertad', 'LD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2540, 167, 'Lambayeque', 'LY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2541, 167, 'Lima', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2542, 167, 'Loreto', 'LO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2543, 167, 'Madre de Dios', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2544, 167, 'Moquegua', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2545, 167, 'Pasco', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2546, 167, 'Piura', 'PI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2547, 167, 'Puno', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2548, 167, 'San Martin', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2549, 167, 'Tacna', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2550, 167, 'Tumbes', 'TU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2551, 167, 'Ucayali', 'UC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2552, 168, 'Abra', 'ABR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2553, 168, 'Agusan del Norte', 'ANO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2554, 168, 'Agusan del Sur', 'ASU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2555, 168, 'Aklan', 'AKL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2556, 168, 'Albay', 'ALB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2557, 168, 'Antique', 'ANT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2558, 168, 'Apayao', 'APY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2559, 168, 'Aurora', 'AUR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2560, 168, 'Basilan', 'BAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2561, 168, 'Bataan', 'BTA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2562, 168, 'Batanes', 'BTE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2563, 168, 'Batangas', 'BTG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2564, 168, 'Biliran', 'BLR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2565, 168, 'Benguet', 'BEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2566, 168, 'Bohol', 'BOL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2567, 168, 'Bukidnon', 'BUK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2568, 168, 'Bulacan', 'BUL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2569, 168, 'Cagayan', 'CAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2570, 168, 'Camarines Norte', 'CNO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2571, 168, 'Camarines Sur', 'CSU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2572, 168, 'Camiguin', 'CAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2573, 168, 'Capiz', 'CAP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2574, 168, 'Catanduanes', 'CAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2575, 168, 'Cavite', 'CAV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2576, 168, 'Cebu', 'CEB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2577, 168, 'Compostela', 'CMP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2578, 168, 'Davao del Norte', 'DNO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2579, 168, 'Davao del Sur', 'DSU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2580, 168, 'Davao Oriental', 'DOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2581, 168, 'Eastern Samar', 'ESA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2582, 168, 'Guimaras', 'GUI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2583, 168, 'Ifugao', 'IFU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2584, 168, 'Ilocos Norte', 'INO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2585, 168, 'Ilocos Sur', 'ISU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2586, 168, 'Iloilo', 'ILO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2587, 168, 'Isabela', 'ISA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2588, 168, 'Kalinga', 'KAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2589, 168, 'Laguna', 'LAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2590, 168, 'Lanao del Norte', 'LNO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2591, 168, 'Lanao del Sur', 'LSU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2592, 168, 'La Union', 'UNI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2593, 168, 'Leyte', 'LEY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2594, 168, 'Maguindanao', 'MAG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2595, 168, 'Marinduque', 'MRN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2596, 168, 'Masbate', 'MSB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2597, 168, 'Mindoro Occidental', 'MIC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2598, 168, 'Mindoro Oriental', 'MIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2599, 168, 'Misamis Occidental', 'MSC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2600, 168, 'Misamis Oriental', 'MOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2601, 168, 'Mountain', 'MOP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2602, 168, 'Negros Occidental', 'NOC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2603, 168, 'Negros Oriental', 'NOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2604, 168, 'North Cotabato', 'NCT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2605, 168, 'Northern Samar', 'NSM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2606, 168, 'Nueva Ecija', 'NEC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2607, 168, 'Nueva Vizcaya', 'NVZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2608, 168, 'Palawan', 'PLW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2609, 168, 'Pampanga', 'PMP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2610, 168, 'Pangasinan', 'PNG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2611, 168, 'Quezon', 'QZN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2612, 168, 'Quirino', 'QRN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2613, 168, 'Rizal', 'RIZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2614, 168, 'Romblon', 'ROM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2615, 168, 'Samar', 'SMR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2616, 168, 'Sarangani', 'SRG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2617, 168, 'Siquijor', 'SQJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2618, 168, 'Sorsogon', 'SRS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2619, 168, 'South Cotabato', 'SCO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2620, 168, 'Southern Leyte', 'SLE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2621, 168, 'Sultan Kudarat', 'SKU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2622, 168, 'Sulu', 'SLU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2623, 168, 'Surigao del Norte', 'SNO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2624, 168, 'Surigao del Sur', 'SSU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2625, 168, 'Tarlac', 'TAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2626, 168, 'Tawi-Tawi', 'TAW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2627, 168, 'Zambales', 'ZBL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2628, 168, 'Zamboanga del Norte', 'ZNO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2629, 168, 'Zamboanga del Sur', 'ZSU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2630, 168, 'Zamboanga Sibugay', 'ZSI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2631, 170, 'Dolnoslaskie', 'DO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2632, 170, 'Kujawsko-Pomorskie', 'KP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2633, 170, 'Lodzkie', 'LO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2634, 170, 'Lubelskie', 'LL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2635, 170, 'Lubuskie', 'LU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2636, 170, 'Malopolskie', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2637, 170, 'Mazowieckie', 'MZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2638, 170, 'Opolskie', 'OP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2639, 170, 'Podkarpackie', 'PP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2640, 170, 'Podlaskie', 'PL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2641, 170, 'Pomorskie', 'PM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2642, 170, 'Slaskie', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2643, 170, 'Swietokrzyskie', 'SW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2644, 170, 'Warminsko-Mazurskie', 'WM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2645, 170, 'Wielkopolskie', 'WP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2646, 170, 'Zachodniopomorskie', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2647, 198, 'Saint Pierre', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2648, 198, 'Miquelon', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2649, 171, 'A&ccedil;ores', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2650, 171, 'Aveiro', 'AV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2651, 171, 'Beja', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2652, 171, 'Braga', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2653, 171, 'Bragan&ccedil;a', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2654, 171, 'Castelo Branco', 'CB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2655, 171, 'Coimbra', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2656, 171, '&Eacute;vora', 'EV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2657, 171, 'Faro', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2658, 171, 'Guarda', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2659, 171, 'Leiria', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2660, 171, 'Lisboa', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2661, 171, 'Madeira', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2662, 171, 'Portalegre', 'PO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2663, 171, 'Porto', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2664, 171, 'Santar&eacute;m', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2665, 171, 'Set&uacute;bal', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2666, 171, 'Viana do Castelo', 'VC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2667, 171, 'Vila Real', 'VR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2668, 171, 'Viseu', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2669, 173, 'Ad Dawhah', 'DW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2670, 173, 'Al Ghuwayriyah', 'GW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2671, 173, 'Al Jumayliyah', 'JM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2672, 173, 'Al Khawr', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2673, 173, 'Al Wakrah', 'WK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2674, 173, 'Ar Rayyan', 'RN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2675, 173, 'Jarayan al Batinah', 'JB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2676, 173, 'Madinat ash Shamal', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2677, 173, 'Umm Sa\'id', 'UD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2678, 173, 'Umm Salal', 'UL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2679, 175, 'Alba', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2680, 175, 'Arad', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2681, 175, 'Arges', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2682, 175, 'Bacau', 'BC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2683, 175, 'Bihor', 'BH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2684, 175, 'Bistrita-Nasaud', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2685, 175, 'Botosani', 'BT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2686, 175, 'Brasov', 'BV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2687, 175, 'Braila', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2688, 175, 'Bucuresti', 'B', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2689, 175, 'Buzau', 'BZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2690, 175, 'Caras-Severin', 'CS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2691, 175, 'Calarasi', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2692, 175, 'Cluj', 'CJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2693, 175, 'Constanta', 'CT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2694, 175, 'Covasna', 'CV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2695, 175, 'Dimbovita', 'DB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2696, 175, 'Dolj', 'DJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2697, 175, 'Galati', 'GL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2698, 175, 'Giurgiu', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2699, 175, 'Gorj', 'GJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2700, 175, 'Harghita', 'HR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2701, 175, 'Hunedoara', 'HD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2702, 175, 'Ialomita', 'IL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2703, 175, 'Iasi', 'IS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2704, 175, 'Ilfov', 'IF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2705, 175, 'Maramures', 'MM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2706, 175, 'Mehedinti', 'MH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2707, 175, 'Mures', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2708, 175, 'Neamt', 'NT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2709, 175, 'Olt', 'OT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2710, 175, 'Prahova', 'PH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2711, 175, 'Satu-Mare', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2712, 175, 'Salaj', 'SJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2713, 175, 'Sibiu', 'SB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2714, 175, 'Suceava', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2715, 175, 'Teleorman', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2716, 175, 'Timis', 'TM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2717, 175, 'Tulcea', 'TL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2718, 175, 'Vaslui', 'VS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2719, 175, 'Valcea', 'VL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2720, 175, 'Vrancea', 'VN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2721, 176, 'Abakan', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2722, 176, 'Aginskoye', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2723, 176, 'Anadyr', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2724, 176, 'Arkahangelsk', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2725, 176, 'Astrakhan', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2726, 176, 'Barnaul', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2727, 176, 'Belgorod', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2728, 176, 'Birobidzhan', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2729, 176, 'Blagoveshchensk', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2730, 176, 'Bryansk', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2731, 176, 'Cheboksary', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2732, 176, 'Chelyabinsk', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2733, 176, 'Cherkessk', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2734, 176, 'Chita', 'CI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2735, 176, 'Dudinka', 'DU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2736, 176, 'Elista', 'EL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2738, 176, 'Gorno-Altaysk', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2739, 176, 'Groznyy', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2740, 176, 'Irkutsk', 'IR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2741, 176, 'Ivanovo', 'IV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2742, 176, 'Izhevsk', 'IZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2743, 176, 'Kalinigrad', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2744, 176, 'Kaluga', 'KL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2745, 176, 'Kasnodar', 'KS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2746, 176, 'Kazan', 'KZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2747, 176, 'Kemerovo', 'KE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2748, 176, 'Khabarovsk', 'KH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2749, 176, 'Khanty-Mansiysk', 'KM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2750, 176, 'Kostroma', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2751, 176, 'Krasnodar', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2752, 176, 'Krasnoyarsk', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2753, 176, 'Kudymkar', 'KU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2754, 176, 'Kurgan', 'KG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2755, 176, 'Kursk', 'KK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2756, 176, 'Kyzyl', 'KY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2757, 176, 'Lipetsk', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2758, 176, 'Magadan', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2759, 176, 'Makhachkala', 'MK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2760, 176, 'Maykop', 'MY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2761, 176, 'Moscow', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2762, 176, 'Murmansk', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2763, 176, 'Nalchik', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2764, 176, 'Naryan Mar', 'NR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2765, 176, 'Nazran', 'NZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2766, 176, 'Nizhniy Novgorod', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2767, 176, 'Novgorod', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2768, 176, 'Novosibirsk', 'NV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2769, 176, 'Omsk', 'OM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2770, 176, 'Orel', 'OR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2771, 176, 'Orenburg', 'OE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2772, 176, 'Palana', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2773, 176, 'Penza', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2774, 176, 'Perm', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2776, 176, 'Petrozavodsk', 'PT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2777, 176, 'Pskov', 'PS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2778, 176, 'Rostov-na-Donu', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2779, 176, 'Ryazan', 'RY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2780, 176, 'Salekhard', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2781, 176, 'Samara', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2782, 176, 'Saransk', 'SR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2783, 176, 'Saratov', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2784, 176, 'Smolensk', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2785, 176, 'St. Petersburg', 'SP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2786, 176, 'Stavropol', 'ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2787, 176, 'Syktyvkar', 'SY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2788, 176, 'Tambov', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2789, 176, 'Tomsk', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2790, 176, 'Tula', 'TU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2791, 176, 'Tura', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2792, 176, 'Tver', 'TV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2793, 176, 'Tyumen', 'TY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2794, 176, 'Ufa', 'UF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2795, 176, 'Ul\'yanovsk', 'UL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2796, 176, 'Ulan-Ude', 'UU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2797, 176, 'Ust\'-Ordynskiy', 'US', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2798, 176, 'Vladikavkaz', 'VL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2799, 176, 'Vladimir', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2800, 176, 'Vladivostok', 'VV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2801, 176, 'Volgograd', 'VG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2802, 176, 'Vologda', 'VD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2803, 176, 'Voronezh', 'VO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2804, 176, 'Vyatka', 'VY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2805, 176, 'Yakutsk', 'YA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2806, 176, 'Yaroslavl', 'YR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2807, 176, 'Yekaterinburg', 'YE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2808, 176, 'Yoshkar-Ola', 'YO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2809, 177, 'Butare', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2810, 177, 'Byumba', 'BY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2811, 177, 'Cyangugu', 'CY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2812, 177, 'Gikongoro', 'GK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2813, 177, 'Gisenyi', 'GS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2814, 177, 'Gitarama', 'GT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2815, 177, 'Kibungo', 'KG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2816, 177, 'Kibuye', 'KY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2817, 177, 'Kigali Rurale', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2818, 177, 'Kigali-ville', 'KV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2819, 177, 'Ruhengeri', 'RU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2820, 177, 'Umutara', 'UM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2821, 178, 'Christ Church Nichola Town', 'CCN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2822, 178, 'Saint Anne Sandy Point', 'SAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2823, 178, 'Saint George Basseterre', 'SGB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2824, 178, 'Saint George Gingerland', 'SGG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2825, 178, 'Saint James Windward', 'SJW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2826, 178, 'Saint John Capesterre', 'SJC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2827, 178, 'Saint John Figtree', 'SJF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2828, 178, 'Saint Mary Cayon', 'SMC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2829, 178, 'Saint Paul Capesterre', 'CAP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2830, 178, 'Saint Paul Charlestown', 'CHA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2831, 178, 'Saint Peter Basseterre', 'SPB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2832, 178, 'Saint Thomas Lowland', 'STL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2833, 178, 'Saint Thomas Middle Island', 'STM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2834, 178, 'Trinity Palmetto Point', 'TPP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2835, 179, 'Anse-la-Raye', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2836, 179, 'Castries', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2837, 179, 'Choiseul', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2838, 179, 'Dauphin', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2839, 179, 'Dennery', 'DE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2840, 179, 'Gros-Islet', 'GI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2841, 179, 'Laborie', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2842, 179, 'Micoud', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2843, 179, 'Praslin', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2844, 179, 'Soufriere', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2845, 179, 'Vieux-Fort', 'VF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2846, 180, 'Charlotte', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2847, 180, 'Grenadines', 'R', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2848, 180, 'Saint Andrew', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2849, 180, 'Saint David', 'D', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2850, 180, 'Saint George', 'G', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2851, 180, 'Saint Patrick', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2852, 181, 'A\'ana', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2853, 181, 'Aiga-i-le-Tai', 'AI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2854, 181, 'Atua', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2855, 181, 'Fa\'asaleleaga', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2856, 181, 'Gaga\'emauga', 'GE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2857, 181, 'Gagaifomauga', 'GF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2858, 181, 'Palauli', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2859, 181, 'Satupa\'itea', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2860, 181, 'Tuamasaga', 'TU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2861, 181, 'Va\'a-o-Fonoti', 'VF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2862, 181, 'Vaisigano', 'VS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2863, 182, 'Acquaviva', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2864, 182, 'Borgo Maggiore', 'BM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2865, 182, 'Chiesanuova', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2866, 182, 'Domagnano', 'DO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2867, 182, 'Faetano', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2868, 182, 'Fiorentino', 'FI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2869, 182, 'Montegiardino', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2870, 182, 'Citta di San Marino', 'SM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2871, 182, 'Serravalle', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2872, 183, 'Sao Tome', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2873, 183, 'Principe', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2874, 184, 'Al Bahah', 'BH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2876, 184, 'Al Jawf', 'JF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2877, 184, 'Al Madinah', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2878, 184, 'Al Qasim', 'QS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2879, 184, 'Ar Riyad', 'RD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2881, 184, '\'Asir', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2882, 184, 'Ha\'il', 'HL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2883, 184, 'Jizan', 'JZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2884, 184, 'Makkah', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2885, 184, 'Najran', 'NR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2886, 184, 'Tabuk', 'TB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2887, 185, 'Dakar', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2888, 185, 'Diourbel', 'DI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2889, 185, 'Fatick', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2890, 185, 'Kaolack', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2891, 185, 'Kolda', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2892, 185, 'Louga', 'LO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2893, 185, 'Matam', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2894, 185, 'Saint-Louis', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2895, 185, 'Tambacounda', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2896, 185, 'Thies', 'TH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2897, 185, 'Ziguinchor', 'ZI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2898, 186, 'Anse aux Pins', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2899, 186, 'Anse Boileau', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2900, 186, 'Anse Etoile', 'AE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2901, 186, 'Anse Louis', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2902, 186, 'Anse Royale', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2903, 186, 'Baie Lazare', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2904, 186, 'Baie Sainte Anne', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2905, 186, 'Beau Vallon', 'BV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2906, 186, 'Bel Air', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2907, 186, 'Bel Ombre', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2908, 186, 'Cascade', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2909, 186, 'Glacis', 'GL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2912, 186, 'La Digue', 'DG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2913, 186, 'La Riviere Anglaise', 'RA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2914, 186, 'Mont Buxton', 'MB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2915, 186, 'Mont Fleuri', 'MF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2916, 186, 'Plaisance', 'PL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2917, 186, 'Pointe La Rue', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2918, 186, 'Port Glaud', 'PG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2919, 186, 'Saint Louis', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2920, 186, 'Takamaka', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2921, 187, 'Eastern', 'E', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2922, 187, 'Northern', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2923, 187, 'Southern', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2924, 187, 'Western', 'W', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2925, 189, 'Banskobystrický', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2926, 189, 'Bratislavský', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2927, 189, 'Košický', 'KO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2928, 189, 'Nitriansky', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2929, 189, 'Prešovský', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2930, 189, 'Trenčiansky', 'TC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2931, 189, 'Trnavský', 'TV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2932, 189, 'Žilinský', 'ZI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2933, 191, 'Central', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2934, 191, 'Choiseul', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2935, 191, 'Guadalcanal', 'GC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2936, 191, 'Honiara', 'HO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2937, 191, 'Isabel', 'IS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2938, 191, 'Makira', 'MK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2939, 191, 'Malaita', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2940, 191, 'Rennell and Bellona', 'RB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2941, 191, 'Temotu', 'TM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2942, 191, 'Western', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2943, 192, 'Awdal', 'AW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2944, 192, 'Bakool', 'BK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2945, 192, 'Banaadir', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2946, 192, 'Bari', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2947, 192, 'Bay', 'BY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2948, 192, 'Galguduud', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2949, 192, 'Gedo', 'GE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2950, 192, 'Hiiraan', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2951, 192, 'Jubbada Dhexe', 'JD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2952, 192, 'Jubbada Hoose', 'JH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2953, 192, 'Mudug', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2954, 192, 'Nugaal', 'NU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2955, 192, 'Sanaag', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2956, 192, 'Shabeellaha Dhexe', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2957, 192, 'Shabeellaha Hoose', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2958, 192, 'Sool', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2959, 192, 'Togdheer', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2960, 192, 'Woqooyi Galbeed', 'WG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2961, 193, 'Eastern Cape', 'EC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2962, 193, 'Free State', 'FS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2963, 193, 'Gauteng', 'GT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2964, 193, 'KwaZulu-Natal', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2965, 193, 'Limpopo', 'LP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2966, 193, 'Mpumalanga', 'MP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2967, 193, 'North West', 'NW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2968, 193, 'Northern Cape', 'NC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2969, 193, 'Western Cape', 'WC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2970, 195, 'La Coru&ntilde;a', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2971, 195, '&Aacute;lava', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2972, 195, 'Albacete', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2973, 195, 'Alicante', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2974, 195, 'Almeria', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2975, 195, 'Asturias', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2976, 195, '&Aacute;vila', 'AV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2977, 195, 'Badajoz', 'BJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2978, 195, 'Baleares', 'IB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2979, 195, 'Barcelona', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2980, 195, 'Burgos', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2981, 195, 'C&aacute;ceres', 'CC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2982, 195, 'C&aacute;diz', 'CZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2983, 195, 'Cantabria', 'CT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2984, 195, 'Castell&oacute;n', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2985, 195, 'Ceuta', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2986, 195, 'Ciudad Real', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2987, 195, 'C&oacute;rdoba', 'CD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2988, 195, 'Cuenca', 'CU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2989, 195, 'Girona', 'GI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2990, 195, 'Granada', 'GD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2991, 195, 'Guadalajara', 'GJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2992, 195, 'Guip&uacute;zcoa', 'GP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2993, 195, 'Huelva', 'HL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2994, 195, 'Huesca', 'HS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2995, 195, 'Ja&eacute;n', 'JN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2996, 195, 'La Rioja', 'RJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2997, 195, 'Las Palmas', 'PM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2998, 195, 'Leon', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (2999, 195, 'Lleida', 'LL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3000, 195, 'Lugo', 'LG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3001, 195, 'Madrid', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3002, 195, 'Malaga', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3003, 195, 'Melilla', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3004, 195, 'Murcia', 'MU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3005, 195, 'Navarra', 'NV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3006, 195, 'Ourense', 'OU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3007, 195, 'Palencia', 'PL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3008, 195, 'Pontevedra', 'PO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3009, 195, 'Salamanca', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3010, 195, 'Santa Cruz de Tenerife', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3011, 195, 'Segovia', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3012, 195, 'Sevilla', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3013, 195, 'Soria', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3014, 195, 'Tarragona', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3015, 195, 'Teruel', 'TE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3016, 195, 'Toledo', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3017, 195, 'Valencia', 'VC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3018, 195, 'Valladolid', 'VD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3019, 195, 'Vizcaya', 'VZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3020, 195, 'Zamora', 'ZM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3021, 195, 'Zaragoza', 'ZR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3022, 196, 'Central', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3023, 196, 'Eastern', 'EA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3024, 196, 'North Central', 'NC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3025, 196, 'Northern', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3026, 196, 'North Western', 'NW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3027, 196, 'Sabaragamuwa', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3028, 196, 'Southern', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3029, 196, 'Uva', 'UV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3030, 196, 'Western', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3032, 197, 'Saint Helena', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3034, 199, 'A\'ali an Nil', 'ANL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3035, 199, 'Al Bahr al Ahmar', 'BAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3036, 199, 'Al Buhayrat', 'BRT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3037, 199, 'Al Jazirah', 'JZR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3038, 199, 'Al Khartum', 'KRT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3039, 199, 'Al Qadarif', 'QDR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3040, 199, 'Al Wahdah', 'WDH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3041, 199, 'An Nil al Abyad', 'ANB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3042, 199, 'An Nil al Azraq', 'ANZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3043, 199, 'Ash Shamaliyah', 'ASH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3044, 199, 'Bahr al Jabal', 'BJA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3047, 199, 'Gharb Darfur', 'GDA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3048, 199, 'Gharb Kurdufan', 'GKU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3049, 199, 'Janub Darfur', 'JDA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3050, 199, 'Janub Kurdufan', 'JKU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3051, 199, 'Junqali', 'JQL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3052, 199, 'Kassala', 'KSL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3053, 199, 'Nahr an Nil', 'NNL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3055, 199, 'Shamal Darfur', 'SDA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3056, 199, 'Shamal Kurdufan', 'SKU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3058, 199, 'Sinnar', 'SNR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3059, 199, 'Warab', 'WRB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3060, 200, 'Brokopondo', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3061, 200, 'Commewijne', 'CM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3062, 200, 'Coronie', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3063, 200, 'Marowijne', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3064, 200, 'Nickerie', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3065, 200, 'Para', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3066, 200, 'Paramaribo', 'PM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3067, 200, 'Saramacca', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3068, 200, 'Sipaliwini', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3069, 200, 'Wanica', 'WA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3070, 202, 'Hhohho', 'H', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3071, 202, 'Lubombo', 'L', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3072, 202, 'Manzini', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3073, 202, 'Shishelweni', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3074, 203, 'Blekinge', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3075, 203, 'Dalarna', 'W', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3076, 203, 'Gävleborg', 'X', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3077, 203, 'Gotland', 'I', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3078, 203, 'Halland', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3079, 203, 'Jämtland', 'Z', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3080, 203, 'Jönköping', 'F', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3081, 203, 'Kalmar', 'H', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3082, 203, 'Kronoberg', 'G', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3083, 203, 'Norrbotten', 'BD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3084, 203, 'Örebro', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3085, 203, 'Östergötland', 'E', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3086, 203, 'Sk&aring;ne', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3087, 203, 'Södermanland', 'D', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3088, 203, 'Stockholm', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3089, 203, 'Uppsala', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3090, 203, 'Värmland', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3091, 203, 'Västerbotten', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3092, 203, 'Västernorrland', 'Y', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3093, 203, 'Västmanland', 'U', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3094, 203, 'Västra Götaland', 'O', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3095, 204, 'Aargau', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3096, 204, 'Appenzell Ausserrhoden', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3097, 204, 'Appenzell Innerrhoden', 'AI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3098, 204, 'Basel-Stadt', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3099, 204, 'Basel-Landschaft', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3100, 204, 'Bern', 'BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3101, 204, 'Fribourg', 'FR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3102, 204, 'Gen&egrave;ve', 'GE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3103, 204, 'Glarus', 'GL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3104, 204, 'Graubünden', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3105, 204, 'Jura', 'JU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3106, 204, 'Luzern', 'LU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3107, 204, 'Neuch&acirc;tel', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3108, 204, 'Nidwald', 'NW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3109, 204, 'Obwald', 'OW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3110, 204, 'St. Gallen', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3111, 204, 'Schaffhausen', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3112, 204, 'Schwyz', 'SZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3113, 204, 'Solothurn', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3114, 204, 'Thurgau', 'TG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3115, 204, 'Ticino', 'TI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3116, 204, 'Uri', 'UR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3117, 204, 'Valais', 'VS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3118, 204, 'Vaud', 'VD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3119, 204, 'Zug', 'ZG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3120, 204, 'Zürich', 'ZH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3121, 205, 'Al Hasakah', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3122, 205, 'Al Ladhiqiyah', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3123, 205, 'Al Qunaytirah', 'QU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3124, 205, 'Ar Raqqah', 'RQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3125, 205, 'As Suwayda', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3126, 205, 'Dara', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3127, 205, 'Dayr az Zawr', 'DZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3128, 205, 'Dimashq', 'DI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3129, 205, 'Halab', 'HL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3130, 205, 'Hamah', 'HM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3131, 205, 'Hims', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3132, 205, 'Idlib', 'ID', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3133, 205, 'Rif Dimashq', 'RD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3134, 205, 'Tartus', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3160, 207, 'Gorno-Badakhstan', 'GB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3161, 207, 'Khatlon', 'KT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3162, 207, 'Sughd', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3163, 208, 'Arusha', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3164, 208, 'Dar es Salaam', 'DS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3165, 208, 'Dodoma', 'DO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3166, 208, 'Iringa', 'IR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3167, 208, 'Kagera', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3168, 208, 'Kigoma', 'KI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3169, 208, 'Kilimanjaro', 'KJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3170, 208, 'Lindi', 'LN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3171, 208, 'Manyara', 'MY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3172, 208, 'Mara', 'MR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3173, 208, 'Mbeya', 'MB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3174, 208, 'Morogoro', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3175, 208, 'Mtwara', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3176, 208, 'Mwanza', 'MW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3177, 208, 'Pemba North', 'PN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3178, 208, 'Pemba South', 'PS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3179, 208, 'Pwani', 'PW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3180, 208, 'Rukwa', 'RK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3181, 208, 'Ruvuma', 'RV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3182, 208, 'Shinyanga', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3183, 208, 'Singida', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3184, 208, 'Tabora', 'TB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3185, 208, 'Tanga', 'TN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3186, 208, 'Zanzibar Central/South', 'ZC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3187, 208, 'Zanzibar North', 'ZN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3188, 208, 'Zanzibar Urban/West', 'ZU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3189, 209, 'Amnat Charoen', 'Amnat Charoen', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3190, 209, 'Ang Thong', 'Ang Thong', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3191, 209, 'Ayutthaya', 'Ayutthaya', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3192, 209, 'Bangkok', 'Bangkok', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3193, 209, 'Buriram', 'Buriram', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3194, 209, 'Chachoengsao', 'Chachoengsao', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3195, 209, 'Chai Nat', 'Chai Nat', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3196, 209, 'Chaiyaphum', 'Chaiyaphum', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3197, 209, 'Chanthaburi', 'Chanthaburi', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3198, 209, 'Chiang Mai', 'Chiang Mai', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3199, 209, 'Chiang Rai', 'Chiang Rai', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3200, 209, 'Chon Buri', 'Chon Buri', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3201, 209, 'Chumphon', 'Chumphon', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3202, 209, 'Kalasin', 'Kalasin', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3204, 209, 'Kanchanaburi', 'Kanchanaburi', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3205, 209, 'Khon Kaen', 'Khon Kaen', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3206, 209, 'Krabi', 'Krabi', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3207, 209, 'Lampang', 'Lampang', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3208, 209, 'Lamphun', 'Lamphun', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3209, 209, 'Loei', 'Loei', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3210, 209, 'Lop Buri', 'Lop Buri', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3211, 209, 'Mae Hong Son', 'Mae Hong Son', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3212, 209, 'Maha Sarakham', 'Maha Sarakham', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3213, 209, 'Mukdahan', 'Mukdahan', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasim', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thamma', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3220, 209, 'Nan', 'Nan', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3221, 209, 'Narathiwat', 'Narathiwat', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3223, 209, 'Nong Khai', 'Nong Khai', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3224, 209, 'Nonthaburi', 'Nonthaburi', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3225, 209, 'Pathum Thani', 'Pathum Thani', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3226, 209, 'Pattani', 'Pattani', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3227, 209, 'Phangnga', 'Phangnga', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3228, 209, 'Phatthalung', 'Phatthalung', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3229, 209, 'Phayao', 'Phayao', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3230, 209, 'Phetchabun', 'Phetchabun', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3231, 209, 'Phetchaburi', 'Phetchaburi', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3232, 209, 'Phichit', 'Phichit', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3233, 209, 'Phitsanulok', 'Phitsanulok', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3234, 209, 'Phrae', 'Phrae', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3235, 209, 'Phuket', 'Phuket', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3236, 209, 'Prachin Buri', 'Prachin Buri', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3238, 209, 'Ranong', 'Ranong', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3239, 209, 'Ratchaburi', 'Ratchaburi', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3240, 209, 'Rayong', 'Rayong', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3241, 209, 'Roi Et', 'Roi Et', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3242, 209, 'Sa Kaeo', 'Sa Kaeo', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3244, 209, 'Samut Prakan', 'Samut Prakan', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3245, 209, 'Samut Sakhon', 'Samut Sakhon', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3246, 209, 'Samut Songkhram', 'Samut Songkhram', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3247, 209, 'Sara Buri', 'Sara Buri', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3248, 209, 'Satun', 'Satun', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3249, 209, 'Sing Buri', 'Sing Buri', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3250, 209, 'Sisaket', 'Sisaket', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3251, 209, 'Songkhla', 'Songkhla', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3252, 209, 'Sukhothai', 'Sukhothai', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3253, 209, 'Suphan Buri', 'Suphan Buri', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3254, 209, 'Surat Thani', 'Surat Thani', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3255, 209, 'Surin', 'Surin', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3256, 209, 'Tak', 'Tak', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3257, 209, 'Trang', 'Trang', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3258, 209, 'Trat', 'Trat', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3260, 209, 'Udon Thani', 'Udon Thani', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3261, 209, 'Uthai Thani', 'Uthai Thani', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3262, 209, 'Uttaradit', 'Uttaradit', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3263, 209, 'Yala', 'Yala', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3264, 209, 'Yasothon', 'Yasothon', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3265, 210, 'Kara', 'K', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3266, 210, 'Plateaux', 'P', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3267, 210, 'Savanes', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3268, 210, 'Centrale', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3269, 210, 'Maritime', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3270, 211, 'Atafu', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3271, 211, 'Fakaofo', 'F', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3272, 211, 'Nukunonu', 'N', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3273, 212, 'Ha\'apai', 'H', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3274, 212, 'Tongatapu', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3275, 212, 'Vava\'u', 'V', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3277, 213, 'Diego Martin', 'DM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3278, 213, 'Mayaro/Rio Claro', 'MR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3279, 213, 'Penal/Debe', 'PD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3280, 213, 'Princes Town', 'PT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3281, 213, 'Sangre Grande', 'SG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3282, 213, 'San Juan/Laventille', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3283, 213, 'Siparia', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3284, 213, 'Tunapuna/Piarco', 'TP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3285, 213, 'Port of Spain', 'PS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3286, 213, 'San Fernando', 'SF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3287, 213, 'Arima', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3288, 213, 'Point Fortin', 'PF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3289, 213, 'Chaguanas', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3290, 213, 'Tobago', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3291, 214, 'Ariana', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3292, 214, 'Beja', 'BJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3293, 214, 'Ben Arous', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3294, 214, 'Bizerte', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3295, 214, 'Gabes', 'GB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3296, 214, 'Gafsa', 'GF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3297, 214, 'Jendouba', 'JE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3298, 214, 'Kairouan', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3299, 214, 'Kasserine', 'KS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3300, 214, 'Kebili', 'KB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3301, 214, 'Kef', 'KF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3302, 214, 'Mahdia', 'MH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3303, 214, 'Manouba', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3304, 214, 'Medenine', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3305, 214, 'Monastir', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3306, 214, 'Nabeul', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3307, 214, 'Sfax', 'SF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3308, 214, 'Sidi', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3309, 214, 'Siliana', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3310, 214, 'Sousse', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3311, 214, 'Tataouine', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3312, 214, 'Tozeur', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3313, 214, 'Tunis', 'TU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3314, 214, 'Zaghouan', 'ZA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3315, 215, 'Adana', 'ADA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3316, 215, 'Adıyaman', 'ADI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3317, 215, 'Afyonkarahisar', 'AFY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3318, 215, 'Ağrı', 'AGR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3319, 215, 'Aksaray', 'AKS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3320, 215, 'Amasya', 'AMA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3321, 215, 'Ankara', 'ANK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3322, 215, 'Antalya', 'ANT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3323, 215, 'Ardahan', 'ARD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3324, 215, 'Artvin', 'ART', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3325, 215, 'Aydın', 'AYI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3326, 215, 'Balıkesir', 'BAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3327, 215, 'Bartın', 'BAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3328, 215, 'Batman', 'BAT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3329, 215, 'Bayburt', 'BAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3330, 215, 'Bilecik', 'BIL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3331, 215, 'Bingöl', 'BIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3332, 215, 'Bitlis', 'BIT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3333, 215, 'Bolu', 'BOL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3334, 215, 'Burdur', 'BRD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3335, 215, 'Bursa', 'BRS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3336, 215, 'Çanakkale', 'CKL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3337, 215, 'Çankırı', 'CKR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3338, 215, 'Çorum', 'COR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3339, 215, 'Denizli', 'DEN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3340, 215, 'Diyarbakır', 'DIY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3341, 215, 'Düzce', 'DUZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3342, 215, 'Edirne', 'EDI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3343, 215, 'Elazığ', 'ELA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3344, 215, 'Erzincan', 'EZC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3345, 215, 'Erzurum', 'EZR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3346, 215, 'Eskişehir', 'ESK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3347, 215, 'Gaziantep', 'GAZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3348, 215, 'Giresun', 'GIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3349, 215, 'Gümüşhane', 'GMS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3350, 215, 'Hakkari', 'HKR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3351, 215, 'Hatay', 'HTY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3352, 215, 'Iğdır', 'IGD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3353, 215, 'Isparta', 'ISP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3354, 215, 'İstanbul', 'IST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3355, 215, 'İzmir', 'IZM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3356, 215, 'Kahramanmaraş', 'KAH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3357, 215, 'Karabük', 'KRB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3358, 215, 'Karaman', 'KRM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3359, 215, 'Kars', 'KRS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3360, 215, 'Kastamonu', 'KAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3361, 215, 'Kayseri', 'KAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3362, 215, 'Kilis', 'KLS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3363, 215, 'Kırıkkale', 'KRK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3364, 215, 'Kırklareli', 'KLR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3365, 215, 'Kırşehir', 'KRH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3366, 215, 'Kocaeli', 'KOC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3367, 215, 'Konya', 'KON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3368, 215, 'Kütahya', 'KUT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3369, 215, 'Malatya', 'MAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3370, 215, 'Manisa', 'MAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3371, 215, 'Mardin', 'MAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3372, 215, 'Mersin', 'MER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3373, 215, 'Muğla', 'MUG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3374, 215, 'Muş', 'MUS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3375, 215, 'Nevşehir', 'NEV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3376, 215, 'Niğde', 'NIG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3377, 215, 'Ordu', 'ORD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3378, 215, 'Osmaniye', 'OSM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3379, 215, 'Rize', 'RIZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3380, 215, 'Sakarya', 'SAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3381, 215, 'Samsun', 'SAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3382, 215, 'Şanlıurfa', 'SAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3383, 215, 'Siirt', 'SII', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3384, 215, 'Sinop', 'SIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3385, 215, 'Şırnak', 'SIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3386, 215, 'Sivas', 'SIV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3387, 215, 'Tekirdağ', 'TEL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3388, 215, 'Tokat', 'TOK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3389, 215, 'Trabzon', 'TRA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3390, 215, 'Tunceli', 'TUN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3391, 215, 'Uşak', 'USK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3392, 215, 'Van', 'VAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3393, 215, 'Yalova', 'YAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3394, 215, 'Yozgat', 'YOZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3395, 215, 'Zonguldak', 'ZON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3396, 216, 'Ahal Welayaty', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3397, 216, 'Balkan Welayaty', 'B', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3398, 216, 'Dashhowuz Welayaty', 'D', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3399, 216, 'Lebap Welayaty', 'L', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3400, 216, 'Mary Welayaty', 'M', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3401, 217, 'Ambergris Cays', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3402, 217, 'Dellis Cay', 'DC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3403, 217, 'French Cay', 'FC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3404, 217, 'Little Water Cay', 'LW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3405, 217, 'Parrot Cay', 'RC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3406, 217, 'Pine Cay', 'PN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3407, 217, 'Salt Cay', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3408, 217, 'Grand Turk', 'GT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3409, 217, 'South Caicos', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3410, 217, 'East Caicos', 'EC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3411, 217, 'Middle Caicos', 'MC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3412, 217, 'North Caicos', 'NC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3413, 217, 'Providenciales', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3414, 217, 'West Caicos', 'WC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3415, 218, 'Nanumanga', 'NMG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3416, 218, 'Niulakita', 'NLK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3417, 218, 'Niutao', 'NTO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3418, 218, 'Funafuti', 'FUN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3419, 218, 'Nanumea', 'NME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3420, 218, 'Nui', 'NUI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3421, 218, 'Nukufetau', 'NFT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3422, 218, 'Nukulaelae', 'NLL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3423, 218, 'Vaitupu', 'VAI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3424, 219, 'Kalangala', 'KAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3425, 219, 'Kampala', 'KMP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3426, 219, 'Kayunga', 'KAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3427, 219, 'Kiboga', 'KIB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3428, 219, 'Luwero', 'LUW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3429, 219, 'Masaka', 'MAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3430, 219, 'Mpigi', 'MPI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3431, 219, 'Mubende', 'MUB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3432, 219, 'Mukono', 'MUK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3433, 219, 'Nakasongola', 'NKS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3434, 219, 'Rakai', 'RAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3435, 219, 'Sembabule', 'SEM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3436, 219, 'Wakiso', 'WAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3437, 219, 'Bugiri', 'BUG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3438, 219, 'Busia', 'BUS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3439, 219, 'Iganga', 'IGA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3440, 219, 'Jinja', 'JIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3441, 219, 'Kaberamaido', 'KAB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3442, 219, 'Kamuli', 'KML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3443, 219, 'Kapchorwa', 'KPC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3444, 219, 'Katakwi', 'KTK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3445, 219, 'Kumi', 'KUM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3446, 219, 'Mayuge', 'MAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3447, 219, 'Mbale', 'MBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3448, 219, 'Pallisa', 'PAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3449, 219, 'Sironko', 'SIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3450, 219, 'Soroti', 'SOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3451, 219, 'Tororo', 'TOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3452, 219, 'Adjumani', 'ADJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3453, 219, 'Apac', 'APC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3454, 219, 'Arua', 'ARU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3455, 219, 'Gulu', 'GUL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3456, 219, 'Kitgum', 'KIT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3457, 219, 'Kotido', 'KOT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3458, 219, 'Lira', 'LIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3459, 219, 'Moroto', 'MRT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3460, 219, 'Moyo', 'MOY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3461, 219, 'Nakapiripirit', 'NAK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3462, 219, 'Nebbi', 'NEB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3463, 219, 'Pader', 'PAD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3464, 219, 'Yumbe', 'YUM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3465, 219, 'Bundibugyo', 'BUN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3466, 219, 'Bushenyi', 'BSH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3467, 219, 'Hoima', 'HOI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3468, 219, 'Kabale', 'KBL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3469, 219, 'Kabarole', 'KAR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3470, 219, 'Kamwenge', 'KAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3471, 219, 'Kanungu', 'KAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3472, 219, 'Kasese', 'KAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3473, 219, 'Kibaale', 'KBA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3474, 219, 'Kisoro', 'KIS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3475, 219, 'Kyenjojo', 'KYE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3476, 219, 'Masindi', 'MSN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3477, 219, 'Mbarara', 'MBR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3478, 219, 'Ntungamo', 'NTU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3479, 219, 'Rukungiri', 'RUK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3480, 220, 'Cherkas\'ka Oblast\'', '71', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3481, 220, 'Chernihivs\'ka Oblast\'', '74', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3482, 220, 'Chernivets\'ka Oblast\'', '77', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3483, 220, 'Crimea', '43', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3484, 220, 'Dnipropetrovs\'ka Oblast\'', '12', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3485, 220, 'Donets\'ka Oblast\'', '14', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3486, 220, 'Ivano-Frankivs\'ka Oblast\'', '26', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3487, 220, 'Khersons\'ka Oblast\'', '65', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3488, 220, 'Khmel\'nyts\'ka Oblast\'', '68', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3489, 220, 'Kirovohrads\'ka Oblast\'', '35', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3490, 220, 'Kyiv', '30', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3491, 220, 'Kyivs\'ka Oblast\'', '32', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3492, 220, 'Luhans\'ka Oblast\'', '09', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3493, 220, 'L\'vivs\'ka Oblast\'', '46', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3494, 220, 'Mykolayivs\'ka Oblast\'', '48', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3495, 220, 'Odes\'ka Oblast\'', '51', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3496, 220, 'Poltavs\'ka Oblast\'', '53', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3497, 220, 'Rivnens\'ka Oblast\'', '56', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3498, 220, 'Sevastopol\'', '40', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3499, 220, 'Sums\'ka Oblast\'', '59', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3500, 220, 'Ternopil\'s\'ka Oblast\'', '61', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3501, 220, 'Vinnyts\'ka Oblast\'', '05', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3502, 220, 'Volyns\'ka Oblast\'', '07', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3503, 220, 'Zakarpats\'ka Oblast\'', '21', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3504, 220, 'Zaporiz\'ka Oblast\'', '23', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3505, 220, 'Zhytomyrs\'ka oblast\'', '18', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3506, 221, 'Abu Dhabi', 'ADH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3507, 221, '\'Ajman', 'AJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3508, 221, 'Al Fujayrah', 'FU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3509, 221, 'Ash Shariqah', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3510, 221, 'Dubai', 'DU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3511, 221, 'R\'as al Khaymah', 'RK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3512, 221, 'Umm al Qaywayn', 'UQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3513, 222, 'Aberdeen', 'ABN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3514, 222, 'Aberdeenshire', 'ABNS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3515, 222, 'Anglesey', 'ANG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3516, 222, 'Angus', 'AGS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3517, 222, 'Argyll and Bute', 'ARY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3518, 222, 'Bedfordshire', 'BEDS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3519, 222, 'Berkshire', 'BERKS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3520, 222, 'Blaenau Gwent', 'BLA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3521, 222, 'Bridgend', 'BRI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3522, 222, 'Bristol', 'BSTL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3523, 222, 'Buckinghamshire', 'BUCKS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3524, 222, 'Caerphilly', 'CAE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3525, 222, 'Cambridgeshire', 'CAMBS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3526, 222, 'Cardiff', 'CDF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3527, 222, 'Carmarthenshire', 'CARM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3528, 222, 'Ceredigion', 'CDGN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3529, 222, 'Cheshire', 'CHES', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3530, 222, 'Clackmannanshire', 'CLACK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3531, 222, 'Conwy', 'CON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3532, 222, 'Cornwall', 'CORN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3533, 222, 'Denbighshire', 'DNBG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3534, 222, 'Derbyshire', 'DERBY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3535, 222, 'Devon', 'DVN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3536, 222, 'Dorset', 'DOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3537, 222, 'Dumfries and Galloway', 'DGL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3538, 222, 'Dundee', 'DUND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3539, 222, 'Durham', 'DHM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3540, 222, 'East Ayrshire', 'ARYE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3541, 222, 'East Dunbartonshire', 'DUNBE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3542, 222, 'East Lothian', 'LOTE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3543, 222, 'East Renfrewshire', 'RENE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3544, 222, 'East Riding of Yorkshire', 'ERYS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3545, 222, 'East Sussex', 'SXE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3546, 222, 'Edinburgh', 'EDIN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3547, 222, 'Essex', 'ESX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3548, 222, 'Falkirk', 'FALK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3549, 222, 'Fife', 'FFE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3550, 222, 'Flintshire', 'FLINT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3551, 222, 'Glasgow', 'GLAS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3552, 222, 'Gloucestershire', 'GLOS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3553, 222, 'Greater London', 'LDN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3554, 222, 'Greater Manchester', 'MCH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3555, 222, 'Gwynedd', 'GDD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3556, 222, 'Hampshire', 'HANTS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3557, 222, 'Herefordshire', 'HWR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3558, 222, 'Hertfordshire', 'HERTS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3559, 222, 'Highlands', 'HLD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3560, 222, 'Inverclyde', 'IVER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3561, 222, 'Isle of Wight', 'IOW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3562, 222, 'Kent', 'KNT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3563, 222, 'Lancashire', 'LANCS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3564, 222, 'Leicestershire', 'LEICS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3565, 222, 'Lincolnshire', 'LINCS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3566, 222, 'Merseyside', 'MSY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3567, 222, 'Merthyr Tydfil', 'MERT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3568, 222, 'Midlothian', 'MLOT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3569, 222, 'Monmouthshire', 'MMOUTH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3570, 222, 'Moray', 'MORAY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3571, 222, 'Neath Port Talbot', 'NPRTAL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3572, 222, 'Newport', 'NEWPT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3573, 222, 'Norfolk', 'NOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3574, 222, 'North Ayrshire', 'ARYN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3575, 222, 'North Lanarkshire', 'LANN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3576, 222, 'North Yorkshire', 'YSN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3577, 222, 'Northamptonshire', 'NHM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3578, 222, 'Northumberland', 'NLD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3579, 222, 'Nottinghamshire', 'NOT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3580, 222, 'Orkney Islands', 'ORK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3581, 222, 'Oxfordshire', 'OFE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3582, 222, 'Pembrokeshire', 'PEM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3583, 222, 'Perth and Kinross', 'PERTH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3584, 222, 'Powys', 'PWS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3585, 222, 'Renfrewshire', 'REN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3586, 222, 'Rhondda Cynon Taff', 'RHON', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3587, 222, 'Rutland', 'RUT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3588, 222, 'Scottish Borders', 'BOR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3589, 222, 'Shetland Islands', 'SHET', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3590, 222, 'Shropshire', 'SPE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3591, 222, 'Somerset', 'SOM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3592, 222, 'South Ayrshire', 'ARYS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3593, 222, 'South Lanarkshire', 'LANS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3594, 222, 'South Yorkshire', 'YSS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3595, 222, 'Staffordshire', 'SFD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3596, 222, 'Stirling', 'STIR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3597, 222, 'Suffolk', 'SFK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3598, 222, 'Surrey', 'SRY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3599, 222, 'Swansea', 'SWAN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3600, 222, 'Torfaen', 'TORF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3601, 222, 'Tyne and Wear', 'TWR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3602, 222, 'Vale of Glamorgan', 'VGLAM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3603, 222, 'Warwickshire', 'WARKS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3604, 222, 'West Dunbartonshire', 'WDUN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3605, 222, 'West Lothian', 'WLOT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3606, 222, 'West Midlands', 'WMD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3607, 222, 'West Sussex', 'SXW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3608, 222, 'West Yorkshire', 'YSW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3609, 222, 'Western Isles', 'WIL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3610, 222, 'Wiltshire', 'WLT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3611, 222, 'Worcestershire', 'WORCS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3612, 222, 'Wrexham', 'WRX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3613, 223, 'Alabama', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3614, 223, 'Alaska', 'AK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3615, 223, 'American Samoa', 'AS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3616, 223, 'Arizona', 'AZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3617, 223, 'Arkansas', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3618, 223, 'Armed Forces Africa', 'AF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3619, 223, 'Armed Forces Americas', 'AA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3620, 223, 'Armed Forces Canada', 'AC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3621, 223, 'Armed Forces Europe', 'AE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3622, 223, 'Armed Forces Middle East', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3623, 223, 'Armed Forces Pacific', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3624, 223, 'California', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3625, 223, 'Colorado', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3626, 223, 'Connecticut', 'CT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3627, 223, 'Delaware', 'DE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3628, 223, 'District of Columbia', 'DC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3629, 223, 'Federated States Of Micronesia', 'FM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3630, 223, 'Florida', 'FL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3631, 223, 'Georgia', 'GA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3632, 223, 'Guam', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3633, 223, 'Hawaii', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3634, 223, 'Idaho', 'ID', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3635, 223, 'Illinois', 'IL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3636, 223, 'Indiana', 'IN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3637, 223, 'Iowa', 'IA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3638, 223, 'Kansas', 'KS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3639, 223, 'Kentucky', 'KY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3640, 223, 'Louisiana', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3641, 223, 'Maine', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3642, 223, 'Marshall Islands', 'MH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3643, 223, 'Maryland', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3644, 223, 'Massachusetts', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3645, 223, 'Michigan', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3646, 223, 'Minnesota', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3647, 223, 'Mississippi', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3648, 223, 'Missouri', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3649, 223, 'Montana', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3650, 223, 'Nebraska', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3651, 223, 'Nevada', 'NV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3652, 223, 'New Hampshire', 'NH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3653, 223, 'New Jersey', 'NJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3654, 223, 'New Mexico', 'NM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3655, 223, 'New York', 'NY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3656, 223, 'North Carolina', 'NC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3657, 223, 'North Dakota', 'ND', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3658, 223, 'Northern Mariana Islands', 'MP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3659, 223, 'Ohio', 'OH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3660, 223, 'Oklahoma', 'OK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3661, 223, 'Oregon', 'OR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3662, 223, 'Palau', 'PW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3663, 223, 'Pennsylvania', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3664, 223, 'Puerto Rico', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3665, 223, 'Rhode Island', 'RI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3666, 223, 'South Carolina', 'SC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3667, 223, 'South Dakota', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3668, 223, 'Tennessee', 'TN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3669, 223, 'Texas', 'TX', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3670, 223, 'Utah', 'UT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3671, 223, 'Vermont', 'VT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3672, 223, 'Virgin Islands', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3673, 223, 'Virginia', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3674, 223, 'Washington', 'WA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3675, 223, 'West Virginia', 'WV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3676, 223, 'Wisconsin', 'WI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3677, 223, 'Wyoming', 'WY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3678, 224, 'Baker Island', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3679, 224, 'Howland Island', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3680, 224, 'Jarvis Island', 'JI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3681, 224, 'Johnston Atoll', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3682, 224, 'Kingman Reef', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3683, 224, 'Midway Atoll', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3684, 224, 'Navassa Island', 'NI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3685, 224, 'Palmyra Atoll', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3686, 224, 'Wake Island', 'WI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3687, 225, 'Artigas', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3688, 225, 'Canelones', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3689, 225, 'Cerro Largo', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3690, 225, 'Colonia', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3691, 225, 'Durazno', 'DU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3692, 225, 'Flores', 'FS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3693, 225, 'Florida', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3694, 225, 'Lavalleja', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3695, 225, 'Maldonado', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3696, 225, 'Montevideo', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3697, 225, 'Paysandu', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3698, 225, 'Rio Negro', 'RN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3699, 225, 'Rivera', 'RV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3700, 225, 'Rocha', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3701, 225, 'Salto', 'SL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3702, 225, 'San Jose', 'SJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3703, 225, 'Soriano', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3704, 225, 'Tacuarembo', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3705, 225, 'Treinta y Tres', 'TT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3706, 226, 'Andijon', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3707, 226, 'Buxoro', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3708, 226, 'Farg\'ona', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3709, 226, 'Jizzax', 'JI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3710, 226, 'Namangan', 'NG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3711, 226, 'Navoiy', 'NW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3712, 226, 'Qashqadaryo', 'QA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3714, 226, 'Samarqand', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3715, 226, 'Sirdaryo', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3716, 226, 'Surxondaryo', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3717, 226, 'Toshkent City', 'TK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3718, 226, 'Toshkent Region', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3719, 226, 'Xorazm', 'XO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3720, 227, 'Malampa', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3721, 227, 'Penama', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3722, 227, 'Sanma', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3723, 227, 'Shefa', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3724, 227, 'Tafea', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3725, 227, 'Torba', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3726, 229, 'Amazonas', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3727, 229, 'Anzoategui', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3728, 229, 'Apure', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3729, 229, 'Aragua', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3730, 229, 'Barinas', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3731, 229, 'Bolivar', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3732, 229, 'Carabobo', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3733, 229, 'Cojedes', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3734, 229, 'Delta Amacuro', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3735, 229, 'Dependencias Federales', 'DF', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3736, 229, 'Distrito Federal', 'DI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3737, 229, 'Falcon', 'FA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3738, 229, 'Guarico', 'GU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3739, 229, 'Lara', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3740, 229, 'Merida', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3741, 229, 'Miranda', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3742, 229, 'Monagas', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3743, 229, 'Nueva Esparta', 'NE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3744, 229, 'Portuguesa', 'PO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3745, 229, 'Sucre', 'SU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3746, 229, 'Tachira', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3747, 229, 'Trujillo', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3748, 229, 'Vargas', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3749, 229, 'Yaracuy', 'YA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3750, 229, 'Zulia', 'ZU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3751, 230, 'An Giang', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3752, 230, 'Bac Giang', 'BG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3753, 230, 'Bac Kan', 'BK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3754, 230, 'Bac Lieu', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3755, 230, 'Bac Ninh', 'BC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3756, 230, 'Ba Ria-Vung Tau', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3757, 230, 'Ben Tre', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3758, 230, 'Binh Dinh', 'BH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3759, 230, 'Binh Duong', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3760, 230, 'Binh Phuoc', 'BP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3761, 230, 'Binh Thuan', 'BT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3762, 230, 'Ca Mau', 'CM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3763, 230, 'Can Tho', 'CT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3764, 230, 'Cao Bang', 'CB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3765, 230, 'Dak Lak', 'DL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3766, 230, 'Dak Nong', 'DG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3767, 230, 'Da Nang', 'DN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3768, 230, 'Dien Bien', 'DB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3769, 230, 'Dong Nai', 'DI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3770, 230, 'Dong Thap', 'DT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3771, 230, 'Gia Lai', 'GL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3772, 230, 'Ha Giang', 'HG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3773, 230, 'Hai Duong', 'HD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3774, 230, 'Hai Phong', 'HP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3775, 230, 'Ha Nam', 'HM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3776, 230, 'Ha Noi', 'HI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3777, 230, 'Ha Tay', 'HT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3778, 230, 'Ha Tinh', 'HH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3779, 230, 'Hoa Binh', 'HB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3780, 230, 'Ho Chi Minh City', 'HC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3781, 230, 'Hau Giang', 'HU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3782, 230, 'Hung Yen', 'HY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3783, 232, 'Saint Croix', 'C', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3784, 232, 'Saint John', 'J', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3785, 232, 'Saint Thomas', 'T', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3786, 233, 'Alo', 'A', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3787, 233, 'Sigave', 'S', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3788, 233, 'Wallis', 'W', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3789, 235, 'Abyan', 'AB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3790, 235, 'Adan', 'AD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3791, 235, 'Amran', 'AM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3792, 235, 'Al Bayda', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3793, 235, 'Ad Dali', 'DA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3794, 235, 'Dhamar', 'DH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3795, 235, 'Hadramawt', 'HD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3796, 235, 'Hajjah', 'HJ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3797, 235, 'Al Hudaydah', 'HU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3798, 235, 'Ibb', 'IB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3799, 235, 'Al Jawf', 'JA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3800, 235, 'Lahij', 'LA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3801, 235, 'Ma\'rib', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3802, 235, 'Al Mahrah', 'MR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3803, 235, 'Al Mahwit', 'MW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3804, 235, 'Sa\'dah', 'SD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3805, 235, 'San\'a', 'SN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3806, 235, 'Shabwah', 'SH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3807, 235, 'Ta\'izz', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3812, 237, 'Bas-Congo', 'BC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3813, 237, 'Bandundu', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3814, 237, 'Equateur', 'EQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3815, 237, 'Katanga', 'KA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3816, 237, 'Kasai-Oriental', 'KE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3817, 237, 'Kinshasa', 'KN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3818, 237, 'Kasai-Occidental', 'KW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3819, 237, 'Maniema', 'MA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3820, 237, 'Nord-Kivu', 'NK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3821, 237, 'Orientale', 'OR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3822, 237, 'Sud-Kivu', 'SK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3823, 238, 'Central', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3824, 238, 'Copperbelt', 'CB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3825, 238, 'Eastern', 'EA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3826, 238, 'Luapula', 'LP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3827, 238, 'Lusaka', 'LK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3828, 238, 'Northern', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3829, 238, 'North-Western', 'NW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3830, 238, 'Southern', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3831, 238, 'Western', 'WE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3832, 239, 'Bulawayo', 'BU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3833, 239, 'Harare', 'HA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3834, 239, 'Manicaland', 'ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3835, 239, 'Mashonaland Central', 'MC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3836, 239, 'Mashonaland East', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3837, 239, 'Mashonaland West', 'MW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3838, 239, 'Masvingo', 'MV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3839, 239, 'Matabeleland North', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3840, 239, 'Matabeleland South', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3841, 239, 'Midlands', 'MD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3842, 105, 'Agrigento', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3843, 105, 'Alessandria', 'AL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3844, 105, 'Ancona', 'AN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3845, 105, 'Aosta', 'AO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3846, 105, 'Arezzo', 'AR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3847, 105, 'Ascoli Piceno', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3848, 105, 'Asti', 'AT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3849, 105, 'Avellino', 'AV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3850, 105, 'Bari', 'BA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3851, 105, 'Belluno', 'BL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3852, 105, 'Benevento', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3853, 105, 'Bergamo', 'BG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3854, 105, 'Biella', 'BI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3855, 105, 'Bologna', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3856, 105, 'Bolzano', 'BZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3857, 105, 'Brescia', 'BS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3858, 105, 'Brindisi', 'BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3859, 105, 'Cagliari', 'CA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3860, 105, 'Caltanissetta', 'CL', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3861, 105, 'Campobasso', 'CB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3863, 105, 'Caserta', 'CE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3864, 105, 'Catania', 'CT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3865, 105, 'Catanzaro', 'CZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3866, 105, 'Chieti', 'CH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3867, 105, 'Como', 'CO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3868, 105, 'Cosenza', 'CS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3869, 105, 'Cremona', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3870, 105, 'Crotone', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3871, 105, 'Cuneo', 'CN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3872, 105, 'Enna', 'EN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3873, 105, 'Ferrara', 'FE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3874, 105, 'Firenze', 'FI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3875, 105, 'Foggia', 'FG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3876, 105, 'Forli-Cesena', 'FC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3877, 105, 'Frosinone', 'FR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3878, 105, 'Genova', 'GE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3879, 105, 'Gorizia', 'GO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3880, 105, 'Grosseto', 'GR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3881, 105, 'Imperia', 'IM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3882, 105, 'Isernia', 'IS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3883, 105, 'L&#39;Aquila', 'AQ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3884, 105, 'La Spezia', 'SP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3885, 105, 'Latina', 'LT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3886, 105, 'Lecce', 'LE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3887, 105, 'Lecco', 'LC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3888, 105, 'Livorno', 'LI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3889, 105, 'Lodi', 'LO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3890, 105, 'Lucca', 'LU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3891, 105, 'Macerata', 'MC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3892, 105, 'Mantova', 'MN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3893, 105, 'Massa-Carrara', 'MS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3894, 105, 'Matera', 'MT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3896, 105, 'Messina', 'ME', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3897, 105, 'Milano', 'MI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3898, 105, 'Modena', 'MO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3899, 105, 'Napoli', 'NA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3900, 105, 'Novara', 'NO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3901, 105, 'Nuoro', 'NU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3904, 105, 'Oristano', 'OR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3905, 105, 'Padova', 'PD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3906, 105, 'Palermo', 'PA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3907, 105, 'Parma', 'PR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3908, 105, 'Pavia', 'PV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3909, 105, 'Perugia', 'PG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3910, 105, 'Pesaro e Urbino', 'PU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3911, 105, 'Pescara', 'PE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3912, 105, 'Piacenza', 'PC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3913, 105, 'Pisa', 'PI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3914, 105, 'Pistoia', 'PT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3915, 105, 'Pordenone', 'PN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3916, 105, 'Potenza', 'PZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3917, 105, 'Prato', 'PO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3918, 105, 'Ragusa', 'RG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3919, 105, 'Ravenna', 'RA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3920, 105, 'Reggio Calabria', 'RC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3921, 105, 'Reggio Emilia', 'RE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3922, 105, 'Rieti', 'RI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3923, 105, 'Rimini', 'RN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3924, 105, 'Roma', 'RM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3925, 105, 'Rovigo', 'RO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3926, 105, 'Salerno', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3927, 105, 'Sassari', 'SS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3928, 105, 'Savona', 'SV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3929, 105, 'Siena', 'SI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3930, 105, 'Siracusa', 'SR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3931, 105, 'Sondrio', 'SO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3932, 105, 'Taranto', 'TA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3933, 105, 'Teramo', 'TE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3934, 105, 'Terni', 'TR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3935, 105, 'Torino', 'TO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3936, 105, 'Trapani', 'TP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3937, 105, 'Trento', 'TN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3938, 105, 'Treviso', 'TV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3939, 105, 'Trieste', 'TS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3940, 105, 'Udine', 'UD', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3941, 105, 'Varese', 'VA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3942, 105, 'Venezia', 'VE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3943, 105, 'Verbano-Cusio-Ossola', 'VB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3944, 105, 'Vercelli', 'VC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3945, 105, 'Verona', 'VR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3946, 105, 'Vibo Valentia', 'VV', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3947, 105, 'Vicenza', 'VI', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3948, 105, 'Viterbo', 'VT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3949, 222, 'County Antrim', 'ANT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3950, 222, 'County Armagh', 'ARM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3951, 222, 'County Down', 'DOW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3952, 222, 'County Fermanagh', 'FER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3953, 222, 'County Londonderry', 'LDY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3954, 222, 'County Tyrone', 'TYR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3955, 222, 'Cumbria', 'CMA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3956, 190, 'Pomurska', '1', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3957, 190, 'Podravska', '2', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3958, 190, 'Koroška', '3', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3959, 190, 'Savinjska', '4', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3960, 190, 'Zasavska', '5', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3961, 190, 'Spodnjeposavska', '6', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3962, 190, 'Jugovzhodna Slovenija', '7', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3963, 190, 'Osrednjeslovenska', '8', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3964, 190, 'Gorenjska', '9', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3965, 190, 'Notranjsko-kraška', '10', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3966, 190, 'Goriška', '11', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3967, 190, 'Obalno-kraška', '12', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3968, 33, 'Ruse', '', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3969, 101, 'Alborz', 'ALB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3970, 21, 'Brussels-Capital Region', 'BRU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3971, 138, 'Aguascalientes', 'AG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3973, 242, 'Andrijevica', '01', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3974, 242, 'Bar', '02', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3975, 242, 'Berane', '03', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3976, 242, 'Bijelo Polje', '04', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3977, 242, 'Budva', '05', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3978, 242, 'Cetinje', '06', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3979, 242, 'Danilovgrad', '07', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3980, 242, 'Herceg-Novi', '08', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3981, 242, 'Kolašin', '09', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3982, 242, 'Kotor', '10', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3983, 242, 'Mojkovac', '11', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3984, 242, 'Nikšić', '12', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3985, 242, 'Plav', '13', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3986, 242, 'Pljevlja', '14', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3987, 242, 'Plužine', '15', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3988, 242, 'Podgorica', '16', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3989, 242, 'Rožaje', '17', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3990, 242, 'Šavnik', '18', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3991, 242, 'Tivat', '19', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3992, 242, 'Ulcinj', '20', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3993, 242, 'Žabljak', '21', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3994, 243, 'Belgrade', '00', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3995, 243, 'North Bačka', '01', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3996, 243, 'Central Banat', '02', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3997, 243, 'North Banat', '03', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3998, 243, 'South Banat', '04', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (3999, 243, 'West Bačka', '05', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4000, 243, 'South Bačka', '06', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4001, 243, 'Srem', '07', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4002, 243, 'Mačva', '08', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4003, 243, 'Kolubara', '09', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4004, 243, 'Podunavlje', '10', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4005, 243, 'Braničevo', '11', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4006, 243, 'Šumadija', '12', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4007, 243, 'Pomoravlje', '13', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4008, 243, 'Bor', '14', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4009, 243, 'Zaječar', '15', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4010, 243, 'Zlatibor', '16', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4011, 243, 'Moravica', '17', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4012, 243, 'Raška', '18', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4013, 243, 'Rasina', '19', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4014, 243, 'Nišava', '20', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4015, 243, 'Toplica', '21', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4016, 243, 'Pirot', '22', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4017, 243, 'Jablanica', '23', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4018, 243, 'Pčinja', '24', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4020, 245, 'Bonaire', 'BO', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4021, 245, 'Saba', 'SA', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4022, 245, 'Sint Eustatius', 'SE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4023, 248, 'Central Equatoria', 'EC', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4024, 248, 'Eastern Equatoria', 'EE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4025, 248, 'Jonglei', 'JG', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4026, 248, 'Lakes', 'LK', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4027, 248, 'Northern Bahr el-Ghazal', 'BN', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4028, 248, 'Unity', 'UY', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4029, 248, 'Upper Nile', 'NU', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4030, 248, 'Warrap', 'WR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4031, 248, 'Western Bahr el-Ghazal', 'BW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4032, 248, 'Western Equatoria', 'EW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4035, 129, 'Putrajaya', 'MY-16', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4038, 117, 'Aizkraukles novads', '0320200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4039, 117, 'Aizpute, Aizputes novads', '0640605', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4040, 117, 'Aizputes novads', '0640600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4041, 117, 'Aknīste, Aknīstes novads', '0560805', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4042, 117, 'Aknīstes novads', '0560800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4043, 117, 'Aloja, Alojas novads', '0661007', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4044, 117, 'Alojas novads', '0661000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4045, 117, 'Alsungas novads', '0624200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4046, 117, 'Alūksne, Alūksnes novads', '0360201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4047, 117, 'Alūksnes novads', '0360200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4048, 117, 'Amatas novads', '0424701', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4049, 117, 'Ape, Apes novads', '0360805', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4050, 117, 'Apes novads', '0360800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4051, 117, 'Auce, Auces novads', '0460805', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4052, 117, 'Auces novads', '0460800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4053, 117, 'Ādažu novads', '0804400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4054, 117, 'Babītes novads', '0804900', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4055, 117, 'Baldone, Baldones novads', '0800605', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4056, 117, 'Baldones novads', '0800600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4057, 117, 'Baloži, Ķekavas novads', '0800807', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4058, 117, 'Baltinavas novads', '0384400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4059, 117, 'Balvi, Balvu novads', '0380201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4060, 117, 'Balvu novads', '0380200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4061, 117, 'Bauska, Bauskas novads', '0400201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4062, 117, 'Bauskas novads', '0400200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4063, 117, 'Beverīnas novads', '0964700', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4064, 117, 'Brocēni, Brocēnu novads', '0840605', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4065, 117, 'Brocēnu novads', '0840601', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4066, 117, 'Burtnieku novads', '0967101', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4067, 117, 'Carnikavas novads', '0805200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4069, 117, 'Cesvaines novads', '0700800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4070, 117, 'Cēsis, Cēsu novads', '0420201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4071, 117, 'Cēsu novads', '0420200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4072, 117, 'Ciblas novads', '0684901', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4073, 117, 'Dagda, Dagdas novads', '0601009', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4074, 117, 'Dagdas novads', '0601000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4075, 117, 'Daugavpils', '0050000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4076, 117, 'Daugavpils novads', '0440200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4077, 117, 'Dobele, Dobeles novads', '0460201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4078, 117, 'Dobeles novads', '0460200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4079, 117, 'Dundagas novads', '0885100', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4080, 117, 'Durbe, Durbes novads', '0640807', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4081, 117, 'Durbes novads', '0640801', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4082, 117, 'Engures novads', '0905100', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4083, 117, 'Ērgļu novads', '0705500', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4084, 117, 'Garkalnes novads', '0806000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4086, 117, 'Grobiņas novads', '0641000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4087, 117, 'Gulbene, Gulbenes novads', '0500201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4088, 117, 'Gulbenes novads', '0500200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4089, 117, 'Iecavas novads', '0406400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4091, 117, 'Ikšķiles novads', '0740600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4093, 117, 'Ilūkstes novads', '0440801', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4094, 117, 'Inčukalna novads', '0801800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4096, 117, 'Jaunjelgavas novads', '0321000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4097, 117, 'Jaunpiebalgas novads', '0425700', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4098, 117, 'Jaunpils novads', '0905700', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4099, 117, 'Jelgava', '0090000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4100, 117, 'Jelgavas novads', '0540200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4101, 117, 'Jēkabpils', '0110000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4102, 117, 'Jēkabpils novads', '0560200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4103, 117, 'Jūrmala', '0130000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4105, 117, 'Kandava, Kandavas novads', '0901211', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4106, 117, 'Kandavas novads', '0901201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4107, 117, 'Kārsava, Kārsavas novads', '0681009', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4108, 117, 'Kārsavas novads', '0681000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4110, 117, 'Kokneses novads', '0326100', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4111, 117, 'Krāslava, Krāslavas novads', '0600201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4112, 117, 'Krāslavas novads', '0600202', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4113, 117, 'Krimuldas novads', '0806900', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4114, 117, 'Krustpils novads', '0566900', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4116, 117, 'Kuldīgas novads', '0620200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4117, 117, 'Ķeguma novads', '0741001', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4118, 117, 'Ķegums, Ķeguma novads', '0741009', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4119, 117, 'Ķekavas novads', '0800800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4121, 117, 'Lielvārdes novads', '0741401', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4122, 117, 'Liepāja', '0170000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4123, 117, 'Limbaži, Limbažu novads', '0660201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4124, 117, 'Limbažu novads', '0660200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4125, 117, 'Līgatne, Līgatnes novads', '0421211', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4126, 117, 'Līgatnes novads', '0421200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4127, 117, 'Līvāni, Līvānu novads', '0761211', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4128, 117, 'Līvānu novads', '0761201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4129, 117, 'Lubāna, Lubānas novads', '0701413', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4130, 117, 'Lubānas novads', '0701400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4131, 117, 'Ludza, Ludzas novads', '0680201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4132, 117, 'Ludzas novads', '0680200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4133, 117, 'Madona, Madonas novads', '0700201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4134, 117, 'Madonas novads', '0700200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4136, 117, 'Mazsalacas novads', '0961000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4137, 117, 'Mālpils novads', '0807400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4138, 117, 'Mārupes novads', '0807600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4139, 117, 'Mērsraga novads', '0887600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4140, 117, 'Naukšēnu novads', '0967300', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4141, 117, 'Neretas novads', '0327100', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4142, 117, 'Nīcas novads', '0647900', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4143, 117, 'Ogre, Ogres novads', '0740201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4144, 117, 'Ogres novads', '0740202', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4145, 117, 'Olaine, Olaines novads', '0801009', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4146, 117, 'Olaines novads', '0801000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4147, 117, 'Ozolnieku novads', '0546701', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4148, 117, 'Pārgaujas novads', '0427500', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4150, 117, 'Pāvilostas novads', '0641401', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4151, 117, 'Piltene, Ventspils novads', '0980213', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4153, 117, 'Pļaviņu novads', '0321400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4154, 117, 'Preiļi, Preiļu novads', '0760201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4155, 117, 'Preiļu novads', '0760202', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4156, 117, 'Priekule, Priekules novads', '0641615', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4157, 117, 'Priekules novads', '0641600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4158, 117, 'Priekuļu novads', '0427300', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4159, 117, 'Raunas novads', '0427700', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4160, 117, 'Rēzekne', '0210000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4161, 117, 'Rēzeknes novads', '0780200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4162, 117, 'Riebiņu novads', '0766300', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4163, 117, 'Rīga', '0010000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4164, 117, 'Rojas novads', '0888300', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4165, 117, 'Ropažu novads', '0808400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4166, 117, 'Rucavas novads', '0648500', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4167, 117, 'Rugāju novads', '0387500', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4168, 117, 'Rundāles novads', '0407700', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4170, 117, 'Rūjienas novads', '0961600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4171, 117, 'Sabile, Talsu novads', '0880213', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4173, 117, 'Salacgrīvas novads', '0661400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4174, 117, 'Salas novads', '0568700', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4175, 117, 'Salaspils novads', '0801200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4176, 117, 'Salaspils, Salaspils novads', '0801211', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4177, 117, 'Saldus novads', '0840200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4178, 117, 'Saldus, Saldus novads', '0840201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4180, 117, 'Saulkrastu novads', '0801400', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4181, 117, 'Seda, Strenču novads', '0941813', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4182, 117, 'Sējas novads', '0809200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4183, 117, 'Sigulda, Siguldas novads', '0801615', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4184, 117, 'Siguldas novads', '0801601', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4185, 117, 'Skrīveru novads', '0328200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4186, 117, 'Skrunda, Skrundas novads', '0621209', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4187, 117, 'Skrundas novads', '0621200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4188, 117, 'Smiltene, Smiltenes novads', '0941615', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4189, 117, 'Smiltenes novads', '0941600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4190, 117, 'Staicele, Alojas novads', '0661017', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4191, 117, 'Stende, Talsu novads', '0880215', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4192, 117, 'Stopiņu novads', '0809600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4193, 117, 'Strenči, Strenču novads', '0941817', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4194, 117, 'Strenču novads', '0941800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4195, 117, 'Subate, Ilūkstes novads', '0440815', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4196, 117, 'Talsi, Talsu novads', '0880201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4197, 117, 'Talsu novads', '0880200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4198, 117, 'Tērvetes novads', '0468900', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4199, 117, 'Tukuma novads', '0900200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4200, 117, 'Tukums, Tukuma novads', '0900201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4201, 117, 'Vaiņodes novads', '0649300', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4202, 117, 'Valdemārpils, Talsu novads', '0880217', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4203, 117, 'Valka, Valkas novads', '0940201', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4204, 117, 'Valkas novads', '0940200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4205, 117, 'Valmiera', '0250000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4206, 117, 'Vangaži, Inčukalna novads', '0801817', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4208, 117, 'Varakļānu novads', '0701800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4209, 117, 'Vārkavas novads', '0769101', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4210, 117, 'Vecpiebalgas novads', '0429300', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4211, 117, 'Vecumnieku novads', '0409500', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4212, 117, 'Ventspils', '0270000', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4213, 117, 'Ventspils novads', '0980200', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4214, 117, 'Viesīte, Viesītes novads', '0561815', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4215, 117, 'Viesītes novads', '0561800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4216, 117, 'Viļaka, Viļakas novads', '0381615', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4217, 117, 'Viļakas novads', '0381600', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4218, 117, 'Viļāni, Viļānu novads', '0781817', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4219, 117, 'Viļānu novads', '0781800', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4220, 117, 'Zilupe, Zilupes novads', '0681817', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4221, 117, 'Zilupes novads', '0681801', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4222, 43, 'Arica y Parinacota', 'AP', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4223, 43, 'Los Rios', 'LR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4224, 220, 'Kharkivs\'ka Oblast\'', '63', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4225, 118, 'Beirut', 'LB-BR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4226, 118, 'Bekaa', 'LB-BE', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4227, 118, 'Mount Lebanon', 'LB-ML', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4228, 118, 'Nabatieh', 'LB-NB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4229, 118, 'North', 'LB-NR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4230, 118, 'South', 'LB-ST', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4231, 99, 'Telangana', 'TS', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4232, 44, '青海省', 'QH', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4233, 100, 'Papua Barat', 'PB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4234, 100, 'Sulawesi Barat', 'SR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4235, 100, 'Kepulauan Riau', 'KR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4236, 105, 'Barletta-Andria-Trani', 'BT', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4237, 105, 'Fermo', 'FM', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4238, 105, 'Monza Brianza', 'MB', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4239, 44, '台湾省', 'TW', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4240, 44, '西藏自治区', 'XZ', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4241, 4, 'Los Angeles', 'LosAngeles', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4242, 188, 'Central Region', 'CR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4243, 188, 'East Region', 'ER', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4244, 188, 'West Region', 'WR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4245, 188, 'South Region', 'SR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
INSERT INTO `zones` VALUES (4246, 188, 'North Region', 'NR', 0, 1, '2024-08-03 23:23:36', '2024-08-03 23:23:36');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
