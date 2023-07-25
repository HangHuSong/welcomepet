<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style >
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body {
	font-family: 'SUITE-Regular';
}
</style>
</head>
<body>
<fmt:formatDate pattern="yyyy-MM-dd" value="${sessionUser.customer_birth}" var="birthDate" />
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
		<div class="row mt-3  ">
			<div class="col-1"></div>
			<div class="col">
				<form action="./updateMyInfoProcess" method="post">
				<input type="hidden" name="customer_no" value="${sessionUser.customer_no }">
					<div class="row mt-3">
						<div class="col">
						아이디 (이메일)
						</div>
					</div>
						<div class="row">
						<div class="col ">
							<input class="form-control" type="text" disabled
								placeholder="${sessionUser.customer_id }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						비밀번호
						</div>
					</div>
						<div class="row">
						<div class="col ">
							<input class="form-control" type="password" name="customer_pw" 
								value="${sessionUser.customer_pw }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						이름
						</div>
					</div>
						<div class="row">
						<div class="col ">
							<input class="form-control" type="text" name="customer_name" value="${sessionUser.customer_name }"
								placeholder="${sessionUser.customer_name }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						닉네임
						</div>
					</div>
						<div class="row">
						<div class="col ">
							<input class="form-control" type="text" name="customer_nickname" 
							value="${sessionUser.customer_nickname }"
							placeholder="${sessionUser.customer_nickname }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						전화번호
						</div>
					</div>
						<div class="row">
						<div class="col ">
							<input class="form-control" type="text" name="customer_phone" 
							value="${sessionUser.customer_phone }"
								placeholder="${sessionUser.customer_phone }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						생년월일
						</div>
					</div>
						<div class="row">
						<div class="col ">
							<input class="form-control" type="date" name="customer_birth" 
								value="${birthDate}">
						</div>
					</div>
					<div class="row mt-4">
					<div class="col-3"></div>
						<div class="col text-center "> <button class="btn btn-primary">변경 완료 </button></div>
						<div class="col-3"></div>
					</div>
				</form>
			</div>
			<div class="col-1"></div>
			<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
		</div>
		</div>



		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
</body>
</html>