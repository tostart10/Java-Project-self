<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>

	<h1>단을 입력하시오</h1>
	<form name="from1" method="post" action="gugudanProc.jsp">
	<input type="number" min="1" max="9" name="dan">
	<input type="submit" value="보내기">
	</form>
</body>
</html>