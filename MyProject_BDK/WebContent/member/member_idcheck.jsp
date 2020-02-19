<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//ajax을 통해서 넘어온 key id의 value값 가져오기
	String id = request.getParameter("id");
	//dao객체 생성
	MemberDAO dao = new MemberDAO();
	//DB접속해서 해당 아이디와 비밀번호가 일치하는 지 체크
	int result = dao.idCheck(id);
	//결과 값을  member.jsp(회원가입 페이지)로 리턴
	//(리턴값이 1일경우 아이디 사용 불가 0일경우  사용가능)
	out.print(result);
%>