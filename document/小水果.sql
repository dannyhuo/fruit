
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
`address_no`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ַΨһ���' ,
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
CREATE INDEX `IDX_ADDRESS_NO` ON `delivery_address`(`address_no`) USING BTREE ;
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
`position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ְλ' ,
`rank`	char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ְ�� t3, t4, t5, t6, t7, t8, p2, p3, p4, p5, p6,o1, o2, o3, o4' ,
`monthly_pay` DECIMAL(10,2) NULL DEFAULT NULL COMMENT'��н' ,
`hired_date` date NULL DEFAULT NULL COMMENT '��Ӷ����' ,
`hire_year`	smallint(2) NULL DEFAULT NULL COMMENT '��Ӷʱ��,��' ,
`employee_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT 'Ա��״̬ => 0��δ��ְ��1��ʵϰ����2�������ڣ�3����ת����4����ְ��5�������' ,
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


