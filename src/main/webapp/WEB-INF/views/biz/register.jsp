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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col" style="height: 150px">
				<div class="d-none"></div>
			</div>
		</div>
		<div class="row my-3 text-center">
			<div class="col fs-1">어서오개</div>
		</div>
		<div class="row text-center">
			<div class="col-3"></div>
			<div class="col border">
				<!-- 회원가입정보 -->
				<form action="./registerProcess" method="post"
					enctype="multipart/form-data">
					<div class="row my-1 mt-4">
						<!-- 아이디(사업자번호) -->
						<div class="col-3">
							<label class="form-label">아이디</label>
						</div>
						<div class="col">
							<input class="form-control" name="biz_id" type="text">
						</div>
					</div>
					<div class="row my-1">
						<!-- 비밀번호 -->
						<div class="col-3">
							<label class="form-label">비밀번호</label>
						</div>
						<div class="col">
							<input class="form-control" name="biz_pw" type="password">
						</div>
					</div>
					<div class="row my-1">
						<!-- 폰 -->
						<div class="col-3">
							<label class="form-label">핸드폰번호</label>
						</div>
						<div class="col">
							<input class="form-control" name="biz_phone" type="text"
								placeholder="010-xxxx-xxxx">
						</div>
					</div>
					<div class="row my-1">
						<!-- 이메일 -->
						<div class="col-3">
							<label class="form-label">이메일</label>
						</div>
						<div class="col">
							<input class="form-control" name="biz_email" type="text"
								placeholder="name@example.com">
						</div>
					</div>
					<div class="row my-4">
						<div class="col d-grid">
							<button class="btn btn-primary">회원가입</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>