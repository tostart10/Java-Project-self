<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%
boolean connection = false;
Connection conn = null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";

try {
	Class.forName(driver); 
	conn = DriverManager.getConnection(url, "c##iciauser", "1234");
	connection = true;
	System.out.println("DB 연결 성공");
} catch (Exception e) {
	connection = false;
	System.out.println("DB 연결 실패");
	e.printStackTrace();
} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC TEST</title>
</head>
<body>
<%if(connection == true) {%>
	연결되었습니다.
<%} else {%>
	연결실패
<%}%>
</body>
</html>
