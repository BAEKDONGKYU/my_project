$(function () {
	if($("#pw").val() == null || $("#pw").val() == "") {
		location.href = "readBoard.jsp?num="+$("#num").val();
	}
	else {
		var inputtedPW = prompt("비밀번호를 입력해주세요", "");
		if(inputtedPW != $("#pw").val()) {
			alert("비밀번호가 일치 하지 않습니다.");
			history.back();
		}
		else {
			location.href ="readBoard.jsp?num="+$("#num").val();
		}
	}
	
	
});