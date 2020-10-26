<%@ page language="java" contentType="text/html; charset=utf-8"%>
<style>
	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
	a:hover { color: blue; text-decoration: underline;}
	.container {background-color : #EAEAEA;height : 50px;}
	.box {position : absolute;}
	#game {
		left : 350px;
		top : 20px;
		width : 900px;
		display : flex;
		justify-content : space-between;
	}
	#log {right : 30px;}
	.home {font-size : 30px; font-color : white;}
</style>

<script>
<%
	boolean login = false;

	if(session.getAttribute("GameId") != null)
		login = true;
%>
</script>


<div class="container">
	<div class="box" id="home">
		<a class="home" href="../WebProject_Main.jsp">Home</a>
	</div>
	<div class="box" id="game">
		<span><a class="game" href="FDIMenu.jsp">틀린그림찾기</a></span>
		<span><a class="game" href="../03_hiddenPicture/hiddenPicture.jsp">숨은그림찾기</a></span>
		<span><a class="game" href="../04_SameGrim/game_4x4.jsp">같은그림찾기</a></span>
		<span><a class="game" href="../01_nonogram/nonogram1.jsp">노노그램</a></span>
	</div>
	<div class="box" id="log">
<%
	if(login)
		out.println("<a href = '../03_hiddenPicture/logout_process.jsp' role = button>로그아웃</a>");
	else
	{
		out.println("<a href = '../03_hiddenPicture/login.jsp' role = button>로그인</a>");
		out.println("<a href = '../03_hiddenPicture/signup.jsp' role = button>회원가입</a>");		
	}
%>
	</div>
</div>