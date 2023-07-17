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
   	font-size : 0.8em;

}

</style>
</head>
<body>

	<div class="container align-items-center justify-content-center">
	<div class="row shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div class="col">
		<nav
			class="navbar navbar-dark bg-white d-flex fixed-top  border-bottom fw-bold 
			">
				<div class="col-2 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col-1"></div>
			<div class="col-6" style="text-align: center;">카테고리</div>
			<div class="col-1 ">
				<a class="btn bi bi-search fs-3" role="button"
					href="/welcomepet/board/search"> </a>
			</div>
			<div class="col-2">
				<a class="btn bi bi-cart2 fs-4" role="button"
					href="/welcomepet/customer/cart"> </a>
			</div>

		</nav>
	</div>
</div>

		<div class="row mt-2 border_bottom text-center fw-bold align-items-center" style="font-size: 0.9em;">
			<div class="col-3" onclick="location.href='./categoryProduct?main_category_no=1'">사료</div>
			<div class="col-3" onclick="location.href='./categoryProduct?main_category_no=2'">간식</div>
			<div class="col-3" onclick="location.href='./categoryProduct?main_category_no=3'">용품</div>
			<div class="col-3" onclick="location.href='./categoryProduct?main_category_no=4'">스타일</div>
		</div>
		<div class="row subcate mt-2 align-items-center text-center" style="overflow-x: auto; white-space: nowrap;">
		  <div class="col-3 pe-0 text-secondary"  onclick="location.href='./categoryProduct?main_category_no=${mainCateNo}'">
		    전체
		  </div>
		  <c:forEach items="${categoryInfo}" var="map">
		    <div class="col-3 ps-0 py-2 text-secondary" onclick="location.href='./categoryProduct?main_category_no=${map.categoryDto.main_category_no}&sub_category_no=${map.categoryDto.sub_category_no }'">
		      ${map.categoryDto.sub_category_name}
		    </div>
		  </c:forEach>
		</div>
		<div class="row mt-3 text-secondary" style="font-size: 0.8em;">
		<div class="col ">
			${mainCategoryName} > ${subCategoryName} </div>	
		</div>
		<div class="row mt-2 text-secondary" style="font-size: 0.8em;">
		<div class="col"> 
			${productCount}개의 상품 </div>
		</div>
		<div class="row mt-2 ps-1">
			<c:forEach items="${productInfo}" var="map">
				<div
					class="col-6  py-2 embed-responsive embed-responsive-4by3"
					onclick="location.href='./productDetail?product_no=${map.productInfo.product_no}'">
					<div class="row">
					<div class="col">
						<img
							src="/uploadFiles/WelcomePet/${map.productInfo.product_thumbnail}"
							class="embed-responsive-item product-thum rounded-2" alt="..."> </div>
					</div>
					<div class="row"> 
					<div class="col" style="font-size: 0.9em;">${map.productInfo.product_name}</div> 
					</div> 
					<c:choose>
					 <c:when test="${map.productInfo.product_discount_rate != 0}">
					<div class="row"> 
					<div class="col  text-secondary" style="font-size: 0.8em;"><del>${map.productInfo.product_price}원</del></div> 
					</div> 
					<div class="row"> 
					<div class="col-3 pe-0 text-danger fw-bold">
					${map.productInfo.product_discount_rate}%
					</div>
					<div class="col fw-bold text-start">
					${map.productInfo.product_price - map.salePrice}원</div> 
					</div> 
					</c:when>
					<c:otherwise>
					<div class="row">
					<div class="col fw-bold">
					${map.productInfo.product_price}원</div> 					
					</div>
					</c:otherwise>
					</c:choose>
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