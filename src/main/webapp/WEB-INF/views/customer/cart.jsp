<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>장바구니1</title>


 <script >

 
 var selectedOptions = [];
 

 
		 function updatePrices(index) {
		   var realPriceElement = document.getElementById("realPrice_" + index);
		   var salePriceElement = document.getElementById("salePrice_" + index);
		   var quantityButtonElement = document.getElementById("quantityButton_" + index);
		   var sumRealPriceElement = document.getElementById("sumRealPrice_" + index);
		   var sumPriceElement = document.getElementById("sumPrice_" + index);
		
		   var realPrice = parseInt(realPriceElement.value);
		   var salePrice = parseInt(salePriceElement.value);
		   var quantity = parseInt(quantityButtonElement.value);
		
		   var sumRealPrice = realPrice * quantity;
		   var sumPrice = (realPrice - salePrice) * quantity;
		   var salePrice = salePrice * quantity;
		
		   sumRealPriceElement.textContent = sumRealPrice.toLocaleString() + "원";
		   sumPriceElement.textContent = sumPrice.toLocaleString() + "원";
		 }
		
		 function decreaseQuantity(button, index) {
		   var quantityElement = button.nextElementSibling;
		   var quantity = parseInt(quantityElement.textContent);
		   if (quantity > 1) {
		     quantity = quantity - 1;
		     quantityElement.textContent = quantity;
		     document.getElementById("quantityButton_" + index).textContent = quantity;
		     document.getElementById("quantityButton_" + index).value = quantity;
		     updateSelectedOptions(button, index);
		     updatePrices(index);
		   }
		 }
		
		 function increaseQuantity(button, index) {
		   var quantityElement = button.previousElementSibling;
		   var quantity = parseInt(quantityElement.textContent);
		   quantity = quantity + 1;
		   quantityElement.textContent = quantity;
		   document.getElementById("quantityButton_" + index).textContent = quantity;
		   document.getElementById("quantityButton_" + index).value = quantity;
		   updateSelectedOptions(button, index);
		   updatePrices(index);
		 }
 
	function updateSelectedOptions(checkbox, index) {
		  var selectedItems = document.getElementsByName("selectedItems");
		  var newOptions  = [];

		  for (var i = 0; i < selectedItems.length; i++) {
		    if (selectedItems[i].checked) {
		      var value = selectedItems[i].value.split(":");
		      var productOptionNo = value[0];
		      
		      var productAmount = document.getElementById("quantityButton_" + index).value;
		      var option = { product_option_no: productOptionNo, product_amount: productAmount, index: i };
		      newOptions .push(option);
		    }
		  }
		  selectedOptions = newOptions;
		  console.log(selectedOptions);
		  // 선택된 옵션들을 활용하여 필요한 작업을 수행하세요.
		  // 예: 선택된 옵션들을 서버로 전송하거나 다른 동작을 수행

		  // 예시: 선택된 옵션 수 출력
		  var selectedCount = selectedOptions.length;
		  console.log("Selected options count: " + selectedCount);

		  // 체크박스가 해제되었을 때 해당 옵션을 배열에서 제거
		  if (!checkbox.checked) {
		    var value = checkbox.value.split(":");
		    var productOptionNo = value[0];
	
		    selectedOptions = selectedOptions.filter(option => option.product_option_no !== productOptionNo);
		  }

		  console.log(selectedOptions);
		  // 체크박스 해제 후의 선택된 옵션들을 확인
		  
		  var sumRealPrice = 0;
		  var salePrice = 0;
		  var sumPrice = 0;

		  for (var i = 0; i < selectedOptions.length; i++) {
		    var option = selectedOptions[i];
		    var realPriceElement = document.getElementById("realPrice_" + option.index);
		    var salePriceElement = document.getElementById("salePrice_" + option.index);
		    var quantityButtonElement = document.getElementById("quantityButton_" + option.index);
		    var quantity = parseInt(quantityButtonElement.value);

		    sumRealPrice += parseInt(realPriceElement.value) * quantity;
		    salePrice += parseInt(salePriceElement.value) * quantity;
		    sumPrice += (parseInt(realPriceElement.value) - parseInt(salePriceElement.value)) * quantity;
		  }

		  // 합산된 값을 표시
		  document.getElementById("totalRealPrice").textContent = sumRealPrice.toLocaleString() + "원";
		  document.getElementById("totalSalePrice").textContent = salePrice.toLocaleString() + "원";
		  document.getElementById("totalPrice").textContent = (sumRealPrice - salePrice).toLocaleString() + "원";
		  document.getElementById("totalPrice2").textContent = (sumRealPrice - salePrice).toLocaleString() + "원 결제하기";
		}

	function selectAllItems(checkbox) {
		  var checkboxes = document.getElementsByName("selectedItems");
		  for (var i = 0; i < checkboxes.length; i++) {
		    checkboxes[i].checked = checkbox.checked;
		    var index = parseInt(checkboxes[i].getAttribute("data-index"));
		    updateSelectedOptions(checkboxes[i], index);
		  }
		}
		
		 document.addEventListener("DOMContentLoaded", function() {
			  document.getElementById("checkAll").addEventListener("change", function() {
			    selectAllItems(this);
			   
			  });

			});	
		 
		 document.addEventListener("DOMContentLoaded", function() {
			  // 윈도우가 다시 실행되고 JSP 값이 모두 로드되었을 때 실행되는 코드

			  // updatePrices() 함수 호출
			  var checkboxes = document.getElementsByName("selectedItems");
			  checkboxes.forEach(function(checkbox) {
			    var index = parseInt(checkbox.getAttribute("data-index"));
			    updatePrices(index);
			  });

			  // 전체 체크박스를 선택하는 함수 호출
			  document.getElementById("checkAll").click();

			});

		 function buyNow() {
				console.log(selectedOptions);
			  const form = document.createElement("form");
			  form.method = "POST";
			  form.action = "../board/buyPage"; // buyPage URL 설정

			  const selectedOptionsInput = document.createElement("input");
			  selectedOptionsInput.type = "hidden";
			  selectedOptionsInput.name = "selectedOptions";
			  selectedOptionsInput.value = JSON.stringify(selectedOptions);
			  form.appendChild(selectedOptionsInput);

			  document.body.appendChild(form);
			  form.submit();
			}		 


 </script> 
 
<style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}
.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}
.product-thum {
	height: 5em;
}
.banner_img {
 width: 100%;
}

.small-font {
	font-size: 0.9em;
	color: gray;
}

.btn-equal-size {
  width: 2.2rem;
  
}
</style>
</head>
<body>

	<div class="container align-items-center justify-content-center ">

		<div class="row  mt-2 align-items-center">
			<div class="col-1 d-flex ps-1">
				<a class="btn bi bi-arrow-left fs-4 py-1" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col fw-bold ps-0" style="text-align: center;">장바구니</div>
			<div class="col-1"></div>
		</div>

		<div class="row border-bottom "></div>
		<div class="row mt-2 ">
			<div class="col px-0">
			<img src="/welcomepet/resources/img/banner/banner7.png"
				class="banner_img" style="width:  ;" alt="...">
			</div>		
		</div>
			
				<div class="row align-items-end " style="font-size: 0.9em; height: 2.5em;">
				<div class="col ">
				 <input type="checkbox" class="form-check-input" id="checkAll" style="font-size: 1.1em;" > 
				 <span class="text-secondary ps-1"> 전체선택 </span> </div>
				</div>
					<div class="row mt-2 "></div>
					
		<c:set var="totalPrice" value="0" />
		<c:set var="salePrice" value="0" />

			<c:forEach items="${cartInfo}" var="map"  varStatus="status">
			  <input type="hidden" value="${map.productOptionInfo.product_option_no}"> 
			  <input type="hidden" value="${map.productOptionInfo.product_option_price}" id="realPrice_${status.index}">
			  <input type="hidden" value="${map.salePrice}" id="salePrice_${status.index}">
			    <div class="row border-top embed-responsive embed-responsive-1by1">
			      <div class="row mt-3">
			        <div class="col-1">
			          <input type="checkbox" class="form-check-input" name="selectedItems" value="${map.productOptionInfo.product_option_no}:${map.cartInfo.product_amount}" data-index="${status.index}" onclick="updateSelectedOptions(this, ${status.index})">
			        </div>
			        <div class="col-3">
			          <img src="/uploadFiles/WelcomePet/${map.productInfo.product_thumbnail}" class="embed-responsive-item product-thum  rounded-2 " alt="...">
			        </div>
			        <div class="col">
			          <div class="row mt-1 align-items-start">
			            <div class="col fw-bold" style="font-size: 0.8em;">${map.productInfo.product_name}</div>
			            <div class="col-1 text-end">
			              <i class="bi bi-x fs-3 py-0 text-secondary" onclick="location.href='./deleteCart?cart_no=${map.cartInfo.cart_no}'" style="position: relative; top: -5px; left: -5px;"></i>
			            </div>
			          </div>         
			          <div class="row mt-2"  style="font-size: 0.9em;">
			            <div class="col" >
			              <span class="text-secondary">
			               <del  id="sumRealPrice_${status.index}" ></del>
			              </span>
			              <span class="fw-bold ps-1" id="sumPrice_${status.index}"></span>
			            </div>
			          </div>
			        </div>

			      </div>
			      <div class="row mt-3">
			        <div class="col-1"></div>
			        <div class="col ps-2 ms-2 border rounded-2 d-flex align-items-center" style="background-color: rgb(244, 247, 250); height: 4em; font-size: 0.9em;">
			          <span class="ps-2 text-secondary ">${map.productOptionInfo.product_option_name}</span>
			        </div>

			      </div>
			      <div class="row mt-3">
			        <div class="col"> </div>
			        <div class="col pe-0">
			          <button type="button" class="btn btn-outline-secondary" style="width: 5em; height: 2.3em;">
			            <span style="font-size: 0.8em; color: black; font-weight: 500;">옵션변경</span>
			          </button>
			        </div>
			        <div class="col ms-0 ps-0 pe-0">
			          <div class="btn-group fw-bold" role="group" aria-label="Basic outlined example">
			            <button type="button" class="btn btn-outline-secondary btn-equal-size" onclick="decreaseQuantity(this, ${status.index})">-</button>
			            <button type="button" id="quantityButton_${status.index}" class="btn btn-outline-secondary btn-equal-size" value="${map.cartInfo.product_amount}">${map.cartInfo.product_amount}</button>
			            <button type="button" class="btn btn-outline-secondary btn-equal-size" onclick="increaseQuantity(this, ${status.index})">+</button>
			          </div>
			        </div>

			        <div class="row mt-3"></div>
			      </div>
			    </div>
			</c:forEach>
			
					<div class="row mt-2 empty"></div>
					
		<div class="row mt-3 ">
			<div class="col">
				<div class="row ">
					<div class="row mt-2 "  >
						<div class="col text-secondary">총 상품 금액</div>
						<div class="col text-end fw-bold text-secondary">
							<del id="totalRealPrice"> </del>
						</div>
					</div>
					<div class="row mt-2"  >
						<div class="col text-secondary" >할인 금액</div>
						<div class="col text-end fw-bold text-primary"  id="totalSalePrice"></div>
						
					</div>
					<div class="row mt-3 border-top"></div>
					<div class="row mt-3  fw-bold " style="font-size: 1.1em;">
						<div class="col">총 결제 금액</div>
						<div class="col text-end" id="totalPrice">${totalPrice - salePrice}원</div>
					</div>
					<div class="row mt-2"></div>
				</div>
			</div>
		</div>
		
		<div class="row mt-2 " style="height: 3em;"></div>
		<div class="row mt-2">
			<div class="row mb-4">
				<div class="col">
					<div class="navbar navbar-dark bg-white fixed-bottom border-top">

						<div class="col ps-2 pe-1 ">
							<div class="row">
								<div class="col px-4">
									<div class="d-grid gap-2">
										<button class="btn  btn-lg" type="button" onclick="buyNow()" style="background-color: rgb(253, 152, 67);
													color: white;">
										<div class="row fs-5">
										<div class="col text-center ps-0" id="totalPrice2"> ${totalPrice - salePrice}원 결제하기 </div>
										</div>
										</button>
									</div>
								</div>

							</div>
						</div>
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
				<script>
				

				
				</script>
				
				
				
				
				
				
				
				
</html>















