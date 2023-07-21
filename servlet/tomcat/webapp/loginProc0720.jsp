<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="com.sist.web.model.User" %>
<%@ page import="com.sist.web.dao.UserDao0720" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<%
   Logger logger = LogManager.getLogger("loginProc.jsp");
   HttpUtil.requestLogString(request, logger);

   String msg = "";   //맨밑에서 메시지 띄우기 위한 변수
   String redirectUrl = "";  //어디로 이동할 지 경로
   
   
   
   String userId = HttpUtil.get(request, "userId");  //request.parameter과 같은 거  아이디 값을 받음
   String userPwd = HttpUtil.get(request, "userPwd");//request
   //HttpUtil 클래스의 get 메서드를 호출하여 request 객체에서 "userId"라는 이름의 매개변수 값을 가져와서 userId라는 문자열 변수에 할당
   String cookieUserId = CookieUtil.getValue(request, "USER_ID"); //쿠키에서 유저아이디가 있으면 가져와(request객체, "USER_ID"는 변수명)
  
   
   logger.debug("============================");
   logger.debug("userId : " + request.getParameter("userId"));
   logger.debug("cookieUserId : " + cookieUserId);
   logger.debug("============================");
   
   logger.debug("============================");
   logger.debug("request.getMethod() : " + request.getMethod());
   logger.debug("============================");
   
   UserDao0720 userDao = new UserDao0720(); //UserDao클래스의 변수, 메서드 등을 사용하려면 객체를 생성해 줘야함
   User user = null;  
   
   
   if(StringUtil.isEmpty(cookieUserId)){ //cookieUserId가 비어있으면 로그인이 안되어 있는사람 
	   
   
	   if(request.getMethod().equals("GET")){ 
		   msg = "POST 방식으로만 접속가능합니다.";
		   redirectUrl = "/";
	   }
	   else{
		   
		   if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))  //값 두개가 모두 들어왔음
		   {
		      user = userDao.userSelect(userId);  
		      
		      if(user != null)
		      {   //아이디가 존재함.
		    	  
		         if(StringUtil.equals(userPwd, user.getUserPwd()))//userPwd는 브라우저에서 사용자한테 입력받은값,user.getUserPwd()은 db에서 저장된거 가져온값
		         {   //로그인성공
		        	 //쿠키정보
		        	 CookieUtil.addCookie(response, "USER_ID", userId); 
		        	 
		            msg = "로그인 성공";
		            redirectUrl = "/";      //추후 게시판 메인페이지로 이동예정. /은8088로그인페이지로 가라는 소리
		         }
		         else
		         {   //비밀번호가 다른경우.
		            msg = "비밀번호가 일치하지 않습니다.";  //null이란 듯으로 아이디자체가 없는것
		            redirectUrl = "/";
		         }
		      }
		      else
		      {   //아이디가 존재하지 않음.
		         msg = "아이디가 존재하지 않습니다.";
		         redirectUrl = "/";
		      }
		   }
		   else{
			   msg= "아이디 나 비밀번호를 입력하세요.";
			   redirectUrl = "/";   
		   }
		   
	   }
	}
   else{
		 user = userDao.userSelect(cookieUserId);
		 
		   //쿠키가 있더라도 사용하는 사용자인지 정지된 사용자인지를 확인
		 if(user != null)
		 {//유저정보가 있음
			 if(StringUtil.equals(user.getStatus(), "Y"))  //정상적인 사용자
			 {
				 msg = "우리사용자";
				 redirectUrl = "/";
			 }
			 else
			 {//Y가 아닌경우 = 정지된 사용자  => 쿠키 삭제해줘야함
			 	CookieUtil.deleteCookie(request, response, "USER_ID");
				 msg = "사용 정지된 아이디 입니다.";
				 redirectUrl = "/";
				 
		 }
		 
	 }
	 else
	 {
		 //쿠키 삭제
		 CookieUtil.deleteCookie(request, response, "USER_ID");
		 //cookie.setMaxAge(0);가 없애줌
		 //공통모듈에서 재대로 처리 되었는지 확인하기 위해 return받음
		 msg = "현재 사용자가 아닙니다.";
		 redirectUrl = "/";
	 }
   }
   
   
%>
<!DOCTYPE html>
<html>
<head>
<!-- header start -->
<%@ include file="/include/head.jsp" %>
<!-- header end -->
<script>
$(document).ready(function(){
	   alert("<%=msg%>");
	   location.href = "<%=redirectUrl%>";
	});
</script>
</head>
<body>

</body>
</html>