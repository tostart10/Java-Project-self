<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 테스트</title>
</head>
<body>
	<h1>jsp 첫번째 테스트</h1>
	<%-- 변수와 메소드 선언 --%>
	<%!
		int a;
		int b;
		
		public int sum(int a, int b){
			return a + b;
		}
	%>
	<%-- 자바코드 실행 --%>
	<%
		a = 10;
		b = 20;
		out.println(sum(a,b));
		
		a = 50;
		b = 70;
		out.println(sum(a,b));
	%>
	
	<%-- 변수선언 예제 --%>
	<h1>변수 선언이 늦게 될 경우</h1>
	<%
		String name = team + "화이팅";
	%>
	
	<%!
		String team = "우리팀";
	%>
	최종 출력결과는 <%=name%><br />
	sum 메서드 호출결과 : <%=sum(a, b)%>
	<br />
	<br />
	<%
		int i = 0;
	
		while(true){
			out.println(i + "번째 줄");
			i++;
	
	%>
	<br />========================================<br />
	<%
		if(i>10) break;
	
		}
	%>
	

	

</body>
</html>