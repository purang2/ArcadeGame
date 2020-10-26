var maxScore = parseInt($("#max").html());
// 이미 체크한 답 표시 위해
var checkAnswer = [];
for (i = 0; i < maxScore; i++)
  checkAnswer[i] = false;

// 이미지 클릭 했을 때
function imageClick(image, event) {
  // 참고. 클릭 좌표 계산 ( 디비 넣을 값 구할 때 사용)
  let offX = $(image).offset().left;
  let offY = $(image).offset().top;
  let clickX = event.pageX;
  let clickY = event.pageY;
  let realX = clickX - offX;
  let realY = clickY - offY;
  /*
   * 틀린 그림 위치 찾을 때 이미지 넣고 찾아 볼 때 쓰는 코드
  console.log("offX = " + offX + ", offY = " + offY);
  console.log("X = " + realX + ", Y = " + realY);
   */
  currentTime -= 5;
}

// 정답 좌표 클릭 시 점수 업데이트
function answerClick(obj) {
  let className = $(obj).children(0).get(0).classList[1];
  let answerNumber = parseInt(className.substr(6));
  if (checkAnswer[answerNumber] === false) {
    checkAnswer[answerNumber] = true;
    // 동그라미 표시
    $("." + className).each(function (index ,item) {
      $(item).css("display", "block");
    });
    updateScore();
  }
}

function updateScore() {
  let score = $("#score");
  let newScore = parseInt(score.html()) + 1;
  score.html(newScore);
  if (newScore === maxScore) {
    timeStop = true;
    clearRound();
  }
}

$("#image2").on("click", function (event) {
  imageClick(this, event);
});

$("#image1").on("click", function (event) {
  imageClick(this, event);
});

$(".answer").on("click", function () {
  answerClick(this);
});