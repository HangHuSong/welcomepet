<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
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
<title>내 배송지</title>

</head>
<body>
	
	<div class="container align-items-center justify-content-center">
		
		<div class="row  mt-1 align-items-center" >
			<div class="col-1 d-flex ">
			<a class="btn bi bi-arrow-left fs-4" role="button"
					href="./my"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;"> 배송지 관리</div>		
			<div class="col-1"> </div>
		</div>
		
		<div class="row mt-2 border-bottom "> </div>
		<div class="row mt-3">
			<div class="col-1"></div>
			<div class="col-7 fw-bold">배송지 </div>
			<div class="col "> 
			<a class="btn btn-light btn-sm" role="button"
					href="./addAddress"> 배송지 추가 </a></div>
		</div>
		
		<c:forEach items="${addressList}" var="map">
		<div class="row mt-3"> 
			<div class="col-1"></div>
			<div class="col border"> 
				<div class="row mb-2">
					<div class="col-1"> </div>
					<div class="col fw-bold">
			${map.customerAddressInfo.customer_address_name } </div>
				</div>
				<div class="row">
				<div class="col-1"> </div>
				<div class="col">
			${map.customerAddressInfo.customer_address_receiver } </div>
				</div>
				<div class="row">
				<div class="col-1"> </div>
				<div class="col">
			${map.customerAddressInfo.customer_address_main } </div>
				</div>
				<div class="row">
				<div class="col-1"> </div>
				<div class="col">
			${map.customerAddressInfo.customer_address_detail } </div>
				</div>
			<div class="row">
			<div class="col-1"> </div>
			<div class="col">
			${map.customerAddressInfo.customer_address_phone } </div>
				</div>
			<div class="row ">
				<div class="col-8"> </div>
				<div class="col text-end">
					<a class="btn btn-outline-secondary btn-sm " role="button"
					href="./updateAddress?customer_address_no=${map.customerAddressInfo.customer_address_no }"> 
					수정 </a>
				</div>									
			 </div>
			
		</div>
		<div class="col-1"></div>
			</div>
		</c:forEach>
		 </div>

		


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>