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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">

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

.payment-btn {
	width: 100%;
	height: 3em;
	margin: 5px 0;
	border-radius: 0.3rem;
	background-color: white;
	border: 1px solid rgb(194, 200, 207);
	cursor: pointer;
	border-style:;
	cursor: pointer;
	margin: 5px 0;
	font-weight: 500;
}

.payment-btn.active {
	background-color: rgb(237, 244, 255);
	border: 1px solid rgb(0, 80, 255);
}

.pay_img {
	height: 50%;
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
				<div class="row px-5 text-start mb-5">
					<div class="col-9 px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold py-3">광고상품 등록</div>
						</div>
						<div class="row pe-5">
							<div class="col">
								<div class="row my-5">
									<div class="col">
										<div class="row py-2">
											<div class="col fw-bold text-start" style="font-size: 18px;">광고
												카테고리 선택</div>
										</div>
										<div class="row">
											<div class="col border">
												<div class="row border-bottom"
													style="background-color: rgb(245, 250, 255);">
													<div class="col-3 py-2 align-self-center">광고 카테고리</div>
													<div class="col border-start py-2 bg-white">
														<select class="form-select" name="ad_category_no"
															onchange="getAdPrice()">
															<option selected>카테고리를 선택하세요</option>
															<c:forEach items="${adCategoryDtoList }"
																var="adCategoryDto">
																<option value="${adCategoryDto.ad_category_no }"
																	data-price="${adCategoryDto.ad_category_price }">${adCategoryDto.ad_category_name }</option>
															</c:forEach>
														</select>
													</div>
													<div class="col bg-white"></div>
												</div>
												<div class="row border-bottom" style="background-color: rgb(245, 250, 255);">
													<div class="col-3 py-2">일당 가격</div>
													<div class="col py-2 border-start bg-white" id="adPrice"></div>
													<div class="col bg-white"></div>
												</div>
												<div class="row" style="background-color: rgb(245, 250, 255);">
													<div class="col-3 py-2 align-self-center">광고 기간</div>
													<div class="col bg-white">
														<div class="row">
															<div class="col border-start py-2">
																<input class="form-control" type="date"
																	name="ad_product_start_date">
															</div>
															<div class="col-1 align-self-center text-center">~</div>
															<div class="col py-2">
																<input class="form-control" type="date"
																	name="ad_product_end_date">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row my-3 text-center">
									<div class="col">
										<div class="row py-2">
											<div class="col-2 text-start fw-bold"
												style="font-size: 18px;">상품 선택</div>
											<div class="col text-end">
												<button class="btn btn-primary btn-sm"
													onclick="addAdProductCart()">추가하기</button>
											</div>
										</div>
										<div class="row">
											<div class="col bg-white px-0">
												<div class="table-responsive" style="height: 450px;">
													<table
														class="table text-nowrap align-middle table-bordered">
														<thead style="background-color: rgb(245, 250, 255);">
															<tr>
																<th scope="col"><input class="form-check-input"
																	type="checkbox"></th>
																<th scope="col">상품번호</th>
																<th scope="col">상품이미지</th>
																<th scope="col">상품명</th>
																<th scope="col">상품가격</th>
																<th scope="col">상품할인율</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${productDataList }" var="productData">
																<tr>
																	<th scope="row"><input class="form-check-input"
																		type="checkbox"
																		value="${productData.productDto.product_no }"></th>
																	<td>${productData.productDto.product_no }</td>
																	<td class="col-1"><img
																		src="/uploadFiles/productThumbnailImg/${productData.productDto.product_thumbnail }"
																		class="w-100"></td>
																	<td class="productName">${productData.productDto.product_name }</td>
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
								</div>
								<div class="row my-5">
									<div class="col">
										<div class="row">
											<div class="col text-start fw-bold" style="font-size: 18px;">결제수단
												선택</div>
										</div>
										<div class="row">
											<div class="col">
												<button class="payment-btn" data-payment-method="카카오페이"
													onclick="toggleActive(event)">
													<img
														class="pay_img align-items-center justify-content-center"
														src="/uploadFiles/WelcomePet/payment/kakao.png">
												</button>
											</div>
										</div>
										<div class="row">
											<div class="col-6">
												<button class="payment-btn" data-payment-method="신용카드"
													onclick="toggleActive(event)">신용카드</button>
											</div>
											<div class="col-6">
												<button class="payment-btn" data-payment-method="네이버페이"
													onclick="toggleActive(event)">
													<img
														class="pay_img align-items-center justify-content-center"
														src="/uploadFiles/WelcomePet/payment/naver.png">
												</button>
											</div>
											<div class="col-6">
												<button class="payment-btn" data-payment-method="토스"
													onclick="toggleActive(event)">
													<img
														class="pay_img align-items-center justify-content-center"
														src="/uploadFiles/WelcomePet/payment/toss.png">
												</button>
											</div>
											<div class="col-6">
												<button class="payment-btn" data-payment-method="페이코"
													onclick="toggleActive(event)">
													<img
														class="pay_img align-items-center justify-content-center"
														src="/uploadFiles/WelcomePet/payment/payco.png"
														style="height: 35%;">
												</button>
											</div>
											<div class="col-6">
												<button class="payment-btn " data-payment-method="가상계좌"
													onclick="toggleActive(event)">가상계좌</button>
											</div>
											<div class="col-6">
												<button class="payment-btn" data-payment-method="계좌이체"
													onclick="toggleActive(event)">계좌이체</button>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-3 position-relative pe-5" id="cart"
						style="height: 1260px;">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col ">
										<div class="position-fixed" id="adProductCart"
											style="width: 310px;"></div>
									</div>
								</div>

								<div class="row position-fixed bottom-0 my-3 ">
									<div class="col">
										<div class="row text-danger" style="width: 310px;">
											<div class="col text-start align-self-center"
												style="font-size: 16px;">
												<span>총 </span> <span id="adProductNum">0</span> <span>개</span>
											</div>
											<div class="col text-end">
												<span class="fs-5 fw-bold" id="totalPrice">0</span> <span
													style="font-size: 18px;">원</span>
											</div>
										</div>
										<div class="row">
											<div class="col text-center px-1">
												<button class="btn btn-danger shadow" style="width: 310px;"
													onclick="requestPay()">결제하기</button>
											</div>
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

	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
		integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC"
		crossorigin="anonymous"></script>
	<script>
	function toggleActive(event){
		const paymentButtons = document.querySelectorAll(".payment-btn");

		// 모든 버튼에서 "active" 클래스 제거
		paymentButtons.forEach((btn) => {
		    btn.classList.remove("active");
		});

		// 클릭한 버튼에 "active" 클래스 추가
		const selectedButton = event.currentTarget;
		selectedButton.classList.add("active");
		
	}
	var adProductDatas=[];
	var total_price=0;
	function addAdProductCart() {
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
	
		for(checkedProduct of checkedProducts){
			var adProductData={
					ad_category_no:selectedOption.value,
					product_no:checkedProduct.value,
					ad_price:ad_price*date_diff,
					ad_product_start_date:startDateInput.value,
					ad_product_end_date:endDateInput.value
			}
			
			adProductDatas.push(adProductData);
			console.log(adProductDatas);
			var imageUrl=checkedProduct.closest('tr').querySelector('img').src;
			var productName=checkedProduct.closest('tr').querySelector('.productName').innerText;
			var adCategoryName=selectedOption.innerText;
			var adDuration=startDateInput.value+"~"+endDateInput.value;
			var productPrice=ad_price*date_diff;
			
			total_price+=productPrice;
			
			// 부모 요소를 가져오기 (예시에서는 class 이름이 "parent-container"인 요소를 가져옴)
			const parentContainer = document.getElementById("adProductCart");

			// 상품 정보를 담을 div 요소 생성
			const productDiv = document.createElement('div');
			productDiv.classList.add('row','px-1','bg-white', 'border','my-2');

			// 이미지 div 요소 생성
			const imageDiv = document.createElement('div');
			imageDiv.classList.add('col-4', 'px-1', 'align-self-center');

			// 이미지 요소 생성
			const imgElement = document.createElement('img');
			imgElement.classList.add('w-100');
			imgElement.src = imageUrl;
			
			// 이미지 요소를 imageDiv의 자식 요소로 추가
			imageDiv.appendChild(imgElement);

			// 상품 정보를 담을 div 요소 생성
			const infoDiv = document.createElement('div');
			infoDiv.classList.add('col-7', 'py-2');

			// 각 상품 정보를 담을 div 요소들 생성 및 추가
			const productNameDiv = createProductInfoDiv(productName);
			productNameDiv.classList.add('productNo');
			productNameDiv.setAttribute('data-value',checkedProduct.value);
			productNameDiv.style='font-size:13px';
			
			const adCategoryDiv = createProductInfoDiv(adCategoryName);
			adCategoryDiv.classList.add('adCategoryNo');
			adCategoryDiv.setAttribute('data-value',selectedOption.value);
			adCategoryDiv.style='font-size:13px';
			
			const adDurationDiv = createProductInfoDiv(adDuration);
			adDurationDiv.style.fontSize='8px';
			adDurationDiv.classList.add('text-secondary');
			adDurationDiv.classList.add('adDuration');
			adDurationDiv.setAttribute('data-startDate-value',startDateInput.value);
			adDurationDiv.setAttribute('data-endDate-value',endDateInput.value);
			
			const productPriceDiv = createProductInfoDiv(productPrice);
			productPriceDiv.classList.add('fw-bold')
			// 상품 정보를 담을 div 요소들을 infoDiv의 자식 요소로 추가
			infoDiv.appendChild(productNameDiv);
			infoDiv.appendChild(adCategoryDiv);
			infoDiv.appendChild(adDurationDiv);
			infoDiv.appendChild(productPriceDiv);
			
			// div 요소 생성
			const divElement = document.createElement('div');
			divElement.classList.add('col-1', 'py-2', 'text-center', 'px-1');

			// 아이콘 요소 생성
			const iconElement = document.createElement('i');
			iconElement.classList.add('fa-solid', 'fa-xmark');

			// 아이콘 요소를 div 요소의 자식 요소로 추가
			divElement.appendChild(iconElement);
			divElement.addEventListener('click',function(){
				deleteAdProduct(event);
			});
			
			// imageDiv와 infoDiv를 상품 정보를 담을 div 요소(productDiv)의 자식 요소로 추가
			productDiv.appendChild(imageDiv);
			productDiv.appendChild(infoDiv);
			productDiv.appendChild(divElement);
			// 최종적으로 상품 정보를 담을 div 요소(productDiv)를 부모 요소(parentContainer)의 자식 요소로 추가
			parentContainer.appendChild(productDiv);

			// 헬퍼 함수: 상품 정보를 담을 div 요소들을 생성하는 함수
			function createProductInfoDiv(data) {
			  const divElement = document.createElement('div');
			  divElement.classList.add('row');

			  const colElement = document.createElement('div');
			  colElement.classList.add('col');
			  colElement.textContent = data;

			  divElement.appendChild(colElement);

			  return divElement;
			}
			
			const adProductNum=document.getElementById("adProductNum");
			adProductNum.innerHTML='';
			adProductNum.innerText=adProductDatas.length;
			
			const totalPrice = document.getElementById("totalPrice");
			totalPrice.innerHTML='';
			totalPrice.innerText = total_price;

		}
		
		
		
		
	}
	
	function deleteAdProduct(event) {
		const deleteButton=event.currentTarget;
		const removeTarget=deleteButton.closest('.row');
		var data={
				ad_category_no:removeTarget.querySelector('.adCategoryNo').dataset.value,
				product_no:removeTarget.querySelector('.productNo').dataset.value,
				ad_product_start_date:removeTarget.querySelector('.adDuration').getAttribute('data-startDate-value'),
				ad_product_end_date:removeTarget.querySelector('.adDuration').getAttribute('data-endDate-value')
		}
		
		const indexToRemove = adProductDatas.findIndex(item => item.ad_category_no === data.ad_category_no && item.product_no === data.product_no && item.ad_product_start_date === data.ad_product_start_date && item.ad_product_end_date === data.ad_product_end_date);
		
		total_price-=adProductDatas[indexToRemove].ad_price;
		
		
		if (indexToRemove !== -1) {
		  adProductDatas.splice(indexToRemove, 1);
		}
		
		
		const adProductNum=document.getElementById("adProductNum");
		adProductNum.innerHTML='';
		adProductNum.innerText=adProductDatas.length;
		
		const totalPrice = document.getElementById("totalPrice");
		totalPrice.innerHTML='';
		totalPrice.innerText = total_price;
		
		removeTarget.remove();
	}
	
	
	
	
		Kakao.init('d62878260103ab0e7c7d176b029a8aa6');
		
		
		
		function requestPay() {
			/* const selectEl = document.querySelector('select[name="ad_category_no"]');
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
			
			
			var total_price = checkedProducts.length * ad_price*date_diff; */
			
			sessionStorage.setItem('adProductDatas',JSON.stringify(adProductDatas));
			
			
			
			var paymentRequestVal = {
	                cid: 'TC0ONETIME',
	                partner_order_id: "1",
	                partner_user_id: "${bizUser.biz_no}",
	                item_name: "어서오개 광고 등록",
	                item_code:1,
	                quantity: adProductDatas.length,
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
			
			console.log(paymentRequest);
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	
	            	var left = (window.innerWidth - 700) / 2;
	            	var top = (window.innerHeight - 800) / 2;
	            	var popup=window.open(response.next_redirect_pc_url,"Popup","width=600,height=700,left="+left+",top="+top);
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
		
		var urlParams= new URLSearchParams(window.location.search);
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
	            var partner_user_id="${bizUser.biz_no}";
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
			
			
			var biz_no="${bizUser.biz_no}"
			
			
			/* var ad_payment="ad_payment_tid="+response.tid
				+"&biz_no="+biz_no
				+"&ad_payment_method_type="+response.payment_method_type
				+"&ad_payment_price="+response.amount.total
				+"&ad_payment_quantity="+response.quantity
				+"&adPaymentCreatedDate="+response.created_at
				+"&adPaymentApprovedDate="+response.approved_at; */
			
			var ad_payment={
						ad_payment_tid:response.tid,
						biz_no:biz_no,
						ad_payment_method_type:response.payment_method_type,
						ad_payment_price:response.amount.total,
						ad_payment_quantity:response.quantity
			};
		
			/* var product_no_list=sessionStorage.getItem("productNoList");
			var ad_product_start_date=sessionStorage.getItem("startDate");
			var ad_product_end_date=sessionStorage.getItem("endDate");
			var category_no=sessionStorage.getItem("adCategoryNo"); */
			
			var ad_product_list=JSON.parse(sessionStorage.getItem('adProductDatas'));
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	sessionStorage.removeItem('adProductDatas');
	            	/* 
	            	sessionStorage.removeItem('productNoList');
	            	sessionStorage.removeItem('startDate');
	            	sessionStorage.removeItem('endDate');
	            	sessionStorage.removeItem('adCategoryNo'); */
	            	alert('광고 상품 등록이 완료 되었습니다');
	            }
	        }
	
	        var data = {
	        	    adPaymentDto: ad_payment,
	        	    adProductDtoList: ad_product_list,
					adPaymentCreatedDate:response.created_at,
					adPaymentApprovedDate:response.approved_at
	        	  };
	        
	        console.log(JSON.stringify(data));
	        
	        xhr.open("post", "./createAdPayment");
	        xhr.setRequestHeader("Content-type", "application/json");
	        /* xhr.send(ad_payment+"&product_no_list="+product_no_list+"&ad_product_start_date="+ad_product_start_date+"&ad_product_end_date="+ad_product_end_date+"&category_no="+category_no); */
	        xhr.send(JSON.stringify(data)); 
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