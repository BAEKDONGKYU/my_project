<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//회원정보 수정 페이지에서 가져온 id값
	String id = request.getParameter("id");
	
	//dao객체 생성하고 deleteId메소드 호출
	
	MemberDAO dao = new MemberDAO();
	int result = dao.deleteId(id);
	if(result == 1) {
		//세션 초기화
		session.invalidate();
%>

		<script type="text/javascript">
			alert("회원탈퇴 되었습니다.");
			location.href = "../index.jsp";
		</script>
<% 		
	}else {
%>
		<script type="text/javascript">
			alert("회원탈퇴 실패했습니다.");
			history.back();
		</script>
<% 			
	}

%>    
    
