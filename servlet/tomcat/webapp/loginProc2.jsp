<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="com.sist.web.model.User2" %>
<%@ page import="com.sist.web.dao.UserDao" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<%
   Logger logger = LogManager.getLogger("loginProc2.jsp");
   HttpUtil.requestLogString(request, logger);

   String msg = "";  
   String redirectUrl = "index0717.jsp"; 
   
   logger.debug("============================");
   logger.debug("userId : " + request.getParameter("userId"));
   logger.debug("============================");
   
   String userId = HttpUtil.get(request, "userId");  
   String userPwd = HttpUtil.get(request, "userPwd");
   
   logger.debug("============================");
   logger.debug("userId : " + userId);
   logger.debug("============================");
   
   UserDao userDao = new UserDao();
   User2 user2 = null;  
   
   if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd)) 
   {
      user2 = userDao.userSelect2(userId); 
      
      if(user2 != null)
      {   
         if(StringUtil.equals(userPwd, user2.getUserPwd()))
         {  
            msg = "로그인 성공";
            redirectUrl = "index0717.jsp";      
         }
         else
         {   
            msg = "비밀번호가 일치하지 않습니다."; 
            redirectUrl = "index0717.jsp";
         }
      }
      else
      {  
         msg = "아이디가 존재하지 않습니다.";
         redirectUrl = "index0717.jsp";
      }
   }
   else{
	   msg= "아이디 나 비밀번호를 입력하세요.";
	   redirectUrl = "index0717.jsp";   
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