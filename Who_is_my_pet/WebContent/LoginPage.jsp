<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/LoginPage.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>Who's my pet 로그인 페이지</title>  	
<script type="text/javascript">
    	
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
        
    </script>
</head>

<body>
<div class="wrapper">
	<div class="container">
		<h1>Welcome</h1>
		
		<form class="form" method="POST" action="Login.do" name="loginInfo" onsubmit="return checkValue()">
			<input type="text" name="id" placeholder="Username">
			<input type="password" name="pw" placeholder="Password">
			<button type="submit" id="login-button">Sign in</button>			
			<input type="button" class="signin-button" value="Sign up" onclick="location.href='RegisterPage.jsp'"/>
			<br><br><p> Forgot ID or Password? </p> 
			<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='*'"/>
		</form>		
	</div>
	
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
</body>
</html>