
-- ----------------------------
--tab1 Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
`customer_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK' ,
`customer_no`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '�û�32λ16����ID' ,
`login_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��¼��' ,
`password`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����' ,
`safety_factor`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ȫ���ӣ��������밲ȫ' ,
`real_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ʵ����' ,
`nick_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ǳ�' ,
`mobile_number`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֻ���' ,
`email`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'EMAIL' ,
`gender`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�Ա�' ,
`qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq����' ,
`wechat`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '΢�ź���' ,
`birthday`  datetime NULL DEFAULT NULL COMMENT '����' ,
`image_url`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ͷ��URL' ,
`vip_level` tinyint(2) NOT NULL DEFAULT 0 COMMENT 'vip�ȼ�����ע��Ϊ0��' ,
`create_time`  datetime NULL DEFAULT NOW() COMMENT '����ʱ��' ,
`update_time`  datetime NULL DEFAULT NULL COMMENT '����ʱ��' ,
`last_login_time`  datetime NULL DEFAULT NULL COMMENT '���һ�ε�¼ʱ��' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '�Ƿ���Ч��Y/N' ,
`costomer_status`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '�û���ǰ״̬  1:����   2��������  3:��ע��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`customer_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='������'
;

--��������
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
`address_alias`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ַ����' ,
`customer_id`  bigint(11) NOT NULL COMMENT '����������ID' ,
`mobile_number`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֻ�����' ,
`areacode`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����' ,
`phone_number`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�绰����' ,
`consignee`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ջ���' ,
`province`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ʡ' ,
`city`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��' ,
`county`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��/��' ,
`address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ַ' ,
`postcode`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ʱ�' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y'  COMMENT '�Ƿ���Ч,Y/N' ,
`create_time`  datetime NULL DEFAULT now() COMMENT '����ʱ��' ,
`update_time`  datetime NULL DEFAULT NULL COMMENT '����޸�ʱ��' ,
PRIMARY KEY (`address_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='�ջ���ַ'
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
`dept_id`  smallint(3) NOT NULL AUTO_INCREMENT COMMENT 'PK,���ű��' ,
`dept_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��������' ,
`establish_date`  DATETIME NULL COMMENT '��������' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '�Ƿ���Ч,Y/N' ,
`remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`dept_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='����'
;


-- ----------------------------
--tab Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
`employee_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,����' ,
`login_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��¼��' ,
`password`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����' ,
`real_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ʵ����' ,
`gender`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�Ա�' ,
`birthday`  date NULL DEFAULT NULL COMMENT '����' ,
`dept` smallint(3) NOT NULL COMMENT '����' ,
`position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ְλ' ,
`rank`	char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ְ�� t3, t4, t5, t6, t7, t8, p2, p3, p4, p5, p6,o1, o2, o3, o4' ,
`monthly_pay` DECIMAL(10,2) NULL DEFAULT NULL COMMENT'��н' ,
`hired_date` date NULL DEFAULT NULL COMMENT '��Ӷ����' ,
`hire_year`	smallint(2) NULL DEFAULT NULL COMMENT '��Ӷʱ��,��' ,
`employee_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT 'Ա��״̬ => 0��δ��ְ��1��ʵϰ����2�������ڣ�3����ת����4����ְ��5�������' ,
`role` tinyint(2) NULL COMMENT '��ɫ��0������Ա��1����ӪרԱ��2���ӵ�Ա��3���ֹ�Ա��4���ɹ�Ա' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`is_valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y'  COMMENT '�Ƿ���Ч,Y/N' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`employee_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Ա��'
;

--��������
CREATE INDEX `IDX_EMPLOYEE_LOGIN_NAME` ON `employee`(`login_name`) USING BTREE ;



-- ----------------------------
--tab Table structure for `menu_authority`
-- ----------------------------
DROP TABLE IF EXISTS `menu_authority`;
CREATE TABLE `menu_authority` (
`menu_authority_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,�˵�Ȩ��ID' ,
`back_menu_id`  bigint(11) NOT NULL COMMENT 'PK,�˵�ID' ,
`role` tinyint(2) NULL COMMENT '��ɫ��0������Ա��1����ӪרԱ��2���ӵ�Ա��3���ֹ�Ա��4���ɹ�Ա' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`is_valid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'Y' COMMENT '�Ƿ���Ч��Y���ǣ�N����' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`menu_authority_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='�˵�Ȩ��'
;

--��������
CREATE INDEX `IDX_MENU_AUTHORITY_BACK_MENU_ID` ON `menu_authority`(`back_menu_id`) USING BTREE ;
CREATE INDEX `IDX_MENU_AUTHORITY_ROLE` ON `menu_authority`(`role`) USING BTREE ;


-- ----------------------------
--tab Table structure for `back_menu`
-- ----------------------------
DROP TABLE IF EXISTS `back_menu`;
CREATE TABLE `back_menu` (
`back_menu_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,�˵�ID' ,
`menu_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵���' ,
`menu_url`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵���ַ' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`is_valid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL default 'Y' COMMENT '�Ƿ���Ч��Y���ǣ�N����' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`back_menu_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='�˵�Ȩ��'
;

--��������
CREATE INDEX `IDX_BACK_MENU_NAME` ON `back_menu`(`menu_name`) USING BTREE ;
CREATE INDEX `IDX_BACK_MENU_URL` ON `back_menu`(`menu_url`) USING BTREE ;

-- ----------------------------
--tab Table structure for `goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
`goods_type_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,��ƷID' ,
`goods_type_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʒ�������ƣ�ƻ�������ӡ����ӡ�����' ,
`goods_category` tinyint(2) NULL DEFAULT NULL COMMENT '��Ʒ���࣬ˮ���ֵĴ����' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`goods_type_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='��Ʒ����'
;

--��������
CREATE INDEX `IDX_GOODS_TYPE_TYPE_NAME` ON `goods_type`(`goods_type_name`) USING BTREE ;
CREATE INDEX `IDX_GOODS_TYPE_GOODS_CATEGORY` ON `goods_type`(`goods_category`) USING BTREE ;
CREATE INDEX `IDX_GOODS_TYPE_CREATE_TIME` ON `goods_type`(`create_time`) USING BTREE ;















-- ----------------------------
--tab Table structure for `outbound_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `outbound_order_detail`;
CREATE TABLE `outbound_order_detail` (
`outbound_order_detail_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '������ϸ���' ,
`outbound_order_id`  bigint(11) NOT NULL COMMENT 'FK�����ⵥ���' ,
`order_detail_id`  bigint(11) NOT NULL COMMENT 'FK��������ϸ���' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK����Ʒ���' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`outbound_time` datetime null default null COMMENT '����ʱ��' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '����״̬��0�������⣬ 1���ѳ��⣬ 2����' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`outbound_order_detail_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='������ϸ'
;

--��������
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
`outbound_order_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '���ⵥ��' ,
`order_id`  bigint(11) NOT NULL COMMENT 'FK���������' ,
`employee_id`  bigint(11) NOT NULL COMMENT '������' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`outbound_order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='���ⵥ'
;

--��������
CREATE INDEX `IDX_OUTBOUND_ORDER_ID` ON `outbound_order`(`order_id`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_EMPLOYEE_ID` ON `outbound_order`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_OUTBOUND_ORDER_CREATE_TIME` ON `outbound_order`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `goods_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `goods_inventory`;
CREATE TABLE `goods_inventory` (
`goods_inventory_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '���ID' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK����Ʒ���' ,
`goods_batch_no`  bigint(11) NOT NULL COMMENT 'FK����Ʒ���κ�' ,
`repostory_id`  bigint(11) NOT NULL COMMENT 'FK���ֿ���' ,
`expired_time` datetime not null COMMENT '����ʱ��' ,
`quantity`  smallint(5) NOT NULL COMMENT '�������' ,
`selling_quantity`  smallint(5) NOT NULL COMMENT '���ۿ������' ,
`sold_quantity`  smallint(5) NOT NULL default 0 COMMENT '�۳�����' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`goods_inventory_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='��Ʒ���'
;

--��������
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
`purchase_order_detail_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK��ID' ,
`purchase_order_id`  bigint(11) NOT NULL COMMENT 'FK���ɹ�����' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK����Ʒ���' ,
`quantity`  smallint(5) NOT NULL COMMENT '�ɹ�����' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`repostory_id`  bigint(11) NOT NULL COMMENT 'FK���ֿ��ţ���Ʒ�������˲ֿ�' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '����״̬��0���������� 1���ѹ����� 2����' ,
`supply_time` datetime null default null COMMENT '����ʱ�䣬���ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`purchase_order_detail_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='�ɹ���ϸ'
;

--��������
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
`purchase_order_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '�ֿ�ID' ,
`purchase_order_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ɹ�����' ,
`employee_id`  bigint(11) NOT NULL COMMENT '�ɹ�Ա���' ,
`supplier_id`  bigint(11) NOT NULL COMMENT '��Ӧ�̱��' ,
`create_time` datetime not null default NOW() COMMENT '�ɹ�ʱ��' ,
`supply_time` datetime not null default NOW() COMMENT '��󹩻�ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`purchase_order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='�ɹ���'
;

--��������
CREATE INDEX `IDX_PURCHASE_ORDER_CREATE_TIME` ON `purchase_order`(`create_time`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_SUPPLY_TIME` ON `purchase_order`(`supply_time`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_EMPLOYEE_ID` ON `purchase_order`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_PURCHASE_ORDER_SUPPLIER_ID` ON `purchase_order`(`supplier_id`) USING BTREE ;







-- ----------------------------
--tab Table structure for `repostory`
-- ----------------------------
DROP TABLE IF EXISTS `repostory`;
CREATE TABLE `repostory` (
`repostory_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '�ֿ�ID' ,
`repostory_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֿ�����' ,
`repostory_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֿ���������' ,
`repostory_province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֿ�����ʡ' ,
`repostory_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֿ�������' ,
`repostory_county` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֿ���������' ,
`repostory_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֿ��ַ' ,
`repostory_acreage`  bigint(11) NOT NULL COMMENT '�ֿ����' ,
`employee_id`  bigint(11) NOT NULL COMMENT '�ֹ�Ա���' ,
`start_using_date` date null default null COMMENT '��������' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`repostory_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='�ֿ�'
;

--��������
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
`supplier_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '��Ӧ��ID' ,
`supplier_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��Ӧ������' ,
`address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ӧ�̵�ַ' ,
`contacts_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����������' ,
`contacts_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�����˹̶��绰' ,
`contacts_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�������ֻ�' ,
`supplier_category` tinyint(3) NULL DEFAULT NULL COMMENT '��Ӧ��Ʒ���' ,
`employee_id`  bigint(11) NOT NULL COMMENT '�ɹ�Ա���' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`supplier_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='��Ӧ��'
;

--��������
CREATE INDEX `IDX_SUPPLIER_EMPLOYEE_ID` ON `supplier`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_SUPPLIER_CATEGORY` ON `supplier`(`supplier_category`) USING BTREE ;
CREATE INDEX `IDX_SUPPLIER_CONTACTS_MOBILE` ON `supplier`(`contacts_mobile`) USING BTREE ;
CREATE INDEX `IDX_SUPPLIER_CONTACTS_PHONE` ON `supplier`(`contacts_phone`) USING BTREE ;








-- ----------------------------
--tab Table structure for `fruit_order_detail` �Ƿ���ӷ���״̬
-- ----------------------------
DROP TABLE IF EXISTS `fruit_order_detail`;
CREATE TABLE `fruit_order_detail` (
`order_detail_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '������ϸID' ,
`order_id`  bigint(11) NOT NULL COMMENT 'FK��������' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK����Ʒ���' ,
`quantity`  smallint(5) NOT NULL COMMENT '��������' ,
`total_pay`  bigint(11) NOT NULL COMMENT '�ܽ��' ,
`total_ought_pay`  bigint(11) NOT NULL COMMENT 'Ӧ���ܽ��' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '״̬��0�������⣬ 1���ѳ���' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`order_detail_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='������ϸ'
;

--��������
CREATE INDEX `IDX_ORDER_DETAIL_ORDER_ID` ON `fruit_order_detail`(`order_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_DETAIL_GOODS_ID` ON `fruit_order_detail`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_DETAIL_CREATE_TIME` ON `fruit_order_detail`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `fruit_order`  �Ƿ�����ջ�״̬
-- ----------------------------
DROP TABLE IF EXISTS `fruit_order`;
CREATE TABLE `fruit_order` (
`order_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT '������' ,
`customer_id`  bigint(11) NOT NULL COMMENT 'FK�� ����������ID' ,
`address_id`  bigint(11) NOT NULL COMMENT 'FK�� �ջ���ַ���' ,
`create_time` datetime not null default NOW() COMMENT '�µ�ʱ��' ,
`order_pay`  bigint(11) NULL COMMENT '�����ܽ��' ,
`order_ought_pay`  bigint(11) NULL COMMENT '����Ӧ���ܽ��' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '״̬��0����֧���� 1����֧���� 2��δ֧��ȡ����3�������˿�(��������������)��4���˿���У�5���˿����' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='����'
;

--��������
CREATE INDEX `IDX_ORDER_CUSTOMER_ID` ON `fruit_order`(`customer_id`) USING BTREE ;
CREATE INDEX `IDX_ORDER_CREATE_TIME` ON `fruit_order`(`create_time`) USING BTREE ;




-- ----------------------------
--tab Table structure for `shopping_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
`shopping_cart_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK' ,
`customer_id`  bigint(11) NOT NULL COMMENT 'FK�� ����������ID' ,
`goods_id`  bigint(11) NOT NULL COMMENT 'FK�� ��ƷID' ,
`quantity`  smallint(5) NOT NULL COMMENT '����������' ,
`create_time` datetime not null default NOW() COMMENT '���ʱ��' ,
`status` tinyint(2) NOT NULL default 0 COMMENT '״̬��0����ӣ� 1���ѹ��� 2������ɾ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`shopping_cart_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='���ﳵ'
;

--��������
CREATE INDEX `IDX_SHOPPING_CART_CUSTOMER_ID` ON `shopping_cart`(`customer_id`) USING BTREE ;
CREATE INDEX `IDX_SHOPPING_CART_GOODS_ID` ON `shopping_cart`(`goods_id`) USING BTREE ;
CREATE INDEX `IDX_SHOPPING_CART_CREATE_TIME` ON `shopping_cart`(`create_time`) USING BTREE ;





-- ----------------------------
--tab Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
`goods_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,��ƷID' ,
`goods_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʒ����' ,
`producing_area`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʒ����' ,
`market_price` bigint(11) NOT NULL COMMENT '�г���,��λ��' ,
`sell_price` bigint(11) NOT NULL COMMENT '�ۼۣ���λ��' ,
`description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʒ����' ,
`goods_image_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ƷͼƬurl' ,
`tag`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ǩ' ,
`goods_type_id` bigint(11) NULL DEFAULT NULL COMMENT 'FK����Ʒ����ID(ƻ�������ӡ����ӡ�������)' ,
`goods_category` tinyint(2) NULL DEFAULT NULL COMMENT '��Ʒ���࣬ˮ���ֵĴ����' ,
`employee_id`  bigint(11) NOT NULL COMMENT '��ӪרԱ���,�ĸ���ӪרԱ�ϼܵ���Ʒ' ,
`goods_status`  tinyint(2) NOT NULL COMMENT '0�����ϼܣ�1�����ϼܣ�2�����¼�' ,
`putaway_time` datetime null COMMENT '�ϼ�ʱ��' ,
`sold_out_time` datetime null default null COMMENT '�¼�ʱ��' ,
`create_time` datetime not null default NOW() COMMENT '����ʱ��' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ע' ,
PRIMARY KEY (`goods_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='��Ʒ'
;

--��������
CREATE INDEX `IDX_GOODS_TAG` ON `goods`(`tag`) USING BTREE ;
CREATE INDEX `IDX_GOODS_MARKET_PRICE` ON `goods`(`market_price`) USING BTREE ;
CREATE INDEX `IDX_GOODS_SELL_PRICE` ON `goods`(`sell_price`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PRODUCING_AREA` ON `goods`(`producing_area`) USING BTREE ;
CREATE INDEX `IDX_GOODS_EMPLOYEE_ID` ON `goods`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PUTAWAY_TIME` ON `goods`(`putaway_time`) USING BTREE ;

