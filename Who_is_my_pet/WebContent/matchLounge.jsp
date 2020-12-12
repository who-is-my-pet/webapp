<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.util.*" session="true"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>매칭된 사람이에요!</title>
<link rel="stylesheet" type="text/css" href="css/Lounge.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function likePost(elm, other_idx) {
		console.log("likePost() was called: " + other_idx);
		$.ajax({
			type : "POST",
			url : "InsertLikes",
			data : {
				'other_idx' : other_idx
			},
			success : function(responseText) {
				//alert("inserted success" + responseText);
				$(elm).attr("class", "fa fa-heart");
				$(elm).attr("onclick", "unlikePost(this, " + other_idx + ")");
			},
			error : function(xhr, status) {
				//alert(status + "!!!");
				alert("좋아요를 반영하는 과정에서 에러가 발생했습니다.");
			}
		});
	}
	function unlikePost(elm, other_idx) {
		//console.log("unlikePost() was called: " + other_idx);
		$.ajax({
			type : "POST",
			url : "DeleteLikes",
			data : {
				'other_idx' : other_idx
			},
			success : function(response) {
				//alert("delete success" + response);
				$(elm).attr("class", "fa fa-heart-o");
				$(elm).attr("onclick", "likePost(this, " + other_idx + ")");
			},
			error : function(xhr, status) {
				//alert(status + "!!!");
				alert("좋아요 취소를 반영하는 과정에서 에러가 발생했습니다.");
			}
		});
	}
	function clickInsta(insta_id) {
		if (insta_id === "" || insta_id === null) {
			alert("해당 사용자는 인스타아이디를 제공하지 않습니다");
		} else {
			window.location = 'https://www.instagram.com/' + insta_id;
		}
	}
</script>
</head>
<body>
	<!-- 전체영역 시작 -->
	<div>
		<!-- 본문영역 시작 -->
		<div id="content">
			<h1 style="display: inline-block">🎵이상형 매칭</h1>
			<h1 style="color: #ff7373; display: inline-block">성공🎵</h1>
			<h1>하트를💗 눌러 상대방의 인스타그램으로 연락해보세요💌</h1>
			<!-- <h1>서두르세요! 매칭된 리스트는 24시간🕛 이후 사라집니다</h1> -->
			<br>
			<c:forEach var="row" items="${requestScope.matchedUserList}">
				<div class="card">
					<img src="${row.img}" alt="" class="card-image" />
					<div class="card-meta">
						<span class="tag"><c:out value="${row.age}" /> </span>
					</div>
					<div class="card-details">
						<h2>
							<c:out value="${row.name}" />
						</h2>
						<h3>
							<c:out value="${row.email}" />
						</h3>
						<p>
							<c:out value="${row.description}" />
							insta id is ..
							<c:out value="${row.insta_id}" />
						</p>
						<div class="post-meta">
							<span class="timestamp"> <i class="fa fa-heart" id="likes"
								onclick="unlikePost(this, '${row.idx}')"></i>
							</span> <span class="comments" onclick="clickInsta('${row.insta_id}')">
								<i class="fa fa-instagram"></i>
							</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 본문영역 끝 -->

	</div>
	<!-- 전체영역 끝 -->
</body>
</html>