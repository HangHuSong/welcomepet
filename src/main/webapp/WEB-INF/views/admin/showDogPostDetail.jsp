<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BackOffice</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
</style>
</head>

<body>
	<div class="container">
		<%@ include file="../common/adminHead.jsp" %>
		<div class="row">
			<%@ include file="../common/adminTab.jsp" %>
			<div class="col-1"></div>
			<div class="col-9">
				<div class="row mt-5">
					<div class="col-6">
						<h3 class="fw-bold">${map.showDogPostDto.show_dog_post_title }</h3>
					</div>
					<div class="col text-end">
						작성자 : ${map.customerDto.customer_nickname } 
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-8">
						<p class="fs-4">${map.showDogPostDto.show_dog_post_content}</p>
					</div>
					<div class="col text-end">
						작성일 : <fmt:formatDate value="${map.showDogPostDto.show_dog_post_reg_date}" pattern="MM.dd HH:mm:SS"/>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
					전체 댓글(${map.countComments})
					<hr>
					</div>
				</div>
				<div class="row mt-1">
					<c:forEach items="${list}" var="c">
						<div class="col-2">
							${c.customerDto.customer_nickname}
						</div>
						<div class="col-7">
							<p class="text-break">${c.showDogCommentDto.show_dog_comment_content}</p>
						</div>
						<div class="col-2">
							<fmt:formatDate value="${c.showDogCommentDto.show_dog_comment_reg_date}" pattern="MM.dd HH:mm:SS"/>
						</div>
						<div class="col">
							<i class="bi bi-x-circle text-danger"></i>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>