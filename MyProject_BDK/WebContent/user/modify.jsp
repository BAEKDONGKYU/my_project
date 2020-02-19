<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  //한글처리 %>    
    
    
<%--session에 저장되어 있는 id를 이용해 dao에 저장된 데이터 가져오기  --%>
	<jsp:useBean id="dao" class="member.MemberDAO" />	
<%
	String session_id = (String)session.getAttribute("id");
	MemberDTO dto = dao.userAllData(session_id);
	
%>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/mobile.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/member_modify.js"></script>
<title>회원 정보수정</title>
</head>
<body>
	<a href="../index.jsp" class="logo"> 
		<img src="../images/logo.png"alt="logo" id="member_logo">
	</a>
	  <article class="container">
        <div class="page-header">
          <h1>회원 정보수정</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form action="modifyPro.jsp" method="post" id="modify_form">
          	<div class="form-group">
              	<label for="modify_id">아이디</label>
              	<input type="text" class="form-control" id="modify_id" name="modify_id" value="<%=dto.getId() %>" disabled="disabled">
           	</div>
            <div class="form-group">
              <label for=modify_pwd>비밀번호</label>
              <input type="password" class="form-control" id="modify_pwd" name="modify_pwd" placeholder="비밀번호" required>
              <p id="modify_pwd_p"></p>
            </div>
            <div class="form-group">
              <label for="modify_pwd_confirm">비밀번호 확인</label>
              <input type="password" class="form-control" id="modify_pwd_confirm" placeholder="비밀번호 확인" required>
              <p id="modify_pwd_confirm_p"></p>
            </div>
            <div class="form-group">
              <label for="modify_name">이름</label>
              <input type="text" class="form-control" id="modify_name" name="modify_name" value="<%=dto.getName() %>" disabled="disabled">
            </div>
            <div class="form-group">
              <label for="modify_gender">성별</label>
              <input type="text" class="form-control" id="modify_gender" name="modify_gender" value="<%=dto.getGender()%>" disabled="disabled">
            </div>
            <div class="form-group">
              <label for="modify_year">생년월일</label><br>
              <input type="text" class="form-control_birth" name ="modify_year" id="modify_year" 
              					maxlength="4" value="<%=dto.getYear() %>년" disabled="disabled">
              <input type="text" class="form-control_birth" name ="modify_month" 
              						id="modify_month" maxlength="2" value="<%=dto.getMonth() %>월" disabled="disabled">
              <input type="text" class="form-control_birth"  name="modify_date" id="modify_date" 
              						maxlength="2" value="<%=dto.getDate() %>일" disabled="disabled">
            </div>
            <div class="form-group">
              <label for="modify_phone">휴대전화</label><br>
              <input type="text" class="form-control_phone" id="modify_phone" name="modify_phone" 
              					  maxlength="3" value="<%=dto.getPhone() %>" required>
              <input type="text" class="form-control_phone" id="modify_phone2" name="modify_phone2" 
              					maxlength="4"  value="<%=dto.getPhone2()%>" required>
              <input type="text" class="form-control_phone" id="modify_phone3" name="modify_phone3" 
              maxlength="4" value="<%=dto.getPhone3() %>" required>
              <p id="modify_phone_p">
            </div><br>
            <div class="form-group">
              <label for="modify_zipcode">우편번호</label><br>
              <input type="text" class="form-control" id="modify_zipcode" name="modify_zipcode" value="<%=dto.getZipcode() %>" style="float: left; width: 75%;" disabled="disabled">
              <span class="input-group-btn">
              	  <input type="button" class="btn btn-success" id="zipcode_button" value="우편번호 찾기" style="float : left;" disabled="disabled">
              </span><br>
              <input type="text" class="form-control" id="modify_address" name="modify_address" value="<%=dto.getAddress() %>" disabled="disabled"><br>
              <input type="text" class="form-control" id="modify_address2" name="modify_address2" value="<%=dto.getAddress2() %>" disabled="disabled">
              <p id="modify_zipcode_p"></p>
            </div>
            <div class="form-group">
            	<label for="modify_email">이메일</label>
            	<input type="text" class="form-control" id="modify_email" name="modify_email"value="<%=dto.getEmail() %>" disabled="disabled">
            	 <p id="modify_email_p"></p>
            </div>
            <div class="form-group text-center">
              <input type="button" class="btn btn-info" value="회원정보수정">
              <input type="button" class="btn btn-danger" value="회원탈퇴">
            </div>
          </form>
        </div>
      </article>
	<jsp:include page="../frame/footer.jsp" />
</body>
</html>