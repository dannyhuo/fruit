员工[员工编号、名称、性别、生日、部门、职位、职级、月薪、雇佣日期、雇佣时限、状态、角色]。
消费者[消费者编号、消费者姓名、用户名、密码、性别、出生年月、手机号、邮箱、VIP会员等级]。


商品[商品编号、商品名称、商品产地、商品售价、商品描述、商品类别、运营人员编号、商品状态(可售/停售)]。
收货地址[收货地址编号、收货地址名称、消费者编号(FK)、手机号、区号、电话、收货人姓名、省、市、区/县、地址、邮政编码、创建时间、修改时间]。
购物车[编号、消费者编号(FK)、商品编号(FK)、数量、添加日期]。
订单[订单编号、消费者编号(FK)、创建时间、订单金额、收货地址编号(FK)、接单员编号(FK)]。
订单详情[订单详情编号、订单编号(FK)、商品编号(FK)、数量、金额、生成时间]。

供应商[供应商编号、名称、地址、联系人、联系电话、供货类别(枚举)、采购员编号(FK)]。
仓库[仓库编号、仓库名称、仓库地址、仓库面积、员工编号(仓管员)]。
采购单[采购单编号、采购名称、采购员编号(FK)、采购时间、供货时间、数量]。       数量去掉

采购明细[采购明细编号、采购单编号(FK)、商品编号(FK)、采购数量、创建时间、仓库编号(FK)、供货状态(待入库/已入库)、入库时间]。


库存[编号、商品编号、仓库编号、商品批次号、过期时间、库存数量、可售库存量、最小库存量、创建时间]      最小库存量改为售出数量
出库单[出库单编号、订单编号(FK)、创建时间、出库人]。
出库明细[出库明细编号、出库单编号、订单明细编号、出库时间、出库状态]。     添加商品编号




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
CREATE UNIQUE INDEX `UNQ_IDX_GOODS_INVENTORY_REPOSTORY_ID` ON `goods_inventory`(`repostory_id`) USING BTREE ;
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
CREATE INDEX `IDX_REPOSTORY_ADDRESS` ON `repostory`(`repostory_address`) USING BTREE ;
CREATE INDEX `IDX_REPOSTORY_EMPLOYEE_ID` ON `repostory`(`employee_id`) USING BTREE ;







-- ----------------------------
--tab Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
`supplier_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID' ,
`supplier_name`  bigint(11) NOT NULL COMMENT '供应商名称' ,
`address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址' ,
`contacts_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联络人姓名' ,
`contacts_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联络人固定电话' ,
`contacts_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联络人手机' ,
`supplier_category` tinyint(3) NOT NULL default 0 COMMENT '供应商品类别' ,
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
--tab Table structure for `order_detail` 是否添加发货状态
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
`order_detail_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '订单明细ID' ,
`order_id`  bigint(11) NOT NULL COMMENT 'FK，订单号' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK，商品编号' ,
`quantity`  smallint(5) NOT NULL COMMENT '购买数量' ,
`total_pay`  bigint(11) NOT NULL COMMENT '总金额' ,
`total_ought_pay`  bigint(11) NOT NULL COMMENT '应付总金额' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`order_detail_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单明细'
;

--创建索引
CREATE INDEX `IDX_ORDER_DETAIL_ORDER_ID` ON `order_detail`(`order_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_DETAIL_GOODS_ID` ON `order_detail`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_DETAIL_CREATE_TIME` ON `order_detail`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `order`  是否添加收货状态
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
`order_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '订单号' ,
`customer_id`  bigint(11) NOT NULL COMMENT 'FK， 所属消费者ID' ,
`create_time` datetime not null default NOW() COMMENT '下单时间' ,
`order_pay`  bigint(11) NOT NULL COMMENT '订单总金额' ,
`order_ought_pay`  bigint(11) NOT NULL COMMENT '订单应付总金额' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '状态，0：待支付， 1：已支付， 2：未支付取消，3：申请退款(消费者主动意向)，4：退款处理中，5：退款完成' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单'
;

--创建索引
CREATE INDEX `IDX_ORDER_CUSTOMER_ID` ON `order`(`customer_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_CREATE_TIME` ON `order`(`create_time`) USING BTREE ;




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
CREATE INDEX `IDX_GOODS_PRICE` ON `goods`(`price`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PRODUCING_AREA` ON `goods`(`producing_area`) USING BTREE ;
CREATE INDEX `IDX_GOODS_EMPLOYEE_ID` ON `goods`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PUTAWAY_TIME` ON `goods`(`putaway_time`) USING BTREE ;


-- ----------------------------
--tab Table structure for `menu_authority`
-- ----------------------------
DROP TABLE IF EXISTS `menu_authority`;
CREATE TABLE `menu_authority` (
`menu_authority_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,菜单权限ID' ,
`back_menu_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,菜单ID' ,
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
PRIMARY KEY (`menu_authority_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='菜单权限'
;

--创建索引
CREATE INDEX `IDX_BACK_MENU_NAME` ON `back_menu`(`menu_name`) USING BTREE ;
CREATE INDEX `IDX_BACK_MENU_URL` ON `back_menu`(`menu_url`) USING BTREE ;




