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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style type="text/css">
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
	<div class="container" style="margin: 0 0;">

		<div class="row" style="width: 1920px;">
			<div class="col-2"
				style="background-color: rgb(29, 33, 42); height: auto;"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 bg-light">
				<div class="row bg-white">
					<div class="col">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row px-5 text-center mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">정산내역 상세보기</div>
						</div>
						<div class="row mt-2 mb-5">
							<div class="col">
								<div class="row mt-2 mb-3">
									<div class="col border bg-white rounded-3 shadow">
										<div class="row">
											<div class="col">
												<div class="row">
													<div class="col-2 text-start align-self-center px-4">기간</div>
													<div class="col align-self-center text-start">
														<select id="yearSelect" class="rounded-1" style="border: 1px solid rgb(174, 180, 198);">
															<option selected>년</option>
															<c:forEach items="${orderPeriod.order_year }"
																var="order_year">
																<option value="${order_year }">${order_year }</option>
															</c:forEach>
														</select>
														<select id="monthSelect" class="rounded-1" style="border: 1px solid rgb(174, 180, 198);">
															<option selected>월</option>
															<c:forEach items="${orderPeriod.order_month }"
																var="order_month">
																<option value="${order_month }">${order_month }</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-2 px-5 d-grid py-2 border-start"
														style="background-color: rgb(245, 250, 255);">
														<button class="btn btn-primary rounded-5" onclick="getSettlementProductListByDate()">검색</button>
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
														<button class="btn btn-secondary rounded-5" onclick="resetSelect()">초기화</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row visually-hidden mt-5" id="salesDataBox">
							<div class="col">
								<table class="table table-bordered shadow">
									<thead style="background-color: rgb(245, 250, 255);">
										<tr>
											<th scope="col">결제내역 합계</th>
											<th scope="col">결제 수수료</th>
											<th scope="col">정산금액</th>
										</tr>
									</thead>
									<tbody class="text-danger">
										<tr>
											<td id="salesBox"></td>
											<td id="commissionBox"></td>
											<td id="totalSalesBox"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col">
								<div class="row py-2" id="orderList">
									<div class="col px-0 bg-white shadow">
										<div class="table-responsive">
											<table class="table text-nowrap table-bordered">
												<thead class="table-light">
													<tr>

														<th scope="col">상품주문번호</th>
														<th scope="col">주문번호</th>
														<th scope="col">상품명</th>
														<th scope="col">구매자명</th>
														<th scope="col">주문일</th>
														<th scope="col">정산상태</th>
														<th scope="col">정산예정일</th>
														<th scope="col">정산완료일</th>
														<th scope="col">결제금액</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${orderList }" var="order">
														<tr>

															<td>${order.orderProductDto.order_product_no }</td>
															<td>${order.ordersDto.orders_no }</td>
															<td>${order.productOptionDto.product_option_name }</td>
															<td>${order.customerDto.customer_name }</td>
															<td><fmt:formatDate
																	value="${order.ordersDto.orders_date }"
																	pattern="yyyy.MM.dd" /></td>
															<td><c:if test="${order.isSettled==0}">미정산</c:if> <c:if
																	test="${order.isSettled ne 0}">정산완료</c:if></td>
															<td>${order.settlementScheduledDate }</td>
															<td><c:if test="${order.isSettled==0}">-</c:if> <c:if
																	test="${order.isSettled ne 0}">
																	<fmt:formatDate
																		value="${order.settlementProcessDto.settlement_process_date }"
																		pattern="yyyy.MM.dd" />
																</c:if></td>
															<td>${order.orderProductDto.order_product_price }</td>
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
				</div>
				<div class="row">
					<div class="col">
						<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
				</div>
			</div>
		</div>
	</div>


	<script>
		function resetSelect(){
			const yearSelect=document.getElementById("yearSelect");
			const monthSelect=document.getElementById("monthSelect");
			
			yearSelect.options[0].selected=true;
			monthSelect.options[0].selected=true;
		}
		function getSettlementProductListByDate(){
			const yearSelect=document.getElementById("yearSelect");
			const yearSelectedOption=yearSelect.options[yearSelect.selectedIndex];
			
			const monthSelect=document.getElementById("monthSelect");
			const monthSelectedOption=monthSelect.options[monthSelect.selectedIndex];
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadOrderTable(response);
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getSettlementProductListByDate?year="+yearSelectedOption.value+"&month="+monthSelectedOption.value);
	        xhr.send();
		}
		
		function loadOrderTable(response){
			const salesDataBox=document.getElementById("salesDataBox");
			
			if(salesDataBox.classList.contains('visually-hidden')){
				salesDataBox.classList.remove('visually-hidden');
			}
			
			const salesBox=document.getElementById("salesBox");
			salesBox.innerText=response.salesData.sales+"원";
			
			const commissionBox=document.getElementById("commissionBox");
			commissionBox.innerText=response.salesData.commission+"%";
			
			const totalSalesBox=document.getElementById("totalSalesBox");
			totalSalesBox.innerText=Math.floor(response.salesData.sales*(100-response.salesData.commission)/100)+"원";
			
			const orderList=document.getElementById('orderList');
			orderList.innerHTML='';
        	
			const col=document.createElement("div");
			col.classList.add("col","shadow","px-0","bg-white");
			orderList.appendChild(col);
			
			const div=document.createElement("div");
			div.classList.add("table-responsive");
			col.appendChild(div);
			
			var table = document.createElement("table");
		    table.classList.add("table", "text-nowrap","table-bordered");

		    var thead = document.createElement("thead");
		    thead.classList.add("table-light");
		    var tbody = document.createElement("tbody");
		    
		    var tableHeaders = ["상품주문번호", "주문번호", "상품명", "구매자명", "주문일", "정산상태", "정산예정일", "정산완료일", "결제금액"];
			
		    var headerRow = document.createElement("tr");
		    
		    
		    for (tableHeader of tableHeaders) {
		      var th = document.createElement("th");
		      th.textContent = tableHeader;
		      headerRow.appendChild(th);
		    }
		    thead.appendChild(headerRow);
		    
        	for(order of response.orderList){
        		
        		const tr = document.createElement("tr");

        		const orderProductNoTd = document.createElement("td");
        		orderProductNoTd.textContent = order.orderProductDto.order_product_no;
        		tr.appendChild(orderProductNoTd);

        		const ordersNoTd = document.createElement("td");
        		ordersNoTd.textContent = order.ordersDto.orders_no;
        		tr.appendChild(ordersNoTd);
				
        		const productOptionNameTd = document.createElement("td");
        		productOptionNameTd.textContent = order.productOptionDto.product_option_name;
        		tr.appendChild(productOptionNameTd);
        		
        		const customerNameTd = document.createElement("td");
        		customerNameTd.textContent = order.customerDto.customer_name;
        		tr.appendChild(customerNameTd);
				
        		const ordersDateTd = document.createElement("td");
        		ordersDateTd.textContent = formatDate(new Date(order.ordersDto.orders_date));
        		tr.appendChild(ordersDateTd);
        		
        		const settlementStatusTd = document.createElement("td");
        		if(order.isSettled==0){
        			settlementStatusTd.textContent = "미정산";
        		}else{
        			settlementStatusTd.textContent = "정산완료";
        		}
        		tr.appendChild(settlementStatusTd);
        		
        		const settlementScheduledDateTd = document.createElement("td");
        		settlementScheduledDateTd.textContent = formatDate(new Date(order.settlementScheduledDate));
        		tr.appendChild(settlementScheduledDateTd);
        		
        		
        		const settlementProcessedDateTd = document.createElement("td");
        		if(order.isSettled!=0){
            		settlementProcessedDateTd.textContent = formatDate(new Date(order.settlementProcessDto.settlement_process_date));
        		}else{
        			settlementProcessedDateTd.textContent="-";
        		}
        		tr.appendChild(settlementProcessedDateTd);
        		
        		const paymentPriceTd = document.createElement("td");
        		paymentPriceTd.textContent = order.orderProductDto.order_product_price*order.orderProductDto.order_product_quantity;
        		tr.appendChild(paymentPriceTd);

        		tbody.appendChild(tr);
        		
        		
        	}
        	
        	table.appendChild(thead);
        	table.appendChild(tbody);
        	
        	div.appendChild(table);
        	
		}
		
		
		function loadOrderTableBySearch() {
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadOrderTable(response.orderList);
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getCompleteShippingOrder");
	        xhr.send();
			
		}
		
		
		function formatDate(date) {
			  const year = date.getFullYear();
			  const month = String(date.getMonth() + 1).padStart(2, '0');
			  const day = String(date.getDate()).padStart(2, '0');
			  return year+"."+month+"."+day;
			}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>