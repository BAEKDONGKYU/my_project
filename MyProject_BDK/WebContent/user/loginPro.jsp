<%@page import="member.MemberDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//ajax을 통해서 넘어온 key id의 value값 가져오기
	String id = request.getParameter("id");
	//ajax을 통해서 넘어온 key pwd의 value값 가져오기
	String pwd = request.getParameter("pwd");
	//dao객체 생성
	MemberDAO dao = new MemberDAO();
	//DB접속해서 해당 아이디와 비밀번호가 일치하는 지 체크
	int result = dao.userCheck(id, pwd);
	if(result == 1) {
		//세션을 저장
		session.setAttribute("id", id);
	}
	//결과 값을 index.jsp로 리턴
	//(리턴값이 1일경우 모두일치,  0일경우 비빌번호 틀림  -1아이디 틀림)
	out.print(result);
%>  
