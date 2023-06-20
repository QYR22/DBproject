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

 Date: 20/06/2023 17:47:23
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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1, 0, 'ROOT!');
INSERT INTO `category` VALUES (2, 1, 0, '高中');
INSERT INTO `category` VALUES (3, 1, 1, 'ROOT子文件夹');
INSERT INTO `category` VALUES (4, 1, 2, '4-R2子文件夹u1');
INSERT INTO `category` VALUES (5, 2, 0, '5-root1U2');
INSERT INTO `category` VALUES (6, 2, 0, '6-root2U2');
INSERT INTO `category` VALUES (7, 2, 6, '7-R2子文件夹u2');
INSERT INTO `category` VALUES (8, 1, 1, '8-R1子文件夹u1');
INSERT INTO `category` VALUES (9, 2, 0, '9-root3U2');
INSERT INTO `category` VALUES (12, 1, 2, '测试root2子文件夹U1');
INSERT INTO `category` VALUES (13, 1, 0, '大一');
INSERT INTO `category` VALUES (14, 1, 0, '大二寒假');
INSERT INTO `category` VALUES (15, 1, 0, '大二春季学期');
INSERT INTO `category` VALUES (17, 1, 1, '一天一个bug');
INSERT INTO `category` VALUES (18, 1, 2, '616');
INSERT INTO `category` VALUES (22, 1, 15, '子文件夹try');
INSERT INTO `category` VALUES (23, 1, 15, 'cvc');

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
) ENGINE = InnoDB AUTO_INCREMENT = 230 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统日志表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `log` VALUES (137, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=4, uid=null, title=多媒体测试--uid=1, des=<p>多媒体测试-测试！！！</p>\\n<p>...', '127.0.0.1', '2023-06-17 21:00:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (138, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=1, uid=null, title=problem1-uid=1, des=<h1 id=\\\"h1-how-to-wr...', '127.0.0.1', '2023-06-17 21:57:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (139, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=4, uid=null, title=多媒体测试--uid=1, des=<p>多媒体测试-测试！！！</p>\\n<p>...', '127.0.0.1', '2023-06-18 22:06:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (140, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=9, uid=1, title=A多表SQL, des=<p>A标签使用</p>, content=<h1>多表查询实现...', '127.0.0.1', '2023-06-20 00:01:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (141, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=9, uid=null, title=A多表SQL, des=<p>A标签使用</p>, content=<h1>多表查...', '127.0.0.1', '2023-06-20 00:32:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (142, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-20 00:38:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (143, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=10, uid=1, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https://l...', '127.0.0.1', '2023-06-20 00:51:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (144, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=11, uid=1, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https://l...', '127.0.0.1', '2023-06-20 00:52:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (145, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=11, uid=null, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https:...', '127.0.0.1', '2023-06-20 01:55:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (146, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=11, uid=null, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https:...', '127.0.0.1', '2023-06-20 02:00:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (147, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=11, uid=null, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https:...', '127.0.0.1', '2023-06-20 02:26:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (148, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=11, uid=null, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https:...', '127.0.0.1', '2023-06-20 02:53:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (149, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=12, uid=1, title=D解决orgnBUG, des=<p>bugmaker</p>, content=<p...', '127.0.0.1', '2023-06-20 02:54:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (150, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 03:11:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (151, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=2, uid=null, title=problem2-uid=1, des=<h1 id=\\\"h1-how-to-wr...', '127.0.0.1', '2023-06-20 03:32:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (152, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=2, uid=null, title=problem2-uid=1, des=<h1 id=\\\"h1-how-to-wr...', '127.0.0.1', '2023-06-20 03:32:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (153, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=11, uid=null, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https:...', '127.0.0.1', '2023-06-20 03:36:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (154, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 03:39:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (155, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 03:40:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (156, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=4, uid=null, title=多媒体测试--uid=1, des=<p>多媒体测试-测试！！！</p>\\n<p>...', '127.0.0.1', '2023-06-20 03:46:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (157, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=4, uid=null, title=多媒体测试--uid=1, des=<p>多媒体测试-测试！！！</p>\\n<p>...', '127.0.0.1', '2023-06-20 03:47:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (158, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=4, uid=null, title=多媒体测试--uid=1, des=<p>多媒体测试-测试！！！</p>\\n<p>...', '127.0.0.1', '2023-06-20 03:50:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (159, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 03:52:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (160, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 03:56:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (161, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:00:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (162, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:03:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (163, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:04:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (164, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:05:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (165, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:06:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (166, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:06:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (167, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:07:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (168, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmaker</p>, content...', '127.0.0.1', '2023-06-20 04:08:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (169, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmakersssssssssssss...', '127.0.0.1', '2023-06-20 04:09:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (170, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmakersssssssssssss...', '127.0.0.1', '2023-06-20 04:12:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (171, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmakersssssssssssss...', '127.0.0.1', '2023-06-20 04:12:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (172, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=12, uid=null, title=D解决orgnBUG, des=<p>bugmakersssssssssssss...', '127.0.0.1', '2023-06-20 04:16:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (173, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=13, uid=1, title=E研究标签, des=<h1>题目描述</h1>, content=<h1>题目解答<...', '127.0.0.1', '2023-06-20 09:51:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (174, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=14, uid=1, title=F620, des=<p>文字题</p>, content=, code=null, ...', '127.0.0.1', '2023-06-20 09:55:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (175, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=14, uid=null, title=F620, des=<p>文字题</p>, content=<p>update<...', '127.0.0.1', '2023-06-20 09:58:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (176, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=14, uid=null, title=F620, des=<p>文字题</p>, content=<p>update<...', '127.0.0.1', '2023-06-20 09:58:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (177, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=14, uid=null, title=F620, des=<p>文字题</p>, content=<p>update<...', '127.0.0.1', '2023-06-20 09:58:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (178, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=9, uid=null, title=A多表SQL, des=<p>A标签使用</p>, content=<h1>多表查...', '127.0.0.1', '2023-06-20 09:59:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (179, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=14, uid=null, title=F620, des=<p>文字题</p>, content=<p>update<...', '127.0.0.1', '2023-06-20 10:00:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (180, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=14, uid=null, title=F620, des=<p>文字题</p>, content=, code=<p>...', '127.0.0.1', '2023-06-20 10:01:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (181, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=13, uid=null, title=E研究标签, des=<h1>题目描述</h1>, content=<h1>题目...', '127.0.0.1', '2023-06-20 10:03:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (182, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=14, uid=null, title=F620, des=<p>文字题</p>, content=, code=<p>...', '127.0.0.1', '2023-06-20 10:04:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (183, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=10, uid=null, title=B-511. 游戏玩法分析 I, des=<p><a href=\\\"https:...', '127.0.0.1', '2023-06-20 10:04:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (184, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=15, uid=1, title=R-formdata, des=<p>检查set是否有效</p>, content=,...', '127.0.0.1', '2023-06-20 10:09:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (185, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=16, uid=1, title=H-学会找问题, des=<p>项目中整体顺序为：<strong>前序（编程语言、编程...', '127.0.0.1', '2023-06-20 10:26:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (186, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=16, uid=null, title=H-学会找问题, des=<p>项目中整体顺序为：<strong>前序（编程语言...', '127.0.0.1', '2023-06-20 10:54:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (187, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=16, uid=null, title=H-学会找问题, des=<p>项目中整体顺序为：<strong>前序（编程语言...', '127.0.0.1', '2023-06-20 11:02:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (188, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=16, uid=null, title=H-学会找问题, des=<p>项目中整体顺序为：<strong>前序（编程语言...', '127.0.0.1', '2023-06-20 11:02:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (189, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=16, uid=null, title=H-学会找问题, des=<p>项目中整体顺序为：<strong>前序（编程语言...', '127.0.0.1', '2023-06-20 11:03:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (190, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=17, uid=1, title=FINAL总结, des=<p>总结</p>, content=<p><img src...', '127.0.0.1', '2023-06-20 11:23:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (191, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=17, uid=null, title=FINAL总结, des=<p>总结</p>, content=<p><img ...', '127.0.0.1', '2023-06-20 11:26:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (192, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=18, uid=1, title=620展示, des=<p>描述</p>, content=<p>题目解答</p>, ...', '127.0.0.1', '2023-06-20 13:56:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (193, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-20 13:59:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (194, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-20 14:00:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (195, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-20 14:01:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (196, 'qinyiru', '删除岗位', 0, 'cn.tycoding.biz.controller.PositionController.delete()', NULL, '127.0.0.1', '2023-06-20 14:01:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (197, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-20 14:02:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (198, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-20 14:02:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (199, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-20 14:03:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (200, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-20 14:03:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (201, 'qinyiru', '新增tag标签', 0, 'cn.tycoding.biz.controller.TagController.save()', NULL, '127.0.0.1', '2023-06-20 14:03:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (202, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=9, uid=null, title=A多表SQL, des=<p>A标签使用</p>, content=<h1>多表查...', '127.0.0.1', '2023-06-20 14:03:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (203, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=18, uid=null, title=620展示, des=<p>描述</p>, content=<p>题目解答</p...', '127.0.0.1', '2023-06-20 14:04:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (204, 'qinyiru', '新增tag标签', 0, 'cn.tycoding.biz.controller.TagController.save()', NULL, '127.0.0.1', '2023-06-20 14:04:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (205, 'qinyiru', '新增tag标签', 0, 'cn.tycoding.biz.controller.TagController.save()', NULL, '127.0.0.1', '2023-06-20 14:05:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (206, 'qinyiru', '新增tag标签', 0, 'cn.tycoding.biz.controller.TagController.save()', NULL, '127.0.0.1', '2023-06-20 14:06:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (207, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=4, uid=null, title=多媒体测试, des=<p>多媒体测试-测试！！！</p>\\n<p>测试测试</p...', '127.0.0.1', '2023-06-20 14:31:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (208, 'qinyiru', '删除题目', 0, 'cn.tycoding.biz.controller.ProblemController.delete()', NULL, '127.0.0.1', '2023-06-20 14:33:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (209, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=19, uid=1, title=标题, des=<p>描述</p>, content=, code=<pre clas...', '127.0.0.1', '2023-06-20 15:02:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (210, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=19, uid=null, title=标题, des=<p>描述是</p>, content=, code=<pre ...', '127.0.0.1', '2023-06-20 15:02:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (211, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-20 15:05:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (212, 'qinyiru', '更新岗位', 0, 'cn.tycoding.biz.controller.PositionController.update()', NULL, '127.0.0.1', '2023-06-20 15:07:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (213, 'qinyiru', '删除岗位', 0, 'cn.tycoding.biz.controller.PositionController.delete()', NULL, '127.0.0.1', '2023-06-20 15:07:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (214, 'qinyiru', '新增tag标签', 0, 'cn.tycoding.biz.controller.TagController.save()', NULL, '127.0.0.1', '2023-06-20 15:07:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (215, 'qinyiru', '删除tag标签', 0, 'cn.tycoding.biz.controller.TagController.delete()', NULL, '127.0.0.1', '2023-06-20 15:08:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (216, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=20, uid=1, title=标题sdf, des=<p>白哦水电费</p>, content=, code=<pr...', '127.0.0.1', '2023-06-20 15:53:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (217, 'qinyiru', '删除题目', 0, 'cn.tycoding.biz.controller.ProblemController.delete()', NULL, '127.0.0.1', '2023-06-20 15:55:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (218, 'qinyiru', '更新题目', 0, 'cn.tycoding.biz.controller.ProblemController.update()', ' problem\"Problem(id=19, uid=null, title=标题, des=<p>描述是</p>, content=, code=<pre ...', '127.0.0.1', '2023-06-20 15:55:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (219, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-20 15:56:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (220, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-20 15:56:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (221, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-20 15:56:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (222, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-20 15:57:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (223, 'qinyiru', '新增岗位', 0, 'cn.tycoding.biz.controller.PositionController.save()', NULL, '127.0.0.1', '2023-06-20 15:58:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (224, 'qinyiru', '删除岗位', 0, 'cn.tycoding.biz.controller.PositionController.delete()', NULL, '127.0.0.1', '2023-06-20 15:58:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (225, 'qinyiru', '更新岗位', 0, 'cn.tycoding.biz.controller.PositionController.update()', NULL, '127.0.0.1', '2023-06-20 15:58:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (226, 'qinyiru', '新增题目', 0, 'cn.tycoding.biz.controller.ProblemController.add()', ' problem\"Problem(id=21, uid=1, title=sdfsf, des=<p>sdfasdfadsf</p>, content=, co...', '127.0.0.1', '2023-06-20 17:35:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (227, 'qinyiru', '更新分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.update()', NULL, '127.0.0.1', '2023-06-20 17:36:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (228, 'qinyiru', '删除分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.delete()', NULL, '127.0.0.1', '2023-06-20 17:36:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `log` VALUES (229, 'qinyiru', '新增分类文件夹', 0, 'cn.tycoding.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2023-06-20 17:37:14', '内网IP|0|0|内网IP|内网IP');

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
) ENGINE = InnoDB AUTO_INCREMENT = 318 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `login_log` VALUES (207, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 20:15:06', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (208, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 20:21:27', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (209, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 20:54:19', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (210, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 21:52:26', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (211, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 22:09:55', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (212, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 22:12:34', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (213, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-17 23:04:30', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (214, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-18 21:18:42', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (215, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-18 22:56:22', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (216, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 00:02:40', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (217, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 00:10:39', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (218, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 00:23:51', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (219, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 00:30:38', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (220, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 10:56:01', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (221, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 13:52:24', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (222, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 14:47:14', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (223, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 14:49:35', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (224, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 14:59:33', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (225, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 15:01:50', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (226, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 15:08:07', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (227, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 15:12:16', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (228, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 15:28:31', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (229, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 15:50:00', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (230, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 15:55:04', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (231, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 16:03:31', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (232, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 16:15:58', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (233, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 16:20:04', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (234, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 16:24:54', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (235, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 16:40:35', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (236, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 16:55:36', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (237, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 16:57:09', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (238, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:02:46', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (239, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:12:02', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (240, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:17:01', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (241, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:18:57', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (242, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:29:55', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (243, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:34:24', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (244, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:38:37', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (245, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:46:10', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (246, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:50:42', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (247, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 17:56:47', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (248, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:00:54', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (249, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:02:09', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (250, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:04:27', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (251, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:06:39', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (252, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:16:15', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (253, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:21:08', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (254, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:23:04', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (255, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:27:07', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (256, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 18:58:05', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (257, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:04:44', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (258, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:07:15', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (259, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:11:13', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (260, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:13:30', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (261, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:16:06', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (262, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:32:37', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (263, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:34:10', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (264, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:35:03', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (265, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:46:35', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (266, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:52:19', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (267, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 19:57:39', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (268, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 20:09:33', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (269, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 20:51:42', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (270, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 21:28:13', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (271, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 21:51:20', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (272, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-19 23:51:30', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (273, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 00:31:37', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (274, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 01:37:45', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (275, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 01:42:51', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (276, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 01:49:18', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (277, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 01:55:00', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (278, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 02:00:34', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (279, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 02:12:59', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (280, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 02:15:27', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (281, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 02:36:22', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (282, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 02:41:20', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (283, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 02:52:55', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (284, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 03:01:52', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (285, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 03:24:54', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (286, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 04:15:29', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (287, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 09:35:12', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (288, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 10:00:42', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (289, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 10:09:07', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (290, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 10:19:03', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (291, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 10:44:40', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (292, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 11:01:38', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (293, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 11:08:00', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (294, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 11:13:14', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (295, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 11:18:02', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (296, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 11:31:55', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (297, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 11:34:26', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (298, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 12:27:10', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (299, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 12:45:03', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (300, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 13:16:12', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (301, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 13:49:01', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (302, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 13:49:51', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (303, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 13:50:06', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (304, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 13:55:37', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (305, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 14:48:04', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (306, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 14:57:52', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (307, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 14:59:56', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (308, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 15:00:21', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (309, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 15:49:11', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (310, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 15:49:24', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (311, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 15:50:39', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (312, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 15:50:53', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (313, 'caroline', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 15:51:49', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (314, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 15:52:02', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (315, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 17:31:47', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (316, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 17:37:53', 'Chrome 11 -- Windows 10');
INSERT INTO `login_log` VALUES (317, 'qinyiru', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2023-06-20 17:38:04', 'Chrome 11 -- Windows 10');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '题目&&分类关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pblm_catg
-- ----------------------------
INSERT INTO `pblm_catg` VALUES (3, 3, 5);
INSERT INTO `pblm_catg` VALUES (7, 5, 5);
INSERT INTO `pblm_catg` VALUES (13, 8, 9);
INSERT INTO `pblm_catg` VALUES (14, 6, 9);
INSERT INTO `pblm_catg` VALUES (16, 1, 4);
INSERT INTO `pblm_catg` VALUES (19, 9, 3);
INSERT INTO `pblm_catg` VALUES (20, 10, 3);
INSERT INTO `pblm_catg` VALUES (25, 2, 17);
INSERT INTO `pblm_catg` VALUES (26, 11, 17);
INSERT INTO `pblm_catg` VALUES (37, 13, 12);
INSERT INTO `pblm_catg` VALUES (39, 15, 17);
INSERT INTO `pblm_catg` VALUES (42, 16, 17);
INSERT INTO `pblm_catg` VALUES (44, 17, 8);
INSERT INTO `pblm_catg` VALUES (45, 18, 8);
INSERT INTO `pblm_catg` VALUES (46, 4, 3);
INSERT INTO `pblm_catg` VALUES (48, 19, 15);
INSERT INTO `pblm_catg` VALUES (50, 21, 12);

-- ----------------------------
-- Table structure for pblm_orgn
-- ----------------------------
DROP TABLE IF EXISTS `pblm_orgn`;
CREATE TABLE `pblm_orgn`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `problem_id` bigint NOT NULL,
  `organization_id` bigint NOT NULL COMMENT '公司or部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pblm_orgn
-- ----------------------------
INSERT INTO `pblm_orgn` VALUES (1, 1, 2);
INSERT INTO `pblm_orgn` VALUES (5, 2, 2);
INSERT INTO `pblm_orgn` VALUES (6, 11, 2);
INSERT INTO `pblm_orgn` VALUES (12, 12, 2);
INSERT INTO `pblm_orgn` VALUES (13, 13, 4);
INSERT INTO `pblm_orgn` VALUES (16, 16, 2);
INSERT INTO `pblm_orgn` VALUES (18, 17, 2);
INSERT INTO `pblm_orgn` VALUES (19, 18, 2);
INSERT INTO `pblm_orgn` VALUES (20, 4, 2);
INSERT INTO `pblm_orgn` VALUES (21, 19, 2);
INSERT INTO `pblm_orgn` VALUES (22, 21, 2);

-- ----------------------------
-- Table structure for pblm_posn
-- ----------------------------
DROP TABLE IF EXISTS `pblm_posn`;
CREATE TABLE `pblm_posn`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `problem_id` bigint NOT NULL COMMENT '题目id',
  `position_id` bigint NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pblm_posn
-- ----------------------------
INSERT INTO `pblm_posn` VALUES (1, 1, 1);
INSERT INTO `pblm_posn` VALUES (2, 1, 2);
INSERT INTO `pblm_posn` VALUES (3, 1, 3);
INSERT INTO `pblm_posn` VALUES (4, 2, 4);
INSERT INTO `pblm_posn` VALUES (5, 2, 2);
INSERT INTO `pblm_posn` VALUES (25, 12, 5);
INSERT INTO `pblm_posn` VALUES (26, 12, 2);
INSERT INTO `pblm_posn` VALUES (28, 13, 6);
INSERT INTO `pblm_posn` VALUES (29, 13, 5);
INSERT INTO `pblm_posn` VALUES (39, 17, 4);
INSERT INTO `pblm_posn` VALUES (41, 18, 4);
INSERT INTO `pblm_posn` VALUES (42, 18, 5);
INSERT INTO `pblm_posn` VALUES (44, 19, 6);
INSERT INTO `pblm_posn` VALUES (45, 19, 4);
INSERT INTO `pblm_posn` VALUES (46, 19, 5);
INSERT INTO `pblm_posn` VALUES (49, 21, 6);
INSERT INTO `pblm_posn` VALUES (50, 21, 5);
INSERT INTO `pblm_posn` VALUES (51, 21, 4);
INSERT INTO `pblm_posn` VALUES (52, 21, 3);

-- ----------------------------
-- Table structure for pblm_tag
-- ----------------------------
DROP TABLE IF EXISTS `pblm_tag`;
CREATE TABLE `pblm_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `problem_id` bigint NOT NULL COMMENT '题目ID',
  `tag_id` bigint NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '题目&&标签关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pblm_tag
-- ----------------------------
INSERT INTO `pblm_tag` VALUES (3, 3, 2);
INSERT INTO `pblm_tag` VALUES (4, 3, 3);
INSERT INTO `pblm_tag` VALUES (7, 5, 3);
INSERT INTO `pblm_tag` VALUES (13, 8, 3);
INSERT INTO `pblm_tag` VALUES (14, 6, 3);
INSERT INTO `pblm_tag` VALUES (16, 1, 4);
INSERT INTO `pblm_tag` VALUES (20, 10, 1);
INSERT INTO `pblm_tag` VALUES (25, 2, 1);
INSERT INTO `pblm_tag` VALUES (26, 11, 4);
INSERT INTO `pblm_tag` VALUES (45, 12, 4);
INSERT INTO `pblm_tag` VALUES (46, 12, 1);
INSERT INTO `pblm_tag` VALUES (47, 13, 4);
INSERT INTO `pblm_tag` VALUES (48, 13, 1);
INSERT INTO `pblm_tag` VALUES (51, 15, 4);
INSERT INTO `pblm_tag` VALUES (52, 15, 1);
INSERT INTO `pblm_tag` VALUES (57, 16, 4);
INSERT INTO `pblm_tag` VALUES (58, 16, 1);
INSERT INTO `pblm_tag` VALUES (61, 17, 4);
INSERT INTO `pblm_tag` VALUES (62, 17, 1);
INSERT INTO `pblm_tag` VALUES (63, 18, 1);
INSERT INTO `pblm_tag` VALUES (64, 18, 4);
INSERT INTO `pblm_tag` VALUES (65, 9, 5);
INSERT INTO `pblm_tag` VALUES (66, 4, 4);
INSERT INTO `pblm_tag` VALUES (67, 4, 1);
INSERT INTO `pblm_tag` VALUES (68, 4, 5);
INSERT INTO `pblm_tag` VALUES (69, 19, 8);
INSERT INTO `pblm_tag` VALUES (70, 19, 7);
INSERT INTO `pblm_tag` VALUES (71, 19, 6);
INSERT INTO `pblm_tag` VALUES (75, 21, 7);
INSERT INTO `pblm_tag` VALUES (76, 21, 6);
INSERT INTO `pblm_tag` VALUES (77, 21, 4);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL DEFAULT 1 COMMENT '岗位所属用户id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 1, '后端开发');
INSERT INTO `position` VALUES (2, 1, '前端开发');
INSERT INTO `position` VALUES (3, 1, '数据库管理');
INSERT INTO `position` VALUES (4, 1, '测试岗');
INSERT INTO `position` VALUES (5, 1, '算法岗');
INSERT INTO `position` VALUES (6, 1, '加油岗位');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` bigint NULL DEFAULT 1 COMMENT '所属用户',
  `title` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `des` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '题目描述',
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '笔记',
  `code` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '算法题代码块',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `type` int NULL DEFAULT NULL COMMENT '1文字题/2算法题',
  `finished` int NULL DEFAULT NULL COMMENT '完成情况1已完成/2未完成',
  `stars` int NULL DEFAULT NULL COMMENT '掌握程度1-5颗星',
  `difficult` int NULL DEFAULT NULL COMMENT '1/2/3 简单/中等/困难',
  `last_edit` datetime NULL DEFAULT NULL COMMENT '最近编辑时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (1, 1, 'problem1-uid=1', '<h1 id=\"h1-how-to-write-an-article-\" style=\"font-family: Roboto, sans-serif;\">富文本文本编辑器</h1>\n<p><span style=\"font-weight: bolder;\">description--&gt;des字段</span></p>', '<h1 id=\"h1-how-to-write-an-article-\" style=\"font-family: Roboto, sans-serif;\">富文本文本编辑器</h1>\r\n<h2 id=\"h2-markdown-rules\"><a class=\"reference-link\" name=\"Markdown rules\"></a>note字段</h2>\r\n<p><strong>For example</strong></p>\r\n<p>&nbsp;</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>Name</th>\r\n<th>Link</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>Github</td>\r\n<td><a href=\"https://github.com/QYR22/DBproject\">QYR22/DBproject: ECNU-SEI数据库期末项目:题目管理平台 (github.com)</a></td>\r\n</tr>\r\n<tr>\r\n<td>url</td>\r\n<td><a href=\"https://github.com/QYR22/DBproject\" target=\"_blank\" rel=\"noopener\">https://github.com/QYR22/DBproject</a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<ul>\r\n<li>bullet!</li>\r\n<li>&nbsp;</li>\r\n</ul>\r\n<h1 id=\"h1-contact\"><a class=\"reference-link\" name=\"Contact\"></a>Contact</h1>\r\n<ul>\r\n<li>email: <a href=\"mailto:yiruqiin@outlook.com\" target=\"_blank\" rel=\"noopener\">yiruqiin@outlook.com</a></li>\r\n<li>&nbsp;</li>\r\n</ul>', '<pre><code v-html=\"scriptText\" class=\"sql\">select * from table_name; System.out.println(\"sdddddddddddddddddddd\");\r\n</code></pre>', '2021-11-09 14:57:51', 2, 1, 5, 2, '2022-02-17 21:57:28');
INSERT INTO `problem` VALUES (2, 1, 'problem2-uid=1', '<h1 id=\"h1-how-to-write-an-article-\" style=\"font-family: Roboto, sans-serif;\">How to write an article?</h1>\n<h2 id=\"h2-markdown-rules\" style=\"font-family: Roboto, sans-serif;\"><a class=\"reference-link\" name=\"Markdown rules\"></a>Markdown rules</h2>\n<p style=\"color: #606266; font-size: 14px;\">&nbsp;</p>', '<h1 id=\"h1-how-to-write-an-article-\"><a class=\"reference-link\" name=\"How to write an article?\"></a>How to write an article?</h1>\n<h2 id=\"h2-markdown-rules\"><a class=\"reference-link\" name=\"Markdown rules\"></a>Markdown rules</h2>\n<p><strong>For example</strong></p>\n<pre><code class=\"lang-java\">public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n}\n</code></pre>\n<p><img src=\"http://img.api.tycoding.cn/1568958650973.jpeg\" alt=\"\" /></p>\n<table>\n<thead>\n<tr>\n<th>Name</th>\n<th>Link</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Github</td>\n<td>https://github.com/QYR22/DBproject</td>\n</tr>\n<tr>\n<td>author</td>\n<td>Q22 + ZSQvq</td>\n</tr>\n</tbody>\n</table>\n<ul>\n<li>list one</li>\n<li>list two</li>\n<li>list there</li>\n</ul>\n<h1 id=\"h1-contact\"><a class=\"reference-link\" name=\"Contact\"></a>Contact</h1>\n<ul>\n<li><a href=\"https://github.com/QYR22/DBproject\" target=\"_blank\" rel=\"noopener\">https://github.com/QYR22/DBproject</a></li>\n</ul>', '', '2023-06-04 14:58:31', 1, 1, 3, 3, '2023-06-20 03:32:47');
INSERT INTO `problem` VALUES (3, 2, 'problem1-uid=2', '<h1 id=\"h1-how-to-write-an-article-\" style=\"font-family: Roboto, sans-serif;\">How to write an article?</h1><h2 id=\"h2-markdown-rules\" style=\"font-family: Roboto, sans-serif;\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><p><span style=\"font-weight: bolder;\">For example</span></p><p><a href=\"https://tycoding.cn/\">https://tycoding.cn</a></p>', '<h1 id=\"h1-how-to-write-an-article-\"><a name=\"How to write an article?\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>How to write an article?</h1><h2 id=\"h2-markdown-rules\"><a name=\"Markdown rules\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Markdown rules</h2><p><strong>For example</strong></p>\n<p><a href=\"https://tycoding.cn\">https://tycoding.cn</a></p>\n<pre><code class=\"lang-java\">public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n}\n</code></pre>\n<p><img src=\"http://img.api.tycoding.cn/1568958650973.jpeg\" alt=\"\">\n<table>\n<thead>\n<tr>\n<th>Name</th>\n<th>Link</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Github</td>\n<td><a href=\"https://github.com/TyCoding\">https://github.com/TyCoding</a></td>\n</tr>\n<tr>\n<td>Blog</td>\n<td><a href=\"https://tycoding.cn\">https://tycoding.cn</a></td>\n</tr>\n</tbody>\n</table>\n<ul>\n<li>list one</li><li>list two</li><li>list there</li></ul>\n<h1 id=\"h1-contact\"><a name=\"Contact\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Contact</h1><ul>\n<li><a href=\"http://www.tycoding.cn\">Blog@TyCoding’s blog</a></li><li><a href=\"https://github.com/TyCoding\">GitHub@TyCoding</a></li><li><a href=\"https://www.zhihu.com/people/tomo-83-82/activities\">ZhiHu@TyCoding</a></li><li>QQ Group: 671017003</li></ul>\n', '', '2023-06-20 14:58:54', 1, 1, 1, 3, '2023-06-11 23:17:21');
INSERT INTO `problem` VALUES (4, 1, '多媒体测试', '<p>多媒体测试-测试！！！</p>\n<p>测试测试</p>', '<h1>试一下多媒体功能</h1>\n<h2>图片展示</h2>\n<p>从网上找了几张梗图</p>\n<p><img src=\"https://pica.zhimg.com/80/v2-62075d121043df557cee0818459c0458_720w.webp?source=1940ef5c\" alt=\"\" /></p>\n<p><img src=\"https://picx.zhimg.com/80/v2-a92712145f83ba70e92f1cb067f599bb_720w.webp?source=1940ef5c\" alt=\"\" /></p>\n<p><span style=\"background-color: #ccffff;\">OK!!图片成功展示！！</span></p>\n<p>测试测试测试测试测试测试测试测试测试测试</p>', '', '2023-06-12 22:13:48', 1, 1, 2, 1, '2023-06-20 14:31:00');
INSERT INTO `problem` VALUES (5, 2, 'test1 by uid=2', '<blockquote>\n<p>user:caroline<br />uid=2</p>\n</blockquote>', '<h1>TEST: insert codeblock</h1>\n<pre class=\"language-java\"><code>@PostMapping\n    @Log(\"新增题目\")\n    public R add(@RequestBody Problem problem) {\n        try {\n            problem.setUid(this.getCurrentUser().getId());\n            System.out.println(problem.getUid());\n            problem.setAuthor(this.getCurrentUser().getUsername());\n            problemService.add(problem);\n            return new R();\n        } catch (Exception e) {\n            throw new GlobalException(e.getMessage());\n        }\n    }</code></pre>\n<p>&nbsp;</p>\n<p>OK!!</p>', '', '2023-06-12 22:40:12', 2, 1, 4, 1, '2023-06-12 23:15:49');
INSERT INTO `problem` VALUES (6, 2, 'test2 by uid=2', '<blockquote>\n<p>测试2 by uid=2</p>\n</blockquote>', '<p>Spring MVC是基于 Servlet 的一个 MVC 框架 主要解决 WEB 开发的问题，因为 Spring 的配置非常复杂，各种XML、 JavaConfig、hin处理起来比较繁琐。于是为了简化开发者的使用，从而创造性地推出了Spring boot，约定优于配置，简化了spring的配置流程。</p>\n<p>Spring 最初利用&ldquo;工厂模式&rdquo;（DI）和&ldquo;代理模式&rdquo;（AOP）解耦应用组件。大家觉得挺好用，于是按照这种模式搞了一个 MVC框架（一些用Spring 解耦的组件），用开发 web 应用（ SpringMVC ）。然后有发现每次开发都写很多样板代码，为了简化工作流程，于是开发出了一些&ldquo;<a href=\"https://www.zhihu.com/search?q=%E6%87%92%E4%BA%BA%E6%95%B4%E5%90%88%E5%8C%85&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A223383505%7D\">懒人整合包</a>&rdquo;（starter），这套就是 Spring Boot。</p>', '', '2023-06-12 22:42:33', 2, 1, 1, 3, '2023-06-12 23:15:38');
INSERT INTO `problem` VALUES (8, 2, 'test3 by uid=2 caroline', '<h3>SpringBoot</h3>', '<h3>SpringBoot</h3>\n<p><strong>Spring Boot实现了自动配置</strong>，降低了项目搭建的复杂度，提高开发速度。maven打出jar包直接运行起来就是web应用了</p>\n<p>众所周知Spring框架需要进行大量的配置，Spring Boot引入自动配置的概念，让项目设置变得很容易。Spring Boot本身并不提供Spring框架的核心特性以及扩展功能，只是用于快速、敏捷地开发新一代基于<a href=\"https://www.zhihu.com/search?q=Spring%E6%A1%86%E6%9E%B6&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A223383505%7D\">Spring框架</a>的应用程序。也就是说，它并不是用来替代Spring的解决方案，而是和Spring框架紧密结合用于提升Spring开发者体验的工具。同时它集成了大量常用的第三方库配置(例如Jackson, JDBC, Mongo, Redis, Mail等等)，Spring Boot应用中这些第三方库几乎可以零配置的开箱即用(<a href=\"https://www.zhihu.com/search?q=out-of-the-box&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A223383505%7D\">out-of-the-box</a>)，大部分的Spring Boot应用都只需要非常少量的配置代码，开发者能够更加专注于业务逻辑。</p>', '', '2023-06-12 22:49:02', 2, 1, 3, 1, '2023-06-12 23:15:41');
INSERT INTO `problem` VALUES (9, 1, 'A多表SQL', '<p>A标签使用</p>', '<h1>多表查询实现原理:</h1>\n<pre class=\"language-markup\"><code>&lt;select id=\"doMulQuery\" resultType=\"cn.tycoding.biz.entity.Problem\"&gt;\n\n    SELECT p.*\n    FROM problem p\n    WHERE p.uid = #{mulQuery.uid}\n\n        &lt;if test=\"mulQuery.lastEdit != null\"&gt;\n            AND p.last_edit &gt;= date(#{mulQuery.lastEdit})\n        &lt;/if&gt;\n        &lt;if test=\"mulQuery.finished != null and mulQuery.finished &amp;gt; 0\"&gt;\n            AND p.finished = #{mulQuery.finished}\n        &lt;/if&gt;\n        &lt;if test=\"mulQuery.type != null and mulQuery.type &amp;gt; 0\"&gt;\n            AND p.type = #{mulQuery.type}\n        &lt;/if&gt;\n        &lt;if test=\"mulQuery.stars != null and mulQuery.stars &amp;gt; 0\"&gt;\n            AND p.stars = #{mulQuery.stars}\n        &lt;/if&gt;\n        &lt;if test=\"mulQuery.difficult != null and mulQuery.difficult &amp;gt; 0\"&gt;\n            AND p.difficult = #{mulQuery.difficult}\n        &lt;/if&gt;\n\n        &lt;if test=\"mulQuery.categoryId != null and mulQuery.categoryId &amp;gt; 0\"&gt;\n\n            AND p.id in (select pc.problem_id from pblm_catg pc\n                where pc.category_id = #{mulQuery.categoryId})\n        &lt;/if&gt;\n\n        &lt;if test=\"mulQuery.organizationIds != null and mulQuery.organizationIds.size &amp;gt; 0\"&gt;\n            AND p.id in(\n                SELECT po.problem_id\n                from pblm_orgn po\n                WHERE po.organization_id IN\n                &lt;foreach item=\"item\" index=\"index\" collection=\"mulQuery.organizationIds\"\n                         open=\"(\" separator=\",\" close=\")\"&gt;\n                    #{item}\n                &lt;/foreach&gt;\n            )\n        &lt;/if&gt;\n        &lt;if test=\"mulQuery.positionIds != null and mulQuery.positionIds.size &amp;gt; 0\"&gt;\n            AND p.id in(\n                SELECT pp.problem_id\n                FROM pblm_posn pp\n                WHERE pp.position_id in\n                &lt;foreach item=\"item\" index=\"index\" collection=\"mulQuery.positionIds\"\n                         open=\"(\" separator=\",\" close=\")\"&gt;\n                    #{item}\n                &lt;/foreach&gt;\n            )\n        &lt;/if&gt;\n        &lt;if test=\"mulQuery.tagIDs != null and mulQuery.tagIDs.size &amp;gt; 0\"&gt;\n            AND p.id in(\n            SELECT pt.problem_id\n                FROM pblm_tag pt\n                WHERE pt.tag_id in\n            &lt;foreach item=\"item\" index=\"index\" collection=\"mulQuery.tagIDs\"\n                     open=\"(\" separator=\",\" close=\")\"&gt;\n                #{item}\n            &lt;/foreach&gt;\n            )\n        &lt;/if&gt;\n    &lt;/select&gt;</code></pre>', '<p>多表查询</p>', '2023-06-20 00:01:36', 2, 2, 3, 2, '2023-06-20 14:03:51');
INSERT INTO `problem` VALUES (10, 1, 'B-511. 游戏玩法分析 I', '<p><a href=\"https://leetcode.cn/problems/employee-bonus/?envType=featured-list&amp;envId=qgq7m9e\" target=\"_blank\" rel=\"noopener\">511. 游戏玩法分析 I</a></p>\n<p>(player_id, event_date) is the primary key of this table.<br />This table shows the activity of players of some games.<br />Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.<code></code></p>\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\n<thead>\n<tr style=\"border-color: #37b882; text-align: left; height: 50px;\">\n<th style=\"width: 10%;\" scope=\"rowgroup\">Column Name</th>\n<th style=\"width: 50%;\" scope=\"rowgroup\">Type</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"width: 25%;\">player_id</td>\n<td style=\"width: 50%;\">int</td>\n</tr>\n<tr>\n<td style=\"width: 50%;\">device_id</td>\n<td style=\"width: 50%;\">int</td>\n</tr>\n<tr>\n<td style=\"width: 50%;\">event_date</td>\n<td style=\"width: 50%;\">date</td>\n</tr>\n<tr>\n<td style=\"width: 50%;\">games_played</td>\n<td style=\"width: 50%;\">int</td>\n</tr>\n</tbody>\n</table>\n<p><br />表的主键是 (player_id, event_date)。<br />这张表展示了一些游戏玩家在游戏平台上的行为活动。<br />每行数据记录了一名玩家在退出平台之前，当天使用同一台设备登录平台后打开的游戏的数目（可能是 0 个）</p>\n<p>&nbsp;</p>\n<p>Write an SQL query to report the first login date for each player.</p>\n<p>Return the result table in any order.</p>\n<p>The query result format is in the following example.</p>', '<p>本题考察group by+agg聚合函数的使用。获取每位玩家 第一次登陆平台的日期，其实就是找每个玩家的最小日期。</p>\n<h1>算法</h1>\n<pre>直接 <span style=\"background-color: #ccffff;\">group by player_id</span>，然后对event_date求min即可。</pre>', '<pre class=\"language-markup\"><code>select \n    player_id,\n    min(event_date) first_login\nfrom activity\ngroup by player_id;</code></pre>', '2023-06-20 00:51:40', 2, 1, 3, 2, '2023-06-20 10:04:16');
INSERT INTO `problem` VALUES (11, 1, 'B-511. 游戏玩法分析 I', '<p><a href=\"https://leetcode.cn/problems/employee-bonus/?envType=featured-list&amp;envId=qgq7m9e\" target=\"_blank\" rel=\"noopener\">511. 游戏玩法分析 I</a></p>\n<p>(player_id, event_date) is the primary key of this table.<br />This table shows the activity of players of some games.<br />Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.<code></code></p>\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\n<thead>\n<tr style=\"border-color: #37b882; text-align: left; height: 50px;\">\n<th style=\"width: 10%;\" scope=\"rowgroup\">Column Name</th>\n<th style=\"width: 50%;\" scope=\"rowgroup\">Type</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"width: 25%;\">player_id</td>\n<td style=\"width: 50%;\">int</td>\n</tr>\n<tr>\n<td style=\"width: 50%;\">device_id</td>\n<td style=\"width: 50%;\">int</td>\n</tr>\n<tr>\n<td style=\"width: 50%;\">event_date</td>\n<td style=\"width: 50%;\">date</td>\n</tr>\n<tr>\n<td style=\"width: 50%;\">games_played</td>\n<td style=\"width: 50%;\">int</td>\n</tr>\n</tbody>\n</table>\n<p><br />表的主键是 (player_id, event_date)。<br />这张表展示了一些游戏玩家在游戏平台上的行为活动。<br />每行数据记录了一名玩家在退出平台之前，当天使用同一台设备登录平台后打开的游戏的数目（可能是 0 个）</p>\n<p>&nbsp;</p>\n<p>Write an SQL query to report the first login date for each player.</p>\n<p>Return the result table in any order.</p>\n<p>The query result format is in the following example.</p>', '<p>本题考察group by+agg聚合函数的使用。获取每位玩家 第一次登陆平台的日期，其实就是找每个玩家的最小日期。</p>\n<h1>算法</h1>\n<pre>直接 <span style=\"background-color: #ccffff;\">group by player_id</span>，然后对event_date求min即可。</pre>', '<pre class=\"language-markup\"><code>select \n    player_id,\n    min(event_date) first_login\nfrom activity\ngroup by player_id;</code></pre>', '2023-06-20 00:52:55', 1, 1, 3, 1, '2023-06-20 03:36:21');
INSERT INTO `problem` VALUES (12, 1, 'D解决orgnBUG', '<p>bugmakerssssssssssssssssssssssssssssss</p>', '<p>bugmakersdfasdfasdf</p>', NULL, '2023-06-20 02:54:32', 2, 1, 1, 3, '2023-06-20 04:16:22');
INSERT INTO `problem` VALUES (13, 1, 'E研究标签', '<h1>题目描述</h1>', '<h1>题目解答</h1>', NULL, '2023-06-20 09:51:40', 1, 2, 1, 3, '2023-06-20 10:03:51');
INSERT INTO `problem` VALUES (15, 1, 'R-formdata', '<p>检查set是否有效</p>', '<p>本题考察group by+agg聚合函数的使用。获取每位玩家 第一次登陆平台的日期，其实就是找每个玩家的最小日期。</p>\n<h1>算法</h1>\n<pre>直接 <span style=\"background-color: #ccffff;\">group by player_id</span>，然后对event_date求min即可。</pre>', NULL, '2023-06-20 10:09:55', 1, 1, 3, 3, '2023-06-20 10:09:55');
INSERT INTO `problem` VALUES (16, 1, 'H-学会找问题', '<p>项目中整体顺序为：<strong>前序（编程语言、编程素养、求职、算法性能）-&gt;数组-&gt; 链表-&gt; 哈希表-&gt;字符串-&gt;栈与队列-&gt;树-&gt;回溯-&gt;贪心-&gt;动态规划-&gt;图论-&gt;高级数据结构</strong></p>', '<p><a href=\"https://github.com/youngyangyang04/leetcode-master\" target=\"_blank\" rel=\"noopener\">https://github.com/youngyangyang04/leetcode-master</a></p>\n<p>&nbsp;</p>\n<ol dir=\"auto\">\n<li><a href=\"https://github.com/youngyangyang04/leetcode-master/blob/master/problems/%E6%95%B0%E7%BB%84%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80.md\">数组过于简单，但你该了解这些！</a></li>\n<li><a href=\"https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0704.%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE.md\">数组：704.二分查找</a></li>\n<li><a href=\"https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0027.%E7%A7%BB%E9%99%A4%E5%85%83%E7%B4%A0.md\">数组：27.移除元素</a></li>\n<li><a href=\"https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0977.%E6%9C%89%E5%BA%8F%E6%95%B0%E7%BB%84%E7%9A%84%E5%B9%B3%E6%96%B9.md\">数组：977.有序数组的平方</a></li>\n<li><a href=\"https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0209.%E9%95%BF%E5%BA%A6%E6%9C%80%E5%B0%8F%E7%9A%84%E5%AD%90%E6%95%B0%E7%BB%84.md\">数组：209.长度最小的子数组</a></li>\n<li><a href=\"https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0059.%E8%9E%BA%E6%97%8B%E7%9F%A9%E9%98%B5II.md\">数组：59.螺旋矩阵II</a></li>\n<li><a href=\"https://github.com/youngyangyang04/leetcode-master/blob/master/problems/%E6%95%B0%E7%BB%84%E6%80%BB%E7%BB%93%E7%AF%87.md\">数组：总结篇</a></li>\n</ol>', NULL, '2023-06-20 10:26:14', 1, 1, 4, 1, '2023-06-20 11:03:21');
INSERT INTO `problem` VALUES (17, 1, 'FINAL总结', '<p>总结</p>', '<p><img src=\"https://cdn.staticfile.org/tinymce/4.9.3/plugins/emoticons/img/smiley-yell.gif\" alt=\"yell\" /></p>', NULL, '2023-06-20 11:23:26', 1, 1, 2, 2, '2023-06-20 11:26:15');
INSERT INTO `problem` VALUES (18, 1, '620展示', '<p>描述</p>', '<p>题目解答</p>', '<pre class=\"language-java\"><code>@ApiModelProperty(value=\"难度\")\n    private int difficult;\n\n\n    @ApiModelProperty(value=\"category\")\n    private Long categoryId;\n\n</code></pre>', '2023-06-20 13:56:55', 2, 1, 4, 2, '2023-06-20 14:04:05');
INSERT INTO `problem` VALUES (19, 1, '标题', '<p>描述是</p>', '', '<pre class=\"language-java\"><code>   //无用户隔离 old version\n    @Override\n    public IPage&lt;Problem&gt; list(Problem problem, QueryPage queryPage) {\n        IPage&lt;Problem&gt; page = new Page&lt;&gt;(queryPage.getPage(), queryPage.getLimit());\n        LambdaQueryWrapper&lt;Problem&gt; queryWrapper = new LambdaQueryWrapper&lt;&gt;();\n        queryWrapper.orderByDesc(Problem::getId);\n        queryWrapper.like(StringUtils.isNotBlank(problem.getTitle()), Problem::getTitle, problem.getTitle());\n\n        IPage&lt;Problem&gt; selectPage = problemMapper.selectPage(page, queryWrapper);\n        findInit(selectPage.getRecords());\n        return selectPage;\n    }</code></pre>', '2023-06-20 15:02:07', 2, 2, 5, 1, '2023-06-20 15:55:52');
INSERT INTO `problem` VALUES (21, 1, 'sdfsf', '<p>sdfasdfadsf</p>', '', '', '2023-06-20 17:35:04', 2, 0, 0, 0, '2023-06-20 17:35:04');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` bigint NOT NULL DEFAULT 1 COMMENT '所属用户',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`, `uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 1, '随笔');
INSERT INTO `tag` VALUES (2, 2, '随笔');
INSERT INTO `tag` VALUES (3, 2, '测试');
INSERT INTO `tag` VALUES (4, 1, '测试');
INSERT INTO `tag` VALUES (5, 1, '数组');
INSERT INTO `tag` VALUES (6, 1, '字符串');
INSERT INTO `tag` VALUES (7, 1, '操作系统OS');
INSERT INTO `tag` VALUES (8, 1, '多线程');

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '连接名称',
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '连接URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '友链表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'qinyiru', '5ed376acc1f8514604f9b5a3812873bb', '/img/avatar/20180414165909.jpg', 'yiru@xx.com', 'Coder', '2020-06-04 16:55:05');
INSERT INTO `user` VALUES (2, 'caroline', '1dfb8155b433154794637d016a62de4b', '/img/avatar/20180414165815.jpg', 'test@dbproj.com', 'dbproject', '2023-06-12 21:46:42');

SET FOREIGN_KEY_CHECKS = 1;
