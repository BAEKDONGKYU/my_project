<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/write.js"></script>
</head>
<body>

	<a href="../index.jsp" class="logo"> 
			<img src="../images/logo.png"alt="logo" id="login_logo">
	</a>
	<div class="container">
		<form action="writePro.jsp" method="post" id="writeForm"> 
			<div class="form-group">
				<label for="subject">제목</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="10" cols="200" id="content"></textarea>
			</div>
			<div>
				<label for="wPass">비밀번호</label>
				<input type="password" maxlength="10" id="wPass" name="wPass">
			</div>
			<input type="button" class="btn btn-primary" value="작성" id="write_button">
			<input type="button" class="btn btn-info" value="목록으로 가기" id="goback_button">
		</form>
	</div>

</body>
</html>