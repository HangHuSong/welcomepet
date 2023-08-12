<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeContent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style type="text/css">
@font-face {
	font-family: 'SUITE-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
		format('woff2');
	font-weight: 300 -900;
	font-style: normal;
}

#main {
	text-decoration: none;
	color: inherit;
	/* color: #F8961D; */
	/* font-family:'KorailRoundGothicBold', sans-serif !important; */
	font-family: 'Jua', sans-serif;
	font-weight: 700;
	font-size: 1.3em;
	color: #ffa500;
}
</style>
</head>
<body style="font-family: 'SUITE-Regular', sans-serif;">
	<div class="container">
		<div
			class="row fixed-top bg-white bg-body-tertiary shadow-sm px-3 pt-3">
			<div class="col-12 border-bottom pb-3">
				<div class="row">
					<div class="col-2">
						<a href="/welcomepet/pointProd/board"
							class="btn btn-black py-0 ps-2"
							style="border: transparent; outline: none;"><i
							class="bi bi-arrow-left"></i> </a>
					</div>
					<div class="col-1"></div>
					<div class="col-6 text-center" style="color: #fd7e14;">
						<a id="main" href="../pointProd/board">어서대화하개</a>
					</div>
					<div class="col"></div>
					<div class="col-2 pe-1">
						<form action="./writeContentProcess" method="post"
							enctype="multipart/form-data">
							<button class="btn text-secondary p-0 fw-semibold" type="submit"
								style="border: transparent; outline: none;">등록</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-5">
			<div class="col">
				<div class="row pt-3">
					<div class="col">
						<div class="row">
							<div class="col py-2">주제</div>
						</div>
						<div class="row">
							<div class="col">
								<select name="board_category_no" class="form-select fw-bold"
									aria-label="Default select example">
									<option value="1" selected>일상</option>
									<option value="2">질문</option>
									<option value="3">나눔</option>
								</select>
							</div>
						</div>
						<div class="row pt-3">
							<div class="col fs-5">
								<input type="text" class=form-control-plaintext
									name="board_title" placeholder="제목을 입력해주세요.">
							</div>
						</div>
						<div class="row pt-2">
							<div class="col">
								<textarea class="form-control-plaintext" name="board_content"
									placeholder="내용을 입력해주세요." style="height: 400px;"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row fixed-bottom border-top">
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-2 text-center p-0">
						<i class="bi bi-image" style="font-size: 2em;"></i>
					</div>
					<div class="col-9 text-center px-0 pb-0 pt-2">
						<input name="boardFiles" type="file" multiple accept="image/*">
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>