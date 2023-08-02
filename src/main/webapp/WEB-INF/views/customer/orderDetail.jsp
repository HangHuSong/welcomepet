<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>주문상세</title>
<style type="text/css">
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}

.product-thum {
	width: 100%;
	border: 1px solid rgba(0, 0, 0, 0.03);
	border-radius: 1rem;
}

.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}
</style>
</head>
<body>

	<div class="container align-items-center justify-content-center pe-0">

		<div class="row  mt-2 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;">주문 상세</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>



		<div class="row mt-3 embed-responsive embed-responsive-4by3">
			<div class="row mt-3 pe-0">
				<div class="col fw-bold">
					<fmt:formatDate value="${ordersDto.orders_date}"
						pattern="yyyy.MM.dd" />
					주문
				</div>

				<c:forEach var="orderProduct" items="${orderList}">
					<div class="row mt-2 " style="font-size: 0.8em;">
						<div class="col-1"></div>
						<div class="col border">
							<div class="row">
								<div class="col">
									${orderProduct.orderProductDto.order_product_status_name}</div>
							</div>
							<div class="row mt-2">
								<div class="col-4 pe-0">
									<img
										src="/uploadFiles/WelcomePet/${orderProduct.productDto.product_thumbnail}"
										class="embed-responsive-item product-thum" alt="...">
								</div>
								<div class="col">
									<div class="row">
										<div class="col fw-bold">
											${orderProduct.productDto.product_name}</div>
									</div>
									<div class="row">
										<div class="col">${orderProduct.productOptionDto.product_option_name}
											| ${orderProduct.orderProductDto.order_product_quantity}개</div>
									</div>
									<div class="row">

										<div class="col fw-bold">
											<fmt:formatNumber
												value="${orderProduct.orderProductDto.order_product_price}"
												pattern="###,###원" />
											
										</div>
									</div>

								</div>
							</div>
							<div class="row mt-2"></div>

						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row mt-3"></div>

		<div class="row mt-2 empty"></div>
		<div class="row" >
			<div class="accordion accordion-flush" id="accordionFlushExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed " type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
							aria-expanded="true" aria-controls="flush-collapseOne">
							<strong>배송지 정보 </strong>
						</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse show"
						aria-labelledby="flush-headingOne"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body" style="font-size: 0.8em;">
							<div class="row mt-3">
								<div class="col-3">받는사람</div>
								<div class="col text-end">${ordersDto.orders_receiver_name}</div>
							</div>
							<div class="row ">
								<div class="col-3">연락처</div>
								<div class="col text-end">${ordersDto.orders_address_phone}</div>
							</div>
							<div class="row ">
								<div class="col-3">주소</div>
								<div class="col text-end">${ordersDto.orders_address}
									${ordersDto.orders_detail_address}</div>
							</div>
							<div class="row ">
								<div class="col-4">배송요청사항</div>
								<div class="col text-end">${ordersDto.orders_shipping_message}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row mt-2 empty"></div>
		<div class="row">
			<div class="accordion accordion-flush" id="accordionFlushExample2">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne2">
						<button class="accordion-button collapsed " type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne2"
							aria-expanded="true" aria-controls="flush-collapseOne2">
							<div class="col fw-bold">할인 정보</div>
							<div class="col text-end text-primary">-${totals.totalSalePrice + totals.totalUsedPoint}원</div>
						</button>
					</h2>
					<div id="flush-collapseOne2" class="accordion-collapse collapse"
						aria-labelledby="flush-headingOne2"
						data-bs-parent="#accordionFlushExample2">
						<div class="accordion-body" style="font-size: 0.9em;">

							<div class="row mt-3">
								<div class="col-3">상품할인</div>
								<div class="col text-end text-primary">-${totals.totalSalePrice}원</div>
							</div>
							<div class="row ">
								<div class="col-3">쿠폰할인</div>
								<div class="col text-end text-primary">-${totals.totalUsedPoint}원</div>
							</div>
							<div class="row ">
								<div class="col-4">적립금 할인</div>
								<div class="col text-end text-primary">
									-${totals.totalUsedPoint}원</div>
							</div>
							<div class="row ">
								<div class="col-3">최종금액</div>
								<div class="col text-end text-primary">-${totals.totalSalePrice + totals.totalUsedPoint}원</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-2 empty"></div>
		<div class="row">
			<div class="accordion accordion-flush" id="accordionFlushExample3">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne3">
						<button class="accordion-button collapsed " type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne3"
							aria-expanded="true" aria-controls="flush-collapseOne3">
							<div class="col fw-bold">최종 결제 정보</div>
							<div class="col text-end  fw-bold">${totals.totalPrice - (totals.totalSalePrice + totals.totalUsedPoint) + totals.highestDeliveryFee}원</div>
						</button>
					</h2>
					<div id="flush-collapseOne3" class="accordion-collapse show"
						aria-labelledby="flush-headingOne3"
						data-bs-parent="#accordionFlushExample3">
						<div class="accordion-body" style="font-size: 0.9em;">

							<div class="row mt-3">
								<div class="col-4">상품 합계</div>
								<div class="col text-end ">-${totals.totalPrice}원</div>
							</div>
							<div class="row ">
								<div class="col-4">할인 합계</div>
								<div class="col text-end text-primary">
									<span class="text-danger">${totals.saleRate}% SAVE </span>
									-${totals.totalSalePrice + totals.totalUsedPoint}원
								</div>
							</div>
							<div class="row ">
								<div class="col-4">배송비</div>
								<div class="col text-end ">${totals.highestDeliveryFee}원</div>
							</div>
							<div class="row ">
								<div class="col-4">결제 금액</div>
								<div class="col text-end fw-bold">${totals.totalPrice - (totals.totalSalePrice + totals.totalUsedPoint) + totals.highestDeliveryFee}원</div>
							</div>
							<div class="row mt-2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3"></div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
