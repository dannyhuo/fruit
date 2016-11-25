<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果后台信息管理系统－出库管理</title>
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
							<th>发货地址</th>
							<th>操作</th>
						</tr>
						<#assign index = 0/>
						<#list outStoreOrders as order>
							<#assign index = index + 1/>
							<tr class="out_Store_order">
								<td align="center">
									<input name="shpCartGoodsCheck" type="checkbox" />${index}
								</td>
								<td align="center">
									${order.orderId}
								</td>
								<td align="center">${order.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
								<td align="center">${order.statusName}</td>
								<td align="center">
									${order.deliveryAddress.consignee}
									${order.deliveryAddress.province}
									${order.deliveryAddress.city}
									${order.deliveryAddress.county}
									${order.deliveryAddress.address}
								</td>
								<td align="center">
									<a href="">全部出库</a>
								</td>
							</tr>
							<#if order.orderDetails?has_content>
								<#list order.orderDetails as orderDetail>
									<tr  class="out_Store_order_detail">
										<td colspan="2" align="center">
											商品编号：${orderDetail.goodsId}
										</td>
										<td colspan="2" align="center">
											数量：${orderDetail.quantity}
										</td>
										<td align="center">
											状态：${orderDetail.statusCnName}
										</td>
										<td align="center">
											<#if orderDetail.status == 0>
												<a href="/fruit/back/storeController/goodsOutStore.do?goodsId=${orderDetail.goodsId}&orderDetailId=${orderDetail.orderDetailId}&quantity=${orderDetail.quantity}">出库</a>
											</#if>
										</td>		
									</tr>
								</#list>
							</#if>
						</#list>
					</table>
				</#if>
			</div>
		</div>
	</body>
</html>