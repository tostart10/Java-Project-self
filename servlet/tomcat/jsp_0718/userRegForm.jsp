<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/include/head.jsp" %>



<script>
//이거는 클라이언트에서 돌아가는 거임!!
//jQuery, javascript는 클라이언트에서 돌아감
//jsp는 서버에서 돌아감
//jsp를 서버에서 돌리고 나머지 HTML들을 모아서 서버에서 클라이언트에게 다시 넘겨줌
$(document).ready(function(){ //페이지가 준비되면 function을 실행해라
	$("#userId").focus(); //커서 깜빡거림
	
	$("#btnReg").on("click", function(){
		//영문 대소문자, 숫자로만 이루어지고 4~12자리에 대한 정규표현식
		var idPwCheck = /^[a-zA-Z0-9]{4,12}/;  //영문과 숫자만 사용, 특수문자는 안쓰겠다는것!!
		//모든 공백 체크 정규표현식
		var emptCheck = /\s/g;      // \s은 공백을 뜻함
		
		
		//자바스크립으로 trim처리해줘도 되지만 제이쿼리로 해줬음
		//trim처리를 하고 값을 구해야함
		//즉 공백이 들어가면 안된다
		if($.trim($("#userId").val()).length <= 0)
		{
				alert("사용자 아이디를 입력하세요.");
				$("#userId").val(""); //값을 지우겠다는 의미
				$("#userId").focus();    //val() ()안에 값있으면 setter, 없으면 getter???
				return;
		}
		
		//$("userId").val() 이거 통채로 하나임
		if(emptCheck.test($("#userId").val())){
			
			alert("사용자 아이디는 공백을 포함할 수 없습니다.");  //아이디에 공백있으면 경고창 띄우로 값 날려주기
			$("#userId").val("");
			$("#userId").focus();
			return;
		}
		
		
		//해당하는 값이 아닐때
		if(!idPwCheck.test($("#userId").val())) {
			alert("사용자 아이디는 4~12자로 영문 대소문자와 숫자로만 입력하세요.");
			$("#userId").val("");
			$("#userId").focus();
			return;
		}
		
		
		if($.trim($("#userPwd1").val()).length <= 0){
			
			alert("비밀번호를 입력하세요.");
			$("#userPwd1").val("");   //값 없애줌
			$("#userPwd1").focus();		//다시 입력하도록 그곳에 커서 가져다 놓아줌
			return;
		}

		//비밀번호는 공백을 포함할 수 없게 하기
		if(emptCheck.test($("#userPwd1").val())){
			
			alert("비밀번호는 공백을 포함할 수 없습니다.");
			$("#userPwd1").val("");   //값 없애줌
			$("#userPwd1").focus();		//다시 입력하도록 그곳에 커서 가져다 놓아줌
			return;
		}
		
		
		if(!idPwCheck.test($("#userPwd1").val())){
			alert("비밀번호는 영문 대소문자와 숫자로 4~12자리 입니다.");
			$("#userPwd1").val("");
			$("#userPwd1").focus();
			return;
		}
		
		//비밀번호 확인은 비번과 같은지만 확인해주면 됨
		if($("#userPwd1").val() != $("#userPwd2").val()){
			
			alert("비밀번호가 일치하지 않습니다.");
			$("#userPwd2").val("");
			$("#userPwd2").focus();
			return;
		}
		
		//input type=hidden은 전재는 userPwd을 서버에서 가져다 사용한다는것
		//userPwd1, userPwd2가 서브가 안날라가는 것이 아님  form 태그에 있는 것들 모두 서버로 날라감
		//그중 userPwd를 나려주겠다는 뜻임
		$("#userPwd").val($("#userPwd1").val());
		
		
		//이름
		//길이만 입력되었나 확인
		if($.trim($("#userName").val()).length <= 0){
			
			alert("사용자 이름을 입력하세요.");
			$("#userName").val("");
			$("#userName").focus();
			return;
		}
		
		//이메일 확인
		if($.trim($("#userEmail").val()).length <=0 ){
			
			alert("사용자 이메일을 입력하세요.");
			$("#userEmail").val("");
			$("#userEmal").focus();
			return;
		}
		
		if(!fn_validateEmail($("#userEmail").val())){
			
			alert("사용자 이메일 형식이 올바르지 않습니다. 다시 입력하세요.");
			$("#userEmail").focus();
			return;
		}
		//if가 끝났다는 것을 정상적으로 회원가입이 됬다는 것
		
		
		//이이디 중복체크(ajax 통신)
		
		$.ajax({
			type:"POST",
			url:"/user/userIdCheckAjax.jsp",
			data:{
				userId:$("#userId").val()
			},
			datatype:"JSON", //여기까지가 서버에서 실행하라고 요청
			success:function(obj){ //success:function부터error:function 까지는 클라이언트에서 실행되는 거임
				//어떤게 먼저 찍히는 지 확인용
				alert("1111");
				
				var data = JSON.parse(obj); //obj는 response안에 있는 객체를 JSON파일 형식으로 가져와서 data에 넣겠다
				//객체를쓰려면 .을 사용해야함
				//parse는 변환하는것
				//obj는 이름을 마음대로 해준거임
				//obj객체를 가져와서 JSON형태로 변환해 data에 넣어주겠다
				
				//그래서 data.flag는 JSON.parse(obj).flag 인것임
				if(data.flag == 0){//왜 flag를 사용하는지? flag == 0은 flag로 받을거다??
					//회원가입 가능
					alert("회원가입 가능");
					//document.regForm.submit();
				}
				else{  //flag:1
					alert("중복된 아이디가 존재합니다.");
					$("#userId").focus();
				}
			}, //여기까지자 if의 짝궁
			complete:function(data)
			{
				//완료되면 실행?
				//응답이 종료되면 실행, 잘 사용하지 않음  (응답이 종료는 request를 보내고 response가 온것을 말함 (클라이언트 입작에서))
				//콘솔에 찍어주기(자바스크립트에 브라우저에 찍어주는것)
				console.log(data);
				
				//어떤게 먼저 찍히는 지 확인용
				alert("2222");
			},
			error:function(xhr, status, error)
			{//ajax 통신자체가 애러가 난다는 의미
				alert("아이디 중복 체크 오류");
			}
		});
		
		//ajax 통신을 하려면 request와 response에 대한 개념을 잘 알아야함
		//url:"/user/userIdCheckAjax.jsp" 이렇게 해주는게 ajax 통신
		//콤마(,)하나하나가 값(요소)임
		//type은 POST방식으로 넘기겠다는 뜻
		//url은 HTML의 action과 같은것
		//var data = JSON.parse(obj)-> JSON 방식으로 가져오겠다
		
		//document.regForm.submit();
		
		
		
	});
});



//이메일을 함수로 따로 빼서 확인할 수도 있고 제이쿼리로 확인해줄 수 도 있다
//자바스크립트 (제이쿼리 안에 넣으면 안됨 주의!!)- 이메일 체크
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
       <h1>회원가입</h1>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <form id="regForm" name="regForm" action="/user/userProc.jsp" method="post">
                <div class="form-group">
                    <label for="username">사용자 아이디</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 아이디" maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="username">비밀번호</label>
                    <input type="password" class="form-control" id="userPwd1" name="userPwd1" placeholder="비밀번호" maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="username">비밀번호 확인</label>
                    <input type="password" class="form-control" id="userPwd2" name="userPwd2" placeholder="비밀번호 확인" maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="username">사용자 이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="사용자 이름" maxlength="15" />
                </div>
                <div class="form-group">
                    <label for="username">사용자 이메일</label>
                    <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="사용자 이메일" maxlength="30" />
                </div>
                <input type="hidden">
                <button type="button" id="btnReg" class="btn btn-primary">등록</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>