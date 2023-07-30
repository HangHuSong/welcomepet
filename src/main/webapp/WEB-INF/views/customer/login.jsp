<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
	</style>
</head>
<body>
	<div class="container">
		<%-- top navigation --%>
		<div class="row shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div class="col">
		<nav
			class="navbar navbar-dark bg-white d-flex fixed-top  border-bottom fw-bold 
			">
			<div class="col-2">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					href="/welcomepet/board/main"> </a>
			</div>
			<div class="col-8" style="text-align: center;">
				로그인 
			</div>

			<div class="col-2"></div>
		</nav>
	</div>
</div>
		<%-- -------------- --%>
		<form action="..	/customer/loginProcess" method="post">
			<div class="row mt-3">
			<div class="col text-center">
			 <img  src="/welcomepet/resources/img/logo.png" style="height:3em; ">
			 </div>
			</div>
			<div class="row mt-3">
				<div class="col-1"></div>
				<div class="col">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" name="customer_id"
								placeholder="아이디">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<input type="password" class="form-control" name="customer_pw"
								placeholder="비밀번호">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col d-grid">
							<button class="btn text-white"
								style="background-color: rgb(253, 152, 67);">로그인</button>
						</div>
					</div>

					<div class="row mt-2 text-secondary" style="font-size: 0.8em;">
						<div class="col text-center border-end align-self-center pe-0">아이디 찾기</div>
						<div class="col text-center border-end align-self-center">비밀번호 찾기</div>
						<div class="col ">
							<a class="btn px-0 py-0 text-secondary" href="./regist"
								style="font-size: 1em;">회원가입</a>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col justify-content-center">

							<button class="btn" >
								<img src="/welcomepet/resources/img/kakao_login.png" style="width: 100%;">
							</button>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
		</form>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>