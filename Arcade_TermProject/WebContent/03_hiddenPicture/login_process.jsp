<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "dao.UserDBProcess" %>

<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<%	
		// 로그인 처리를 위한 jsp
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");

		boolean login = false;
		
		// 데이터베이스의 연동을 통한 아이디, 비밀번호 검사, UserDBProcess는 사용자 정보 DB를 다루기 위한 java
 		if (UserDBProcess.loginProcess(id, pw))
		{
			session.setAttribute("GameId", id);
			response.sendRedirect("index.jsp");			
		}
 	%> 	
		<script>
			alert("아이디와 비밀번호가 잘못되었습니다.");
			history.go(-1);  
		</script>

</body>
</html>