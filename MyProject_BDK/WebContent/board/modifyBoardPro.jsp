<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//수정 페이지에서 수정한 제목
	String subject = request.getParameter("mSubject");
	//수정 페이지에서 수정한 내용
	String content = request.getParameter("mContent");
	//글번호
	int num = Integer.parseInt(request.getParameter("hiddenNum"));
	
	//dao객체 생성 modifyBoard()메소드 호출
	BoardDAO dao = new BoardDAO();
	int result = dao.modifyBoard(num,subject,content);
	if(result == 1) {
%>
		<script type="text/javascript">
			alert("게시글 수정 완료했습니다.");
			location.href = "board.jsp";
		</script>
<% 		
	}else {
%>
		<script type="text/javascript">
			alert("게시글 수정 실패했습니다.")
			history.back();
		</script>
<% 		
	}
%>   
    
