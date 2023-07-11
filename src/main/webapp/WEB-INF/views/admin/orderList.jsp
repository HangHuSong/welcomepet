<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BackOffice</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
.sidebar {
	height: 100vh;
	background-color: #f8f9fa;
	padding-top: 20px;
}
</style>
</head>

<body>
	<div class="container">
		<%@ include file="../common/adminHead.jsp" %>
		<div class="row">
			<%@ include file="../common/adminTab.jsp" %>
			<div class="col-1"></div>
			<div class="col-9">
				<div class="container">
					<div class="row mt-5">
						<div class="col">
							<h3>주문관리</h3>
							<pre>
							
							</pre>
							<table class="table table-bordered">
								<tr>
									<td>주문번호</td>
									<td>주문상태</td>
									<td>주문일자</td>
									<td>고객</td>
									<td>판매자</td>
									<td>상품번호</td>
									<td>상품명</td>
									<td>주문수량</td>
									<td>주문가격</td>
								</tr>
								<c:forEach items="${orders}" var="o">
								<tr>
									<td>${o.ordersDto.orders_no }</td>
									<td>${o.orderProductStatusDto.order_product_status_name }</td>
									<td><fmt:formatDate value="${o.ordersDto.orders_date}" pattern="yy.MM.dd-HH.mm.ss"/></td>
									<td>${o.customerDto.customer_nickname}</td>
									<td>${o.bizDto.biz_store_name }</td>
									<td>${o.productOptionDto.product_option_no }</td>
									<td>${o.productOptionDto.product_option_name}</td>
									<td>${o.orderProductDto.order_product_quantity}</td>
									<td>${o.orderProductDto.order_product_price}</td>
								</tr>
								</c:forEach>
							</table>
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