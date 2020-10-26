<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "dao.UserDBProcess" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>

<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
<script>
	// 회원가입의 처리를 위한 jsp
	<%	
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String nation = request.getParameter("nation");
		
		// 데이터베이스의 연동을 통한 아이디 중복 확인, UserDBProcess는 사용자 정보 DB를 다루기 위한 java
		if (UserDBProcess.idCheck(id))
		{
			%>
			alert("아이디가 중복됩니다.");
			history.go(-1);  
			<%
		}		
		else
		{
			// 중복된 아이디가 없을 경우 해당 입력값들을 데이터베이스에 저장
			UserDBProcess.signupProcess(id, pw, name, birth, nation);			
			session.setAttribute("GameId", id);
			response.sendRedirect("index.jsp");						
		}		
	%>
</script>		
</body>
</html>