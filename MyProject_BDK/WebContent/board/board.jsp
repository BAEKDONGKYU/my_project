<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String session_id = (String)session.getAttribute("id");
	//키워드와 검색조건의 값을 가져옴
	
	
	//페이징을 위한 변수 선언
	int totalRecord = 0; // 전체 글의 갯수
	int numPerPage = 5;	 // 한 페이지당 보여질 글의 갯수
	int pagePerBlock = 3; // 한 블럭당 묶여질 페이지 수
	int totalPage = 0; // 전체 페이지 수
	int totalBlock = 0; // 전체 블럭 수
	int nowPage = 0; // 현재 보여질 페이지
	int nowBlock = 0; // 현재 보여질 블럭
	int beginPerPage = 0; // 각 페이지의 시작 글번호
	
	String keyWord = "";
	String keyField = "";
	
	//키워드 입력이 되어  있을 경우
	
 	if(request.getParameter("search_keyword") != null){
		keyField = request.getParameter("search_keyfield");
		keyWord = request.getParameter("search_keyword");
	}
	
	
	// 처음으로 페이지 눌렸을 경우
	if(request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")){
			keyWord = "";
		}
	}
	
	// DB에 접근해서 총 데이터의 개수를 가져옴
	BoardDAO bDAO = new BoardDAO();
	//키워드와 키필드 값을 넘겨줘서 글을 가져옴
	ArrayList bArr = bDAO.allBoardList(keyField, keyWord);
	 	
	
	//전체글 개수 
	totalRecord = bArr.size();
	
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	beginPerPage = nowPage * numPerPage;
	
	
	
	
	//현재 보여질 페이지 번호 가져오기 
	
	// 현재 보여질 페이지 번호 가져오기
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null||pageNum.isEmpty()){
		pageNum = "1";
	}
	
	
	// 현재 보여질 페이지 번호 "1"을 정수 1로 변경
	int currentPage = Integer.parseInt(pageNum);
	
	

%>
    
    
<%--JSTL core라이브러리 태그들 사용을 위한 선언 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/board.js"></script>
</head>
<body>
<%

		if(session_id != null ) {
%>	
		<script type="text/javascript">
			$(function () {
				// 로그인 했을떄 글쓰기 버튼 보이게 하기 
				$(".btn-success").removeAttr("style");
			});
		</script>	
<% 

}
%>	
	
	
	<a href="../index.jsp" class="logo"> 
			<img src="../images/logo.png"alt="logo" id="login_logo">
	</a>
	<div class="container">  
		<div>
			<table>
				<tr>
					<td>
						총 계시글 수 :  <%=bArr.size() %>    
					</td>
				</tr>
				<tr>
					<td>
						현재 페이지 :  <%=nowPage+1%> / <%=totalPage%>
					</td>
				</tr>
			</table>
		</div> 
		 <table class="table table-hover" id="board_table">
            <thead style="border: 1px solid green">
            	  <tr bgcolor="lightblue">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody id="tbody">
        		<!--  db에서 전체글을 가져와서 길이 만큼 반복해서 뿌림 --> 
        	
<%
					BoardDTO bto = null; 
					if(totalRecord == 0) {
%>
						 <tr>
							<td colspan="5" align="center">게시글이 존재 하지 않습니다.</td>
						</tr> 
<%						
					}
					else {
						for(int i=beginPerPage; i<(beginPerPage + numPerPage); i++) {
							if(i == totalRecord){
								break;
							}	
							
							
						bto = (BoardDTO)bArr.get(i); // 
%>
						<tr>
							<td><%=bto.getNum() %></td>
							<td>
								<a href="checkPw.jsp?num=<%=bto.getNum()%>">
									<%=bto.getSubject()%>
								</a>
							</td>
							<td><%=bto.getAuthor() %></td>
							<td><%=bto.getRegdate() %></td>
							<td><%=bto.getCount() %></td>
						</tr>
<% 						
					    }
					}
%>	
	
<td align="left">
	<%
		if(totalRecord > 0){
			if(nowBlock > 0){
				System.out.println(nowBlock);
	%>
	<a href="board.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>">이전</a>
	<%
			}
		}
	%>
	
	<%
		for(int cnt=0; cnt<pagePerBlock; cnt++){
			if(((nowBlock*pagePerBlock)+cnt) == totalPage){
				break;
			}
			if(((nowBlock*pagePerBlock)+1+cnt) == totalRecord){
				break;
			}
	%>
			<a href="board.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+cnt%>">
			<%=(nowBlock * pagePerBlock) + 1 + cnt%>
			</a>
	<%
		
		}
	%>	
	<%
		if(totalBlock > nowBlock+1){
	%>
	<a href="board.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">다음</a>
	<%
		}
	%>
	
	
        		     
            </tbody>
        </table>  
        <div style="text-align: center">
        	<div style="display: inline-block; width: 50%">
<%

%>
			</div>
         </div>   
         	<div style="text-align: center" >
         		<div style="display: inline-block; width: 50%">
         			<form id="serach_form" method="post" action="board.jsp">
	         			<select name="search_keyfield" id="search_keyfield">
	         				<option value="author">작성자</option>
	         				<option value="subject">제목</option>
	         			</select>
		         		<input type="text" type="form-control" id="search_keyword" name="search_keyword">
		         	 	<input type="button" value="검색" class="btn btn-primary" id="search_button"> 
	         	 	</form> 
         		</div>
         	</div>
         	<!--  로그인 상태에서만 글을 쓸 수 있도록 기본적으로 숨김처리 -->
            <a href='writeBoard.jsp' class="btn btn-success"  style="display: none">글쓰기</a> 
            <a href="board.jsp?reload='true'" class="btn btn-success">처음으로</a>          
    </div>
</body>
</html>