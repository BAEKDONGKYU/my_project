<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//게시판에서 글 제목 클릭시 넘어온 해당 글 번호
	
	int num = Integer.parseInt(request.getParameter("num"));
	//dao 객체 생성
	BoardDAO dao = new BoardDAO();
	//해당 글 번호에 해당하는 데이터 모두 가져오기
	BoardDTO dto =  dao.getNumData(num);
	int bNum = dto.getNum(); //  글번호
	String bAuthor = dto.getAuthor(); // 글쓴이
	String bContent = dto.getContent(); // 글내용
	int bCount = dto.getCount(); // 1증가된 조회수
	String bIp = dto.getIp(); //아이피
	String bPass = dto.getPass(); //패스워드
	Timestamp bRegdate = dto.getRegdate();
	String bSubject = dto.getSubject();
%>  
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정하기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/board_modify.js"></script>
</head>
<body>
	<a href="../index.jsp" class="logo"> 
			<img src="../images/logo.png"alt="logo" id="login_logo" style="width: 300px;">
	</a>
	<div class="container">
		<div class="row">
			<div class="col-xs-2 col-md-2"></div>
			<div class="col-xs-8 col-md-8">
				<h2 class="text-center">게시글 보기</h2>
				<p>&nbsp;</p>
				<div class="table table-responsive">
				   <form method="post" action="modifyBoardPro.jsp" id="mForm"> 
					<table class="table">
						<tr>
							<th class="success">글번호</th>
							<td><%=bNum%></td>
							<th class="success">조회수</th>
							<td><%=bCount%></td>
						</tr>


						<tr>
							<th class="success">작성자</th>
							<td><%=bAuthor%></td>
							<th class="success">작성일</th>
							<td><%=bRegdate%></td>
						</tr>

						<tr>
							<th class="success">아이피</th>
							<td colspan="3"><%=bIp%></td>
						</tr>

						<tr>
							<th class="success">제목</th>
							<td colspan="3">
								<input type="text" value="<%=bSubject%>" id="mSubject" name="mSubject">
							</td>
						</tr>
						<tr>
							<th class="success">글 내용</th>
							<td colspan="3">
								<textarea id="mContent" name="mContent"><%=bContent%></textarea>
							</td>
						</tr>
						

						<tr>
							<td colspan="4" class="text-center">
								<!-- <input type="button" class="btn btn-success" value="답글 쓰기" id="reply"> -->
								<input type="button" class="btn btn-warning" value="수정하기" id="modify">
								<input type="button" class="btn btn-primary" value="목록보기" id="list">
							</td>
						</tr>
						<input type="hidden" value="<%=bNum%>" id="hiddenNum" name="hiddenNum">
						<input type="hidden" value="<%=bAuthor%>" id="hiddenAuthor" name="hiddenAuthor">
					</table>
				   </form>	
				</div> <!-- col-xs-8 col-md-8 -->
			</div>
		</div> <!-- row -->

	</div>  <!-- container -->
</body>
</html>