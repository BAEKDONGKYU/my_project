<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/mobile.css"
	media="screen and (max-width : 568px)">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/mobile.js"></script>
<script src="../js/login.js"></script>
<title>로그인</title>
</head>
<body>
	<a href="../index.jsp" class="logo"> 
			<img src="../images/logo.png"alt="logo" id="login_logo">
	</a>
	 <div class="login_container">
      <div class="row">
        <div class="col-md-4 col-md-push-4" >
          <div class="login-box well">
        	<form accept-charset="UTF-8" method="post" action="loginPro.jsp">
	            <legend>로그인</legend>
	            <div class="form-group">
	                <label for="userID">아이디</label>
	                <input name="user_id" id="user_id" placeholder="아이디를 입력해주세요" type="text" class="form-control" />
	            </div>
	            <div class="form-group">
	                <label for="user_pwd">비밀번호</label>
	                <input name="user_pwd" id="user_pwd" placeholder="패스워드를 입력해주세요" type="password" class="form-control" />
	            </div>
	            <p id="login_check_message"></p>
	            <div class="form-group">
	                <input type="button" id="login_button" class="btn btn-default btn-login-submit btn-block m-t-md" value="로그인" />
	            </div>
	            <div class="form-group">
	                <a href="../member/member.jsp" class="btn btn-default btn-block m-t-md"> 회원가입</a>
	            </div>
	            <span class='text-center'><a href="findUserID.jsp" class="text-sm">아이디 찾기 |</a></span>
	            <span class='text-center'><a href="findUserPW.jsp" class="text-sm">비밀번호 찾기</a></span>
       	   </form>
          </div>
        </div>
      </div> <!-- end row -->
    </div> <!-- end container -->
</body>
</html>