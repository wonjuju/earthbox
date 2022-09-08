<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Animated Login Form</title>
	<link rel="stylesheet" type="text/css" href="css/loginstyle.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- 사용자 정의 -->
	<link href="css/other.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	

</head>
<body>

	<div class="container">
		<div class="login-content">
			<form action="Login.do" method="post" id="form">
				<img src="img/logo/earthbox_logo.png">
				<h2 class="login_title">EARTH BOX</h2><br>
           		<div class="input-div one">
           		   <div class="i">
           		   </div>
           		   <div class="div">
           		   		<h5>아이디</h5>
           		   		<input type="text" class="input" name="user_id">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		   </div>
           		   <div class="div">
           		    	<h5>비밀번호</h5>
           		    	<input type="password" class="input" name="user_pw">
            	   </div>
            	</div>
            	<br>
            	<p><a class ="join_link" href="viewJoin.do">회원가입</a><p>
            	<br>
            	<button type="button" class="btn btn-sm login-btn" onclick="login()" id ="login-go">로그인</button>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
    
    function login() {

    	var id = $("input[name=user_id]").val(); 
    	var pw = $("input[name=user_pw]").val(); 
    	
    	console.log(id + pw)
    	
    	if (id == "" || pw == "") {
    		
    		alert("아이디 또는 비밀번호를 입력하세요")
    		
    	} else {
            $('#form').submit()
    		
    	}
    	
	
    }
    
		
            
		
    	
    
    </script>
</body>
</html>
