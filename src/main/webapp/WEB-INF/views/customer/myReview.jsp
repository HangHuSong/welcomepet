<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>작성한 리뷰</title>


<style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}

.product-thum {
	height: 4em;
}
</style>
</head>
<body>

	<div class="container align-items-center justify-content-center">

		<div class="row  mt-2 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;">작성한 리뷰</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>
		<div class="row mt-2 ">
			<div class="col-1"></div>
			<div class="col-7 fw-bold">작성한 리뷰</div>
			<div class="col "></div>
			<div class="row mt-2 border-bottom"></div>
		</div>
	
		<c:forEach items="${data}" var="map">
			<div
				class="row mt-3 border-bottom embed-responsive embed-responsive-4by3">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-3">
						<img
							src="/uploadFiles/WelcomePet/${map.productDto.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="...">
					</div>
					<div class="col-6">
						<div class="row mt-1">
							<div class="col">${map.productOptionDto.product_option_name}</div>
						</div>					
					</div>

					<div class="col-2"></div>
				</div>

				<div class="row mt-2 border-top"></div>
				
				<div class="row mt-2">
				 	<div class="col">
					별점 : ${map.productReviewDto.product_review_rating} </div>
				</div>
				<div class="row mt-2">
				 	<div class="col">
					 ${map.productReviewDto.product_review_context} </div>
				</div>
				<div class="row mt-2">
				<c:forEach items="${map.reviewImgList }" var="reviewImg">
					<div class="col">
					<img src="/uploadFiles/WelcomePet/${reviewImg.product_review_images_link}"
							class="embed-responsive-item product-thum" alt="..."> </div>
				</c:forEach>
				</div>				
			</div>
		</c:forEach>
	


	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
