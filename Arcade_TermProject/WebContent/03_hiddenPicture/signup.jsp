<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.UserDBProcess" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<script src="jquery-3.5.1.min.js"></script>
<script>
	// 회원가입을 하기 전, 유효성 검사를 위한 함수
	function signupCheck()
	{	
		var form = document.signupForm;		
		var reg = /^[a-z|A-Z|0-9]/;  // 영문(대, 소), 숫자를 제외한 문자의 사용을 금지
		
		if(form.id.value.length < 6 || form.id.value.length > 11)
		{
			alert("아이디는 6자에서 11자 이내로 입력해주세요.");
			form.id.focus();
			return false;
		}		
		if(!reg.test(form.id.value))
		{
			alert("아이디는 영문과 숫자만 입력하세요");
			return false;
	    }
		if(form.password.value.length < 5 || form.password.value.length > 15)
		{
			alert("비밀번호는 5자에서 15자 이내로 입력해주세요.");
			form.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page = "menu.jsp"/>

	<form name = "signupForm" onsubmit = 'return signupCheck();' action = "signup_process.jsp" method = "get" style=" width: 530px; margin : 120px auto;"> 
		<fieldset style=" width: 500px; height: 280px; ">
			<legend><strong>회원 가입</strong></legend>
			<p><label>아이디 : <input type = "text" name = "id" required></label> </p> 
			<p><label>비밀번호 : <input type = "password" name = "password" required></label></p>
			<p><label>성명 : <input type = "text" name = "name" required></label></p>
			<p><label>생년월일 : <input type = "date" name = "birth" required></label></p>
			<p><label>국가 : <input type = "text" name = "nation" required></label></p>
			<input type = "submit">
		</fieldset>
	</form>				
</body>
</html>