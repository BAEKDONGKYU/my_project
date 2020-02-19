<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//제목
	String subject = request.getParameter("subject");
	//내용
	String content = request.getParameter("content");
	//비밀번호
	String pass = request.getParameter("wPass");
	//글쓴이
	String author = (String)session.getAttribute("id");
	//아이피 
	String ip = request.getRemoteAddr();
	
	BoardDTO dto = new BoardDTO();
	dto.setAuthor(author);
	dto.setIp(ip);
	dto.setContent(content);
	dto.setSubject(subject);
	dto.setPass(pass);
	
	BoardDAO dao = new BoardDAO();
	int result = dao.writeData(dto);

	if(result == 1) {
%>
		<script type="text/javascript">
			alert("글쓰기에 성공했습니다.");
			location.href="board.jsp";
		</script>
<%		
	}else {
%>
		<script type="text/javascript">
			alert("글쓰기에 실패했습니다. 다시 작성부탁드립니다.");
			history.back();
		</script>
<%	
	}
%>