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
						<span class="register_words">注册</span>
					</td>
					<td width="200px" valign="middle">
						
					</td>
				</tr>
			</table>
		</div>
		
		<div class="register_pan">
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td align="center">
						<div class="my_register">
							<form action="/fruit/customerController/doRegister.do" method="post">
								<p>
								登&nbsp;录&nbsp;名：<input type="text" name="loginName"/>
								</p>
								
								<p>
								密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"/>
								</p>
								
								<p>
								确认密码：<input type="password" name="confirmPassword"/>
								</p>
								
								<p>
								姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="realName"/>
								</p>
								
								<p>
								昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：<input type="text" name="nickName"/>
								</p>
								
								<p>
								手&nbsp;机&nbsp;号：<input type="text" name="mobileNumber"/>
								</p>
								
								<p>
								邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" name="email"/>
								</p>
								
								<p>
								<input class="register_btn" type="submit" value="立即注册"/>
								</p>
							</form>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<#include "/webpage/front/comm/fruit_fooder.ftl"/>
	</body>
</html>