<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<script type="text/javascript">
	const biz_no = new URLSearchParams(location.search).get("biz_no");
	
	function getBizDetail(biz_no){
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				// js 작업 공간 TO-DO
				const biz = response.bizDto;
				const bizStatus = response.bizStatus;
				const bizInfoBox = document.getElementById("bizInfoBox");
				bizInfoBox.innerHTML = "";
				
				const tr1 = document.createElement("tr");
				const td1 = document.createElement("td");
				const td2 = document.createElement("td");
				td1.innerText = "상호명";
				td2.innerText = biz.biz_store_name;
				tr1.appendChild(td1);
				tr1.appendChild(td2);
				bizInfoBox.appendChild(tr1);
				
				const tr2 = document.createElement("tr");
				const td3 = document.createElement("td");
				const td4 = document.createElement("td");
				td3.innerText = "이메일";
				td4.innerText = biz.biz_email;
				tr2.appendChild(td3);
				tr2.appendChild(td4);
				bizInfoBox.appendChild(tr2);
				
				const tr3 = document.createElement("tr");
				const td5 = document.createElement("td");
				const td6 = document.createElement("td");
				td5.innerText = "연락처";
				td6.innerText = biz.biz_phone;
				tr3.appendChild(td5);
				tr3.appendChild(td6);
				bizInfoBox.appendChild(tr3);
				
				const tr4 = document.createElement("tr");
				const td7 = document.createElement("td");
				const td8 = document.createElement("td");
				td7.innerText = "입점 상태";
				td8.innerText = bizStatus.biz_status_name;
				tr4.appendChild(td7);
				tr4.appendChild(td8);
				bizInfoBox.appendChild(tr4);
			}
		}
		
		// get
		xhr.open("get", "./getBizDetail?biz_no=" + biz_no);
		xhr.send();
	}
	
	window.addEventListener("DOMContentLoaded", function() {
		  getBizDetail(biz_no);
	});
</script>
</head>

<body>
	<div class="container">
		
		<div class="row">
			<%@ include file="../common/adminTab.jsp"%>
			

			<div class="col-1"></div>
			<div class="col-9">
				<%@ include file="../common/adminHead.jsp" %>
				<div class="row">
					<div class="col-6">			
						<div class="row mt-5">
					        <div class="col">
					            <table id="bizInfoBox" class="table table-bordered">
					            	
					            </table>
		                </div>
		            </div>
		            <c:if test="${bizDto.biz_status_no eq 1 || bizDto.biz_status_no eq 2}">
		            <div class="row mt-5">
				        <div class="col">
				            <div class="card">
				                <div class="card-body">
				                    <h5 class="card-title">판매자 history</h5>
				                    <hr>
				                    <div class="form-group row">
				                        <label class="col-sm-4 col-form-label">입점 상태</label>
				                        <div class="col-sm-8">
				                            <input type="text" class="form-control-plaintext" value="${bizStatusDto.biz_status_name}" readonly>
				                        </div>
				                    </div>
				                    <div class="form-group row">
				                        <label class="col-sm-4 col-form-label">처리자</label>
				                        <div class="col-sm-8">
				                            <input type="text" class="form-control-plaintext" value="${empDto.emp_name}" readonly>
				                        </div>
				                    </div>
				                    <div class="form-group row">
				                        <label class="col-sm-4 col-form-label">관리자 메모</label>
				                        <div class="col-sm-8">
				                            <input type="text" class="form-control-plaintext" value="${bizApprovalDto.emp_memo}" readonly>
				                        </div>
				                    </div>
				                    <div class="form-group row">
				                        <label class="col-sm-4 col-form-label">처리날짜</label>
				                        <div class="col-sm-8">
				                            <input type="text" class="form-control-plaintext" value="${bizApprovalDto.biz_approval_date}" readonly>
				                        </div>
				                    </div>
		                    	</div>
	                   		 </div>
                    	</div>
                    </div>
                    </c:if>
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