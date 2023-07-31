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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
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
</style>
</head>
<body>
	<div class="container" style="margin: 0 0;">
		<div class="row" style="width: 1900px;">
			<div class="col-2 text-center ps-4 text-white"
				style="background-color: rgb(29, 33, 42); height: auto;"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 px-0 bg-light">
				<div class="row bg-white ms-1">
					<div class="col text-center">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row mx-5 text-start mb-5">
					<div class="col-10">
						<div class="row my-2">
							<div class="col fs-5 fw-bold py-3">상품 상세/수정</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col" style="font-size: 13px;">
								<div class="row bg-white">
									<div class="col border">
										<div class="row py-2 border-bottom">
											<div class="col fw-bold" style="font-size: 15px;">상품 정보</div>
										</div>
										<div class="row border-bottom">
											<div class="col-3 align-self-center">카테고리</div>
											<div class="col border-start">
												<div class="row">
													<div class="col py-2">
														<span class="py-2" id="categoryContent">${productData.mainCategoryDto.main_category_name }
															&gt; ${productData.subCategoryDto.sub_category_name }</span><span
															class="py-2 mx-4"><button id="categoryModButton"
																class="btn btn-outline-dark btn-sm"
																onclick="makeCategorySelect()">수정</button></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col-3 align-self-center">상품명</div>
											<div class="col border-start">
												<div class="row">
													<div class="col align-self-center py-2">
														<span id="productNameContent">${productData.productDto.product_name }</span>
														<span class="py-2 mx-4"><button
																id="productNameModButton" class="btn btn-outline-dark btn-sm"
																onclick="makeProductNameInput()">수정</button></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-3 align-self-center">상품 정보</div>
											<div class="col border-start">
												<div class="row">
													<div class="col align-self-center py-2"
														id="productDescriptionContent">
														${productData.productDto.product_description }</div>
													<div class="col align-self-center">
														<button id="productDescriptionModButton"
															class="btn btn-outline-dark btn-sm"
															onclick="makeProductDescriptionInput()">수정</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-4">
									<div class="col border bg-white">
										<div class="row border-bottom py-2">
											<div class="col fw-bold" style="font-size: 15px;">판매정보</div>
											<div class="col"></div>
										</div>
										<div class="row border-bottom">
											<div class="col-3 align-self-center">상품 가격</div>
											<div class="col border-start">
												<div class="row py-2">
													<div class="col-3 align-self-center">
														<span id="productPriceContent">${productData.productDto.product_price }</span>
														<span>원</span> <span class="py-2 mx-4"><button
																id="productPriceModButton" class="btn btn-outline-dark btn-sm"
																onclick="makeProductPriceInput()">수정</button></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col-3 align-self-center">상품 배송비</div>
											<div class="col border-start">
												<div class="row py-2">
													<div class="col align-self-center">
														<span id="productShippingPriceContent">${productData.productDto.product_shipping_price }</span>
														<span>원</span> <span class="py-2 mx-4"><button
																id="productShippingPriceModButton"
																class="btn btn-outline-dark btn-sm"
																onclick="makeProductShippingPriceInput()">수정</button></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-3 align-self-center">상품 할인율</div>
											<div class="col border-start">
												<div class="row py-2">
													<div class="col">
														<span id="productDiscountContent">${productData.productDto.product_discount_rate }</span>
														<span>%</span> <span class="py-2 mx-4"><button
																id="productDiscountModButton"
																class="btn btn-outline-dark btn-sm"
																onclick="makeProductDiscountInput()">수정</button></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-4">
									<div class="col border bg-white">
										<div class="row border-bottom py-2">
											<div class="col fw-bold" style="font-size: 15px;">옵션/재고
												설정</div>
										</div>
										<div class="row border-bottom">
											<div class="col-3 align-self-center py-2">상품 타입</div>
											<div class="col border-start py-2">
												<c:choose>
													<c:when test="${productData.productOptionNum eq 1 }">단일상품</c:when>
													<c:otherwise>옵션상품</c:otherwise>
												</c:choose>
											</div>
										</div>
										<c:choose>
											<c:when test="${productData.productOptionNum eq 1 }">
												<div class="row">
													<div class="col-3 align-self-center">상품 재고</div>
													<div class="col border-start">
														<div class="row">
															<div class="col align-self-center py-2">
																<span id="productStockContent">${productData.productOptionDtoList[0].product_option_stock_quantity }</span>
																<span>개</span> <span class="py-2 mx-4"><button
																		id="productStockModButton" class="btn btn-outline-dark btn-sm"
																		onclick="makeProductStockInput(${productData.productOptionDtoList[0].product_option_no})">수정</button></span>
															</div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="row">
													<div class="col" id="productOptionBoxContainer">
														<div class="row">
															<div class="col-3 align-self-center">옵션 입력</div>
															<div class="col border-start py-2">
																<div class="row">
																	<div class="col">
																		<table class="table table-bordered mb-0">
																			<thead class="table-light text-center">
																				<tr>
																					<th scope="col">옵션명</th>
																					<th scope="col">옵션가격</th>
																					<th scope="col">옵션수량</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach
																					items="${productData.productOptionDtoList }"
																					var="productOptionDto">
																					<tr class="productOptionBox text-center">
																						<td><span class="mx-auto"
																							id="optionNameContent${productOptionDto.product_option_no }">${productOptionDto.product_option_name }</span>&nbsp;&nbsp;
																							<span class="py-2 mx-auto"><button
																									id="optionNameModButton${productOptionDto.product_option_no }"
																									class="btn btn-outline-dark btn-sm"
																									onclick="makeOptionNameInput(${productOptionDto.product_option_no })">수정</button></span>
																						</td>
																						<td><span class="mx-auto"
																							id="optionPriceContent${productOptionDto.product_option_no }">${productOptionDto.product_option_price }</span>&nbsp;&nbsp;
																							<span class="py-2 mx-auto"><button
																									id="optionPriceModButton${productOptionDto.product_option_no }"
																									class="btn btn-outline-dark btn-sm"
																									onclick="makeOptionPriceInput(${productOptionDto.product_option_no })">수정</button></span>
																						</td>
																						<td><span class="mx-auto"
																							id="optionStockContent${productOptionDto.product_option_no }">${productOptionDto.product_option_stock_quantity}</span>
																							&nbsp;&nbsp; <span class="py-2 mx-auto"><button
																									id="optionStockModButton${productOptionDto.product_option_no }"
																									class="btn btn-outline-dark btn-sm"
																									onclick="makeOptionStockInput(${productOptionDto.product_option_no })">수정</button></span>
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
											</c:otherwise>
										</c:choose>
									</div>
								</div>


								<div class="row mt-4">
									<div class="col bg-white border">
										<div class="row py-2 border-bottom">
											<div class="col-3 fw-bold" style="font-size: 15px;">상품이미지</div>
											<div class="col"></div>
										</div>
										<div class="row border-bottom">
											<div class="col-3 align-self-center px-2">상품 썸네일</div>
											<div class="col border-start px-0">
												<div class="row" id="thumbnailImageContainer">
													<div class="col-2 position-relative px-0 mx-2">
														<img class="img-thumbnail w-100"
															src="/uploadFiles/productThumbnailImg/${productData.productDto.product_thumbnail}">
														<label
															class="btn btn-secondary opacity-50 deleteButton position-absolute top-0 end-0 justify-content-center"
															onclick="deleteThumbnail(${productData.productDto.product_no})">
															<i class="fas fa-trash-alt"></i>
														</label>
													</div>
												</div>
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col-3 align-self-center px-2">
												상품 대표이미지<label for="mainImageInput" class="btn"> <i
													class="fas fa-plus fa-lg"></i>
												</label> <input type="file" id="mainImageInput"
													style="display: none;" multiple accept="image/*"
													onchange="saveMainImage(event)">
											</div>
											<div class="col border-start px-0">
												<div class="row" id="mainImageContainer">
													<c:forEach items="${productData.productMainImageDtoList}"
														var="productMainImageDto">
														<div class="col-2 position-relative px-0 mx-2">
															<img class="img-thumbnail"
																src="/uploadFiles/productMainImg/${productMainImageDto.product_main_image_link }">
															<label
																class="btn btn-secondary opacity-50 deleteButton position-absolute top-0 end-0 justify-content-center"
																onclick="deleteMainImage(${productMainImageDto.product_main_image_no},event)">
																<i class="fas fa-trash-alt"></i>
															</label>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-3 align-self-center px-2">
												상품 상세이미지<label for="detailImageInput" class="btn"> <i
													class="fas fa-plus fa-lg"></i>
												</label> <input type="file" id="detailImageInput"
													style="display: none;" multiple accept="image/*"
													onchange="saveDetailImage(event)">
											</div>
											<div class="col border-start px-0">
												<div class="row" id="detailImageContainer">
													<c:forEach items="${productData.productDetailImageDtoList}"
														var="productDetailImageDto">
														<div class="col-2 position-relative px-0 mx-2">
															<img class="w-100"
																src="/uploadFiles/productDetailImg/${productDetailImageDto.product_detail_image_link }">
															<label
																class="btn btn-secondary opacity-50 deleteButton position-absolute top-0 end-0 justify-content-center"
																onclick="deleteDetailImage(${productDetailImageDto.product_detail_image_no},event)">
																<i class="fas fa-trash-alt"></i>
															</label>
														</div>
													</c:forEach>
												</div>
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
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->

	<script>
	function deleteDetailImage(product_detail_image_no,event){
			const imgDeleteButton=event.target;
			const xhr = new XMLHttpRequest();
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const deleteElement=imgDeleteButton.closest('.col-2');
	            	deleteElement.remove();
	            	
	            }
	        }
	        xhr.open("get", "./deleteDetailImage?product_detail_image_no="+product_detail_image_no);
	        xhr.send();
		
	}
	
	function saveDetailImage(event){
			files=event.target.files;
			
			const formData=new FormData();
			
			for(file of files){
				formData.append('detailImages[]',file);
			}
			console.log(formData);
			
			formData.append('product_no',"${productData.productDto.product_no}");
			const xhr = new XMLHttpRequest();
		
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					
					const detailImageContainer=document.getElementById("detailImageContainer");
					
					for(detailImageDto of response.productDetailImageDtoList){
						var divElement = document.createElement("div");
						divElement.classList.add("col-2", "position-relative", "px-0", "mx-2");
			
					
						var imgElement = document.createElement("img");
						imgElement.classList.add("img-thumbnail", "w-100");
						imgElement.setAttribute("src", "/uploadFiles/productDetailImg/" + detailImageDto.product_detail_image_link);
			
						
						var labelElement = document.createElement("label");
						labelElement.classList.add("btn", "btn-secondary", "opacity-50", "deleteButton", "position-absolute", "top-0", "end-0", "justify-content-center");
						labelElement.setAttribute("onclick", "deleteDetailImage(" + detailImageDto.product_detail_image_no + ",event)");
			
						
						var iElement = document.createElement("i");
						iElement.classList.add("fas", "fa-trash-alt");
						
						labelElement.appendChild(iElement);
			
					
						divElement.appendChild(imgElement);
						divElement.appendChild(labelElement);
			
						
						detailImageContainer.appendChild(divElement);
					}
					
				}
			}
		
			//get
			xhr.open("post", "./saveDetailImage");
			xhr.send(formData);
		}
		
		function deleteMainImage(product_main_image_no,event){
			const imgDeleteButton=event.target;
			const xhr = new XMLHttpRequest();
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const deleteElement=imgDeleteButton.closest('.col-2');
	            	deleteElement.remove();
	            	
	            }
	        }
	        xhr.open("get", "./deleteMainImage?product_main_image_no="+product_main_image_no);
	        xhr.send();
		
	}
	
	function saveMainImage(event){
		
		files=event.target.files;
		
		const formData=new FormData();
		
		for(file of files){
			formData.append('mainImages[]',file);
		}
		
		formData.append('product_no',"${productData.productDto.product_no}");
		
		
		const xhr = new XMLHttpRequest();
	
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				console.log("메인");
				
				const mainImageContainer=document.getElementById("mainImageContainer");
				console.log(mainImageContainer);
				
				for(mainImageDto of response.productMainImageDtoList){
					console.log(mainImageDto.product_main_image_link);
					
					var divElement = document.createElement("div");
					divElement.classList.add("col-2", "position-relative", "px-0", "mx-2");
		
				
					var imgElement = document.createElement("img");
					imgElement.classList.add("img-thumbnail", "w-100");
					imgElement.setAttribute("src", "/uploadFiles/productMainImg/" + mainImageDto.product_main_image_link);
		
					
					var labelElement = document.createElement("label");
					labelElement.classList.add("btn", "btn-secondary", "opacity-50", "deleteButton", "position-absolute", "top-0", "end-0", "justify-content-center");
					labelElement.setAttribute("onclick", "deleteMainImage(" + mainImageDto.product_main_image_no + ",event)");
		
					
					var iElement = document.createElement("i");
					iElement.classList.add("fas", "fa-trash-alt");
		
					
					labelElement.appendChild(iElement);
		
				
					divElement.appendChild(imgElement);
					divElement.appendChild(labelElement);
		
					mainImageContainer.appendChild(divElement);
				}
				
			}
		}
	
		//get
		xhr.open("post", "./saveMainImage");
		xhr.send(formData);
	}


	function deleteThumbnail(product_no){
		
		const xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function () {
	        if (xhr.readyState == 4 && xhr.status == 200) {
	        	
	        	const thumbnailImageContainer=document.getElementById("thumbnailImageContainer");
	        	thumbnailImageContainer.innerHTML="";
	        	
	        	var divElement = document.createElement("div");
	        	divElement.classList.add("col-2", "align-self-center");
	
	        	
	        	var labelElement = document.createElement("label");
	        	labelElement.setAttribute("for", "imageInput");
	        	labelElement.classList.add("btn");
	
	        	
	        	var iElement = document.createElement("i");
	        	iElement.classList.add("fas", "fa-plus", "fa-lg");
	
	        
	        	var inputElement = document.createElement("input");
	        	inputElement.setAttribute("type", "file");
	        	inputElement.setAttribute("id", "imageInput");
	        	inputElement.style.display = "none";
				inputElement.addEventListener('change',saveThumbnail);
	        	
	        	labelElement.appendChild(iElement);
	
	        
	        	divElement.appendChild(labelElement);
	        	divElement.appendChild(inputElement);
	
	     
	        	thumbnailImageContainer.appendChild(divElement);
	        	
	        	
	        }
	    }
	    xhr.open("get", "./deleteThumbnail?product_no="+product_no);
	    xhr.send();
	
	}
	
	function saveThumbnail(event){
	files=event.target.files[0];
	
	const formData=new FormData();
	formData.append('thumbnail',files);
	formData.append('product_no',"${productData.productDto.product_no}");
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			const response = JSON.parse(xhr.responseText);
			
			const thumbnailImageContainer=document.getElementById("thumbnailImageContainer");
			thumbnailImageContainer.innerHTML="";
			
			
			var divElement = document.createElement("div");
			divElement.classList.add("col-2", "position-relative", "px-0", "mx-2");
	
		
			var imgElement = document.createElement("img");
			imgElement.classList.add("img-thumbnail", "w-100");
			imgElement.setAttribute("src", "/uploadFiles/productThumbnailImg/" + response.productDto.product_thumbnail);
	
			
			var labelElement = document.createElement("label");
			labelElement.classList.add("btn", "btn-secondary", "opacity-50", "deleteButton", "position-absolute", "top-0", "end-0", "justify-content-center");
			labelElement.setAttribute("onclick", "deleteThumbnail(" + response.productDto.product_no + ")");
	
			
			var iElement = document.createElement("i");
			iElement.classList.add("fas", "fa-trash-alt");
	
			
			labelElement.appendChild(iElement);
	
		
			divElement.appendChild(imgElement);
			divElement.appendChild(labelElement);
	
			
			thumbnailImageContainer.appendChild(divElement);
		}
	}
	
	//get
	xhr.open("post", "./saveThumbnail");
	xhr.send(formData);
	}
	
	const productNameModButton=document.getElementById("productNameModButton");
	const categoryModButton = document.getElementById("categoryModButton");
	const productDescriptionModButton=document.getElementById("productDescriptionModButton");
	const productPriceModButton=document.getElementById("productPriceModButton");
	const productShippingPriceModButton=document.getElementById("productShippingPriceModButton");
	const productDiscountModButton=document.getElementById("productDiscountModButton");
	const productStockModButton=document.getElementById("productStockModButton");
	
	
	function makeProductStockInput(product_option_no){
		productStockModButton.parentNode.classList.add('visually-hidden');
        const productStockContent = document.getElementById("productStockContent");
        
		
        const productStockInput = document.createElement('input');
        productStockInput.classList.add('form-control');
        productStockInput.setAttribute('type', 'text');
        productStockInput.value=productStockContent.innerText;
        
        productStockContent.innerHTML = '';

        productStockContent.append(productStockInput);
     
        productStockInput.focus();
        
        
        productStockInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateOptionStock(product_option_no,productStockInput.value);	
        	}
            
        });
	}
	
    
    function makeOptionStockInput(option_no){
    	
    	const optionStockModButton=document.getElementById("optionStockModButton"+option_no);
		optionStockModButton.parentNode.classList.add('visually-hidden');
        const optionStockContent = document.getElementById("optionStockContent"+option_no);
        
		
        const optionStockInput = document.createElement('input');
        optionStockInput.classList.add('form-control');
        optionStockInput.setAttribute('type', 'text');
        optionStockInput.value=optionStockContent.innerText;
        
        optionStockContent.innerHTML = '';

        optionStockContent.append(optionStockInput);
     
        optionStockInput.focus();
        
        
        optionStockInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateOptionStock(option_no,optionStockInput.value);	
        	}
            
        });
	}
	

    function updateOptionStock(product_option_no,product_option_stock_quantity) {
    	
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updateOptionStock");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_option_no="+product_option_no + "&product_option_stock_quantity=" + product_option_stock_quantity);
    }
    
    function makeOptionPriceInput(option_no){
    	
    	const optionPriceModButton=document.getElementById("optionPriceModButton"+option_no);
		optionPriceModButton.parentNode.classList.add('visually-hidden');
        const optionPriceContent = document.getElementById("optionPriceContent"+option_no);
        
		
        const optionPriceInput = document.createElement('input');
        optionPriceInput.classList.add('form-control');
        optionPriceInput.setAttribute('type', 'text');
        optionPriceInput.value=optionPriceContent.innerText;
        
        optionPriceContent.innerHTML = '';

        optionPriceContent.append(optionPriceInput);
     
        optionPriceInput.focus();
        
        
        optionPriceInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateOptionPrice(option_no,optionPriceInput.value);	
        	}
            
        });
	}
	

    function updateOptionPrice(product_option_no,product_option_price) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updateOptionPrice");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_option_no="+product_option_no + "&product_option_price=" + product_option_price);
    }
    
    
    function makeOptionNameInput(option_no){
    	const optionNameModButton=document.getElementById("optionNameModButton"+option_no);
    	optionNameModButton.parentNode.classList.add('visually-hidden');
        const optionNameContent = document.getElementById("optionNameContent"+option_no);
        
		
        const optionNameInput = document.createElement('input');
        optionNameInput.classList.add('form-control');
        optionNameInput.setAttribute('type', 'text');
        optionNameInput.value=optionNameContent.innerText;
        
        optionNameContent.innerHTML = '';

        optionNameContent.append(optionNameInput);
     
        optionNameInput.focus();
        
        
        optionNameInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateOptionName(option_no,optionNameInput.value);	
        	}
            
        });
	}
	

    function updateOptionName(product_option_no,product_option_name) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updateOptionName");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_option_no="+product_option_no + "&product_option_name=" + product_option_name);
    }
    
    
    
    function makeProductDiscountInput(){
    	productDiscountModButton.parentNode.classList.add('visually-hidden');
        const productDiscountContent = document.getElementById("productDiscountContent");
        
		
        const productDiscountInput = document.createElement('input');
        productDiscountInput.classList.add('form-control');
        productDiscountInput.setAttribute('type', 'text');
        productDiscountInput.value=productDiscountContent.innerText;
        
        productDiscountContent.innerHTML = '';

        productDiscountContent.append(productDiscountInput);
     
        productDiscountInput.focus();
        
        
        productDiscountInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateProductDiscount(productDiscountInput.value);	
        	}
            
        });
	}
	

    function updateProductDiscount(product_discount_rate) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updateProductDiscount");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_no=${productData.productDto.product_no}" + "&product_discount_rate=" + product_discount_rate);
    }
	
    function makeProductShippingPriceInput(){
		productShippingPriceModButton.parentNode.classList.add('visually-hidden');
        const productShippingPriceContent = document.getElementById("productShippingPriceContent");
        
		
        const productShippingPriceInput = document.createElement('input');
        productShippingPriceInput.classList.add('form-control');
        productShippingPriceInput.setAttribute('type', 'text');
        productShippingPriceInput.value=productShippingPriceContent.innerText;
        
        productShippingPriceContent.innerHTML = '';

        productShippingPriceContent.append(productShippingPriceInput);
     
        productShippingPriceInput.focus();
        
        
        productShippingPriceInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateProductShippingPrice(productShippingPriceInput.value);	
        	}
            
        });
	}
	

    function updateProductShippingPrice(product_shipping_price) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updateProductShippingPrice");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_no=${productData.productDto.product_no}" + "&product_shipping_price=" + product_shipping_price);
    }
	
    function makeProductPriceInput(){
		productPriceModButton.parentNode.classList.add('visually-hidden');
        const productPriceContent = document.getElementById("productPriceContent");
        
		
        const productPriceInput = document.createElement('input');
        productPriceInput.classList.add('form-control');
        productPriceInput.setAttribute('type', 'text');
        productPriceInput.value=productPriceContent.innerText;
        
        productPriceContent.innerHTML = '';

        productPriceContent.append(productPriceInput);
     
        productPriceInput.focus();
        
        
        productPriceInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateProductPrice(productPriceInput.value);
        		if("${productData.productOptionNum}"==1){
        			updateOptionPrice("${productData.productOptionDto[0].product_option_no}",productPriceInput.value)
            	}
                
        	}
            
        });
	}
	

    function updateProductPrice(product_price) {
    	const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updateProductPrice");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_no=${productData.productDto.product_no}" + "&product_price=" + product_price);
    }
	
    function makeProductDescriptionInput(){
        productDescriptionModButton.parentNode.classList.add('visually-hidden');
        const productDescriptionContent = document.getElementById("productDescriptionContent");
        
		
        const productDescriptionInput = document.createElement('textarea');
        productDescriptionInput.classList.add('form-control');
        
        const parser = new DOMParser();
        const decoded = parser.parseFromString(productDescriptionContent.innerText, 'text/html').documentElement.textContent;
        
        productDescriptionInput.value=decoded;
       
		
        productDescriptionContent.innerHTML = '';
        
        productDescriptionContent.append(productDescriptionInput);
     
        productDescriptionInput.focus();
        
        
        productDescriptionInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateProductDescription(productDescriptionInput.value);	
        	}
            
        });
    }
    function updateProductDescription(product_description){
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updatProductDescription");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_no=${productData.productDto.product_no}" + "&product_description=" + product_description);
    }
	
	function makeProductNameInput(){
		productNameModButton.parentNode.classList.add('visually-hidden');
        const productNameContent = document.getElementById("productNameContent");
        productNameContent.innerHTML = '';
		
        const productNameInput = document.createElement('input');
        productNameInput.classList.add('form-control');
        productNameInput.setAttribute('type', 'text');
        productNameInput.value="${productData.productDto.product_name}";
        
        productNameContent.append(productNameInput);
     
        productNameInput.focus();
        
        
        productNameInput.addEventListener("keydown", function (event) {
        	if(event.key==='Enter'&& !event.shiftKey){
        		updateProductName(productNameInput.value);
        		if("${productData.productOptionNum}"==1){
        			updateOptionPrice("${productData.productOptionDto[0].product_option_name}",productNameInput.value)
            	}
        	}
            
        });
	}
	

    function updateProductName(product_name) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                reloadProductData();
            }
        }


        //get
        xhr.open("post", "./updatProductName");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("product_no=${productData.productDto.product_no}" + "&product_name=" + product_name);
    }
    
    
    function makeCategorySelect() {
    	
    		categoryModButton.parentNode.classList.add('visually-hidden');
    		const categoryContent = document.getElementById("categoryContent");
            categoryContent.innerHTML = '';

            const categorySelectBox = document.createElement('div');
            categorySelectBox.classList.add('row');
            categoryContent.append(categorySelectBox);

            const mainCategoryCol = document.createElement('div');
            mainCategoryCol.classList.add('col');
            categorySelectBox.append(mainCategoryCol);


            const subCategoryCol=document.createElement('div');
            subCategoryCol.classList.add('col');
            categorySelectBox.append(subCategoryCol);


            const mainCategorySelect = document.createElement('select');
            mainCategorySelect.setAttribute('name', 'main_category_no');
            mainCategorySelect.size = 6;
            mainCategorySelect.classList.add('form-select');
            mainCategorySelect.id='mainCategorySelect';
            mainCategoryCol.append(mainCategorySelect);

            const subCategorySelect=document.createElement('select');
            subCategorySelect.setAttribute('name', 'sub_category_no');
            subCategorySelect.size = 6;
            subCategorySelect.classList.add('form-select');
            subCategorySelect.id='subCategorySelect';
            subCategoryCol.append(subCategorySelect);
            
            const xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function () {
            	if (xhr.readyState == 4 && xhr.status == 200) {
            		const response = JSON.parse(xhr.responseText);
                    const optionDefault = document.createElement('option');
                    optionDefault.innerText = '대분류를 선택하세요';
                    optionDefault.value = '';
                    mainCategorySelect.append(optionDefault);


                    for (mainCategoryDto of response.mainCategoryList) {
                    	const optionEl = document.createElement('option');
                        optionEl.innerText = mainCategoryDto.main_category_name;
                        optionEl.value = mainCategoryDto.main_category_no;

                        optionEl.setAttribute('onclick', 'getSubCategoryList('+optionEl.value+')');
                        if ('${productData.mainCategoryDto.main_category_no}' == mainCategoryDto.main_category_no) {
                            optionEl.selected = true;
                            getSubCategoryList(optionEl.value,function(){
                            	var subCategoryNo="${productData.subCategoryDto.sub_category_no}"
                            	const selectedSubOption=subCategorySelect.querySelector('option[value="'+subCategoryNo+'"]');
                            	selectedSubOption.selected=true;
                            });
                   			
                        }
                        mainCategorySelect.append(optionEl);

                    }
                    
                    

                }
            	
              
            }


            //get
            xhr.open("get", "./getMainCategoryList");
            xhr.send();
    		
            
            
            
        	
    	};
    	
    	
	
    function reloadProductData(){
		const categoryContent=document.getElementById('categoryContent');
		categoryContent.innerHTML='';

		const productNameContent=document.getElementById("productNameContent");
        productNameContent.innerHTML='';
        
        const productDescriptionContent=document.getElementById("productDescriptionContent");
        productDescriptionContent.innerHTML='';
        
        const productPriceContent = document.getElementById("productPriceContent");
        productPriceContent.innerHTML = '';
        
        const productShippingPriceContent = document.getElementById("productShippingPriceContent");
        productShippingPriceContent.innerHTML = '';
        
        const productDiscountContent = document.getElementById("productDiscountContent");
        productDiscountContent.innerHTML = '';
        
        
        
        
        
        
        
		const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                
                categoryContent.innerText=response.mainCategoryDto.main_category_name+'>'+response.subCategoryDto.sub_category_name;
           		if(categoryModButton.parentNode.classList.contains('visually-hidden')){
           			categoryModButton.parentNode.classList.remove('visually-hidden');
           		}
           		
           		
           		productNameContent.innerText=response.productDto.product_name;
           		if(productNameModButton.parentNode.classList.contains('visually-hidden')){
                    productNameModButton.parentNode.classList.remove('visually-hidden');
                }
           		
           		
                
           		var product_description=response.productDto.product_description;
                const parser = new DOMParser();
                const decoded = parser.parseFromString(product_description, 'text/html').documentElement.textContent;
           		productDescriptionContent.innerText=decoded;
           		if(productDescriptionModButton.parentNode.classList.contains('visually-hidden')){
           			productDescriptionModButton.parentNode.classList.remove('visually-hidden');
                }
           		
           		productPriceContent.innerText=response.productDto.product_price;
           		if(productPriceModButton.parentNode.classList.contains('visually-hidden')){
           			productPriceModButton.parentNode.classList.remove('visually-hidden');
                }
           		
           		
           		productShippingPriceContent.innerText=response.productDto.product_shipping_price;
           		if(productShippingPriceModButton.parentNode.classList.contains('visually-hidden')){
           			productShippingPriceModButton.parentNode.classList.remove('visually-hidden');
                }
           		
           		productDiscountContent.innerText=response.productDto.product_discount_rate;
           		if(productDiscountModButton.parentNode.classList.contains('visually-hidden')){
           			productDiscountModButton.parentNode.classList.remove('visually-hidden');
                }
           		
           		if(response.productOptionNum==1){
           			
           			const productStockContent = document.getElementById("productStockContent");
           	        productStockContent.innerHTML = '';
           			productStockContent.innerText=response.productOptionDtoList[0].product_option_stock_quantity;
               		if(productStockModButton.parentNode.classList.contains('visually-hidden')){
               			productStockModButton.parentNode.classList.remove('visually-hidden');
                    }
           		}else{
           			for(productOptionDto of response.productOptionDtoList){
           				const optionNameModButton=document.getElementById("optionNameModButton"+productOptionDto.product_option_no);
           				const optionPriceModButton=document.getElementById("optionPriceModButton"+productOptionDto.product_option_no);
           				const optionStockModButton=document.getElementById("optionStockModButton"+productOptionDto.product_option_no);
           				
           				
           				const optionNameContent=document.getElementById("optionNameContent"+productOptionDto.product_option_no);
           		        optionNameContent.innerHTML='';
           				
           				
           		        const optionPriceContent = document.getElementById("optionPriceContent"+productOptionDto.product_option_no);
           		        optionPriceContent.innerHTML = '';
           		        
           		        const optionStockContent = document.getElementById("optionStockContent"+productOptionDto.product_option_no);
           		        optionStockContent.innerHTML = '';
           		        
                        optionNameContent.innerText=productOptionDto.product_option_name;
                   		if(optionNameModButton.parentNode.classList.contains('visually-hidden')){
                   			optionNameModButton.parentNode.classList.remove('visually-hidden');
                        }

                        
                        optionPriceContent.innerText=productOptionDto.product_option_price;
                   		if(optionPriceModButton.parentNode.classList.contains('visually-hidden')){
                   			optionPriceModButton.parentNode.classList.remove('visually-hidden');
                        }
                        
                        
                        optionStockContent.innerText=productOptionDto.product_option_stock_quantity;
                   		if(optionStockModButton.parentNode.classList.contains('visually-hidden')){
                   			optionStockModButton.parentNode.classList.remove('visually-hidden');
                        }
           				
           				
           			}
           			
           		}
           		
                
                
            }
        }


        //get
        xhr.open("get", "./getProductDataByNo?product_no=${productData.productDto.product_no}");
        xhr.send();
    }
    
    function getSubCategoryList(main_category_no,callback) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                updateSubCategoryList(response);
                if (typeof callback === 'function') {
                    callback();
                  }
            }
        }


        //get
        xhr.open("get", "./getSubCategoryListByMainCategoryNo?main_category_no=" + main_category_no);
        xhr.send();
       
    }

    function updateSubCategoryList(result) {
        const subCategorySelect = document.getElementById("subCategorySelect");
        subCategorySelect.innerHTML = '';

        const defaultoption = document.createElement("option");
        defaultoption.innerText = "소분류 카테고리 선택";
        defaultoption.setAttribute("value", "");

        subCategorySelect.appendChild(defaultoption);


        for (subCategory of result.subCategoryList) {
            const option = document.createElement("option");
            option.innerText = subCategory.sub_category_name;
            option.setAttribute("value", subCategory.sub_category_no);
			option.addEventListener('click',function(){
        		
        		const xhr = new XMLHttpRequest();

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                   		reloadProductData();
                    }
                }


                xhr.open("post","./updateProductSubCategory");
        		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        		xhr.send("product_no=${productData.productDto.product_no}"+"&sub_category_no="+option.value);
			});
            subCategorySelect.appendChild(option);
        }
    }
     


     
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>