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

 Date: 24/02/2021 17:08:14
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
  `buff_id_1` int(11) NOT NULL COMMENT '物品加成1',
  `buff_id_2` int(11) NULL DEFAULT NULL COMMENT '物品加成2',
  `buff_id_3` int(11) NULL DEFAULT NULL COMMENT '物品加成3',
  `buff_id_4` int(11) NULL DEFAULT NULL COMMENT '物品加成4',
  `style_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '武器类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '武器' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of arms
-- ----------------------------
INSERT INTO `arms` VALUES (1, '入门法剑', '基础武器，小幅增加攻击力', 1, NULL, NULL, NULL, '');
INSERT INTO `arms` VALUES (2, '入门禅杖', '基础武器，小幅降低攻击力，小幅增加包记录', 2, 3, NULL, NULL, '');

-- ----------------------------
-- Table structure for bag
-- ----------------------------
DROP TABLE IF EXISTS `bag`;
CREATE TABLE `bag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `money` bigint(20) UNSIGNED ZEROFILL NOT NULL COMMENT '钱',
  `bag1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第一格',
  `bag2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第二格',
  `bag3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第三格',
  `bag4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第四格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of bag
-- ----------------------------

-- ----------------------------
-- Table structure for buff
-- ----------------------------
DROP TABLE IF EXISTS `buff`;
CREATE TABLE `buff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'buff名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '描述',
  `kick_in` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作用属性',
  `value` decimal(10, 2) NOT NULL COMMENT '作用值',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buff
-- ----------------------------
INSERT INTO `buff` VALUES (1, '利', '小幅度增加攻击力', 'jin', 15.00);
INSERT INTO `buff` VALUES (2, '钝', '小幅度减少攻击力', 'jin', -15.00);
INSERT INTO `buff` VALUES (3, '重', '小幅度增加暴击', 'huo', 0.05);

-- ----------------------------
-- Table structure for conf
-- ----------------------------
DROP TABLE IF EXISTS `conf`;
CREATE TABLE `conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `conf_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of conf
-- ----------------------------
INSERT INTO `conf` VALUES (1, 'world_id', '第一世');

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
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色等级',
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色经验',
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
  `arms_id` int(11) NOT NULL COMMENT '武器id',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `school_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '门派名',
  PRIMARY KEY (`id`, `school_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, '全真');
INSERT INTO `school` VALUES (2, '剑派1');
INSERT INTO `school` VALUES (3, '符道2');

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
