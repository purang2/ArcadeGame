<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>틀린 그림 찾기</title>
    <style>
        .FDI-container {
            width: auto;
            height: 600px;
            text-align: center;
            align-content: center;
            background-image: url("../resources/img/diff_background.PNG");
            background-size: cover;
            padding-top: 300px;
        }

        .difficult {
            width: 200px;
            height: 100px;
            font-size: 25px;
            font-weight: bold;
            color: black;
            text-align: center;
            vertical-align: center;
            margin: 0px 50px;
            border-width: 10px;
        }

        #btn-start {
            width: 200px;
            height: auto;
            font-size: 30px;
            font-weight: bold;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<div>
    <div class="menu-bar">
        <jsp:include page="menu.jsp"></jsp:include>
    </div>
    <div class="FDI-container">
        <div class="btn-group btn-group-toggle" role="group">
            <button type="button" class="btn btn-outline-warning difficult">Easy</button>
            <button type="button" class="btn btn-outline-primary difficult active">Normal</button>
            <button type="button" class="btn btn-outline-danger difficult">Hard</button>
        </div>
        <br>
        <button class="btn btn-outline-success" id="btn-start" type="button">시작</button>
    </div>
</div>
<script>
  $(".difficult").on("click", function () {
    resetActive();
    $(this).addClass("active");
  });

  $("#btn-start").on("click", function () {
    let difficult = $(".active").html().toLowerCase();

    /*
    todo 프로젝트 합칠 때 주소변경 꼭 하기
     */
    window.location.href = "../start.do?difficult=" + difficult;
  });

  function resetActive() {
    $(".difficult").each(function (idx, item) {
      $(item).removeClass("active");
    });
  }
</script>
</body>
</html>
