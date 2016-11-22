<html>
	<head>
		<title>小水果后台管理系统登录</title>
		<link rel="stylesheet" href="/fruit/webpage/css/login.css" />
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
						<span class="login_words">后台登录</span>
					</td>
					<td width="200px" valign="middle">
						
					</td>
				</tr>
			</table>
		</div>
		
		<div class="login_main">
			<div class="login_ad">
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td align="center">
						</td>
					</tr>
				</table>
			</div>
			<div class="login_pan">
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td align="center">
							<p>
								<span class="welcome_login_words">欢迎登录</span>
								<span class="account_alert">还没有账号？</span>
								<a class="register_link" href="/fruit/back/register.do">立即注册</a>
							</p>
							
							<form action="/fruit/employee" method="post">
								<p>
								登录名：<input class="login_input" type="text" name="loginName"/><br/>
								</p>
								<p>
								密&nbsp;&nbsp;&nbsp;码：<input class="login_input" type="password" name="password"/><br/>
								</p>
								<p>
								<input class="login_btn" type="submit" value="login"/>
								</p>
							</form>
							
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
	</body>
</html>