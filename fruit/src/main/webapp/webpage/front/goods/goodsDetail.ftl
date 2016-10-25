<!DOCTYPE html>
<html>
	<head>
		<title>小水果－商品详情</title>
		<#include "/webpage/front/comm/fruit_meta.ftl"/>
	</head>
	<body>
		<#--头部-->
		<#include "/webpage/front/comm/fruit_header.ftl"/>
		
		<#--商品详情-->
		<div class="fruit_goods_detail">
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
					<td rowspan="6">
						<img width="280" height="170" src="/fruit/webpage/goods_imgs/${goods.goodsImageUrl}" title="${goods.description}"/>
					</td>
					<td><h2 title="${goods.description}">${goods.goodsName}</h2></td>
				</tr>
				<tr>
					<td>
						<div class="fruit_goods_detail_price">
							<table cellspacing="0" cellpadding="0" border="0" width="100%" height="100%">
								<tr>
									<td>价格：${goods.price}</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						规格：
					</td>
				</tr>
				<tr>
					<td>优惠：</td>
				</tr>
				<tr>
					<td>
						数量：
					</td>
				</tr>
				<tr>
					<td>收藏</td>
				</tr>
			</table>
		</div>
	</body>
</html>