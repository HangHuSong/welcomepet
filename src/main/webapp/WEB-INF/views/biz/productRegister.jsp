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
<script>
	
</script>


</head>
<body>
	<div class="container" style="margin: 0 0;">
		<div class="row" style="width: 1900px;">
			<div class="col-2 text-center ps-4 text-white"
				style="height: 1080px; background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col px-0">
				<div class="row bg-white mx-1">
					<div class="col text-center">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row mx-1 px-5 text-center bg-light">
					<div class="col">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">상품등록</div>
						</div>
						<form action="./productRegisterProcess" method="post"
							enctype="multipart/form-data">
							<div class="row mt-4 mb-2">
								<div class="col">
									<div class="row">
										<div class="col border bg-white">
											<div class="row text-start py-2 border-bottom">
												<div class="col fw-bold" style="font-size: 17px;">상품
													정보</div>
											</div>
											<div class="row">
												<div class="col-3 align-self-center py-3 bg-light">상품 타입</div>
												<div class="col">
													<div class="row px-2 text-start">
														<div class="col-2 py-3">
															<div class="form-check">
																<input class="form-check-input" type="radio"
																	id="singleProductButton"> <label
																	class="form-check-label" for="singleProductButton">단일상품</label>
															</div>
														</div>
														<div class="col-2 py-3">
															<div class="form-check">
																<input class="form-check-input" type="radio"
																	id="optionProductButton"> <label
																	class="form-check-label" for="optionProductButton">옵션상품</label>
															</div>
														</div>
														<div class="col"></div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-3 align-self-center py-3 bg-light">카테고리</div>
												<div class="col">
													<div class="row">
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
										</div>

									</div>



									<div class="row py-3 border-bottom">
										<div class="col align-self-center">상품 썸네일</div>
										<div class="col">
											<input class="form-control" name="thumbnail" type="file"
												accept="image/*" onchange="pushThumbnail(event)">
										</div>
									</div>
									<div class="row py-3 border-bottom">
										<div class="col align-self-center">상품 대표이미지</div>
										<div class="col">
											<input class="form-control" name="main_images" type="file"
												multiple accept="image/*" onchange="pushMainImages(event)">
										</div>
									</div>
									<div class="row py-3 border-bottom">
										<div class="col align-self-center">상품 상세이미지</div>
										<div class="col">
											<input class="form-control" name="detail_images" type="file"
												multiple accept="image/*" onchange="pushDetailImages(event)">
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
															<input class="form-control" name="product_shipping_price"
																type="text">
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
													<input class="form-control" name="stock_quantity"
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
									<div class="row py-3">
										<div class="col">
											<button class="btn btn-primary"
												onclick="combineOptionValues()">
												<!-- onclick="productRegister()"> -->
												등록하기
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->

	<script>
		/* var productRegisterRequest={};
		var productOptionDtoList=[];
		const formData=new FormData();
		
		function pushThumbnail(event){
			const file=event.target.files[0];
			formData.append('thumbnail',file);
			console.log(formData.get("thumbnail"));
		}
		function pushMainImages(event){
			const files=event.target.files;
			for(file of files){
				formData.append('main_images[]',file);
				console.log(formData.get("main_images[]"));
			}
			
		}
		function pushDetailImages(event){
			const files=event.target.files;
			for(file of files){
				formData.append('detail_images[]',file);
				console.log(formData.get("detail_images[]"));
			}
		} 
		function productRegister(){
			const subCategorySelect=document.getElementById("subCategorySelect");
			const subCategorySelectedOption=subCategorySelect.options[subCategorySelect.selectedIndex];
			
			const productNameInput=document.querySelector('input[name="product_name"]');
			const productDescriptionInput=document.querySelector('textarea[name="product_description"]');
			const productPriceInput=document.querySelector('input[name="product_price"]');
			const productShippingPriceInput=document.querySelector('input[name="product_shipping_price"]');
			
			productRegisterRequest["product_name"]=productNameInput.value;
			productRegisterRequest["product_description"]=productDescriptionInput.value;
			productRegisterRequest["product_price"]=productPriceInput.value;
			productRegisterRequest["product_shipping_price"]=productShippingPriceInput.value;
			
			const productOptionBoxContainer=document.getElementById("productOptionBoxContainer");
			if(productOptionBoxContainer.classList.contains('visually-hidden')){
				const productStockQuantityInput=document.querySelector('input[name="stock_quantity"]');
				const productOptionDto={};
				productOptionDto['product_option_name']=(productNameInput.value);
				productOptionDto['product_option_price']=(productPriceInput.value);
				productOptionDto['product_option_stock_quantity']=(productStockQuantityInput.value);
				
				productOptionDtoList.push(productOptionDto);
				
			}else{
				const productOptionBoxes=document.querySelectorAll('.productOptionBox');
				productOptionBoxes.forEach(function(productOptionBox,index,productOptionBoxes){
					if(index!=0){
						const product_option_name=productOptionBox.querySelector('.optionName').value;
						const product_option_price=productOptionBox.querySelector('.optionPrice').value;
						const product_option_stock_quantity=productOptionBox.querySelector('.optionStockQuantity').value;
						
						const productOptionDto={};
						
						productOptionDto['product_option_name']=(product_option_name);
						productOptionDto['product_option_price']=(product_option_price);
						productOptionDto['product_option_stock_quantity']=(product_option_stock_quantity);
						productOptionDtoList.push(productOptionDto);
					}
				});
			}
			productRegisterRequest["productOptionDtoList"]=productOptionDtoList;
			
			console.log(productRegisterRequest);
			
			const xhr1 = new XMLHttpRequest();
			
	        xhr1.onreadystatechange = function () {
	            if (xhr1.readyState == 4 && xhr1.status == 200) {
	            
	            	console.log('good');
	            }
	        }
	
	        
	        
	        xhr1.open("post", "./productImagesRegister");
	        xhr1.send(formData);
			
			const xhr2 = new XMLHttpRequest();
			
	        xhr2.onreadystatechange = function () {
	            if (xhr2.readyState == 4 && xhr2.status == 200) {
	            
	            	console.log('good');
	            }
	        }
	
	        
	        
	        xhr2.open("post", "./productRegisterRequest");
	        xhr2.setRequestHeader('Content-Type', 'application/json');
	        xhr2.send(JSON.stringify(productRegisterRequest));
		} */
		
		
	 document.getElementById("singleProductButton").addEventListener("click", function () {
         var singleProductButton = document.getElementById("singleProductButton");
         var optionProductButton = document.getElementById("optionProductButton");

         var productStockQuantity = document.getElementById("productStockQuantity");
         var productOptionBoxContainer = document.getElementById("productOptionBoxContainer");


         if (!singleProductButton.parentElement.classList.contains('bg-primary')) {
             singleProductButton.parentElement.classList.add('bg-primary');
             singleProductButton.classList.add('text-white');
         }
         if (optionProductButton.parentElement.classList.contains('bg-primary')) {
             optionProductButton.parentElement.classList.remove('bg-primary');
             optionProductButton.classList.remove('text-white');
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


         if (!optionProductButton.parentElement.classList.contains('bg-primary')) {
             optionProductButton.parentElement.classList.add('bg-primary');
             optionProductButton.classList.add('text-white');
         }
         if (singleProductButton.parentElement.classList.contains('bg-primary')) {
             singleProductButton.parentElement.classList.remove('bg-primary');
             singleProductButton.classList.remove('text-white');
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