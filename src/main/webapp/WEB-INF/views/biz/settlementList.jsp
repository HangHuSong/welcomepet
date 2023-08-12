<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="row text-start" style="width: 1920px;">
			<div class="col-2"
				style="background-color: rgb(29, 33, 42); height: auto;"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 bg-light">
				<div class="row bg-white">
					<div class="col">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row px-5 text-start mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">정산 내역</div>
						</div>
						<div class="row mt-2 mb-5">
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
						<!-- <div class="row mt-5">
							<div class="col">
								<span
									class="btn border-0 border-bottom border-4 rounded-0 border-primary"
									id="newSettlementTab" onclick="loadNewSettlementTab()">미정산</span>
								<span class="btn" id="pendingSettlementTab"
									onclick="loadPendingSettlementTab()">정산대기</span> <span
									class="btn" id="completeSettlementTab"
									onclick="loadCompleteSettlementTab()">정산완료</span>
							</div>
						</div> -->
						<div class="row my-2 bg-white text-center">
							<div class="col border shadow">
								<div class="row text-start py-2 border-bottom">
									<div class="col px-0 mx-1">
										<select class="border-secondary border-opacity-50 rounded-2">
											<option selected>정산일 역순</option>
										</select> <select class="border-secondary border-opacity-50 rounded-2">
											<option selected>20개씩 보기</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col px-0">
										<div class="table-responsive" style="max-height: 450px;">
											<table class="table">
												<thead style="background-color: rgb(245, 250, 255);">
													<tr>
														<th>
															<div class="row">
																<div class="col align-self-center">정산 기준일</div>
															</div>
														</th>
														<th>
															<div class="row">
																<div class="col align-self-center">정산 금액</div>
															</div>
														</th>
														<th>
															<div class="row">
																<div class="col align-self-center">월 총 매출액</div>
															</div>
														</th>
														<th><div class="row">
																<div class="col align-self-center">수수료</div>
															</div></th>
														<th>
															<div class="row">
																<div class="col align-self-center">정산 지급 계좌</div>
															</div>
														</th>
														<th>
															<div class="row">
																<div class="col align-self-center">정산 상태</div>
															</div>
														</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${settlementDataList}"
														var="settlementData">
														<c:choose>
															<c:when
																test="${settlementData.settlementStatus eq '정산미요청'}">
																<tr>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_year }.${settlementData.statementDto.statement_month }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_price }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_total_sales }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_commission }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row justify-content-center"
																			id="accountContent${settlementData.statementDto.statement_no }">
																			<div class="col align-self-center">-</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center"
																				id="settlementStatus${settlementData.statementDto.statement_no }">
																				<button class="btn btn-outline-danger btn-sm"
																					data-bs-toggle="modal"
																					data-bs-target="#selectAccountModal"
																					onclick="modalShow(${settlementData.statementDto.statement_no})">정산
																					요청</button>
																			</div>
																		</div>
																	</td>
																</tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_year }.${settlementData.statementDto.statement_month }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_price }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_total_sales }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.statementDto.statement_commission }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.bankDto.bank_name }${settlementData.bizAccountDto.biz_account_num }</div>
																		</div>
																	</td>
																	<td>
																		<div class="row">
																			<div class="col align-self-center">${settlementData.settlementStatus}</div>
																		</div>
																	</td>
																</tr>
															</c:otherwise>
														</c:choose>
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
	<div class="modal fade" id="selectAccountModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title">정산 계좌 선택</h5>
					<input type="hidden" id="statementNoInput"> <input
						type="hidden" id="accountNoInput">

					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- 모달 본문 -->
				<div class="modal-body">
					<div class="row">
						<div class="col fs-5 fw-bold">계좌 목록</div>
					</div>
					<div class="row">
						<div class="col" id="accountList">
							<div class="list-group">
								<c:forEach items="${bizAccountDataList }" var="accountData">
									<button type="button"
										class="list-group-item list-group-item-action"
										onclick='selectAccount(event,${accountData.jsonData})'>
										${accountData.bankDto.bank_name }&nbsp;${accountData.bizAccountDto.biz_account_num }
									</button>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" onclick="requestSettlement()">정산
						요청</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function loadSettlementTable(response){
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

	    var tableHeaders = ["상품주문번호", "주문번호", "구매자명", "구매자연락처", "수취인명", "수취인연락처", "배송지", "배송메세지", "주문일", "상품번호", "상품명", "주문수량"];
		
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
	    
    	for(order of response){
    		
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
		    console.log(order);
    		customerNameTd.textContent = order.customerDto.customer_name;
    		tr.appendChild(customerNameTd);

    		const customerPhoneTd = document.createElement("td");
    		customerPhoneTd.textContent = order.customerDto.customer_phone;
    		tr.appendChild(customerPhoneTd);

    		const receiverNameTd = document.createElement("td");
    		receiverNameTd.textContent = order.ordersDto.orders_receiver_name;
    		tr.appendChild(receiverNameTd);

    		const addressPhoneTd = document.createElement("td");
    		addressPhoneTd.textContent = order.ordersDto.orders_address_phone;
    		tr.appendChild(addressPhoneTd);

    		const addressDetailsTd = document.createElement("td");
    		addressDetailsTd.textContent = order.ordersDto.orders_address+" "+order.ordersDto.orders_detail_address;
    		tr.appendChild(addressDetailsTd);

    		const shippingMessageTd = document.createElement("td");
    		shippingMessageTd.textContent = order.ordersDto.orders_shipping_message;
    		tr.appendChild(shippingMessageTd);

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
function loadNewSettlementTab() {
		
		const newSettlementTab=document.getElementById("newSettlementTab");
		if (!newSettlementTab.classList.contains('border-bottom')) {
			newSettlementTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const pendingSettlementTab = document.getElementById("pendingSettlementTab");
		if (pendingSettlementTab.classList.contains('border-bottom')) {
			pendingSettlementTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const completeSettlementTab = document.getElementById("completeSettlementTab");
		if (completeSettlementTab.classList.contains('border-bottom')) {
			completeSettlementTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		
		const xhr = new XMLHttpRequest();
		
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
            	const response = JSON.parse(xhr.responseText);
            	loadSettlementTable(response.settlementList);
            		    
            }
        }

	
        xhr.open("get", "./getNewSettlement");
        xhr.send();
		
	}
function loadCompleteSettlementTab() {
	
	const newSettlementTab=document.getElementById("newSettlementTab");
	if (newSettlementTab.classList.contains('border-bottom')) {
		newSettlementTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
	}
	
	const pendingSettlementTab = document.getElementById("pendingSettlementTab");
	if (pendingSettlementTab.classList.contains('border-bottom')) {
		pendingSettlementTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
	}
	
	const completeSettlementTab = document.getElementById("completeSettlementTab");
	if (!completeSettlementTab.classList.contains('border-bottom')) {
		completeSettlementTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
	}
	
	
	
	const xhr = new XMLHttpRequest();
	
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
        	const response = JSON.parse(xhr.responseText);
        	loadSettlementTable(response.settlementList);
        		    
        }
    }


    xhr.open("get", "./getCompleteSettlement");
    xhr.send();
	
}
function loadPendingSettlementTab() {
	
	const newSettlementTab=document.getElementById("newSettlementTab");
	if (newSettlementTab.classList.contains('border-bottom')) {
		newSettlementTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
	}
	
	const pendingSettlementTab = document.getElementById("pendingSettlementTab");
	if (!pendingSettlementTab.classList.contains('border-bottom')) {
		pendingSettlementTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
	}
	
	const completeSettlementTab = document.getElementById("completeSettlementTab");
	if (completeSettlementTab.classList.contains('border-bottom')) {
		completeSettlementTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
	}
	
	
	
	const xhr = new XMLHttpRequest();
	
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
        	const response = JSON.parse(xhr.responseText);
        	loadSettlementTable(response.settlementList);
        		    
        }
    }


    xhr.open("get", "./getPendingSettlement");
    xhr.send();
	
}
		function modalShow(statement_no) {
	        const statementNoInput=document.getElementById("statementNoInput");
	        statementNoInput.value=statement_no;
	        
	        var selectAccountModal = document.getElementById("selectAccountModal");
	        selectAccountModal.style.display = "block";
	    }
	    
	    function selectAccount(event,accountData) {
	    	const accountEl=event.target;
	    	accountEl.classList.add('active');
			
	    	const accountNoInput=document.getElementById("accountNoInput");
	    	accountNoInput.value=accountData.bizAccountDto.biz_account_no;
	    	
	    	
	    	
	    }
		function requestSettlement() {
			const statementNoInput=document.getElementById("statementNoInput");
			const accountNoInput=document.getElementById("accountNoInput");
	    	
	    	
			var statement_no=statementNoInput.value;
	        var biz_account_no=accountNoInput.value;
	       
	        
	        const xhr = new XMLHttpRequest();
	
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const accountData = JSON.parse(xhr.responseText);
	            	
	            	const settlementStatus=document.getElementById('settlementStatus'+statement_no);
	            	settlementStatus.innerHtml='';
	            	settlementStatus.innerText='정산요청완료';
	            	
	            	const accountContent=document.getElementById("accountContent"+statement_no);
	            	accountContent.innerHtml='';
	            	accountContent.innerText=accountData.bankDto.bank_name+' '+accountData.bizAccountDto.biz_account_num;
	            	
	
	            }
	        }
	
		
	        xhr.open("post", "./requestSettlementProcess");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("statement_no="+statement_no + "&biz_account_no=" + biz_account_no);
	    }
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>