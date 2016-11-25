<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>我的小水果-订单详情</title>
		<#include "/webpage/front/comm/fruit_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/front/comm/fruit_header.ftl"/>
		<div class="order_result_content">
			<p>订单编号：${order.orderId}</p>
			<p>下单总金额：￥${order.orderPay}</p>
			<p>应付总金额：￥${order.orderOughtPay}</p>
			<p>订单状态：${order.statusDisplay}</p>
			<p>订单创建时间：${order.createTime}</p>
		</div>
		
		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
	</body>
</html>