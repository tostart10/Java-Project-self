<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="com.sist.web.model.User" %>
<%@ page import="com.sist.web.dao.UserDao" %>
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
   //54_3:00
   
   logger.debug("============================");
   logger.debug("userId : " + request.getParameter("userId"));
   logger.debug("cookieUserId : " + cookieUserId);
   logger.debug("============================");
   
   logger.debug("============================");
   logger.debug("request.getMethod() : " + request.getMethod());
   logger.debug("============================");
   
   UserDao userDao = new UserDao(); //UserDao클래스의 변수, 메서드 등을 사용하려면 객체를 생성해 줘야함
   User user = null;  //유저방만 만들어놓음  여기에는 시작 주소만 들어올 수 있음 ,54시작
   //user는 여기서 new 안해줌, 메서드가 static이여서(?)
   //dao는 모조건 객체 생성해줘야함
   //53_5:00
   //User객체를 바라보는 변수를 만든거임 하지만 new로 객체를 생성하지는 않아서 초기값을null로 해놓은것
   //만들어질 User객체의 시작주소값을 받을 방만 생성
   
   //쿠키
   //쿠키가 있으면 로그인되어 있는사람, 쿠키가 없으면 로그인 안된사람
   //쿠키가 없으면 로그인 시켜줌
   if(StringUtil.isEmpty(cookieUserId)){ //cookieUserId가 비어있으면 로그인이 안되어 있는사람 
	   
   
	   if(request.getMethod().equals("GET")){ //왜 request.인가요??= jsp는 servlet을 기반으로 함,  GET, POST는 꼭 대문자로 써야함!!,  getMethod는 getter임
		   
		   msg = "POST 방식으로만 접속가능합니다.";
		   redirectUrl = "/";
	   }
	   else{
		   
		   if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))  //값 두개가 모두 들어왔음
		   {
		      user = userDao.userSelect(userId);  //String 타입을 하나 보낼건데  //userSelect(userId)에서 new해서 객체를 생성하고 그 주소를 user에 넣어주는것
		      //여기서 시작값을 보낸다는것
		      //DAo에서 생성한 주소값을 받기 때문에 여기서 객체 생성하면 안됨
		      //이렇게주소값을 대입해주므로써 바로 위의 User user = null;로 선언된 user변수안에 userDao.userSelect(userId)에서 생성한 객체의 주소값이 들어가서
		      //결국 user과 userDao.userSelect(userId)의 주소값은 똑같아서 둘다 바라보는 곳이 같아짐
		      //53_42:00
		      //UserDao.jsp에서 return user; 해서 주소값을 return으로 던져준거를 여기서 받음
		      
		      if(user != null)//54-11:00
		      {   //아이디가 존재함.
		    	  
		    	  //아이디가 틀린지 비번이 틀린지 확인
		         if(StringUtil.equals(userPwd, user.getUserPwd()))//userPwd는 브라우저에서 사용자한테 입력받은값,user.getUserPwd()은 db에서 저장된거 가져온값
		         {   //로그인성공
		        	 //쿠키정보
		        	 CookieUtil.addCookie(response, "USER_ID", userId); //이름은 USER_ID로 직접 설정클라이언트에게서 받은 값userId
		        	 //브라우저에서 값을 가져와야하므로 response가 오는 것임
		        	 //cookie add, delete는 서버에서 해주는 거기 때문에 response
		        	 //cookie를 읽어오는것은 브라우저에서 하는 거기때문에 request
		        	 
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
			   redirectUrl = "/";    //아이디가 존해하지 않으면 다시 로그인화면으로 돌아가도록함
			   //index.jsp 에서 <a class="nav-link" href="/"> 로그인</a> 중에서 href="/"라고 
			   ///로 돌아가도록 설정해줬기 때문에  "/"을 했을때 로그인 화면으로 돌아갈 수 있는것임
		   }
		   
	   }
	}
   else{
		   //이미 로그인이 되어 있어 쿠키가 있는사람
		 //쿠키정보는 있으나 올바른 사용자 여부 판단
		 //악플달거나 안좋은 행동을 하는사람 거르기 위함
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
		 
		 
		 //우리 사용자가 아닐려면 user = userDao.userSelect(userId); userSelect이 없어야함
	 }
   }
   
   //POST로만 처리하며, GET인 경우는 msg = "POST 방식으로만 접속가능합니다."로 처리하고
	//로그인 페이지로 이동
	
   
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