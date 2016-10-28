<!DOCTYPE html>
<html>
	<head>
		<title>商品管理</title>
		<#include "/webpage/front/comm/fruit_meta.ftl"/>
	</head>
	<body>
		<#--logo及搜索， height 85px-->
		<div class="logo_and_search" style="background-color:#2ca345;">
			<table width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td width="200px" align="center" valign="middle">
						<a href="/fruit/goodsManagement/goodsList.do">
							<img style="background-color:#ffffff;" src="/fruit/webpage/imgs/fruit_logo.png"/>
						</a>
					</td>
					<td width="60px"></td>
					<td>
						<form id="search_form" action="/fruit/goodsManagement/goodsSearch.do" method="post">
							<table cellspacing="0" cellpadding="0">
								<tr>
									<td><input type="text" name="keyWords" value="${keyWords}" class="search_input"/></td>
									<td class="search_btn" onclick="document.getElementById('search_form').submit();">搜索</td>
								</tr>
							</table>
						</form>
					</td>
					<td width="200px" valign="middle">
						
					</td>
				</tr>
			</table>
		</div>
		
		<div class="goodses_management_list">
			<#include "/webpage/back/goods/inner_goods_list.ftl"/>
		</div>
	</body>
</html>