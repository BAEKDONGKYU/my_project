<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 처리 	
	request.setCharacterEncoding("UTF-8");
	//중복 체크할 이메일 
	String email = request.getParameter("m_mail");
	//DAO 객체 생성
	MemberDAO dao = new MemberDAO();
	//중복 체크 함수 호출
	int result = dao.mailCheck(email);
	
	//리턴 값이 1 일경우 이메일 중복, 0일 경우 가입 가능
	out.print(result);
%>