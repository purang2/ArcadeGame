
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		
		<title>Gamezone </title>
		
		<link rel="stylesheet" type="text/css" href="resources/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/layout_chan.css"/>
		
		<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
		
	
		<style>
		body,p,div,span,ul,ol,li{margin:0; padding:0;}

		a:link{text-decoration:none; color:#444;}
		a:visited{text-decoration:none; color:#444;}
		a:hover{text-decoration:none; color:#444;}
		a:active{text-decoration:none;}
		a:focus{text-decoration:none;}

		/* 리스트 스타일 제거 */
		ul,ol,li{list-style:none;}

		</style>


		<link rel="shortcut icon" href="resources/images/iconcon.jpg"/>
	
	</head>
	<body>
	
	<script>
<%
	boolean login = false;

	if(session.getAttribute("GameId") != null)
		login = true;
%>
</script>
	
 		<div id="wrap">

		<!-- header -->
			<header id="header">
				<div id="gnb" style="position:relative; width:1500px; margin:0 auto;">
					<h1><a href="index.html"></a></h1>
					
					<nav>
						<div class="box" id="home">
							<a class="home" href="WebProject_Main.jsp">Home</a>
						</div>
	
						<ul class="gnb">
							<!-- 
							<li><a href="contents/01_company/sub01.html">게임 소개(준비중)</a>
								<ul class="sub_menu">
									<li><a href="-">틀린그림찾기</a></li>
									<li><a href="-">숨은그림찾기</a></li>
									<li><a href="-">같은그림찾기</a></li>
									<li><a href="-">노노그램</a></li>
								</ul>
							</li>
							 -->
							<li><a href="02_FDI/FDIMenu.jsp">틀린그림찾기</a>
								<ul class="sub_menu">
									<li><a href="02_FDI/FDIMenu.jsp">틀린그림찾기</a></li>
								</ul>
							</li>
							<li><a href="03_hiddenPicture/hiddenPicture.jsp">숨은그림찾기</a>
								<ul class="sub_menu">
									<li><a href="03_hiddenPicture/hiddenPicture.jsp">숨은그림찾기</a></li>
								</ul>
							</li>
							<li><a href="04_SameGrim/game_4x4.jsp">같은그림찾기</a>
								<ul class="sub_menu">
									<li><a href="04_SameGrim/game_4x4.jsp">4X4(초급)</a></li>
									<li><a href="04_SameGrim/game_5x5.jsp">5X5(중급)</a></li>
									<li><a href="04_SameGrim/game_6x6.jsp">6X6(고급)</a></li>
								</ul>
							</li>
							<li><a href="01_nonogram/nonogram1.jsp">노노그램</a>
								<ul class="sub_menu">
									<li><a href="01_nonogram/nonogram1.jsp">노노그램 1</a></li>
									<li><a href="01_nonogram/nonogram2.jsp">노노그램 2</a></li>
								</ul>
							</li>
							<li>	<div class="box" id="log">
<%
	if(login)
		out.println("<a href = '03_hiddenPicture/logout_process.jsp' role = button>로그아웃</a>");
	else
	{
		out.println("<a href = '03_hiddenPicture/login.jsp' role = button>로그인</a>");
		out.println("<a href = '03_hiddenPicture/signup.jsp' role = button>회원가입</a>");		
	}
%>
	</div>
							</li>
						</ul>
					</nav>
				</div>
				<div class="cover"></div>				
			</header>
		<!-- //header -->		
	
			<section id="container">				
				<!-- 본문 -->
				<center>
				<div id="content">
					<div id="fullpage">
						<div class="section" id="section00">
							<div class="area_visual">
								<div class="text">
									<img src="resources/images/img_visual_logo.svg" alt="">
									<h2>Arcade Game Zone</h2>
									<p>'Arcade Game Zone'은 틀린그림찾기, 숨은그림찾기, 같은그림찾기, 노노그램 등 <br/>여가시간을 즐겁게 보내기 위한 게임들을 제공합니다. <br/></p>
								</div>
								<div class="image">
									<img src="resources/images/img_visual07.png" alt="">
								</div>
							</div>
						</div>
			</div>
				<!-- //본문 -->
			</section>

			
		</div>
	</body>
</html>