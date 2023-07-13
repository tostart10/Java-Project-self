<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//넘겨받은 값 추출
	int coffee= Integer.parseInt(request.getParameter("coffee"));
//리퀘스트 객체가 없는데 어떻게 request.쓸수 있나 =>Httpservlet을 상속받았기 때문에 사용할 수 있다
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));

	String menu ="";
	int dan = 0;
	

	if(coffee == 1){
		menu ="아메리카노";
		dan = 3000;
	}
	else if(coffee == 2){
		
		menu="카페라떼";
		dan = 3300 ;
	}
	else if(coffee == 3){
			
		menu="에스프레소";
		dan = 2500;
		}
	else if(coffee == 4){
		
		menu="얼그레이티";
		dan = 3500;
	}

	
	int total = dan * su;
	int change = money - total;
	
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<h1>주문 계산 결과</h1>
	<br>
	<br>
	<ul>
		<li>커피종류 :<%=menu%> </li>
		<li>1개 가격 :<%=dan%> </li>
		<li>수량 : <%=su%></li>
		<li>총 금액 : <%=total%></li>
		<li>입금액 : <%=money%></li>
		<li>거스름돈 : <%=change%></li>
	</ul>
	
		

</body>
</html>