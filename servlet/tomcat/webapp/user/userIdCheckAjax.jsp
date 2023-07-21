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
 	//왜 비어있냐, 비어있지 않냐를 해주는 이유는 다이렉트로 치고 들어와서 접속할 수 있기 때문에 그걸 막으려고
 	if(!StringUtil.isEmpty(userId)){
 		
 		UserDao userDao = new UserDao();
 		
 		if(userDao.userIdSelectCount(userId) <= 0)
 		{
 			//해당 아이디 사용가능
 			//JSON방식으로 보내야하기 떄문에 아래와 같은 문법으로 사용함
 			//"안에"가 들어갈려면역슬레시\를 넣어줘야함
 			//넘기는 키는 flag, 값은 : 뒤의 숫자
 			response.getWriter().write("{\"flag\":0}"); //{\"flag\":0} flag는 키 0은 값
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
 
 