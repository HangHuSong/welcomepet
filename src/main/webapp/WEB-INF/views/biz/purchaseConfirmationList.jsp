<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style type="text/css">
.container {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
	<div class="container" style="margin: 0 0;">
		<div class="row" style="width: 1900px;">
			<div class="col-2 text-center ps-4 text-white"
				style="height: auto; background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 px-0 bg-light">
				<div class="row bg-white ms-1">
					<div class="col text-center"><jsp:include
							page="../common/bizTopNavi.jsp"></jsp:include></div>
				</div>
				<div class="row px-5 text-center mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">구매확정내역</div>
						</div>
						<div class="row my-2 text-start">
							<div class="col border rounded-3 shadow"
								style="background-color: rgb(255, 255, 250);">
								<div class="row py-2 px-2">
									<div class="col align-self-center">
										<i class="fas fa-exclamation-circle"></i> 도움말
									</div>
								</div>
								<div class="row pb-2 px-2">
									<div class="col" style="font-size: 12px;">-구매확정된 상품은 다음달에
										정산됩니다.</div>
								</div>
							</div>
						</div>
						<div class="row mt-2 mb-5">
							<div class="col">
								<div class="row mt-2 mb-5">
									<div class="col border bg-white rounded-3 shadow">
										<div class="row">
											<div class="col">
												<div class="row">
													<div class="col-2 text-start align-self-center px-4">기간</div>
													<div class="col text-start align-self-center">
														<input class="text-center rounded-1" type="date"
															style="width: 200px; border: 1px solid rgb(174, 180, 198);">
														~ <input class="text-center rounded-1" type="date"
															style="width: 200px; border: 1px solid rgb(174, 180, 198);">
													</div>
													<div class="col-2 px-5 d-grid py-2 border-start"
														style="background-color: rgb(245, 250, 255);">
														<button class="btn btn-primary rounded-5">검색</button>
													</div>
												</div>
												<div class="row">
													<div class="col-2 text-start align-self-center px-4"
														style="height: auto;">검색어</div>
													<div class="col text-start align-self-center">
														<span> <select class="rounded-1"
															style="border: 1px solid rgb(174, 180, 198);">
																<option selected>검색항목 선택</option>
																<option value="1">주문번호</option>
																<option value="2">상품명</option>
																<option value="3">주문자명</option>
														</select>
														</span> <span><input class="rounded-1" type="text"
															style="width: 423px; border: 1px solid rgb(174, 180, 198);"></span>

													</div>
													<div class="col-2 px-5 d-grid py-2 border-start"
														style="background-color: rgb(245, 250, 255);">
														<button class="btn btn-secondary rounded-5">초기화</button>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row my-2 bg-white">
							<div class="col border px-0 shadow">
								<div class="row text-start py-2 border-bottom mx-0">
									<div class="col">
										<select class="border-secondary border-opacity-50 rounded-2">
											<option selected>주문일 역순</option>
										</select> <select class="border-secondary border-opacity-50 rounded-2">
											<option selected>20개씩 보기</option>
										</select>
									</div>
								</div>
								<div class="row" id="orderList">
									<div class="col">
										<div class="table-responsive" style="max-height: 450px; font-size: 13px;">
											<table class="table text-nowrap">
												<thead style="background-color: rgb(245, 250, 255);">
													<tr>
														<th scope="col">상품주문번호</th>
														<th scope="col">주문번호</th>
														<th scope="col">구매자명</th>
														<th scope="col">구매자연락처</th>
														<th scope="col">수취인명</th>
														<th scope="col">수취인연락처</th>
														<th scope="col">배송지</th>
														<th scope="col">배송메세지</th>
														<th scope="col">주문일</th>
														<th scope="col">상품번호</th>
														<th scope="col">상품명</th>
														<th scope="col">주문수량</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${orderList }" var="order">
														<tr>
															<td>${order.orderProductDto.order_product_no }</td>
															<td>${order.ordersDto.orders_no }</td>
															<td>${order.customerDto.customer_name }</td>
															<td>${order.customerDto.customer_phone }</td>
															<td>${order.ordersDto.orders_receiver_name }</td>
															<td>${order.ordersDto.orders_address_phone }</td>
															<td>${order.ordersDto.orders_address }&nbsp;${order.orders_detail_address }</td>
															<td>${order.ordersDto.orders_shipping_message }</td>
															<td><fmt:formatDate
																	value="${order.ordersDto.orders_date }"
																	pattern="yyyy.MM.dd" /></td>
															<td>${order.productOptionDto.product_option_no}</td>
															<td>${order.productOptionDto.product_option_name}</td>
															<td>${order.orderProductDto.order_product_quantity }</td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row ms-1">
					<div class="col">
						<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
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