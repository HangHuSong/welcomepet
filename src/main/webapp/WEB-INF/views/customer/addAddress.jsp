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

		<div class="row  mt-3 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left" role="button" href="./address?customer_no=${sessionUser.customer_no}">
				</a>
			</div>
			<div class="col fw-bold" style="text-align: center;">배송지 추가</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-3 border-bottom "></div>
		<form action="./addAddressProcess" method="post">
		<input type="hidden" name="customer_no" value="${sessionUser.customer_no }">
		<input type="hidden" name="customer_address_default" value=0 >
		<div class="row"> 
			<div class="col-2"> </div>
			  <div class="col">
			<div class="row mt-3">
				<div class="col ">
					<input class="form-control" type="text" name="customer_address_name"
						placeholder="배송지명">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col ">
					<input class="form-control" type="text" name="customer_address_receiver"
						placeholder="받으시는 분">
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<input class="form-control" type="text" name="customer_address_main"
						placeholder="도로명주소">
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<input class="form-control" type="text" name="customer_address_detail"
						placeholder="상세주소">
				</div>
			</div>
			<div class="row">
				<div class="col mt-3 ">
					<input class="form-control" type="text" name="customer_address_phone"
						placeholder="연락처">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-3"></div>
				<div class="col text-center">
					<button class="btn btn-light">추가하기</button>
				</div>
				<div class="col-3"></div>
			</div>
			</div>
			<div class="col-2"></div>
			</div>
		</form>
		
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>