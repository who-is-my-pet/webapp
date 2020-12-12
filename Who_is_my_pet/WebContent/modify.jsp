<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%!
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	
	String name, id, pw, age, email, insta_id, description, gender;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="css/RegisterPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	id = (String)session.getAttribute("id");
	name = (String)session.getAttribute("name");
	age = (String)session.getAttribute("age");
	gender = (String)session.getAttribute("gender");
	email = (String)session.getAttribute("email");
	insta_id = (String)session.getAttribute("insta_id");
	description = (String)session.getAttribute("description");
%>
	<div class="wrapper">
		<div class="container">
			<h1>회원 정보 수정</h1>
			
			<form method="POST" action="Modify.do" class="form">
					
					<%-- 아이디는 고정 --%>
					아이디 : <%= id %> <br>
					
					<%-- 이름 변경 --%>
					이름 : <input type="text" name="name" maxlength="50" value=<%= name %>>  <br>
					
					<%-- 성별 변경 --%>
					성별 : <%= gender %> <br>
					
					<%-- 나이 변경 --%>
					나이 : <input type="text" name="age" maxlength="50" value=<%= age %>> <br>
					
					<%-- 인스타 변경 --%>
					인스타 주소 : <input type="text" name="insta" maxlength="50" value=<%= insta_id %>> <br>
					
					<%-- 이메일은 고정 --%>
					이메일 : <%= email %><br>
					
					<%-- 자기소개 수정 --%>
					자기 소개 : <input type="text" name="description" maxlength="200" value=<%= description %>> <br>
					
					
					<input type="submit" value="수정" /> <input type="button" value="취소" onclick="location.href='MyPage.jsp'">
					
					
					
					
				</form>
			</div>
		</div>
</body>
</html>