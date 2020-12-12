<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! String name, id, pw, age, description; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<style>
body
{
	font-family : 'Source Sans Pro', sans-serif;
	background : #f9ece8; 
}

a{text-decoration : none; color : white;}
a:visited{text-decoration:none; color : white;}

.container 
{
	width: 100%;
	height: 100%;  
	overflow: hidden;
}
.wrap
{	
	width : 90%;
	height : 100%;
	border : 3px solid #ff7373;
	border-radius : 10px;
	margin : 10px auto;
}

.info
{
	margin : 0 auto;
	text-align : center;
	
}

.ref
{
	float : right;
	width : 100%;
}

.myinfo
{
	margin : 10% auto 0 auto;
	border : 1px solid #ff7373;
	border-radius : 10px;
	text-align : left;
	width : 90%;
	flex-direction : row;
	display : flex;
	flex-wrap : wrap;
	height : 350px;
	align-items : center;
	font-size : 15pt;
}

img{ width : 200px; height : 250px; object-fit: cover; }

.image
{
	margin : 0 20px;
	border : 1px solid #ff7373;
	flex : 1;
	align-items : center;
	justify-content : center;
	display : flex;
	height : 90%;
	flex-direction : column;
}

.infoclass
{
	margin : 0 20px; 
	flex : 2;
}
#content
{
	width : 100%;
	height : 500px;
	display : flex;
	align-items: center;
	flex-direction : row;
	flex-wrap : wrap;
	justify-content : space-evenly;	
}


#modify
{
	width : 30%;
	height : 200px;
	line-height : 200px;
	font-size : 20pt;
	text-align : center;
	font-weight : bold;
	float : left;
	border : 1px solid #ff7373;
	background-color : #ff7373;
}

#like_me_list
{
	width : 30%;
	height : 200px;
	line-height : 200px;
	font-size : 17pt;
	text-align : center;
	font-weight : bold;
	float : left;
	border : 1px solid #ff7373;
	background-color : #ff7373;
}

#delete
{
	width : 30%;
	height : 200px;
	line-height : 200px;
	font-size : 20pt;
	text-align : center;
	font-weight : bold;
	float : left;
	border : 1px solid #ff7373;
	background-color : #ff7373;
}

#logout, #home
{
	float : right;
	margin : 10px; 
}

</style>

	<script>
        function popup(){
            var url = "ProfileImage.jsp";
            var name = "프로필 이미지 변경";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
</head>
<body>

<%
	name = (String)session.getAttribute("name");
	age = (String)session.getAttribute("age");
	description = (String)session.getAttribute("description");	
%>

<div class="container">
	<div class="wrap">
		<div class="info">
			<h2> <%= name %> 님의 마이페이지 </h2>
		</div>
		
		<div class="ref">
			<a href = "Logout.do" id="logout" style="color:black">logout</a>
			<a href = "index.jsp" id="home" style="color:black">home</a>
		</div>

		<div class="myinfo">
			<div class="image">
				<img src="https://{bucket-name}.s3.{region-name}.amazonaws.com/{파일명}" alt="프로필 사진"><br/>
				<button type="button" onclick="popup()"> 프로필 사진 변경 </button>
			</div>
			<div class="infoclass">
				<p>이름 : <%= name%></p>
				<p>나이 : <%= age%></p>
				<p>자기소개 : <%= description %>
			</div>
		</div>
		
		<div id = "content">
			<div id = "delete" class="child">
				<a href = "Delete.jsp">탈퇴</a>
			</div>
			
			<div id="modify" class="child">
			<a href="modify.jsp">정보수정하기</a>
			</div>
			
			<div id="like_me_list" class="child">
			<a href="MatchLounge">나를 좋아하는 사람은?</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>