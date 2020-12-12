<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{ background : #f9ece8; }
.container
{
	width : 100%;
	height : 100%;
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

.content
{
	width : 100%;
	height : 200px;
	display : flex;
	align-items: center;
	flex-direction : row;
	flex-wrap : wrap;
	justify-content : space-evenly;	
}
#tr3 td
{
	margin : 0 auto;
}
</style>
</head>
<body>

<%
String id = "";
id = (String)session.getAttribute("id");
%>

<script type="text/javascript">
	function button_event()
	{
		if(confirm("정말 탈퇴하시겠습니까?") == true){
			document.getElementById('deletepage').submit();
		}
		else{
			return;
		}
	}
</script>

<div class="container">
	<div class="wrap">
		<div class="info">
			<h3>회원탈퇴</h3>
	        <h4>아이디 패스워드를 입력하세요</h4>
        </div>
    
    <div class="content">   
	    <form action="Delete.do" method="post" id="deletepage">
	        <input type="hidden" name="command" value="delete">
	        
	        <table class="input">       
	            <tr id="tr1">
	                <td>아이디</td>
	                <td><input type="text" name="clientId" value="<%=id%>" readonly="readonly"></td>
	            </tr>
	            <tr id="tr2">
	                <td>비밀번호</td>
	                <td><input type="password" name="clientPassword" ></td>
	            </tr>
	            <tr rowspan="2" id="tr3">
	                <td><input type="button" value="탈퇴하기" onclick="button_event();"/></td>
	            </tr>
	        </table>
	     </form>
    </div> 
  </div>
</div>
</body>
</html>