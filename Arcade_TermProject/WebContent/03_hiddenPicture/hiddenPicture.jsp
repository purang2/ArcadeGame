<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Picture" %>
<%@ page import = "dao.PictureRepository" %>

<jsp:useBean id="pictureDAO" class = "dao.PictureRepository" scope = "page"/>

<html>
<head>
	<title>Hidden Pictures</title>

	<link type="text/css" rel="stylesheet" href="../resources/css/hiddenPicture.css"></link>
    <script src="jquery-3.5.1.min.js"></script>
	<jsp:include page = "loginCheck.jsp"/>

 	<script>
 		// 서버에 저장된 숨은 그림에 대한 정보 사용
		var pictures = [];
		<%

			PictureRepository dao = PictureRepository.getInstance();		
			for(int i=1;i<=dao.getSizeOfList();i++){	
				Picture picture = dao.getPictureByStage(i);								
		%>		
				pictures.push({picture : "<%=picture.getPicture()%>", targetPictures : ["<%=picture.getTargetPictures()[0]%>"], targetPos : ["<%=picture.getTargetPos()[0]%>"], answerPicture : "<%=picture.getAnswerPicture()%>"});
		<%
				for(int j=1;j<9;j++){
		%>
					pictures[<%=i-1%>].targetPictures.push("<%=picture.getTargetPictures()[j]%>");
					pictures[<%=i-1%>].targetPos.push("<%=picture.getTargetPos()[j]%>");
		<%
				}
			}
		%>
		const EndStage = <%= dao.getSizeOfList()%>;						
		
		var score = 0;
		var targetN = 5;
		var foundTarget = [0,0,0,0,0,0,0,0,0,0,0];
		var timer = null;	 	
		var seconds = 120;
		var stage=0;
		var timeRecords = [];
		var targetNRecords = [];

		$(document).ready( function () {
			// 게임의 시작
	 	    $("#start_hiddenPictures").click( function(){
	 	 		$('#next_div').remove();
	 	    	setHiddenGamePage();
	 	    });

			// 게임 설정 모드
	 		$('#setting').click(function() {
	 			settingDisplay();	 			
	 	 	});
			
			// 게임 설정 수정의 적용
	 		$('#setting_change').click(function() {
	 			settingChange();	 			
	 	 	});
	 	}); 	
		
		function settingDisplay()  // 게임 설정 모드 표현
		{
 	 		$('#next_div').remove();
 	 		$('#setting_div').css('display', 'block');			
		}
		
		function settingChange()  // 게임 설정 수정의 적용
		{
 	 		$('#setting_div').css('display', 'none');
 	 		targetN = $('input[name=targetN]:checked').val();
 	 		seconds = $('input[name=countdown]:checked').val() *2;
 	    	stageAgain();
		}
	 	function setHiddenGamePage()	//숨은 그림찾기 게임 함수
	 	{	
	 		
	 		foundTarget = [0,0,0,0,0,0,0,0,0];
			score =0;
			
	 		var targetList = "";	 		
			var hiddenPicture = "";
	 		
			$("#hiddenPicture_div").html('<div id = "hiddenPicture_div2"> </div>');
	 		var li_padding = String((((750 - 60)/targetN)- 60)/2-1) + "px";

	 		// 숨은 그림 표현을 위한 문자열
	 		hiddenPicture = "<img id = 'hiddenPicture_img' src = 'resources/hiddenPictureImg/" + pictures[stage].picture + "' usemap='#Map'>";
	 		hiddenPicture += '<map name="Map" id="Map">';

	 		// 숨은 그림찾기의 타겟 이미지들을 리스트 태그로 표현, 타겟 위치를 맵핑(정해진 위치에 마우스 입력시 발견 함수 호출)
	 		for(var i=0;i<targetN;i++)
	 		{
	 			targetList += "<li style = 'padding : 0 " + li_padding + "'><img id = 'target_img' src = 'resources/hiddenPictureImg/" + pictures[stage].targetPictures[i] + "'></li>";
		 		hiddenPicture += '<area shape="rect" coords="'+ pictures[stage].targetPos[i] +'" onClick="findTarget('+ String(i) + ')">';	
		 	}
 	 		hiddenPicture += '</map>';
			
 	 		// 실제로 화면에 숨은 그림과 타겟 이미지, 점수, 단계, 타겟 수, 표현
	 		$("#hiddenPicture_div2").html(hiddenPicture);
		    $("#target_list").html(targetList);
		    
			$("#score").text(score);	 
		    $("#target_n").text(targetN);	  
		    $("#stage").text(parseInt(stage)+1);	
			
		    // 시간 제한을 위한 초기화 설정
		    ct = seconds;
//		    ct = 3;
		    $('#countdown_bluebox').css('width', 300);
	 		timer = setInterval(countdownBox, 1000);
	 		
 	 	}		


		// 시간 제한 함수, 블루 박스의 크기를 줄이면서 남은 시간 표현
	 	function countdownBox()
	 	{
	 		ct--;
		    $('#countdown_bluebox').css('width', (300 / seconds) * ct);
	 		if(ct <0)
	 		{
	 			clearInterval(timer);
				$("#hiddenPicture_Game").append("<div id = 'next_div' style = 'background:rgba(255, 0, 51, 0.5)'></div>");	 						
				$("#next_div").html("<div>제한 시간이 끝났습니다<br> <button style = 'width : 80px' onClick = 'stageAgain()'>다시 하기</button><button style = 'margin-left : 10px; width : 80px' onClick = 'displayAnswer()'>정답 보기</button><button style = 'margin-left : 10px; width : 80px' onClick = 'settingDisplay()'>설정</button></div>"); 		 				
			    return;
	 		}
	 	}
	 	
		// 타겟을 발견했을 경우 호출되는 함수
	 	function findTarget(target)
	 	{
	 		if (foundTarget[target] != 1)
	 		{
	 			foundTarget[target] = 1
		 		score++;
				$("#score").text(score);	 	 			
				
		 		var x = event.offsetX;
		 		var y = event.offsetY;				
				
		 		var top = -400 + y - score * 64;
		 		var left = -30 + x;

		 		$("#hiddenPicture_div").append("<div class = 'right_circle_div' style = 'position : relative; top : " + String(top) +"px; left : " + String(left) + "px'></div>");
 		 		$(".right_circle_div").html("<img src = 'resources/hiddenPictureImg/right_circle.png'>");				

 		 		// 모든 타겟을 찾았을 경우 다음 스테이지로 이동
 		 		if(score == targetN)
 		 		{ 		 			
 			        clearInterval(timer);
 			        // 현재 스테이지가 마지막일 경우 완료 후 종료
 		 			if(stage == EndStage -1)
 		 			{
  	  					$("#hiddenPicture_Game").append("<div id = 'next_div'></div>");	 		
 	  					$("#next_div").html("<div>모든 스테이지를 완료했습니다</div>");
	  					timeRecords[stage] = seconds - ct;
	  					targetNRecords[stage] = targetN;

 		 			}else	// 마지막 스테이지가 아닐 경우 다음 스테이지로 이동
 		 			{
 	  					$("#hiddenPicture_Game").append("<div id = 'next_div'></div>");	 		
	  					$("#next_div").html("<div>다음 레벨을 진행하시겠습니까?<br>	<button onClick = 'stageAgain()'>시작</button></div>"); 		 				
	  					timeRecords[stage] = seconds - ct;
	  					targetNRecords[stage] = targetN;
 		 		 		stage++;
 		 		 	}
 		 		}
	 		}
	 	}
	 	
		// 스테이지 정리를 위한 함수(설정 변경의 경우, 다음 스테이지로 이동할 경우, 현재 스테이지를 다시 반복할 경우 사용)
	 	function stageAgain()
	 	{
	 		$('#next_div').remove();
	 		$('#answer_img').empty();
	 		setHiddenGamePage();	 		
	 	}
	 	
		// 스테이지 실패 후 정답을 확인하기 위한 함수(모든 정답이 공개)
	 	function displayAnswer()
	 	{
	 		$('#answer_img').html("<img src = 'resources/hiddenPictureImg/" + pictures[stage].answerPicture + "'>");
	 	}

 	</script>
</head>

<body>
	<jsp:include page = "menu.jsp"/>

	<div id = "hiddenPicture_page"><h2>숨은 그림 찾기</h2>
	
	<div>
		
		<span>시간 : <div id = "countdown_redbox"><div id = "countdown_bluebox"></div></div></span>
		<span style = 'margin-left:250px'>개수 : <span id = "score">-</span>/<span id = "target_n">-</span></span> 
		<span>단계 : <span id = "stage">-</span></span>
		
		<div id =  "hiddenPicture_Game">
			<div id = "hiddenPicture_div"> </div>		
			<div id = "target_div">
				<ul id = "target_list">	</ul>
			</div>
			<div id = 'next_div' style = 'display : block; background:rgba(128, 128, 128, 0.5)'>
				<div>숨은 그림 찾기<br>	
					<button id = "start_hiddenPictures" style = 'margin-top: 20px; width: 80px'>시작</button><br>
					<button id = "setting" style = 'width: 80px'>설정</button>									
				</div>			
			</div>
			<div id = 'setting_div' style = 'display : none;background:rgba(128, 128, 128, 0.5)'>
				<div id = 'setting_white'>설정
					<div>제한 시간 : 
						<label><input type='radio' name = 'countdown' value='30'/>30s</label>
						<label><input type='radio' name = 'countdown' value='60'/>60s</label>
						<label><input type='radio' name = 'countdown' value='90'/>90s</label>
						<label><input type='radio' name = 'countdown' value='120' checked/>120s</label>
						<label><input type='radio' name = 'countdown' value='150'/>150s</label>
						<label><input type='radio' name = 'countdown' value='180'/>180s</label>
					</div>
			
					<div>숨은 그림 : 
						<label><input type='radio' name = 'targetN' value='5' checked>5개</label>
						<label><input type='radio' name = 'targetN' value='6'>6개</label>
						<label><input type='radio' name = 'targetN' value='7'>7개</label>
						<label><input type='radio' name = 'targetN' value='8'>8개</label>
						<label><input type='radio' name = 'targetN' value='9'>9개</label>
					</div>
					<div>
					<button id = 'setting_change' style = 'width : 80px'>시작</button>
					</div>
				</div>
			</div>
		</div>
		<div id = 'answer_img'></div>
	</div>	
	</div>
</body> 
</html>