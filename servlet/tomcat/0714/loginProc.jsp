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
   
   logger.debug("============================");
   logger.debug("userId : " + request.getParameter("userId"));
   logger.debug("============================");
   
   String userId = HttpUtil.get(request, "userId");  //request.parameter과 같은 거  아이디 값을 받음
   String userPwd = HttpUtil.get(request, "userPwd");
   
   logger.debug("============================");
   logger.debug("userId : " + userId);
   logger.debug("============================");
   
   UserDao userDao = new UserDao();
   User user = null;  //유저방만 만들어놓음  여기에는 시작 주소만 들어올 수 있음
   
   if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))  //값 두개가 모두 들어왔음
   {
      user = userDao.userSelect(userId);  //String 타입을 하나 보낼건데
      //여기서 시작값을 보낸다는것
      //DAo에서 생성한 주소값을 받기 때문에 여기서 객체 생성하면 안됨
      
      if(user != null)
      {   //아이디가 존재함.
    	  
    	  //아이디가 틀린지 비번이 틀린지 확인
         if(StringUtil.equals(userPwd, user.getUserPwd()))//userPwd는 브라우저에서 사용자한테 입력받은값,user.getUserPwd()은 db에서 저장된거 가져온값
         {   //로그인성공
            msg = "로그인 성공";
            redirectUrl = "/";      //추후 게시판 메인페이지로 이동예정.
         }
         else
         {   //비밀번호가 다른경우.
            msg = "비밀번호가 일치하지 않습니다.";
            redirectUrl = "/";
         }
      }
      else
      {   //아이디가 존재하지 않음.
         msg = "아이디가 존재하지 않습니다.";
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