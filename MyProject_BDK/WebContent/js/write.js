$(function () {
	$("#write_button").click(function () {
		// 제목을 입력했는지 체크
		if($("#subject").val() == "") {
			alert("제목을 입력해주세요.");
			$("#subject").focus();
			return;
		}
		
		if($("#content").val() == "") {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return;
		}
		
		// 둘다 입력 했을 경우
		if($("#subject").val() != "" &&  $("#content").val() != "" ) {
			$("#writeForm").submit();
		}
		
		// 내용을 입력했는지 체크
	});
	
	$("#goback_button").click(function () {
		history.back();
	});
});