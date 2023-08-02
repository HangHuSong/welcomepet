<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
</style>
</head>
<body>
	<div class="row shadow px-3 mx-0"
		style="width: 1900px; font-family: 'Pretendard-Regular';">
		<div class="col py-4 fs-3 fw-bold">어서오개 seller office</div>
	</div>
	<div class="row text-start py-5"
		style="font-family: 'Pretendard-Regular';">
		<div class="col"></div>
		<div class="col-3 bg-white py-3 px-5">
			<!-- 회원가입정보 -->
			<div class="row text-center border-start border-end">
				<div class="col border-top border-3 border-primary px-0 py-2">일반회원</div>
				<div class="col border border-bottom-0 py-2 align-self-center">개인사업자</div>
				<div class="col border-top py-2 align-self-center">법인/기관</div>
			</div>
			<form action="./registerProcess" method="post"
				enctype="multipart/form-data">
				<div class="row my-2 mt-4">
					<!-- 아이디(사업자번호) -->
					<div class="col">
						<label for="biz_id" class="form-label">아이디</label> <input
							class="form-control" name="biz_id" type="text" id="biz_id">
					</div>
				</div>
				<div class="row my-2">
					<!-- 비밀번호 -->
					<div class="col">
						<label for="biz_pw" class="form-label">비밀번호</label> <input
							class="form-control" name="biz_pw" type="password" id="biz_pw">
					</div>
				</div>
				<div class="row my-2">
					<!-- 폰 -->
					<div class="col">
						<label for="biz_phone" class="form-label">핸드폰번호</label> <input
							class="form-control" name="biz_phone" type="text"
							placeholder="010-xxxx-xxxx" id="biz_phone">
					</div>
				</div>
				<div class="row my-2">
					<!-- 이메일 -->
					<div class="col">
						<label for="biz_email" class="form-label">이메일</label> <input
							class="form-control" name="biz_email" type="text"
							placeholder="name@example.com" id="biz_email">
					</div>
				</div>
				<div class="row my-4">
					<div class="col d-grid">
						<button class="btn btn-primary py-2">회원가입</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col"></div>
	</div>
	<div class="row text-center py-4">
		<div class="col text-secondary" style="font-size: 15px;">
			Copyright © WelcomePet Corp. All Rights Reserved.</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>