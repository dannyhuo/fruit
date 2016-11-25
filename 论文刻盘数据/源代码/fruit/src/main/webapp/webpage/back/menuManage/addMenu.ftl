<html>
	<head>
		<title>小水果后台管理系统-菜单管理</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<form action="/fruit/back/menuController/addMenu.do" method="post">
					<p>
					菜单名称：<input class="common_input" type="text" name="menuName"/><br/>
					</p>
					<p>
					菜单URL：<input class="common_input" type="text" name="menuUrl"/><br/>
					</p>
					<p>
					<input class="common_btn" type="submit" value="添加菜单"/>
					</p>
				</form>
			</div>
		</div>
		
		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
	</body>
</html>