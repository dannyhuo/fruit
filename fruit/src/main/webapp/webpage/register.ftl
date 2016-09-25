<html>
	<head>
		<title>小水果注册</title>
	</head>
	<body>
		<form action="/fruit/customerController/doRegister.do" method="post">
			登录名：<input type="text" name="loginName"/><br/><br/>
			密码：<input type="password" name="password"/><br/><br/>
			确认密码：<input type="password" name="confirmPassword"/><br/><br/>
			姓名：<input type="text" name="realName"/><br/><br/>
			昵称：<input type="text" name="nickName"/><br/><br/>
			手机号：<input type="text" name="mobileNumber"/><br/><br/>
			邮箱：<input type="text" name="email"/><br/><br/>
			<input type="submit" value="register"/>
			<input type="reset" value="reset"/>
		</form>
	</body>
</html>