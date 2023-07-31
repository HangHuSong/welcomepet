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
					<div class="col text-center">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row px-5 text-start mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold py-3">상품등록</div>
						</div>
						<form action="./productRegisterProcess" method="post"
							enctype="multipart/form-data">
							<div class="row mt-4 mb-2">
								<div class="col">
									<div class="row">
										<div class="col">
											<div class="row py-2">
												<div class="col fw-bold align-self-center"
													style="font-size: 16px;">상품 정보</div>
												<div class="col text-end">
													<img src="/welcomepet/resources/img/bizAd/ad5.png">
												</div>
											</div>
											<div class="row bg-white" style="font-size: 14px;">
												<div class="col border"
													style="background-color: rgb(245, 250, 255);">
													<div class="row border-bottom">
														<div class="col-3 align-self-center">
															카테고리 <span class="badge bg-danger">필수</span>
														</div>
														<div class="col border-start bg-white">
															<div class="row py-2">
																<div class="col">
																	<select id="mainCategorySelect" size="6"
																		class="form-control">
																		<option selected>대분류를 선택해주세요.</option>
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
																<div class="col"></div>
															</div>
															<div class="row pb-2">
																<div class="col" style="font-size: 11px;">
																	<span class="text-secondary">*상품분류 수정은 상품 목록
																		&gt; 상품 상세에서 관리할 수 있습니다.</span> <a class="text-decoration text-primary" href="./productList">상품 목록 바로가기</a>
																</div>
															</div>
														</div>
													</div>
													<div class="row border-bottom">
														<div class="col-3 align-self-center py-2">
															상품명 <span class="badge bg-danger">필수</span>
														</div>
														<div class="col border-start py-2 bg-white">
															<input class="form-control" name="product_name"
																type="text">
														</div>
														<div class="col bg-white"></div>
													</div>
													<div class="row">
														<div class="col-3 py-2 align-self-center">
															상품 정보 <span class="badge bg-danger">필수</span>
														</div>
														<div class="col border-start py-2 bg-white">
															<textarea class="form-control" name="product_description"></textarea>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row mt-5">
										<div class="col">
											<div class="row py-3">
												<div class="col fw-bold">판매정보</div>
												<div class="col"></div>
											</div>
											<div class="row">
												<div class="col border"
													style="background-color: rgb(245, 250, 255); font-size: 14px;">
													<div class="row border-bottom">
														<div class="col-3 align-self-center">
															상품 가격 <span class="badge bg-danger">필수</span>
														</div>
														<div class="col border-start">
															<div class="row py-2 bg-white">
																<div class="col-3">
																	<input class="form-control" name="product_price"
																		type="text">
																</div>
																<div class="col-1 align-self-center ps-0">원</div>
																<div class="col"></div>
															</div>
														</div>
													</div>
													<div class="row border-bottom">
														<div class="col-3 align-self-center">
															상품 배송비 <span class="badge bg-danger">필수</span>
														</div>
														<div class="col border-start">
															<div class="row py-2 bg-white">
																<div class="col-3">
																	<input class="form-control"
																		name="product_shipping_price" type="text">
																</div>
																<div class="col-1 align-self-center ps-0">원</div>
																<div class="col"></div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-3 align-self-center">상품 할인율</div>
														<div class="col border-start">
															<div class="row py-2 bg-white">
																<div class="col-3">
																	<input class="form-control"
																		name="product_discount_rate" type="text" value="0">
																</div>
																<div class="col-1 align-self-center ps-0">%</div>
																<div class="col"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row mt-5">
										<div class="col">
											<div class="row py-3">
												<div class="col fw-bold" style="font-size: 16px;">옵션/재고
													설정</div>
											</div>
											<div class="row">
												<div class="col border"
													style="background-color: rgb(245, 250, 255); font-size: 14px;">
													<div class="row border-bottom">
														<div class="col-3 align-self-center py-2">상품 타입</div>
														<div class="col border-start">
															<div class="row px-2 text-start bg-white">
																<div class="col-2 py-2">
																	<div class="form-check py-1">
																		<input class="form-check-input" type="radio"
																			id="singleProductButton" checked> <label
																			class="form-check-label" for="singleProductButton">단일상품</label>
																	</div>
																</div>
																<div class="col-2 py-2">
																	<div class="form-check py-1">
																		<input class="form-check-input" type="radio"
																			id="optionProductButton"> <label
																			class="form-check-label" for="optionProductButton">옵션상품</label>
																	</div>
																</div>
																<div class="col"></div>
															</div>
														</div>
													</div>
													<div class="row" id="productStockQuantity">
														<div class="col-3 align-self-center py-2">상품 재고</div>
														<div class="col border-start">
															<div class="row py-2 bg-white">
																<div class="col-3">
																	<input class="form-control" name="stock_quantity"
																		type="text" value="0">
																</div>
																<div class="col-1 align-self-center ps-0">개</div>
																<div class="col"></div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col visually-hidden"
															id="productOptionBoxContainer">
															<div class="row">
																<div class="col-3 align-self-center py-2">옵션 입력</div>
																<div class="col border-start py-2 bg-white">
																	<div class="row">
																		<div class="col">
																			<table class="table table-bordered mb-0">
																				<thead class="text-center"
																					style="background-color: rgb(245, 250, 255);">
																					<tr>
																						<th scope="col">옵션명</th>
																						<th scope="col">옵션가격</th>
																						<th scope="col">옵션수량</th>
																					</tr>
																				</thead>
																				<tbody>
																					<tr class="productOptionBox">
																						<td><input class="form-control optionName"
																							type="text"></td>
																						<td><input class="form-control optionPrice"
																							type="text"></td>
																						<td>
																							<div class="row">
																								<div class="col">
																									<input class="form-control optionStockQuantity"
																										type="text">
																								</div>
																								<div
																									class="col-4 align-self-center text-center ps-0">
																									<span
																										class="btn btn-dark btn-sm removeOptionButton"
																										onclick="deleteOption(event)"><i
																										class="fas fa-minus"></i></span> <span
																										class="btn btn-dark btn-sm addOptionButton"><i
																										class="fas fa-plus" onclick="addOption(event)"></i></span>
																								</div>
																							</div>
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
																<div class="col visually-hidden">
																	<input type="hidden" name="option_name"> <input
																		type="hidden" name="option_price"> <input
																		type="hidden" name="option_stock_quantity">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row mt-5">
										<div class="col">
											<div class="row py-3">
												<div class="col fw-bold" style="font-size: 16px;">상품이미지</div>
											</div>
											<div class="row">
												<div class="col border"
													style="background-color: rgb(245, 250, 255); font-size: 14px;">
													<div class="row border-bottom">
														<div class="col-3 align-self-center py-2">
															상품 썸네일 <span class="badge bg-danger">필수</span>
														</div>
														<div class="col py-2 border-start bg-white">
															<div class="row">
																<div class="col">
																	<input class="form-control" name="thumbnail"
																		type="file" accept="image/*"
																		onchange="pushThumbnail(event)">
																</div>
															</div>
															<div class="row pt-2">
																<div class="col text-secondary" style="font-size: 11px;">-권장사이즈:
																	500px*500px</div>
															</div>
														</div>
													</div>
													<div class="row border-bottom">
														<div class="col-3 py-2 align-self-center">상품 대표이미지</div>
														<div class="col py-2 border-start bg-white">
															<div class="row">
																<div class="col">
																	<input class="form-control" name="main_images"
																		type="file" multiple accept="image/*"
																		onchange="pushMainImages(event)">
																</div>
															</div>
															<div class="row pt-2">
																<div class="col text-secondary" style="font-size: 11px;">-권장사이즈:
																	500px*500px</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-3 py-2 align-self-center">
															상품 상세이미지 <span class="badge bg-danger">필수</span>
														</div>
														<div class="col py-2 border-start bg-white">
															<input class="form-control" name="detail_images"
																type="file" multiple accept="image/*"
																onchange="pushDetailImages(event)">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row mt-5 text-center">
										<div class="col">
											<button class="btn btn-primary rounded-5 px-5"
												onclick="combineOptionValues()">상품등록</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
				</div>
			</div>
		</div>
	</div>


	<script>
		
		
		
	 document.getElementById("singleProductButton").addEventListener("click", function () {
         var singleProductButton = document.getElementById("singleProductButton");
         var optionProductButton = document.getElementById("optionProductButton");

         var productStockQuantity = document.getElementById("productStockQuantity");
         var productOptionBoxContainer = document.getElementById("productOptionBoxContainer");


         if (!singleProductButton.checked) {
        	 singleProductButton.checked=true;
         }
         if (optionProductButton.checked) {
        	 optionProductButton.checked=false;
         }
         if (productStockQuantity.classList.contains('visually-hidden')) {
             productStockQuantity.classList.remove('visually-hidden');
         }
         if (!productOptionBoxContainer.classList.contains('visually-hidden')) {
             productOptionBoxContainer.classList.add('visually-hidden');
         }

     });

     document.getElementById("optionProductButton").addEventListener("click", function () {
         var singleProductButton = document.getElementById("singleProductButton");
         var optionProductButton = document.getElementById("optionProductButton");

         var productStockQuantity = document.getElementById("productStockQuantity");
         var productOptionBoxContainer = document.getElementById("productOptionBoxContainer");


         if (!optionProductButton.checked) {
        	 optionProductButton.checked=true;
         }
         if (singleProductButton.checked) {
        	 singleProductButton.checked=false;
         }
         if (productOptionBoxContainer.classList.contains('visually-hidden')) {
             productOptionBoxContainer.classList.remove('visually-hidden');
         }
         if (!productStockQuantity.classList.contains('visually-hidden')) {
             productStockQuantity.classList.add('visually-hidden');
         }

     });

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

             subCategorySelect.appendChild(option);
         }
     }

     

     function addOption(event){
        var addOptionButton=event.currentTarget;
        const clickedOptionBox=addOptionButton.closest('.productOptionBox');

        const productOptionBoxClone=document.querySelector('.productOptionBox').cloneNode(true);
        const inputs=productOptionBoxClone.querySelectorAll('input');
        for(input of inputs){
        	input.value='';
        }

        const productOptionTbody=addOptionButton.closest('tbody');
        productOptionTbody.appendChild(productOptionBoxClone);
         
         
     }

     function deleteOption(event){
    	 const tbody=document.querySelector('tbody');
    	 const trs=tbody.querySelectorAll('tr');
    	 if(trs.length >1){
    		 const deleteOptionButton=event.currentTarget;
             const clickedOptionBox=deleteOptionButton.closest('tr');
             clickedOptionBox.remove();
    	 }
     }


     function combineOptionValues(){
    	 const productOptionBox=document.querySelector('.productOptionBox');
    	 productOptionBox.remove();
    	 
         const optionNames=document.querySelectorAll('.optionName');
         const optionPrices=document.querySelectorAll('.optionPrice');
         const optionStockQuantities=document.querySelectorAll('.optionStockQuantity');

         const optionNameInput=document.querySelector('input[name="option_name"]');
         const optionPriceInput=document.querySelector('input[name="option_price"]');
         const optionStockQuantityInput=document.querySelector('input[name="option_stock_quantity"]');

         var optionNamesValues="";
         var optionPriceValues="";
         var optionStockValues=""
        
         if(optionNames!=null){
        	 optionNames.forEach((nameInput,index)=>{
            		if(index!=0){
            			optionNamesValues+=",";
            		}
            		optionNamesValues+=nameInput.value;
            		
            	 });
              
            	optionPrices.forEach((priceInput,index)=>{
           		 if(index!=0){
           			optionPriceValues+=",";
           		 }
           		optionPriceValues+=priceInput.value;
           	 });
            	
            	optionStockQuantities.forEach((stockInput,index)=>{
           		 if(index!=0){
           			optionStockValues+=",";
           		 }
           		optionStockValues+=stockInput.value;
           	 });
         }
       	
         
         optionNameInput.setAttribute('value',optionNamesValues);
         optionPriceInput.setAttribute('value',optionPriceValues);
         optionStockQuantityInput.setAttribute('value',optionStockValues);
         
      
     }

		
        /* $(document).ready(function () {
        	var optionCount=1;
            $(document).on('click','.addOptionButton',function(){
                 
                 var newOption=$('.productOptionBox').first().clone();
                 
                 newOption.removeClass('visually-hidden');

                 newOption.find('.optionNum').text('옵션 '+(optionCount));
                 
                
                 newOption.find('.optionName').attr('name','productOptionDtoList['+(optionCount-1)+'].product_option_name');
                 newOption.find('.optionPrice').attr('name','productOptionDtoList['+(optionCount-1)+'].product_option_price');
                 newOption.find('.optionStockQuantity').attr('name','productOptionDtoList['+(optionCount-1)+'].product_option_stock_quantity');
				
                 
                 
                 newOption.appendTo('.productOptionBoxContainer');

                 optionCount++;

             });

             $(document).on('click','.removeOptionButton',function(){
                 $(this).closest('.productOptionBox').remove();
                 optionCount--;
             });
            
             $('#singleProductButton').click(function(){
                 if($('.productStockQuantity').hasClass('visually-hidden')){
                     $('.productStockQuantity').removeClass('visually-hidden');
                 }
             	if(!$('.productOptionBoxContainer').hasClass('visually-hidden')){
                     $('.productOptionBoxContainer').addClass('visually-hidden');
                 }
             	if(!$(this).closest('.col').hasClass('bg-primary')){
                    $(this).closest('.col').addClass('bg-primary');
                    $(this).addClass('text-white');
                }
                if($('#optionProductButton').closest('.col').hasClass('bg-primary')){
                    $('#optionProductButton').closest('.col').removeClass('bg-primary')
                    $('#optionProductButton').removeClass('text-white');
                }
                 
             });

             $('#optionProductButton').click(function(){
                 if(!$('.productStockQuantity').hasClass('visually-hidden')){
                     $('.productStockQuantity').addClass('visually-hidden');
                 }
             	if($('.productOptionBoxContainer').hasClass('visually-hidden')){
                     $('.productOptionBoxContainer').removeClass('visually-hidden');
                 }
             	if(!$(this).closest('.col').hasClass('bg-primary')){
                    $(this).closest('.col').addClass('bg-primary');
                    $(this).addClass('text-white');
                 }
                if($('#singleProductButton').closest('.col').hasClass('bg-primary')){
                    $('#singleProductButton').closest('.col').removeClass('bg-primary')
                    $('#singleProductButton').removeClass('text-white');
                }
                
             });
             
             
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