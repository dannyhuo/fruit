<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Hello Word</title>
	</head>
	<body>
		<div>
			<form method="post" action="/XSHG/fruitController/listHelloWord.do">
			用户名：<input type="text" name="userName" value="${userName}"/>
			<input type="submit" value="查询"/>
			</form>
		</div>
		<table border="0px solid #cccccc" cellspacing="1" cellpadding="0" style="background-color:#cccccc;">
			<tr>
				<td bgcolor="white">用户ID</td>
				<td bgcolor="white">用户名</td>
				<td bgcolor="white">创建时间</td>
				<td bgcolor="white">更新时间</td>
				<td bgcolor="white">邮箱</td>
				<td bgcolor="white">手机号</td>
			</tr>
			<#if pageContent?has_content>
				<#list pageContent as user>
					<tr>
						<td bgcolor="white">${user?if_exists.userId}</td>
						<td bgcolor="white">${user?if_exists.userName}</td>
						<td bgcolor="white">${(user?if_exists.createdDate?string('yyyy-MM-dd HH:mm:ss'))!''}</td>
						<td bgcolor="white">${(user?if_exists.updatedDate?string('yyyy-MM-dd HH:mm:ss'))!''}</td>
						<td bgcolor="white">${user?if_exists.email}</td>
						<td bgcolor="white">${user?if_exists.mobileNumber}</td>
					</tr>
				</#list>
			</#if>
		</table>
	</body>
</html>