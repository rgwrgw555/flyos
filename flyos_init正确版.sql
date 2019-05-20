SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assets_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产编号',
  `assets_type` tinyint(4) DEFAULT NULL COMMENT '资产类型 1-免费卡、3-月卡、2-储值卡、4-次卡、6-优惠券，5-内部储值',
  `active_time` bigint(20) DEFAULT 0 COMMENT '生效时间 0表示已启用',
  `expire_time` bigint(20) DEFAULT NULL COMMENT '过期时间 0表示无过期时间',
  `level` tinyint(4) DEFAULT NULL COMMENT '级别',
  `assets_state` tinyint(4) DEFAULT NULL COMMENT '资产状态 1-正常，2-无效，3-暂停，4-过期',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `assets_no`(`assets_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for billing_info
-- ----------------------------
DROP TABLE IF EXISTS `billing_info`;
CREATE TABLE `billing_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计费标准编号',
  `param` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for billing_param
-- ----------------------------
DROP TABLE IF EXISTS `billing_param`;
CREATE TABLE `billing_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计费标准编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数名称',
  `pkey` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数键',
  `value` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for billing_rule
-- ----------------------------
DROP TABLE IF EXISTS `billing_rule`;
CREATE TABLE `billing_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_rule_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计费规则编号',
  `billing_rule_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计费规则名称',
  `region_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编号',
  `gate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '出入口编号',
  `expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '条件表达式 内部车，小型车，大型车..',
  `billing_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计费标准编号',
  `cashoff` int(11) DEFAULT NULL COMMENT '现金折扣 范围：0-100 100-没有折扣，0-全免',
  `cardoff` int(11) DEFAULT NULL COMMENT '一卡通折扣 范围：0-10 100-没有折扣，0-全免',
  `memberoff` int(11) DEFAULT NULL COMMENT '会员折扣 范围：0-10 100-没有折扣，0-全免',
  `cycle` tinyint(4) DEFAULT NULL COMMENT '24小时计费方式 1-早上时间开始计算,2-进场时间开始计算',
  `priority` tinyint(4) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar`  (
  `day` date DEFAULT NULL,
  `weekday` int(11) DEFAULT NULL COMMENT '星期几',
  `is_holiday` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否节假日 0-不是，1-是',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for camera_log
-- ----------------------------
DROP TABLE IF EXISTS `camera_log`;
CREATE TABLE `camera_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出入口编号',
  `time` bigint(20) DEFAULT NULL COMMENT '出入时间',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `car_body_size` tinyint(4) DEFAULT NULL COMMENT '车身大小',
  `confidence` decimal(8, 2) DEFAULT NULL COMMENT '识别率',
  `plate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车身图片',
  `car_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车牌图片',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班次号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `camera_carinfo`(`car_plate_no`, `car_plate_color`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for camera_log_his
-- ----------------------------
DROP TABLE IF EXISTS `camera_log_his`;
CREATE TABLE `camera_log_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出入口编号',
  `time` bigint(20) DEFAULT NULL COMMENT '出入时间',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `car_body_size` tinyint(4) DEFAULT NULL COMMENT '车身大小',
  `confidence` decimal(8, 2) DEFAULT NULL COMMENT '识别率',
  `plate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车身图片',
  `car_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车牌图片',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班次号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for car_assets
-- ----------------------------
DROP TABLE IF EXISTS `car_assets`;
CREATE TABLE `car_assets`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `assets_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  `assets_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '资产ID',
  `region_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区域编号',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `owner_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车主姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carassets_carinfo`(`car_plate_no`, `car_plate_color`, `region_no`) USING BTREE,
  INDEX `carassets_no`(`assets_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for car_epay_info
-- ----------------------------
DROP TABLE IF EXISTS `car_epay_info`;
CREATE TABLE `car_epay_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_plate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `bank_type` tinyint(4) DEFAULT NULL COMMENT '银行类型 1:建行，2:招行',
  `auto_pay` tinyint(4) DEFAULT NULL COMMENT '自动扣费 1:支持，0:不支持',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for car_info
-- ----------------------------
DROP TABLE IF EXISTS `car_info`;
CREATE TABLE `car_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` bigint(20) NOT NULL COMMENT '客户号',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) NOT NULL COMMENT '车牌颜色',
  `bind_time` bigint(20) DEFAULT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carinfo_carinfo`(`car_plate_no`, `car_plate_color`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for car_tag
-- ----------------------------
DROP TABLE IF EXISTS `car_tag`;
CREATE TABLE `car_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签编号',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `region_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区域编号',
  `begin_time` bigint(20) DEFAULT NULL COMMENT '生效时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cashier
-- ----------------------------
DROP TABLE IF EXISTS `cashier`;
CREATE TABLE `cashier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员编号',
  `cashier_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员姓名',
  `login_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `cashier_type` tinyint(4) DEFAULT NULL COMMENT '收费员类型 1-岗亭收费员，2-中央收费员，3-管理人员，4-路边收费员，6-巡查人员',
  `cashier_status` tinyint(4) DEFAULT NULL COMMENT '收费员状态 1-正常，2-冻结，9-注销',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cashier_no`(`cashier_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cashier
-- ----------------------------
INSERT INTO `cashier` VALUES (24, '420115200257888888', '管理员', 'admin', '766c32f42272064af1740dd974e3e47e', '', 0, 1);

-- ----------------------------
-- Table structure for cashier_logininfo
-- ----------------------------
DROP TABLE IF EXISTS `cashier_logininfo`;
CREATE TABLE `cashier_logininfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员编号',
  `login_time` bigint(20) DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录ip',
  `login_dev` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录设备',
  `login_status` tinyint(4) DEFAULT NULL COMMENT '登录状态 1-成功，2-失败',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注  失败原因 密码不对/账号不存在,登录名**',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cashier_setting
-- ----------------------------
DROP TABLE IF EXISTS `cashier_setting`;
CREATE TABLE `cashier_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员编号',
  `param_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数名',
  `param_key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '键名',
  `param_value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '键值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cashier_workinfo
-- ----------------------------
DROP TABLE IF EXISTS `cashier_workinfo`;
CREATE TABLE `cashier_workinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员编号',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '批次号',
  `onduty_time` bigint(20) DEFAULT NULL COMMENT '上班时间',
  `offduty_time` bigint(20) DEFAULT NULL COMMENT '下班时间',
  `in_monitor_gate_no` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '进场监控通道',
  `out_monitor_gate_no` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '出场监控通道',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupons_assets_info
-- ----------------------------
DROP TABLE IF EXISTS `coupons_assets_info`;
CREATE TABLE `coupons_assets_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  `coupons_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '优惠券名称',
  `discount_amount` int(11) DEFAULT NULL COMMENT '优惠数量 时长券单位为分钟，金额券单位为分',
  `discount_type` tinyint(4) DEFAULT NULL COMMENT '优惠券类型 1-线下时长券，2-线下金额券，3-线下全免券，4-线上时长券，5-线上金额券,6-线上全免券',
  `issue_type` tinyint(4) DEFAULT NULL COMMENT '发券方 1-云平台,2-运营商,3-停车场,4-商家',
  `min_consumption` int(11) DEFAULT NULL COMMENT '最低消费 达到此数量才能使用优惠，时长券单位为分钟，金额券单位为分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupons_info
-- ----------------------------
DROP TABLE IF EXISTS `coupons_info`;
CREATE TABLE `coupons_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupons_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '优惠券id',
  `coupons_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `coupons_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '优惠券类型 1-线下时长券，2-线下金额券，3-线下全免券，4-线上时长券，5-线上金额券,6-线上全免券',
  `coupons_amount` int(11) NOT NULL DEFAULT 0 COMMENT '优惠数量 时长券单位为分钟，金额券单位为分',
  `min_consumption` int(11) NOT NULL DEFAULT 0 COMMENT '最低消费 达到此数量才能使用优惠，时长券单位为分钟，金额券单位为分',
  `start_time` bigint(20) DEFAULT NULL COMMENT '生效时间',
  `expiry_time` bigint(20) DEFAULT NULL COMMENT '过期时间',
  `coupons_status` int(11) NOT NULL DEFAULT 0 COMMENT '优惠券状态',
  `create_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cust_info
-- ----------------------------
DROP TABLE IF EXISTS `cust_info`;
CREATE TABLE `cust_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` bigint(20) NOT NULL COMMENT '客户号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `gate_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '出入口编号',
  `region_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '区域编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '型号',
  `param` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `device_type` tinyint(4) DEFAULT NULL COMMENT '设备类型 1-相机，2-LED，3-一体机',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for download_record
-- ----------------------------
DROP TABLE IF EXISTS `download_record`;
CREATE TABLE `download_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1-资产变化，2-自助缴费',
  `yunparkid` bigint(20) DEFAULT NULL COMMENT '平台id',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `download_time` bigint(20) DEFAULT NULL COMMENT '下发时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for download_record_his
-- ----------------------------
DROP TABLE IF EXISTS `download_record_his`;
CREATE TABLE `download_record_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1-资产变化，2-自助缴费',
  `yunparkid` bigint(20) DEFAULT NULL COMMENT '关联id',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `download_time` bigint(20) DEFAULT NULL COMMENT '下发时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for elec_assets_info
-- ----------------------------
DROP TABLE IF EXISTS `elec_assets_info`;
CREATE TABLE `elec_assets_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  `balance` decimal(10, 2) DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_log
-- ----------------------------
DROP TABLE IF EXISTS `event_log`;
CREATE TABLE `event_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gate_no` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '通道编号',
  `event_type` tinyint(4) DEFAULT NULL COMMENT '事件类型  1-出入场播报，2-校正车牌，3-出口事件，4-入口事件',
  `event_status` tinyint(4) DEFAULT NULL COMMENT '事件状态 1-未处理，2-已处理',
  `event_param` json COMMENT '参数',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间 事件插入',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间 事件处理时更新',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_log_his
-- ----------------------------
DROP TABLE IF EXISTS `event_log_his`;
CREATE TABLE `event_log_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gate_no` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '通道编号',
  `event_type` tinyint(4) DEFAULT NULL COMMENT '事件类型  1-出入场播报，2-校正车牌，3-出口事件，4-入口事件',
  `event_status` tinyint(4) DEFAULT NULL COMMENT '事件状态 1-未处理，2-已处理',
  `event_param` json COMMENT '参数',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间 事件插入',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间 事件处理时更新',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gate
-- ----------------------------
DROP TABLE IF EXISTS `gate`;
CREATE TABLE `gate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gate_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出入口编号',
  `gate_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `gate_type` tinyint(4) DEFAULT 1 COMMENT '出入口类型 1-入口，2-出口',
  `enter_region_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '入口区域编号',
  `exit_region_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '出口区域编号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gate_no`(`gate_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gate_access_rule
-- ----------------------------
DROP TABLE IF EXISTS `gate_access_rule`;
CREATE TABLE `gate_access_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则编号',
  `rule_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则名称',
  `gate_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出入口编号',
  `expression` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '条件表达式',
  `action` tinyint(4) NOT NULL COMMENT '动作 1-允许, 2-禁止, 3-人工确认',
  `priority` tinyint(4) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gate_access_rule
-- ----------------------------
INSERT INTO `gate_access_rule` VALUES (1, '01', '钻石车进', '4201152002570101', '10', 1, 1);
INSERT INTO `gate_access_rule` VALUES (2, '02', '黑名单', '4201152002570101', '8', 1, 1);
INSERT INTO `gate_access_rule` VALUES (3, '03', '今日限行，双号车牌不允许入场', '4201152002570101', '12', 1, 126);
INSERT INTO `gate_access_rule` VALUES (4, '04', '大型车', '4201152002570101', '4', 1, 125);
INSERT INTO `gate_access_rule` VALUES (6, '05', '临时车', '4201152002570101', '13', 1, 124);
INSERT INTO `gate_access_rule` VALUES (7, '06', '今日限行，单号车牌不允许入场', '4201152002570101', '14', 1, 126);

-- ----------------------------
-- Table structure for gate_log
-- ----------------------------
DROP TABLE IF EXISTS `gate_log`;
CREATE TABLE `gate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  `gate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出入口编号',
  `time` bigint(20) DEFAULT NULL COMMENT '出入时间',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `car_body_size` tinyint(4) DEFAULT NULL COMMENT '车身大小',
  `plate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车身图片',
  `car_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车牌图片',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班次号',
  `seat_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车位号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0-正常, >0-异常 ',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gate_serialno`(`serialno`) USING BTREE,
  INDEX `gate_carinfo`(`car_plate_no`, `car_plate_color`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gate_log_his
-- ----------------------------
DROP TABLE IF EXISTS `gate_log_his`;
CREATE TABLE `gate_log_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  `gate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出入口编号',
  `time` bigint(20) DEFAULT NULL COMMENT '出入时间',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `car_body_size` tinyint(4) DEFAULT NULL COMMENT '车身大小',
  `plate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车身图片',
  `car_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车牌图片',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班次号',
  `seat_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车位号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0-正常, >0-异常 ',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_car_record
-- ----------------------------
DROP TABLE IF EXISTS `group_car_record`;
CREATE TABLE `group_car_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '组id',
  `region_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区域编号',
  `occur_time` bigint(20) DEFAULT NULL COMMENT '时间',
  `car_num` int(11) DEFAULT NULL COMMENT '在场车辆数',
  `car_plate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT 1 COMMENT '车牌颜色',
  `type` int(11) DEFAULT NULL COMMENT '进出类型，1：进出，2：出场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_car_record_his
-- ----------------------------
DROP TABLE IF EXISTS `group_car_record_his`;
CREATE TABLE `group_car_record_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '组id',
  `region_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区域编号',
  `occur_time` bigint(20) DEFAULT NULL COMMENT '时间',
  `car_num` int(11) DEFAULT NULL COMMENT '在场车辆数',
  `car_plate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT 1 COMMENT '车牌颜色',
  `type` int(11) DEFAULT NULL COMMENT '进出类型，1：进出，2：出场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for judge_condition
-- ----------------------------
DROP TABLE IF EXISTS `judge_condition`;
CREATE TABLE `judge_condition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_no` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '条件编号',
  `condition_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '条件名称',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类名',
  `param` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of judge_condition
-- ----------------------------
INSERT INTO `judge_condition` VALUES (1, '1', '小型车', 'SpelCondition', 'car.bodySize == 1');
INSERT INTO `judge_condition` VALUES (2, '2', '大型车', 'SpelCondition', 'car.bodySize == 3');
INSERT INTO `judge_condition` VALUES (3, '3', '蓝牌车', 'SpelCondition', 'car.plateColor == 1');
INSERT INTO `judge_condition` VALUES (4, '4', '黄牌车', 'SpelCondition', 'car.plateColor == 3');
INSERT INTO `judge_condition` VALUES (5, '5', '新能源', 'SpelCondition', 'car.plateColor == 6');
INSERT INTO `judge_condition` VALUES (6, '6', '白牌车', 'SpelCondition', 'car.plateColor == 7');
INSERT INTO `judge_condition` VALUES (7, '7', '外资车', 'SpelCondition', 'car.plateColor == 8');
INSERT INTO `judge_condition` VALUES (8, '8', '黑名单', 'SpelCondition', 'member.tags.![tagNo].contains(\'7\')');
INSERT INTO `judge_condition` VALUES (9, '9', '小区内部住户车辆', 'SpelCondition', 'member.tags.![tagNo].contains(\'1\')');
INSERT INTO `judge_condition` VALUES (10, '10', '钻石车', 'SpelCondition', 'member.assets.![level].contains(5)');
INSERT INTO `judge_condition` VALUES (11, '11', '月卡车', 'SpelCondition', 'member.assets.![assetsType].contains(3)');
INSERT INTO `judge_condition` VALUES (12, '12', '单号', 'EvenOddRestrictConidtion', '1');
INSERT INTO `judge_condition` VALUES (13, '13', '临时车', 'SpelCondition', 'member.assets.isEmpty()');
INSERT INTO `judge_condition` VALUES (14, '14', '双号', 'EvenOddRestrictConidtion', '2');
INSERT INTO `judge_condition` VALUES (15, '15', '停车场月卡', 'SpelCondition', 'member.allAssets.![assetsType].contains(3)');
INSERT INTO `judge_condition` VALUES (16, '16', '同组车满位不让进', 'GroupCarFullCondition', NULL);
INSERT INTO `judge_condition` VALUES (17, '17', '临时车位满不让进', 'TemporaryCarFullCondition', NULL);
INSERT INTO `judge_condition` VALUES (18, '18', '内部车2', 'SpelCondition', 'member.tags.![tagNo].contains(\'5\')');
INSERT INTO `judge_condition` VALUES (19, '19', '内部车', 'SpelCondition', 'member.tags.![tagNo].contains(\'6\')');
insert into `judge_condition` values (20, '20', '免费车', 'SpelCondition', 'member.assets.![assetsType].contains(1)');
-- ----------------------------
-- Table structure for mem_assets
-- ----------------------------
DROP TABLE IF EXISTS `mem_assets`;
CREATE TABLE `mem_assets`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assets_id` bigint(20) DEFAULT NULL COMMENT '资产id',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '客户号',
  `asset_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for month_card_assets_detail
-- ----------------------------
DROP TABLE IF EXISTS `month_card_assets_detail`;
CREATE TABLE `month_card_assets_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  `space_num` int(11) DEFAULT NULL COMMENT '车位数量',
  `group_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `monthassets_no`(`asset_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `amount` decimal(8, 2) DEFAULT NULL COMMENT '金额',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `in_time` bigint(20) DEFAULT NULL COMMENT '进场时间',
  `out_time` bigint(20) DEFAULT NULL COMMENT '出场时间',
  `billing_time` int(11) DEFAULT NULL COMMENT '计费时长',
  `order_status` tinyint(4) DEFAULT NULL COMMENT '订单状态 1-待支付, 2-已支付, 3-已完成',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_uniq_order_no`(`order_no`) USING BTREE,
  INDEX `order_orderno`(`order_no`) USING BTREE,
  INDEX `order_carinfo`(`car_plate_no`, `car_plate_color`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_info_his
-- ----------------------------
DROP TABLE IF EXISTS `order_info_his`;
CREATE TABLE `order_info_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `amount` decimal(8, 2) DEFAULT NULL COMMENT '金额',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `in_time` bigint(20) DEFAULT NULL COMMENT '进场时间',
  `out_time` bigint(20) DEFAULT NULL COMMENT '出场时间',
  `billing_time` int(11) DEFAULT NULL COMMENT '计费时长',
  `order_status` tinyint(4) DEFAULT NULL COMMENT '订单状态 1-待支付, 2-已支付, 3-已完成',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_orderno`(`order_no`) USING BTREE,
  INDEX `order_carinfo`(`car_plate_no`, `car_plate_color`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for park_dict
-- ----------------------------
DROP TABLE IF EXISTS `park_dict`;
CREATE TABLE `park_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名',
  `dict_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键名',
  `dict_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键值',
  `dict_order` tinyint(4) DEFAULT 0 COMMENT '顺序',
  `status` tinyint(4) DEFAULT 0 COMMENT '状态 0-正常, 1-废弃',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_dict_group_key`(`dict_group`, `dict_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 404 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of park_dict
-- ----------------------------
INSERT INTO `park_dict` VALUES (183, 'payflag', '未支付', '0', 1, 0);
INSERT INTO `park_dict` VALUES (184, 'payflag', '现金', '1', 1, 0);
INSERT INTO `park_dict` VALUES (185, 'payflag', '刷卡', '2', 1, 0);
INSERT INTO `park_dict` VALUES (186, 'payflag', '自助缴费', '5', 1, 0);
INSERT INTO `park_dict` VALUES (187, 'payflag', '套餐', '8', 1, 0);
INSERT INTO `park_dict` VALUES (188, 'payflag', '电子支付', '10', 1, 0);
INSERT INTO `park_dict` VALUES (189, 'payflag', '混合支付', '11	', 1, 0);
INSERT INTO `park_dict` VALUES (190, 'payflag', '内部储值', '12', 1, 0);
INSERT INTO `park_dict` VALUES (191, 'payflag', '城市通', '20', 1, 0);
INSERT INTO `park_dict` VALUES (192, 'payflag', '线下券', '14', 1, 0);
INSERT INTO `park_dict` VALUES (193, 'payflag', '线上券', '15', 1, 0);
INSERT INTO `park_dict` VALUES (194, 'carbodysize', '小型车', '1', 1, 0);
INSERT INTO `park_dict` VALUES (195, 'carbodysize', '中型车', '2', 1, 0);
INSERT INTO `park_dict` VALUES (196, 'carbodysize', '大型车', '3', 1, 0);
INSERT INTO `park_dict` VALUES (197, 'carplatecolor', '蓝牌车', '1', 1, 0);
INSERT INTO `park_dict` VALUES (198, 'carplatecolor', '黄牌车', '3', 1, 0);
INSERT INTO `park_dict` VALUES (199, 'carplatecolor', '白牌车', '7', 1, 0);
INSERT INTO `park_dict` VALUES (200, 'carplatecolor', '黑牌车', '8', 1, 0);
INSERT INTO `park_dict` VALUES (201, 'carplatecolor', '绿牌车', '6', 1, 0);
INSERT INTO `park_dict` VALUES (202, 'carplatecolor', '其它', '4', 1, 0);
INSERT INTO `park_dict` VALUES (203, 'usertype', '新能源车', '6', 1, 0);
INSERT INTO `park_dict` VALUES (204, 'usertype', '救护车', '23', 1, 0);
INSERT INTO `park_dict` VALUES (205, 'usertype', '军警车', '22', 1, 0);
INSERT INTO `park_dict` VALUES (206, 'usertype', '普通用户', '1', 1, 0);
INSERT INTO `park_dict` VALUES (207, 'usertype', '分享车', '21', 1, 0);
INSERT INTO `park_dict` VALUES (208, 'usertype', '免费用户', '0', 1, 0);
INSERT INTO `park_dict` VALUES (209, 'usertype', '小区内部用户', '5', 1, 0);
INSERT INTO `park_dict` VALUES (210, 'chargeway', '出口收费出场', '1', 1, 0);
INSERT INTO `park_dict` VALUES (211, 'chargeway', '中央收费出场', '2', 1, 0);
INSERT INTO `park_dict` VALUES (212, 'chargeway', '移动APP收费出场', '3', 1, 0);
INSERT INTO `park_dict` VALUES (213, 'chargeway', '移动PDA收费出场', '4', 1, 0);
INSERT INTO `park_dict` VALUES (214, 'order_status', '下单未付', '1', 1, 0);
INSERT INTO `park_dict` VALUES (215, 'order_status', '已支付', '2', 1, 0);
INSERT INTO `park_dict` VALUES (216, 'order_status', '订单完成', '3', 1, 0);
INSERT INTO `park_dict` VALUES (217, 'fee_type', '按次数计费', '1', 1, 0);
INSERT INTO `park_dict` VALUES (218, 'fee_type', '按计时', '2', 1, 0);
INSERT INTO `park_dict` VALUES (219, 'fee_type', '按时阶梯计费', '3', 1, 0);
INSERT INTO `park_dict` VALUES (220, 'fee_type', '包月（自然月）', '4', 1, 0);
INSERT INTO `park_dict` VALUES (221, 'fee_type', '免费', '8', 1, 0);
INSERT INTO `park_dict` VALUES (222, 'led_company', '信路通', '0', 1, 0);
INSERT INTO `park_dict` VALUES (223, 'led_company', '名望(2行)', '5', 1, 0);
INSERT INTO `park_dict` VALUES (224, 'led_company', '名望(4行)', '3', 1, 0);
INSERT INTO `park_dict` VALUES (225, 'led_company', '红门', '4', 1, 0);
INSERT INTO `park_dict` VALUES (226, 'led_company', '鼎真(485)', '1', 1, 0);
INSERT INTO `park_dict` VALUES (227, 'led_company', '鼎真(一体)', '2', 1, 0);
INSERT INTO `park_dict` VALUES (228, 'led_model', '信路通', 'led-disi', 1, 0);
INSERT INTO `park_dict` VALUES (229, 'led_model', '名望(2行)', 'led-minwang', 1, 0);
INSERT INTO `park_dict` VALUES (230, 'led_model', '名望(4行)', 'led-minwang', 1, 0);
INSERT INTO `park_dict` VALUES (231, 'led_model', '红门', 'led-hm', 1, 0);
INSERT INTO `park_dict` VALUES (232, 'led_model', '鼎真(485)', 'led-dz', 1, 0);
INSERT INTO `park_dict` VALUES (233, 'led_model', '鼎真(一体)', 'led-dz', 1, 0);
INSERT INTO `park_dict` VALUES (234, 'lane_feedback_type', '系统缓慢', '1', 1, 0);
INSERT INTO `park_dict` VALUES (235, 'lane_feedback_type', '系统不稳定', '2', 1, 0);
INSERT INTO `park_dict` VALUES (236, 'lane_feedback_type', '界面设计', '3', 1, 0);
INSERT INTO `park_dict` VALUES (237, 'lane_feedback_type', '系统崩溃', '4', 1, 0);
INSERT INTO `park_dict` VALUES (238, 'lane_feedback_type', '识别率差', '5', 1, 0);
INSERT INTO `park_dict` VALUES (239, 'lane_feedback_type', '其他', '6', 1, 0);
INSERT INTO `park_dict` VALUES (240, 'gate_type', '入口', '1', 1, 0);
INSERT INTO `park_dict` VALUES (241, 'gate_type', '出口', '2', 1, 0);
INSERT INTO `park_dict` VALUES (242, 'feedback_status', '未处理', '1', 1, 0);
INSERT INTO `park_dict` VALUES (243, 'feedback_status', '处理中', '2', 1, 0);
INSERT INTO `park_dict` VALUES (244, 'feedback_status', '已处理', '4', 1, 0);
INSERT INTO `park_dict` VALUES (245, 'feedback_status', '无效反馈', '5', 1, 0);
INSERT INTO `park_dict` VALUES (259, 'outoperate_free_subtype', '物业车', '41', 1, 0);
INSERT INTO `park_dict` VALUES (260, 'outoperate_free_subtype', '物业班车', '42', 1, 0);
INSERT INTO `park_dict` VALUES (261, 'outoperate_free_subtype', '运钞车', '43', 1, 0);
INSERT INTO `park_dict` VALUES (262, 'outoperate_free_subtype', '邮政车', '44', 1, 0);
INSERT INTO `park_dict` VALUES (263, 'outoperate_free_subtype', '救护车', '45', 1, 0);
INSERT INTO `park_dict` VALUES (264, 'outoperate_free_subtype', 'VIP车', '46', 1, 0);
INSERT INTO `park_dict` VALUES (265, 'outoperate_free_subtype', '垃圾车', '47', 1, 0);
INSERT INTO `park_dict` VALUES (266, 'outoperate_free_subtype', '电力维修车', '48', 1, 0);
INSERT INTO `park_dict` VALUES (267, 'outoperate_free_subtype', '其他特殊车', '49', 1, 0);
INSERT INTO `park_dict` VALUES (268, 'outoperate_free_subtype', '领导车', '50', 1, 0);
INSERT INTO `park_dict` VALUES (269, 'cycle', '早上开始时间 到 第二天早上开始时间为一天', '1', 1, 0);
INSERT INTO `park_dict` VALUES (270, 'cycle', '车辆进场时间 - 进场24小时后为一天', '2', 1, 0);
INSERT INTO `park_dict` VALUES (271, 'card_type', '月卡', '1', 1, 0);
INSERT INTO `park_dict` VALUES (272, 'card_type', '季卡', '2', 1, 0);
INSERT INTO `park_dict` VALUES (273, 'card_type', '半年卡', '3', 1, 0);
INSERT INTO `park_dict` VALUES (274, 'card_type', '年卡', '4', 1, 0);
INSERT INTO `park_dict` VALUES (275, 'card_type', '其他卡', '5', 1, 0);
INSERT INTO `park_dict` VALUES (276, 'camera_company', '信路通', '0', 1, 0);
INSERT INTO `park_dict` VALUES (277, 'camera_company', '华夏智芯', '4', 1, 0);
INSERT INTO `park_dict` VALUES (278, 'camera_company', '臻识', '6', 1, 0);
INSERT INTO `park_dict` VALUES (279, 'camera_company', '科达', '7', 1, 0);
INSERT INTO `park_dict` VALUES (280, 'camera_model', '信路通', 'camera-xlt', 1, 0);
INSERT INTO `park_dict` VALUES (281, 'camera_model', '华夏智芯', 'camera-hxzx', 1, 0);
INSERT INTO `park_dict` VALUES (282, 'camera_model', '臻识', 'camera-zs', 1, 0);
INSERT INTO `park_dict` VALUES (283, 'camera_model', '科达', 'camera-keda', 1, 0);
INSERT INTO `park_dict` VALUES (284, 'assets_type', '免费卡', '1', 1, 0);
INSERT INTO `park_dict` VALUES (285, 'assets_type', '月卡', '3', 1, 0);
INSERT INTO `park_dict` VALUES (286, 'assets_type', '储值卡', '2', 1, 0);
INSERT INTO `park_dict` VALUES (287, 'assets_type', '次卡', '4', 1, 0);
INSERT INTO `park_dict` VALUES (288, 'assets_type', '优惠券', '6', 1, 0);
INSERT INTO `park_dict` VALUES (289, 'assets_type', '内部储值', '5', 1, 0);
INSERT INTO `park_dict` VALUES (290, 'syncmember', '下发', '1', 1, 0);
INSERT INTO `park_dict` VALUES (291, 'syncmember', '不下发', '2', 1, 0);
INSERT INTO `park_dict` VALUES (292, 'opt_type', '入场抬杆', '1', 1, 0);
INSERT INTO `park_dict` VALUES (293, 'opt_type', '收费抬杆', '2', 1, 0);
INSERT INTO `park_dict` VALUES (294, 'opt_type', '人工确认', '3', 1, 0);
INSERT INTO `park_dict` VALUES (295, 'opt_type', '人工拒绝', '4', 1, 0);
INSERT INTO `park_dict` VALUES (296, 'opt_type', '异常出场', '5', 1, 0);
INSERT INTO `park_dict` VALUES (297, 'opt_type', '切换监控区域', '6', 1, 0);
INSERT INTO `park_dict` VALUES (298, 'opt_type', '切换统计区域', '7', 1, 0);
INSERT INTO `park_dict` VALUES (299, 'opt_type', '无人值守切换班次', '8', 1, 0);
INSERT INTO `park_dict` VALUES (300, 'opt_type', '进入无人值守模式', '9', 1, 0);
INSERT INTO `park_dict` VALUES (301, 'opt_type', '退出无人值守模式', '10', 1, 0);
INSERT INTO `park_dict` VALUES (302, 'opt_type', '车牌校正', '11', 1, 0);
INSERT INTO `park_dict` VALUES (303, 'opt_type', '系统参数修改', '12', 1, 0);
INSERT INTO `park_dict` VALUES (304, 'opt_type', '修改金额', '13', 1, 0);
INSERT INTO `park_dict` VALUES (305, 'opt_type', '修改密码', '14', 1, 0);
INSERT INTO `park_dict` VALUES (310, 'assets_state', '正常', '1', 1, 0);
INSERT INTO `park_dict` VALUES (311, 'assets_state', '无效', '2', 1, 0);
INSERT INTO `park_dict` VALUES (312, 'assets_state', '暂停', '3', 1, 0);
INSERT INTO `park_dict` VALUES (313, 'assets_state', '过期', '4', 1, 0);
INSERT INTO `park_dict` VALUES (317, 'assets_order', '月卡', '3', 10, 0);
INSERT INTO `park_dict` VALUES (318, 'assets_order', '免费车', '1', 11, 0);
INSERT INTO `park_dict` VALUES (319, 'assets_order', '储值车', '2', 5, 0);
INSERT INTO `park_dict` VALUES (320, 'assets_order', '内部储值车', '5', 6, 0);
INSERT INTO `park_dict` VALUES (321, 'assets_order', '优惠券', '6', 8, 0);
INSERT INTO `park_dict` VALUES (322, 'assets_order', '次卡', '4', 9, 0);
INSERT INTO `park_dict` VALUES (323, 'cashier_status', '正常', '1', 6, 0);
INSERT INTO `park_dict` VALUES (324, 'cashier_status', '冻结', '2', 8, 0);
INSERT INTO `park_dict` VALUES (325, 'cashier_status', '注销', '9', 9, 0);
INSERT INTO `park_dict` VALUES (326, 'cashier_type', '岗亭收费员', '1', 1, 0);
INSERT INTO `park_dict` VALUES (327, 'cashier_type', '中央收费员', '2', 1, 0);
INSERT INTO `park_dict` VALUES (328, 'cashier_type', '管理人员', '3', 1, 0);
INSERT INTO `park_dict` VALUES (329, 'cashier_type', '路边收费员', '4', 1, 0);
INSERT INTO `park_dict` VALUES (330, 'cashier_type', '巡查人员', '6', 1, 0);
INSERT INTO `park_dict` VALUES (331, 'device_type', '相机', '1', 1, 0);
INSERT INTO `park_dict` VALUES (332, 'device_type', 'LED', '2', 1, 0);
INSERT INTO `park_dict` VALUES (333, 'device_type', '一体机', '3', 1, 0);
INSERT INTO `park_dict` VALUES (334, 'odd_and_even_rule_type', '尾号为英文字母的机动车，按字母前的最后一位阿拉伯数字为准', '1', 1, 0);
INSERT INTO `park_dict` VALUES (335, 'odd_and_even_rule_type', '尾号为英文字母的按0管理', '3', 2, 0);
INSERT INTO `park_dict` VALUES (336, 'odd_and_even_rule_type', '尾号为英文字母的机动车按双号管理', '4', 3, 0);
INSERT INTO `park_dict` VALUES (337, 'odd_and_even_rule_type', '前13个字母从A到M算单号，后13个从N到Z算双号', '5', 4, 0);
INSERT INTO `park_dict` VALUES (338, 'odd_and_even_rule_type', '根据车牌最后一个阿拉伯数字实行轮流限行', '6', 5, 0);
INSERT INTO `park_dict` VALUES (339, 'member_level', '注册', '1', 1, 0);
INSERT INTO `park_dict` VALUES (340, 'member_level', '铜牌', '2', 1, 0);
INSERT INTO `park_dict` VALUES (341, 'member_level', '银牌', '3', 1, 0);
INSERT INTO `park_dict` VALUES (342, 'member_level', '金牌', '4', 1, 0);
INSERT INTO `park_dict` VALUES (343, 'member_level', '钻石', '5', 1, 0);
INSERT INTO `park_dict` VALUES (347, 'pic_compress_type', '外部程序压缩', '1', 1, 0);
INSERT INTO `park_dict` VALUES (348, 'pic_compress_type', '自处理', '2', 1, 0);
INSERT INTO `park_dict` VALUES (349, 'pic_compress_type', '线下时长券', '1', 1, 0);
INSERT INTO `park_dict` VALUES (355, 'cancel_out_operate', '车辆不出场', '22', 1, 0);
INSERT INTO `park_dict` VALUES (356, 'cancel_out_operate', '不是车牌号', '23', 1, 0);
INSERT INTO `park_dict` VALUES (357, 'cancel_out_operate', '误操作收费抬杠按钮', '24', 1, 0);
INSERT INTO `park_dict` VALUES (358, 'cancel_out_operate', '重复出场车辆', '21', 1, 0);
INSERT INTO `park_dict` VALUES (369, 'outoperate', '未正常抬杆', '33', 1, 0);
INSERT INTO `park_dict` VALUES (370, 'outoperate', '不是汽车', '31', 1, 0);
INSERT INTO `park_dict` VALUES (371, 'outoperate', '免费放行(救护车等)', '32', 1, 0);
INSERT INTO `park_dict` VALUES (372, 'change_chargeamt', '月卡未生效', '61', 1, 0);
INSERT INTO `park_dict` VALUES (374, 'change_chargeamt', '入场时间有误', '12', 1, 0);
INSERT INTO `park_dict` VALUES (375, 'change_chargeamt', '未找到入场记录', '13', 1, 0);
INSERT INTO `park_dict` VALUES (376, 'change_chargeamt', '会员过期', '11', 1, 0);
INSERT INTO `park_dict` VALUES (377, 'change_chargeamt', '免费放行', '14', 1, 0);
INSERT INTO `park_dict` VALUES (378, 'coupon_type', '线下时长券', '1', 1, 0);
INSERT INTO `park_dict` VALUES (379, 'coupon_type', '线下金额券', '2', 1, 0);
INSERT INTO `park_dict` VALUES (380, 'coupon_type', '线下全免券', '3', 1, 0);
INSERT INTO `park_dict` VALUES (381, 'coupon_type', '线上时长券', '4', 1, 0);
INSERT INTO `park_dict` VALUES (382, 'coupon_type', '线上金额券', '5', 1, 0);
INSERT INTO `park_dict` VALUES (383, 'coupon_type', '线上全免券', '6', 1, 0);
INSERT INTO `park_dict` VALUES (394, 'citycard_type', '武汉', '1', 1, 0);
INSERT INTO `park_dict` VALUES (395, 'citycard_type', '苏州', '2', 1, 0);
INSERT INTO `park_dict` VALUES (396, 'citycard_type', '北京', '3', 1, 0);
INSERT INTO `park_dict` VALUES (398, 'msmc_fee_type', '先出缴费', '1', 1, 0);
INSERT INTO `park_dict` VALUES (399, 'msmc_fee_type', '后进缴费', '2', 1, 0);
INSERT INTO `park_dict` VALUES (400, 'yzy_fee_type', '区域合并计费', '1', 1, 0);
INSERT INTO `park_dict` VALUES (401, 'yzy_fee_type', '区域分开计费', '2', 1, 0);
INSERT INTO `park_dict` VALUES (403, 'payflag', '银行卡', '13', 1, 0);

-- ----------------------------
-- Table structure for park_info
-- ----------------------------
DROP TABLE IF EXISTS `park_info`;
CREATE TABLE `park_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `park_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '停车场编号',
  `park_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `agent_id` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营商id',
  `agent_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '运营商名称',
  `longitude` float(20, 6) DEFAULT NULL COMMENT '经度',
  `latitude` float(20, 6) DEFAULT NULL COMMENT '纬度',
  `district` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地区',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'logo地址',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_uniq_park_code`(`park_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of park_info
-- ----------------------------
INSERT INTO `park_info` VALUES (12, '110228200035', 'fly停车场', '110228', '', 114298776.000000, 30584288.000000, NULL, '21313123123', NULL, '21333', 20180614154946, 20180614154946);

-- ----------------------------
-- Table structure for park_param
-- ----------------------------
DROP TABLE IF EXISTS `park_param`;
CREATE TABLE `park_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '区域编号',
  `gate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '出入口编号',
  `park_param_group` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数组名',
  `park_param_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名称',
  `park_param_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数键',
  `park_param_value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数值',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_group_key`(`park_param_group`, `park_param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of park_param
-- ----------------------------
INSERT INTO `park_param` VALUES (78, '', '', 'flyos_version', '版本信息', 'flyos_version', 'flyos_v2.2.8.4', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (79, '', '', 'reenter_interval_time', '重复入场间隔时间', 'reenter_interval_time', '122', 20180606084801, 20180619141231);
INSERT INTO `park_param` VALUES (80, '', '', 'sys_setting', '启用虚拟键盘', 'enable_virtual_keyboard', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (81, '', '', 'sys_setting', '启用无人值守', 'enable_self_help_box', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (82, '', '', 'sys_setting', '启用黑名单', 'enable_blacklist', '1', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (83, '', '', 'sys_setting', '入场播报会员备注', 'broadcast_member_remark', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (84, '', '', 'sys_setting', '白牌车收费', 'white_plate_car_charge', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (87, '', '', 'sync_member', '是否同步套餐会员', 'sync_park_member', '1', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (88, '', '', 'sync_member', '是否同步停哪儿会员', 'sync_tnar_member', '1', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (89, '', '', 'sys_setting', '启用城市通', 'enable_citycard', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (90, '', '', 'paid_park_time', '缴费后离场时间', 'paid_park_time', '15', 20180606084801, 20180619141231);
INSERT INTO `park_param` VALUES (91, '', '', 'access_confirm', '弹框确认准入', 'access_confirm', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (92, '', '', 'sys_setting', '出口异常语音播报', 'exit_except_voice_broadcast', '请稍后，正在人工确认', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (93, '', '', 'month_card_remind_time', '月卡临期可用天数播报时间(天)', 'month_card_remain_day', '30', 20180606084801, 20180619141231);
INSERT INTO `park_param` VALUES (94, '', '', 'month_card_remind_time', '月卡临期可用天数播报语音', 'month_card_remain_day_voice', '可用天数%d天', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (95, '', '', 'month_card_remind_time', '月卡临近过期提醒播报时间(天)', 'month_card_almost_overdue', '1', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (96, '', '', 'month_card_remind_time', '月卡临近过期提醒播报语音', 'month_card_almost_overdue_voice', '可用天数%d天，请及时续费', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (97, '', '', 'month_card_remind_time', '月卡过期播报时间(天)', 'month_card_overdue_time', '1', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (98, '', '', 'month_card_remind_time', '月卡过期播报语音', 'month_card_overdue_voice', '已过期，请及时续费', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (99, '', '', 'sys_setting', '多卡多车计费模式', 'msmc_fee_type', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (100, '', '', 'sys_setting', '园中园计费模式', 'yzy_fee_type', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (101, '', '', 'sys_setting', '单双限行模式', 'odd_and_even_rule_type', '1', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (102, '', '', 'sys_setting', '无人值守自动切换班次', 'self_help_modle_auto_batch', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (103, '', '', 'sys_setting', '剩余车位数经验值', 'free_count', '0', 20180606084801, 20180615173015);
INSERT INTO `park_param` VALUES (104, '', '', 'sys_setting', '数据迁移到历史时间(天)', 'data_move2his_time', '3', 20180606084802, 20180606084802);
INSERT INTO `park_param` VALUES (105, '', '', 'sys_setting', '客服电话', 'service_tel', '4008610510', 20180606084802, 20180606084802);
INSERT INTO `park_param` VALUES (106, '', '', 'sys_setting', '是否同步图片', 'upload_pic', '1', 20180606084802, 20180606084802);
INSERT INTO `park_param` VALUES (107, '', '', 'sys_setting', '图片压缩方式', 'pic_compress_type', '1', 20180606084802, 20180606084802);
INSERT INTO `park_param` VALUES (108, '', '', 'sys_setting', '有效月卡未找到入场记录自动放行', 'valid_month_card_auto_allow', '1', 20180606084802, 20180606084802);
INSERT INTO `park_param` VALUES (115, '', '', 'sys_setting', '默认车牌首字', 'default_car_plate_prefix', '鄂', 20180606084802, 20180619141231);
INSERT INTO `park_param` VALUES (116, '', '', 'sys_setting', 'LED显示(停车场名称)', 'led_park_name', '停车场', 20180606084802, 20180619141231);
INSERT INTO `park_param` VALUES (117, '', '', 'sys_setting', '默认临时车牌类型', 'defaul_temporary_car_type', '蓝牌车', 20180606084802, 20180619141231);
INSERT INTO `park_param` VALUES (118, '', '', 'sys_setting', '盘存周期', 'inventory_cycle', '2', 20180606084802, 20180619141231);
INSERT INTO `park_param` VALUES (120, '', '', 'sys_setting', '启用区域会员', 'enable_area_member', '006', 20180606084802, 20180619141231);
INSERT INTO `park_param` VALUES (123, '', '', 'sys_setting', '启用线下优惠券', 'enable_offline_coupon', '0', 20180606084802, 20180619141231);
INSERT INTO `park_param` VALUES (124, '', '', 'sys_setting', '启用同组车', 'enable_group_car', '0', 20180606084801, 20180619141231);
INSERT INTO `park_param` VALUES (125, '', '', 'sys_setting', '无人值守异常自动放行', 'except_auto_allow', '0', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (126, '', '', 'sys_setting', '大图片存放路径', 'car_body_picture_store_path', '/fly/flyos/device/flyos_images', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (127, '', '', 'sys_setting', '小图片存放路径', 'car_plate_picture_store_path', '/fly/flyos/device/flyos_images', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (128, '', '', 'cashier', '收费员监控区域', 'statistics_region_110228200035000001', '', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (130, '', '', 'sys_setting', '地面入口', 'access_ground_entrance', '', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (131, '', '', 'sys_setting', '地面出口', 'access_ground_exit', '', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (132, '', '', 'sys_setting', '播放空闲LED', 'broadcast_leisureLED', '003', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (133, '', '', 'sys_setting', '诱导屏显示', 'guide_screen_show', '', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (134, '', '', 'month_card_almost_overdue', '月卡车即将到期播报(天)', 'month_card_almost_overdue', '', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (135, '', '', 'sys_setting', '播放车位数屏幕间隔时间(分)', 'broadcast_carport_screen_interval', '', 20180614170536, 20180619141231);
INSERT INTO `park_param` VALUES (136, '', '', 'cashier', '收费员监控区域', 'statistics_region_420115200257888888', '', 20180614170915, 20180615101450);
INSERT INTO `park_param` VALUES (137, '', '', 'cashier', '收费员监控进口', 'statistics_entrance_110228200035000001', '', 20180614171015, 20180614184901);
INSERT INTO `park_param` VALUES (138, '', '', 'cashier', '收费员监控区域', 'statistics_region_110228200035000002', '', 20180614175648, 20180614184810);
INSERT INTO `park_param` VALUES (139, '', '', 'cashier', '收费员监控出口', 'statistics_exit_110228200035000001', '', 20180614184340, 20180614184901);
INSERT INTO `park_param` VALUES (140, '', '', 'sys_setting', '启用园中园', 'enable_yzy', '0', 20180606084801, 20180622101737);
INSERT INTO `park_param` VALUES (141, '', '', 'sys_setting', '补录记录前一园区时间占比', 'ratio', '0.5', 20180606084801, 20180606084801);
INSERT INTO `park_param` VALUES (142, '', '', 'sys_setting', '无感支付银行类型', 'epay_bank_type', '1', 20180606084802, 20180606084802);

-- ----------------------------
-- Table structure for park_record_info
-- ----------------------------
DROP TABLE IF EXISTS `park_record_info`;
CREATE TABLE `park_record_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班次号',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收费员编号',
  `car_plate_color` tinyint(4) NOT NULL DEFAULT 1 COMMENT '车牌颜色',
  `car_body_size` tinyint(4) NOT NULL DEFAULT 1 COMMENT '车身大小',
  `ingate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入口编号',
  `inregion_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入口区域',
  `intime` bigint(20) NOT NULL DEFAULT 0 COMMENT '入场时间',
  `inplate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入场车身图片',
  `incar_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入场车牌图片',
  `outgate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出口编号',
  `outregion_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出口区域',
  `outtime` bigint(20) NOT NULL DEFAULT 0 COMMENT '出场时间',
  `member_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '会员类型',
  `outplate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出场车身图片',
  `outcar_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出场车牌图片',
  `seat_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车位号',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态  0-正常, >0-异常 ',
  `park_amt` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '停车费用',
  `cash_amt` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '现金金额',
  `pay_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付方式',
  `relate_park_log_serialno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联流水，园中园',
  `create_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `coupon_amt` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `outbatch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出场班次号',
  `self_pay_amt` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '停车费用',
  `free_start_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '免费起始时间',
  `free_end_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '免费结束时间',
  `presence_car` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '在场车',
  `group_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '同组车id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `record_serialno`(`serialno`) USING BTREE,
  INDEX `record_carinfo`(`car_plate_no`, `car_plate_color`) USING BTREE,
  INDEX `record_cashier`(`cashier_no`) USING BTREE,
  INDEX `record_bobao`(`ingate_no`, `outgate_no`, `update_time`) USING BTREE,
  INDEX `record_pmin`(`intime`, `update_time`) USING BTREE,
  INDEX `record_pmout`(`outtime`, `update_time`) USING BTREE,
  INDEX `idx_update_time`(`update_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for park_record_info_his
-- ----------------------------
DROP TABLE IF EXISTS `park_record_info_his`;
CREATE TABLE `park_record_info_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  `batch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班次号',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收费员编号',
  `car_plate_color` tinyint(4) NOT NULL DEFAULT 1 COMMENT '车牌颜色',
  `car_body_size` tinyint(4) NOT NULL DEFAULT 1 COMMENT '车身大小',
  `ingate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入口编号',
  `inregion_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入口区域',
  `intime` bigint(20) NOT NULL DEFAULT 0 COMMENT '入场时间',
  `inplate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入场车身图片',
  `incar_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入场车牌图片',
  `outgate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出口编号',
  `outregion_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出口区域',
  `outtime` bigint(20) NOT NULL DEFAULT 0 COMMENT '出场时间',
  `member_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '会员类型',
  `outplate_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出场车身图片',
  `outcar_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出场车牌图片',
  `seat_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车位号',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态  0-正常, >0-异常 ',
  `park_amt` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '停车费用',
  `cash_amt` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '现金金额',
  `pay_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付方式',
  `relate_park_log_serialno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联流水，园中园',
  `create_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `coupon_amt` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `outbatch_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出场班次号',
  `self_pay_amt` decimal(8, 2) NOT NULL DEFAULT 0.00,
  `free_start_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '免费起始时间',
  `free_end_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '免费结束时间',
  `presence_car` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '在场车',
  `group_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '同组车id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hisrecord_serialno`(`serialno`) USING BTREE,
  INDEX `hisrecord_carinfo`(`car_plate_no`, `car_plate_color`) USING BTREE,
  INDEX `hisrecord_cashier`(`cashier_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_order_log
-- ----------------------------
DROP TABLE IF EXISTS `parking_order_log`;
CREATE TABLE `parking_order_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `serialno` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_serialno`(`serialno`) USING BTREE,
  INDEX `idx_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_order_log_his
-- ----------------------------
DROP TABLE IF EXISTS `parking_order_log_his`;
CREATE TABLE `parking_order_log_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `serialno` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_uniq_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易号',
  `amount` decimal(8, 2) DEFAULT NULL COMMENT '支付金额',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付方式',
  `pay_time` bigint(20) DEFAULT NULL COMMENT '支付时间',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员编号',
  `assets_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `payment_order_no`(`order_no`) USING BTREE,
  INDEX `payment_cashier`(`cashier_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `payment_detail`;
CREATE TABLE `payment_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '键',
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment_his
-- ----------------------------
DROP TABLE IF EXISTS `payment_his`;
CREATE TABLE `payment_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易号',
  `amount` decimal(8, 2) DEFAULT NULL COMMENT '支付金额',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付方式',
  `pay_time` bigint(20) DEFAULT NULL COMMENT '支付时间',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `assets_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hispayment_order_no`(`order_no`) USING BTREE,
  INDEX `hispayment_cashier`(`cashier_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payperuse_card_assets_info
-- ----------------------------
DROP TABLE IF EXISTS `payperuse_card_assets_info`;
CREATE TABLE `payperuse_card_assets_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资产编号',
  `remain_times` int(11) DEFAULT NULL COMMENT '剩余次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pic_upload
-- ----------------------------
DROP TABLE IF EXISTS `pic_upload`;
CREATE TABLE `pic_upload`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  `pic_type` tinyint(4) DEFAULT NULL COMMENT '图片类型 1-入场车牌图片，2-入场车身图片，3-出场车牌图片，4-出场车身图片',
  `pic_org_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片本地地址',
  `pic_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片云地址',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pic_upload_his
-- ----------------------------
DROP TABLE IF EXISTS `pic_upload_his`;
CREATE TABLE `pic_upload_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流水号',
  `pic_type` tinyint(4) DEFAULT NULL COMMENT '图片类型 1-入场车牌图片，2-入场车身图片，3-出场车牌图片，4-出场车身图片',
  `pic_org_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片本地地址',
  `pic_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片云地址',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plate_contrast
-- ----------------------------
DROP TABLE IF EXISTS `plate_contrast`;
CREATE TABLE `plate_contrast`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员编号',
  `contrast_time` bigint(20) DEFAULT NULL COMMENT '校正时间',
  `car_plate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `contrast_car_plate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '校正后车牌号',
  `contrast_car_plate_color` tinyint(4) DEFAULT NULL COMMENT '校正后车牌颜色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plate_contrast_his
-- ----------------------------
DROP TABLE IF EXISTS `plate_contrast_his`;
CREATE TABLE `plate_contrast_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cashier_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收费员编号',
  `contrast_time` bigint(20) DEFAULT NULL COMMENT '校正时间',
  `car_plate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车牌颜色',
  `contrast_car_plate_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '校正后车牌号',
  `contrast_car_plate_color` tinyint(4) DEFAULT NULL COMMENT '校正后车牌颜色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区域编号',
  `region_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `space_num` int(11) DEFAULT NULL COMMENT '车位数',
  `tmp_space_num` int(11) DEFAULT NULL COMMENT '临时车位数',
  `member_space_num` int(11) DEFAULT NULL COMMENT '会员车位数',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_region_no`(`region_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for snogeneral
-- ----------------------------
DROP TABLE IF EXISTS `snogeneral`;
CREATE TABLE `snogeneral`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型 1-资产，2-流水号',
  `subtype` int(11) NOT NULL DEFAULT 0 COMMENT '子类型 1-免费卡，2-储值卡，3-月卡，4-次卡，6-优惠券，5-内部储值',
  `lastno` bigint(20) NOT NULL DEFAULT 0 COMMENT '序号id',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of snogeneral
-- ----------------------------
INSERT INTO `snogeneral` VALUES (1, 1, 4, 100288, 20180619101303);
INSERT INTO `snogeneral` VALUES (2, 1, 2, 100072, 20180619140951);
INSERT INTO `snogeneral` VALUES (3, 1, 5, 100045, 20180615142259);
INSERT INTO `snogeneral` VALUES (4, 1, 3, 119954, 20180620091800);
INSERT INTO `snogeneral` VALUES (5, 1, 1, 104630, 20180620091800);

-- ----------------------------
-- Table structure for sys_operatelog
-- ----------------------------
DROP TABLE IF EXISTS `sys_operatelog`;
CREATE TABLE `sys_operatelog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作员编号 系统自动动作用空值',
  `opt_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `opt_type` int(11) DEFAULT NULL COMMENT '类型 参考字典opt_type 取消弹框，车牌校正，收费抬杆等',
  `opt_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_operatelog_his
-- ----------------------------
DROP TABLE IF EXISTS `sys_operatelog_his`;
CREATE TABLE `sys_operatelog_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作员编号 系统自动动作用空值',
  `opt_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `opt_type` int(11) DEFAULT NULL COMMENT '类型 参考字典opt_type 取消弹框，车牌校正，收费抬杆等',
  `opt_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag_info
-- ----------------------------
DROP TABLE IF EXISTS `tag_info`;
CREATE TABLE `tag_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编号',
  `tag_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `tag_remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 5-内部车，6-新能源，21-分享车，22-军警车，23-救护车',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_info
-- ----------------------------
INSERT INTO `tag_info` VALUES (1, '1', '内部车', '小区内部住户车辆', 5);
INSERT INTO `tag_info` VALUES (2, '2', '新能源', '新能源车辆', 6);
INSERT INTO `tag_info` VALUES (3, '3', '分享车', '预约车辆', 21);
INSERT INTO `tag_info` VALUES (4, '4', '军警车', '机关单位车辆', 22);
INSERT INTO `tag_info` VALUES (5, '5', '内部车', '内部车2', 4);
INSERT INTO `tag_info` VALUES (6, '6', '内部车', '内部车', 8);
INSERT INTO `tag_info` VALUES (7, '7', '黑名单', '黑名单', 7);

alter table car_info add column auto_deduction tinyint not NULL default 0 comment '自动扣费';
replace into park_param set park_param_group='sys_setting',park_param_name='免费出场记录自动放行间隔时间',park_param_key='free_record_auto_allow',park_param_value='300',create_time=20180606084801,update_time=20180619141231;
replace into park_dict set dict_group='payflag',dict_key='停车场折扣',dict_value='17',dict_order=1;
replace into park_dict set dict_group='payflag',dict_key='代客缴费',dict_value='16',dict_order=1;
alter table park_record_info add column elec_coupon_amt decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '电子折扣';
alter table park_record_info_his add column elec_coupon_amt decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '电子折扣';

CREATE TABLE IF NOT EXISTS `show_and_play_text`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gate_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出入口编号',
  `show_text` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示内容',
  `play_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '播报内容',
  `car_plate_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车牌号',
  `car_plate_color` tinyint(4) DEFAULT NULL COMMENT '车辆颜色',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS park_batch_report(
  id bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  batch_no varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班次号',
  cashier_no varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费员编号',
  tmp_count int(11) DEFAULT 0 COMMENT '现金-记录数',
  tmp_park_amt decimal(12, 2) DEFAULT 0.00 COMMENT '现金应收',
  tmp_cash_amt decimal(12, 2) DEFAULT 0.00 COMMENT '现金实收',
  elec_count int(11) DEFAULT 0 COMMENT '储值卡电子-记录数',
  elec_amt decimal(12, 2) DEFAULT 0.00 COMMENT '储值卡电子实收',
  self_pay_count int(11) DEFAULT 0 COMMENT '自助缴费-记录数',
  self_pay_amt decimal(12, 2) DEFAULT 0.00 COMMENT '自助缴费实收',
  elec_coupon_count int(11) DEFAULT 0 COMMENT '电子优惠券次数',
  elec_coupon_amt decimal(12, 2) DEFAULT 0.00 COMMENT '电子优惠券金额',
  park_count int(11) DEFAULT 0  COMMENT '总次数',
  park_amt decimal(12, 2) DEFAULT 0.00 COMMENT '总应收',
  except_count int(11) DEFAULT 0 COMMENT '异常次数',
  except_park_amt decimal(12, 2) DEFAULT 0.00 COMMENT '异常应收金额',
  except_cash_amt decimal(12, 2) DEFAULT 0.00 COMMENT '异常实收金额',
  sync_flag tinyint(4) DEFAULT 0 COMMENT '0-未对账，1-对账失败，2-对账成功'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;



alter table  order_info add COLUMN billing_param JSON DEFAULT NULL COMMENT '计费参数';
alter table  order_info_his add COLUMN billing_param JSON DEFAULT NULL COMMENT '计费参数';
INSERT INTO `park_param`(`region_no`, `gate_no`, `park_param_group`, `park_param_name`, `park_param_key`, `park_param_value`, `create_time`, `update_time`) 
VALUES ( '', '', 'sys_setting', '临时车车位矫正量', 'temporary_car_correction', '0', 20180827095639, NULL);
INSERT INTO `park_param`(`region_no`, `gate_no`, `park_param_group`, `park_param_name`, `park_param_key`, `park_param_value`, `create_time`, `update_time`)
VALUES ( '', '', 'sys_setting', '小型车停车场计费封顶金额', 'small_car_limit', '30', 20180827095639, NULL);
INSERT INTO `park_param`(`region_no`, `gate_no`, `park_param_group`, `park_param_name`, `park_param_key`, `park_param_value`, `create_time`, `update_time`) 
VALUES ( '', '', 'sys_setting', '大型车停车场计费封顶金额', 'big_car_limit', '100', 20180827095639, NULL);
INSERT INTO `park_param`(`region_no`, `gate_no`, `park_param_group`, `park_param_name`, `park_param_key`, `park_param_value`, `create_time`, `update_time`) 
VALUES ( '', '', 'sys_setting', '小型车小时金额', 'small_car_amt', '2', 20180827095639, NULL);
INSERT INTO `park_param`(`region_no`, `gate_no`, `park_param_group`, `park_param_name`, `park_param_key`, `park_param_value`, `create_time`, `update_time`) 
VALUES ( '', '', 'sys_setting', '大型车小时金额', 'big_car_amt', '20', 20180827095639, NULL);
#无感支付
replace INTO park_dict(dict_group,dict_key,dict_value,dict_order,status) VALUES ('payflag','银行卡','13',2,0);
-- ----------------------------
-- Table structure for upload_record
-- ----------------------------
DROP TABLE IF EXISTS `upload_record`;
CREATE TABLE `upload_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型 1-进场流水，2-出场流水，3-支付信息',
  `refid` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联id',
  `sendflag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '上传状态 0-未上传，1-成功，2-失败',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `upload_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '上传时间',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `error_count` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upload_record_his
-- ----------------------------
DROP TABLE IF EXISTS `upload_record_his`;
CREATE TABLE `upload_record_his`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1-进场流水，2-出场流水，3-支付信息',
  `refid` bigint(20) DEFAULT NULL COMMENT '关联id',
  `sendflag` tinyint(4) DEFAULT NULL COMMENT '上传状态 0-未上传，1-成功，2-失败',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `upload_time` bigint(20) DEFAULT NULL COMMENT '上传时间',
  `error_count` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
drop table park_record_info_his;
drop table payment_his;
drop table gate_log_his;
drop table parking_order_log_his;
drop table order_info_his;
drop table event_log_his;

create table park_record_info_his like park_record_info;
create table payment_his like payment;
create table gate_log_his like gate_log;
create table parking_order_log_his like parking_order_log;
create table order_info_his like order_info;
create table event_log_his like event_log;



-- ----------------------------
-- Add table index  //add by zly
-- ----------------------------
alter table park_record_info add index idx_outgate_outtime(outgate_no,outtime);
alter table park_record_info add index idx_ingate(ingate_no);
alter table park_record_info add index idx_cashier_amt(cashier_no,cash_amt);
alter table park_record_info add index idx_self_pay_amt(self_pay_amt);
alter table park_record_info add index idx_status(status);
alter table upload_record add index idx_sendflag_refid(sendflag,refid);
alter table elec_assets_info add index idx_asset_no(asset_no);
alter table mem_assets add index idx_asset_no(asset_no);
alter table payment add index idx_order_type(order_no,pay_type);
ALTER TABLE payment add index idx_pay_type(pay_type);
ALTER TABLE park_record_info add index idx_outtime_ingate_no (outtime,ingate_no) ;
alter table event_log modify column gate_no varchar(32);
ALTER TABLE event_log add index idx_status_type_gateno (event_status,event_type,gate_no);

-- ----------------------------
-- Procedure structure for proc_getNextSno
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_getNextSno`;
delimiter ;;
CREATE DEFINER=`park`@`%` PROCEDURE `proc_getNextSno`(in c_type int,in c_subtype int,out c_result bigint)
begin
	 DECLARE diff_ INT;
   select lastno into diff_ from snogeneral where type=c_type and subtype=c_subtype;
   if (diff_ is NULL or diff_ = 0) then
     insert into snogeneral(type,subtype,lastno,update_time) values(c_type,c_subtype,100000,now());
		 set diff_ = 100000;
 	 end if;
 	 set c_result = diff_ + 1;
 	 update snogeneral set lastno = c_result,update_time=now() where type=c_type and subtype=c_subtype;
	 select c_result;
end
;;
delimiter ;

DROP PROCEDURE IF EXISTS `proc_his_data_all`;
delimiter ;;
CREATE DEFINER=`park`@`%` PROCEDURE `proc_his_data_all`()
begin
	DECLARE batch_no_ VARCHAR(32) default ''; #批次号
	
	DECLARE done INT DEFAULT 0;
	
	DECLARE mycursor CURSOR FOR( select batch_no from cashier_workinfo where  offduty_time < CURDATE()*1000000 and offduty_time > 0);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	
	OPEN mycursor;
  f_loop:LOOP #--循环
    FETCH mycursor INTO batch_no_;
    IF done=1 THEN
     LEAVE f_loop; #--到结尾了跳出循环
    END IF;
    
    insert into park_record_info_his select * from park_record_info where outtime > 0 and outbatch_no = batch_no_  and relate_park_log_serialno = '';
		insert into park_record_info_his select * from park_record_info where relate_park_log_serialno in (select serialno from (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_ and relate_park_log_serialno = '') as a);
		insert into payment_his select * from payment where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_));
		#insert into gate_log_his select * from gate_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_);
		insert into gate_log_his select * from gate_log where serialno in (select serialno from parking_order_log where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_)));
		insert into parking_order_log_his select * from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_);
		insert into order_info_his select * from order_info where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_));
		
		delete from payment where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_));
		delete b.* from (select serialno from parking_order_log where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_))) a left join gate_log b on a.serialno=b.serialno;
		delete from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_);
		delete from order_info where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_));
		delete from park_record_info where relate_park_log_serialno in (select serialno from (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_ and relate_park_log_serialno = '') as a);
		delete from park_record_info where outtime > 0 and outbatch_no = batch_no_;
		
		insert into event_log_his  select * from event_log where event_status = 2;
		delete from event_log where event_status = 2;
		
		
  END LOOP f_loop;
	CLOSE mycursor;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for proc_his_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_his_data`;
delimiter ;;
CREATE DEFINER=`park`@`%` PROCEDURE `proc_his_data`()
begin
	DECLARE batch_no_ VARCHAR(32) default '';
	
	DECLARE done INT DEFAULT 0;
	
	DECLARE mycursor CURSOR FOR( select batch_no from cashier_workinfo where offduty_time > DATE_SUB(CURDATE(),INTERVAL 1 DAY)*1000000 and offduty_time < CURDATE()*1000000);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	
	OPEN mycursor;
  f_loop:LOOP
    FETCH mycursor INTO batch_no_;
    IF done=1 THEN
     LEAVE f_loop;
    END IF;
    
    insert into park_record_info_his select * from park_record_info where outtime > 0 and outbatch_no = batch_no_  and relate_park_log_serialno = '';
		insert into park_record_info_his select * from park_record_info where relate_park_log_serialno in (select serialno from (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_ and relate_park_log_serialno = '') as a);
		insert into payment_his select * from payment where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_));
		insert into gate_log_his select * from gate_log where serialno in (select serialno from parking_order_log where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_)));
		insert into parking_order_log_his select * from parking_order_log where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_));
		insert into order_info_his select * from order_info where order_no in (select order_no from parking_order_log where serialno in (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_));
		
		delete payment.* from payment join (select parking_order_log.order_no from park_record_info join  parking_order_log on park_record_info.serialno = parking_order_log.serialno  where outtime > 0 and outbatch_no = batch_no_) as tmp on payment.order_no = tmp.order_no;
		delete b.* from (select serialno from parking_order_log join (select parking_order_log.order_no from parking_order_log join park_record_info on parking_order_log.serialno = park_record_info.serialno where park_record_info.outtime > 0 and park_record_info.outbatch_no = batch_no_) as tmp on tmp.order_no = parking_order_log.order_no) a left join gate_log b on a.serialno=b.serialno;
		delete parking_order_log.* from parking_order_log join park_record_info on parking_order_log.serialno = park_record_info.serialno where outtime > 0 and outbatch_no = batch_no_;
		delete order_info.* from order_info join (select parking_order_log.order_no from park_record_info join  parking_order_log on park_record_info.serialno = parking_order_log.serialno  where outtime > 0 and outbatch_no = batch_no_)as tmp on order_info.order_no = tmp.order_no;
		delete park_record_info.* from park_record_info join (select serialno from park_record_info where outtime > 0 and outbatch_no = batch_no_ and relate_park_log_serialno = '') as tmp on park_record_info.relate_park_log_serialno = tmp.serialno;
		delete from park_record_info where outtime > 0 and outbatch_no = batch_no_;
		
		insert into event_log_his  select * from event_log where event_status = 2;
		delete from event_log where event_status = 2;
		insert into camera_log_his select * from camera_log where create_time < CURDATE()*1000000;
		delete from camera_log where create_time < CURDATE()*1000000;
  END LOOP f_loop;
	CLOSE mycursor;
end
;;
delimiter ;

-- ----------------------------
-- Event structure for event_move_his_data
-- ----------------------------
DROP EVENT IF EXISTS `event_move_his_data`;
delimiter ;;
CREATE DEFINER = `park`@`%` EVENT `event_move_his_data`
ON SCHEDULE
EVERY '1' DAY STARTS '2018-01-01 01:00:00'
ON COMPLETION PRESERVE
DO call proc_his_data()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
