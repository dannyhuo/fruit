
-- ----------------------------
--tab1 Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
`customer_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK' ,
`customer_no`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户32位16进制ID' ,
`login_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名' ,
`password`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`safety_factor`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全因子，用于密码安全' ,
`real_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名' ,
`nick_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称' ,
`mobile_number`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号' ,
`email`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'EMAIL' ,
`gender`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别' ,
`qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号码' ,
`wechat`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号码' ,
`birthday`  datetime NULL DEFAULT NULL COMMENT '生日' ,
`image_url`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像URL' ,
`vip_level` tinyint(2) NOT NULL DEFAULT 0 COMMENT 'vip等级，刚注册为0级' ,
`create_time`  datetime NULL DEFAULT NOW() COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`last_login_time`  datetime NULL DEFAULT NULL COMMENT '最近一次登录时间' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '是否有效，Y/N' ,
`costomer_status`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '用户当前状态  1:正常   2：己冻结  3:己注销' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`customer_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='消费者'
;

--创建索引
CREATE INDEX `IDX_CUSTOMER_NO` ON `customer`(`customer_no`) USING BTREE ;
CREATE INDEX `IDX_CUSTOMER_CREATE_TIME` ON `customer`(`create_time`) USING BTREE ;
CREATE INDEX `IDX_CUSTOMER_EMAIL` ON `customer`(`email`) USING BTREE ;
CREATE INDEX `IDX_CUSTOMER_LOGIN_NAME` ON `customer`(`login_name`) USING BTREE ;
CREATE INDEX `IDX_CUSTOMER_MOBILE_NUMBER` ON `customer`(`mobile_number`) USING BTREE ;
CREATE INDEX `IDX_CUSTOMER_QQ` ON `customer`(`qq`) USING BTREE ;
CREATE INDEX `IDX_CUSTOMER_WECHAT` ON `customer`(`wechat`) USING BTREE ;




-- ----------------------------
--tab2 Table structure for `delivery_address`
-- ----------------------------
DROP TABLE IF EXISTS `delivery_address`;
CREATE TABLE `delivery_address` (
`address_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK' ,
`address_no`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址唯一编号' ,
`customer_id`  bigint(11) NOT NULL COMMENT '所属消费者ID' ,
`mobile_number`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码' ,
`areacode`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区号' ,
`phone_number`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码' ,
`consignee`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人' ,
`province`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省' ,
`city`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市' ,
`county`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县' ,
`address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址' ,
`postcode`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y'  COMMENT '是否有效,Y/N' ,
`create_time`  datetime NULL DEFAULT now() COMMENT '创建时间' ,
`update_time`  datetime NULL DEFAULT NULL COMMENT '最近修改时间' ,
PRIMARY KEY (`address_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='收货地址'
;

CREATE INDEX `IDX_ADDRESS_CUSTOMER_ID` ON `delivery_address`(`customer_id`) USING BTREE ;
CREATE INDEX `IDX_ADDRESS_NO` ON `delivery_address`(`address_no`) USING BTREE ;
CREATE INDEX `IDX_ADDRESS_CREATE_TIME` ON `delivery_address`(`create_time`) USING BTREE ;
CREATE INDEX `IDX_ADDRESS_UPDATE_TIME` ON `delivery_address`(`update_time`) USING BTREE ;




















-- ----------------------------
--tab Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
`dept_id`  smallint(3) NOT NULL AUTO_INCREMENT COMMENT 'PK,部门编号' ,
`dept_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称' ,
`establish_date`  DATETIME NULL COMMENT '创立日期' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '是否有效,Y/N' ,
`remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`dept_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='部门'
;


-- ----------------------------
--tab Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
`employee_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,工号' ,
`login_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名' ,
`password`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`real_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名' ,
`gender`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别' ,
`birthday`  date NULL DEFAULT NULL COMMENT '生日' ,
`dept` smallint(3) NOT NULL COMMENT '部门' ,
`position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位' ,
`rank`	char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职级 t3, t4, t5, t6, t7, t8, p2, p3, p4, p5, p6,o1, o2, o3, o4' ,
`monthly_pay` DECIMAL(10,2) NULL DEFAULT NULL COMMENT'月薪' ,
`hired_date` date NULL DEFAULT NULL COMMENT '雇佣日期' ,
`hire_year`	smallint(2) NULL DEFAULT NULL COMMENT '雇佣时限,年' ,
`employee_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '员工状态 => 0：未入职，1：实习生，2：试用期，3：已转正，4：离职，5：被解雇' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y'  COMMENT '是否有效,Y/N' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`employee_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='员工'
;

--创建索引
CREATE INDEX `IDX_EMPLOYEE_LOGIN_NAME` ON `employee`(`login_name`) USING BTREE ;




-- ----------------------------
--tab Table structure for `goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
`goods_type_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,商品ID' ,
`goods_type_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类型名称，苹果、橘子、柚子。。。' ,
`goods_category` tinyint(2) NULL DEFAULT NULL COMMENT '商品分类，水果分的大类别' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`goods_type_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品类型'
;

--创建索引
CREATE INDEX `IDX_GOODS_TYPE_TYPE_NAME` ON `goods_type`(`goods_type_name`) USING BTREE ;
CREATE INDEX `IDX_GOODS_TYPE_GOODS_CATEGORY` ON `goods_type`(`goods_category`) USING BTREE ;
CREATE INDEX `IDX_GOODS_TYPE_CREATE_TIME` ON `goods_type`(`create_time`) USING BTREE ;


