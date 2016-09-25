<html>
	<head>
		<title>注册结果</title>
	</head>
	<body>
		注册结果<br/>
		<#if result?has_content && result == 1>
			注册成功
		<#else>
			注册失败
		</#if>
	</body>
</html>