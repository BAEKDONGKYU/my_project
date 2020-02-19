
$(function () {
	// 검색 버튼을 클릭했을 떄 키워드가 입력되지 않았을 경우
	$("#search_button").click(function (){
		if($("#search_keyword").val() == "") {
			alert("검색어를 입력하세요.");
			$("#search_keyword").focus();
			return;
		}
		// 입력되었을 경우 키워드에 해당하는 것들만 보여주기
		else {
			$("#serach_form").submit();
		}	
	});
	
	
	
});

