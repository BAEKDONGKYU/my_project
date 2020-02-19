 	$(function () {
		$("#login_button").click(function () {
			$.ajax({
				type : 'post',
				url : '/MyProject_BDK/user/loginPro.jsp',
				dataType : 'text',
				data : {
						"id" : $("#user_id").val(),
						"pwd" : $("#user_pwd").val()
				},
				success : function (data) {
					if(data == 0) {
						// 비밀번호 틀림
						$("#login_check_message").text("비밀번호가 틀립니다. 다시입력해주세요");
						$("#login_check_message").css("color","red");
					}
					else if(data == 1) {
						// 아이디 비밀번호 전부 일치 
						// 로그인 체크 메시지 창 공백으로 만들기
						$("#login_check_message").text("");
						location.href = "../index.jsp";
					}
					else if(data == -1) {
						// 아이디 틀림
						$("#login_check_message").text("아이디가 틀립니다. 다시입력해주세요");
						$("#login_check_message").css("color","red");
					}
				},
				error : function(request,status,error) {
					
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
		});
	}); 
 