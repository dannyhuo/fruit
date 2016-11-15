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
							<td align="center">
								<input name="shpCartGoodsCheck" 
									value="${shpCardGoods.shoppingCartId}:${shpCardGoods.goodsId}:${shpCardGoods.quantity}" 
										   type="checkbox" />${index}
							</td>
							<td align="right">
								<a target="_blank" href="/fruit/goodsDetail.do?goodsId=${shpCardGoods.goodsId}">
									<img width="60px" height="40px" src="/fruit/webpage/goods_imgs/${shpCardGoods.goodsImageUrl}" />
								</a>
							</td>
							<td align="left">${shpCardGoods.goodsName}</td>
							<td align="center">${shpCardGoods.sellPriceYuan}</td>
							<td align="center">${shpCardGoods.quantity}</td>
							<td align="center">${shpCardGoods.sellPriceYuan*shpCardGoods.quantity}</td>
							<td align="center">
								<a href="/fruit/shoppingCart/removeCartGoodsById.do?shoppingCartId=${shpCardGoods.shoppingCartId}">从购物车中移出</a>
							</td>
						</tr>
					</#list>
				</table>
				<div class="my_buy_div">
					<div class="my_buy_btn" onclick="toBuy()">
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td align="center" valign="middle">
									<span>去结算</span>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</#if>
		</div>
		
		<script>
			function toBuy(){
				var boxs = document.getElementsByName("shpCartGoodsCheck");
				var buyGoodses = [];
				for(var i = 0; i < boxs.length; i++){
					var box = boxs[i];
					if(box.checked){
						buyGoodses.push(box.value);
					}
				}
				var buyForm = document.createElement("FORM");
				var input = document.createElement("INPUT");
				buyForm.method = "POST";
				buyForm.style.dispaly = "none"
				buyForm.action = "/fruit/order/saveOrder.do";
				input.type = "hidden";
				input.name = "shpGoods";
				input.value = buyGoodses.join(",");
				buyForm.appendChild(input);
				document.body.appendChild(buyForm);
				buyForm.submit();
			}
		</script>
	</body>
</html>