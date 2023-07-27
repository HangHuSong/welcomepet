<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<div class="row px-5 text-center mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">상품목록</div>
						</div>
						<div class="row my-4 text-start border py-3 px-2 bg-white shadow rounded-3">
							<div class="col align-self-center">
								<span class="px-3 border-end text-center"><span>전체
								</span><span class="text-info">${productNumPerStatus.ALL_PRODUCT }</span><span>건</span></span>
								<span class="px-3 border-end"><span>판매중 </span><span
									class="text-info">${productNumPerStatus.IN_STOCK_PRODUCT }</span><span>건</span></span>
								<span class="px-3 border-end"><span>품절 </span><span
									class="text-info">${productNumPerStatus.OUT_OF_STOCK_PRODUCT }</span><span>건</span></span>
							</div>
							<div class="col text-end">
								<a class="btn btn-primary btn-sm">상품등록</a>
							</div>
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
						<div class="row mt-4 mb-2 text-start">
							<div class="col border rounded-3 shadow"
								style="background-color: rgb(255, 255, 250);">
								<div class="row py-2 px-2">
									<div class="col align-self-center">
										<i class="fas fa-exclamation-circle"></i> 도움말
									</div>
								</div>
								<div class="row pb-2 px-2">
									<div class="col" style="font-size: 12px;">-상세보기에서 상품 수정이 가능합니다.</div>
								</div>
							</div>
						</div>
						<div class="row text-center">
							<div class="col">
								<div class="row">
									<div class="col text-start py-2 px-0">
										<span><span>[총 </span><span class="text-info">${productNumPerStatus.ALL_PRODUCT }</span><span>개]</span></span>
									</div>
								</div>
								<div class="row bg-white shadow">
									<div class="col px-0">
										<div class="table-responsive" style="height: 450px;">
											<table class="table align-middle table-bordered">
												<thead style="background-color: rgb(245, 250, 255);">
													<tr>
														<th scope="col">상품번호</th>
														<th scope="col">상품썸네일</th>
														<th scope="col">상품타입</th>
														<th scope="col">상품명</th>
														<th scope="col">재고수량</th>
														<th scope="col">판매가</th>
														<th scope="col">할인율</th>
														<th scope="col">등록일</th>
														<th scope="col">상세보기</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${productDataList }" var="productData">
														<c:choose>
															<c:when test="${productData.productOptionNum != 1 }">
																<c:forEach items="${productData.productOptionDtoList}"
																	var="productOptionDto">
																	<tr>
																		<td>${productOptionDto.product_option_no }</td>
																		<td class="col-1"><img
																			src="/uploadFiles/productThumbnailImg/${productData.productDto.product_thumbnail }"
																			class="w-100"></td>
																		<td>옵션상품</td>
																		<td>${productOptionDto.product_option_name}</td>
																		<td>${productOptionDto.product_option_stock_quantity}</td>
																		<td>${productOptionDto.product_option_price}</td>
																		<td>${productData.productDto.product_discount_rate}</td>
																		<td><fmt:formatDate
																				value="${productOptionDto.product_option_reg_date}"
																				pattern="yyyy.MM.dd" /></td>
																		<td><a
																			class="btn btn-outline-dark btn-sm modButton"
																			href="productDetail?product_no=${productData.productDto.product_no }">상세보기</a>
																		</td>
																	</tr>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td>${productData.productOptionDtoList[0].product_option_no }</td>
																	<td class="col-1"><img
																		src="/uploadFiles/productThumbnailImg/${productData.productDto.product_thumbnail }"
																		class="w-100"></td>
																	<td>단일상품</td>
																	<td>${productData.productDto.product_name }</td>
																	<td>${productData.productOptionDtoList[0].product_option_stock_quantity}</td>
																	<td>${productData.productDto.product_price}</td>
																	<td>${productData.productDto.product_discount_rate}</td>
																	<td><fmt:formatDate
																			value="${productData.productOptionDtoList[0].product_option_reg_date}"
																			pattern="yyyy.MM.dd" /></td>
																	<td><a
																		class="btn btn-outline-dark btn-sm modButton"
																		href="productDetail?product_no=${productData.productDto.product_no }">상세보기</a>
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
				<div class="row ms-1">
					<div class="col">
						<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
				</div>
			</div>
		</div>
	</div>
	<%-- <!-- 수정 폼 모달 -->
	<div class="modal fade" id="modModal">
		<form action="./productUpdateProcess" method="post"
			enctype="multipart/form-data">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5">상품 상세</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<input type="hidden" name="product_no">
										<div class="row border-bottom">
											<div class="col align-self-center">상품 타입</div>
											<div class="col" id="productTypeText"></div>
										</div>
										<div class="row border-bottom">
											<div class="col align-self-center">카테고리</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<select id="mainCategorySelect" size="6"
															class="form-control">
															<option>대분류를 선택해주세요.</option>
															<c:forEach items="${mainCategoryList }"
																var="mainCategory">
																<option value="${mainCategory.main_category_no}"
																	onclick="getSubCategoryList(${mainCategory.main_category_no})">${mainCategory.main_category_name}</option>
															</c:forEach>
														</select>
													</div>
													<div class="col">
														<select id="subCategorySelect" size="6"
															class="form-control" name="sub_category_no">
															<!-- 소분류 카테고리 -->
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col">
												<div class="row py-3">
													<div class="col align-self-center">상품명</div>
													<div class="col">
														<input class="form-control" name="product_name"
															type="text">
													</div>
												</div>
											</div>
										</div>

										<div class="row py-3 border-bottom">
											<div class="col align-self-center">
												상품 썸네일</i>
											</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<label for="imageInput" class="btn"> 추가하기<i
															class="fas fa-plus"></i>
														</label> <input type="file" id="imageInput" style="display: none;">
													</div>
												</div>
												<div class="row">
													<div class="col d-flex"></div>
												</div>

												<!-- <input name="thumbnail" type="file"
													accept="img/*"
													src="/welcomepet/resources/icon/addImageIcon.png"> -->
											</div>
										</div>
										<div class="row py-3 border-bottom">
											<div class="col align-self-center">상품 대표이미지</div>
											<div class="col">
												<input class="form-control" name="main_images" type="file"
													multiple accept="img/*"
													src="/welcomepet/resources/icon/addImageIcon.png">
											</div>
										</div>
										<div class="row py-3 border-bottom">
											<div class="col align-self-center">상품 상세이미지</div>
											<div class="col">
												<input class="form-control" name="detail_images" type="file"
													multiple accept="img/*"
													src="/welcomepet/resources/icon/addImageIcon.png">
											</div>
										</div>
										<div class="row py-3 border-bottom">
											<div class="col align-self-center">상품 정보</div>
											<div class="col">
												<textarea class="form-control" name="product_description"></textarea>
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col">
												<div class="row border-bottom py-3">
													<div class="col fw-bold">판매가</div>
													<div class="col"></div>
												</div>
												<div class="row py-3">
													<div class="col align-self-center">상품 가격</div>
													<div class="col">
														<div class="row">
															<div class="col">
																<input class="form-control" name="product_price"
																	type="text">
															</div>
															<div class="col-1 align-self-center">원</div>
														</div>
													</div>
												</div>
												<div class="row py-3 justify-content-center">
													<div class="col align-self-center">상품 배송비</div>
													<div class="col">
														<div class="row">
															<div class="col">
																<input class="form-control"
																	name="product_shipping_price" type="text">
															</div>
															<div class="col-1 align-self-center">원</div>
														</div>
													</div>
												</div>
												<div class="row py-3">
													<div class="col align-self-center">상품 할인율</div>
													<div class="col">
														<div class="row">
															<div class="col">
																<input class="form-control" name="product_discount_rate"
																	type="text">
															</div>
															<div class="col-1 align-self-center">%</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row py-3" id="productStockQuantity">
											<div class="col align-self-center">상품 재고</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<input class="form-control" name="product_stock_quantity"
															type="text" value="0">
													</div>
													<div class="col-1 align-self-center">개</div>
												</div>
											</div>
										</div>
										<div class="row py-3">
											<div class="col visually-hidden"
												id="productOptionBoxContainer">
												<div class="row">
													<div class="col align-self-center">상품 옵션</div>
													<div class="col">
														<span class="btn btn-primary addOptionButton"
															onclick="addOption()">추가하기</span>
													</div>
													<div class="col visually-hidden">
														<input type="hidden" name="option_name"> <input
															type="hidden" name="option_price"> <input
															type="hidden" name="option_stock_quantity">
													</div>
												</div>
												<div class="row visually-hidden productOptionBox">
													<div class="col">
														<div class="row">
															<div class="col align-self-center">상품 옵션 이름</div>
															<div class="col">
																<input class="form-control optionName" type="text">
															</div>
														</div>
														<div class="row">
															<div class="col align-self-center">상품 옵션 가격</div>
															<div class="col">
																<input class="form-control optionPrice" type="text">
															</div>
														</div>
														<div class="row">
															<div class="col align-self-center">상품 옵션 재고 수량</div>
															<div class="col">
																<input class="form-control optionStockQuantity"
																	type="text">
															</div>
														</div>
														<div class="row">
															<div class="col">
																<span class="btn btn-primary addOptionButton"
																	onclick="addOptionWithEvent(event)">옵션 추가하기</span>
															</div>
															<div class="col">
																<span class="btn btn-primary removeOptionButton"
																	onclick="deleteOption(event)">옵션 삭제하기</span>
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
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" onclick="combineOptionValues()">수정하기</button>
					</div>
				</div>

			</div>
		</form>
	</div> --%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
    function modalShow(product_no) {
    	const productNoInput=document.querySelector('input[name="product_no"]');
    	productNoInput.value=product_no;
    	const xhr1 = new XMLHttpRequest();
		
        xhr1.onreadystatechange = function () {
            if (xhr1.readyState == 4 && xhr1.status == 200) {
                const productData = JSON.parse(xhr1.responseText);
                
                if (productData.productOptionDtoList == null) {
                    const productType = document.getElementById("productTypeText");
                    productType.innerText = "단일상품";

                    const productStockQuantity = document.getElementById("productStockQuantity");
                    if (productStockQuantity.classList.contains('visually-hidden')) {
                        productStockQuantity.classList.remove('visually-hidden');
                    }
                    if (!productOptionBoxContainer.classList.contains('visually-hidden')) {
                        productOptionBoxContainer.classList.add('visually-hidden')
                    }

                    const productStockQuantityInput = productStockQuantity.querySelector('input[name="product_stock_quantity"]');
                    productStockQuantityInput.value = productData.productDto.product_stock_quantity;
                } else {
                    const productType = document.getElementById("productTypeText");
                    productType.innerText = "옵션상품";

                    const productOptionBoxContainer = document.getElementById("productOptionBoxContainer");
                    if (productOptionBoxContainer.classList.contains('visually-hidden')) {
                        productOptionBoxContainer.classList.remove('visually-hidden')
                    }
                    const productStockQuantity = document.getElementById("productStockQuantity");
                    if (!productStockQuantity.classList.contains('visually-hidden')) {
                        productStockQuantity.classList.add('visually-hidden');
                    }

                    for (productOptionDto of productData.productOptionDtoList) {
                        const productOptionBoxClone = productOptionBoxContainer.querySelector('.productOptionBox').cloneNode(true);

						
                        
                        if (productOptionBoxClone.classList.contains('visually-hidden')) {
                            productOptionBoxClone.classList.remove('visually-hidden');
                        }
                            
                        const optionNameInput = productOptionBoxClone.querySelector('.optionName');
                        const optionPriceInput = productOptionBoxClone.querySelector('.optionPrice');
                        const optionStockInput = productOptionBoxClone.querySelector('.optionStockQuantity');

                        optionNameInput.value = productOptionDto.product_option_name;
                        optionPriceInput.value = productOptionDto.product_option_price;
                        optionStockInput.value = productOptionDto.product_option_stock_quantity;

                        productOptionBoxContainer.appendChild(productOptionBoxClone);
                    }


                }
				console.log(productData.mainCategoryDto.main_category_no);
                const mainCategorySelect = document.getElementById("mainCategorySelect");
                var mainCategoryNo=productData.mainCategoryDto.main_category_no;
                const mainCategoryOfProduct = mainCategorySelect.querySelector('option[value="'+mainCategoryNo+'"]');
                mainCategoryOfProduct.selected = true;


                const xhr = new XMLHttpRequest();

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        const response = JSON.parse(xhr.responseText);
                        updateSubCategoryList(response);

                        const subCategorySelect = document.getElementById("subCategorySelect");
                        var subCategoryNo=productData.subCategoryDto.sub_category_no;
                        const subCategoryOfProduct = subCategorySelect.querySelector('option[value="'+subCategoryNo+'"]');
                        subCategoryOfProduct.selected = true;


                    }
                }


                //get
                xhr.open("get", "./getSubCategoryListByMainCategoryNo?main_category_no=" + productData.mainCategoryDto.main_category_no);
                xhr.send();

                const productNameInput = document.querySelector('input[name="product_name"]');
                const productDescriptionInput = document.querySelector('textarea[name="product_description"]');
                const productPriceInput = document.querySelector('input[name="product_price"]');
                const productShippingPriceInput = document.querySelector('input[name="product_shipping_price"]');
                const productDiscountInput = document.querySelector('input[name="product_discount_rate"]');

                
                productNameInput.value=productData.productDto.product_name;
                productDescriptionInput.value=productData.productDto.product_description;
                productPriceInput.value=productData.productDto.product_price;
                productShippingPriceInput.value=productData.productDto.product_shipping_price;
                productDiscountInput.value=productData.productDto.product_discount_rate;
                
                
                var modModal=document.getElementById("modModal");
                modModal.style.display="block";

            }
        }


        //get
        xhr1.open("get", "./getProductDataByNo?product_no=" + product_no);
        xhr1.send();
        

    }



    function getSubCategoryList(main_category_no) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                updateSubCategoryList(response);

            }
        }


        //get
        xhr.open("get", "./getSubCategoryListByMainCategoryNo?main_category_no=" + main_category_no);
        xhr.send();
    }


    function updateSubCategoryList(response) {
        const subCategorySelect = document.getElementById("subCategorySelect");
        subCategorySelect.innerHTML = '';

        const defaultoption = document.createElement("option");
        defaultoption.innerText = "소분류 카테고리 선택";
        defaultoption.setAttribute("value", "");

        subCategorySelect.appendChild(defaultoption);


        for (subCategory of response.subCategoryList) {
            const option = document.createElement("option");
            option.innerText = subCategory.sub_category_name;
            option.setAttribute("value", subCategory.sub_category_no);

            subCategorySelect.appendChild(option);
        }
    }


    function addOption(){
         const productOptionBoxClone=document.querySelector('.productOptionBox').cloneNode(true);
         productOptionBoxClone.classList.remove('visually-hidden');

         const productOptionBoxContainer=document.getElementById("productOptionBoxContainer");
         productOptionBoxContainer.append(productOptionBoxClone);

        
     }

     function addOptionWithEvent(event){
         var addOptionButton=event.target;
         const clickedOptionBox=addOptionButton.closest('.productOptionBox');

         const productOptionBoxClone=document.querySelector('.productOptionBox').cloneNode(true);
         productOptionBoxClone.classList.remove('visually-hidden');
     

         const productOptionBoxContainer=document.getElementById("productOptionBoxContainer");
         productOptionBoxContainer.insertBefore(productOptionBoxClone,clickedOptionBox.nextSibling);
         
     }

     function deleteOption(event){
         const deleteOptionButton=event.target;
         const clickedOptionBox=deleteOptionButton.closest('.productOptionBox');
         clickedOptionBox.remove();
     }


     function combineOptionValues(){
         const optionNames=document.querySelectorAll('.optionName');
         const optionPrices=document.querySelectorAll('.optionPrice');
         const optionStockQuantities=document.querySelectorAll('.optionStockQuantity');

         const optionNameInput=document.querySelector('input[name="option_name"]');
         const optionPriceInput=document.querySelector('input[name="option_price"]');
         const optionStockQuantityInput=document.querySelector('input[name="option_stock_quantity"]');

         var optionNamesValues="";
         var optionPriceValues="";
         var optionStockValues=""
         
       	optionNames.forEach((nameInput,index)=>{
       		if(index!=0){
       			optionNamesValues+=nameInput.value;
           		if(index!=optionNames.length-1){
           			optionNamesValues+=",";
           		 }
       		}
       		
       	 });
         
       	optionPrices.forEach((priceInput,index)=>{
      		 if(index!=0){
      			optionPriceValues+=priceInput.value;
          		if(index!=optionPrices.length-1){
          			optionPriceValues+=",";
          		 }
      		 }
      		
      	 });
       	
       	optionStockQuantities.forEach((stockInput,index)=>{
      		 if(index!=0){
      			optionStockValues+=stockInput.value;
          		if(index!=optionStockQuantities.length-1){
          			optionStockValues+=",";
          		 }
      		 }
      		
      	 });
         

         optionNameInput.setAttribute('value',optionNamesValues);
         optionPriceInput.setAttribute('value',optionPriceValues);
         optionStockQuantityInput.setAttribute('value',optionStockValues);
         
         console.log(optionStockValues);
     }
	/* 
		$(document).ready(function(){
			var optionCount=0;
			
			$(document).on('click','.modButton',function(){
				
				
				var product_no=$(this).data('product-no');
				
				$.ajax({
					url:'./getProductDataByNo',
					method:'GET',
					data:{'product_no':product_no},
					success:function(response){
						
						var productNameInput = $('input[name="product_name"]');
						var productThumbnailInput=$('input[name="thumbnail"]');
						var productMainImagesInput=$('input[name="main_images"]');
						var productDetailImagesInput=$('input[name="detail_images"]'); 
						var productDescriptionInput=$('textarea[name="product_description"]');
						var productPriceInput=$('input[name="product_price"]');
						var productShippingPriceInput=$('input[name="product_shipping_price"]');
						var productDiscountInput=$('input[name="product_discount_rate"]');
						var productStockInput=$('input[name="product_stock_quantity"]');
						
						
						var thumbnailImgCol=$('.thumbnailImgCol');
						var mainImgCol=$('.mainImgCol');
						var detailImgCol=$('.detailImgCol');
						
						thumbnailImgCol.children('img').attr('src','/uploadFiles/productThumbnailImg/'+response.productDto.product_thumbnail);
						for(mainImg of response.productMainImageDtoList){
							
							var mainImgClone=mainImgCol.first().clone();
							mainImgClone.removeClass('visually-hidden');
							mainImgClone.children('img').attr('src','/uploadFiles/productMainImg/'+mainImg.product_main_image_link);
							
							mainImgCol.parent('.row').append(mainImgClone);
						}
						
						for(detailImg of response.productDetailImageDtoList){
							
							var detailImgClone=detailImgCol.first().clone();
							detailImgClone.removeClass('visually-hidden');
							detailImgClone.children('img').attr('src','/uploadFiles/productDetailImg/'+detailImg.product_detail_image_link);
							
							detailImgCol.parent('.row').append(detailImgClone);
						}
						
						productNameInput.attr('value',response.productDto.product_name);
						productDescriptionInput.text(response.productDto.product_name);
						productPriceInput.attr('value',response.productDto.product_price);
						productShippingPriceInput.attr('value',response.productDto.product_shipping_price);
						productDiscountInput.attr('value',response.productDto.product_discount_rate);
						
						var main_category_no=response.mainCategoryDto.main_category_no;
						var sub_category_no=response.subCategoryDto.sub_category_no;
						$.ajax({
							url:'./getSubCategoryListByMainCategoryNo',
							method:'GET',
							data:{'main_category_no':main_category_no},
							success:function(subCategory_response,sub_category_no){
								getSubCategoryList(subCategory_response,sub_category_no);
							},
							error:function(xhr,reponse,error){
								alert('subCategory 요청처리중 오류가 발생했습니다:',error);
							}
						});
						
						
						if(response.productDto.productOptionDtoList!=null){
							$('#productTypeText').text('옵션 상품')
							$('.productOptionBoxContainer').removeClass('visually-hidden');
							for(productOptionDto of response.productDto.productOptionDtoList){
								var newOption=$('.productOptionBox').first().clone();
				                 
				                 newOption.removeClass('visually-hidden');

				                 newOption.find('.optionNum').text('옵션 '+(optionCount+1));
				                 
				                
				                 newOption.find('.optionName').attr('name','productOptionDtoList['+optionCount+'].product_option_name').attr('value',productOptionDto.product_option_name);
				                 newOption.find('.optionPrice').attr('name','productOptionDtoList['+optionCount+'].product_option_price').attr('value',productOptionDto.product_option_price);
				                 newOption.find('.optionStockQuantity').attr('name','productOptionDtoList['+optionCount+'].product_option_stock_quantity').attr('value',productOptionDto.product_option_stock_quantity);
				                 
				                 newOption.appendTo('.productOptionBoxContainer');

				                 optionCount++;
							}
							productStockInput.attr('value','0');							
							
						}
						else{
							$('#productTypeText').text('단일 상품');
							$('.productStockQuantity').removeClass('visually-hidden');
							productStockInput.attr('value',response.productDto.product_stock_quantity);
						}
						
					},
					error:function(){
						alert('상품 불러오기 요청 처리중 오류 발생:',error);
					}
				});
				
				$('#modModal').modal('show');
			});
			
			
			$(document).on('click','.addOptionButton',function(){
                
                var newOption=$('.productOptionBox').first().clone();
                
                newOption.removeClass('visually-hidden');

                newOption.find('.optionNum').text('옵션 '+(optionCount));
                
               
                newOption.find('.optionName').attr('name','productOptionDtoList['+optionCount+'].product_option_name');
                newOption.find('.optionPrice').attr('name','productOptionDtoList['+optionCount+'].product_option_price');
                newOption.find('.optionStockQuantity').attr('name','productOptionDtoList['+optionCount+'].product_option_stock_quantity');
				
                newOption.find('.optionAddRemoveButton').removeClass('visually-hidden');
                
                newOption.appendTo('.productOptionBoxContainer');

                optionCount++;

            });

            $(document).on('click','.removeOptionButton',function(){
                $(this).closest('.productOptionBox').remove();
                optionCount--;
            });
            
            
			function getSubCategoryList(response,sub_category_no) {
				var subCategorySelect=$('#subCategorySelect');
				subCategorySelect.empty();
				subCategorySelect.append($('<option>').text('소분류 카테고리 선택').attr('value',''));
				for(subCategory of response.subCategoryList){
					var subCategoryItem=$('<option>').attr('value',subCategory.sub_category_no)
					.text(subCategory.sub_category_name);
					if(subCategory.sub_category_no == sub_category_no){
						subCategoryItem.attr('selected','selected');
					}
				}
			}
			
			$('#mainCategorySelect').change(function () {
                var main_category_no = $(this).val();

            
                $.ajax({
                    url: './getSubCategoryListByMainCategoryNo',
                    method: 'POST',
                    data: { 'main_category_no': main_category_no },
                    success: function (response) {
                        updateSubCategoryList(response);
                    },
                    error: function (xhr, status, error) {
                        alert('요청 처리 중 오류가 발생했습니다:', error);
                    }
                });
            });

            //소분류카테고리출력함수
            function updateSubCategoryList(response) {
                var subCategorySelect=$('#subCategorySelect');
                subCategorySelect.empty();//카테고리 삭제

                subCategorySelect.append($('<option>').text('소분류카테고리 선택').attr('value',''));

                for(subCategory of response.subCategoryList){
                	var subCategoryItem=$('<option>').text(subCategory.sub_category_name)
                	.attr('value',subCategory.sub_category_no);
                    subCategorySelect.append(subCategoryItem);
                }
            }
		}); */
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>