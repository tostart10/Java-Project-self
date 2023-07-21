<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/include/head.jsp" %>

<script>
$(document).ready(function(){
	$("#userId").focus(); 
	
	$("btnReg").on("click", function(){
		
		//입력할 수 있는 형식 제한할 정규 표현식
		var idPwCheck = /^[a-zA-Z0-9]{4,12}/; //아이디,비번
		
		var emptCheck = /\s/g;  //공백있는지 확인
		
		var regPhone= /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; //전화번호
		
		
		//입력받은 값들을 공백 제거해주기
		//아이디 길이체크로 입력여부확인 -> 입력안했으면 입력하세요
		if($(trim($("#userId").val()).length <= 0){
			alert("아이디 입력 필수");
			$("#userId").val(""); //값을 공백으로해서 지우고 다시입력하도록함
			$("#userId").focus();//아이디입력창에 포커스
			return;
		}
		
		
		//정규표현식 이용해 아이디 값에 공백이 포함되었는지 확인 -> 공백포함 못한다고 경고창
		if(emptCheck.test($("#userId").val())){
			alert("아이디에 공백 포함 못함");
			$("#userId").val("");
			$("#userId").focus();
			return;
		}
		
		
		
		//아이디로 입력한 값이 정규표현식에 맞지 않을 경우 -> 형식맞추라고 경고
		if(!idPwCheck.test($("userId").val())){
			alert("아이디는  4~12자로 영문 대소문자와 숫자만 허용");
			$("#userId").val("");
			$("#userId").focus();
			return;
		}
		
		
		//비밀번호 길이로 입력했는지 확인
		if($.trim($("userPwd1").val()).length <= 0){
			alert("비밀번호 입력 필수");
			$("userPwd1").val("");
			$("userPwd1").focus();
			return;
		}
		
		//정규표현식으로 비밀번호에 공백추가될 수 없다고 하기
		if(emptCheck.test($("userPwd1").val())){
			alert("비번에 공백쓸수없음");
			$("#userPwd1").val("");   //값 없애줌
			$("#userPwd1").focus();
			return;
		}
		
		//비밀번호가 정규식과 맞는지
		if(!idPwCheck.test($("#userPwd1").val())){
			alert("비밀번호는 영문 대소문자와 숫자로 4~12자리 입니다.");
			$("#userPwd1").val("");
			$("#userPwd1").focus();
			return;
		}
		
		//비밀번호 확인 (1과 2가 같은지만 확인해주면됨)
		if($("#userPwd1").val() != $("#userPwd2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#userPwd2").val("");
			$("#userPwd2").focus();
			return;
		}
		
		//userPwd1이라는 요소의 값을 읽어와서 userPwd라는 hidden타입 요소에 설정하는 코드
		$("#userPwd").val($("#userPwd1").val());
		
		//이름확인
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
		
		
/*		//전화번호 입력안하면
		if($.trim($("#userPhone").val()).length <=0 ){
			alert("전화번호를 입력하세요.");
			$("#userPhone").val("");
			$("#userPhone").focus();
			return;
		}
		
		
		//전화번호 형식 틀리면 다시입력
		if(!regPhone.test($("#userPhone").val())){
			
			alert("전화번호 형식이 틀렸습니다.");
			$().val("");
			$().focus();
			return;
		}
		
		//성별 체크 했는지
		if(){
			}
		}
		
	*/	
		//아이디 중복체크(ajax 통신)
		$.ajax({
			type:"POST",
			url:"/user/userIdCheckAjax.jsp",
			data:{ userId:$("userId").val()},
			datatype:"JSON",
			
			success:funtion(obj){
				var data = JSON.parse(obj);
				
				if(data.flag == 0){
					
					document.regForm.submit();
				}
				else{  //flag:1
					alert("중복된 아이디가 존재합니다.");
					$("#userId").focus();
				}
			}, //여기까지자 if의 짝궁
			complete:function(data)
			{//콘솔에 찍어주기(자바스크립트에 브라우저에 찍어주는것)
				console.log(data);
				
			},
			error:function(xhr, status, error)
			{//ajax 통신자체가 에러가 난다는 의미
				alert("아이디 중복 체크 오류");
			}
			
	});
	
});


//이메일 정규표현식
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
            <form id="regForm" name="regForm" action="/user/userProc0720.jsp" method="post">
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
               
                 <input type="hidden" id="userPwd" name="userPwd" value="" />
                <button type="button" id="btnReg" class="btn btn-primary">등록</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>