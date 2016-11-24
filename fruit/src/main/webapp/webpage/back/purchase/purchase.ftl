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
					采购名称：<input type="text" id="purchase_order_name" class="common_input"/>
				</p>
				<p>
					供应商采购：
					<select id="supplierId" class="common_input">
						<#if suppliers?has_content>
							<#list suppliers as supplier>
								<option value="${supplier.supplierId}">${supplier.supplierName}</option>
							</#list>
						</#if>
					</select>
				</p>
				<p>
					商品明细列表：
					<div id="purchase_detail" class="purchase_detail">
						
					</div>
					<input type="hidden" id="purchaseDetail"/>
				</p>
				<p>
					商品：
					<select id="goods_select" name="" class="common_input">
						<#if goodses?has_content>
							<#list goodses as goods>
								<option value="${goods.goodsId}">${goods.goodsName}</option>
							</#list>
						</#if>
					</select>
				</p>
				<p>
					采购数量：<input id="goods_num" type="text" class="common_input" value="100"/>
					<input type="hidden" id="index_hidden" value="0" />
					
					<input id="add_btn" type="button" onclick="addDetail();" value="添加明细"/>
				</p>
				<p>
					<input type="button" onclick="submitPurchase();" value="提交采购" class="common_btn"/>
				</p>
			</div>
		</div>
		<script>
			function addDetail(){
				var sel = document.getElementById("goods_select");
				if(sel && sel.length < 1){
					return;
				}
				var num = document.getElementById("goods_num").value;
				var indexInput = document.getElementById("index_hidden");
				indexInput.value++;
				var pDetail = [indexInput.value];
				pDetail.push(":");
				
				var purchaseGoodsId = 0;
				for(var i = 0; i < sel.length; i++){
					if(sel[i].selected){
						pDetail.push(sel[i].text);
						sel.removeChild(sel[i]);
						purchaseGoodsId = sel[i].value;
						break;
					}
				}
				
				pDetail.push(",");
				pDetail.push(num);
				pDetail.push("份");
				
				pDetail.push("<input type=\"hidden\" id=\""+purchaseGoodsId+"\" name=\"purchaseGoodsDetail\" value=\""+num+"\" />");
				var detailDiv = document.getElementById("purchase_detail")
				var goodsP = document.createElement("P");
				goodsP.innerHTML = pDetail.join("");
				detailDiv.appendChild(goodsP);
			}
			
			
			function submitPurchase(){
				var items = document.getElementsByName("purchaseGoodsDetail");
				var detailJson;
				if(items && items.length > 0){
					var details = [];
					for(var i = 0; i < items.length; i++){
						var item = {};
						item.quantity = items[i].value;
						item.goodsId = items[i].id;
						item.repostoryId = 1;
						details.push(item);
					}
					detailJson = JSON.stringify(details);
				}
				
				var myForm = document.createElement("FORM");
				myForm.action = "/fruit/back/purchaseController/doPurchase.do";
				myForm.method = "POST";
				//采购名称
				var purchaseName = document.createElement("INPUT");
				purchaseName.name = "purchaseOrderName";
				purchaseName.value=document.getElementById("purchase_order_name").value;
				myForm.appendChild(purchaseName);
				
				//采购供应商
				var purchaseSupplier = document.createElement("INPUT");
				purchaseSupplier.name = "supplierId";
				purchaseSupplier.value=document.getElementById("supplierId").value;
				myForm.appendChild(purchaseSupplier);
				
				//采购明细
				var purchaseOrderDetailsJson = document.createElement("INPUT");
				purchaseOrderDetailsJson.name = "purchaseOrderDetailsJson";
				purchaseOrderDetailsJson.value=detailJson;
				myForm.appendChild(purchaseOrderDetailsJson);
				
				myForm.submit();
				
			}
		</script>
	</body>
</html>