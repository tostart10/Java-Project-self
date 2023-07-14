<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<% 
	boolean connection = false;
	Connection conn = null;
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; //orcl
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "c##sistuser", "1234"); //DriverManager를 통해서 접속
		//왓스와 오라클은 일대일 접속
		
		
		if(conn == null){
			System.out.println("DB연결 실패했습니다.");
		}
		else{
			
			connection = true;
			System.out.println("DB 연결 성공했습니다.");
		}
		
		conn.close();
	}
	catch(Exception e){
		
		connection = false;
		System.out.println("오라클 연결 실패");
		e.printStackTrace();
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc 연결 정보</h1>
<%
	if(connection == true){
		
%>
	<h5>DB가 연결되었습니다.</h5>
	<%
	}
	else{
		%>
		<h5>DB 연결이 실패되었습니다.</h5>
<% 
	}
	%>
</body>
</html>