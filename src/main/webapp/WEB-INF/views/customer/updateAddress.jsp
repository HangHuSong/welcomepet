<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>

	<div class="container align-items-center justify-content-center">

		<div class="row  mt-2 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left" role="button"
					href="./address?customer_no=${sessionUser.customer_no}"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;">배송지 수정</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-3 border-bottom "></div>
		<div class="row mt-3  ">
			<div class="col-1"></div>
			<div class="col">
				<form action="./updateCustomerAddressProcess" method="post">
					<input type="hidden" name="customer_address_no"
						value="${addressInfo.customer_address_no }"> <input
						type="hidden" name="customer_no"
						value="${addressInfo.customer_no }">
					<div class="row mt-3">
						<div class="col">배송지명</div>
					</div>
					<div class="row">
						<div class="col ">
							<input class="form-control" type="text"
								name="customer_address_name"
								value="${addressInfo.customer_address_name }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">받으시는 분</div>
					</div>
					<div class="row">
						<div class="col ">
							<input class="form-control" type="text"
								name="customer_address_receiver"
								value="${addressInfo.customer_address_receiver }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">주소</div>
					</div>
					<div class="row">
						<div class="col ">
							<input class="form-control" type="text" name="customer_address_main"
								value="${addressInfo.customer_address_main }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">상세주소</div>
					</div>
					<div class="row">
						<div class="col ">
							<input class="form-control" type="text"
								name="customer_address_detail"
								value="${addressInfo.customer_address_detail }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">전화번호</div>
					</div>
					<div class="row">
						<div class="col ">
							<input class="form-control" type="text"
								name="customer_address_phone"
								value="${addressInfo.customer_address_phone }">
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-2"></div>
						<div class="col text-center">
							<input type="checkbox" name="isDefaultAddress"
								id="defaultAddressCheckbox" > 
							<label for="defaultAddressCheckbox">기본 배송지로 설정</label>
						</div>
						<div class="col-2"></div>
					</div>
					<div class="row mt-4">
						<div class="col-3"></div>
						<div class="col text-center ">
							<button class="btn btn-primary">변경 완료</button>
						</div>
						<div class="col-3"></div>
					</div>
				</form>
			</div>
			<div class="col-1"></div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>