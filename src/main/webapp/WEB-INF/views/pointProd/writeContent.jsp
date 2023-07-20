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
</head>
<body>
	<div class="container">
		<form action="./writeContentProcess" method="post"
			enctype="multipart/form-data">
			<div class="row fixed-top">
				<div class="col-12 border-bottom py-2">
					<div class="row mb-1">
						<div class="col-3">
							<button onclick="history.back()" class="btn btn-black"><i
								class="btn bi bi-chevron-left p-0"></i>
							</button>
						</div>
						<div class="col-6 mt-1 text-center fw-bold 16px">글쓰기</div>
						<div class="col-3">
							<button class="btn text-secondary" type="submit" style="border: transparent; outline: none;">등록</button>
						</div>
					</div>
				</div>
				<div class="row my-1">
					<div class="col"></div>
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
			<div class="row fixed-bottom border-top pt-3">
				<div class="col">
					<div class="row">
						<div class="col-1 pb-2"></div>
						<div class="col-1 pb-2">
							<i class="bi bi-image" style="font-size: 2em;"></i>
						</div>
						<div class="col-10">
							<input name="boardFiles" type="file" multiple accept="image/*">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>