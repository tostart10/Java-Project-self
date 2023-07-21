<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<%
//이거는 로그아웃 기능 임!!!
	Logger logger = LogManager.getLogger("loginOut.jsp");
	HttpUtil.requestLogString(request, logger);
	
	//쿠키가 있을 떄 삭제
	if(CookieUtil.getCookie(request, "USER_ID") != null) //null이 아니라는 것은 값이 있다는 것 =쿠키가 있다는것은 이미 로그인이 되어 있는것
	{
		CookieUtil.deleteCookie(request, response, "USER_ID"); //로그아웃하려면 쿠키를 삭제해줘야해서 deleteCookie로 쿠키 삭제해서 로그아웃 시켜주기
		
	}
	
	response.sendRedirect("/"); //url경로에 다시 보냄, 처리가 끝나면 강제로 클라이언트가 보낸 페이지를 다시 보내줌
%>