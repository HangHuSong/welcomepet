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
<link
	href="https://cdn.jsdelivr.net/npm/font-awesome@5.15.4/css/fontawesome.min.css"
	rel="stylesheet">

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
					<div class="col text-center">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row mx-5 text-center">
					<div class="col">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">리뷰관리</div>
						</div>
						<div class="row my-2 bg-light px-5">
							<div class="col">
								<div class="row mt-5">
									<div class="col">
										<div class="row border bg-white">
											<div class="col-3 border-end py-2">조회기간</div>
											<div class="col py-2 text-start">
												<input type="date" id="start_date">~<input
													type="date" id="end_date">
											</div>
										</div>
										<div class="row justify-content-center my-5">
											<div class="col-2 d-grid">
												<button class="btn btn-dark" onclick="getReviewListByDate()">검색</button>
											</div>
											<div class="col-2 d-grid">
												<button class="btn btn-outline-dark" onclick="resetSelect()">초기화</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row my-5">
							<div class="col">
								<div class="row" id="orderList">
									<div class="col">
										<div class="table-responsive">
											<table class="table text-nowrap table-bordered">
												<thead class="table-light">
													<tr>
														<th scope="col">구매자평점</th>
														<th scope="col">상품번호</th>
														<th scope="col">상품명</th>
														<th scope="col">리뷰내용</th>
														<th scope="col">리뷰도움수</th>
														<th scope="col">사진첨부</th>
														<th scope="col">등록자</th>
														<th scope="col">리뷰작성일</th>
														<th scope="col">리뷰보기</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${reviewList }" var="review">
														<tr>

															<td class="text-danger"><c:forEach begin="1" end="5" varStatus="i">
																	<c:if
																		test="${i.count <= review.productReviewDto.product_review_rating}">
																		<i class="fas fa-star"></i>
																	</c:if>
																	<c:if
																		test="${i.count > review.productReviewDto.product_review_rating}">
																		<i class="far fa-star"></i>
																	</c:if>
																</c:forEach></td>
															<td>${review.productOptionDto.product_option_no }</td>
															<td>${review.productOptionDto.product_option_name }</td>
															<td>${review.productReviewDto.product_review_context }</td>
															<td>${review.reviewLikesNum}</td>
															<td><c:if
																	test="${empty review.productReviewImagesDtoList}">
															미포함
														</c:if> <c:if test="${!empty review.productReviewImagesDtoList}">
															포함
														</c:if></td>
															<td>${review.customerDto.customer_nickname }</td>
															<td><fmt:formatDate
																	value="${review.productReviewDto.product_review_reg_date }"
																	pattern="yyyy.MM.dd" /></td>
															<td>
																<button class="btn btn-sm btn-outline-secondary"
																	data-bs-toggle="modal"
																	data-bs-target="#reviewDetailModal"
																	onclick='showModal(${review.jsonData})'>리뷰보기</button>
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
	</div>
	<div class="modal fade" id="reviewDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5">리뷰 상세보기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-start">
					<div class="row my-2 mx-2">
						<div class="col border">
							<div class="row">
								<div class="col bg-light">
									<div class="row border-bottom">
										<div class="col-2 py-2 border-end">상품명</div>
										<div class="col bg-white py-2" id="productName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-2 py-2 border-end">작성자</div>
										<div class="col bg-white py-2 border-end"
											id="customerNickName"></div>
										<div class="col-2 py-2 border-end">작성일</div>
										<div class="col bg-white py-2" id="reviewRegDate"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-2 py-2 border-end">옵션</div>
										<div class="col bg-white py-2" id="productOptionName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-2 py-2 border-end">별점</div>
										<div class="col bg-white text-danger py-2" id="rating"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-2 bg-light border-end py-2 align-self-center">내용</div>
										<div class="col bg-white py-2" id="reviewContext"></div>
									</div>
									<div class="row" id="reviewImages">
										<div class="col-2 py-2 border-end align-self-center">리뷰이미지</div>
									</div>
								</div>
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
		function resetSelect(){
			const startDateInput=document.getElementById("start_date");
			const endDateInput=document.getElementById("end_date");
			
			startDateInput.value="";
			endDateInput.value="";
		}
		function showModal(reviewData){
			
			const reviewImages=document.getElementById("reviewImages");
			reviewImages.innerHTML='';
			
			const imageTitleCol=document.createElement('div');
			imageTitleCol.classList.add('col-2', 'py-2', 'border-end', 'align-self-center');
			imageTitleCol.innerText='이미지';
			
			reviewImages.appendChild(imageTitleCol);
			
			if(reviewData.productReviewImagesDtoList!=null){
				for(productReviewImageDto of reviewData.productReviewImagesDtoList){
					const col=document.createElement('div');
					col.classList.add('col-2','px-0');
					reviewImages.appendChild(col);
					
					const img=document.createElement('img');
					img.classList.add('w-100');
					img.src="/uploadFiles/WelcomePet/"+productReviewImageDto.product_review_images_link;
					col.appendChild(img);
					
					const col2=document.createElement('div');
					col2.classList.add('col','px-0','bg-white');
					reviewImages.appendChild(col2);
				}
			}
			
	        const productName = document.getElementById("productName");
	        productName.innerText = reviewData.productDto.product_name;
			
	        const productOptionName = document.getElementById("productOptionName");
	        if (reviewData.productOptionNum != 1) {
	            productOptionName.innerText = reviewData.productOptionDto.product_option_name;
	        }else{
	        	productOptionName.innerText ="-";
	        }
	
	        
	        const reviewRegDate = document.getElementById("reviewRegDate");
	        const formattedDate = formatDate(new Date(reviewData.productReviewDto.product_review_reg_date));
	        reviewRegDate.innerText = formattedDate;
	
	        const customerNickName = document.getElementById("customerNickName");
	        customerNickName.innerText = reviewData.customerDto.customer_nickname;
	
	        const rating = document.getElementById("rating");
	        rating.innerHtml='';
	        for(var star=1;star<=reviewData.productReviewDto.product_review_rating;star++){
	        	const starIcon=document.createElement('i');
	        	starIcon.classList.add('fas','fa-star');
	        	rating.appendChild(starIcon);
	        }
	        for(var star=1;star<=5-reviewData.productReviewDto.product_review_rating;star++){
	        	const starIcon=document.createElement('i');
	        	starIcon.classList.add('far','fa-star');
	        	rating.appendChild(starIcon);
	        }
	        const textNode = document.createTextNode(reviewData.productReviewDto.product_review_rating);
	        rating.appendChild(textNode);
	
	        const reviewContext = document.getElementById("reviewContext");
	        reviewContext.innerText = reviewData.productReviewDto.product_review_context;
	
	
	        const reviewDetailModal = document.getElementById("reviewDetailModal");
	        reviewDetailModal.style.display='block';
		}
		function getReviewListByDate(){
			const startDateInput=document.getElementById("start_date");
			const endDateInput=document.getElementById("end_date");
			
			var start_date=formatDate(new Date(startDateInput.value));
			var end_date=formatDate(new Date(endDateInput.value));
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response=JSON.parse(xhr.responseText);
	            	loadReviewTable(response);
	
	            }
	        }
	
		
	        xhr.open("post", "./getReviewListByDate");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("start_date="+start_date + "&end_date=" + end_date);
		}
		function loadReviewTable(response){
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
		    
		    

		    var tableHeaders = ["구매자평점", "상품번호", "상품명", "리뷰내용", "리뷰도움수", "사진첨부", "등록자", "리뷰작성일", "리뷰보기"];
			
		    var headerRow = document.createElement("tr");
		    
		    
		    for (tableHeader of tableHeaders) {
		      var th = document.createElement("th");
		      th.textContent = tableHeader;
		      headerRow.appendChild(th);
		    }
		    thead.appendChild(headerRow);
		    
        	for(review of response.reviewList){
        		
        		const tr = document.createElement("tr");

        		const reviewRatingTd = document.createElement("td");
        		for(var i=1;i<=5;i++){
        			const starIcon=document.createElement("i");
        			
        			if(i<=review.productReviewDto.product_review_rating){
        				starIcon.classList.add("fas");
        				
        			}else{
        				starIcon.classList.add("far");
        			}
        			starIcon.classList.add("fa-star");
        			reviewRatingTd.appendChild(starIcon);
        		}
        		
        		tr.appendChild(reviewRatingTd);
        		
        		const reviewProductNoTd = document.createElement("td");
        		reviewProductNoTd.textContent = review.productReviewDto.order_product_no;
        		tr.appendChild(reviewProductNoTd);

        		const reviewProductNameTd = document.createElement("td");
        		reviewProductNameTd.textContent = review.productOptionDto.product_option_name;
        		tr.appendChild(reviewProductNameTd);

        		const reviewContextTd = document.createElement("td");
        		reviewContextTd.textContent = review.productReviewDto.product_review_context;
        		tr.appendChild(reviewContextTd);
        		
        		const reviewLikesTd = document.createElement("td");
        		reviewLikesTd.textContent = review.reviewLikesNum;
        		tr.appendChild(reviewLikesTd);
        		
        		const reviewImagesTd = document.createElement("td");
        		if(review.productReviewImagesDtoList==null){
        			reviewImagesTd.textContent = '미포함';
        		}else{
        			reviewImagesTd.textContent = '포함';
        		}
        		tr.appendChild(reviewImagesTd);
        		
        		const customerNameTd = document.createElement("td");
        		customerNameTd.textContent = review.customerDto.customer_name;
        		tr.appendChild(customerNameTd);


        		const reviewRegDateTd = document.createElement("td");
        		const formattedDate = formatDate(new Date(review.productReviewDto.product_review_reg_date));
        		reviewRegDateTd.textContent = formattedDate;
        		tr.appendChild(reviewRegDateTd);

        		
        		const reviewDetailTd = document.createElement("td");
        		
				const button=document.createElement("button");
        		
        		button.classList.add('btn', 'btn-sm', 'btn-outline-secondary');
        		button.setAttribute('data-bs-toggle','modal');
        		button.setAttribute('data-bs-target','#reviewDetailModal');
        		button.addEventListener('click',function(){
        			showModal(review);
        		});
        		button.innerText="리뷰상세";
        		reviewDetailTd.appendChild(button);
        		
        		tr.appendChild(reviewDetailTd);
        		
        		
        		tbody.appendChild(tr);
        		
        		
        	}
        	
        	table.appendChild(thead);
        	table.appendChild(tbody);
        	
        	div.appendChild(table);
        	
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