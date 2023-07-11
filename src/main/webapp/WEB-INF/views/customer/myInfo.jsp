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

		<div class="row  mt-2 align-items-center" >
			<div class="col-1 d-flex ">
			<a class="btn bi bi-arrow-left fs-4" role="button"
					href="./my"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;"> 내 정보</div>		
			<div class="col-1"> </div>
		</div>
		<div class="row mt-2 border-bottom "> </div>
		<div class="row mt-3 border-bottom  ">
			<div class="col " onclick="location.href='./updateMyInfo'">내 정보
				변경</div>
			<div class="col-1 d-flex align-items-center justify-content-center">
				<i class="bi bi-chevron-right"></i>
			</div>
		</div>
		<div class="row mt-3 border-bottom ">
			<div class="col "
				onclick="location.href='./address?customer_no=${sessionUser.customer_no}'">
				배송지 관리</div>
			<div class="col-1 d-flex align-items-center justify-content-center">
				<i class="bi bi-chevron-right"></i>
			</div>
		</div>
		<div class="row mt-3 border-bottom ">
			<div class="col ">마케팅정보 수신 동의</div>
			<div class="col-1 d-flex align-items-center justify-content-center">
				<i class="bi bi-chevron-right"></i>
			</div>
		</div>
		<div class="row mt-3 border-bottom ">
			<div class="col ">로그아웃</div>
			<div class="col-1 d-flex align-items-center justify-content-center">
				<i class="bi bi-chevron-right"></i>
			</div>
		</div>
		<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>