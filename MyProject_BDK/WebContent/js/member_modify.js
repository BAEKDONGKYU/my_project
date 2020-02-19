$(function () {
	
	//회원 탈퇴를 클릭 했을 경우
	
	// 비밀번호와 휴대폰만 변경할 수 있다고 가정
	
	var pwReg = /^[a-z0-9]{4,12}$/;  //a-z,0~9로 시작하는 4~12자리 비밀번호
	// 휴대폰 앞자리 정규식
	var phoneReg = /^01([0|1|6|7|8|9]?)$/;
	// 휴대폰 가운데 번호 정규식
	var phone2Reg = /^([0-9]{3,4})$/;
	// 휴대폰 뒷자리 정규식
	var phone3Reg = /^([0-9]{4})$/;
	
	//전체 정규식 체크 여부가 담기는 배열 (기본값은 false)
	var inval_Arr = new Array(5).fill(false);
	
	
	// 비밀번호 체크 시작
	$("#modify_pwd").blur(function () {
		var pwResult = pwReg.test($("#modify_pwd").val());
		if(pwResult) {
			$("#modify_pwd_p").text("사용가능한 비밀번호 입니다.");
			$("#modify_pwd_p").css("color","green");
			inval_Arr[0] = true;
			
		}
		else {
			$("#modify_pwd_p").text("4~12자의 영문소문자,숫자만 사용가능합니다.");
			$("#modify_pwd_p").css("color","red");
			inval_Arr[0] = false;
		}
	});
	
	// 비밀번호 체크 끝
	
	// 비밀번호 확인 체크 시작
	
	$("#modify_pwd_confirm").blur(function () {
		
		var pwResult = pwReg.test($("#modify_pwd_confirm").val());
		if(pwResult) {
			if($("#modify_pwd").val() == $("#modify_pwd_confirm").val()) {
				$("#modify_pwd_confirm_p").text("비밀번호가 일치 합니다.");
				$("#modify_pwd_confirm_p").css("color","green");
				inval_Arr[1] = true;
				
			}
			else{
				$("#modify_pwd_confirm_p").text("비밀번호가 일치하지 않습니다.");
				$("#modify_pwd_confirm_p").css("color","red");
				inval_Arr[1] = false;
				
			}
		}
		
		else {
			$("#modify_pwd_confirm_p").text("비밀번호 확인란이 형식에 맞지 않습니다.");
			$("#modify_pwd_confirm_p").css("color","red");
			inval_Arr[1] = false;
		}
	
	}); // 비밀번호 확인 체크 끝
	
	
	// 휴대폰 앞자리 체크
	
	$("#modify_phone").blur(function () {
		var phResult = phoneReg.test($("#modify_phone").val()); 
		if(phResult) {
			$("#modify_phone_p").text("앞자리가 정상적으로 사용이 가능합니다.");
			$('#modify_phone_p').css("color", "green"); 
			inval_Arr[2] = true;
		}
		
		else {
			$("#modify_phone_p").text("010,011,016,017,018,019만 입력가능합니다.");
			$('#modify_phone_p').css("color", "red"); 
			inval_Arr[2] = false;
		}
	});
	
	$("#modify_phone2").blur(function () {
		var phResult = phone2Reg.test($("#modify_phone2").val());
		if(phResult)  {
			$("#modify_phone_p").text("");
			$('#modify_phone_p').css("color", "green"); 
			inval_Arr[3] = true;
		}
		else {
			$("#modify_phone_p").text("0~9숫자 3~4자리를 입력해주세요");
			$('#modify_phone_p').css("color", "red");
			inval_Arr[3] = false;
		}
	});
	
	$("#modify_phone3").blur(function () {
		var phResult = phone2Reg.test($("#modify_phone3").val());
		if(phResult)  {
			$("#modify_phone_p").text("");
			$('#modify_phone_p').css("color", "green"); 
			inval_Arr[4] = true;
		}
		else {
			$("#modify_phone_p").text("0~9숫자 4자리를 입력해주세요");
			$('#modify_phone_p').css("color", "red");
			inval_Arr[4] = false;
		}
	});
	
	$(".btn-danger").click(function () {
		var result = confirm("회원 탈퇴를 하시겠습니까?");
		if(result) {
			location.href="withdrawal.jsp?id="+$("#modify_id").val();
		}
	});
	
	
	
	
	// 수정하기 버튼을 눌렸을 경우 유효성 체크
	$(".btn-info").click(function () {
		var validAll = true; // 전체 체크 확인 변수
		// 조건들을 모두 검사해서 하나라도 값이 제대로 입력 안되어 있을 경우 false로 변경
		for(var i = 0; i < inval_Arr.length; i++){
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll){ // 유효성 모두 통과
			$("#modify_form").submit();
		} 
		else{
			alert('입력한 정보들을 다시 한번 확인해주세요');
		}	
		
	});
	
	
	
	
	
	
});