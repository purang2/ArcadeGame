<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<jsp:include page = "menu.jsp"/>

	<form action="login_process.jsp" method="post" style = "width : 380px; margin : 150px auto">
		<fieldset style=" width: 350px; height: 150px; ">
			<legend><strong>로그인</strong></legend>
			<p>아 이 디 : <input type="text" name="id">
			<p>비밀번호 : <input type="password" name="passwd">
			<p><input type="submit" value="로그인">
		</fieldset>
	</form>
</body>
</html>