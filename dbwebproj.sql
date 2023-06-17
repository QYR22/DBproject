/*
 Navicat Premium Data Transfer

 Source Server         : Q2_MySQL
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : dbwebproj

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 17/06/2023 10:17:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` bigint NULL DEFAULT NULL COMMENT '所属用户',
  `pid` bigint NOT NULL DEFAULT 0 COMMENT '父结点-0表示本身就是根节点',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1, 0, 'ROOT!');
INSERT INTO `category` VALUES (2, 1, 0, 'blabalbal');
INSERT INTO `category` VALUES (3, 1, 1, '3-R1子文件夹u1');
INSERT INTO `category` VALUES (4, 1, 2, '4-R2子文件夹u1');
INSERT INTO `category` VALUES (5, 2, 0, '5-root1U2');
INSERT INTO `category` VALUES (6, 2, 0, '6-root2U2');
INSERT INTO `category` VALUES (7, 2, 6, '7-R2子文件夹u2');
INSERT INTO `category` VALUES (8, 1, 1, '8-R1子文件夹u1');
INSERT INTO `category` VALUES (9, 2, 0, '9-root3U2');
INSERT INTO `category` VALUES (12, 1, 2, '测试root2子文件夹U1');
INSERT INTO `category` VALUES (13, 1, 0, '按钮+root3');
INSERT INTO `category` VALUES (14, 1, 0, '按钮root4');
INSERT INTO `category` VALUES (15, 1, 0, '按钮root5');
INSERT INTO `category` VALUES (16, 1, 0, 'addroot节点');
INSERT INTO `category` VALUES (17, 1, 1, '一天一个bug');
INSERT INTO `category` VALUES (18, 1, 2, '616');
INSERT INTO `category` VALUES (19, 1, 0, '加root');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `time` bigint NULL DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `location` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (87, 'tycoding', '新增文章', 1, 'cn.tycoding.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=14, title=1, author=tycoding, des=1, content=1, create...', '127.0.0.1', '2020-06-28 23:07:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (88, 'tycoding', '更新文章', 1, 'cn.tycoding.biz.controller.ArticleController.update()', ' sysArticle\"SysArticle(id=14, title=123, author=tycoding, des=1, content=1, crea...', '127.0.0.1', '2020-06-28 23:07:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (94, 'caroline', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=4, title=多媒体测试--Q612, author=caroline, des=<p>多媒体测试-测试！！！</p...', '127.0.0.1', '2023-06-12 22:13:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (95, 'tycoding', '更新用户', 0, 'cn.tycoding.biz.controller.UserController.update()', ' sysUser\"SysUser(id=1, username=null, password=null, avatar=/img/avatar/20180414...', '127.0.0.1', '2023-06-12 22:25:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (96, 'tycoding', '修改密码', 0, 'cn.tycoding.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=null, username=null, password=qinyiru, avatar=null, email=nu...', '127.0.0.1', '2023-06-12 22:25:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (97, 'tycoding', '修改密码', 0, 'cn.tycoding.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=null, username=null, password=qinyiru, avatar=null, email=nu...', '127.0.0.1', '2023-06-12 22:26:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (98, 'caroline', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=5, uid=null, title=test by uid=2, author=caroline, des=<bloc...', '127.0.0.1', '2023-06-12 22:40:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (99, 'caroline', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=6, uid=null, title=test2 by uid=2, author=caroline, des=<blo...', '127.0.0.1', '2023-06-12 22:42:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (100, 'caroline', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=7, uid=null, title=test2 by uid=2, author=caroline, des=<h3>...', '127.0.0.1', '2023-06-12 22:44:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (101, 'caroline', '删除题目', 0, 'cn.tycoding.biz.controller.ProblemController.delete()', NULL, '127.0.0.1', '2023-06-12 22:45:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (102, 'caroline', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=4, uid=1, title=多媒体测试--Q612, author=caroline, des=<p>多媒体测试-测...', '127.0.0.1', '2023-06-12 22:47:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (103, 'caroline', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=8, uid=2, title=test3 by uid=2 caroline, author=caroline, de...', '127.0.0.1', '2023-06-12 22:49:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (104, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-13 08:39:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (105, 'caroline', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-13 08:39:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (106, 'caroline', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=8, uid=2, title=test3 by uid=2 caroline, des=<h3>SpringBoot<...', '127.0.0.1', '2023-06-13 08:40:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (107, 'caroline', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=8, uid=2, title=test3 by uid=2 caroline, des=<h3>SpringBoot<...', '127.0.0.1', '2023-06-13 08:40:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (108, 'caroline', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=6, uid=2, title=test2 by uid=2, des=<blockquote>\\n<p>测试2 by ...', '127.0.0.1', '2023-06-13 08:40:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (109, 'caroline', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-13 08:45:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (110, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-14 08:46:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (111, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-14 10:58:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (112, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-15 16:09:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (113, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-15 18:07:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (114, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-15 19:26:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (115, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-15 19:26:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (116, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-15 19:26:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (117, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-16 01:27:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (118, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-16 01:27:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (119, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-16 01:28:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (120, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-16 01:33:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (121, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-16 01:33:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (122, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-16 21:13:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (123, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-16 21:14:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (124, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-16 21:14:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (125, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-16 21:14:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (126, 'qinyiru', '新增公司部门', 0, 'cn.tycoding.biz.controller.OrganizationController.save()', NULL, '127.0.0.1', '2023-06-17 02:09:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (127, 'qinyiru', '新增公司部门', 0, 'cn.tycoding.biz.controller.OrganizationController.save()', NULL, '127.0.0.1', '2023-06-17 02:10:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (128, 'qinyiru', '新增公司部门', 0, 'cn.tycoding.biz.controller.OrganizationController.save()', NULL, '127.0.0.1', '2023-06-17 02:10:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (129, 'qinyiru', '新增公司部门', 0, 'cn.tycoding.biz.controller.OrganizationController.save()', NULL, '127.0.0.1', '2023-06-17 02:11:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (130, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-17 10:09:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (131, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-17 10:10:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (132, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-17 10:12:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (133, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-17 10:13:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (134, 'qinyiru', '更新岗位', 0, 'cn.tycoding.biz.controller.PositionController.update()', NULL, '127.0.0.1', '2023-06-17 10:13:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (135, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-17 10:14:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (136, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-17 10:14:19', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `create_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `device` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录设备',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (1, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-06-28 21:13:18', 'Chrome 8 -- Mac OS X');
INSERT INTO `login_log` VALUES (2, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2020-06-28 21:17:13', 'Chrome 8 -- Mac OS X');
INSERT INTO `login_log` VALUES (110, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 18:13:23', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (111, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 18:25:02', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (112, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 18:54:52', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (113, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 19:16:58', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (114, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 20:11:43', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (115, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 20:13:50', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (116, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 20:33:31', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (117, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 20:40:30', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (118, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 21:47:12', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (119, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 22:17:12', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (120, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 22:25:33', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (121, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 22:26:19', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (122, 'tycoding', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 22:26:55', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (123, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 22:38:36', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (124, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 22:46:01', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (125, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 23:11:21', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (126, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-12 23:34:30', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (127, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 00:01:46', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (128, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 00:06:18', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (129, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 00:10:31', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (130, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 00:24:34', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (131, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 00:35:45', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (132, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 08:38:55', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (133, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 08:39:43', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (134, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 08:52:51', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (135, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 10:27:48', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (136, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 10:41:58', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (137, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 10:45:34', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (138, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 10:52:28', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (139, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 11:04:44', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (140, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 13:58:31', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (141, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 14:27:05', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (142, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 15:05:11', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (143, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 16:06:37', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (144, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 16:17:12', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (145, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 17:31:15', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (146, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 18:58:53', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (147, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 19:06:28', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (148, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 19:39:24', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (149, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 22:02:13', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (150, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 22:35:08', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (151, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-13 22:57:58', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (152, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 00:13:36', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (153, 'qinyiru', '192.168.1.110', '内网IP|0|0|内网IP|内网IP', '2023-06-14 00:15:29', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (154, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 00:16:56', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (155, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 00:20:43', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (156, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 00:51:20', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (157, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 01:31:39', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (158, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 01:35:47', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (159, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 01:38:39', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (160, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 02:05:16', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (161, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 08:16:58', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (162, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-14 09:57:08', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (163, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-15 13:14:48', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (164, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-15 14:54:59', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (165, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-15 18:04:16', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (166, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 00:50:26', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (167, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 01:07:37', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (168, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 01:54:12', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (169, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 02:05:14', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (170, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 08:20:43', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (171, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 08:51:00', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (172, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 08:56:24', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (173, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 08:59:17', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (174, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 09:02:40', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (175, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 09:18:59', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (176, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 10:21:18', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (177, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 10:36:46', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (178, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 10:57:57', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (179, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:07:28', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (180, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:16:04', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (181, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:35:32', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (182, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:35:35', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (183, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:38:05', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (184, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:38:40', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (185, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:39:58', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (186, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:40:36', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (187, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:43:10', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (188, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 11:50:46', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (189, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 13:25:53', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (190, 'qinyiru', '172.31.2.38', '内网IP|0|0|内网IP|内网IP', '2023-06-16 13:36:23', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (191, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 13:52:32', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (192, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 13:59:41', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (193, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 15:25:40', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (194, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 19:47:39', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (195, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 21:12:32', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (196, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 21:45:38', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (197, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-16 21:50:50', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (198, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 01:04:44', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (199, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 01:13:08', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (200, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 01:13:53', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (201, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 01:19:54', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (202, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 01:59:03', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (203, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 02:02:58', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (204, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 02:06:34', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (205, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 02:09:42', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (206, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 09:32:56', 'Chrome 11 -- Windows 10');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL DEFAULT 1,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司or部门名',
  `pid` bigint NOT NULL DEFAULT 0 COMMENT '0公司/部门指向公司id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, 1, '瓦西大公司', 0);
INSERT INTO `organization` VALUES (2, 1, '瓦西大-SEI软件学院', 1);
INSERT INTO `organization` VALUES (3, 1, 'DC!!', 0);
INSERT INTO `organization` VALUES (4, 1, '蝙蝠侠集团', 3);

-- ----------------------------
-- Table structure for pblm_catg
-- ----------------------------
DROP TABLE IF EXISTS `pblm_catg`;
CREATE TABLE `pblm_catg`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `problem_id` bigint NOT NULL COMMENT '题目ID',
  `category_id` bigint NOT NULL COMMENT '分类文件夹ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '文章&&分类关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pblm_catg
-- ----------------------------
INSERT INTO `pblm_catg` VALUES (3, 3, 5);
INSERT INTO `pblm_catg` VALUES (5, 1, 4);
INSERT INTO `pblm_catg` VALUES (7, 5, 5);
INSERT INTO `pblm_catg` VALUES (13, 8, 9);
INSERT INTO `pblm_catg` VALUES (14, 6, 9);

-- ----------------------------
-- Table structure for pblm_orgn
-- ----------------------------
DROP TABLE IF EXISTS `pblm_orgn`;
CREATE TABLE `pblm_orgn`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `problem_id` bigint NOT NULL,
  `organization_id` bigint NOT NULL COMMENT '公司or部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pblm_orgn
-- ----------------------------

-- ----------------------------
-- Table structure for pblm_posn
-- ----------------------------
DROP TABLE IF EXISTS `pblm_posn`;
CREATE TABLE `pblm_posn`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `problem_id` bigint NOT NULL COMMENT '题目id',
  `position_id` bigint NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pblm_posn
-- ----------------------------

-- ----------------------------
-- Table structure for pblm_tag
-- ----------------------------
DROP TABLE IF EXISTS `pblm_tag`;
CREATE TABLE `pblm_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `problem_id` bigint NOT NULL COMMENT '文章ID',
  `tag_id` bigint NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '文章&&标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pblm_tag
-- ----------------------------
INSERT INTO `pblm_tag` VALUES (1, 1, 4);
INSERT INTO `pblm_tag` VALUES (2, 2, 4);
INSERT INTO `pblm_tag` VALUES (3, 3, 2);
INSERT INTO `pblm_tag` VALUES (4, 3, 3);
INSERT INTO `pblm_tag` VALUES (5, 2, 1);
INSERT INTO `pblm_tag` VALUES (7, 5, 3);
INSERT INTO `pblm_tag` VALUES (10, 4, 4);
INSERT INTO `pblm_tag` VALUES (13, 8, 3);
INSERT INTO `pblm_tag` VALUES (14, 6, 3);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL DEFAULT 1 COMMENT '岗位所属用户id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 1, '后端开发');
INSERT INTO `position` VALUES (2, 1, '前端开发');
INSERT INTO `position` VALUES (3, 1, '数据库管理');
INSERT INTO `position` VALUES (4, 1, '测试岗');
INSERT INTO `position` VALUES (5, 1, '算法岗');
INSERT INTO `position` VALUES (6, 1, '摆烂岗!!');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` bigint NULL DEFAULT 1 COMMENT '所属用户',
  `title` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `author` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '作者',
  `des` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '文章描述',
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `type` int NULL DEFAULT 1 COMMENT '1文字题/2算法题',
  `stars` int NULL DEFAULT NULL COMMENT '1-5颗星',
  `difficult` int NULL DEFAULT NULL COMMENT '1/2/3 简单/中等/困难',
  `last_edit` datetime NULL DEFAULT NULL COMMENT '上次编辑时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (1, 1, 'problem1-uid=1', 'tycoding', '<h1 id=\"h1-how-to-write-an-article-\" style=\"font-family: Roboto, sans-serif;\">How to write an article?</h1><h2 id=\"h2-markdown-rules\" style=\"font-family: Roboto, sans-serif;\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><p><span style=\"font-weight: bolder;\">For example</span></p><p><a href=\"https://tycoding.cn/\">https://tycoding.cn</a></p>', '<h1 id=\"h1-how-to-write-an-article-\"><a name=\"How to write an article?\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>How to write an article?</h1><h2 id=\"h2-markdown-rules\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><p><strong>For example</strong></p>\n<p><a href=\"https://tycoding.cn\">https://tycoding.cn</a></p>\n<pre><code class=\"lang-java\">public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n}\n</code></pre>\n<p><img src=\"http://img.api.tycoding.cn/1568958650973.jpeg\" alt=\"\">\n<table>\n<thead>\n<tr>\n<th>Name</th>\n<th>Link</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Github</td>\n<td><a href=\"https://github.com/TyCoding\">https://github.com/TyCoding</a></td>\n</tr>\n<tr>\n<td>Blog</td>\n<td><a href=\"https://tycoding.cn\">https://tycoding.cn</a></td>\n</tr>\n</tbody>\n</table>\n<ul>\n<li>list one</li><li>list two</li><li>list there</li></ul>\n<h1 id=\"h1-contact\"><a name=\"Contact\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Contact</h1><ul>\n<li><a href=\"http://www.tycoding.cn\">Blog@TyCoding’s blog</a></li><li><a href=\"https://github.com/TyCoding\">GitHub@TyCoding</a></li><li><a href=\"https://www.zhihu.com/people/tomo-83-82/activities\">ZhiHu@TyCoding</a></li><li>QQ Group: 671017003</li></ul>\n', '2023-06-09 14:57:51', 1, 2, 1, '2023-06-10 23:18:12');
INSERT INTO `problem` VALUES (2, 1, 'problem2-uid=1', 'tycoding', '<h1 id=\"h1-how-to-write-an-article-\" style=\"font-family: Roboto, sans-serif;\">How to write an article?</h1><h2 id=\"h2-markdown-rules\" style=\"font-family: Roboto, sans-serif;\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><h1><p style=\"color: rgb(96, 98, 102); font-size: 14px;\"><span style=\"font-weight: bolder;\">For example</span></p><p style=\"color: rgb(96, 98, 102); font-size: 14px;\"><a href=\"https://tycoding.cn/\">https://tycoding.cn</a></p></h1>', '<h1 id=\"h1-how-to-write-an-article-\"><a name=\"How to write an article?\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>How to write an article?</h1><h2 id=\"h2-markdown-rules\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><p><strong>For example</strong></p>\n<p><a href=\"https://tycoding.cn\">https://tycoding.cn</a></p>\n<pre><code class=\"lang-java\">public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n}\n</code></pre>\n<p><img src=\"http://img.api.tycoding.cn/1568958650973.jpeg\" alt=\"\">\n<table>\n<thead>\n<tr>\n<th>Name</th>\n<th>Link</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Github</td>\n<td><a href=\"https://github.com/TyCoding\">https://github.com/TyCoding</a></td>\n</tr>\n<tr>\n<td>Blog</td>\n<td><a href=\"https://tycoding.cn\">https://tycoding.cn</a></td>\n</tr>\n</tbody>\n</table>\n<ul>\n<li>list one</li><li>list two</li><li>list there</li></ul>\n<h1 id=\"h1-contact\"><a name=\"Contact\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Contact</h1><ul>\n<li><a href=\"http://www.tycoding.cn\">Blog@TyCoding’s blog</a></li><li><a href=\"https://github.com/TyCoding\">GitHub@TyCoding</a></li><li><a href=\"https://www.zhihu.com/people/tomo-83-82/activities\">ZhiHu@TyCoding</a></li><li>QQ Group: 671017003</li></ul>\n', '2023-06-04 14:58:31', 1, 5, 2, '2023-06-11 23:17:51');
INSERT INTO `problem` VALUES (3, 2, 'problem1-uid=2', 'tycoding', '<h1 id=\"h1-how-to-write-an-article-\" style=\"font-family: Roboto, sans-serif;\">How to write an article?</h1><h2 id=\"h2-markdown-rules\" style=\"font-family: Roboto, sans-serif;\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><p><span style=\"font-weight: bolder;\">For example</span></p><p><a href=\"https://tycoding.cn/\">https://tycoding.cn</a></p>', '<h1 id=\"h1-how-to-write-an-article-\"><a name=\"How to write an article?\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>How to write an article?</h1><h2 id=\"h2-markdown-rules\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><p><strong>For example</strong></p>\n<p><a href=\"https://tycoding.cn\">https://tycoding.cn</a></p>\n<pre><code class=\"lang-java\">public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n}\n</code></pre>\n<p><img src=\"http://img.api.tycoding.cn/1568958650973.jpeg\" alt=\"\">\n<table>\n<thead>\n<tr>\n<th>Name</th>\n<th>Link</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Github</td>\n<td><a href=\"https://github.com/TyCoding\">https://github.com/TyCoding</a></td>\n</tr>\n<tr>\n<td>Blog</td>\n<td><a href=\"https://tycoding.cn\">https://tycoding.cn</a></td>\n</tr>\n</tbody>\n</table>\n<ul>\n<li>list one</li><li>list two</li><li>list there</li></ul>\n<h1 id=\"h1-contact\"><a name=\"Contact\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Contact</h1><ul>\n<li><a href=\"http://www.tycoding.cn\">Blog@TyCoding’s blog</a></li><li><a href=\"https://github.com/TyCoding\">GitHub@TyCoding</a></li><li><a href=\"https://www.zhihu.com/people/tomo-83-82/activities\">ZhiHu@TyCoding</a></li><li>QQ Group: 671017003</li></ul>\n', '2023-06-20 14:58:54', 1, 1, 3, '2023-06-11 23:17:21');
INSERT INTO `problem` VALUES (4, 1, '多媒体测试--uid=1', 'caroline', '<p>多媒体测试-测试！！！</p>\n<p>&nbsp;</p>', '<h1>试一下多媒体功能</h1>\n<h2>图片展示</h2>\n<p>从网上找了几张梗图</p>\n<p><img src=\"https://pica.zhimg.com/80/v2-62075d121043df557cee0818459c0458_720w.webp?source=1940ef5c\" alt=\"\" /></p>\n<p><img src=\"https://picx.zhimg.com/80/v2-a92712145f83ba70e92f1cb067f599bb_720w.webp?source=1940ef5c\" alt=\"\" /></p>\n<p><span style=\"background-color: #ccffff;\">OK!!图片成功展示！！</span></p>\n<p>测试测试测试测试测试测试测试测试测试测试</p>', '2023-06-12 22:13:48', 2, 0, 2, '2023-06-12 23:15:56');
INSERT INTO `problem` VALUES (5, 2, 'test1 by uid=2', 'caroline', '<blockquote>\n<p>user:caroline<br />uid=2</p>\n</blockquote>', '<h1>TEST: insert codeblock</h1>\n<pre class=\"language-java\"><code>@PostMapping\n    @Log(\"新增题目\")\n    public R add(@RequestBody Problem problem) {\n        try {\n            problem.setUid(this.getCurrentUser().getId());\n            System.out.println(problem.getUid());\n            problem.setAuthor(this.getCurrentUser().getUsername());\n            problemService.add(problem);\n            return new R();\n        } catch (Exception e) {\n            throw new GlobalException(e.getMessage());\n        }\n    }</code></pre>\n<p>&nbsp;</p>\n<p>OK!!</p>', '2023-06-12 22:40:12', 2, 0, 1, '2023-06-12 23:15:49');
INSERT INTO `problem` VALUES (6, 2, 'test2 by uid=2', 'caroline', '<blockquote>\n<p>测试2 by uid=2</p>\n</blockquote>', '<p>Spring MVC是基于 Servlet 的一个 MVC 框架 主要解决 WEB 开发的问题，因为 Spring 的配置非常复杂，各种XML、 JavaConfig、hin处理起来比较繁琐。于是为了简化开发者的使用，从而创造性地推出了Spring boot，约定优于配置，简化了spring的配置流程。</p>\n<p>Spring 最初利用&ldquo;工厂模式&rdquo;（DI）和&ldquo;代理模式&rdquo;（AOP）解耦应用组件。大家觉得挺好用，于是按照这种模式搞了一个 MVC框架（一些用Spring 解耦的组件），用开发 web 应用（ SpringMVC ）。然后有发现每次开发都写很多样板代码，为了简化工作流程，于是开发出了一些&ldquo;<a href=\"https://www.zhihu.com/search?q=%E6%87%92%E4%BA%BA%E6%95%B4%E5%90%88%E5%8C%85&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A223383505%7D\">懒人整合包</a>&rdquo;（starter），这套就是 Spring Boot。</p>', '2023-06-12 22:42:33', 2, 0, 3, '2023-06-12 23:15:38');
INSERT INTO `problem` VALUES (8, 2, 'test3 by uid=2 caroline', 'caroline', '<h3>SpringBoot</h3>', '<h3>SpringBoot</h3>\n<p><strong>Spring Boot实现了自动配置</strong>，降低了项目搭建的复杂度，提高开发速度。maven打出jar包直接运行起来就是web应用了</p>\n<p>众所周知Spring框架需要进行大量的配置，Spring Boot引入自动配置的概念，让项目设置变得很容易。Spring Boot本身并不提供Spring框架的核心特性以及扩展功能，只是用于快速、敏捷地开发新一代基于<a href=\"https://www.zhihu.com/search?q=Spring%E6%A1%86%E6%9E%B6&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A223383505%7D\">Spring框架</a>的应用程序。也就是说，它并不是用来替代Spring的解决方案，而是和Spring框架紧密结合用于提升Spring开发者体验的工具。同时它集成了大量常用的第三方库配置(例如Jackson, JDBC, Mongo, Redis, Mail等等)，Spring Boot应用中这些第三方库几乎可以零配置的开箱即用(<a href=\"https://www.zhihu.com/search?q=out-of-the-box&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A223383505%7D\">out-of-the-box</a>)，大部分的Spring Boot应用都只需要非常少量的配置代码，开发者能够更加专注于业务逻辑。</p>', '2023-06-12 22:49:02', 2, 0, 1, '2023-06-12 23:15:41');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` bigint NOT NULL DEFAULT 1 COMMENT '所属用户',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`, `uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 1, '随笔');
INSERT INTO `tag` VALUES (2, 2, '随笔');
INSERT INTO `tag` VALUES (3, 2, '测试');
INSERT INTO `tag` VALUES (4, 1, '测试');

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '连接名称',
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '连接URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '友链表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_link
-- ----------------------------
INSERT INTO `tb_link` VALUES (1, 'Blog', 'http://tycoding.cn');
INSERT INTO `tb_link` VALUES (2, 'Github', 'https://github.com/tycoding');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `des` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'qinyiru', '5ed376acc1f8514604f9b5a3812873bb', '/img/avatar/20180414165909.jpg', 'yiru@xx.com', 'Coder', '2020-06-04 16:55:05');
INSERT INTO `user` VALUES (2, 'caroline', '1dfb8155b433154794637d016a62de4b', '/img/avatar/20180414165815.jpg', 'test@dbproj.com', 'dbproject', '2023-06-12 21:46:42');

SET FOREIGN_KEY_CHECKS = 1;
