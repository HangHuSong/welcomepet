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
	
<title>결제</title>

<script>
  
  
	function calculateProductPrice() {
	  let totalProductPrice = 0;
	  <c:forEach var="item" items="${data}" varStatus="status">  
	    var price = (${item.optionInfo.product_option_price}) * ${product_amount[status.index]};
	    totalProductPrice += price;
	  </c:forEach>
	  return totalProductPrice;
	}

	function calculateProductSalePrice() {
	  let totalProductSalePrice = 0;
	  <c:forEach var="item" items="${data}" varStatus="status">
	    var salePrice = ${item.salePrice} * ${product_amount[status.index]};
	    totalProductSalePrice += salePrice;
	  </c:forEach>
	  return totalProductSalePrice;
	}
	
	function calculateShippingPrice() {
		  let totalShippingPrice = 0;
		  let calculatedBizNos = [];

		  <c:forEach var="item" items="${data}" varStatus="status">
		    if (!calculatedBizNos.includes("${item.productInfo.biz_no}")) {
		      totalShippingPrice += ${item.productInfo.product_shipping_price};
		      calculatedBizNos.push("${item.productInfo.biz_no}"); 
		    }
		  </c:forEach>

		  return totalShippingPrice;
		}

	function calculateTotalUsedPoint() {
		  let totalUsedPoint = 0;
		  const inputs = document.querySelectorAll('input[name^="orderProductDtoList"]');
		  inputs.forEach(input => {
		    const usedPoint = parseInt(input.value);
		    if (!isNaN(usedPoint) && usedPoint > 0) {
		      totalUsedPoint += usedPoint;
		    }
		  });
		  return totalUsedPoint;
		}
	
	function updateTotalUsedPoint() {
		  const totalProductPrice = calculateProductPrice();
		  const totalProductSalePrice = calculateProductSalePrice();
		  let totalUsedPoint = calculateTotalUsedPoint();
		  const totalShippingPrice = calculateShippingPrice();
		  const totalSalePrice = totalUsedPoint + totalProductSalePrice;
		  const totalPrice = totalProductPrice - totalSalePrice;
		  const addPoint = totalPrice * 0.03;
		  const buyPoint = totalPrice * 0.01;
		  const reviewPoint = totalPrice * 0.02;
		  const finalPrice = totalPrice + totalShippingPrice;
		  document.getElementById("totalShippingPrice").innerText = totalShippingPrice.toLocaleString() + "원";
		  document.getElementById("productTotalPrice").innerText = totalProductPrice.toLocaleString() + "원";
		  document.getElementById("totalProductSalePrice").innerText = totalProductSalePrice.toLocaleString() + "원";
		  document.getElementById("totalSalePrice").innerText = totalSalePrice.toLocaleString() + "원";
		  document.getElementById("totalSalePrice2").innerText = "-" + totalSalePrice.toLocaleString() + "원";
		  document.getElementById("totalSalePrice3").innerText = "-" + totalSalePrice.toLocaleString() + "원";
		  document.getElementById("totalUsedPoint").innerText = totalUsedPoint.toLocaleString() + "원";
		  document.getElementById("totalPrice").innerText = finalPrice.toLocaleString() + "원";
		  document.getElementById("finalPrice").innerText = finalPrice.toLocaleString() + "원 결제하기";
		  document.getElementById("addPoint").innerText = "최대 " + addPoint.toLocaleString() + "원";
		  document.getElementById("buyPoint").innerText = "+ " + buyPoint.toLocaleString() + "원";
		  document.getElementById("reviewPoint").innerText = "+ " +  reviewPoint.toLocaleString() + "원";
		  document.getElementById("ordersTotalPrice").value = finalPrice;
		}

		document.addEventListener("DOMContentLoaded", function() {
		  const totalProductPrice = calculateProductPrice();
		  const totalProductSalePrice = calculateProductSalePrice();
		  let totalUsedPoint = calculateTotalUsedPoint();
		  const totalShippingPrice = calculateShippingPrice();
		  const totalSalePrice = totalUsedPoint + totalProductSalePrice;
		  const totalPrice = totalProductPrice - totalSalePrice;
		  const finalPrice = totalPrice + totalShippingPrice;
		  document.getElementById("totalShippingPrice").innerText = totalShippingPrice.toLocaleString() + "원";	
		  document.getElementById("productTotalPrice").innerText = totalProductPrice.toLocaleString() + "원";
		  document.getElementById("totalProductSalePrice").innerText = totalProductSalePrice.toLocaleString() + "원";
		  document.getElementById("totalSalePrice").innerText = totalSalePrice.toLocaleString() + "원";
		  document.getElementById("totalSalePrice2").innerText = "-" + totalSalePrice.toLocaleString() + "원";
		  document.getElementById("totalSalePrice3").innerText = "-" + totalSalePrice.toLocaleString() + "원";
		  document.getElementById("totalUsedPoint").innerText = totalUsedPoint.toLocaleString() + "원";
		  document.getElementById("finalPrice").innerText = finalPrice.toLocaleString() + "원 결제하기";
		  document.getElementById("totalPrice").innerText = finalPrice.toLocaleString() + "원";
		  document.getElementById("ordersTotalPrice").value = finalPrice;

		  const inputs = document.querySelectorAll('input[name^="orderProductDtoList"]');
		  inputs.forEach(input => {
		    input.addEventListener("input", updateTotalUsedPoint);
		    input.value = "";
		  });

		  updateTotalUsedPoint(); // 초기화 함수 호출
		});
		
		function submitOrderForm() {
			  var orderProductDtoList = [];
			  <%-- orderProductDtoList에 데이터 추가하는 부분 --%>
			  <c:forEach var="item" items="${data}" varStatus="status">
			    var orderProduct = {
			      order_product_quantity: '${product_amount[status.index]}',
			      order_product_price: ('${item.optionInfo.product_option_price}' - '${item.salePrice}') * '${product_amount[status.index]}',
			      product_option_no: '${item.optionInfo.product_option_no}',
			      order_product_used_point: document.getElementById('point-${status.index}').value
			    };
			    orderProductDtoList.push(orderProduct);
			  </c:forEach>

			  var ordersDto = {
			    customer_no: '${sessionUser.customer_no}',
			    orders_address_name: '${mainAddress.customer_address_name}',
			    orders_receiver_name: '${mainAddress.customer_address_receiver}',
			    orders_address_phone: '${mainAddress.customer_address_phone}',
			    orders_address: '${mainAddress.customer_address_main}',
			    orders_detail_address: '${mainAddress.customer_address_detail}',
			    orders_shipping_message: '${orders_shipping_message}',
			    orders_total_price: document.getElementById("ordersTotalPrice").value,
			    orders_payment_method: '카카오페이'
			  };
			  
			  var requestData = {
					  orderProductDtoList: orderProductDtoList,
					  ordersDto: ordersDto
					};
			  var xhr = new XMLHttpRequest();
			  xhr.open("POST", "./orders");
			  xhr.setRequestHeader("Content-Type", "application/json");
			  xhr.onreadystatechange = function() {
			      if (xhr.readyState === XMLHttpRequest.DONE) {
			          if (xhr.status === 200) {
			              
			              var response = JSON.parse(xhr.responseText);
			              console.log(response);
			              
			              window.location.href = "./payPage.jsp"; 
			              // 추가적인 처리 작업 수행
			          } else {
			              // 처리 중 오류가 발생한 경우
			              console.error("Failed to process the request");
			              console.log(orderProductDtoList);
			              console.log(ordersDto);
			              
			          }
			      }
			  };

			  
			  xhr.send(JSON.stringify(requestData));	
		
		} 
</script>



<style type="text/css">
.product-thum {
	height: 5em;
}

.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}
</style>
</head>
<body>
	<form action="./orders" method="post">
		<input type="hidden" name="customer_no"
			value="${sessionUser.customer_no}">
	
		<div class="container align-items-center justify-content-center">

			<div class="row  mt-2 align-items-center">
				<div class="col-1 ">
					<a class="btn bi bi-arrow-left fs-4" role="button"
						onclick="history.back()"> </a>
				</div>
				<div class="col-10 fw-bold" style="text-align: center;">결제</div>
				<div class="col-1"></div>
			</div>

			<div class="row mt-2 border-bottom "></div>
			<div class="row mt-2 ">
			<div class=" col-1"></div>
				<div class="col-7 fw-bold">주문상품</div>
				<div class="col "></div>
				<div class="row mt-2 "></div>
			</div>
			<div id="buyPageContainer">
			<c:forEach var="item" items="${data}" varStatus="status">
			   		
					<input type="hidden" name="orderProductDtoList[${status.index}].order_product_quantity" value="${product_amount[status.index]}">
					<input type="hidden" name="orderProductDtoList[${status.index}].order_product_price" value="${(item.optionInfo.product_option_price - item.salePrice) * product_amount[status.index]}">
					<input type="hidden" name="orderProductDtoList[${status.index}].product_option_no" value="${item.optionInfo.product_option_no}">

			    <div class="row mt-2">
			        <div class="col-1"></div>
			        <div class="col-10 border rounded-2">
			            <div class="row mt-2">
			                <div class="col-4 embed-responsive embed-responsive-4by3">
			                    <img src="/uploadFiles/WelcomePet/${item.productInfo.product_thumbnail}" class="embed-responsive-item product-thum" alt="...">
			                </div>
			                <div class="col">
			                    <div class="row mt-1 fw-bold">

			                        <div class="col" style="font-size: 0.8em;">${item.productInfo.product_name}</div>
			                    </div>
			                    <div class="row mt-1 fw-bold">

			                        <div class="col text-secondary" style="font-size: 0.7em;">${item.optionInfo.product_option_name}</div>
			                         <div class="col text-secondary text-end" style="font-size: 0.8em;"><del><span> ${item.optionInfo.product_option_price * product_amount[status.index]}</span>원</del></div>
			                    </div>			                    
			                    <div class="row fw-bold">
			                        <div class="col text-secondary" style="font-size: 0.7em;">수량 <span>${product_amount[status.index]}</span>개</div>
			                       <div class="col fw-bold text-end"> <span>${(item.optionInfo.product_option_price - item.salePrice) * product_amount[status.index]}</span>원</div>
			                    </div>

			                </div>
			            </div>
			            <div class="row mt-2">
			            <div class="col " style="font-size: 0.9em;"> 적립금 혜택 </div>
			            	<div class="col text-end text-primary fw-bold" style="font-size: 0.8em;">  <span>${((item.optionInfo.product_option_price - item.salePrice) * product_amount[status.index] * 0.03)}</span>원 적립</div>
			            </div>
			            <div class="row mt-1 ">
			            <div class="col " style="font-size: 0.9em;"> 적립금 사용</div>
			            	<div class="col justify-content-end " style="font-size: 0.8em;"> 
			            	<input class="form-control text-end"  id="point-${status.index}"  type="number" name="orderProductDtoList[${status.index}].order_product_used_point" value="0" 
			            	style="height: 25px; width: 125px; margin-left: auto; font-size: 1em;" min="0"
			            	  oninput="updateTotalUsedPoint()">
							</div>
			            </div>
			            <div class="row">
			            <div class="col text-secondary text-end" style="font-size: 0.7em;"> 
			            사용가능 적립금 : <span>${sessionUser.customer_point }원</span> </div>
			            </div>			            			            
			            <div class="row mt-3 border-top"></div>
			            <div class="row mt-3 fw-bold">
			                <div class="col-6">총 상품 금액</div>
			                <div class="col text-end text-primary ">
			                    ${(item.optionInfo.product_option_price - item.salePrice) * product_amount[status.index]}원
			                </div>
			            </div>

			            <div class="row mt-2"></div>
			        </div>
			    </div>
			</c:forEach>
			</div>
			<div class="row mt-2 empty"></div>

			<div class="row">
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed " type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
								<strong>주문자 정보 </strong>
							</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<div class="row">
									<div class="col">${sessionUser.customer_name}
										(${sessionUser.customer_phone})</div>
								</div>
								<div class="row">
									<div class="col">${sessionUser.customer_id}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-2 empty"></div>
			<div class="row mt-2">
				<div class="col-1"></div>
				<div class="col">
					<div class="row">
						<div class="col">
							<strong class="me-3">배송지 정보 </strong>
							<button class=" btn btn-outline-secondary btn-sm" type="button">
								변경</button>
						</div>
					</div>
					<div class="row  mt-2 border rounded-2">
					<div class="row mt-2 " style="font-size: 0.9em;">
						<div class="col">${mainAddress.customer_address_name }</div>
						<input type="hidden" name="orders_address_name"
							value="${mainAddress.customer_address_name }">
					</div>
					<div class="row text-secondary" style="font-size: 0.9em;">
						<div class="col">${mainAddress.customer_address_receiver}
							(${mainAddress.customer_address_phone })</div>
							
						<input type="hidden" name="orders_receiver_name"
							value="${mainAddress.customer_address_receiver }"> 
							
						<input type="hidden" name="orders_address_phone"
							value="${mainAddress.customer_address_phone }">
					</div>
					<div class="row text-secondary" style="font-size: 0.9em;">
						<div class="col">${mainAddress.customer_address_main }
							(${mainAddress.customer_address_detail })</div>
						<input type="hidden" name="orders_address"
							value="${mainAddress.customer_address_main }"> <input
							type="hidden" name="orders_detail_address"
							value="${mainAddress.customer_address_detail }">
					</div>
					<div class="row mt-2">
						<div class="col">
							<input class="form-control" type="text"
								name="orders_shipping_message" placeholder="배송 요청사항">
						</div>
					</div>
					<div class="row mt-2"></div>
				</div>
				</div>
				<div class="col-1"></div>
			</div>
			

			<div class="row mt-2 empty"></div>


		<div class="row">
			<div class="accordion accordion-flush mx-0 px-0 " id="accordionFlush3">
				<div class="accordion-item mx-0 px-0">
					<h2 class="accordion-header" id="flush-headingTwo">
						<button class="accordion-button collapsed " type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
							aria-expanded="false" aria-controls="flush-collapseTwo">
							<div class="col">
								<strong> 쿠폰/할인/적립금</strong>
							</div>
							<div class="col text-end fw-bold" style="font-size: 0.8em;">
								<span class="text-end text-danger" id="saleRate"> SAVE</span>
								<span class="text-end text-primary" id="totalSalePrice"> 0원</span>
							</div>
						</button>
					</h2>
					<div id="flush-collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="flush-headingTwo"
						data-bs-parent="#accordionFlush3">
						<div class="accordion-body" style="font-size: 0.9em;">
							<div class="row mt-2  ps-0 " >
								<div class="col " >상품할인</div>
								<div class="col text-end text-primary" id="totalProductSalePrice"></div>
							</div>
							<div class="row mt-2">
								<div class="col">적립금 할인</div>
								<div class="col text-end" id="totalUsedPoint">0원</div>
							</div>				
							<div class="row mt-2">
								<div class="col">쿠폰 할인</div>
								<div class="col text-end" id="couponSale">0원</div>
							</div>
							<div class="row mt-3">
								<div class="col-3"> 쿠폰 </div>
							<div class="col text-end">
							  <div class="input-group" >
							    <input class="form-control text-end" type="number" value="0" readonly style="height: 30px; width: 50px;">
							    <button type="button" class="btn btn-secondary btn-sm" style="height: 30px;">쿠폰 조회</button>
							  </div>
							</div>
							</div>
							<div class="row mt-3  fw-bold">
								<div class="col">할인 합계</div>
								<div class="col text-end text-primary" id="totalSalePrice2">0원</div>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>

			<div class="row mt-2 empty"></div>

			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col">
							<strong>결제 수단</strong>
						</div>
					</div>
					<div class="row">
						<div class="col">결제수단 리스트들</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>

			<div class="row mt-2 empty"></div>
			<div class="row ">
				<div class="col">
					<div class="row mt-2">
						<div class="col">
							<strong>결제 정보</strong>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-2 border-top">
				<div class="row mt-2">
					<div class="col ms-2">총 상품 금액</div>
					<div class="col text-end" id="totalProductPrice">
					</div>
				</div>
				<div class="row mt-2 text-secondary" style="font-size: 0.9em;" >
					<div class="col-1"></div>
					<div class="col ">상품 
						금액</div>
					<div class="col text-end" id="productTotalPrice">
						</div>
				</div>
				<div class="row mt-2 text-secondary" style="font-size: 0.9em;" >
					<div class="col-1"></div>
					<div class="col ">할인 합계</div>
					<div class="col text-end" >
								<span class="text-end text-danger" id="saleRate"> SAVE</span>
								<span class="text-end text-primary" id="totalSalePrice3"> 0원</span>					
						</div>
				</div>				

				<div class="row mt-2">
					<div class="col ms-2">총 배송비</div>
					<div class="col text-end" id="totalShippingPrice">
						</div>
				</div>
			</div>
		</div>
		<div class="row border-top mt-2"></div>
		<div class="row mt-2 fw-bold" style="font-size: 1.2em;">
			
			<div class="col ms-3">최종 결제 금액</div>
			<div class="col text-end">
				<input type="hidden" name="orders_total_price" id="ordersTotalPrice"
					value="">
 				<strong id="totalPrice"></strong>
			</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 empty"></div>

		<div class="row">
			<div class="accordion accordion-flush" id="accordionFlushPoint">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingPoint">
						<button class="accordion-button collapsed " type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapsePoint"
							aria-expanded="false" aria-controls="flush-collapsePoint">
							<div class="col">
								<strong>적립금 혜택 </strong>                        
							</div>
							<div class="col text-end">
								<span class="text-end text-primary fw-bold" id="addPoint">
									
								</span>
							</div>

						</button>
					</h2>
					<div id="flush-collapsePoint" class="accordion-collapse collapse show"
						aria-labelledby="flush-headingPoint"
						data-bs-parent="#accordionFlushPoint">
						<div class="accordion-body">
							<div class="row text-secondary" style="font-size: 0.9em;">
								<div class="col">구매 확정 시 적립</div>
								<div class="col text-end" id="buyPoint">
									
								</div>
							</div>
							<div class="row text-secondary" style="font-size: 0.9em;">
								<div class="col">리뷰 작성 시 적립</div>
								<div class="col text-end" id="reviewPoint">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-2 empty"></div>



		<div class="row mt-2">
			<div class="col ">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="d-grid gap-2">
							<button class="btn btn-primary btn-lg" type="button" onclick="submitOrderForm()" >
								<div class="row fs-5">
									<div class="col text-center" id="finalPrice"></div>
								</div>
							</button>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
			</div>

		</div>
	</form>
	<div class="row mt-2"></div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
