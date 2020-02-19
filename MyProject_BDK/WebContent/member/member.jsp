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
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/mobile.css"
	media="screen and (max-width : 568px)">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../js/mobile.js"></script>
<script src="../js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>회원가입</title>
</head>
<body>
	<a href="../index.jsp" class="logo"> 
		<img src="../images/logo.png"alt="logo" id="member_logo">
	</a>
	  <article class="container">
        <div class="page-header">
          <h1>회원가입</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form action="memberPro.jsp" method="post" id="member_form">
          	<div class="form-group">
              	<label for="id">아이디</label>
              	<input type="text" class="form-control" id="id" name="id" placeholder="아이디" required>
              	<p id="id_p"></p>
           	</div>
            <div class="form-group">
              <label for="pwd">비밀번호</label>
              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" required>
              <p id="pwd_p"></p>
            </div>
            <div class="form-group">
              <label for="pwd_confirm">비밀번호 확인</label>
              <input type="password" class="form-control" id="pwd_confirm" placeholder="비밀번호 확인" required>
              <p id="pwd_confirm_p"></p>
            </div>
            <div class="form-group">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요" required>
              <p id="name_p"></p>
            </div>
            <div class="form-group">
              <label for="gender">성별</label>
              <select class="form-control" id="gender" name="gender" required> 
              	<option value="성별">성별</option>
              	<option value="남">남</option>
              	<option value="여">여</option>
              </select>
              <p id="gender_p"></p>
            </div>
            <div class="form-group">
              <label for="year">생년월일</label><br>
              <input type="text" class="form-control_birth" name ="year" id="year" maxlength="4" placeholder="년(4자)" required>
              <select class="form-control_birth" name="month" id="month" required>
              	<option value="월">월</option>
              	<option value="1">1</option>
              	<option value="2">2</option>
              	<option value="3">3</option>
              	<option value="4">4</option>
              	<option value="5">5</option>
              	<option value="6">6</option>
              	<option value="7">7</option>
              	<option value="8">8</option>
              	<option value="9">9</option>
              	<option value="10">10</option>
              	<option value="11">11</option>
              	<option value="12">12</option>
              </select>
              <input type="text" class="form-control_birth"  name="date" id="date" maxlength="2" placeholder="일(2자)" required>
              <p id="birth_p"></p>
            </div>
            
            <div class="form-group">
              <label for="phone">휴대전화</label><br>
              <input type="text" class="form-control_phone" id="phone" name="phone" maxlength="3" placeholder="숫자3자" required>
              <input type="text" class="form-control_phone" id="phone2" name="phone2" maxlength="4" placeholder="숫자4자" required>
              <input type="text" class="form-control_phone" id="phone3" name="phone3" maxlength="4" placeholder="숫자4자" required>
              <p id="phone_p">
            </div><br>
            <div class="form-group">
              <label for="zipcode">우편번호</label><br>
              <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호   버튼을 이용해주세요" readonly required>
              <span class="input-group-btn">
              	  <input type="button" class="btn btn-success" id="zipcode_button" value="우편번호 찾기">
              </span><br>
              <input type="text" class="form-control" id="address" name="address" placeholder="주소" readonly required><br>
              <input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소" required>
              <p id="zipcode_p"></p>
            </div>
            <div class="form-group">
            	<label for="email">이메일</label>
            	<input type="text" class="form-control" id="email" name="email" placeholder="이메일" required>
            	 <p id="email_p"></p>
            </div>
            <div class="form-group text-center">
              <input type="button" class="btn btn-info" value="회원가입">

            </div>
          </form>
        </div>
      </article>
	
	<jsp:include page="../frame/footer.jsp" />
</body>
</html>