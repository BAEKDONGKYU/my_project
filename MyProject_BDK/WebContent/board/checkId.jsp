<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<html>
	<head>
		<meta charset="UTF-8">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//세션에서 로그인한 아이디 가져오기
	String id = (String)session.getAttribute("id");
	//글 게시판에서 글쓴이 정보 가져오기
	String user = request.getParameter("author");
	//글번호 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	if(id == null) {
%>
		<script type="text/javascript">
			alert("로그인을 하지 않으면 글을 수정할 수 없습니다.");
			location.href="../user/login.jsp";
		</script>
<%		
	}
	// 로그인을 했을 경우
	else {
		// 로그인은 했으나 글쓴이와 일치 하지 않을 경우
		if(id.equals(user) == false) {
%>
			<script type="text/javascript"> 
				alert("글작성자만 글을 수정할 수 있습니다.");
				history.back();
			</script>
<%			
		// 글쓴이일경우
		}else if(id.equals(user)) {
%>
			<script type="text/javascript">
				$(function () {
					location.href="modifyBoard.jsp?num="+$("#hiddenNum").val();					
				});
			</script>
<%			
		}
	}
%>
		
	
		<input type="hidden" id="hiddenNum" value="<%=num%>">
	</body>
</html>
	
	
	
	
	

