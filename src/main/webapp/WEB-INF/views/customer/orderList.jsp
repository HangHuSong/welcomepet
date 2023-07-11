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
<title>주문목록</title>
<style type="text/css">
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

	<div class="container align-items-center justify-content-center">

		<div class="row  mt-2 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;">주문/배송 조회</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>


		<c:forEach items="${orderList}" var="order">
			<div
				class="row mt-3 embed-responsive embed-responsive-4by3">
				<div class="row mt-3">
					<div class="col fw-bold">
					 <fmt:formatDate value="${order.orderDto.orders_date}" pattern="yyyy.MM.dd" /> 주문</div>
					<div class="col text-end">
						<a class="text-primary"
							href="./orderDetail?order_no=${order.orderDto.orders_no}"> 주문 상세보기 </a>
					</div>
					<c:forEach var="orderProduct" items="${order.orderProductList}">
						<div class="row mt-2 ">
						<div class="col-1"></div>
						<div class="col border">
							<div class="row">
								<div class="col"> ${orderProduct.order_product_status_name}</div>
							</div>
							<div class="row">
							 <div class="col"> 
							 <img src="/uploadFiles/WelcomePet/${orderProduct.product.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="..."> </div>
								<div class="col">
								 	<div class="row">
								 		<div class="col fw-bold"> ${orderProduct.product.product_name}  </div>
								 	</div>
								 	<div class="row">
								 		<div class="col">${orderProduct.product_option.product_option_name} | ${orderProduct.order_product_quantity}개 </div>
								 	</div>	
								 	<div class="row">
								 		<div class="col fw-bold" > ${orderProduct.order_product_price} </div>
								 	</div>
											 										 								 	
								</div>
							</div>
								<div class="row mt-2 text-center">
								    <c:choose>
								        <c:when test="${orderProduct.order_product_status_no == 1}">
								            <div class="col-6">
								                <button type="button" class="btn btn-sm btn-outline-secondary">배송조회</button>
								            </div>
								            <div class="col-6">
								                <button type="button" class="btn btn-sm btn-outline-secondary" 
								                onclick="location.href='./updateProductStatus?order_product_no=${orderProduct.order_product_no}&order_product_status_no=2'">
								                주문취소</button>
								            </div>
								        </c:when>
								        <c:when test="${orderProduct.order_product_status_no == 7}">
								            <div class="col ">
								                <button type="button" class="btn btn-sm btn-outline-secondary">반품상세</button>
								            </div>
								        </c:when>
								        <c:when test="${orderProduct.order_product_status_no == 2}">
								            <div class="col text-center">
								                <button type="button" class="btn btn-sm btn-outline-secondary">취소상세</button>
								            </div>
								        </c:when>
								        <c:when test="${orderProduct.order_product_status_no == 6}">
								            <div class="col-6">
								                <button type="button" class="btn btn-sm btn-outline-secondary">배송조회</button>
								            </div>
								            <div class="col-6">
								                <button type="button" class="btn btn-sm btn-outline-primary"
								                onclick="location.href='./writeReviewPage?order_product_no=${orderProduct.order_product_no}'">
								                후기작성</button>
								            </div>
								        </c:when>
								        <c:otherwise>
								            <div class="col-3">
								                <button type="button" class="btn btn-sm btn-outline-secondary">배송조회</button>
								            </div>
								            <div class="col-3">
								                <button type="button" class="btn btn-sm btn-outline-secondary">교환요청</button>
								            </div>
								            <div class="col-3">
								                <button type="button" class="btn btn-sm btn-outline-secondary">환불요청</button>		
								            </div>
								            <div class="col-3">
								                <button type="button" class="btn btn-sm btn-outline-secondary"
													 onclick="location.href='./updateProductStatus?order_product_no=${orderProduct.order_product_no}&order_product_status_no=6'">
								                구매확정</button>
								            </div>
								        </c:otherwise>
								    </c:choose>
								</div>
								 	<div class="row mt-2"></div>
								 	
						</div>
						
					</div>
					</c:forEach>
				</div>
				</div>
					<div class="row mt-2 empty"></div>
		</c:forEach>

	<div class="row mt-2 empty"></div>
	
		<div class="row mt-2 ">
					<div class="row">
						<div class="col">주문상태 안내 </div>
					</div>
					<div class="row mt-3">
						<div class="col fw-bold">주문 완료</div>
						<div class="col text-end">주문이 완료된상태.</div>
					</div>
					<div class="row mt-3">
						<div class="col fw-bold">배송준비중</div>
						<div class="col text-end">주문이 완료된상태.</div>
					</div>
					<div class="row mt-3">
						<div class="col fw-bold">배송 완료</div>
						<div class="col text-end">주문이 완료된상태.</div>
					</div>
					<div class="row mt-3">
						<div class="col fw-bold">구매 확정</div>
						<div class="col text-end">주문이 완료된상태.</div>
					</div>					
		</div>
		<div class="row mt-2 empty"></div>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="reviewWriteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
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
