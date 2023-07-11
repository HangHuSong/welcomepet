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
<title>카테고리 상품</title>
<style type="text/css">
.product-thum {
	height: 10em;
}
.subcate {
    background-color: rgb(244, 247, 250);
   	font-size : small;
}

</style>
</head>
<body>

	<div class="container align-items-center justify-content-center">
		<div class="row  mt-2 align-items-center">
			<div class="col-2 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col " style="text-align: center;">
				<form action="./searchProduct" class="d-flex" role="search">
					<input class="form-control me-2 fw-bold" type="search"
						placeholder="${searchWord}" name="searchWord" aria-label="Search">
				</form>
			</div>
			<div class="col-1 text-center">
				<a class="btn bi bi-house fs-3" role="button"
					href="/welcomepet/board/main"> </a>
			</div>
			<div class="col-2">
				<a class="btn bi bi-cart2 fs-4" role="button"
					href="/welcomepet/customer/cart"> </a>
			</div>
		</div>
		<div class="row mt-1">
		<div class="col"> 
			검색결과 ${productCount}개의 상품 </div>
		</div>
		<div class="row mt-2">
			<c:forEach items="${productInfo}" var="map">
				<div
					class="col-6 mt-3 border-bottom embed-responsive embed-responsive-4by3">
					<div class="row">
					<div class="col">
						<img
							src="/uploadFiles/WelcomePet/${map.productInfo.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="..."> </div>
					</div>
					<div class="row"> 
					<div class="col">${map.productInfo.product_name}</div> 
					</div> 
					<div class="row"> 
					<div class="col"><del>${map.productInfo.product_price}</del></div> 
					</div> 
					<div class="row"> 
					<div class="col-2 text-danger fw-bold">
					${map.productInfo.product_discount_rate}%
					</div>
					<div class="col fw-bold">
					${map.productInfo.product_price - map.salePrice}원</div> 
					</div> 
				</div>
			</c:forEach>
		</div>
	</div>
			<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
</body>
</html>