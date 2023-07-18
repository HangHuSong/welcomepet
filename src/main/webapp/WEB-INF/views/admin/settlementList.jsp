<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script type="text/javascript">
	function formatDate(timestamp) {
	    const date = new Date(timestamp);
	    const year = date.getFullYear();
	    const month = (date.getMonth() + 1).toString().padStart(2, '0');
	    const day = date.getDate().toString().padStart(2, '0');
	    return year + '.' + month + '.' + day;
	  }

	function getSettlementRequestList(){
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				const settlementRequestList = response.settlementRequestList;
				const settlementRequestListBox = document.getElementById("settlementRequestListBox");
				settlementRequestListBox.innerHTML = "";
				
				for(request of settlementRequestList){
					const tr = document.createElement("tr");
					const td1 =  document.createElement("td");
					td1.innerText = request.settlementRequestDto.settlement_request_no;
					tr.appendChild(td1);
					
					const td2 =  document.createElement("td");
					td2.innerText = request.bizDto.biz_store_name;
					tr.appendChild(td2);
					
					const td3 =  document.createElement("td");
					td3.innerText = request.statementDto.statement_year + "년." + request.statementDto.statement_month + "월 / " + request.statementDto.statement_price + "원";
					tr.appendChild(td3);
					
					const td4 = document.createElement("td"); 
					td4.innerText = formatDate(request.settlementRequestDto.settlement_request_date);
					tr.appendChild(td4);
					
					const td5 = document.createElement("td");
					if (request.settlementProcessDto != null) {
						td5.innerText = "처리완료";
						tr.appendChild(td5);
					} else {
						const btn = document.createElement("button");
						btn.classList.add("btn","btn-primary");
						btn.innerText = "정산하기";
						btn.setAttribute("onclick","settlementProcess("+ request.settlementRequestDto.settlement_request_no +")");
						td5.appendChild(btn);
						tr.appendChild(td5);
					}
					
					settlementRequestListBox.appendChild(tr);
				}
			}		
		}
		// get
		xhr.open("get", "./getSettlementRequestList");
		xhr.send();

	}
	function settlementProcess(settlement_request_no){
		const width = 800;
	    const height = 600;
	    const left = window.innerWidth / 2 - width / 2 + window.screenX;
	    const top = window.innerHeight / 2 - height / 2 + window.screenY;

	    window.open('./settlementHandle?settlement_request_no=' + settlement_request_no, '작은화면', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);

	}
	
	 window.addEventListener("DOMContentLoaded", function() {
		 getSettlementRequestList()
		});
</script>
</head>

<body>
	<div class="container">
		<%@ include file="../common/adminHead.jsp" %>
		<div class="row">
			<%@ include file="../common/adminTab.jsp"%>
			<div class="col-1"></div>
			<div class="col-9">
				<div class="row mt-5">
					<div class="col">
						<h1 class="text-center">정산 요청 목록</h1>
					</div>	
				</div>
				<div class="row mt-2">
					<div class="col">
						<table class="table mt-1">
								<thead class="table-dark">
									<tr>
										<td scope="col"></td>
										<td scope="col">판매자</td>
										<td scope="col">정산년월/정산금액</td>
										<td scope="col">요청일</td>
										<td scope="col">처리여부</td>
										<td></td>
									</tr>
								</thead>
								<tbody id="settlementRequestListBox">
								</tbody>
							</table>
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