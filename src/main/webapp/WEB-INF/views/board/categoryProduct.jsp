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
	<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"
/>
<title>카테고리 상품</title>


<style type="text/css">
.product-thum {
	height: 10em;
}
.subcate {
    background-color: rgb(244, 247, 250);
   	font-size : 0.8em;

}

.swiper-container {
  width: 100%;
  height: 100%;
  overflow: hidden;
   position: relative;
}
.swiper-slide {
  width: 28%;
}

.swiper-pagination-bullet {
  width: 10px;
  height: 10px;
  background-color: #fff;
  opacity: 0.5;
  border-radius: 50%;
  margin: 0 5px;
}

.swiper-pagination-bullet-active {
  opacity: 1;
}

.star-icon {
	display: inline-block;
	width: 1.2em;
	height: 1.2em;
	background-image: url('/uploadFiles/WelcomePet/icons/star-empty.png');
	background-size: cover;
	filter: opacity(0.5);
}

.filled {
	display: inline-block;
	width: 1.2em;
	height: 1.2em;
	background-size: cover;
	background-image: url('/uploadFiles/WelcomePet/icons/star.png');
	filter: none;
	vertical-align: sub;
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
		<div class="row subcate mt-2 align-items-center text-center">
			
			 <div class="swiper-container ps-0">
			 	<div class="swiper-wrapper px-0">
		<div class="col-3 ps-0 py-2 text-secondary swiper-slide"  onclick="location.href='./categoryProduct?main_category_no=${mainCateNo}'">
		    전체
		  </div>
		  <c:forEach items="${categoryInfo}" var="map">
		 

		    <div class="col-3 ps-0 py-2 text-secondary swiper-slide" onclick="location.href='./categoryProduct?main_category_no=${map.categoryDto.main_category_no}&sub_category_no=${map.categoryDto.sub_category_no }'">
		      ${map.categoryDto.sub_category_name}
		    </div>
		  </c:forEach>
		  </div>
		    </div>
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
					<div class="col pe-0  fw-bold ">
					<span class="text-danger pe-2">
					${map.productInfo.product_discount_rate}% </span>
					<span>
					${map.productInfo.product_price - map.salePrice}원
					</span>
					</div>
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

	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	
		<script >
		const swiper = new Swiper(".swiper-container", {
		    slidesPerView: "auto",
		    spaceBetween: 5,
		    loop: false,
		    navigation: {
		      nextEl: ".swiper-button-next",
		      prevEl: ".swiper-button-prev",
		    },
		    pagination: {
		      el: ".swiper-pagination",
		      clickable: true,
		    },
		  });
		</script>
			<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
</body>
</html>