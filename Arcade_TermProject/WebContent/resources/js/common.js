// 제한 시간 설정 (기본값 = 1분)
const maxTime = 60.0;
let currentTime = maxTime;
let progress = $(".progress-bar");
let progressBar = $("#progress-bar");
let timeStop = false;

var timeInterval = setInterval(function () {
  if (timeStop === false)
    decreaseTime();
  else
    clearInterval(timeInterval);
}, 1000);

function decreaseTime() {
  currentTime = currentTime - 1;
  progressBar.html(currentTime + "초");
  let percent = parseInt((currentTime / maxTime) * 100);
  progress.css("width", percent + "%");
  if (currentTime <= 0)
    terminate();
}

function terminate() {
  timeStop = true;
  alert("제한시간이 초과되었습니다. 메인화면으로 돌아갑니다.");
  window.location.href = "../Arcade_TermProject/02_FDI/FDIMenu.jsp";
}

function clearRound() {
  let param1 = $("#difficult").html();
  let param2 = $("#round").html();
  if (parseInt(param2) === 3) {
    setTimeout(function () {
      alert("모두 라운드를 클리어 하셨습니다. 메인화면으로 이동합니다.");
      /*
        todo 프로젝트 합칠 때 주소변경 꼭 하기
      */
      window.location.href = "../Arcade_TermProject/02_FDI/FDIMenu.jsp";
    }, 500);
  } else {
    setTimeout(function () {
      alert("모두 찾으셨습니다. 다음 라운드로 진행됩니다.");
      /*
        todo 프로젝트 합칠 때 주소변경 꼭 하기
      */
      window.location.href = "main.do?difficult=" + param1 + "&round=" + param2;
    }, 500);
  }
}

function doNotReload() {
  if  (event.keyCode == 116) {
    alert("새로고침을 할 수 없습니다.");
    event.keyCode = 2;
    return false;
  } else if (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) {
    return false;
  }
}

document.onkeydown = doNotReload;