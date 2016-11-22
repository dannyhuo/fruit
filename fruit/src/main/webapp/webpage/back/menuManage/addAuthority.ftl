<html>
	<head>
		<title>小水果后台管理系统-权限分配</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<form action="/fruit/back/menuController/addAuthority.do" method="post">
					<p>
					菜单名：
					<#if menus?has_content>
						<select class="common_input" name="backMenuId">
							<#list menus as menu>
								<option value="${menu.backMenuId}">${menu.menuName}</option>
							</#list>	
						</select>
					</#if>
					</p>
					<p>
					分配给：
					<select class="common_input" name="role">
						<option value="0">管理员</option>
						<option value="1">运营专员</option>
						<option value="2">接单员</option>
						<option value="3">仓管员</option>
						<option value="4">采购员</option>
					</select>
					</p>
					<p>
					<input class="common_btn" type="submit" value="分配菜单"/>
					</p>
				</form>
			</div>
		</div>
		
		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
	</body>
</html>