<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
		// 게임을 하기 전, 세션을 통해 로그인 여부를 확인하는 함수
	 	<%
			boolean login = false;
			if(session.getAttribute("GameId") != null)
				login = true;
			if(!login)
			{				
			%>
				alert("본 게임은 로그인을 해야 사용할 수 있습니다.");
				history.go(-1);  
			<%
			}
		%>
</script>