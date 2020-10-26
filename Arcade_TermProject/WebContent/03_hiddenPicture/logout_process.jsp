<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		// 로그아웃을 위해 세션을 제거
		session.invalidate();
		response.sendRedirect("index.jsp");			
	%>
</body>
</html>