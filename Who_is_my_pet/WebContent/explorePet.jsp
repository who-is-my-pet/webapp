<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.AnimalDTO"%>
<%@ page import="dao.AnimalDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meet New People! Choose your dear pet!</title>
<script type="text/javascript">
	function choosePet(idx, name) {
		console.log("User clicked : " + idx + " which means " + name);
		window.location = '/Who_is_my_pet/exploreLounge?id=' + idx+'&name='+name;
	}
</script>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="css/ExplorePet.css">
</head>
<body>
	<h1>선호하는 동물상을 클릭해보세요:) 각 동물상에 맞는 사람들을 만나보실 수 있습니다</h1>
	<div class="cards-list">
		<c:forEach var="row" items="${requestScope.animal_list}">
			<div class="card 1">
				<div class="card_image">
					<img src="${row.img}"
						onclick="choosePet('${row.idx}','${row.name}')" />
				</div>
				<div class="card_title title-black">
					<p>
						<c:out value="${row.name}" />
					</p>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
