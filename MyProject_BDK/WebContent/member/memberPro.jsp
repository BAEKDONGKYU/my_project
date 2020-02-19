<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	
	int result = dao.insertMember(dto);
	request.setAttribute("id", dto.getId());
	if(result == 1) {
				
%>
	<script type="text/javascript">
		alert("회원가입을 축하드립니다.");
		location.href="../index.jsp";
	</script>
<%
	}
%>
		
		
	
	
