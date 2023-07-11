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
<title>결제</title>
<style type="text/css">
.product-thum {
	height: 5em;
}

.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}
</style>
</head>
<body>
	<form action="./orders" method="post">
		<input type="hidden" name="customer_no"
			value="${sessionUser.customer_no}">

		<div class="container align-items-center justify-content-center">

			<div class="row  mt-2 align-items-center">
				<div class="col-1 d-flex ">
					<a class="btn bi bi-arrow-left fs-4" role="button"
						onclick="history.back()"> </a>
				</div>
				<div class="col fw-bold" style="text-align: center;">결제</div>
				<div class="col-1"></div>
			</div>

			<div class="row mt-2 border-bottom "></div>
			<div class="row mt-2 ">
				<div class="col-7 fw-bold">주문상품</div>
				<div class="col "></div>
				<div class="row mt-2 "></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 border rounded-2">
					<div class="row mt-2 ">
						<div class="col-4 embed-responsive embed-responsive-4by3">
							<img
								src="/uploadFiles/WelcomePet/${data.productInfo.product_thumbnail}"
								class="embed-responsive-item product-thum" alt="...">
						</div>
						<div class="col">
							<div class="row mt-1 fw-bold">
								<input type="hidden" name="product_option_no"
									value="${data.optionInfo.product_option_no}">

								<div class="col">${data.optionInfo.product_option_name}</div>
							</div>
							<div class="row mt-2">
								<div class="col">${data.productInfo.product_description}</div>
							</div>
							<div class="row mt-2">
								<div class="col fw-bold">${data.optionInfo.product_option_price - data.salePrice}원</div>
								<input type="hidden" name="order_product_price"
									value="${data.optionInfo.product_option_price - data.salePrice}">
								<div class="col">/ ${product_amount}개</div>
								<input type="hidden" name="order_product_quantity"
									value="${product_amount}">
							</div>
						</div>
					</div>
					<div class="row mt-3 border-top"></div>
					<div class="row mt-3 ">
						<div class="col-6">총 상품 금액</div>
						<div class="col text-end text-primary fw-bold">
							${(data.optionInfo.product_option_price - data.salePrice) * product_amount}원
						</div>
					</div>
					<div class="row ">
						<div class="col-6">배송비</div>
						<div class="col text-end">
							+${data.productInfo.product_shipping_price}원</div>
					</div>
					<div class="row mt-2"></div>


				</div>
			</div>

			<div class="row mt-2 empty"></div>

			<div class="row">
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed " type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
								<strong>주문자 정보 </strong>
							</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<div class="row">
									<div class="col">${sessionUser.customer_name}
										(${sessionUser.customer_phone})</div>
								</div>
								<div class="row">
									<div class="col">${sessionUser.customer_id}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-2 empty"></div>
			<div class="row mt-2">
				<div class="col-1"></div>
				<div class="col">
					<div class="row">
						<div class="col">
							<strong class="me-3">배송지 정보 </strong>
							<button class=" btn btn-outline-secondary btn-sm" type="button">
								변경</button>
						</div>
					</div>
					<div class="row mt-3 text-secondary" style="font-size: 0.9em;">
						<div class="col">${mainAddress.customer_address_name }</div>
						<input type="hidden" name="orders_address_name"
							value="${mainAddress.customer_address_name }">
					</div>
					<div class="row text-secondary" style="font-size: 0.9em;">
						<div class="col">${mainAddress.customer_address_receiver}
							(${mainAddress.customer_address_phone })</div>
							
						<input type="hidden" name="orders_receiver_name"
							value="${mainAddress.customer_address_receiver }"> 
							
						<input type="hidden" name="orders_address_phone"
							value="${mainAddress.customer_address_phone }">
					</div>
					<div class="row text-secondary" style="font-size: 0.9em;">
						<div class="col">${mainAddress.customer_address_main }
							(${mainAddress.customer_address_detail })</div>
						<input type="hidden" name="orders_address"
							value="${mainAddress.customer_address_main }"> <input
							type="hidden" name="orders_detail_address"
							value="${mainAddress.customer_address_detail }">
					</div>
					<div class="row mt-2">
						<div class="col">
							<input class="form-control" type="text"
								name="orders_shipping_message" placeholder="배송 요청사항">
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>

			<div class="row mt-2 empty"></div>

			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					<div class="row mt-2">

						<div class="col">
							<strong>주문 쿠폰/ 적립금</strong>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<input class="form-control" type="number" value="0" readonly>
						</div>
						<div class="col">
							<button type="button" class="btn btn-primary btn">쿠폰 조회</button>
						</div>
					</div>
					<div class="row">
						<div class="col">
							사용가능 <span class="text-primary">0장</span>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<input class="form-control" type="number"
								name="order_product_used_point" value="0"
								>
						</div>
						<div class="col">
							<button type="button" class="btn btn-primary btn">모두 사용</button>
						</div>
					</div>
					<div class="row">
						<div class="col">
							보유적립금 <span class="text-primary">${sessionUser.customer_point }원</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-2 empty"></div>

			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col">
							<strong>결제 수단</strong>
						</div>
					</div>
					<div class="row">
						<div class="col">결제수단 리스트들</div>
						<input type="hidden" name="orders_payment_method" value="신용카드">
					</div>
				</div>
				<div class="col-1"></div>
			</div>

			<div class="row mt-2 empty"></div>
			<div class="row ">
				<div class="col">
					<div class="row mt-2">
						<div class="col">
							<strong>결제 정보</strong>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-2 border-top">
				<div class="row mt-2">
					<div class="col">총 상품 금액</div>
					<div class="col text-end">
						${(data.optionInfo.product_option_price - data.salePrice) * product_amount}원

					</div>
				</div>
				<div class="row mt-2">
					<div class="col-1"></div>
					<div class="col text-secondary" style="font-size: 0.9em;">상품
						금액</div>
					<div class="col text-end">
						${(data.optionInfo.product_option_price) * product_amount}원</div>
				</div>
				<div class="row ">
					<div class="col-1"></div>
					<div class="col text-secondary" style="font-size: 0.9em;">상품
						할인</div>
					<div class="col text-end">${(data.salePrice) * product_amount}원</div>
				</div>
				<div class="row mt-2">
					<div class="col">쿠폰 할인</div>
					<div class="col text-end">0원</div>
				</div>
				<div class="row mt-2">
					<div class="col">총 배송비</div>
					<div class="col text-end">
						${data.productInfo.product_shipping_price}원</div>
				</div>
			</div>
		</div>
		<div class="row border-top mt-2"></div>
		<div class="row mt-2 fw-bold" style="font-size: 1.3em;">
			<div class="col-1"></div>
			<div class="col">최종 결제 금액</div>
			<div class="col text-end">
				<input type="hidden" name="orders_total_price"
					value="${(data.optionInfo.product_option_price - data.salePrice) * product_amount - 0 + data.productInfo.product_shipping_price}">
				<strong>${(data.optionInfo.product_option_price - data.salePrice) * product_amount - 0 + data.productInfo.product_shipping_price}원
				</strong>
			</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 empty"></div>

		<div class="row">
			<div class="accordion accordion-flush" id="accordionFlushExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed " type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
							aria-expanded="false" aria-controls="flush-collapseOne">
							<div class="col">
								<strong>적립금 혜택 </strong>
							</div>
							<div class="col text-end">
								<span class="text-end text-primary">
									${((data.optionInfo.product_option_price - data.salePrice) * product_amount - 0)*0.03}원
								</span>
							</div>

						</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse collapse"
						aria-labelledby="flush-headingOne"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<div class="row text-secondary" style="font-size: 0.9em;">
								<div class="col">구매 확정 시 적립</div>
								<div class="col text-end">
									+${((data.optionInfo.product_option_price - data.salePrice) * product_amount - 0)*0.01}원
								</div>
							</div>
							<div class="row text-secondary" style="font-size: 0.9em;">
								<div class="col">리뷰 작성 시 적립</div>
								<div class="col text-end">
									+${((data.optionInfo.product_option_price - data.salePrice) * product_amount - 0)*0.02}원
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-2 empty"></div>



		<div class="row mt-2">
			<div class="col ">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="d-grid gap-2">
							<button class="btn btn-primary btn-lg" type="submit">
								<div class="row fs-5">
									<div class="col text-center">${(data.optionInfo.product_option_price - data.salePrice) * product_amount - 0 + data.productInfo.product_shipping_price}원
										결제하기</div>
								</div>
							</button>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
			</div>

		</div>
	</form>
	<div class="row mt-2"></div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
