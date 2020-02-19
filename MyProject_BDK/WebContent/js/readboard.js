$(function () {
	
	//목록 버튼 클릭시 
	$("#list").click(function () {
		location.href="board.jsp";
	});
	
	//삭제 버튼 클릭시 
	
	$("#delete").click(function () {
		var result = confirm("게시글을 삭제하시겠습니까? ");
		if(result) {
			location.href="deleteBoard.jsp?num="+$("#hiddenNum").val()
			+"&author="+$("#hiddenAuthor").val();
		}
	});
	
	$("#modify").click(function () {
		var result = confirm("게시글을 수정하시겠습니까?");
		if(result) {
			location.href="checkId.jsp?num="+$("#hiddenNum").val()+"&author="+$("#hiddenAuthor").val();
		}
	});

	
});