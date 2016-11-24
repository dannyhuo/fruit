
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
`address_alias`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址别名' ,
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
CREATE INDEX `IDX_ADDRESS_NO` ON `delivery_address`(`address_alias`) USING BTREE ;
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
`position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '职位' ,
`rank`	char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '职级 t3, t4, t5, t6, t7, t8, p2, p3, p4, p5, p6,o1, o2, o3, o4' ,
`monthly_pay` DECIMAL(10,2) NULL DEFAULT NULL COMMENT'月薪' ,
`hired_date` date NULL DEFAULT NULL COMMENT '雇佣日期' ,
`hire_year`	smallint(2) NULL DEFAULT NULL COMMENT '雇佣时限,年' ,
`employee_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '员工状态 => 0：未入职，1：实习生，2：试用期，3：已转正，4：离职，5：被解雇' ,
`role` tinyint(2) NULL COMMENT '角色：0：管理员，1：运营专员，2：接单员，3：仓管员，4：采购员' ,
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
--tab Table structure for `menu_authority`
-- ----------------------------
DROP TABLE IF EXISTS `menu_authority`;
CREATE TABLE `menu_authority` (
`menu_authority_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,菜单权限ID' ,
`back_menu_id`  bigint(11) NOT NULL COMMENT 'PK,菜单ID' ,
`role` tinyint(2) NULL COMMENT '角色：0：管理员，1：运营专员，2：接单员，3：仓管员，4：采购员' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`is_valid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'Y' COMMENT '是否有效，Y：是，N：否' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`menu_authority_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='菜单权限'
;

--创建索引
CREATE INDEX `IDX_MENU_AUTHORITY_BACK_MENU_ID` ON `menu_authority`(`back_menu_id`) USING BTREE ;
CREATE INDEX `IDX_MENU_AUTHORITY_ROLE` ON `menu_authority`(`role`) USING BTREE ;


-- ----------------------------
--tab Table structure for `back_menu`
-- ----------------------------
DROP TABLE IF EXISTS `back_menu`;
CREATE TABLE `back_menu` (
`back_menu_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,菜单ID' ,
`menu_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名' ,
`menu_url`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`is_valid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'Y' COMMENT '是否有效，Y：是，N：否' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`back_menu_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='菜单权限'
;

--创建索引
CREATE INDEX `IDX_BACK_MENU_NAME` ON `back_menu`(`menu_name`) USING BTREE ;
CREATE INDEX `IDX_BACK_MENU_URL` ON `back_menu`(`menu_url`) USING BTREE ;

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















-- ----------------------------
--tab Table structure for `outbound_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `outbound_order_detail`;
CREATE TABLE `outbound_order_detail` (
`outbound_order_detail_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '出库明细编号' ,
`outbound_order_id`  bigint(11) NOT NULL COMMENT 'FK、出库单编号' ,
`order_detail_id`  bigint(11) NOT NULL COMMENT 'FK、订单明细编号' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK、商品编号' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`outbound_time` datetime null default null COMMENT '出库时间' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '出库状态，0：待出库， 1：已出库， 2：？' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`outbound_order_detail_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='出库明细'
;

--创建索引
CREATE INDEX `IDX_OUTBOUND_ORDER_DETAIL_ID` ON `outbound_order_detail`(`outbound_order_id`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_DETAIL_ORDER_DETAIL_ID` ON `outbound_order_detail`(`order_detail_id`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_DETAIL_GOODS_ID` ON `outbound_order_detail`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_DETAIL_OUTBOUND_TIME` ON `outbound_order_detail`(`outbound_time`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_DETAIL_CREATE_TIME` ON `outbound_order_detail`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `outbound_order`
-- ----------------------------
DROP TABLE IF EXISTS `outbound_order`;
CREATE TABLE `outbound_order` (
`outbound_order_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '出库单号' ,
`order_id`  bigint(11) NOT NULL COMMENT 'FK、订单编号' ,
`employee_id`  bigint(11) NOT NULL COMMENT '出库人' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`outbound_order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='出库单'
;

--创建索引
CREATE INDEX `IDX_OUTBOUND_ORDER_ID` ON `outbound_order`(`order_id`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_EMPLOYEE_ID` ON `outbound_order`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_CREATE_TIME` ON `outbound_order`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `goods_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `goods_inventory`;
CREATE TABLE `goods_inventory` (
`goods_inventory_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '库存ID' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK、商品编号' ,
`goods_batch_no`  bigint(11) NOT NULL COMMENT 'FK、商品批次号' ,
`repostory_id`  bigint(11) NOT NULL COMMENT 'FK、仓库编号' ,
`expired_time` datetime not null COMMENT '过期时间' ,
`quantity`  smallint(5) NOT NULL COMMENT '库存数量' ,
`selling_quantity`  smallint(5) NOT NULL COMMENT '可售库存数量' ,
`sold_quantity`  smallint(5) NOT NULL default 0 COMMENT '售出数量' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`goods_inventory_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品库存'
;

--创建索引
CREATE INDEX `IDX_GOODS_INVENTORY_GOODS_ID` ON `goods_inventory`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_GOODS_INVENTORY_GOODS_BATCH_NO` ON `goods_inventory`(`goods_batch_no`) USING BTREE ;
CREATE INDEX `UNQ_IDX_GOODS_INVENTORY_REPOSTORY_ID` ON `goods_inventory`(`repostory_id`) USING BTREE ;
CREATE INDEX `IDX_GOODS_INVENTORY_EXPIRED_TIME` ON `goods_inventory`(`expired_time`) USING BTREE ;
CREATE INDEX `IDX_GOODS_INVENTORY_QUANTITY` ON `goods_inventory`(`quantity`) USING BTREE ;
CREATE INDEX `IDX_GOODS_INVENTORY_SELLING_QUANTITY` ON `goods_inventory`(`selling_quantity`) USING BTREE ;
CREATE INDEX `IDX_GOODS_INVENTORY_SOLD_QUANTITY` ON `goods_inventory`(`sold_quantity`) USING BTREE ;
CREATE INDEX `IDX_GOODS_INVENTORY_CREATE_TIME` ON `goods_inventory`(`create_time`) USING BTREE ;
CREATE UNIQUE INDEX `UNQ_IDX_GOODS_INVENTORY` ON `goods_inventory`(`goods_id`,`goods_batch_no`,`repostory_id`) USING BTREE ;


-- ----------------------------
--tab Table structure for `purchase_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_detail`;
CREATE TABLE `purchase_order_detail` (
`purchase_order_detail_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK，ID' ,
`purchase_order_id`  bigint(11) NOT NULL COMMENT 'FK、采购单号' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK、商品编号' ,
`quantity`  smallint(5) NOT NULL COMMENT '采购数量' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`repostory_id`  bigint(11) NOT NULL COMMENT 'FK、仓库编号，商品供给到此仓库' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '供货状态，0：待供货， 1：已供货， 2：？' ,
`supply_time` datetime null default null COMMENT '供货时间，入库时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`purchase_order_detail_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='采购明细'
;

--创建索引
CREATE INDEX `IDX_PURCHASE_ORDER_DETAIL_PURCHASE_ORDER_ID` ON `purchase_order_detail`(`purchase_order_id`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_DETAIL_GOODS_ID` ON `purchase_order_detail`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_DETAIL_REPOSTORY_ID` ON `purchase_order_detail`(`repostory_id`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_DETAIL_CREATE_TIME` ON `purchase_order_detail`(`create_time`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_DETAIL_SUPPLY_TIME` ON `purchase_order_detail`(`supply_time`) USING BTREE ;



-- ----------------------------
--tab Table structure for `purchase_order`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
`purchase_order_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '仓库ID' ,
`purchase_order_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购名称' ,
`employee_id`  bigint(11) NOT NULL COMMENT '采购员编号' ,
`supplier_id`  bigint(11) NOT NULL COMMENT '供应商编号' ,
`create_time` datetime not null default NOW() COMMENT '采购时间' ,
`supply_time` datetime not null default NOW() COMMENT '最后供货时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`purchase_order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='采购单'
;

--创建索引
CREATE INDEX `IDX_PURCHASE_ORDER_CREATE_TIME` ON `purchase_order`(`create_time`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_SUPPLY_TIME` ON `purchase_order`(`supply_time`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_EMPLOYEE_ID` ON `purchase_order`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_SUPPLIER_ID` ON `purchase_order`(`supplier_id`) USING BTREE ;







-- ----------------------------
--tab Table structure for `repostory`
-- ----------------------------
DROP TABLE IF EXISTS `repostory`;
CREATE TABLE `repostory` (
`repostory_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '仓库ID' ,
`repostory_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称' ,
`repostory_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库所属区域' ,
`repostory_province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库所在省' ,
`repostory_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库所在市' ,
`repostory_county` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库所在区县' ,
`repostory_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库地址' ,
`repostory_acreage`  bigint(11) NOT NULL COMMENT '仓库面积' ,
`employee_id`  bigint(11) NOT NULL COMMENT '仓管员编号' ,
`start_using_date` date null default null COMMENT '启用日期' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`repostory_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='仓库'
;

--创建索引
CREATE INDEX `IDX_REPOSTORY_NAME` ON `repostory`(`repostory_name`) USING BTREE ;
CREATE INDEX `IDX_REPOSTORY_PROVINCE` ON `repostory`(`repostory_province`) USING BTREE ;
CREATE INDEX `IDX_REPOSTORY_CITY` ON `repostory`(`repostory_city`) USING BTREE ;
CREATE INDEX `IDX_REPOSTORY_COUNTY` ON `repostory`(`repostory_county`) USING BTREE ;
CREATE INDEX `IDX_REPOSTORY_ADDRESS` ON `repostory`(`repostory_address`) USING BTREE ;
CREATE INDEX `IDX_REPOSTORY_EMPLOYEE_ID` ON `repostory`(`employee_id`) USING BTREE ;







-- ----------------------------
--tab Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
`supplier_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID' ,
`supplier_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称' ,
`address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址' ,
`contacts_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联络人姓名' ,
`contacts_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联络人固定电话' ,
`contacts_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联络人手机' ,
`supplier_category` tinyint(3) NULL DEFAULT NULL COMMENT '供应商品类别' ,
`employee_id`  bigint(11) NOT NULL COMMENT '采购员编号' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`supplier_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='供应商'
;

--创建索引
CREATE INDEX `IDX_SUPPLIER_EMPLOYEE_ID` ON `supplier`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_SUPPLIER_CATEGORY` ON `supplier`(`supplier_category`) USING BTREE ;
CREATE INDEX `IDX_SUPPLIER_CONTACTS_MOBILE` ON `supplier`(`contacts_mobile`) USING BTREE ;
CREATE INDEX `IDX_SUPPLIER_CONTACTS_PHONE` ON `supplier`(`contacts_phone`) USING BTREE ;








-- ----------------------------
--tab Table structure for `fruit_order_detail` 是否添加发货状态
-- ----------------------------
DROP TABLE IF EXISTS `fruit_order_detail`;
CREATE TABLE `fruit_order_detail` (
`order_detail_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '订单明细ID' ,
`order_id`  bigint(11) NOT NULL COMMENT 'FK，订单号' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK，商品编号' ,
`quantity`  smallint(5) NOT NULL COMMENT '购买数量' ,
`total_pay`  bigint(11) NOT NULL COMMENT '总金额' ,
`total_ought_pay`  bigint(11) NOT NULL COMMENT '应付总金额' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '状态，0：待出库， 1：已出库' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`order_detail_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单明细'
;

--创建索引
CREATE INDEX `IDX_ORDER_DETAIL_ORDER_ID` ON `fruit_order_detail`(`order_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_DETAIL_GOODS_ID` ON `fruit_order_detail`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_DETAIL_CREATE_TIME` ON `fruit_order_detail`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `fruit_order`  是否添加收货状态
-- ----------------------------
DROP TABLE IF EXISTS `fruit_order`;
CREATE TABLE `fruit_order` (
`order_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '订单号' ,
`customer_id`  bigint(11) NOT NULL COMMENT 'FK， 所属消费者ID' ,
`address_id`  bigint(11) NOT NULL COMMENT 'FK， 收货地址编号' ,
`create_time` datetime not null default NOW() COMMENT '下单时间' ,
`order_pay`  bigint(11) NULL COMMENT '订单总金额' ,
`order_ought_pay`  bigint(11) NULL COMMENT '订单应付总金额' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '状态，0：待支付， 1：已支付， 2：未支付取消，3：申请退款(消费者主动意向)，4：退款处理中，5：退款完成' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单'
;

--创建索引
CREATE INDEX `IDX_ORDER_CUSTOMER_ID` ON `fruit_order`(`customer_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_CREATE_TIME` ON `fruit_order`(`create_time`) USING BTREE ;




-- ----------------------------
--tab Table structure for `shopping_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
`shopping_cart_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK' ,
`customer_id`  bigint(11) NOT NULL COMMENT 'FK， 所属消费者ID' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK， 商品ID' ,
`quantity`  smallint(5) NOT NULL COMMENT '意向购买数量' ,
`create_time` datetime not null default NOW() COMMENT '添加时间' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '状态，0：添加， 1：已购买， 2：主动删除' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`shopping_cart_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='购物车'
;

--创建索引
CREATE INDEX `IDX_SHOPPING_CART_CUSTOMER_ID` ON `shopping_cart`(`customer_id`) USING BTREE ;
CREATE INDEX `IDX_SHOPPING_CART_GOODS_ID` ON `shopping_cart`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_SHOPPING_CART_CREATE_TIME` ON `shopping_cart`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
`goods_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,商品ID' ,
`goods_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称' ,
`producing_area`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品产地' ,
`market_price` bigint(11) NOT NULL COMMENT '市场价,单位分' ,
`sell_price` bigint(11) NOT NULL COMMENT '售价，单位分' ,
`description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述' ,
`goods_image_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片url' ,
`tag`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签' ,
`goods_type_id` bigint(11) NULL DEFAULT NULL COMMENT 'FK，商品类型ID(苹果、橘子、柚子、。。。)' ,
`goods_category` tinyint(2) NULL DEFAULT NULL COMMENT '商品分类，水果分的大类别' ,
`employee_id`  bigint(11) NOT NULL COMMENT '运营专员编号,哪个运营专员上架的商品' ,
`goods_status`  tinyint(2) NOT NULL COMMENT '0：待上架，1：已上架，2：已下架' ,
`putaway_time` datetime null COMMENT '上架时间' ,
`sold_out_time` datetime null default null COMMENT '下架时间' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`goods_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品'
;

--创建索引
CREATE INDEX `IDX_GOODS_TAG` ON `goods`(`tag`) USING BTREE ;
CREATE INDEX `IDX_GOODS_MARKET_PRICE` ON `goods`(`market_price`) USING BTREE ;
CREATE INDEX `IDX_GOODS_SELL_PRICE` ON `goods`(`sell_price`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PRODUCING_AREA` ON `goods`(`producing_area`) USING BTREE ;
CREATE INDEX `IDX_GOODS_EMPLOYEE_ID` ON `goods`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PUTAWAY_TIME` ON `goods`(`putaway_time`) USING BTREE ;

