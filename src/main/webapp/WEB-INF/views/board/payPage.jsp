<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
<script type="text/javascript">
	function approvePay() {

		var pg_token = "${pgToken}"
		var partner_order_id = "1";
		var partner_user_id = "${sessionUser.customer_name}";
		var tid = sessionStorage.getItem('tid');
		sessionStorage.removeItem('tid');

		var payApproval = "cid=TC0ONETIME&tid=" + tid + "&pg_token=" + pg_token
				+ "&partner_order_id=" + partner_order_id + "&partner_user_id="
				+ partner_user_id;

		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				console.log(response);

			}
		}

		xhr.open("post", "https://kapi.kakao.com/v1/payment/approve");
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.setRequestHeader("Authorization",
				"KakaoAK 87f9df6baf803baebce7425e8dfff0a7");
		xhr.send(payApproval);

	}
</script>
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
	height: 6em;
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
					onclick="location.href='./main'"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;">결제 완료</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>



		<div class="row mt-3 embed-responsive embed-responsive-4by3">
			<div class="row mt-3 " style="align-items: center;">
				<div class="col ms-2 fw-bold text-secondary">

					${fn:length(orderList)}개 상품이 주문완료되었습니다!</div>
					<div class="col-3 text-end text-primary" style="font-size: 0.7em;">
					 <span onclick="location.href='../customer/orderDetail?order_no=${ordersDto.orders_no}'">자세히 보기</span>
					</div>
				<div class="row mt-2 ">

					<div class="col-12 ms-3 border">
						<div class="row mt-2">
							<div class="col fw-bold">결제 정보</div>
						</div>
						<div class="row mt-1 " style="font-size: 0.9em;">
							<div class="col text-secondary">
												<fmt:formatDate value="${ordersDto.orders_date}"
						pattern="yyyy.MM.dd" />
					주문
							</div>
						</div>						
						<div class="row mt-2 text-secondary" style="font-size: 0.9em;">
							<div class="col-4">받는 사람</div>
							<div class="col ">${ordersDto.orders_receiver_name} /
							(${ordersDto.orders_address_phone})</div>
						</div>
						<div class="row text-secondary " style="font-size: 0.9em;">
							<div class="col-4">받는 주소</div>
							<div class="col ">
									${ordersDto.orders_address} ${ordersDto.orders_detail_address}
							</div>
						</div>

						<div class="row mt-3  border-top"></div>
						<div class="row mt-3">
							<div class="col-4">총 결제 금액</div>
							<div class="col text-end text-danger fw-bold">
								<span class="text-secondary me-1" style="font-size: 0.7em;">
									${ordersDto.orders_payment_method} </span>
								<fmt:formatNumber
									value="${totals.totalPrice - (totals.totalSalePrice + totals.totalUsedPoint) + totals.highestDeliveryFee}"
									pattern="###,###원" />
							</div>
						</div>
						<div class="row mt-3"></div>
					</div>
				</div>
			</div>
			<div class="row mt-2"></div>
		</div>
		<div class="row mt-2 empty"></div>
		<div class="row mt-2">
			<div class="accordion accordion-flush" id="accordionFlushExample3">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne3">
						<button class="accordion-button collapsed " type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne3"
							aria-expanded="true" aria-controls="flush-collapseOne3">
							<div class="col text-secondary fw-bold" style="font-size: 0.9em;">주문 상품 정보 (
							<span class="text-primary">${fn:length(orderList)}</span> )</div>
							
						</button>
					</h2>
					<div id="flush-collapseOne3" class="accordion-collapse collapse"
						aria-labelledby="flush-headingOne3"
						data-bs-parent="#accordionFlushExample3">
						<div class="accordion-body" style="font-size: 0.9em;">
							<c:forEach var="orderProduct" items="${orderList}">
								<div class="row mt-2 " style="font-size: 0.8em;">

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
				</div>
			</div>
		</div>


		<div class="row mt-3"></div>
		<jsp:include page="../common/serviceNavi.jsp"></jsp:include>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
