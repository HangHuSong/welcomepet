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
<title>장바구니1</title>
<style type="text/css">
.product-thum {
	height: 5em;
}
.small-font {
	font-size: 0.9em;
	color: gray;
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
			<div class="col fw-bold" style="text-align: center;">장바구니</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>
		<div class="row mt-2 ">
			<div class="col-1"></div>
			<div class="col-7 fw-bold">상품</div>
			<div class="col "></div>
			<div class="row mt-2 border-bottom"></div>
		</div>
		<c:set var="totalPrice" value="0" />
		<c:set var="salePrice" value="0" />

		<c:forEach items="${cartInfo}" var="map">
		  <input type="hidden" value="${map.productOptionInfo.product_option_no}"> 
			<div
				class="row mt-3 border-bottom embed-responsive embed-responsive-1by1">
				<div class="row">
				<div class="col-1">
				 <input type="checkbox" class="form-check-input" name="selectedItems" value="${map.productOptionInfo.product_option_no}:${map.cartInfo.product_amount}" onclick="updateSelectedOptions(this)">
				</div>
					<div class="col-3">
						<img
							src="/uploadFiles/WelcomePet/${map.productInfo.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="...">
					</div>
					<div class="col">
						<div class="row mt-1 align-items-start">
							<div class="col fw-bold" style="font-size: 0.9em;">${map.productInfo.product_name}</div>
							<div class="col-1 text-end">
							  <i class="bi bi-x fs-3 py-0 text-secondary" onclick="location.href='./deleteCart?cart_no=${map.cartInfo.cart_no}'"
							 	style="position: relative; top: -5px; left: -5px;"></i>
							  </div>
						</div>					
						<div class="row mt-1">
							<div class="col">
							<span class="text-secondary" id=""><del>${(map.productOptionInfo.product_option_price) * map.cartInfo.product_amount}원</del></span>
								<span class="fw-bold ps-1" id="">${(map.productInfo.product_price - map.salePrice) * map.cartInfo.product_amount}원</span>
								</div>
						</div>
						<c:set var="totalPrice"
							value="${totalPrice + (map.productInfo.product_price * map.cartInfo.product_amount)}" />
						<c:set var="salePrice" value="${salePrice + (map.salePrice)}" />
					</div>
					<div class="col-1">

					</div>
				</div>
				 <div class="row mt-3">
				 <div class="col-1"></div>
				<div class="col ps-2 ms-2 border rounded-2 d-flex align-items-center" 
						style="background-color: rgb(244, 247, 250); height: 4em; font-size: 0.9em;">
						<span class="ps-2">${map.productOptionInfo.product_option_name}</span>
					</div>
				<div class="col-1"></div>
				 </div>
				<div class="row mt-2">
					<div class="col"> </div>
					<div class="col">
						<button type="button" class="btn btn-outline-secondary" 
						style="width: 5em; height: 2.3em; "
						>  <span   style="font-size: 0.8em; color: black; font-weight: 500;">옵션변경 </span></button>
					 </div>
					<div class="col ">
						<div class="btn-group btn-sm " role="group"
							aria-label="Basic outlined example" style="width: 4.5em; height: 2.3em; ">
							<button type="button" class="btn btn-outline-secondary fw-bold" style="font-size: 1.2em;">-</button>
							<button type="button" class="btn btn-outline-secondary">${map.cartInfo.product_amount}</button>
							<button type="button" class="btn btn-outline-secondary fw-bold" style="font-size: 1.2em;">+</button>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
				<div class="row mt-2"></div>
			</div>
		</c:forEach>

		<div class="row mt-3 ">
			<div class="col">
				<div class="row ">
					<div class="row">
						<div class="col">총 상품 금액</div>
						<div class="col text-end">
							<del> ${totalPrice}원 </del>
						</div>
					</div>
					<div class="row">
						<div class="col">할인 금액</div>
						<div class="col text-end">${salePrice}원</div>
						
					</div>
					<div class="row mt-2 border-top fw-bold ">
						<div class="col">총 결제 금액</div>
						<div class="col text-end">${totalPrice - salePrice}원</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<jsp:include page="../common/serviceNavi.jsp"></jsp:include>
			<div class="row mb-4">
				<div class="col">
					<div class="navbar navbar-dark bg-white fixed-bottom border-top">

						<div class="col ">
							<div class="row">
							<div class="col-1"></div>
								<div class="col">
									<div class="d-grid gap-2">
										<button class="btn btn-primary btn-lg" type="button">
										<div class="row fs-5">
										<div class="col text-center"> ${totalPrice - salePrice}원 결제하기 </div>
										</div>
										</button>
									</div>
								</div>
								<div class="col-1"></div>
							</div>
						</div>
					</div>
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
