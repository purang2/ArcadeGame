
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset = "utf-8">
	<title>같은 그림 찾기 게임</title>
    
    
    <link rel="stylesheet" type="text/css" href="../resources/css/findsame_css.css"/>	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    
    
    
</head>

<script>
    var open1 ='';
    var open2 ='';
    var gameState= '';  
    var plus = 9;var extrap = 1; var minus =4;var extram = 1;
    function randint(min,max){
        var ranNum = Math.floor(Math.random()*(max-min+1)) +min;
            return ranNum;
    }

</script>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
    <!-- 
    <div class = "box1">
	<form>
		<b>같은 그림 찾기 4x4</b>
        
	</form>
	</div>
	 -->
	<script>
    var cards;//카드목록
    var score =0; //점수
    var point_num = 0; //맞춘 카드 갯수
    
    function setting(num){
    
    make_list = []; x=0;
    for(var n=1;n<=num; n++){  
    	make_list[x++]=n+'.png';     
    	make_list[x++]=n+'.png';
    }
        /*
        make_list= [
        '1.png','1.png',
        '2.png','2.png',
        '3.png','3.png',
        '4.png','4.png',
        '5.png','5.png',
        '6.png','6.png',
        '7.png','7.png',
        '8.png','8.png',
        '9.png','9.png',
        '10.png','10.png',
        '11.png','11.png',
        '12.png','12.png',
        '13.png','13.png',
        '14.png','14.png',
        '15.png','15.png',
        '16.png','16.png',
        '17.png','17.png',
        '18.png','18.png',  
    ];
    */

    var str= '';
    for(var i=1;i<=num;i++){
        var xx = randint(0,num-i);
        var img = make_list.splice(xx,1);
        str += '<div class = "inmenuBox" id="card'+i+'"><img src="../resources/images/New_Themes/' + img + '" width= "105px" height= "105px"></div>';
    }
    document.getElementById('card').innerHTML=str;
    }

    function Show(){
        $('#card div img').hide();
        $('#card div span').show();
    }


   
    function startGame() {
        var sec = 5;
        $('#info').hide();
        scoreInit();
        setting(4*4); 

        function ctdw(){
            $('#countDown').text(--sec);
        }

        var inte = setInterval(ctdw, 1000);
        setTimeout(function(){
            clearInterval(inte);
            $('#countDown').text('같은 그림을 찾아보라구~!');
            document.getElementById('startBtn').innerHTML ="다시하기"
            Show();
            gameState ='';
        },5000);

    } 
    $(document).on('click', '#card div', function(){
        if(gameState != '') return;
        if(open2 != '') return;
        if($(this).hasClass('opened')) return;
        $(this).addClass('opened');

        if(open1 == ''){
            $(this).find('img').show();
            $(this).find('span').hide();
            open1 = this.id;    
        }else{
            if(open1 == open2) return; // 같은 카드 누른 경우 return
            
            $(this).find('img').show();
            $(this).find('span').hide();
           
            var oSrc = $('#'+open1).find('img').attr('src');
            var oSrc2= $(this).find('img').attr('src');
            open2 = this.id;

            if(oSrc == oSrc2){ //일치
                open1 ='';
                open2 ='';
                document.getElementById('countDown').innerHTML= ' Great!! (+ ' + (plus + extrap) +'Point )';
                setTimeout(
                function(){
                    document.getElementById('countDown').innerHTML= ' 계속 맞춰보라구 ~ ';
                    scorePlus();
                },750);

                if(++point_num == 4*4/2){
                    alert('Clear !!!! (Your Score:'+(score+plus+extrap)+') !!짝짝짝짝');
                }
            }else{//불일치
                
                var ran = randint(0,5);
                var str_g= '';
                if(ran==1) str_g = '이걸 틀리네 ㅋㅋㅋ';
                else if(ran==2) str_g = '땡~';
                else if(ran==3) str_g = 'ㅋㅋㅋㅋ 땡';
                else str_g = '틀렸다구';
                
                document.getElementById('countDown').innerHTML= str_g + ' (- '+ (minus + extram) +'Point )';
                setTimeout(function(){back(); document.getElementById('countDown').innerHTML= ' 계속 맞춰보라구 ~ ';
                scoreMinus();},1000);
                
            }            
            }
        
        });
    
        

    //두개의 카드 다시 뒤집기
    function back() {
        $('#'+open1).find('img').hide();
        $('#'+open1).find('span').show();
        $('#'+open2).find('img').hide();
        $('#'+open2).find('span').show();
        $('#'+open1).removeClass('opened');
        $('#'+open2).removeClass('opened');
        open1 ='';
        open2 = '';
    }
        
    function scoreInit(){
        score = 0;
        point_num = 0;
        $('#score').text(score);
    }

    function scorePlus(){
        score +=( plus + extrap);
        extrap= extrap * 2;
        extrap=Math.min(extrap,16); //최대 가중치 16
        plus = plus + 2;
        minus =4; extram=1;
        //$('#score').text(score);
        document.getElementById('score').innerHTML = score;

        if(point_num != 8){
       if(score >= 90){
        document.getElementById('countDown').innerHTML = 'WOW 엄청난 점수!!!!';
        
       }
       else if(score >= 60) {
        document.getElementById('countDown').innerHTML = '좀 하는데? ...ㅎㅎ';
       } 
       else if(score >= 30) {
            document.getElementById('countDown').innerHTML = '헐.. 점수가 높아지고 있습니다!!';
        }
    }
    }

    function scoreMinus(){
        score -=(minus + extram);
        extram = extram + 2;
        extram = Math.min(extram,10); //최대 가중치 패배: 10
        minus = minus + 2;
        plus = 9; extrap=1;
        $('#score').text(score);
        
        if(score <= -100) {
            
            
            alert(score+"점: 실격입니다!"); for(var i=1;i<=4*4;i++) { strstr = '#card'+i; $(strstr).find('img').show(); }
            document.getElementById('countDown').innerHTML = 'GAME OVER!! ㅜ.ㅜ';
        }
        else if(score <= -35) document.getElementById('countDown').innerHTML = '-100점 이하가 되면 실격입니다!!!'
        
    }
    
    $(document).on('click','#startBtn',function(){
            startGame();
            gameState= 'alreadyStart'
        
    });


    </script>
	<div class = "bodyBox">
	<center>
	
	<div class = "TitleBox">
		<div style = "border-style: solid; border-color: black; color: black; background-color: white">
            <span class = "red">4x4</span> 같은 그림 찾기 <span style="display:inline-block; width:200px; "><button id='startBtn'>게임시작</button><button id='scoreBtn'>점수:<span id="score" style="font-size: 14;">0</span></button>       
		</div>
	</div>
	    <div id='countDown'>
            시작버튼을 눌러 게임을 시작하세요!!
        </div>
        <div class = "menuBox"> 
        <div id='card'></div>
    </div>
	<br><hr><br>
</div>
</body>
</html>