<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>찜한상품</title>
<style type="text/css">

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
.empty {
	height: 2.5em;
	background-color: rgb(244, 247, 250);
	align-items: center;
}


.product-thum {
	width: 100%;
	border: 1px solid rgba(0, 0, 0, 0.03);
	border-radius: 1rem;
}

.subcate {
	background-color: rgb(244, 247, 250);
	font-size: small;
}

.fsmid {
	font-size: 0.9em;
	margin-bottom: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 2.4em;
	/* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
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

.cartbtn {
	border: 0.1rem solid rgb(194, 200, 207);
	border-radius: 0.8rem;
	color: rgb(27, 30, 33);
	background-color: rgb(255, 255, 255);
	font-size:  0.8em;
	font-weight: 700;
}

body {
	font-family: 'Pretendard-Regular';
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
			<div class="col fw-bold" style="text-align: center;">찜한상품</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>
		<div class="row mt-2 ">
			<div class="col-1"></div>
			<div class="col-7 fw-bold">상품</div>
			<div class="col "></div>
			<div class="row mt-2 border-bottom"></div>
		</div>
	
		<c:forEach items="${data}" var="map">

					<div class="col-12 mt-3  embed-responsive embed-responsive-4by3">
					<div class="row ps-1 me-1">
						<div class="col-4 pe-0">
							<img
								src="/uploadFiles/WelcomePet/${map.productInfo.product_thumbnail}"
								class="embed-responsive-item product-thum" alt="...">
						</div>

						<div class="col ">
							<div class="row">
								<div class="col fsmid">${map.productInfo.product_name}</div>
							</div>
							<c:choose>
								<c:when test="${map.productInfo.product_discount_rate != 0}">
									<div class="row">
										<div class="col  text-secondary" style="font-size: 0.8em;">
											<del>
												<fmt:formatNumber value="${map.productInfo.product_price}"
													pattern="###,###원" />
											</del>
										</div>
									</div>
									<div class="row">
										<div class="col pe-0  fw-bold ">
											<span class="text-danger pe-1">
												${map.productInfo.product_discount_rate}% </span> <span> 
												<fmt:formatNumber
													value="${map.productInfo.product_price - map.salePrice}"
													pattern="###,###원" />
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
										<c:when
											test="${not empty map.aveRating and not Double.isNaN(map.aveRating)}">
											<span class="">${map.aveRating}</span>
										</c:when>
										<c:otherwise>
											<span class="">0</span>
										</c:otherwise>
									</c:choose>
									<span>(${map.ratingCount})</span>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col">
									<button class="btn cartbtn">장바구니 담기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-3 border-top"></div>
		</c:forEach>
	


	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
