<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>아이디 찾기</title>
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
	<script type="text/javascript" src="../js/mobile.js"></script>
</head>
<body>	
	<a href="../index.jsp" class="logo"> 
			<img src="../images/logo.png"alt="logo" id="login_logo">
	</a>
	 <div class="find_container">
      <div class="row">
        <div class="col-md-4 col-md-push-4" >
          <div class="login-box well">
        	<form accept-charset="UTF-8" method="post" action="findUserID_Pro.jsp">
	            <legend align="center">아이디 찾기</legend>
	            <div class="form-group">
	               <label for="email">이메일</label><br>
	               <input type="text" class="form-control" id="find_email" name="find_email" placeholder="가입 당시 입력한 이메일을 입력해주세요"  required>
	            </div>
	            <p id="find_check_message"></p>
	            <div class="form-group">
	                <input type="submit" id="find_button" class="btn btn-default btn-login-submit btn-block m-t-md" value="아이디 찾기" />
	            </div>
       	   </form>
          </div>
        </div>
      </div> <!-- end row -->
    </div> <!-- end container -->
	
</body>
</html>