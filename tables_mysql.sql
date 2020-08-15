/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.94
 Source Server Type    : MySQL
 Source Server Version : 100323
 Source Host           : 192.168.1.94:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 100323
 File Encoding         : 65001

 Date: 15/08/2020 18:20:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('DefaultQuartzScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('DefaultQuartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('DefaultQuartzScheduler', 'DESKTOP-JJR1JUN1597486415378', 1597486827017, 20000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENTID` int(11) NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CSS` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HREF` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` smallint(6) NOT NULL,
  `PERMISSION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, '人事管理', 'fa-users', '', 1, '', 1);
INSERT INTO `sys_permission` VALUES (2, 1, '雇员管理', 'fa-user', '/main/empView', 1, '', 2);
INSERT INTO `sys_permission` VALUES (3, 1, '部门管理', 'fa-wrench', '/main/deptView', 1, '', 3);
INSERT INTO `sys_permission` VALUES (4, 0, '系统管理', 'fa-cog', '', 1, '', 4);
INSERT INTO `sys_permission` VALUES (5, 4, '系统信息', 'fa-eye', '/main/systemInfo', 1, '', 5);
INSERT INTO `sys_permission` VALUES (6, 4, '在线用户', 'fa-reorder', '/main/userOnline', 1, '', 6);
INSERT INTO `sys_permission` VALUES (7, 4, '操作日志', 'fa-tasks', '/main/syslog', 1, '', 7);
INSERT INTO `sys_permission` VALUES (8, 4, '账户管理', 'fa-user-secret', '/main/userView', 1, '', 8);
INSERT INTO `sys_permission` VALUES (9, 0, '业务管理', 'fa-eye', '', 1, '', 9);
INSERT INTO `sys_permission` VALUES (10, 9, '接口swagger', 'fa-file-pdf-o', '/api/swagger-ui.html', 1, '', 10);
INSERT INTO `sys_permission` VALUES (11, 9, '定时任务管理', 'fa-tasks', '/main/jobView', 1, '', 11);
INSERT INTO `sys_permission` VALUES (12, 9, '文件管理', 'fa-folder-open', '/main/fileView', 1, '', 12);
INSERT INTO `sys_permission` VALUES (21, 2, '新增', '', '', 2, 'sys:emp:add', 100);
INSERT INTO `sys_permission` VALUES (22, 2, '删除', '', '', 2, 'sys:emp:del', 100);
INSERT INTO `sys_permission` VALUES (23, 2, '查询', '', '', 2, 'sys:emp:query', 100);
INSERT INTO `sys_permission` VALUES (24, 2, '更新', '', '', 2, 'sys:emp:update', 100);
INSERT INTO `sys_permission` VALUES (25, 2, '导入', '', '', 2, 'sys:emp:import', 100);
INSERT INTO `sys_permission` VALUES (26, 2, '导出', '', '', 2, 'sys:emp:export', 100);
INSERT INTO `sys_permission` VALUES (27, 3, '新增', '', '', 2, 'sys:dept:add', 100);
INSERT INTO `sys_permission` VALUES (28, 3, '删除', '', '', 2, 'sys:dept:del', 100);
INSERT INTO `sys_permission` VALUES (29, 3, '更新', '', '', 2, 'sys:dept:update', 100);
INSERT INTO `sys_permission` VALUES (30, 3, '查询', '', '', 2, 'sys:dept:query', 100);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATETIME` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATETIME` timestamp(0) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ROLE_ADMIN', '管理员', '2017-05-01 13:25:39', '2017-10-05 21:59:18');
INSERT INTO `sys_role` VALUES (2, 'ROLE_USER', '', '2017-08-01 21:47:31', '2017-10-05 21:59:26');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `ROLEID` int(11) NOT NULL,
  `PERMISSIONID` int(11) NOT NULL,
  PRIMARY KEY (`ROLEID`, `PERMISSIONID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (1, 5);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 24);
INSERT INTO `sys_role_permission` VALUES (1, 25);
INSERT INTO `sys_role_permission` VALUES (1, 26);
INSERT INTO `sys_role_permission` VALUES (1, 27);
INSERT INTO `sys_role_permission` VALUES (1, 28);
INSERT INTO `sys_role_permission` VALUES (1, 29);
INSERT INTO `sys_role_permission` VALUES (1, 30);
INSERT INTO `sys_role_permission` VALUES (1, 31);
INSERT INTO `sys_role_permission` VALUES (1, 32);
INSERT INTO `sys_role_permission` VALUES (1, 33);
INSERT INTO `sys_role_permission` VALUES (1, 34);
INSERT INTO `sys_role_permission` VALUES (1, 35);
INSERT INTO `sys_role_permission` VALUES (1, 36);
INSERT INTO `sys_role_permission` VALUES (1, 37);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (2, 1);
INSERT INTO `sys_role_permission` VALUES (2, 2);
INSERT INTO `sys_role_permission` VALUES (2, 3);
INSERT INTO `sys_role_permission` VALUES (2, 4);
INSERT INTO `sys_role_permission` VALUES (2, 6);
INSERT INTO `sys_role_permission` VALUES (2, 7);
INSERT INTO `sys_role_permission` VALUES (2, 8);
INSERT INTO `sys_role_permission` VALUES (2, 9);
INSERT INTO `sys_role_permission` VALUES (2, 10);
INSERT INTO `sys_role_permission` VALUES (2, 11);
INSERT INTO `sys_role_permission` VALUES (2, 12);
INSERT INTO `sys_role_permission` VALUES (2, 13);
INSERT INTO `sys_role_permission` VALUES (2, 14);
INSERT INTO `sys_role_permission` VALUES (2, 15);
INSERT INTO `sys_role_permission` VALUES (2, 16);
INSERT INTO `sys_role_permission` VALUES (2, 17);
INSERT INTO `sys_role_permission` VALUES (2, 18);
INSERT INTO `sys_role_permission` VALUES (2, 19);
INSERT INTO `sys_role_permission` VALUES (2, 20);
INSERT INTO `sys_role_permission` VALUES (2, 21);
INSERT INTO `sys_role_permission` VALUES (2, 22);
INSERT INTO `sys_role_permission` VALUES (2, 23);
INSERT INTO `sys_role_permission` VALUES (2, 24);
INSERT INTO `sys_role_permission` VALUES (2, 25);
INSERT INTO `sys_role_permission` VALUES (2, 30);
INSERT INTO `sys_role_permission` VALUES (2, 31);
INSERT INTO `sys_role_permission` VALUES (2, 34);
INSERT INTO `sys_role_permission` VALUES (2, 36);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `USERID` int(11) NOT NULL,
  `ROLEID` int(11) NOT NULL,
  PRIMARY KEY (`USERID`, `ROLEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NICKNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HEADIMGURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PHONE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TELEPHONE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `SEX` smallint(6) DEFAULT NULL,
  `STATUS` smallint(6) NOT NULL DEFAULT 1,
  `CREATETIME` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATETIME` timestamp(0) NOT NULL,
  `INTRO` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$J.gP5fKIjV0s0tgGZKWvB.BZb0z9K.3rIXK4hbPkt5ay2dP/NTWvO', '管理员', NULL, '13888888888', '', 'admin@zhiming.org', '1998-07-01', 2, 1, '2017-04-10 15:21:38', '2017-07-06 09:20:19', '');
INSERT INTO `sys_user` VALUES (2, 'user', '$2a$10$E5IUEJG9diQSmr7usp5qy.jSLvptTX6mQiKHzfOM.MJd6cGsAoA6m', '用户', NULL, '', '', '', NULL, 1, 1, '2017-08-01 21:47:18', '2017-08-01 21:47:18', NULL);

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, '第一开发部', 'dept01');
INSERT INTO `t_dept` VALUES (2, '第二开发部', 'dept02');
INSERT INTO `t_dept` VALUES (3, '第三开发部', 'dept03');
INSERT INTO `t_dept` VALUES (4, '系统部', 'dept04');
INSERT INTO `t_dept` VALUES (5, '管理部', 'dept05');

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AGE` int(11) NOT NULL,
  `DEPARTMENT` int(11) NOT NULL,
  `SALARY` int(11) DEFAULT NULL,
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `DEPARTMENT`(`DEPARTMENT`) USING BTREE,
  CONSTRAINT `t_emp_ibfk_1` FOREIGN KEY (`DEPARTMENT`) REFERENCES `t_dept` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES (1, '宋江', '北京', 24, 1, 3000, '18604317890');
INSERT INTO `t_emp` VALUES (2, '卢俊义', '吉林', 23, 2, 3500, '18604317891');
INSERT INTO `t_emp` VALUES (3, '吴用', '北京', 33, 1, 3500, '18604317892');
INSERT INTO `t_emp` VALUES (4, '公孙胜', '成都', 30, 1, 4000, '18604317893');
INSERT INTO `t_emp` VALUES (5, '关胜', '成都', 21, 1, 3500, '18604317894');
INSERT INTO `t_emp` VALUES (6, '林冲', '成都', 22, 1, 5000, '18604317895');
INSERT INTO `t_emp` VALUES (8, '呼延灼', '吉林', 27, 1, 4500, '18604317897');
INSERT INTO `t_emp` VALUES (10, '柴进', '成都', 20, 1, 3500, '18604317897');
INSERT INTO `t_emp` VALUES (11, '李应', '吉林', 23, 3, 5000, '18604317900');
INSERT INTO `t_emp` VALUES (12, '朱仝', '北京', 34, 3, 4000, '18604317900');
INSERT INTO `t_emp` VALUES (13, '鲁智深', '成都', 35, 2, 3500, '18604317902');
INSERT INTO `t_emp` VALUES (14, '武松', '上海', 32, 2, 5000, '18604317903');
INSERT INTO `t_emp` VALUES (15, '董平', '成都', 34, 4, 3000, '18604317904');
INSERT INTO `t_emp` VALUES (16, '张清', '成都', 35, 5, 3000, '18604317905');
INSERT INTO `t_emp` VALUES (17, '杨志', '大连', 27, 5, 5000, '18604317906');
INSERT INTO `t_emp` VALUES (18, '徐宁', '吉林', 27, 5, 5000, '18604317907');
INSERT INTO `t_emp` VALUES (19, '索超', '成都', 34, 5, 4000, '18604317908');
INSERT INTO `t_emp` VALUES (20, '戴宗', '吉林', 23, 5, 3000, '18604317909');
INSERT INTO `t_emp` VALUES (21, '刘唐', '北京', 29, 5, 3000, '18604317910');
INSERT INTO `t_emp` VALUES (22, '李逵', '吉林', 35, 3, 3000, '18604317911');
INSERT INTO `t_emp` VALUES (23, '史进', '吉林', 25, 2, 4500, '18604317912');
INSERT INTO `t_emp` VALUES (24, '穆弘', '成都', 28, 2, 4500, '18604317913');
INSERT INTO `t_emp` VALUES (25, '雷横', '吉林', 29, 1, 4500, '18604317914');
INSERT INTO `t_emp` VALUES (26, '李俊', '吉林', 24, 1, 5000, '18604317915');
INSERT INTO `t_emp` VALUES (27, '阮小二', '成都', 26, 1, 5000, '18604317916');
INSERT INTO `t_emp` VALUES (28, '张横', '大连', 30, 1, 4500, '18604317917');
INSERT INTO `t_emp` VALUES (29, '阮小五', '大连', 31, 1, 3500, '18604317918');
INSERT INTO `t_emp` VALUES (30, '张顺', '大连', 23, 1, 4000, '18604317919');
INSERT INTO `t_emp` VALUES (31, '阮小七', '成都', 25, 5, 3500, '18604317920');
INSERT INTO `t_emp` VALUES (32, '杨雄', '北京', 32, 4, 3500, '18604317921');
INSERT INTO `t_emp` VALUES (33, '石秀', '成都', 22, 4, 3500, '18604317922');
INSERT INTO `t_emp` VALUES (34, '解珍', '北京', 22, 4, 4500, '18604317923');
INSERT INTO `t_emp` VALUES (35, '解宝', '大连', 24, 4, 4000, '18604317924');
INSERT INTO `t_emp` VALUES (36, '燕青', '大连', 21, 5, 5000, '18604317925');
INSERT INTO `t_emp` VALUES (37, '朱武', '上海', 21, 5, 3000, '18604317926');
INSERT INTO `t_emp` VALUES (38, '黄信', '大连', 30, 5, 4500, '18604317927');
INSERT INTO `t_emp` VALUES (39, '孙立', '北京', 27, 3, 4000, '18604317928');
INSERT INTO `t_emp` VALUES (40, '宣赞', '成都', 27, 3, 3000, '18604317929');
INSERT INTO `t_emp` VALUES (41, '郝思文', '上海', 26, 3, 4000, '18604317930');
INSERT INTO `t_emp` VALUES (42, '韩滔', '北京', 34, 3, 5000, '18604317931');
INSERT INTO `t_emp` VALUES (43, '彭玘', '大连', 27, 4, 3500, '18604317932');
INSERT INTO `t_emp` VALUES (44, '单廷圭', '北京', 34, 5, 4500, '18604317933');
INSERT INTO `t_emp` VALUES (45, '魏定国', '北京', 30, 5, 5000, '18604317934');
INSERT INTO `t_emp` VALUES (46, '萧让', '吉林', 22, 4, 4000, '18604317935');
INSERT INTO `t_emp` VALUES (47, '裴宣', '吉林', 22, 4, 4000, '18604317936');
INSERT INTO `t_emp` VALUES (48, '欧鹏', '成都', 29, 4, 3000, '18604317937');
INSERT INTO `t_emp` VALUES (49, '邓飞', '大连', 22, 2, 5000, '18604317938');
INSERT INTO `t_emp` VALUES (50, '燕顺', '大连', 22, 2, 4500, '18604317939');
INSERT INTO `t_emp` VALUES (51, '杨林', '北京', 22, 2, 3500, '18604317940');
INSERT INTO `t_emp` VALUES (52, '凌振', '成都', 26, 2, 3000, '18604317941');
INSERT INTO `t_emp` VALUES (53, '蒋敬', '北京', 27, 2, 5000, '18604317942');
INSERT INTO `t_emp` VALUES (54, '吕方', '上海', 20, 2, 3500, '18604317943');
INSERT INTO `t_emp` VALUES (55, '郭盛', '上海', 25, 3, 5000, '18604317944');
INSERT INTO `t_emp` VALUES (56, '道全', '成都', 26, 4, 4500, '18604317945');
INSERT INTO `t_emp` VALUES (57, '皇甫端', '上海', 30, 3, 4000, '18604317946');
INSERT INTO `t_emp` VALUES (58, '王英', '北京', 29, 3, 3000, '18604317947');
INSERT INTO `t_emp` VALUES (59, '扈三娘', '大连', 20, 3, 4000, '18604317948');
INSERT INTO `t_emp` VALUES (60, '鲍旭', '北京', 25, 3, 4500, '18604317949');
INSERT INTO `t_emp` VALUES (61, '樊瑞', '大连', 31, 3, 4000, '18604317950');
INSERT INTO `t_emp` VALUES (62, '孔明', '上海', 21, 3, 3000, '18604317951');
INSERT INTO `t_emp` VALUES (63, '孔亮', '成都', 32, 2, 4000, '18604317952');
INSERT INTO `t_emp` VALUES (64, '项充', '大连', 24, 2, 5000, '18604317953');
INSERT INTO `t_emp` VALUES (65, '李衮', '成都', 33, 2, 3500, '18604317954');
INSERT INTO `t_emp` VALUES (66, '金大坚', '上海', 26, 2, 4500, '18604317955');
INSERT INTO `t_emp` VALUES (67, '马麟', '吉林', 24, 3, 3000, '18604317956');
INSERT INTO `t_emp` VALUES (68, '童威', '吉林', 22, 3, 4500, '18604317957');
INSERT INTO `t_emp` VALUES (69, '童猛', '成都', 29, 3, 5000, '18604317958');
INSERT INTO `t_emp` VALUES (70, '孟康', '大连', 26, 3, 5000, '18604317959');
INSERT INTO `t_emp` VALUES (71, '侯健', '上海', 25, 2, 3500, '18604317960');
INSERT INTO `t_emp` VALUES (72, '陈达', '成都', 33, 2, 4500, '18604317961');
INSERT INTO `t_emp` VALUES (73, '杨春', '大连', 22, 1, 3500, '18604317962');
INSERT INTO `t_emp` VALUES (74, '郑天寿', '大连', 20, 1, 3500, '18604317963');
INSERT INTO `t_emp` VALUES (75, '陶宗旺', '上海', 31, 1, 5000, '18604317964');
INSERT INTO `t_emp` VALUES (76, '宋清', '成都', 25, 1, 4000, '18604317965');
INSERT INTO `t_emp` VALUES (77, '乐和', '上海', 28, 1, 4000, '18604317966');
INSERT INTO `t_emp` VALUES (78, '龚旺', '北京', 20, 1, 4000, '18604317967');
INSERT INTO `t_emp` VALUES (79, '丁得孙', '北京', 28, 3, 5000, '18604317968');
INSERT INTO `t_emp` VALUES (80, '穆春', '大连', 25, 1, 3500, '18604317969');
INSERT INTO `t_emp` VALUES (81, '曹正', '吉林', 30, 5, 3500, '18604317970');
INSERT INTO `t_emp` VALUES (82, '宋万', '大连', 24, 5, 4500, '18604317971');
INSERT INTO `t_emp` VALUES (83, '杜迁', '北京', 34, 5, 5000, '18604317972');
INSERT INTO `t_emp` VALUES (84, '薛永', '北京', 33, 2, 3500, '18604317973');
INSERT INTO `t_emp` VALUES (85, '李忠', '大连', 29, 2, 4500, '18604317974');
INSERT INTO `t_emp` VALUES (86, '周通', '上海', 23, 2, 5000, '18604317975');
INSERT INTO `t_emp` VALUES (87, '汤隆', '成都', 33, 3, 5000, '18604317976');
INSERT INTO `t_emp` VALUES (88, '杜兴', '大连', 32, 3, 4000, '18604317977');
INSERT INTO `t_emp` VALUES (89, '邹渊', '成都', 20, 3, 4500, '18604317978');
INSERT INTO `t_emp` VALUES (90, '邹润', '吉林', 27, 4, 4500, '18604317979');
INSERT INTO `t_emp` VALUES (91, '朱贵', '成都', 34, 4, 3000, '18604317980');
INSERT INTO `t_emp` VALUES (92, '朱富', '上海', 35, 4, 3000, '18604317981');
INSERT INTO `t_emp` VALUES (93, '施恩', '北京', 26, 4, 3500, '18604317982');
INSERT INTO `t_emp` VALUES (94, '蔡福', '吉林', 34, 2, 3500, '18604317983');
INSERT INTO `t_emp` VALUES (95, '蔡庆', '吉林', 22, 2, 4000, '18604317984');
INSERT INTO `t_emp` VALUES (96, '李立', '成都', 20, 2, 3000, '18604317985');
INSERT INTO `t_emp` VALUES (97, '李云', '成都', 33, 1, 4000, '18604317986');
INSERT INTO `t_emp` VALUES (98, '焦挺', '成都', 35, 1, 3500, '18604317987');
INSERT INTO `t_emp` VALUES (99, '石勇', '北京', 28, 1, 4000, '18604317988');
INSERT INTO `t_emp` VALUES (100, '孙新', '成都', 25, 1, 3000, '18604317989');
INSERT INTO `t_emp` VALUES (101, '顾大嫂', '吉林', 27, 1, 4500, '18604317990');
INSERT INTO `t_emp` VALUES (102, '张青', '北京', 33, 1, 3500, '18604317991');
INSERT INTO `t_emp` VALUES (103, '孙二娘', '吉林', 28, 2, 4500, '18604317992');
INSERT INTO `t_emp` VALUES (104, '王定六', '大连', 22, 1, 3000, '18604317993');
INSERT INTO `t_emp` VALUES (105, '郁保四', '上海', 25, 5, 4500, '18604317994');
INSERT INTO `t_emp` VALUES (106, '白胜', '吉林', 20, 5, 3500, '18604317995');
INSERT INTO `t_emp` VALUES (107, '时迁', '吉林', 25, 3, 4500, '18604317996');
INSERT INTO `t_emp` VALUES (108, '段景柱', '上海', 34, 3, 4000, '18604317997');
INSERT INTO `t_emp` VALUES (109, '宋江2', '吉林', 43, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (110, '卢俊义2', '吉林', 42, 1, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (111, '吴用2', '吉林', 41, 1, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (112, '公孙胜2', '北京', 40, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (113, '关胜2', '北京', 39, 1, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (114, '林冲2', '北京', 38, 1, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (115, '林彪', '北京', 23, 2, 100000, '18922239948');
INSERT INTO `t_emp` VALUES (116, 'TOM', 'US', 22, 3, 2000, '12312344422');
INSERT INTO `t_emp` VALUES (117, '宋江3', '吉林', 43, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (118, '张三3', '五道河', 20, 4, 100, '13334567890');
INSERT INTO `t_emp` VALUES (119, '張さん', '日本', 25, 2, 20000, '13334567890');
INSERT INTO `t_emp` VALUES (120, '李さん', '日本', 52, 2, 5000, '13334567890');
INSERT INTO `t_emp` VALUES (121, '王さん', '日本', 25, 2, 855, '13334567890');
INSERT INTO `t_emp` VALUES (122, '宋江2', '吉林１', 43, 1, 40000, '13888888888');
INSERT INTO `t_emp` VALUES (123, '卢俊义2', '吉林', 42, 2, 20000, '13888883343');
INSERT INTO `t_emp` VALUES (124, '吴用2', '吉林', 41, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (125, '宋江2', '吉林１', 43, 1, 40000, '13888888888');
INSERT INTO `t_emp` VALUES (126, '卢俊义2', '吉林', 42, 2, 20000, '13888883343');
INSERT INTO `t_emp` VALUES (127, '吴用2', '吉林', 41, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (128, '公孙胜2', '北京', 40, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (129, '宋江', '吉林１', 42, 1, 40000, '13888888888');

-- ----------------------------
-- Table structure for t_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_file_info`;
CREATE TABLE `t_file_info`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `URL` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SIZE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATETIME` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATETIME` timestamp(0) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_file_info
-- ----------------------------
INSERT INTO `t_file_info` VALUES (1, 'export.ldif', '0a29b3f6-38aa-481d-a299-122ef2fb7357', '1.2KB', 'BIN', '2020-08-15 18:14:46', '2020-08-07 00:56:33');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOBNAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CRON` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SPRINGBEANNAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `METHODNAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATETIME` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATETIME` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `STATUS` smallint(6) NOT NULL DEFAULT 1,
  `ISSYSJOB` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `JOBNAME`(`JOBNAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `SUBJECT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATETIME` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATETIME` timestamp(0) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_mail_to
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_to`;
CREATE TABLE `t_mail_to`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAILID` int(11) NOT NULL,
  `TOUSER` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STATUS` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OPERATION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `COST_TIME` int(11) DEFAULT NULL,
  `METHOD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAMS` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES (1, 'admin', '获取雇员列表', 69, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@3ab38428', '127.0.0.1', '2020-08-15 18:13:45');
INSERT INTO `t_sys_log` VALUES (2, 'admin', '获取在线用户列表', 19, 'org.cloud.point.api.controller.UserController.listUsers()', '  request: org.cloud.point.beans.PaginationRequest@3f0f2de1', '127.0.0.1', '2020-08-15 18:13:53');
INSERT INTO `t_sys_log` VALUES (3, 'admin', '获取用户列表', 13, 'org.cloud.point.api.controller.UserController.listUser()', '  request: org.cloud.point.beans.PaginationRequest@1030e98e', '127.0.0.1', '2020-08-15 18:14:00');
INSERT INTO `t_sys_log` VALUES (4, 'admin', '获取雇员列表', 7, 'org.cloud.point.api.controller.JobController.list()', '  request: org.cloud.point.beans.PaginationRequest@45f4ad95', '127.0.0.1', '2020-08-15 18:14:07');
INSERT INTO `t_sys_log` VALUES (5, 'admin', '获取文件列表', 7, 'org.cloud.point.api.controller.FileController.listFiles()', '  request: org.cloud.point.beans.PaginationRequest@6a477320', '127.0.0.1', '2020-08-15 18:14:09');
INSERT INTO `t_sys_log` VALUES (6, 'admin', '获取文件列表', 2, 'org.cloud.point.api.controller.FileController.listFiles()', '  request: org.cloud.point.beans.PaginationRequest@3993f536', '127.0.0.1', '2020-08-15 18:14:42');
INSERT INTO `t_sys_log` VALUES (7, 'admin', '获取文件列表', 7, 'org.cloud.point.api.controller.FileController.listFiles()', '  request: org.cloud.point.beans.PaginationRequest@4bf2e62', '127.0.0.1', '2020-08-15 18:14:46');
INSERT INTO `t_sys_log` VALUES (8, 'admin', '获取雇员列表', 13, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@783769fe', '127.0.0.1', '2020-08-15 18:15:15');
INSERT INTO `t_sys_log` VALUES (9, 'admin', '获取雇员列表', 10, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@38e44424', '127.0.0.1', '2020-08-15 18:15:16');
INSERT INTO `t_sys_log` VALUES (10, 'admin', '获取雇员列表', 11, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@1b83bc97', '127.0.0.1', '2020-08-15 18:15:17');
INSERT INTO `t_sys_log` VALUES (11, 'admin', '获取雇员列表', 10, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@457f13af', '127.0.0.1', '2020-08-15 18:15:19');
INSERT INTO `t_sys_log` VALUES (12, 'admin', '获取雇员列表', 9, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@74cf722c', '127.0.0.1', '2020-08-15 18:15:19');
INSERT INTO `t_sys_log` VALUES (13, 'admin', '获取雇员列表', 9, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@7a812197', '127.0.0.1', '2020-08-15 18:15:20');
INSERT INTO `t_sys_log` VALUES (14, 'admin', '获取雇员列表', 11, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@922284e', '127.0.0.1', '2020-08-15 18:15:21');
INSERT INTO `t_sys_log` VALUES (15, 'admin', '获取雇员列表', 8, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@5921b6', '127.0.0.1', '2020-08-15 18:15:22');
INSERT INTO `t_sys_log` VALUES (16, 'admin', '获取雇员列表', 9, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@96e95de', '127.0.0.1', '2020-08-15 18:15:22');
INSERT INTO `t_sys_log` VALUES (17, 'admin', '获取雇员列表', 9, 'org.cloud.point.api.controller.EmployeeController.listEmployee()', '  request: org.cloud.point.beans.PaginationRequest@6167f7c5', '127.0.0.1', '2020-08-15 18:15:23');

-- ----------------------------
-- Table structure for t_token
-- ----------------------------
DROP TABLE IF EXISTS `t_token`;
CREATE TABLE `t_token`  (
  `ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VAL` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EXPIRETIME` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATETIME` timestamp(0) NOT NULL,
  `UPDATETIME` timestamp(0) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
