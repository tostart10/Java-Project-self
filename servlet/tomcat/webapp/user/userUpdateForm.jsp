<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sist.common.util.StringUtil" %>
<%@ page import="com.sist.web.util.HttpUtil" %>
<%@ page import="com.sist.web.util.CookieUtil" %>
<%@ page import="com.sist.web.model.User" %>
<%@ page import="com.sist.web.dao.UserDao" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger("userUpdateForm.jsp");
	HttpUtil.requestLogString(request, logger);
	
	User user = null;
	
	String cookieUserId = CookieUtil.getValue(request, "USER_ID");
	
	
	//디버깅용
	logger.debug("==================");
	logger.debug("cookieUserId : " + cookieUserId);
	logger.debug("==================");
	
	
	if(!StringUtil.isEmpty(cookieUserId)){
		
		UserDao userDao = new UserDao();
		user = userDao.userSelect(cookieUserId);
		
		//여기까지왔다는 거는 쿠키는 있는데 사용자가 없는것 -> 쿠키를 삭제 해줘야함
		if(user == null){
			//정상 사용자가 아니라면(테이블에 없으면) 쿠키를 삭제하고 로그인 페이지로 이동
			CookieUtil.deleteCookie(request, response, "USER_ID");
			response.sendRedirect("/"); //로그인페이지로 가게함
			
	//브라우저에서는 쿠키를 가지고 있지만 그것을 수정,삭제 등을 할 수 없음!  수정이나 삭제를 하고 싶으면
	//서버에 요청을 해서 서버에서 수정, 삭제를 하고 그것(그값)을 response객체에 담아 브라우저에 보내면 브라우저가 그 쿠키를 받아서 가지고 있는다
	
	
	//CookieUtil.deleteCookie(request, response, "USER_ID"); 해석 -> 클라이언트(브라우저)에서 request를 보내면
	//USER_ID인것을 찾아서 쿠키를삭제하고 그것을 response객체에 담아서 브라우저로 보냄
	//response객체(안에는 쿠키를 지운 정보가 있다)를 받은 브라우저는 그 수정된 정보를 저장한다  
			
			//CookieUtil.deleteCookie(request, response, "USER_ID")에서 
			//쿠키는 브라우저(클라이언트에서 가지고 있음)가 가지고 있는 것임
			//클라이언트에서 서버에 요청을 보내는것
			
			//만약(request, "값")처럼 request만 있으면 값을 보내는거고
			///만약(response, "값")처럼 response만 있으면 값을 받기만 하는 것임
			
		}
		else{
			//null이 아닐경우, user 객체가 있음(존재)??
			//정지된 사용자
			//status를 체크
			if(!StringUtil.equals(user.getStatus(), "Y")){ //상태가 Y가 아닌경우 = 정지된 사용자
				//정지된 사용자인 경우(같지 않은경우니까)
				//여기까지 왔다는 것은 user가 null이 아님
				CookieUtil.deleteCookie(request, response, "USER_ID");
				//user갹체에 null로 다시 세팅
				user = null; //왜 얘를 null로 해주는지? => 전에 new USer로 객체 생성을해서 시작주소값이  변수 user에 그 주소값이 담겨있는데
				//null로 다시 대입해수면 null로 엎어쳐져서 더이상 user가  그 주소를 바라보기 않게 한다. 만약 null로 안해주면 밑에있는 if문이 실행되서 안됨
				response.sendRedirect("/"); //물론 이것떄문에 다시 로그인 페이지로 가서 아래if문은 실행되지 않지만
											//그래도 세팅해주는 것이 좋다
				
			//sendRedirect는 보내기 전에 밑에 있는 로직을 끝까지 전부 실행한 다음에 sendRedirect를 해서 페이지를 로딩함
			//그래서 밑의 if에서 logger로 111을 찍는 코드가 있으면 찍히고 HTMl 화면까지 로딩이 되어서 전부 보여주고나서 
			//sendRedirect되어서 로그인 페이지가 보이는 것임
			//원래는 이렇게 되는게 맞지만 속도가 너무빨라서 밑의 html페이지는 보여지지 않고 바로 로그인페이지가 보이는것뿐임
			}
			
		}
	}
	
	if(user != null)//user객체가 null이 아닐때 실행하자  , if문으로 html을 통째로 감싸준거임, 이거 떄문에 위에서 if문 밖에서 User user = null;해준거임 
	{
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/head.jsp" %>
<script>
$(document).ready(function(){

});

function fn_validateEmail(value)
{
   var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
   
   return emailReg.test(value);
}
</script>
</head>
<body>
<%@ include file="/include/navigation.jsp" %>
<div class="container">
    <div class="row mt-5">
       <h1>회원정보수정</h1>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <form name="updateForm" id="updateForm" action="/user/userProc.jsp" method="post">
                <div class="form-group">
                    <label for="username">사용자 아이디</label>
                    <%=user.getUserId()%>
                </div>
                <div class="form-group">
                    <label for="username">비밀번호</label>
                    <input type="password" class="form-control" id="userPwd1" name="userPwd1" value="<%=user.getUserPwd()%>" placeholder="비밀번호" maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="username">비밀번호 확인</label>
                    <input type="password" class="form-control" id="userPwd2" name="userPwd2" value="<%=user.getUserPwd()%>" placeholder="비밀번호 확인" maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="username">사용자 이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="<%=user.getUserName()%>" placeholder="사용자 이름" maxlength="15" />
                </div>
                <div class="form-group">
                    <label for="username">사용자 이메일</label>
                    <input type="text" class="form-control" id="userEmail" name="userEmail" value="<%=user.getUserEmail()%>" placeholder="사용자 이메일" maxlength="30" />
                </div>
                <input type="hidden" id="userId" name="userId" value="<%=user.getUserId()%>" />
                <input type="hidden" id="userPwd" name="userPwd" value="" />
                <button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

<%
   }
%>
