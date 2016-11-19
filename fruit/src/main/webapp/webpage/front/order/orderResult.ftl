<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>我的小水果-订单预定结果</title>
		<#include "/webpage/front/comm/fruit_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/front/comm/fruit_header.ftl"/>
		<div class="order_result_content">
			<p class="order_result_orderid">${orderId}<a href="/fruit/order/orderDetail.do?orderId=${orderId}">查看订单详情</a></p>
			<#if orderOk>
				<p class="order_result_sucess">
			<#else>
				<p class="order_result_failed">
			</#if>
				${message}
			</p>
		</div>
		
		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
	</body>
</html>