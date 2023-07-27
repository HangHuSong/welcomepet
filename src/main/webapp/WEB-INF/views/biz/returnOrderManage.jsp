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
				style="height: auto; background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 bg-light">
				<div class="row bg-white">
					<div class="col"><jsp:include
							page="../common/bizTopNavi.jsp"></jsp:include></div>
				</div>
				<div class="row px-5 text-center mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">반품관리</div>
						</div>
						<div class="row my-2 text-start shadow">
							<div class="col border rounded-3"
								style="background-color: rgb(255, 255, 250);">
								<div class="row py-2 px-2">
									<div class="col align-self-center">
										<i class="fas fa-exclamation-circle"></i> 도움말
									</div>
								</div>
								<div class="row pb-2 px-2">
									<div class="col" style="font-size: 12px;">-주문을 발주확인하면
										배송준비중으로 변경되고, 배송할 상품에 운송장정보를 입력하고 발송처리하면 배송중으로 변경됩니다.</div>
								</div>
							</div>
						</div>
						<div class="row mt-2 mb-5 ">
							<div class="col">
								<div class="row mt-2 mb-3">
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
						<div class="row text-start">
							<div class="col">
								<span class="btn border-0 border-bottom border-4 rounded-0 border-primary"
									id="newReturnOrderTab" onclick="loadNewReturnOrderTab()">반품요청</span>
								<span class="btn" id="completeReturnOrderTab"
									onclick="loadCompleteReturnOrderTab()">반품완료</span>

							</div>
						</div>
						<div class="row my-2 bg-white">
							<div class="col border shadow">
								<div class="row py-2 border-bottom">
									<div class="col text-start">
										<button class="btn btn-outline-dark btn-sm"
											id="returnCompleteButton" onclick="changeOrderStatusTo7()">반품확인</button>
									</div>
								</div>
								<div class="row" id="orderList">
									<div class="col px-0">
										<div class="table-responsive" style="max-height: 450px; font-size: 13px;">
											<table class="table text-nowrap">
												<thead style="background-color: rgb(245, 250, 255);">
													<tr>
														<th scope="col"><input class="form-check-input"
															type="checkbox" value="" onclick="toggleCheck()"></th>
														<th scope="col">상품주문번호</th>
														<th scope="col">주문번호</th>
														<th scope="col">구매자명</th>
														<th scope="col">구매자연락처</th>
														<th scope="col">반품사유</th>
														<th scope="col">반품상세사유</th>
														<th scope="col">주문일</th>
														<th scope="col">상품번호</th>
														<th scope="col">상품명</th>
														<th scope="col">주문수량</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${orderList }" var="order">
														<tr>
															<td><input class="form-check-input"
																name="order_product_no" type="checkbox"
																value="${order.orderProductDto.order_product_no }"></td>
															<td><button class="btn px-0 py-0"
																	data-bs-toggle="modal"
																	data-bs-target="#orderDetailModal"
																	onclick='showModal(${order.jsonData})'>${order.orderProductDto.order_product_no }</button></td>
															<td>${order.ordersDto.orders_no }</td>
															<td>${order.customerDto.customer_name }</td>
															<td>${order.customerDto.customer_phone }</td>
															<td>${order.returnExchangeReasonDto.return_exchange_reason_name }</td>
															<td>${order.returnDto.return_reason_detail }</td>
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
				</div>
				<div class="row ms-1">
					<div class="col">
						<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="orderDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5">주문 상세보기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<div class="row my-2">
						<div class="col border">
							<div class="row py-2 border-bottom">
								<div class="col fw-bold text-start">주문상세정보</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="row border-bottom">
										<div class="col-3 bg-light">상품명</div>
										<div class="col" id="productName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">옵션</div>
										<div class="col" id="productOptionName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">상품주문상태</div>
										<div class="col" id="orderStatus"></div>
										<div class="col-3 bg-light">주문일</div>
										<div class="col" id="orderDate"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">구매자명</div>
										<div class="col" id="customerName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">상품가격</div>
										<div class="col" id="productPrice"></div>
										<div class="col-3 bg-light">주문수량</div>
										<div class="col" id="orderQuantity"></div>
									</div>
									<div class="row">
										<div class="col-3 bg-light">총금액</div>
										<div class="col" id="totalPrice"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col border">
							<div class="row py-2 border-bottom">
								<div class="col fw-bold text-start">배송정보</div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">택배사</div>
								<div class="col" id="shippingCompanyName"></div>
								<div class="col-3 bg-light">송장번호</div>
								<div class="col" id="shippingTrackingNo"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">수취인명</div>
								<div class="col" id="receiverName"></div>
								<div class="col-3 bg-light">연락처</div>
								<div class="col" id="receiverPhone"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">배송지</div>
								<div class="col" id="shippingAddress"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">배송메모</div>
								<div class="col" id="shippingMemo"></div>
							</div>
							<div class="row">
								<div class="col" id="addressMap"
									style="width: 500px; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d62878260103ab0e7c7d176b029a8aa6"></script>

	<script>
		function showModal(orderData){
			
			// 주문정보
	        const productName = document.getElementById("productName");
	        productName.innerText = orderData.productDto.product_name;
			
	        const productOptionName = document.getElementById("productOptionName");
	        if (orderData.productOptionNum != 1) {
	            productOptionName.innerText = orderData.productOptionDto.product_option_name;
	        }else{
	        	productOptionName.innerText ="-";
	        }
	
	        const orderStatus = document.getElementById("orderStatus");
	        orderStatus.innerText = orderData.orderProductStatusDto.order_product_status_name;
	
	        const orderDate = document.getElementById("orderDate");
	        const formattedDate = formatDate(new Date(orderData.ordersDto.orders_date));
	        orderDate.innerText = formattedDate;
	
	        const customerName = document.getElementById("customerName");
	        customerName.innerText = orderData.customerDto.customer_name;
	
	        const productPrice = document.getElementById("productPrice");
	        productPrice.innerText = orderData.orderProductDto.order_product_price;
	
	        const orderQuantity = document.getElementById("orderQuantity");
	        orderQuantity.innerText = orderData.orderProductDto.order_product_quantity;
	
	
	        const totalPrice = document.getElementById("totalPrice");
	        totalPrice.innerText = orderData.orderProductDto.order_product_price * orderData.orderProductDto.order_product_quantity;
	
	
	        // 배송정보
	        if(orderData.shippingNum>=1){
	        	const shippingCompanyName = document.getElementById("shippingCompanyName");
	            shippingCompanyName.innerText = orderData.shippingCompanyDto.shipping_company_name;
	
	            const shippingTrackingNo = document.getElementById("shippingTrackingNo");
	            shippingTrackingNo.innerText = orderData.shippingDto.shipping_tracking_no;
	        }
	        
	
	        const receiverName = document.getElementById("receiverName");
	        receiverName.innerText = orderData.ordersDto.orders_receiver_name;
	
	        const receiverPhone = document.getElementById("receiverPhone");
	        receiverPhone.innerText = orderData.ordersDto.orders_address_phone;
	
	        const shippingAddress = document.getElementById("shippingAddress");
	        shippingAddress.innerText = orderData.ordersDto.orders_address + " " + orderData.ordersDto.orders_detail_address;
	
	        const shippingMemo = document.getElementById("shippingMemo");
	        shippingMemo.innerText = orderData.ordersDto.orders_shipping_message;
	
	        const addressMap = document.getElementById("addressMap");
	        
	        
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	        
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	
	            	const addressData=response.documents[0];
	            	var markerPosition=new kakao.maps.LatLng(addressData.y, addressData.x);
	            	
	            	
	            	var options = {
	                        center: markerPosition,
	                        level: 3
	                    };    
	            	var map = new kakao.maps.Map(addressMap, options);
	            	var marker = new kakao.maps.Marker({
	        		    position: markerPosition
	        		});
	            	marker.setMap(map);
	            }
	        }
	
		
	        xhr.open("post", "https://dapi.kakao.com/v2/local/search/address.json");
	        xhr.setRequestHeader("Authorization", "KakaoAK e4a5b9e6ac9298f7e5a5085408e299b8");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("query="+orderData.ordersDto.orders_address)
	        
	        
	
	        const orderDetailModal = document.getElementById("orderDetailModal");
	        orderDetailModal.style.display='block';
		}
		
		function loadOrderTable(response){
			const orderList=document.getElementById('orderList');
			orderList.innerHTML='';
        	
			const col=document.createElement("div");
			col.classList.add("col");
			orderList.appendChild(col);
			
			const div=document.createElement("div");
			div.classList.add("table-responsive");
			col.appendChild(div);
			
			var table = document.createElement("table");
		    table.classList.add("table", "text-nowrap");

		    var thead = document.createElement("thead");
		    var tbody = document.createElement("tbody");

		    var tableHeaders = ["상품주문번호", "주문번호", "구매자명", "구매자연락처", "반품사유", "반품상세사유", "주문일", "상품번호", "상품명", "주문수량"];
			
		    var headerRow = document.createElement("tr");
			var checkboxTh = document.createElement("th");
		    
		    const headerCheckboxInput = document.createElement("input");
		    headerCheckboxInput.className = "form-check-input";
		    headerCheckboxInput.name = "order_product_no";
		    headerCheckboxInput.type = "checkbox";
		    checkboxTh.appendChild(headerCheckboxInput);
		    
		    headerRow.appendChild(checkboxTh);
			
		    
		    for (tableHeader of tableHeaders) {
		      var th = document.createElement("th");
		      th.textContent = tableHeader;
		      headerRow.appendChild(th);
		    }
		    thead.appendChild(headerRow);
		    
        	for(order of response.orderList){
        		
        		const tr = document.createElement("tr");

        		const checkboxTd = document.createElement("td");
        		const checkboxInput = document.createElement("input");
        		checkboxInput.className = "form-check-input";
        		checkboxInput.name = "order_product_no";
        		checkboxInput.type = "checkbox";
        		checkboxInput.value = order.orderProductDto.order_product_no;
        		checkboxTd.appendChild(checkboxInput);
        		tr.appendChild(checkboxTd);

        		const orderProductNoTd = document.createElement("td");
				const button=document.createElement("button");
        		
        		button.classList.add('btn','px-0','py-0');
        		button.setAttribute('data-bs-toggle','modal');
        		button.setAttribute('data-bs-target','#orderDetailModal');
        		button.addEventListener('click',function(){
        			showModal(order);
        		});
        		button.textContent = order.orderProductDto.order_product_no;
        		orderProductNoTd.appendChild(button);
        		tr.appendChild(orderProductNoTd);

        		const ordersNoTd = document.createElement("td");
        		ordersNoTd.textContent = order.ordersDto.orders_no;
        		tr.appendChild(ordersNoTd);

        		const customerNameTd = document.createElement("td");
        		customerNameTd.textContent = order.customerDto.customer_name;
        		tr.appendChild(customerNameTd);

        		const customerPhoneTd = document.createElement("td");
        		customerPhoneTd.textContent = order.customerDto.customer_phone;
        		tr.appendChild(customerPhoneTd);

        		const returnExchangeReasonNameTd = document.createElement("td");
        		returnExchangeReasonNameTd.textContent = order.returnExchangeReasonDto.return_exchange_reason_name;
        		tr.appendChild(returnExchangeReasonNameTd);

        		const returnReasonDetailTd = document.createElement("td");
        		returnReasonDetailTd.textContent = order.returnDto.return_reason_detail;
        		tr.appendChild(returnReasonDetailTd);
        		
        		const ordersDateTd = document.createElement("td");
        		const formattedDate = new Date(order.ordersDto.orders_date).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" });
        		ordersDateTd.textContent = formattedDate;
        		tr.appendChild(ordersDateTd);

        		const productOptionNoTd = document.createElement("td");
        		productOptionNoTd.textContent = order.productOptionDto.product_option_no;
        		tr.appendChild(productOptionNoTd);

        		const productOptionNameTd = document.createElement("td");
        		productOptionNameTd.textContent = order.productOptionDto.product_option_name;
        		tr.appendChild(productOptionNameTd);

        		const orderProductQuantityTd = document.createElement("td");
        		orderProductQuantityTd.textContent = order.orderProductDto.order_product_quantity;
        		tr.appendChild(orderProductQuantityTd);

        		tbody.appendChild(tr);
        		
        		
        	}
        	
        	table.appendChild(thead);
        	table.appendChild(tbody);
        	
        	div.appendChild(table);
        	
		}
		
		
		
		function changeOrderStatusTo7(){
			const orderList=document.getElementById("orderList");
			const checkedOrderList=orderList.querySelectorAll('input[name="order_product_no"]:checked');
			
			var orderProductNoList=[];
			for(var i=0;i<checkedOrderList.length;i++){
				orderProductNoList.push(checkedOrderList[i].value);
			}
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	
	            	loadNewReturnOrderTab();
	            		    
	            }
	        }
	
		
	        xhr.open("post", "./changeOrderStatusTo7");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("orderProductNoList="+orderProductNoList);
		}
		
		function loadNewReturnOrderTab() {
			
			const newReturnOrderTab=document.getElementById("newReturnOrderTab");
			if (!newReturnOrderTab.classList.contains('border-bottom')) {
				newReturnOrderTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
			const completeReturnOrderTab = document.getElementById("completeReturnOrderTab");
			if (completeReturnOrderTab.classList.contains('border-bottom')) {
				completeReturnOrderTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
			
			const returnCompleteButton = document
					.getElementById("returnCompleteButton");
			if (returnCompleteButton.closest('.row').classList
					.contains('visually-hidden')) {
				returnCompleteButton.closest('.row').classList.remove('visually-hidden');
			}
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadOrderTable(response);
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getNewReturnOrder");
	        xhr.send();
			
		}
		
		function loadCompleteReturnOrderTab() {
			
			const newReturnOrderTab=document.getElementById("newReturnOrderTab");
			if (newReturnOrderTab.classList.contains('border-bottom')) {
				newReturnOrderTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
			const completeReturnOrderTab = document.getElementById("completeReturnOrderTab");
			if (!completeReturnOrderTab.classList.contains('border-bottom')) {
				completeReturnOrderTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
			
			const returnCompleteButton = document
					.getElementById("returnCompleteButton");
			if (!returnCompleteButton.closest('.row').classList
					.contains('visually-hidden')) {
				returnCompleteButton.closest('.row').classList.add('visually-hidden');
			}
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadOrderTable(response);
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getCompleteReturnOrder");
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