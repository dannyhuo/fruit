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
				<a href="/fruit/back/purchaseController/toPurchase.do" class="common_btn">制作采购单</a>
				<#if purchaseOrders?has_content>
					<table cellspacing="0" cellpadding="0" border="0" class="out_store_order_list" style="border-top:1px dashed #cccccc;margin-top:20px;">
						<tr>
							<th>序号</th>
							<th>采购单号</th>
							<th>采购名称</th>
							<th>供货时间</th>
							<th>供应商编号</th>
							<th>备注</th>
						</tr>
						<#assign index = 0/>
						<#list purchaseOrders as purchaseOrder>
							<#assign index = index + 1/>
							<tr class="out_Store_order">
								<td align="center">${index}</td>
								<td align="right">${purchaseOrder.purchaseOrderId}</td>
								<td align="center">${purchaseOrder.purchaseOrderName}</td>
								<td align="center">${purchaseOrder.supplyTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								<td align="center">${purchaseOrder.supplierId}</td>
								<td align="center">${purchaseOrder.remark}</td>
							</tr>
							<#if purchaseOrder.purchaseOrderDetails?has_content>
								<#list purchaseOrder.purchaseOrderDetails as orderDetail>
									<tr  class="out_Store_order_detail">
										<td colspan="2">
											商品：${orderDetail.goodsName}
										</td>
										<td colspan="2" align="center">
											采购数量：${orderDetail.quantity}
										</td>
										<td colspan="2">供货状态：${orderDetail.statusCnName}</td>	
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