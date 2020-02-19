<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//한글 처리
	request.setCharacterEncoding("UTF-8");
		
	//pw찾기 페이지에서 입력한 값 받아오기
	String id = request.getParameter("find_pw_id");
	String email = request.getParameter("find_pw_email");
	
	//DB에서 해당 id의 비밀번호를 찾기 위해 MemberDAO 객체 생성
	MemberDAO dao = new MemberDAO();
	// 비밀번호 찾기 메소드 호출  return 값이 "" 일 경우 
	// 아이디를 잘못 입력하였거나 가입한적이 없음
	String pw = dao.findPW(id);
	
	if(pw == "") {  // DB에 해당 아이디가 존재 하지 않음
%>
	<script type="text/javascript">
		alert("해당 아이디로 가입된 적이 없습니다. 다시 확인 부탁드립니다.");
		history.back();
	</script>
<%		
	}
	else {  // 아이디 존재함
		//비밀번호를 입력받은 이메일로 전송
		request.setAttribute("find_pw_email", email);
		request.setAttribute("find_pw_id", id);
		request.setAttribute("find_pw_pw", pw);
		RequestDispatcher rd = request.getRequestDispatcher("sendPW_email.jsp");
		rd.forward(request, response);
	}
%>