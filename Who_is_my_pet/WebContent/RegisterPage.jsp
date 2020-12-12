<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/RegisterPage.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>Who's my pet 회원가입</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<div class="wrapper">
	<div class="container">
		<h1>Make your Account</h1>
		
		<form class="form" method="POST" action="Register.do">
			<%-- 아이디입력 --%>
			<input type="text" name="newid" id="userId" placeholder="아이디"/>
			<input type="button" id="idCheck" class="checkbtn" value="중복확인">
			<br/>
	
			<%-- 비밀번호입력 --%>
			<input type="password" name="newpassword" id="pw_1" class="pw" minlength="8" placeholder="비밀번호(8자리 이상)"/>
			<input type="password" name="newpassword" id="pw_2" class="pw" minlength="8" placeholder="비밀번호확인"/>
			<span id="alert-success" style="display:none;">비밀번호가 일치합니다.</span>
			<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
			<br/>
			
			<%-- 이름입력 --%>
			<input type="text" name="name" maxlength="10" placeholder="이름"/>
			<br/>
			
			<%-- 성별입력 --%>
			<span>남</span> <input type="radio" class="gendercl" name="gender" value="남" checked />
			<span>여</span> <input type="radio" class="gendercl" name="gender" value="여" />
			<br/>
			
			<%--나이입력 --%>
			<input type="text" name="age" placeholder="나이" maxlength="3"/>
			<br/>
			
			<%-- 인스타그램 아이디 입력 --%>
			<input type="text" name="insta" placeholder="(Select)Instagram ID" maxlength="50">
			<br/>
			
			<%-- 이메일입력 --%>
			<input type="text" name="mail1" maxlength="50" id="email1" placeholder="email ID"> 
			<span><select name="mail2" id="email2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
			</select></span>
			<input type="button" id="emailCheck" class="checkbtn" value="중복확인"/>
			<br/>
			
			<%-- 자기소개입력 --%>
			<input type="text" name="description" maxlength="200" placeholder="당신을 마음껏 소개해보세요.">
			<br/>
				
			<button type="submit" id="register-button">GET STARTED</button>	
			<input type="button" value="취소" onclick="location.href='LoginPage.jsp'"/>
			
			<script>
			    $('.pw').focusout(function () {
			        var pwd1 = $("#pw_1").val();
			        var pwd2 = $("#pw_2").val();
			 
			        if ( pwd1 != '' && pwd2 == '' ) {
			            null;
			        } else if (pwd1 != "" || pwd2 != "") {
			            if (pwd1 == pwd2) {
			                $("#alert-success").css('display', 'inline-block');
			                $("#alert-danger").css('display', 'none');
			            } else {
			                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
			                $("#alert-success").css('display', 'none');
			                $("#alert-danger").css('display', 'inline-block');
			            }
			        }
			    });
			    
			    $('#idCheck').click(function(){
			    	$.ajax({
			    		url: "idDup.do",
			    		type: "post",
			    		data: {
			    			"userId":$("#userId").val()
			    		},
			    		success:function(data){
			   				console.log(data);
			   				
			   				if(data == 'ok'){
			   					alert("사용 가능한 아이디입니다.");
			   				}
			   				else {
			   					alert("이미 사용 중인 아이디입니다.");
			   					$('#userId').select();
			   				}
			    		},
			    		error:function(){
			   				console.log("---Error---");
			   			}
			    	});
			    });
			    
			    $('#emailCheck').click(function(){
			    	var email = $("#email1").val()+'@'+$("#email2").val();
			    	console.log(email);
			    	
			    	$.ajax({
			    		url: "emailDup.do",
			    		type: "post",
			    		data: {
			    			"email":email
			    		},
			    		success:function(data){
			   				console.log(data);
			   				
			   				if(data == 'ok'){
			   					alert("사용 가능한 이메일입니다.");
			   				}
			   				else {
			   					alert("이미 사용 중인 이메일입니다.");
			   					$('#userId').select();
			   				}
			    		},
			    		error:function(){
			   				console.log("---Error---");
			   			}
			    	});
			    });
			    
			</script>
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