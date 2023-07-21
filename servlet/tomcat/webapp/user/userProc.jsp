<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="com.sist.web.model.User" %>
<%@ page import="com.sist.web.dao.UserDao" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger("userProc.jsp");
	HttpUtil.requestLogString(request, logger);

	String msg = "";
	String redirectUrl ="";
	
	//request는 나를 호출한 애 임 => 즉,현재페이지인 userProc.jsp를 호출한 곳은 userRegForm.jsp 여서
	//여기서의 "userId"는 userRegForm.jsp에서 보내준 HTMl의 name값인 사용자에게서 입력받은 값임
	String userId = HttpUtil.get(request, "userId");  //실질적으로 공통모듈안에 있는거 HttpUtil.get
	String userPwd = HttpUtil.get(request, "userPwd");
	String userName = HttpUtil.get(request, "userName");
	String userEmail = HttpUtil.get(request, "userEmail");
	//회원가입 할떄도 쓰이지만 회원정보 수정할 떄도 쓰임
	String cookieUserId = CookieUtil.getValue(request, "USER_ID"); //쿠키 로그인되어있는거 확인 용도
	UserDao userDao = new UserDao();
	
	//userPWd값이 넘어오는지 콘솔창에서 로그 찍어보기 위한 용도 -> 만약 에러나면 logger로 찍어봐서 어떤 값이 안오는지 확인하기
	//logger.debug("===============================================");
	//logger.debug("userPwd : " + userPwd);
	//logger.debug("===============================================");
	
	if(StringUtil.isEmpty(cookieUserId))
	{	
		//회원가입
		//필수가 전부 들어왔는지
		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName)
				&& !StringUtil.isEmpty(userEmail)) 
		{ //Dao객체 생성안하면 userDao.~~못함!
			//중복아이디 있는지 확인
			if(userDao.userIdSelectCount(userId) >0)
			{ //userId은 HTML에서 name이 userId인것의 값이 들어오는 거임
			//여기서의 (userId)는 위에서  String userId = HttpUtil.get(request, "userId");로 userRegForm.jsp에서 보내준 HTMl의 name값을 변수에 넣어줬기 떄문에
			//userProc.jsp의 변수 userId 인 것임!! (이 변수 안에 userRegForm.jsp에서 받은 값이 들어있는것일 뿐임!)
			//그래서 여기서userIdSelectCount(userId)를 하면 Dao.jsp에는 userProc.jsp의 변수(변수안에있는값)이 가는 것임
				//다시 중복체크 한번더 함 => URl에 직접쳐서 다이렉트로 들어오는 경우를 막기 위해서 해줌
				//중복아이디 발생 -> 가입페이지로 다시 가게함
				msg = "회원가입 정보가 올바르지 않습니다.";
				redirectUrl = "/user/userRegForm.jsp";
			}
			else
			{
				//회원가입
				//else문안에서 객체 생성한 이유 -> dao에서 만 잠깐 쓸려고 만든거라서
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
					redirectUrl = "/user/userRegForm.jsp";
				}
				
			}
			
		}
		else
		{
			msg = "회원가입 정보가 올바르지 않습니다.";
			redirectUrl = "/user/userRegForm.jsp";
			
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
</html>