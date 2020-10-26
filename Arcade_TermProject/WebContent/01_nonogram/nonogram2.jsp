<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>노노그램 2단계</title>
	<script src="https://code.jquery.com/jquery-3.5.0.slim.js"></script>
	<script type="text/javascript">
		var boxcount = 0;
	    var wrongcount = 0;
	    var nn2=['74', '105', '330', '606', '10', '16', '320', '224'];
       	var gs2=[101, 186, 197, 250, 254, 267, 295, 299];
       	
	    $(document).ready(function(){
	    	$("#img6").hide();
	    	$("#boxsuccess").hide();
    		$("#boxfail").hide();
    		$("#boxtimeout").hide();
        	
            $("button.start").click(function(){
            	$("#boxstartinfo").hide();
            	$("#boxhide").hide();
	        });
            
            $("td.class01, td.class02, td.class03, td.class04, td.class05, td.class06, td.class07, td.class08, td.class09, td.class10").mouseenter(function(){
            	$(this).addClass("grey");
            });
            
            $("td.class01, td.class02, td.class03, td.class04, td.class05, td.class06, td.class07, td.class08, td.class09, td.class10").mouseleave(function () {
            	$(this).removeClass("grey");
            });
            
            $(document).on("click", "td.class01", function(){
            	if ($(this).children(".wrong").length) {}
               	else{
                	var att = document.createAttribute("class");
					att.value = "wrong";
					this.setAttributeNode(att);
                    var node1 = document.createElement("div");
                	var textnode = document.createTextNode("X");
                	this.appendChild(textnode);
                    wrongcount++; 
                }   
            	
            	if (wrongcount == 1){
            		$("#img3").hide();
            	}else if(wrongcount == 2){
            		$("#img2").hide();
            	}else if (wrongcount == 3){
            		$("#img1").hide();
            	}
            });
            
            $("td.class02").click(function(){
            	$(this).addClass("pink1");
            	boxcount++;
            });
            $("td.class03").click(function(){
            	$(this).addClass("pink2");
            	boxcount++;
            });
            $("td.class04").click(function(){
            	$(this).addClass("pink3");
            	boxcount++;
            });
            $("td.class05").click(function(){
            	$(this).addClass("pink4");
            	boxcount++;
            });
            $("td.class06").click(function(){
            	$(this).addClass("pink5");
            	boxcount++;
            });
            $("td.class07").click(function(){
            	$(this).addClass("pink6");
            	boxcount++;
            });
            $("td.class08").click(function(){
            	$(this).addClass("brown1");
            	boxcount++;
            });
            $("td.class09").click(function(){
            	$(this).addClass("brown2");
            	boxcount++;
            });
            $("td.class10").click(function(){
            	$(this).addClass("brown3");
            	boxcount++;
            });
            $("#img4").mouseenter(function(){
            	$("#img6").show();
            });
            $("#img4").mouseleave(function(){
            	$("#img6").hide();
            });
            
            
        });
	    
	    var SetTime = 300;
		function timer() {
			m = (SetTime);
			var msg = "<font color='red'>" + m + "</font>";
			document.all.ViewTimer.innerHTML = msg;
			SetTime--;
			if (boxcount==52) {
				clearInterval(tid);
				var finalscore = (300-SetTime);
				document.getElementById("id01").innerHTML="소요시간 : " + finalscore + "초";
				if (finalscore <= gs2[0]) {
					document.getElementById("id02").innerHTML="등 수 : 1/9 등";
				} else if (finalscore <= gs2[1]) {
					document.getElementById("id02").innerHTML="등 수 : 2/9 등";
				} else if (finalscore <= gs2[2]) {
					document.getElementById("id02").innerHTML="등 수 : 3/9 등";
				} else if (finalscore <= gs2[3]) {
					document.getElementById("id02").innerHTML="등 수 : 4/9 등";
				} else if (finalscore <= gs2[4]) {
					document.getElementById("id02").innerHTML="등 수 : 5/9 등";
				} else if (finalscore <= gs2[5]) {
					document.getElementById("id02").innerHTML="등 수 : 6/9 등";
				} else if (finalscore <= gs2[6]) {
					document.getElementById("id02").innerHTML="등 수 : 7/9 등";
				} else if (finalscore <= gs2[7]) {
					document.getElementById("id02").innerHTML="등 수 : 8/9 등";
				} else {
					document.getElementById("id02").innerHTML="등 수 : 9/9 등";
				}
				$(document).ready(function(){
					$("#boxhide").show();
					$("#boxsuccess").show();
		        });
				
			}else if(wrongcount>2 || SetTime<1){
	           	clearInterval(tid);
	           	$(document).ready(function(){
	           		$("#boxhide").show();
	           		if (wrongcount>2){
		           		$("#boxfail").show();
	           		}else{
						$("#boxtimeout").show();
	           		}
		        });
           	}
		}
		function TimerStart(){ 
	       	tid=setInterval('timer()',1000) 
       };
       
	</script>
	
	<style type="text/css">
		header, nav, section, article, #boxlife, #boxhide, #boxstartinfo, #boxsuccess, #boxfail, #boxtimeout, #img4, #img6, .cls1, #score, #close {position:absolute;}
		header, nav, section, article, #boxhide, #boxstartinfo, #boxsuccess, #boxfail, #boxtimeout, #score {
			left:600px;
			width:450px;
			background-color:#ddd;
			border: solid 1px;
			text-align:center;
		}
		header {top:70px;}
		nav {top:170px;}
		section{top:200px;height:400px;}
		article{top:10px;left:6px;
			width:434px;height : 380px;
			background-color:#efefef;}
		
		
		#boxlife{top : 3px; left : 340px;
			width:130px;z-index:1;}
		#boxhide, #score {top:-1px;left:-1px;height:400px;z-index:1;}
		#score {z-index:2;}
		#boxstartinfo, #boxsuccess, #boxfail, #boxtimeout {top:100px;left:130px;
			width:200px;padding:4px;}
		#img1, #img2, #img3 {width : 20px; height : 20px;}
		#img4 {width:30px;height:25px;
      		top : 10px;left : 400px;}
      	#img6{width:50px;height:50px;
      		top: 10px;left:445px;}
    	#close{width:20px;height:20px;
      		top:5px; right:5px;}
   		.cls1 {
        	width: 300px; height: 300px;
            top : 30px; left : 55px;}
   		.th01 {
        	width : 50px; 
            height : 50px;
            font-size : 15px;
            vertical-align:bottom;
            text-align:center;
      	}
        .col, .col1 {text-align:right; font-size : 15px;}
        .col {font-weight : bold;width : 25px;}
        .row {height:25px;width:50px;text-align:center;font-size : 15px;font-weight : bold;}
        .grey{background-color : grey;}
        .pink1{background-color : #ECDEE0;}
        .pink2{background-color : #FFD0EF;}
        .pink3{background-color : #F6C3E5;}
        .pink4{background-color : #EEB4DA;}
        .pink5{background-color : #E7A7D1;}
        .pink6{background-color : #DE97C6;}
        .brown1{background-color : #E3D0D3;}
        .brown2{background-color : #C6AFB1;}
        .brown3{background-color : #BEA1A4;}
        .class01 {color : red; font-size : 15px; font-weight : bold;text-align : center;vertical-align:center;}
        .wrong{color: red;font-size : 15px;font-weight:bold;text-align:center;}
        a:link { color: black; text-decoration: none;}
	 	a:visited { color: black; text-decoration: none;}
		a:hover { color: blue; text-decoration: underline;}
	</style>
</head>
<body>
	   <jsp:include page="menu.jsp"></jsp:include>
     <header>
		<h2>노노그램 : 2단계</h2>
		<a href="nonogram1.jsp">[1단계로 이동]</a>
	</header>
	<nav>
		<span class="time">남은 시간 : </span><span id="ViewTimer"></span>
		<div id="boxlife">
			<img id="img1" src="heart.png" alt="heart" title="heart">
			<img id="img2" src="heart.png" alt="heart" title="heart">
			<img id="img3" src="heart.png" alt="heart" title="heart">
		</div>
	</nav>
	<section>
		<div id="boxhide">
			<div id="boxstartinfo">
				제한시간은 5분입니다.<br><br>
				<button class="start" type="button" onclick='TimerStart()'>START</button>
			</div>
			<div id="boxsuccess">
				<p>성공!</p>
				<p id="id01"></p>
				<p id="id02"></p>
				<br>
				<button class="restart" type="button" onClick="location.href='nonogram1.jsp'">1단계</button>
				<button class="fail" type="button" onclick="location.reload()">다시 시도</button>
			</div>
			<div id="boxfail">
				<p>실패 : 3번 틀림</p><br>
				<button class="fail" type="button" onclick="location.reload()">다시 시도</button>
			</div>
			<div id="boxtimeout">
				<p>실패 : 시간초과</p><br>
				<button class="timout" type="button" onclick="location.reload()">다시 시도</button>
			</div>
		</div>
		
		<article>
			<img id="img4" src="hint2.png" alt="hint">
			<div id="boxhint"><img id="img6" src="IMG_1884.jpg" alt="hintimg"></div>
			<table class="cls1" border="1" style="width:330px;height:330px;">
			        <tr>
			            <th class="th01">&nbsp</th>
			            <th class="th01">3</th>
			            <th class="th01">3</th>
			            <th class="th01">4</th>
			            <th class="th01">
			            	<table class="intable"><tr><td class="row">6</td></tr><tr><td class="row">2</td></tr></table>
			            </th>
			            <th class="th01">
			            	<table class="intable"><tr><td class="row">5</td></tr><tr><td class="row">1</td></tr></table>
			            </th>
			            <th class="th01">10</th>
			            <th class="th01">6</th>
			            <th class="th01">5</th>
			            <th class="th01">4</th>
			            <th class="th01">4</th>
			        </tr>
			
			        <script>
			        arr=[0,1,1,1,1,1,2,1,1,1,1,0,1,1,1,3,3,4,3,3,1,1,0,1,1,4,4,5,4,5,4,4,1,0,1,5,5,6,5,5,5,6,5,5,0,6,6,6,7,6,6,6,6,7,6,0,6,6,7,6,6,6,6,6,7,6,0,8,1,1,7,1,2,7,1,1,7,0,1,1,1,1,1,8,1,1,1,1,0,1,1,1,9,1,9,1,1,1,1,0,1,1,1,10,10,10,1,1,1,1];
			        colarr=[1, 5, 7, 9, 10, 10, 20, 1, 21, 3];
			
			        var count = 0;
			        var colcount = 0;
			        
			        for(var i=0;i<=9;i++){
			            document.write("<tr>");
			            for(var j=0;j<=10;j++){
			                    if(arr[count]==0){
			                    	if(colarr[colcount]==20){
			                        	document.write('<td><table ><tr><td class="col">1</td><td class="col">1</td><td class="col">2</td><td class="col">1</td></tr></table></td>');
			                        }
			                        else if(colarr[colcount]==21){
			                        	document.write('<td><table ><tr><td class="col">1</td><td class="col">1</td></tr></table></td>');
			                        }
			                        else{
			                        	document.write('<td class="col1"><b>' + colarr[colcount] + '</b></td>');
			                        }
			                        colcount++;
			                    }
			                    else if(arr[count] == 1){
			                    	document.write('<td class="class01"></td>');
			                    }
			                    else if(arr[count] == 2){
			                    	document.write('<td class="class02"></td>');
			                    }
			                    else if(arr[count] == 3){
			                    	document.write('<td class="class03"></td>');
			                    }
			                    else if(arr[count] == 4){
			                    	document.write('<td class="class04"></td>');
			                    }
			                    else if(arr[count] == 5){
			                    	document.write('<td class="class05"></td>');
			                    }
			                    else if(arr[count] == 6){
			                    	document.write('<td class="class06"></td>');
			                    }
			                    else if(arr[count] == 7){
			                    	document.write('<td class="class07"></td>');
			                    }
			                    else if(arr[count] == 8){
			                    	document.write('<td class="class08"></td>');
			                    }
			                    else if(arr[count] == 9){
			                    	document.write('<td class="class09"></td>');
			                    }
			                    else if(arr[count] == 10){
			                    	document.write('<td class="class10"></td>');
			                    }
			                count++;
			            }
			            document.write("</tr>");
			        }
			        </script>
			    </table>
		</article>
	</section>
</body>
</html>