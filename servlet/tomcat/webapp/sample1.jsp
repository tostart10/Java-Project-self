<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp 첫번째 예제</h1>
	<%-- 변수 및 메서드 선언 --%>
	<%!
		int a;
		int b;
		
		public int sum(int a, int b)
		{
			return a + b;
		}
	%>
	<%-- 자바코드 삽입 --%>
	<%
		a = 10;
		b = 20;
		out.println(sum(a, b));
	%>
	
	<br />
	<h1>표현식 적용</h1>
	<%
		a = 15;
		b = 30;
	%>
	<%=sum(a, b)%>
	<br />
	<%-- jsp 스크립트 --%>
	<%
		int i = 0;
		while(true)
		{
			out.println(i + " 번째 줄");
			i++;
	%>
	<br />=============================<br />
	<%			
			if(i > 5)
				break;
		}
	%>
</body>
</html>




