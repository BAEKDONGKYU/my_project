$(function () {
	//목록 버튼 클릭시
	$("#list").click(function () {
		location.href="board.jsp";
	});
	//수정 하기 버튼 클릭시
	
	$("#modify").click(function () {
		//modifyBoardPro.jsp로 전송
		$("#mForm").submit();
	});
});