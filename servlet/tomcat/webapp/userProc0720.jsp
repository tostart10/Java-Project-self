<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="com.sist.web.model.User" %>
<%@ page import="com.sist.web.dao.UserDao0720" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<% 
	Logger logger = LogManager.getLogger("userProc.jsp");
	HttpUtil.requestLogString(request, logger);

	String msg = "";
	String redirectUrl ="";
	
	
	String userId = HttpUtil.get(request, "userId");  
	String userPwd = HttpUtil.get(request, "userPwd");
	String userName = HttpUtil.get(request, "userName");
	String userEmail = HttpUtil.get(request, "userEmail");
	//회원가입 할떄도 쓰이지만 회원정보 수정할 떄도 쓰임
	String cookieUserId = CookieUtil.getValue(request, "USER_ID"); //쿠키 로그인되어있는거 확인 용도
	UserDao0720 userDao = new UserDao0720();

	if(StringUtil.isEmpty(cookieUserId))
	{	
		//회원가입
		//필수가 전부 들어왔는지
		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName)
				&& !StringUtil.isEmpty(userEmail)) 
		{ //Dao객체 생성안하면 userDao.~~못함!
			//중복아이디 있는지 확인
			if(userDao.userIdSelectCount(userId) >0)
			{ 				//중복아이디 발생 -> 가입페이지로 다시 가게함
				msg = "회원가입 정보가 올바르지 않습니다.";
				redirectUrl = "/user/userRegForm0720.jsp";
			}
			else
			{
				//회원가입
				User user = new User();
				
				user.setUserId(userId);  //각 변수들이 private로 선언됬기 떄문에 setter/getter로 접근해야해서 setter써줌
				user.setUserPwd(userPwd);
				user.setUserName(userName);
				user.setUserEmail(userEmail);
				user.setStatus("Y");
				
				if(userDao.userInsert(user) > 0)
				{
					msg = "회원가입이 완료되었습니다.";
					redirectUrl = "/";  //가입이 되었으면 로그인하러가야해서 로그인페이지로 이동
				}
				else
				{
					msg = "회원가입 중 오류가 발생하였습니다.";
					redirectUrl = "/user/userRegForm0720.jsp";
				}
				
			}
			
		}
		else
		{
			msg = "회원가입 정보가 올바르지 않습니다.";
			redirectUrl = "/user/userRegForm0720.jsp";
			
		}
		
	}
	else{
		//회원정보 수정
		//쿠키가 있으면 호출하겠다
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/head.jsp" %>
<title>Insert title here</title>

<script>
	$(document).ready(function(){
		alert("<%=msg%>");
		location.herf = "<%=redirectUrl%>";
	});
</script>

</head>
<body>

</body>