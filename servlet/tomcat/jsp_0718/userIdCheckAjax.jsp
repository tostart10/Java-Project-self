<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="com.sist.web.model.User" %>
<%@ page import="com.sist.web.dao.UserDao" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
 
 <%
 	//http로그
 	Logger logger = LogManager.getLogger("userIdCheckAjax.jsp");
 	HttpUtil.requestLogString(request, logger);
 	
 	String userId = HttpUtil.get(request, "userId"); //받아옴
 	
 	//비어있지 않음
 	if(!StringUtil.isEmpty(userId)){
 		
 		UserDao userDao = new UserDao();
 		
 		if(userDao.userIdSelectCount(userId) <= 0)
 		{
 			//해당 아이디 사용가능
 			response.getWriter().write("{\"flag\":0}");
 		}
 		else
 		{
 			//중복아이디 발생
 			response.getWriter().write("{\"flag\":1}");
 		}
 	}
 	else
 	{
 		//아이디가 넘어오지 않았을 때 :  {"flag":-1}  -> 이거를 가지고 제대로 됬는지 안됬는지를 확인
 		response.getWriter().write("{\"flag\":-1}");  //큰따옴표안에 큰따옴표가 그냥들어가면 오류나니까 역슬래시\를 써준다 
 	}
 
 
 %>
 
 