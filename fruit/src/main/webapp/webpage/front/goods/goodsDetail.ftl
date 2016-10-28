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
					<td rowspan="6" width="365">
						<img width="280" height="170" src="/fruit/webpage/goods_imgs/${goods.goodsImageUrl}" title="${goods.description}"/>
					</td>
					<td colspan="3"><h2 title="${goods.description}">${goods.goodsName}</h2></td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="fruit_goods_detail_price">
							<table cellspacing="0" cellpadding="0" border="0" width="100%" height="100%">
								<tr>
									<td>
										<p class="fav-price">价格：<em>¥</em>${goods.sellPrice}<span></span></p>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						规格：
					</td>
				</tr>
				<tr>
					<td colspan="3">优惠：</td>
				</tr>
				<tr>
					<td width="40px">
						数量：
					</td>
					<td width="220px">
						<form id="shpCartForm" action="/fruit/shoppingCart/addToShpCart.do" method="post">
							<input type="hidden" name="goodsId" value="${goods.goodsId}"/>
							<input type="text" name="quantity" value="1"/>
						</form>
					</td>
					<td>
						<span class="add_shopping_cart_btn" onclick="document.getElementById('shpCartForm').submit();">加入购物车</span>
					</td>
				</tr>
				<tr>
					<td colspan="3">收藏</td>
				</tr>
			</table>
		</div>
	</body>
</html>