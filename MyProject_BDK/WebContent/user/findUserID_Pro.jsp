<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	String email = (String)request.getParameter("find_email");
	
	MemberDAO dao = new MemberDAO();
	int result = dao.mailCheck(email);
	
	if(result != 1) {
%>
	<script type="text/javascript">
		alert("입력하신 이메일로 가입한 아이디는 존재 하지 않습니다.");
		history.back();
	</script>
<% 		
		
	}
	else {
		request.setAttribute("find_email", email);
		RequestDispatcher rd = request.getRequestDispatcher("sendID_email.jsp");
		rd.forward(request, response);
	}
	
%>  
