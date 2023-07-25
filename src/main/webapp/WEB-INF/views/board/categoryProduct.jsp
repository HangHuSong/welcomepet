<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body {
	font-family: 'SUITE-Regular';
}
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
.fsmid {
	font-size: 0.9em;
	margin-bottom: 0;
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2; /* 라인수 */
    -webkit-box-orient: vertical;
    word-wrap:break-word; 
    line-height: 1.2em;
    height: 2.4em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
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
			<div class="col" onclick="location.href='./categoryProduct?main_category_no=1'">사료</div>
			<div class="col" onclick="location.href='./categoryProduct?main_category_no=2'">간식</div>
			<div class="col" onclick="location.href='./categoryProduct?main_category_no=3'">용품</div>
			<div class="col" onclick="location.href='./categoryProduct?main_category_no=4'">건강</div>
			<div class="col" onclick="location.href='./categoryProduct?main_category_no=5'">스타일</div>
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
					<div class="row mt-2"> 
					<div class="col fsmid" style="font-size: 0.9em;">${map.productInfo.product_name}</div> 
					</div> 
					<c:choose>
					 <c:when test="${map.productInfo.product_discount_rate != 0}">
					<div class="row"> 
					<div class="col  text-secondary" style="font-size: 0.8em;"><del>
					<fmt:formatNumber value="${map.productInfo.product_price}" pattern="###,###원" /></del></div> 
					</div> 
					<div class="row"> 
					<div class="col pe-0  fw-bold ">
					<span class="text-danger pe-1">
					${map.productInfo.product_discount_rate}% </span>
					<span>
					<fmt:formatNumber value="${map.productInfo.product_price - map.salePrice}" pattern="###,###원" />
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
					<div class="row">
						<div class="col text-secondary" style="font-size: 0.8em;">
							<span class="star-icon filled"></span> 
							<c:choose>
							 	 <c:when test="${not empty map.aveRating and not Double.isNaN(map.aveRating)}">
							 	<span class="">${map.aveRating}</span>
							 	</c:when>
							 	<c:otherwise>
							 	 	<span class="">0</span>
							 	</c:otherwise>
							</c:choose>
							<span>(${map.ratingCount})</span>
						</div>	
					</div>

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