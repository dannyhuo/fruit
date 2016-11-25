<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果后台信息管理系统－供应商管理</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<#--供应商列表-->
				<table cellspacing="0" cellpadding="0" border="0" class="out_store_order_list">
					<tr>
						<th>编号</th>
						<th>名称</th>
						<th>地址</th>
						<th>联络人姓名</th>
						<th>联络人手机</th>
						<th>采购员</th>
						<th>备注</th>
					</tr>
					<#if suppliers?has_content>
						<#list suppliers as supplier>
							<tr class="out_Store_order">
								<td>${supplier.supplierId}</td>
								<td>${supplier.supplierName}</td>
								<td>${supplier.address}</td>
								<td>${supplier.contactsName}</td>
								<td>${supplier.contactsMobile}</td>
								<td>${supplier.employeeId}</td>
								<td>${supplier.remark}</td>
							</tr>
						</#list>
					</#if>
				</table>
				
				<#--新增商列表-->
				<form action="/fruit/back/supplierController/addSupplier.do" method="get">
					<p>
						供应商名称：<input type="text" name="supplierName" class="common_input"/>
					</p>
					
					<p>
						联络人姓名：<input type="text" name="contactsName" class="common_input"/>
					</p>
					
					<p>
						联络人手机：<input type="text" name="contactsMobile" class="common_input"/>
					</p>
					
					<p>
						供应商地址：<input type="text" name="address" class="common_input"/>
					</p>
					
					<p>
						对应采购员：
						<select name="employeeId" class="common_input">
							<#if buyers?has_content>
								<#list buyers as buyer>
									<option value="${buyer.employeeId}">${buyer.realName}[NO${buyer.employeeId}]</option>						
								</#list>				
							</#if>
						</select>
					</p>
					<p>
						备注：<textarea rows="5" cols="40" name="remark"></textarea>
					</p>
					<p>
						<input class="common_btn" type="submit" value="新增供应商"/>
					</p>
				</form>
			</div>
		</div>
	</body>
</html>