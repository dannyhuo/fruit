<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果后台信息管理系统－采购管理</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<#if outStoreOrders?has_content>
					<table cellspacing="0" cellpadding="0" border="0" class="out_store_order_list">
						<tr>
							<th>序号</th>
							<th>订单号</th>
							<th>创建时间</th>
							<th>订单状态</th>
							<th>操作</th>
						</tr>
						<#assign index = 0/>
						<#list purchaseOrders as order>
							<#assign index = index + 1/>
							<tr class="out_Store_order">
								<td align="center">
									<input name="shpCartGoodsCheck" type="checkbox" />${index}
								</td>
								<td align="right">
									${order.orderId}
								</td>
								<td align="left">时间${order.createTime}</td>
								<td align="center">${order.statusName}</td>
								<td align="center">
									<a href="">全部出库</a>
								</td>
							</tr>
							<#if order.purchaseOrderDetails?has_content>
								<#list order.purchaseOrderDetails as orderDetail>
									<tr  class="out_Store_order_detail">
										<td colspan="3" align="center">
											商品编号：${orderDetail.goodsId}
										</td>
										<td colspan="2" align="center">
											数量：${orderDetail.quantity}
										</td>
										<td align="center">
											<a href="">出库</a>
										</td>		
									</tr>
								</#list>
							</#if>
						</#list>
					</table>
				</#if>

				<p>
					采购名称：<input type="text" name="purchase_order_name" class="common_input"/>
				</p>
				<p>
					供应商采购：
					<select name="">
						<#if suppliers?has_content>
							<#list suppliers as supplier>
								<option value="${supplier.supplier_id}">${supplier.supplierName}</option>
							</#list>
						</#if>
					</select>
				</p>
				<p>
					商品：
					<select name="">
						<#if goodses?has_content>
							<#list goodses as goods>
								<option value="${goods.goodsId}">${goods.goodsName}</option>
							</#list>
						</#if>
					</select>
				</p>
			</div>
		</div>
	</body>
</html>