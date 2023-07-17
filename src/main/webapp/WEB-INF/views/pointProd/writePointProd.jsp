<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="container">
		<form action="./writePointProdProcs" method="post"
			enctype="multipart/form-data">
			<div class="row fixed-top">
				<div class="col-12 border-bottom py-2">
					<div class="row mb-1">
						<div class="col-3">
							<button onclick="history.back()" class="btn btn-black">
								<i class="btn bi bi-chevron-left p-0"></i>
							</button>
						</div>
						<div class="col-6 mt-1 text-center fw-bold 16px">글쓰기</div>
						<div class="col-3">
							<button class="btn text-secondary" type="submit">등록</button>
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
							<div class="row pt-3">
								<div class="col fs-5">
									<input type="text" class=form-control-plaintext
										name="point_product_title" placeholder="제목을 입력해주세요.">
								</div>
							</div>
							<div class="row pt-2">
								<div class="col">
									<textarea class="form-control-plaintext"
										name="point_product_content" placeholder="내용을 입력해주세요."></textarea>
								</div>
							</div>

							<div class="col fs-5">
								<input type="text" class=form-control-plaintext
									name="point_product_price" placeholder="가격을 입력해주세요.">
							</div>

							<div class="col fs-5">
								<input type="text" class=form-control-plaintext
									name="point_product_total_amount" placeholder="수량을 입력해주세요.">
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
							<input name="pointProdFiles" type="file" multiple accept="image/*">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>