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
<script>
	
</script>


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-3"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col">
				<div class="row">
					<div class="col"></div>
				</div>
				<div class="row">
					<div class="col">
						<table class="table">
							<thead>
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
											<div class="col align-self-center">정산 금액 상세 내역</div>
										</div>
										<div class="row">
											<div class="col align-self-center">월 총 매출액</div>
											<div class="col align-self-center">수수료</div>
										</div>
									</th>
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
								<c:forEach items="${settlementDataList}" var="settlementData">
									<c:choose>
										<c:when test="${settlementData.settlementStatus eq '정산미요청'}">
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
														<div class="col align-self-center">${settlementData.statementDto.statement_commission }</div>
													</div>
												</td>
												<td>
													<div class="row justify-content-center" id="accountContent${settlementData.statementDto.statement_no }">
														<div class="col align-self-center">-</div>
													</div>
												</td>
												<td>
													<div class="row">
														<div class="col align-self-center" id="settlementStatus${settlementData.statementDto.statement_no }">
															<button class="btn btn-primary btn-sm"
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
	<div class="modal fade" id="selectAccountModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title">정산 계좌 선택</h5>
					<input type="hidden" id="statementNoInput">
					<input type="hidden" id="accountNoInput">
					
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
									<button type="button" class="list-group-item list-group-item-action"
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