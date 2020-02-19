<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/checkPw.js"></script>
<title>비밀번호 체크</title>
</head>
<body>
<%
	//해당 num에 pw를 db에서 검색해서 가져와서
	//비밀번호가 null일 경우는 
	//비밀번호 확인 없이 읽기 가능
	//비밀번호가 입력되었을 경우는 비밀번호를 확인해야만 읽을 수 있게 하기
	
	//한글처리
	request.getParameter("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO dao = new BoardDAO();
	String pwd = dao.getPW(num);
		
%>	
<input type="hidden" value="<%=num%>" id="num">
<input type="hidden" value="<%=pwd %>" id="pw">
</body>
</html>