<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果</title>
		<#include "/webpage/front/comm/fruit_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/front/comm/fruit_header.ftl"/>
		
		<#--类别信息广告位， height 360px-->
		<div class="type_and_ad">
			<table class="my_category_tab" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td width="200px">
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td style="background-color:#2ca345;"><a><img src="/fruit/webpage/imgs/category_menu_top.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/jin_kou_menu_icon.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/guo_chan_menu_icon.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/jiang_guo_menu_icon.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/gua_guo_menu_icon.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/ju_guo_menu_icon.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/he_guo_menu_icon.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/ren_guo_menu_icon.png"/></a></td>
							</tr>
							<tr>
								<td><a><img class="my_category_menu_img" src="/fruit/webpage/imgs/qi_ta_menu_icon.png"/></a></td>
							</tr>
						</table>
					</td>
					<td><img src="/fruit/webpage/imgs/guang_gao.png"/></td>
				</tr>
			</table>
		</div>
		
		<#--首页商品列表-->
		<#if goodses?has_content>
			<#assign index = 0>
			<#list goodses as listGoodses>
				<#if listGoodses?has_content>
					<#assign index = index + 1>	
					<#--楼层栏， height 45px-->
					<div class="floor_flag">
						<table width="100%" cellspacing="0" cellpadding="0">
							<tr>
								<td width="30px"></td>
								<td class="floor_icon">F${index}</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
					
					<#--楼层对应商品展示栏， height 300px-->
					<div class="floor_goods_list">
						<#include "/webpage/back/goods/inner_goods_list.ftl"/>
					</div>
				</#if>
			</#list>
		</#if>

		<#--首页搜索列表-->
		<#if listGoodses?has_content>
			<#--楼层对应商品展示栏， height 400px-->
			<div class="floor_goods_list">
				<#include "/webpage/back/goods/inner_goods_list.ftl"/>
			</div>
		</#if>
	</body>
</html>