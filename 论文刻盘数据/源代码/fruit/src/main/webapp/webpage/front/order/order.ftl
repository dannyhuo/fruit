<!DOCTYPE html>
<html>
	<head>
		<title>小水果－订单结算中心</title>
	<#include "/webpage/front/comm/fruit_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/front/comm/fruit_header.ftl"/>

		<div class="my_shp_cart_div">
			<#if order?has_content>
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<th>序号</th>
						<th colspan="2">商品信息</th>
						<th>应付款</th>
					</tr>
					<#assign index = 0/>
					<#list order.orderDetails as orderDetails>
						<#assign index = index + 1/>
						<tr>
							<td align="center">
								${index}
							</td>
							<td align="right">
								<a target="_blank" href="/fruit/goodsDetail.do?goodsId=${orderDetails.goodsId}">
									<img width="60px" height="40px" src="/fruit/webpage/goods_imgs/${orderDetails.goodsImageUrl}" />
								</a>
							</td>
							<td align="left">${orderDetails.goodsName}</td>
							<td align="center">${orderDetails.totalOughtPay}</td>
						</tr>
					</#list>
				</table>
				<div class="deliverAddressView">
					<#if addresses?has_content>
						<#list addresses as address>
							<p>
								<input type="radio" id="${address.addressId}" name="myAddress"/>${address.addressAlias} 
								${address.consignee} ${address.phone_number} ${address.province}${address.city}${address.county}${address.address}
							</p>
						</#list>
					</#if>
					<a href="javascript:addNewAddress();">新增收货地址</a>
				</div>
				<div id="myAddressAdder" class="deliverAddressAddHidden">
					<form method="post" action="/fruit/order/addAddress.do">
						<p>
							别名：<input type="text" name="addressAlias"/>
						</p>
						<p>
							手机号码：<input type="text" name="mobileNumber"/>
						</p>
						<p>
							区号：<input type="text" name="areacode"/>
						</p>
						<p>
							电话号码：<input type="text" name="phoneNumber"/>
						</p>
						<p>
							收货人姓名：<input type="text" name="consignee"/>
						</p>
						<p>
							省：<input type="text" name="province"/>
						</p>
						<p>
							市：<input type="text" name="city"/>
						</p>
						<p>
							区/县：<input type="text" name="county"/>
						</p>
						<p>
							地址：<input type="text" name="address"/>
						</p>
						<p>
							邮政编码：<input type="text" name="postcode"/>
						</p>
						<p>
							<input class="addAddressBtn" type="submit" value="添加"/>
						</p>
					</form>
				</div>
				<div class="my_buy_div">
					<div class="my_buy_btn" onclick="toBuy()">
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td align="center" valign="middle">
									<span>提交订单</span>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</#if>
		</div>
		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
		
		<script>
			function addNewAddress(){
				var myAddressAdder = document.getElementById("myAddressAdder");
				myAddressAdder.className = "deliverAddressAddShow";
			}
			
			
			function toBuy(){
				var addresses = document.getElementsByName("myAddress");
				for(var i = 0; i < addresses.length; i++){
					if(addresses[i].checked){
						var buyForm = document.createElement("FORM");
						var input = document.createElement("INPUT");
						buyForm.method = "POST";
						buyForm.style.dispaly = "none"
						buyForm.action = "/fruit/order/saveOrder.do";
						input.type = "hidden";
						input.name = "addressId";
						input.value = addresses[i].id;
						buyForm.appendChild(input);
						document.body.appendChild(buyForm);
						buyForm.submit();
					}
				}
			}
		</script>
	</body>
</html>