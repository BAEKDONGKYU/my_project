
	$(function () {
		//공백 체크 정규식
		var emp = /\s/g;
		//아이디 정규식
		var idReg = /^[a-z0-9]{4,12}$/;   //a-z,0~9로 시작하는 4~12자리 아이디
		//비밀번호 정규식
		var pwReg = /^[a-z0-9]{4,12}$/;  //a-z,0~9로 시작하는 4~12자리 비밀번호
		//이름 정규식
		var nameReg = /^[가-힣]{2,6}$/;  // 한글 2자~6자까지 한글이름
		// 휴대폰 앞자리 정규식
		var phoneReg = /^01([0|1|6|7|8|9]?)$/;
		// 휴대폰 가운데 번호 정규식
		var phone2Reg = /^([0-9]{3,4})$/;
		// 휴대폰 뒷자리 정규식
		var phone3Reg = /^([0-9]{4})$/;
		//이메일 정규식
		var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 //숫자,소문자,대문자로 시작하며 특수문자는 -_ 가능 @ 필수  끝에 .다음은 (2~3자의 알파벳으로 끝나야 함
		var inval_Arr = new Array(15).fill(false);
		
		//아이디 체크 시작
		$("#id").keyup(function () {
			var regResult = idReg.test($("#id").val());  //입력한 아이디 유효성 검사
			if(regResult == false) { 
				$("#id_p").text("4~12자의 영문소문자,숫자만 사용가능합니다.");
				$("#id_p").css("color","red");
				inval_Arr[0] = false;
				
			}
			else {
				
				//ajax로 db에 해당 아이디가 있는지 체크
				$.ajax({
					type : 'post',
					url : '/MyProject_BDK/member/member_idcheck.jsp',
					dataType : 'text',
					data : {
							"id" : $("#id").val(),
					},
					success : function (data) {
						if(data == 0) {
							// 아이디 사용 가능
							$("#id_p").text("사용 가능한 아이디 입니다.");
							$("#id_p").css("color","green");
							inval_Arr[0] = true;
						}
						else if(data == 1) {
							// 해당 아이디 이미 존재 사용불가
							$("#id_p").text("이미 존재하는 아이디 입니다.");
							$("#id_p").css("color","red");
							inval_Arr[0] = false;
						}
						
					},
					error : function(request,status,error) {
						
						 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					
				});
			} // else end
		});  // 아이디 체크 끝
		
		
		// 비밀번호 체크 시작
		$("#pwd").keyup(function () {
			var pwResult = pwReg.test($("#pwd").val());
			if(pwResult) {
				$("#pwd_p").text("사용가능한 비밀번호 입니다.");
				$("#pwd_p").css("color","green");
				inval_Arr[1] = true;
				
			}
			else {
				$("#pwd_p").text("4~12자의 영문소문자,숫자만 사용가능합니다.");
				$("#pwd_p").css("color","red");
				inval_Arr[1] = false;
				
			}
		});
		
		// 비밀번호 체크 끝
		
		// 비밀번호 확인 체크 시작
		
		$("#pwd_confirm").keyup(function () {
			if($("#pwd").val() == $("#pwd_confirm").val()) {
				$("#pwd_confirm_p").text("비밀번호가 일치 합니다.");
				$("#pwd_confirm_p").css("color","green");
				inval_Arr[2] = true;
				
			}
			else{
				$("#pwd_confirm_p").text("비밀번호가 일치하지 않습니다.");
				$("#pwd_confirm_p").css("color","red");
				inval_Arr[2] = false;
				
			}
			
		}); // 비밀번호 확인 체크 끝
		
		//이름 확인 체크 시작
		
		$("#name").keyup(function () {
			var nameResult = nameReg.test($("#name").val());
			if(nameResult) {
				//입력한 이름이 유효성검사에 통과했을 경우
				$("#name_p").text("사용가능한 이름입니다.")
				$("#name_p").css("color","green");
				inval_Arr[3] = true;
				
			}
			else{
				$("#name_p").text("한글 2자~6자사이의 이름만 입력가능합니다.");
				$("#name_p").css("color","red");
				inval_Arr[3] = false;
			}
		});
		
		//이름 확인 끝
		
		//성별 확인 체크 시작
		$("#gender").change(function () {
			var genderResult = $("#gender option:selected").val();
			if(genderResult == "성별") {
				$("#gender_p").text("성별을 선택해주세요");
				$("#gender_p").css("color","red");
				inval_Arr[4] = false;
				
			}
			else {
				$("#gender_p").text("성별을 확인했습니다.");
				$("#gender_p").css("color","green");
				inval_Arr[4] = true;
				
			}
		});
		
		//성별 확인 끝
		
		
		//생년월일  년도확인 체크 시작
		
		$("#year").keyup(function () {
			var today = new Date();
			var nowYear = today.getFullYear();
			
			// 입력한 년도가 1900보다 이전이거나 현재날짜보다 이후 일경우
			if($("#year").val() < 1900 ||  $("#year").val() > nowYear ) {
				$("birth_p").text("생년월일을 확인해주세요");
				$("birth_p").css("color","red");
				inval_Arr[5] = false;
			}else {
				//정상적으로 입력했을 경우
				$("#birth_p").text("");
				inval_Arr[5] = true;
			}
		});
		
		//생년월일  년도확인 체크 끝
		
		
		//생년월일 월 확인 체크 시작
		$("#month").change(function () {
			var monthResult = $("#month option:selected").val();
			if(monthResult == "월") {
				$("#birth_p").text("생년월일을 확인해주세요");
				$("#birth_p").css("color","red");
				inval_Arr[6] = false;
			}else {
				//월을 정상적으로 선택했을 경우
				$("#birth_p").text("");
				inval_Arr[6] = true;
			}
			
		});
		
		//생년월일 월 확인 끝
		
		//생년월일에 일  확인 시작
		
		$("#date").keyup(function () {
			var date = $("#date").val();
			
			// 1~31일 사이에 날짜를 입력하지 않았을 경우
			if(date > 31 || date < 1) {
				$("#birth_p").text("생년월일을 확인해주세요");
				$("#birth_p").css("color","red");
				inval_Arr[7] = false;
			}
			
			if(date <= 31 && date >= 1) {
				$("#birth_p").text("");
				var month = $("#month").val();
				if ((month==4 || month==6 || month==9 || month==11) && date==31) {
					$("#birth_p").text("생년월일을 확인해주세요");
					$("#birth_p").css("color","red");
					inval_Arr[7] = false;
				}
				else {
					$("#birth_p").text("");
					inval_Arr[7] = true;
				}
				if(month == 2) {
					//윤달 계산
					var year = $("#year").val();
					// 윤달일 경우 29일이 마지막일이 됨
					var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
					// 29보다 큰 수를 입력하거나 29를 입력해도 윤달이 아닐경우
					if (date>29 || (date==29 && !isleap)) {
						$('#birth_p').text("생년월일을 확인해주세요");
						$('#birth_p').css("color", "red"); 
						inval_Arr[7] = false;
					}else{
						$('#birth_p').text("");
						inval_Arr[7] = true;	
					}
					
				} 
					
			}	
			
		}); // 생년월일 일 체크 끝
		
		
		//휴대전화  앞자리 확인 시작
		
		$("#phone").keyup(function () {
			
			var phoneResult = phoneReg.test($("#phone").val());
			
			// 휴대폰 앞자리가 유효성에 어긋날 경우
			if(phoneResult == false) {
				$("#phone_p").text("010,011,016,017,018,019만 입력가능합니다.");
				$('#phone_p').css("color", "red"); 
				inval_Arr[8] = false;
			} 
			
			// 유효성 통과할경우
			else {
				$("#phone_p").text("");
				inval_Arr[8] = true;
			}
			
		});
		
		// 휴대폰 앞자리 유효성 체크 끝
		
		// 휴대폰 가운데 번호 유효성 체크 시작
		$("#phone2").keyup(function () {
			var phone2Result = phone2Reg.test($("#phone2").val());
			
			// 휴대폰 가운데 번호 유효성이 어긋날 경우
			if(phone2Result == false) {
				$("#phone_p").text("0~9숫자 3자리 또는 4자리만 입력가능합니다.");
				$('#phone_p').css("color", "red"); 
				inval_Arr[9] = false;
			}
			// 유효성 통과할경우
			else {
				$("#phone_p").text("");
				inval_Arr[9] = true;
			}
		});
		
		// 휴대폰 가운데 번호 유효성 체크 끝
		
		// 휴대폰 뒷자리 번호 유효성 체크 시작
		
		$("#phone3").keyup(function () {
			var phone3Result = phone3Reg.test($("#phone3").val());
			
			// 휴대폰 뒷자리 번호 유효성이 어긋날 경우
			if(phone3Result == false) {
				$("#phone_p").text("0~9숫자  4자리만 입력가능합니다.");
				$('#phone_p').css("color", "red"); 
				inval_Arr[10] = false;
			}
			// 유효성 통과할경우
			else {
				$("#phone_p").text("");
				inval_Arr[10] = true;
			}
		
		});
		
		// 휴대폰 뒷자리 번호 유효성 체크 끝
		
		// 우편번호 찾기 버튼 클릭 
		
		$("#zipcode_button").click(function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                
	             
	                $("#zipcode").val(data.zonecode); //5자리 새우편번호 사용
	                $("#address").val(fullAddr); // 주소를 입력
	                // 커서를 상세주소 필드로 이동한다.
	                $("#address2").focus();
	            }
	        }).open();
	        
	      }); // click() 메소드 끝
		
		
		// 우편번호 입력이 되어 있지 않을 경우
		
		$("#zipcode").keyup(function () {
			var zipcode = $("#member_zipcode").val();
			if(zipcode == "") {
				// 경고메세지
				$("#zipcode_p").text("우편번호를 입력해주세요. 우편번호 찾기 버튼을 이용하면 쉽게 입력할수 있습니다.");
				$("#zipcode_p").css("color", "red");
				inval_Arr[11] = false;
			}
			// 우편번호가 입력되었을 경우 경고메세지 없애기
			else {
				$("zipcode_p").text("");
				inval_Arr[11] = true;
			}
		});
		
		// 주소가  입력이 되어 있지 않을 경우
		$("#address").keyup(function () {
			var address = $("#address").val();
			if(address == "") {
				$("#zipcode_p").text("주소를 입력해주세요. 우편번호 찾기 버튼을 이용하면 쉽게 입력할수 있습니다.");
				$("#zipcode_p").css("color", "red");
				inval_Arr[12] = false;
		     //주소가 입력되었을 경우
			}else {
				$("#member_zipcode_p").text("");
				inval_Arr[12] = true;
			}
		});
		 
		//상세주소에 포커스가 있을 경우  (우편번호 찾기)를 하지 않았을 경우를 대비
		$("#address2").focus(function () {
			//우편번호가 입력되지 않았을 경우
			if($("#zipcode").val() == "") {
				$("#zipcode_p").text("우편번호를 입력해주세요. 우편번호 찾기 버튼을 이용하면 쉽게 입력할수 있습니다.");
				$("#zipcode_p").css("color", "red");
				inval_Arr[11] = false;
			}
			// 주소가 입력되지 않았을 경우
			if($("#address").val() == "") {
				$("#zipcode_p").text("주소를 입력해주세요. 우편번호 찾기 버튼을 이용하면 쉽게 입력할수 있습니다.");
				$("#zipcode_p").css("color", "red");
				inval_Arr[12] = false;
				
			}
			
			// 우편번호가 입력되었을 경우
			if($("#zipcode").val() != "") {
				//에러메세지 제거
				$("#zipcode_p").text("");
				inval_Arr[11] = true;
			}
			// 주소가 입력되었을 경우
			if($("#address").val() != "") {
				//에러메세지 제거
				$("#zipcode_p").text("");
				inval_Arr[12] = true;
			}
			
			
		});
		
		// 상세 주소 확인 체크 시작
		$("#address2").keyup(function () {
			var address2 = $("#address2").val();
			if(address2 == "" || $.trim(address2) == "") {
				$("#zipcode_p").text("상세 주소를 입력해주세요.");
				$("#zipcode_p").css("color", "red");
				inval_Arr[13] = false;
			}else {
				$("#zipcode_p").text("");
				inval_Arr[13] = true;
			}
		});
		
		// 상세 주소 확인 체크 끝
		
		// 이메일 확인 체크 시작
		$("#email").keyup(function () {
			var emailResult = emailExp.test($("#email").val()); 
			if(emailResult == false) {
				$("#email_p").text("유효하지 않는 이메일 입니다.");
				$("#email_p").css("color","red");
				inval_Arr[14] = false;
			}
			else {
				$("#email_p").text("");
				
				//이메일 유효성 체크 통과후  ajax로 이메일 중복 체크
				$.ajax({
					type : 'post',
					url : '/MyProject_BDK/member/member_mailcheck.jsp',
					dataType : 'text',
					data : {
							"m_mail" : $("#email").val()	
					},
					success : function (data) {
						if(data == 1) {
							// 이메일이 존재할 경우 
							$("#email_p").text("해당 이메일이 존재 합니다. 다른 이메일을 입력해주세요");
							$("#email_p").css("color","red");
							inval_Arr[14] = false;
						}
						else if(data == 0) {
							// 이메일이 존재 하지 않을 경우
							$("#login_check_message").text("");
							$("#email_p").text("사용가능한 이메일 입니다.");
							$("#email_p").css("color","green");
							inval_Arr[14] = true;
						}
					},
					error : function(request,status,error) {
						
						 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					
				});
				
			}
		});
	
		
		// 가입하기 버튼을 눌렸을 경우
		$(".btn-info").click(function () {
			var validAll = true; // 전체 체크 확인 변수
			
			// 조건들을 모두 검사해서 하나라도 값이 제대로 입력 안되어 있을 경우 false로 변경
			for(var i = 0; i < inval_Arr.length; i++){
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			if(validAll){ // 유효성 모두 통과
				$("#member_form").submit();
			} 
			else{
				alert('입력한 정보들을 다시 한번 확인해주세요');
			}	
		});
		
		
		
	});
	
	
	