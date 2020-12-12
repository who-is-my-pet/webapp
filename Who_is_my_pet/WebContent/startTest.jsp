<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/testAnimal.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/normalize.css" />
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>나와 닮은 동물상 찾기</title>
<%
int user_idx = 0; 
try{
	user_idx = (int)session.getAttribute("idx");
	
	if(user_idx == 0){
		response.sendRedirect("LoginPage.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}

%>
</head>
<body>
	<!-- 전체영역 시작 -->
	<div id="wrap">
		<!-- 상단영역 시작 -->
		<div id="header">
			<div class="globalArea">
				<a href="RegisterPage.jsp">Join</a>
				<%if(user_idx == 0) {%>
				<a href="LoginPage.jsp">Login</a>
				<%} else{%>
				<a href="Logout.do">Logout</a>
				<%} %>
				<a href="MyPage.jsp">MyPage</a> <a href="postInfo.html">Ads</a> <a
					href="startTest.jsp">Home</a>
			</div>
			<div class="logoArea"></div>
		</div>
		<!-- 상단영역 끝 -->

		<!-- 본문영역 시작 -->
		<div>
			<div>
				<h4
					style="font-family: Cafe24Ohsquare; font-size: 20px; color: #000; position: absolute; top: 15%; left: 45%;">당신은
					어떤 동물인가요?</h4>
				<h3
					style="font-family: Cafe24Ohsquare; font-size: 25px; color: #000; position: absolute; top: 20%; left: 38%;">
					<b>인공지능으로 알아보는 나의 닮은꼴 동물상 찾기✨</b>
				</h3>
				<div class="fox">
					<div class="head">
						<div class="eye"></div>
						<div class="eye"></div>
					</div>
					<div class="ear"></div>
					<div class="ear"></div>
					<div class="nose"></div>
					<div class="body"></div>
					<div class="tail"></div>
				</div>
				<button style="font-family: Cafe24Ohsquare;" class="start-button"
					onClick="location.href='testAnimal.jsp'">동물상 테스트 시작하기</button>
			</div>
		</div>
		<div></div>
		<!-- 본문영역 끝 -->
	</div>
	<!-- 전체영역 끝 -->
</body>
</html>