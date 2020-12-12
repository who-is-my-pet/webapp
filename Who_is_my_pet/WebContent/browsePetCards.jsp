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
<title>Information Card Slider</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var getProductHeight = $('.product.active').height();

						$('.products').css({
							height : getProductHeight
						});

						function calcProductHeight() {
							getProductHeight = $('.product.active').height();

							$('.products').css({
								height : getProductHeight
							});
						}

						function animateContentColor() {
							var getProductColor = $('.product.active').attr(
									'product-color');

							$('body').css({
								background : getProductColor
							});

							$('.title').css({
								color : getProductColor
							});

							$('.btn').css({
								color : getProductColor
							});
						}

						var productItem = $('.product'), productCurrentItem = productItem
								.filter('.active');

						$('#next').on(
								'click',
								function(e) {
									e.preventDefault();

									var nextItem = productCurrentItem.next();

									productCurrentItem.removeClass('active');

									if (nextItem.length) {

										productCurrentItem = nextItem
												.addClass('active');
									} else {
										productCurrentItem = productItem
												.first().addClass('active');
									}

									calcProductHeight();
									animateContentColor();
								});

						$('#prev').on(
								'click',
								function(e) {
									e.preventDefault();

									var prevItem = productCurrentItem.prev();

									productCurrentItem.removeClass('active');

									if (prevItem.length) {
										productCurrentItem = prevItem
												.addClass('active');
									} else {
										productCurrentItem = productItem.last()
												.addClass('active');
									}

									calcProductHeight();
									animateContentColor();
								});

						// Ripple
						$('[ripple]')
								.on(
										'click',
										function(e) {
											var rippleDiv = $('<div class="ripple" />'), rippleSize = 60, rippleOffset = $(
													this).offset(), rippleY = e.pageY
													- rippleOffset.top, rippleX = e.pageX
													- rippleOffset.left, ripple = $('.ripple');

											rippleDiv
													.css(
															{
																top : rippleY
																		- (rippleSize / 2),
																left : rippleX
																		- (rippleSize / 2),
																background : $(
																		this)
																		.attr(
																				"ripple-color")
															})
													.appendTo($(this));

											window.setTimeout(function() {
												rippleDiv.remove();
											}, 1900);
										});
					});
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons'>

<link rel="stylesheet" href="css/BrowsePetCards.css">


</head>

<body>
	<div class="card">
		<div class="products">
			<%!int cnt = 0;%>
			<c:forEach var="row" items="${requestScope.animal_list}">
				<c:choose>
					<c:when test="${row.idx eq 1}">
						<div class="product active" product-id="1" product-color="#D18B49">
					</c:when>
					<c:otherwise>
						<div class="product" product-id="${row.idx}"
							product-color="#542F13">
							<%-- <div class="product" product-id="${row.idx}" product-color="${row.color}"> --%>
					</c:otherwise>
				</c:choose>
				<div class="thumbnail">
					<img src="${row.img}" />
				</div>
				<h1 class="title">
					<c:out value="${row.name}" />
				</h1>
				<p class="description">
					🧑 닮은 연예인:
					<c:out value="${row.celebs}" />
					👩<br />
					<br />
					<c:out value="${row.description}" />
				</p>
		</div>
		</c:forEach>
	</div>
	<div class="footer">
		<a class="btn" id="prev" href="#" ripple="" ripple-color="#666666">Prev</a><a
			class="btn" id="next" href="#" ripple="" ripple-color="#666666">Next</a>
	</div>
	</div>
</body>
</html>
