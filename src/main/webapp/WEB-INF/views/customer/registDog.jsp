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
</head>
<body>

	<div class="container  align-items-center justify-content-center">
		<div class="row  mt-3 align-items-center border-bottom">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button" href="./my">
				</a>
			</div>
			<div class="col fw-bold" style="text-align: center;">반려견 등록</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10 ">
				<form action="./registDogProcess" method="post" enctype="multipart/form-data">
					<div class="row mt-4">
						<div class="col ">
							<input class="form-control" type="text" name="dog_name"
								placeholder="반려견 이름">
						</div>
					</div>
					
					<div class="row mt-3">
						<div class="col ">
							<input class="form-control" type="text" name="dog_weight"
								placeholder="몸무게">
						</div>
					</div>
					<div class="row">
						<div class="col mt-3">품종</div>
					</div>
					<div class="row">
						<div class="col">
							<select class="form-select" aria-label="Default select example"
								name="dog_breed_no">
								<option selected>선택하세요</option>
								<option value="1">말티즈</option>
								<option value="2">시츄</option>
								<option value="3">요크셔</option>
							</select>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col ">
							성별 : <input type="radio" name="dog_gender" value="M">남 <input
								type="radio" name="dog_gender" value="F">여
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">생일</div>
					</div>
					<div class="row">
						<div class="col ">
							<input class="form-control" type="date" name="dog_birth">
						</div>
					</div>
					<div class="row">
						<div class="col mt-3 ">프로필 사진</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<input class="form-control form-control-sm" name="dogImg"
								type="file" multiple accept="image/*">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
							<input class="form-control" type="text" name="dog_introduction"
								placeholder="소개글">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-3"></div>
						<div class="col text-center">
							<button class="btn btn-primary">등록</button>
						</div>
						<div class="col-3"></div>
					</div>
				</form>
			</div>


		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>