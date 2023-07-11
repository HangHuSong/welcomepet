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
					<div class="col fs-4 fw-bold text-start">광고상품 등록</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="row my-3 border">
							<div class="col">
								<div class="row py-2">
									<div class="col">광고 카테고리</div>
									<div class="col">
										<select class="form-select" name="ad_category_no"
											onchange="getAdPrice()">
											<option selected>카테고리를 선택하세요</option>
											<c:forEach items="${adCategoryDtoList }" var="adCategoryDto">
												<option value="${adCategoryDto.ad_category_no }"
													data-price="${adCategoryDto.ad_category_price }">${adCategoryDto.ad_category_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row py-2">
									<div class="col">일당 가격:</div>
									<div class="col" id="adPrice"></div>
								</div>
							</div>
						</div>
						<div class="row my-3">
							<div class="col">
								<div class="row py-2">
									<div class="col text-start fs-5">상품 선택</div>
								</div>
								<div class="row">
									<div class="col table-responsive">
										<table class="table align-middle  table-bordered">
											<thead>
												<tr>
													<th scope="col"><input class="form-check-input"
														type="checkbox"></th>
													<th scope="col">상품번호</th>
													<th scope="col">상품썸네일</th>
													<th scope="col">상품명</th>
													<th scope="col">가격</th>
													<th scope="col">할인율</th>
												</tr>
											</thead>
											<tbody class="table-group-divider">

												<c:forEach items="${productDataList }" var="productData">
													<tr>
														<th scope="row"><input class="form-check-input"
															type="checkbox"
															value="${productData.productDto.product_no }"></th>
														<td>${productData.productDto.product_no }</td>
														<td class="col-1"><img
															src="/uploadFiles/productThumbnailImg/${productData.productDto.product_thumbnail }"
															class="w-100"></td>
														<td>${productData.productDto.product_name }</td>
														<td>${productData.productDto.product_price}</td>
														<td>${productData.productDto.product_discount_rate}</td>
														
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
						<div class="row my-3 border">
							<div class="col">
								<div class="row py-2">
									<div class="col">광고 시작일</div>
									<div class="col">
										<input class="form-control" type="date"
											name="ad_product_start_date">
									</div>
								</div>
								<div class="row py-2">
									<div class="col">광고 종료일</div>
									<div class="col">
										<input class="form-control" type="date"
											name="ad_product_end_date">
									</div>
								</div>
							</div>
						</div>
						<div class="row py-3 border">
							<div class="col">
								<div class="row">
									<div class="col">총 금액</div>
									<div class="col">
										<button class="btn btn-sm btn-primary"
											onclick="getTotalPrice()">조회하기</button>
									</div>
								</div>
							</div>
							<div class="col" id="totalPrice"></div>
						</div>
						<div class="row my-3">
							<div class="col">
								<button class="btn btn-primary" onclick="requestPay()">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
		integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC"
		crossorigin="anonymous"></script>
	<script>
		
		Kakao.init('d62878260103ab0e7c7d176b029a8aa6');
		
		
		
		function requestPay() {
			const selectEl = document.querySelector('select[name="ad_category_no"]');
			const selectedOption = selectEl.options[selectEl.selectedIndex];
			const checkedProducts = document.querySelectorAll('input[type="checkbox"]:checked');
			
			productNoList=[]
			for(checkedProduct of checkedProducts){
				productNoList.push(checkedProduct.value);
			}
			sessionStorage.setItem('productNoList',productNoList);
			
			var ad_price = selectedOption.dataset.price;
			sessionStorage.setItem('adCategoryNo',selectedOption.value);
			
			var startDateInput=document.querySelector('input[name="ad_product_start_date"]');
			var endDateInput=document.querySelector('input[name="ad_product_end_date"]');
			
			var startDate = new Date(startDateInput.value);
			startDate.setHours(0, 0, 0, 0);
			sessionStorage.setItem('startDate',startDate.toISOString());
			
			var endDate = new Date(endDateInput.value);
			endDate.setHours(23, 59, 59, 59);
			sessionStorage.setItem('endDate',endDate.toISOString());
			
			var time_diff = endDate.getTime() - startDate.getTime();
			var date_diff = parseInt(Math.floor(time_diff / (1000 * 3600 * 24))) + 1;
			
			
			var total_price = checkedProducts.length * ad_price*date_diff;
			
			
			
			
			
			var paymentRequestVal = {
	                cid: 'TC0ONETIME',
	                partner_order_id: "1",
	                partner_user_id: "${sessionUser.biz_no}",
	                item_name: selectedOption.innerText,
	                item_code:selectedOption.value,
	                quantity: checkedProducts.length,
	                total_amount: total_price,
	                tax_free_amount:0,
	                approval_url:'http://localhost:8181/welcomepet/biz/adProductRegister?alert=approve',
	                cancel_url:"http://localhost:8181/welcomepet/biz/adProductRegister?alert=cancel",
	                fail_url:"http://localhost:8181/welcomepet/biz/adProductRegister?alert=fail"
	               
	         };
			
			var keyVals=['cid','partner_order_id','cid','partner_user_id','item_name','quantity','total_amount','tax_free_amount','approval_url','cancel_url','fail_url']
			
			paymentRequest="";
			
			for(keyVal of keyVals){
				paymentRequest+=keyVal+"="+paymentRequestVal[keyVal]+"&";
			}
			
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	
	            	var left = (window.innerWidth - 700) / 2;
	            	var top = (window.innerHeight - 800) / 2;
	            	var popup=window.open(response.next_redirect_pc_url,"Popup","width=700,height=800,left="+left+",top="+top);
	            	sessionStorage.setItem('tid', response.tid);
	            	
	            	if(popup){
	            		var intervalId=setInterval(function(){
		            		if(popup.location.href.includes(paymentRequestVal.approval_url)){
		            			window.location.href=popup.location.href;
		            			clearInterval(intervalId);
		            			popup.close();
		            		}
		            	},500);
	            	}
	            	
	            }
	        }
	
	        
	       
	        xhr.open("post", "https://kapi.kakao.com/v1/payment/ready");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.setRequestHeader("Authorization", "KakaoAK bd2ebf176a86be77adf9243df7d009c2");
	        xhr.send(paymentRequest);
			
			
		}
		
		
	    var alert = urlParams.get('alert');
	    if(alert=='approve'){
	    	approvePay()
	    }else if(alert=='cancel'){
	    	alert('결제 취소');
	    }else if(alert=='fail'){
	    	alert('결제 실패');
	    }
	    
		function approvePay() {
			
		    	var pg_token=urlParams.get('pg_token');
		    	var partner_order_id= "1";
	            var partner_user_id="${sessionUser.biz_no}";
	            var tid = sessionStorage.getItem('tid');
	            sessionStorage.removeItem('tid');
	            
				var payApproval="cid=TC0ONETIME&tid="+tid+"&pg_token="+pg_token+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id;
				
			
				
				const xhr = new XMLHttpRequest();
				
		        xhr.onreadystatechange = function () {
		            if (xhr.readyState == 4 && xhr.status == 200) {
		            	const response = JSON.parse(xhr.responseText);
		            	createPayment(response); 
		            	
		            }
		        }
		
		        
		        
		        xhr.open("post", "https://kapi.kakao.com/v1/payment/approve");
		        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		        xhr.setRequestHeader("Authorization", "KakaoAK bd2ebf176a86be77adf9243df7d009c2");
		        xhr.send(payApproval);
		    	
		    
			
		}
		
		function createPayment(response){
			
			
			var biz_no="${sessionUser.biz_no}"
			
			
			var ad_payment="ad_payment_tid="+response.tid
				+"&biz_no="+biz_no
				+"&ad_payment_method_type="+response.payment_method_type
				+"&ad_payment_price="+response.amount.total
				+"&ad_payment_quantity="+response.quantity
				+"&adPaymentCreatedDate="+response.created_at
				+"&adPaymentApprovedDate="+response.approved_at;
			
		
			var product_no_list=sessionStorage.getItem("productNoList");
			var ad_product_start_date=sessionStorage.getItem("startDate");
			var ad_product_end_date=sessionStorage.getItem("endDate");
			var category_no=sessionStorage.getItem("adCategoryNo");
			
		
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            
	            	sessionStorage.removeItem('productNoList');
	            	sessionStorage.removeItem('startDate');
	            	sessionStorage.removeItem('endDate');
	            	sessionStorage.removeItem('adCategoryNo');
	            }
	        }
	
	        
	        
	        xhr.open("post", "./createAdPayment");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send(ad_payment+"&product_no_list="+product_no_list+"&ad_product_start_date="+ad_product_start_date+"&ad_product_end_date="+ad_product_end_date+"&category_no="+category_no);
		}
		
		
		function getAdPrice() {
			const selectEl = document.querySelector('select[name="ad_category_no"]');
			const selectedOption = selectEl.options[selectEl.selectedIndex];
			const checkedProducts = document.querySelectorAll('input[type="checkbox"]:checked');
			
			var ad_price = selectedOption.dataset.price;
			
			const adPrice = document.getElementById("adPrice");
			adPrice.innerText = ad_price;
		
			
		}

		function getTotalPrice() {
			const selectEl = document.querySelector('select[name="ad_category_no"]');
			const selectedOption = selectEl.options[selectEl.selectedIndex];
			const checkedProducts = document.querySelectorAll('input[type="checkbox"]:checked');
			
			var ad_price = selectedOption.dataset.price;
			
			var startDateInput=document.querySelector('input[name="ad_product_start_date"]');
			var endDateInput=document.querySelector('input[name="ad_product_end_date"]');
			
			var startDate = new Date(startDateInput.value);
			startDate.setHours(0, 0, 0, 0);
			
			var endDate = new Date(endDateInput.value);
			endDate.setHours(0, 0, 0, 0);
			
			var time_diff = endDate.getTime() - startDate.getTime();
			var date_diff = time_diff / (1000 * 3600 * 24) + 1;
		
			
			var total_price = checkedProducts.length * ad_price*date_diff;
			
			const totalPrice = document.getElementById("totalPrice");
			totalPrice.innerText = total_price;
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>