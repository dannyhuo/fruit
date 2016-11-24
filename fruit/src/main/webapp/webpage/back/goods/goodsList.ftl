<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果后台信息管理系统－商品管理</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<form id="search_form" action="/fruit/back/goodsManagement/goodsSearch.do" method="post">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td><input type="text" name="keyWords" value="${keyWords}" class="search_input"/></td>
							<td class="search_btn" onclick="document.getElementById('search_form').submit();">搜索</td>
							<td width="80"></td>
							<td><a href="/fruit/back/goodsManagement/goodsup.do" class="common_btn">新上架商品</a></td>
						</tr>
					</table>
				</form>
				<div class="back_goodses_management_list">
					<#include "/webpage/back/goods/inner_goods_list.ftl"/>
				</div>
			</div>
		</div>
	</body>
</html>
