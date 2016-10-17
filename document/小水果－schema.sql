员工[员工编号、名称、性别、生日、部门、职位、职级、月薪、雇佣日期、雇佣时限、状态、角色]。
消费者[消费者编号、消费者姓名、用户名、密码、性别、出生年月、手机号、邮箱、VIP会员等级]。


商品[商品编号、商品名称、商品产地、商品售价、商品描述、商品类别、运营人员编号、商品状态(可售/停售)]。
收货地址[收货地址编号、收货地址名称、消费者编号(FK)、手机号、区号、电话、收货人姓名、省、市、区/县、地址、邮政编码、创建时间、修改时间]。
购物车[编号、消费者编号(FK)、商品编号(FK)、数量、添加日期]。
订单[订单编号、消费者编号(FK)、创建时间、订单金额、收货地址编号(FK)、接单员编号(FK)]。
订单详情[订单详情编号、订单编号(FK)、商品编号(FK)、数量、金额、生成时间]。
供应商[供应商编号、名称、地址、联系人、联系电话、供货类别(枚举)、采购员编号(FK)]。
仓库[仓库编号、仓库名称、仓库地址、仓库面积、员工编号(仓管员)]。
采购单[采购单编号、采购名称、采购员编号(FK)、采购时间、供货时间、数量]。
采购明细[采购明细编号、采购单编号(FK)、商品编号(FK)、采购数量、创建时间、仓库编号(FK)、供货状态(待入库/已入库)、入库时间]。
库存[编号、商品编号、仓库编号、商品批次号、过期时间、库存数量、可售库存量、最小库存量、创建时间]
出库单[出库单编号、订单编号(FK)、创建时间、出库人]。
出库明细[出库明细编号、出库单编号、订单明细编号、出库时间、出库状态]。


-- ----------------------------
--tab Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
`goods_id`  bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'PK,商品ID' ,
`goods_name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称' ,
`producing_area`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品产地' ,
`price` bigint(11) NOT NULL COMMENT '售价' ,
`description`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述' ,
`tag`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签' ,
`goods_type` smallint(2) NULL DEFAULT NULL COMMENT '商品类别' ,
`employee_id`  bigint(11) NOT NULL COMMENT '运营专员编号' ,
`goods_status`  bigint(11) NOT NULL COMMENT '商品状态' ,
`putaway_time` datetime not null default NOW() COMMENT '上架时间' ,
`sold_out_time` datetime null default null COMMENT '下架时间' ,
`create_time` datetime not null default NOW() COMMENT '创建时间' ,
`remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
PRIMARY KEY (`goods_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='员工'
;

--创建索引
CREATE INDEX `IDX_GOODS_TAG` ON `goods`(`tag`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PRICE` ON `goods`(`price`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PRODUCING_AREA` ON `goods`(`producing_area`) USING BTREE ;
CREATE INDEX `IDX_GOODS_EMPLOYEE_ID` ON `goods`(`employee_id`) USING BTREE ;
CREATE INDEX `IDX_GOODS_PUTAWAY_TIME` ON `goods`(`putaway_time`) USING BTREE ;
