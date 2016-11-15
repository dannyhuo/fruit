<html>
	<head>
		<title>小水果注册</title>
		<link rel="stylesheet" href="/fruit/webpage/css/register.css" />
		<link rel="stylesheet" href="/fruit/webpage/css/fooder.css" />
	</head>
	<body>
	
		<#--logo及搜索， height 85px-->
		<div class="logo_and_search">
			<table width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td width="200px" align="center" valign="middle">
						<a href="/fruit/index.do">
							<img src="/fruit/webpage/imgs/fruit_logo.png"/>
						</a>
					</td>
					<td width="60px"></td>
					<td>
						<span class="register_words">注册结果</span>
					</td>
					<td width="200px" valign="middle">
						
					</td>
				</tr>
			</table>
		</div>
		
		<#if result?has_content && result > 1>
			注册成功
		<#else>
			<span style="color:red;">错误信息：${message}</span>
		</#if>

		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
	</body>
</html>