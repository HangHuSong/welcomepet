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

</head>
<body>
	<div class="container" style="margin: 0 0;">

		<div class="row" style="width: 1900px;">
			<div
				class="col-2 text-center ps-4 text-white d-flex align-items-stretch align-top"
				style="background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-8 px-0">
				<div class="row mx-1">
					<div class="col">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row mx-5 text-center">
					<div class="col">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">문의 내역</div>
						</div>
						<div class="row my-2 bg-light px-5">
							<div class="col">
								<div class="row my-5">
									<div class="col border bg-white">
										<div class="row">
											<div class="col-3 border-end py-2">기간</div>
											<div class="col py-2 text-start">
												<input class="text-center" type="date" style="width: 200px;">
												~ <input class="text-center" type="date"
													style="width: 200px;">
											</div>
										</div>
									</div>
								</div>
								<div class="row justify-content-center my-5">
									<div class="col">
										<span><button class="btn btn-dark">검색</button></span> <span><button
												class="btn btn-outline-dark">초기화</button></span>
									</div>
								</div>
							</div>

						</div>
						<div class="row mt-4 mx-2 text-start">
							<div class="col">
								<span
									class="btn border-0 border-bottom border-4 rounded-0 border-primary"
									id="newInquiryTab" onclick="loadNewInquiryTab()"> 미답변 </span> <span
									class="btn" id="completeInquiryTab"
									onclick="loadCompleteInquiryTab()"> 답변완료</span>
							</div>
						</div>
					</div>
					<div class="row my-2 mx-2">
						<div class="col">
							<div class="row" id="inquiryList">
								<div class="col">
									<div class="table-responsive">
										<table class="table text-nowrap table-bordered">
											<thead class="table-light">
												<tr>
													<th scope="col">상품문의번호</th>
													<th scope="col">상품명</th>
													<th scope="col">문의제목</th>
													<th scope="col">작성자</th>
													<th scope="col">등록일</th>
													<th scope="col">문의상세</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${productInquiryDataList }"
													var="productInquiryData">
													<tr>

														<td>${productInquiryData.productInquiryDto.product_inquiry_no }</td>
														<td>${productInquiryData.productDto.product_name }</td>
														<td>${productInquiryData.productInquiryDto.product_inquiry_title}</td>
														<td>${productInquiryData.customerDto.customer_name }</td>
														<td><fmt:formatDate
																value="${productInquiryData.productInquiryDto.product_inquiry_reg_date }"
																pattern="yyyy.MM.dd" /></td>
														<td>
															<button id="showModalButton"
																class="btn btn-outline-dark btn-sm"
																onclick='showModal(${productInquiryData.jsonData})'
																data-bs-toggle="modal" data-bs-target="#inquiryModal">문의
																보기</button>
														</td>
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
		</div>
	</div>
	<div class="modal fade" id="inquiryModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5">문의 내용</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<div class="row mx-2">
						<div class="col bg-light border">
							<div class="row border-bottom">
								<div class="col-3 py-2">등록일</div>
								<div class="col py-2 bg-white border-start"
									id="inquiry_reg_date_content"></div>
								<div class="col-3 py-2">작성자</div>
								<div class="col py-2 bg-white border-start" id="customer_name_content"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 py-2">답변여부</div>
								<div class="col py-2 bg-white border-start" id="is_replied_content"></div>
								<div class="col-3 py-2">답변일</div>
								<div class="col py-2 bg-white border-start" id="reply_reg_date_content"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 py-2">제목</div>
								<div class="col py-2 bg-white border-start" id="inquiry_title_content"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 py-2 align-self-center">내용</div>
								<div class="col py-2 bg-white border-start" id="inquiry_context_content"></div>
							</div>
							<div class="row">
								<div class="col-3 align-self-center">답변 내용</div>
								<div class="col bg-white py-2 border-start"
									id="inquiry_reply_context_content"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer border-0">
					<input type="hidden" name="inquiry_no">
					<button type="button" class="btn btn-primary"
						onclick='registerInquiryReply()'>답변 등록하기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		
		function showModal(inquiryData){
			const inquiryModal=document.getElementById("inquiryModal");
			
			
			const inquiryNoInput=document.querySelector('input[name="inquiry_no"]');
			inquiryNoInput.value=inquiryData.productInquiryDto.product_inquiry_no;
			
			const inquiry_reg_date_content=document.getElementById("inquiry_reg_date_content");
			inquiry_reg_date_content.innerText=formatDate(new Date(inquiryData.productInquiryDto.product_inquiry_reg_date));
			
			const customer_name_content=document.getElementById("customer_name_content");
			customer_name_content.innerText=inquiryData.customerDto.customer_name;
			
			const inquiry_title_content=document.getElementById("inquiry_title_content");
			inquiry_title_content.innerText=inquiryData.productInquiryDto.product_inquiry_title;
			
			const inquiry_context_content=document.getElementById("inquiry_context_content");
			inquiry_context_content.innerText=inquiryData.productInquiryDto.product_inquiry_context;
			
			const inquiry_reply_context_content=document.getElementById("inquiry_reply_context_content");
			const is_replied_content=document.getElementById("is_replied_content");
			const reply_reg_date_content=document.getElementById("reply_reg_date_content");
			
			if(inquiryData.isReplied==0){
				inquiry_reply_context_content.innerHTML='';
				const textarea=document.createElement("textarea");
				textarea.classList.add('form-control');
				inquiry_reply_context_content.appendChild(textarea);
				
				is_replied_content.innerText='미답변';
				reply_reg_date_content.innerText='-';
				
				const modalFooter=document.querySelector('.modal-footer');
				if(modalFooter.classList.contains('visually-hidden')){
    				modalFooter.classList.remove('visually-hidden');
    			}
				
			}else{
				is_replied_content.innerText='답변완료';
				
				const formattedDate = formatDate(new Date(inquiryData.productInquiryReplyDto.product_inquiry_reply_date));
    			reply_reg_date_content.textContent = formattedDate;
    			
    			inquiry_reply_context_content.innerText=inquiryData.productInquiryReplyDto.product_inquiry_reply_context;
    			
    			const modalFooter=document.querySelector('.modal-footer');
    			if(!modalFooter.classList.contains('visually-hidden')){
    				modalFooter.classList.add('visually-hidden');
    			}
    			
			}
			
			inquiryModal.style.display="block";
		}
		
		function registerInquiryReply() {
			const textarea=document.querySelector("textarea");
			const inquiryNoInput=document.querySelector('input[name="inquiry_no"]');
			
			const reply_context=textarea.value;
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	
	            	loadNewInquiryTab();
	            	const inquiry_reply_context_content=document.getElementById("inquiry_reply_context_content");
	    			const is_replied_content=document.getElementById("is_replied_content");
	    			const reply_reg_date_content=document.getElementById("reply_reg_date_content");
	    			
	    			inquiry_reply_context_content.innerHTML='';
	    			is_replied_content.innerHTML='';
	    			
	    			is_replied_content.textContent="답변완료";
	    			inquiry_reply_context_content.textContent=reply_context;
	    			
	    			const formattedDate = formatDate(new Date());
	    			reply_reg_date_content.textContent = formattedDate;
	            		    
	            }
	        }
	
		
	        xhr.open("post", "./registerInquiryReply");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("product_inquiry_no="+inquiryNoInput.value+"&product_inquiry_reply_context="+reply_context);
		}
		function loadInquiryTable(response){
			const inquiryList=document.getElementById('inquiryList');
			inquiryList.innerHTML='';
        	
			const col=document.createElement("div");
			col.classList.add("col");
			inquiryList.appendChild(col);
			
			const div=document.createElement("div");
			div.classList.add("table-responsive");
			inquiryList.appendChild(div);
			
			var table = document.createElement("table");
		    table.classList.add("table", "text-nowrap", "table-bordered");

		    var thead = document.createElement("thead");
		    thead.classList.add("table-light");
		    var tbody = document.createElement("tbody");
		    
		    var tableHeaders = ["상품문의번호", "상품명", "문의제목", "작성자", "등록일", "문의상세"];
			
		    var headerRow = document.createElement("tr");
		    for (tableHeader of tableHeaders) {
		      var th = document.createElement("th");
		      th.textContent = tableHeader;
		      headerRow.appendChild(th);
		    }
		    thead.appendChild(headerRow);
		    
        	for(inquiry of response.inquiryList){
        		
        		const tr = document.createElement("tr");

        		
        		const inquiryNoTd = document.createElement("td");
        		inquiryNoTd.textContent = inquiry.productInquiryDto.product_inquiry_no;
        		tr.appendChild(inquiryNoTd);

        		const productNameTd = document.createElement("td");
        		productNameTd.textContent = inquiry.productDto.product_name;
        		tr.appendChild(productNameTd);

        		const inquiryTitleTd = document.createElement("td");
        		inquiryTitleTd.textContent = inquiry.productInquiryDto.product_inquiry_title;
        		tr.appendChild(inquiryTitleTd);

        		const customerNameTd = document.createElement("td");
        		customerNameTd.textContent = inquiry.customerDto.customer_name;
        		tr.appendChild(customerNameTd);


        		const inquiryRegDateTd = document.createElement("td");
        		const formattedDate = formatDate(new Date(inquiry.productInquiryDto.product_inquiry_reg_date));
        		inquiryRegDateTd.textContent = formattedDate;
        		tr.appendChild(inquiryRegDateTd);
        		
        		const inquiryDetailTd = document.createElement("td");
        		const button=document.createElement("button");
        		button.classList.add('btn','btn-outline-dark','btn-sm');
        		button.setAttribute("data-bs-toggle", "modal");
        		button.setAttribute("data-bs-target", "#inquiryModal");
        		button.addEventListener('click',function(){
        			showModal(inquiry);
        			});
        		button.innerText='문의보기';
        		
        		inquiryDetailTd.appendChild(button)
        		tr.appendChild(inquiryDetailTd);

        		tbody.appendChild(tr);
        		
        		
        	}
        	
        	table.appendChild(thead);
        	table.appendChild(tbody);
        	
        	div.appendChild(table);
        	
		}
		
		
		
		
		function loadNewInquiryTab() {
			
			const newInquiryTab=document.getElementById("newInquiryTab");
			if (!newInquiryTab.classList.contains('border-bottom')) {
				newInquiryTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
			const completeInquiryTab = document.getElementById("completeInquiryTab");
			if (completeInquiryTab.classList.contains('border-bottom')) {
				completeInquiryTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
		
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadInquiryTable(response);
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getNewInquiry");
	        xhr.send();
			
		}
		
		function loadCompleteInquiryTab() {
			
			const newInquiryTab=document.getElementById("newInquiryTab");
			if (newInquiryTab.classList.contains('border-bottom')) {
				newInquiryTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
			const completeInquiryTab = document.getElementById("completeInquiryTab");
			if (!completeInquiryTab.classList.contains('border-bottom')) {
				completeInquiryTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
			}
			
			
			
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadInquiryTable(response);
	            	
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getCompleteInquiry");
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