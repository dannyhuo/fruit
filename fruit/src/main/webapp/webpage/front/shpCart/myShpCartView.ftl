<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果-我的购物车</title>
		<#include "/webpage/front/comm/fruit_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/front/comm/fruit_header.ftl"/>
		
		<#--购物车中商品列表-->
		<div class="my_shp_cart_div">
			<#if myShpCards?has_content>
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<th>序号</th>
						<th colspan="2">商品信息</th>
						<th>单价</th>
						<th>购买数量</th>
						<th>合计</th>
						<th>操作</th>
					</tr>
					<#assign index = 0/>
					<#list myShpCards as shpCardGoods>
						<#assign index = index + 1/>
						<tr>
							<td align="center"><input type="checkbox" />${index}</td>
							<td align="right">
								<img width="60px" height="40px" src="/fruit/webpage/goods_imgs/${shpCardGoods.goodsImageUrl}" />
							</td>
							<td align="left">${shpCardGoods.goodsName}</td>
							<td align="center">${shpCardGoods.sellPrice}</td>
							<td align="center">${shpCardGoods.quantity}</td>
							<td align="center">${shpCardGoods.sellPrice*shpCardGoods.quantity}</td>
							<td align="center">
								<a href="">从购物车中移出</a>
							</td>
						</tr>
					</#list>
				</table>
			</#if>
		</div>
	</body>
</html>