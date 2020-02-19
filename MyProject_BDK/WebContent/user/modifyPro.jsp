<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 처리 
	request.setCharacterEncoding("UTF-8");	
%>
<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:useBean id="dao" class="member.MemberDAO"/>


<%
	//수정 가능한  비밀번호, 이메일, 휴대폰 번호 가져오기
	String pwd = request.getParameter("modify_pwd");
	//휴대폰 앞자리
	String phone = request.getParameter("modify_phone");
	//휴대폰 중간
	String phone2 = request.getParameter("modify_phone2");
	//휴대폰 끝자리
	String phone3 = request.getParameter("modify_phone3");
	
	//세션에 저장되어 있는 id값
	String id  = (String)session.getAttribute("id");
	//setter
	dto.setPwd(pwd);
	dto.setPhone(phone);
	dto.setPhone2(phone2);
	dto.setPhone3(phone3);
	dto.setId(id);
	
	//DAO의 modify메소드 호출시 dto객체와 id
	
	int result = dao.modify(dto,id);
	 
	if(result  == 1) {  // 정상적으로 업데이트가 되었을 경우 result 값은 1 
%>
		<script type="text/javascript">
			alert("회원 정보 수정이 완료 되었습니다.");
			location.href = "../index.jsp";
		</script>
		
<% 		
	}
	
	else {  //정상적으로 업데이트가 되지 않았을 경우 
%>
		<script type="text/javascript">
			alert("회원 정보 수정이 실패하였습니다. 다시 입력 부탁드립니다.");
			history.back();
		</script>
		
		
<% 		
	}
	
%>

	