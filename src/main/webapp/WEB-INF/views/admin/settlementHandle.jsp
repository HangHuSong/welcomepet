<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<style type="text/css">
	@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
	body{
		font-family: "NanumSquare";
	}
	</style>
<script type="text/javascript">
	const settlement_request_no = new URLSearchParams(location.search).get("settlement_request_no");
	const formData = new FormData();
	
	function saveFile(event){
		const evidence = event.target.files[0];
		formData.append("evidence",evidence);
	}
	
	function transferSettlement() {
		const settlement_process_emp_memo = document.getElementById('settlement_process_emp_memo');	
		
		formData.append('settlement_process_emp_memo', settlement_process_emp_memo.value);
		formData.append("settlement_request_no", settlement_request_no);
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				window.opener.location.reload();
		        window.close();
			}
		}			
		// post
		xhr.open("post", "./settlementTransfer");
		xhr.send(formData); 
		
	}
	window.addEventListener("DOMContentLoaded", function() {
		
	});
</script>
</head>
<body>
	<div class="container">
		<pre>
	
	
		</pre>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<div class="row">
					<div class="col text-center">
						<h1>${map.bizDto.biz_store_name}</h1>
						<h2>${map.statementDto.statement_year}년
							${map.statementDto.statement_month}월 명세표</h2>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<table class="table table-bordered">
							<tr>
								<td>총 매출액</td>
								<td>${map.statementDto.statement_total_sales}원</td>
							</tr>
							<tr>
								<td>수수료</td>
								<td>${map.statementDto.statement_commission}%</td>
							</tr>
							<tr>
								<td>정산금액</td>
								<td>${map.statementDto.statement_price}원</td>
							</tr>
							<tr>
								<td>정산계좌</td>
								<td>${map.bankDto.bank_name}</td>
							</tr>
							<tr>
								<td>계좌번호</td>
								<td>${map.bizAccountDto.biz_account_num}</td>
							</tr>
						</table>
							
                            <div class="row mt-5">
                                <div class="col">
                                    <input type="file" class="form-control" accept="image/*" id="settlement_process_evidence" onchange="saveFile(event)">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <textarea class="form-control" rows="2" cols="10" placeholder="정산메모" id="settlement_process_emp_memo"></textarea>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-7"></div>
                                <div class="col d-grid">
                                    <button class="btn btn-secondary" onclick="transferSettlement()">처리완료</button>
                                </div>
                            </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity = "sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin = "anonymous">
	</script>
</body>
</html>