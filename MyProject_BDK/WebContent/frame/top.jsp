<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%
	String session_id = (String)session.getAttribute("id");
	if(session_id != null ) {
%>
	<script type="text/javascript">
		$(function () {
			$(".glyphicon-log-in").css("display","none");
			$(".glyphicon-user").css("display","none");
			
			//회원정보, 로그아웃 안보이게 하기
			$(".glyphicon-log-out").removeAttr("style");
			$(".glyphicon-wrench").removeAttr("style");
		});
	</script>
<% 		
	}
%>   
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<a href="/MyProject_BDK/index.jsp" class="logo"> 
			<img src="/MyProject_BDK/images/logo.png" alt="logo">
		</a>
		<div id="glyphicon">
<%
				if(session.getAttribute("id")!= null) {
					//로그인에 성공했을 경우
%>
				<p><b><%=session.getAttribute("id") %></b>님 접속중입니다.</p>
<% 					
				}
%>			
			<a href="/MyProject_BDK/user/login.jsp" id="login_a" />
				<span class="glyphicon glyphicon-log-in">로그인 </span> 
			</a>
			<a href="/MyProject_BDK/user/logout.jsp">
				<span class="glyphicon glyphicon-log-out" style="display: none">로그아웃 </span>
			</a>
			<a href="/MyProject_BDK/user/modify.jsp">
				<span class="glyphicon glyphicon-wrench" style="display: none">회원정보수정</span>
			</a>
			<a href="/MyProject_BDK/member/member.jsp">
				<span class="glyphicon glyphicon-user">회원가입 </span>
			</a> 
			<a href="#">
				<span class="glyphicon glyphicon-shopping-cart">장바구니 </span>
			</a>
			<a href="/MyProject_BDK/board/board.jsp">
				<span class="glyphicon glyphicon-list-alt">게시판</span>
			</a>
		</div>
	</div>	
</body>
</html>