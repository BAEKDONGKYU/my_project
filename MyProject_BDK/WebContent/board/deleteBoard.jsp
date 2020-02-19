<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id"); // 아이디 가져오기
	String user = request.getParameter("author");  // 글쓴이
	System.out.println("id  :  " + id);
	System.out.println("user  :  " + user);
	// 로그인 상태이고 글쓴이만 삭제가 가능하도록
	// 로그인 상태가 아니면
	if(id == null) {
%>
		<script type="text/javascript">
			alert("로그인을 하지 않으면 사용할 수 없습니다.");
			location.href="../user/login.jsp";
		</script>
<%		
	}
	else if(id != null) {
		//로그인한 아이디와 글쓴이가 다를 경우
		if(id.equals(user) == false) {
%>
			<script type="text/javascript">
				alert("글작성자가 아니면 글을 삭제 할수 없습니다.");
				history.back();
			</script>
<%
		// 일치 할 경우	
		}else {
			//글번호 가져오기
			int num = Integer.parseInt(request.getParameter("num"));
			//dao객체 생성
			
			BoardDAO dao = new BoardDAO();
			//글삭제 메소드 result가 1이면 삭제 성공 0이면 삭제 실패
			int result = dao.deleteBoard(num);
			
			if(result == 1) {
				
				
%>
				<script type="text/javascript">
					alert("게시글을 삭제하였습니다.");
					location.href="board.jsp"
				</script>
<%				
			}else {
%>
				<script type="text/javascript">
					alert("게시글을 삭제에 실패하였습니다.");
					history.back();
				</script>	
<%				
			}	
			
		 }
	  }
%>
	
