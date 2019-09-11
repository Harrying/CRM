/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2019-08-11 19:09:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cst_activity
-- ----------------------------
DROP TABLE IF EXISTS `cst_activity`;
CREATE TABLE `cst_activity` (
  `atv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `atv_cust_no` char(50) NOT NULL,
  `atv_cust_name` varchar(100) DEFAULT NULL,
  `atv_place` varchar(200) DEFAULT NULL,
  `atv_title` varchar(500) DEFAULT NULL,
  `atv_desc` varchar(1000) DEFAULT NULL,
  `atv_cust_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`atv_id`),
  KEY `atv_cust_id_for` (`atv_cust_id`),
  CONSTRAINT `atv_cust_id_for` FOREIGN KEY (`atv_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cst_activity
-- ----------------------------
INSERT INTO `cst_activity` VALUES ('1', '1', null, '铁路', '卓火车', '118元', null);
INSERT INTO `cst_activity` VALUES ('2', '1', null, '华北', '吃饭', '200', null);

-- ----------------------------
-- Table structure for cst_customer
-- ----------------------------
DROP TABLE IF EXISTS `cst_customer`;
CREATE TABLE `cst_customer` (
  `cust_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_no` varchar(50) DEFAULT NULL,
  `cust_name` varchar(100) DEFAULT NULL,
  `cust_region` varchar(50) DEFAULT NULL,
  `cust_manager_id` bigint(20) DEFAULT NULL,
  `cust_manager_name` varchar(50) DEFAULT NULL,
  `cust_level` int(11) DEFAULT NULL,
  `cust_level_label` varchar(50) DEFAULT NULL,
  `cust_satisfy` int(11) DEFAULT NULL,
  `cust_credit` int(11) DEFAULT NULL,
  `cust_addr` varchar(300) DEFAULT NULL,
  `cust_zip` char(10) DEFAULT NULL,
  `cust_tel` varchar(50) DEFAULT NULL,
  `cust_fax` varchar(50) DEFAULT NULL,
  `cust_website` varchar(50) DEFAULT NULL,
  `cust_licence_no` varchar(100) DEFAULT NULL,
  `cust_chieftain` varchar(50) DEFAULT NULL,
  `cust_bankroll` float(100,0) DEFAULT NULL,
  `cust_turnover` float(100,0) DEFAULT NULL,
  `cust_bank` varchar(200) DEFAULT NULL,
  `cust_bank_account` varchar(50) DEFAULT NULL,
  `cust_local_tax_no` varchar(50) DEFAULT NULL,
  `cust_national_tax_no` varchar(100) DEFAULT NULL,
  `cust_status` char(2) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `cust_id` (`cust_id`),
  KEY `cust_name` (`cust_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cst_customer
-- ----------------------------
INSERT INTO `cst_customer` VALUES ('1', '1', 'briup', '华北', '4', 'jingli', '0', '大客户', '3', '3', '北京', '226400', '1316038888', '123qwqwq', '129@qq.com', '1234567', 'zhangsan', '20', '30', '工商', '111', '333', '123', '1');
INSERT INTO `cst_customer` VALUES ('2', '2', 'tom', '北京', '5', 'lili', '1', '普通客户', '0', '2', '北京', '226000', '12160388888', '123qwqw', '123@qq.com', null, null, '0', '0', null, null, null, null, '1');
INSERT INTO `cst_customer` VALUES ('3', '3', 'sun', '华北', '5', 'lili', '1', '普通客户', '0', '0', '北京', '226000', '11160388888', '123qwqw', '123@qq.com', null, null, '0', '0', null, null, null, null, '1');
INSERT INTO `cst_customer` VALUES ('4', '4', 'hua', '北京', '4', 'jingli', '0', '大客户', '2', '1', '华北', '226400', '132423432', '56ggsre3', '298@163.com', '3423', 'ls', '30', '20', '农行', '333', '222', '111', '1');
INSERT INTO `cst_customer` VALUES ('5', '5', 'mi', '华北', '4', 'jingli', '1', '重点开发客户', '2', '3', '华北', '229400', '189423432', '56ggsre3', '298@163.com', '3423', 'ls', '30', '20', '农行', '333', '222', '111', '1');
INSERT INTO `cst_customer` VALUES ('6', '6', 'test', '北京', null, 'jingli', '0', '普通客户', '3', '3', '中南', '12845', '12845', '1212qwqa', 'baidu.com', 'fshfja', 'zhangsan', '45', '50', '建设银行', '123456', '789456', '4585', '1');

-- ----------------------------
-- Table structure for cst_linkman
-- ----------------------------
DROP TABLE IF EXISTS `cst_linkman`;
CREATE TABLE `cst_linkman` (
  `lkm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lkm_cust_id` bigint(20) DEFAULT NULL,
  `lkm_cust_no` varchar(50) DEFAULT NULL,
  `lkm_cust_name` varchar(100) DEFAULT NULL,
  `lkm_name` varchar(100) DEFAULT NULL,
  `lkm_sex` varchar(10) DEFAULT NULL,
  `lkm_postion` varchar(100) DEFAULT NULL,
  `lkm_tel` varchar(100) DEFAULT NULL,
  `lkm_mobile` varchar(100) DEFAULT NULL,
  `lkm_memo` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`lkm_id`),
  KEY `lkm_cust_id_for` (`lkm_cust_id`),
  CONSTRAINT `lkm_cust_id_for` FOREIGN KEY (`lkm_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cst_linkman
-- ----------------------------
INSERT INTO `cst_linkman` VALUES ('1', '1', '1', 'briup', 'san', '男', '客服经理', '123456', '234567', '干什么');
INSERT INTO `cst_linkman` VALUES ('2', '1', '1', 'briup', 'san', '男', '客服经理', '123456', '234567', '干啥');
INSERT INTO `cst_linkman` VALUES ('3', '2', '2', 'tom', 'jack', '女', '主管', '0123', '13356845952', '好美丽');
INSERT INTO `cst_linkman` VALUES ('4', '2', '2', 'tom', 'san', '男', '主任', '045678', '183647895', '张三张三');

-- ----------------------------
-- Table structure for cst_log
-- ----------------------------
DROP TABLE IF EXISTS `cst_log`;
CREATE TABLE `cst_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_op` varchar(20) DEFAULT NULL,
  `log_event` varchar(200) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cst_log
-- ----------------------------
INSERT INTO `cst_log` VALUES ('1', 'jingli', '登录了系统', '2017-04-20 15:43:01');
INSERT INTO `cst_log` VALUES ('2', 'jingli', '退出了系统', '2017-04-20 15:44:03');
INSERT INTO `cst_log` VALUES ('3', 'jingli', '登录了系统', '2017-04-20 15:44:06');
INSERT INTO `cst_log` VALUES ('4', 'jingli', '退出了系统', '2017-04-20 15:44:11');
INSERT INTO `cst_log` VALUES ('5', 'zhuguan', '登录了系统', '2017-04-20 15:44:26');
INSERT INTO `cst_log` VALUES ('6', 'zhuguan', '退出了系统', '2017-04-20 15:44:28');
INSERT INTO `cst_log` VALUES ('7', 'gaoguan', '登录了系统', '2017-04-20 15:44:39');
INSERT INTO `cst_log` VALUES ('8', 'gaoguan', '退出了系统', '2017-04-20 15:44:43');
INSERT INTO `cst_log` VALUES ('9', 'guanliyuan', '登录了系统', '2017-04-20 15:44:54');
INSERT INTO `cst_log` VALUES ('10', 'guanliyuan', '退出了系统', '2017-04-20 15:44:56');
INSERT INTO `cst_log` VALUES ('11', 'jingli', '登录了系统', '2017-04-20 15:45:00');
INSERT INTO `cst_log` VALUES ('12', 'jingli', '退出了系统', '2017-04-20 15:45:04');
INSERT INTO `cst_log` VALUES ('13', 'zhuguan', '登录了系统', '2017-04-20 15:45:07');
INSERT INTO `cst_log` VALUES ('14', 'zhuguan', '查询销售机会', '2017-04-20 15:45:09');
INSERT INTO `cst_log` VALUES ('15', 'zhuguan', '创建了一条销售机会', '2017-04-20 15:47:34');
INSERT INTO `cst_log` VALUES ('16', 'zhuguan', '创建了一条销售机会', '2017-04-20 15:49:23');
INSERT INTO `cst_log` VALUES ('17', 'zhuguan', '退出了系统', '2017-04-20 15:49:26');
INSERT INTO `cst_log` VALUES ('18', 'zhuguan', '登录了系统', '2017-04-20 15:49:36');
INSERT INTO `cst_log` VALUES ('19', 'zhuguan', '查询销售机会', '2017-04-20 15:49:38');
INSERT INTO `cst_log` VALUES ('20', 'zhuguan', '客户的计划信托TA数据开始执行', '2017-04-20 15:49:44');
INSERT INTO `cst_log` VALUES ('21', 'zhuguan', '查询销售机会', '2017-04-20 15:49:44');
INSERT INTO `cst_log` VALUES ('22', 'zhuguan', '客户的计划买苹果开始执行', '2017-04-20 15:49:49');
INSERT INTO `cst_log` VALUES ('23', 'zhuguan', '查询销售机会', '2017-04-20 15:49:49');
INSERT INTO `cst_log` VALUES ('24', 'zhuguan', '查询销售机会', '2017-04-20 15:51:21');
INSERT INTO `cst_log` VALUES ('25', 'zhuguan', '创建了一条销售机会', '2017-04-20 15:53:23');
INSERT INTO `cst_log` VALUES ('26', 'zhuguan', '查询销售机会', '2017-04-20 15:53:27');
INSERT INTO `cst_log` VALUES ('27', 'zhuguan', '查询销售机会', '2017-04-20 15:53:59');
INSERT INTO `cst_log` VALUES ('28', 'zhuguan', '客户的计划自然人客户开始执行', '2017-04-20 15:54:09');
INSERT INTO `cst_log` VALUES ('29', 'zhuguan', '查询销售机会', '2017-04-20 15:54:09');
INSERT INTO `cst_log` VALUES ('30', 'zhuguan', '退出了系统', '2017-04-20 15:54:12');
INSERT INTO `cst_log` VALUES ('31', 'jingli', '登录了系统', '2017-04-20 15:54:16');
INSERT INTO `cst_log` VALUES ('32', 'jingli', '退出了系统', '2017-04-20 15:54:32');
INSERT INTO `cst_log` VALUES ('33', 'lili', '登录了系统', '2017-04-20 15:54:38');
INSERT INTO `cst_log` VALUES ('34', 'lili', '退出了系统', '2017-04-20 15:58:57');
INSERT INTO `cst_log` VALUES ('35', 'jingli', '登录了系统', '2017-04-20 15:59:00');
INSERT INTO `cst_log` VALUES ('195', 'guanliyuan', '修改了编号为：\'1\' 的信息', '2018-01-25 22:23:21');
INSERT INTO `cst_log` VALUES ('196', 'guanliyuan', null, '2018-01-25 22:23:29');
INSERT INTO `cst_log` VALUES ('197', 'guanliyuan', '新增了角色,角色名称为\'超管\'', '2019-08-09 16:42:10');
INSERT INTO `cst_log` VALUES ('198', 'guanliyuan', null, '2019-08-09 16:42:30');
INSERT INTO `cst_log` VALUES ('199', 'guanliyuan', '修改了编号为：\'4\' 的信息', '2019-08-09 16:42:43');
INSERT INTO `cst_log` VALUES ('200', 'guanliyuan', '修改了编号为：\'4\' 的信息', '2019-08-11 17:08:04');

-- ----------------------------
-- Table structure for cst_service
-- ----------------------------
DROP TABLE IF EXISTS `cst_service`;
CREATE TABLE `cst_service` (
  `svr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `svr_type` varchar(20) NOT NULL,
  `svr_title` varchar(500) DEFAULT NULL,
  `svr_cust_name` varchar(17) DEFAULT NULL,
  `svr_status` varchar(10) DEFAULT NULL,
  `svr_request` varchar(500) DEFAULT NULL,
  `svr_create_by` varchar(50) DEFAULT NULL,
  `svr_due_to` varchar(50) DEFAULT NULL,
  `svr_deal` varchar(500) DEFAULT NULL,
  `svr_result` varchar(500) DEFAULT NULL,
  `svr_satisfy` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`svr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cst_service
-- ----------------------------
INSERT INTO `cst_service` VALUES ('1', '咨询', '测试', 'tom', '已分配', '测试', 'lili', 'lili', '', '不通过', '0');
INSERT INTO `cst_service` VALUES ('2', '投诉', '售后', 'tom', '已处理', '新买手机一星期就坏了，不要修了，退钱！！！！', 'jingli', 'jingli', '请问出现了什么问题呢？', '不通过', '0');
INSERT INTO `cst_service` VALUES ('3', '咨询', '测试2', 'briup', '已分配', '测试', 'jingli', 'jingli', '', '通过', '0');
INSERT INTO `cst_service` VALUES ('4', '建议', '电子产品便宜点', 'tom', '已处理', '太贵了，买不起', 'lili', 'jingli', '', '通过', '0');
INSERT INTO `cst_service` VALUES ('5', '咨询', '咨询咨询', 'briup', '已归档', '咨询咨询咨询', 'jingli', 'jingli', '问题解决', '已经解决好了', '4');
INSERT INTO `cst_service` VALUES ('6', '咨询', '咨询问题', 'tom', '已归档', '请问有什么问题吗？？？', 'jingli', 'jingli', '有什么问题？', '服务已经的到解决', '5');
INSERT INTO `cst_service` VALUES ('7', '咨询', '咨询很多问题', 'hua', '已分配', '手机多少钱', 'jingli', 'jingli', null, null, null);
INSERT INTO `cst_service` VALUES ('8', '投诉', '苹果电池太坑', 'briup', '新创建', '苹果电池耗电量太大', 'jingli', null, null, null, null);
INSERT INTO `cst_service` VALUES ('9', '咨询', '咨询问题问题', 'sun', '新创建', '我要咨询问题', 'jingli', null, null, null, null);
INSERT INTO `cst_service` VALUES ('10', '投诉', '华为硬件', 'briup', '已归档', '彻查事件', 'jingli', 'jingli', '正常解决', '非常好', '4');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `odr_id` bigint(11) NOT NULL,
  `odr_customer` varchar(200) DEFAULT NULL,
  `odr_addr` varchar(400) DEFAULT NULL,
  `odr_status` char(1) DEFAULT NULL,
  `odr_cust_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`odr_id`),
  KEY `odr_cust_id_for` (`odr_cust_id`),
  CONSTRAINT `odr_cust_id_for` FOREIGN KEY (`odr_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'briup', '北京', '1', '1');

-- ----------------------------
-- Table structure for orders_line
-- ----------------------------
DROP TABLE IF EXISTS `orders_line`;
CREATE TABLE `orders_line` (
  `odd_id` bigint(20) NOT NULL,
  `odd_order_id` bigint(20) DEFAULT NULL,
  `odd_count` int(11) DEFAULT NULL,
  `odd_unit` varchar(20) DEFAULT NULL,
  `odd_price` double DEFAULT NULL,
  `prod_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`odd_id`),
  KEY `FK96A10D0EC60A9F52` (`odd_order_id`),
  KEY `prod_id_for` (`prod_id`),
  CONSTRAINT `FK96A10D0EC60A9F52` FOREIGN KEY (`odd_order_id`) REFERENCES `orders` (`odr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prod_id_for` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_line
-- ----------------------------
INSERT INTO `orders_line` VALUES ('1', '1', '100', '台', '500000', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `prod_id` bigint(20) NOT NULL,
  `prod_name` varchar(400) DEFAULT NULL,
  `prod_type` varchar(200) DEFAULT NULL,
  `prod_batch` varchar(200) DEFAULT NULL,
  `prod_unit` varchar(20) DEFAULT NULL,
  `prod_price` double DEFAULT NULL,
  `prod_memo` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `prod_name` (`prod_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'compu', '通信', '二级/三批次', '台', '5000', '1');
INSERT INTO `product` VALUES ('2', 'briup', '水果', '一级/一批', '斤', '5', '1');

-- ----------------------------
-- Table structure for sal_chance
-- ----------------------------
DROP TABLE IF EXISTS `sal_chance`;
CREATE TABLE `sal_chance` (
  `chc_id` bigint(20) NOT NULL,
  `chc_source` varchar(100) DEFAULT NULL,
  `chc_cust_name` varchar(200) DEFAULT NULL,
  `chc_title` varchar(400) DEFAULT NULL,
  `chc_rate` int(11) DEFAULT NULL,
  `chc_linkman` varchar(100) DEFAULT NULL,
  `chc_tel` varchar(100) DEFAULT NULL,
  `chc_addr` varchar(50) DEFAULT NULL,
  `chc_desc` varchar(4000) DEFAULT NULL,
  `chc_create_by` varchar(100) DEFAULT NULL,
  `chc_due_to` varchar(100) DEFAULT NULL,
  `chc_status` char(10) DEFAULT NULL,
  PRIMARY KEY (`chc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sal_chance
-- ----------------------------
INSERT INTO `sal_chance` VALUES ('1', '内部消息', 'apple', '这个公司需要引进大量手机电池', '45', 'chao', '18988888888', '北京', 'apple企业需要引进手机电池，我们的销售机会很大！！努力将这个客户争取到手。。', 'zhuguan', 'jingli', 'success');
INSERT INTO `sal_chance` VALUES ('2', '介绍', 'zu', '这个企业需要大量手机原件', '0', 'chao', '19833333333', '北京', '我们可以销售出去大量手机原件！！', 'zhuguan', 'jingli', 'success');
INSERT INTO `sal_chance` VALUES ('3', '介绍', 'jin', '自然人客户', '66', 'jing', '17688888888', '北京', '很好', 'zhuguan', 'jingli', 'success');
INSERT INTO `sal_chance` VALUES ('4', 'lu', 'chao', '是不是傻', '100', 'wait', '188999999999', '北京', '活的像一个高仿', 'zhuguan', 'jingli', 'success');
INSERT INTO `sal_chance` VALUES ('5', 'wet', 'sun', '泡脚', '100', 'chao', '18988888888', '北京', '没事就泡脚', 'zhuguan', 'lili', 'success');
INSERT INTO `sal_chance` VALUES ('6', 'sh', 'la', '哈哈哈', '67', 'zhangsan', '7894654654', '中南', '很嗨很哈', 'zhuguan', 'jingli', 'success');
INSERT INTO `sal_chance` VALUES ('7', 'tv', 'zu', '矮', '80', 'chao', '18988888888', '北京', '增高鞋很适合他', 'zhuguan', 'jingli', 'develop');
INSERT INTO `sal_chance` VALUES ('8', 'ptp', 'tom1', '确认', '60', 'yu', '19833333333', '北京', '劳动市场人员需要工作', 'zhuguan', 'jingli', 'develop');
INSERT INTO `sal_chance` VALUES ('9', 'ch', 'zz', '很好', '45', 'good', '7894646513', '中南', '很好', 'zhuguan', 'jingli', 'develop');
INSERT INTO `sal_chance` VALUES ('10', '等哈说', 'zhzh', '很好', '34', 'zz', '456465446', '华北', '对话框撒娇啊快点哈斯卡打算', 'zhuguan', 'jingli', 'success');
INSERT INTO `sal_chance` VALUES ('11', '网上查找', '华为', '针对芯片', '50', '潘广闯', '15738825480', '北京', '发发发', 'zhuguan', null, 'success');
INSERT INTO `sal_chance` VALUES ('12', '朋友介绍', '京东', '物流', '80', '吴思', '125462', '中南', '好机会', 'gaoguan', null, 'success');

-- ----------------------------
-- Table structure for sal_plan
-- ----------------------------
DROP TABLE IF EXISTS `sal_plan`;
CREATE TABLE `sal_plan` (
  `pla_id` bigint(20) NOT NULL,
  `pla_chc_id` bigint(20) DEFAULT NULL,
  `pla_todo` varchar(1000) DEFAULT NULL,
  `pla_result` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pla_id`),
  KEY `FK731E42EACA264737` (`pla_chc_id`),
  CONSTRAINT `FK731E42EACA264737` FOREIGN KEY (`pla_chc_id`) REFERENCES `sal_chance` (`chc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sal_plan
-- ----------------------------
INSERT INTO `sal_plan` VALUES ('1', '1', '请客吃饭', '成功');
INSERT INTO `sal_plan` VALUES ('11', '11', '轻客车翻', '成功');
INSERT INTO `sal_plan` VALUES ('12', '12', '介绍朋友认识', '成功');

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `stk_id` bigint(20) NOT NULL,
  `stk_warehourse` varchar(100) DEFAULT NULL,
  `stk_count` int(11) DEFAULT NULL,
  `stk_memo` varchar(400) DEFAULT NULL,
  `stk_ware` varchar(100) DEFAULT NULL,
  `stk_name` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`stk_id`),
  KEY `skt_product_id_for` (`stk_name`(255)),
  CONSTRAINT `FKBA7BCE5BD622FAAE` FOREIGN KEY (`stk_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES ('1', '1号仓库', '500', '台', 'B13货位', 'compu');
INSERT INTO `storage` VALUES ('2', '3号仓库', '300', '斤', 'A7货位', 'briup');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `role_desc` varchar(100) DEFAULT NULL,
  `role_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '超管', '1');
INSERT INTO `sys_role` VALUES ('2', '高管', '管理员', '1');
INSERT INTO `sys_role` VALUES ('3', '销售主管', '服务分配', '1');
INSERT INTO `sys_role` VALUES ('4', '客户经理', '服务创建1', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `usr_id` bigint(20) NOT NULL,
  `usr_name` varchar(100) DEFAULT NULL,
  `usr_password` varchar(100) DEFAULT NULL,
  `usr_flag` int(11) DEFAULT NULL,
  `usr_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`usr_id`),
  KEY `role_id_for` (`usr_role_id`),
  KEY `usr_name` (`usr_name`),
  CONSTRAINT `role_id_for` FOREIGN KEY (`usr_role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'guanliyuan', '123456', '1', '1');
INSERT INTO `sys_user` VALUES ('2', 'gaoguan', '123456', '1', '2');
INSERT INTO `sys_user` VALUES ('3', 'zhuguan', '123456', '1', '3');
INSERT INTO `sys_user` VALUES ('4', 'jingli', '123456', '1', '4');
INSERT INTO `sys_user` VALUES ('5', 'lili', '123456', '1', '4');
INSERT INTO `sys_user` VALUES ('6', '安安', '123456', '1', '3');
