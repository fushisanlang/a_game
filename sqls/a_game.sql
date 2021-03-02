/*
 Navicat Premium Data Transfer

 Source Server         : 172.19.32.42
 Source Server Type    : MySQL
 Source Server Version : 50565
 Source Host           : 172.19.32.42:3306
 Source Schema         : a_game

 Target Server Type    : MySQL
 Target Server Version : 50565
 File Encoding         : 65001

 Date: 02/03/2021 16:42:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for arms
-- ----------------------------
DROP TABLE IF EXISTS `arms`;
CREATE TABLE `arms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物品id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物品名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物品描述',
  `buff_id_in_conf` int(11) NOT NULL COMMENT '物品加成在conf中的位置',
  `style_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '武器类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '武器' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of arms
-- ----------------------------
INSERT INTO `arms` VALUES (1, '入门法剑', '基础武器，小幅增加攻击力', 1, '');
INSERT INTO `arms` VALUES (2, '入门禅杖', '基础武器，小幅降低攻击力，小幅增加包记录', 2, '');

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '门派名',
  `info` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '门派简介',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of attribute
-- ----------------------------
INSERT INTO `attribute` VALUES (1, '金', '攻击');
INSERT INTO `attribute` VALUES (5, '木', '回血，聚气');
INSERT INTO `attribute` VALUES (6, '火', '暴击');
INSERT INTO `attribute` VALUES (7, '土', '防御');
INSERT INTO `attribute` VALUES (8, '水', '移速');

-- ----------------------------
-- Table structure for bag
-- ----------------------------
DROP TABLE IF EXISTS `bag`;
CREATE TABLE `bag`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `money` bigint(20) UNSIGNED ZEROFILL NOT NULL COMMENT '钱',
  `bag1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第一格',
  `bag2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第二格',
  `bag3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第三格',
  `bag4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第四格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of bag
-- ----------------------------
INSERT INTO `bag` VALUES (10, 00000000000000000000, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for buff
-- ----------------------------
DROP TABLE IF EXISTS `buff`;
CREATE TABLE `buff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'buff名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '描述',
  `attribute_id` int(11) NOT NULL COMMENT '作用属性',
  `sign` int(9) NOT NULL COMMENT '1 加 2减 3乘 4除',
  `value` decimal(10, 2) NOT NULL COMMENT '作用值',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buff
-- ----------------------------
INSERT INTO `buff` VALUES (1, '利', '小幅度增加攻击力', 0, 1, 15.00);
INSERT INTO `buff` VALUES (2, '钝', '小幅度减少攻击力', 0, 2, 15.00);
INSERT INTO `buff` VALUES (3, '重', '小幅度增加暴击', 0, 1, 0.05);
INSERT INTO `buff` VALUES (4, '心如止水', '降低攻击力', 0, 3, 0.70);

-- ----------------------------
-- Table structure for conf
-- ----------------------------
DROP TABLE IF EXISTS `conf`;
CREATE TABLE `conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `conf_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of conf
-- ----------------------------
INSERT INTO `conf` VALUES (1, 'world_id', '第一世');
INSERT INTO `conf` VALUES (2, '重', '[2]');

-- ----------------------------
-- Table structure for res
-- ----------------------------
DROP TABLE IF EXISTS `res`;
CREATE TABLE `res`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物品id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物品名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物品描述',
  `buff_id_1` int(11) NOT NULL COMMENT '物品加成1',
  `buff_id_2` int(11) NULL DEFAULT NULL COMMENT '物品加成2',
  `buff_id_3` int(11) NULL DEFAULT NULL COMMENT '物品加成3',
  `buff_id_4` int(11) NULL DEFAULT NULL COMMENT '物品加成4',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '物品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of res
-- ----------------------------
INSERT INTO `res` VALUES (1, '入门法剑', '基础武器，小幅增加攻击力', 1, NULL, NULL, NULL);
INSERT INTO `res` VALUES (2, '入门禅杖', '基础武器，小幅降低攻击力，小幅增加包记录', 2, 3, NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名',
  `level` int(11) NOT NULL COMMENT '角色等级',
  `experience` int(11) NOT NULL COMMENT '角色经验',
  `school_id` int(11) NOT NULL COMMENT '门派id',
  `bag_id` int(11) NOT NULL COMMENT '背包id',
  `skill_id` int(11) NOT NULL COMMENT '功法id',
  `hp` bigint(20) NOT NULL COMMENT '血量',
  `max_hp` bigint(20) NOT NULL COMMENT '最大血量',
  `mp` bigint(20) NOT NULL COMMENT '蓝量',
  `max_mp` bigint(20) NOT NULL COMMENT '最大蓝量',
  `jin` int(11) NOT NULL COMMENT '金-攻击',
  `mu` int(11) NOT NULL COMMENT '木-双回',
  `shui` int(11) NOT NULL COMMENT '水-移速',
  `huo` int(11) NOT NULL COMMENT '火-暴击率',
  `tu` int(11) NOT NULL COMMENT '土-防御',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (10, 12, '发士大夫', 0, 0, 1, 10, 1, 3700, 3700, 0, 1900, 2, 5, 3, 3, 2);

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '门派名',
  `info` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '门派简介',
  `wuxing` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '五行属性',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, '心水', '避世 种田 溜溜溜', '[0,2,3,0,0]');
INSERT INTO `school` VALUES (2, '争锋', 'pvp 打架 ', '[2,0,0,2,1]');
INSERT INTO `school` VALUES (3, '北辰', '坦', '[0,2,-1,0,4]');

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '功法名称',
  `buff_id_1` int(11) NOT NULL COMMENT '功法效果1',
  `buff_id_2` int(11) NULL DEFAULT NULL COMMENT '功法效果2',
  `buff_id_3` int(11) NULL DEFAULT NULL COMMENT '功法效果3',
  `buff_id_4` int(11) NULL DEFAULT NULL COMMENT '功法效果4',
  `style_id` int(11) NOT NULL COMMENT '需要装备类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '功法' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of skill
-- ----------------------------
INSERT INTO `skill` VALUES (1, '入门剑诀', 1, NULL, NULL, NULL, 1);
INSERT INTO `skill` VALUES (2, '入门棍法', 2, 3, NULL, NULL, 2);

-- ----------------------------
-- Table structure for style
-- ----------------------------
DROP TABLE IF EXISTS `style`;
CREATE TABLE `style`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`, `style`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of style
-- ----------------------------
INSERT INTO `style` VALUES (1, '剑', '用于施展剑诀');
INSERT INTO `style` VALUES (2, '棍', '用于施展棍法');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin` int(1) UNSIGNED ZEROFILL NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`, `user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (12, 'fushisanlang', '451e262fe7aef4c13c54dcb9d3f4aabc0f49d559', 0, '2021-02-24 13:40:49');

SET FOREIGN_KEY_CHECKS = 1;
