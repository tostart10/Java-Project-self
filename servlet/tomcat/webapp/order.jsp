<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피 주문</title>
</head>
<body>
	<h1>커피메뉴</h1><br/>
	<form name="form1" method="post" action="result.jsp">

	<input type="radio" value="1" name="coffee">아메리카노 (3000원)<br>
	<input type="radio" value="2" name="coffee">카페라떼 (3300원)<br>
	<input type="radio" value="3" name="coffee">에스프레소(2500원)<br>
	<input type="radio" value="4" name="coffee">얼그레이티(3500원)<br>
	<br>
	수량 : <input type="text" name="su" size="3"><br>
	입금액 : <input type="text" name="money" size="10">
	<input type="submit" value="주문처리">
	</form>
</body>
</html>