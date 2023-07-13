<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int dan =Integer.parseInt(request.getParameter("dan"));
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 실행</title>
</head>
<body>
	<h1>구구단 : <%=dan%></h1>
	<%
	for(int i=1; i<=9; i++){
		%>
		 <%=dan%>* <%=i%> = <%=dan * i %> <br>
	<% 
	}
	%>

</body>
</html>