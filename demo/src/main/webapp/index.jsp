<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>XSHG</title>
</head>
<body>
	This my index page!<br>
	Hello, XSHG!
	<br><br>
	
	<form action="/XSHG/fruitController/helloWord.do" method="post">
		UserID:<input type="text" name="userId" /><br>
		UserName:<input type="text" name="userName" /><br>
		password:<input type="password" name="password" /><br>
		<input type="submit" value="submit" />
	</form>
	
	<a href="/XSHG/fruitController/listHelloWord.do">go to list</a>
</body>
</html>