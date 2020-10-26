<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Axis" %>
<%@ page import="controller.*" %>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/layout.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<html>
  <head>
    <title>틀린그림찾기</title>
  </head>
  <body>
    <%
      String imageName = request.getAttribute("imageName").toString();
      String srcPath = "resources/img/" + request.getAttribute("difficult") + "/";
      String path1 = srcPath + imageName + "-1.png";
      String path2 = srcPath + imageName + "-2.png";
      ArrayList<Axis> answer = (ArrayList<Axis>) request.getAttribute("imageAxis");
    //ArrayList<Axis> answer = request.getAttribute("imageAxis");
    %>

    <div class="wrapper">
      <!-- 메뉴 영역 -->
      <div class="menu-bar">
        <jsp:include page="menu.jsp"></jsp:include>
      </div>
      <!-- 게임 메인 화면 -->
      <div class="content">
        <h4 class="time-bar">남은 시간 (틀릴 경우, 시간이 5초 감소합니다.)</h4>
        <!-- 진행 시간 영역-->
        <div class="progress">
          <div id="progress-bar" class="progress-bar progress-bar-striped bg-danger" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="100" style="width: 100%"></div>
        </div>
        <!-- 그림 영역 -->
        <div class="image-content">
          <div class="image">
            <%
              for (int i = 0; i < answer.size(); i++) {
            %>
            <svg class="answer" style="left: <%=answer.get(i).getX() + 15%>;
                    top: <%=answer.get(i).getY() - 10%>;
                    width: <%=answer.get(i).getSize()%>px;
                    height: <%=answer.get(i).getSize()%>px">
              <circle class="answer-circle answer<%=i%>"
                      cx="<%=answer.get(i).getSize() / 2%>px" cy="<%=answer.get(i).getSize() / 2%>px"
                      r="<%=answer.get(i).getSize() / 3%>px"></circle>
            </svg>
            <%
              }
            %>
            <img class="image" id="image1" src="<%=path1%>">
          </div>
          <div class="image">
            <%
              for (int i = 0; i < answer.size(); i++) {
            %>
            <svg class="answer" style="left: <%=answer.get(i).getX() + 10%>;
              top: <%=answer.get(i).getY() - 10%>;
              width: <%=answer.get(i).getSize()%>px;
              height: <%=answer.get(i).getSize()%>px">
              <circle class="answer-circle answer<%=i%>"
                      cx="<%=answer.get(i).getSize() / 2%>px" cy="<%=answer.get(i).getSize() / 2%>px"
                      r="<%=answer.get(i).getSize() / 3%>px"></circle>
            </svg>
            <%
              }
            %>
            <img class="image" id="image2" src="<%=path2%>">
          </div>
        </div>
        <!-- 오른쪽 사이드 바 -->
        <div class="sidebar">
          <h1>Round <span id="round"><%=request.getAttribute("round")%></span></h1>
          <h1>난이도 : <span id="difficult"><%=request.getAttribute("difficult")%></span></h1>
          <br><br><br>
          <p class="score">찾은 개수</p>
          <span class="score" id="score">0</span>
          <span class="score"> / </span>
          <span class="score" id="max"><%=answer.size()%></span>
        </div>
      </div>
    </div>
  </body>
  <script type="text/javascript" src="resources/js/common.js"></script>
  <script type="text/javascript" src="resources/js/clickEvent.js"></script>
</html>
