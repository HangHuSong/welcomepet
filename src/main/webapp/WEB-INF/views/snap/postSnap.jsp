<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

	body{
		font-family: 'SUITE-Regular'; 		
	}
	#postSnap{
		font-family: 'Jua', sans-serif;
		font-weight: 700;
		font-size: 1.3em;
		color: #fd7e14;
	}
</style>
<title>스냅샷 작성하기</title>
</head>
<body>
<div class="container">

	<!-- top navigation -->
	<div class="row shadow-sm p-3 mb-5 bg-body-tertiary rounded">
		<div class="col">
			<nav class="navbar navbar-dark bg-white d-flex fixed-top  border-bottom fw-bold">
				<div class="col-2">
					<a class="btn bi bi-arrow-left fs-4" role="button"
						href="/welcomepet/board/main"> </a>
				</div>
				<div class="col-1"></div>
				<div class="col-6" style="text-align: center;" id="postSnap">스냅 작성</div>
				<div class="col-1 ">
					<a class="btn bi bi-search fs-3" role="button" href="/welcomepet/board/search"></a>
				</div>
				<div class="col-2">
					<a class="btn bi bi-cart2 fs-4" role="button" href="/welcomepet/customer/cart"></a>
				</div>
			</nav>
		</div>
	</div>
	
	<div class="row mt-3 mb-5">
		<div class="col">
			<form action="postSnapProcess" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col">
						<label class="form-label">아가를 선택해주세요</label>
						<select name="dog_no" class="form-control">
							<c:forEach items="${list}" var="dog">
								<option value="${dog.dogDto.dog_no}">${dog.dogDto.dog_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<textarea rows="10" cols="10" class="form-control" name="snap_board_content"></textarea>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<label class="form-label">대표 이미지</label>
						<input type="file" class="form-control" name="thumbnail" accept="image/*">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<label class="form-label">이미지들</label>
						<input type="file" class="form-control" name="snap_imgs" accept="image/*" multiple>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<label class="form-label">상품 태그</label>
						<select class="form-control">
							<option>루비디 러블리바니 민소매 티셔츠 민트 M</option>
						</select>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<label class="form-label">위치</label>
						<input type="text" class="form-control" name="snap_location" placeholder="장소를 입력해주세요">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col d-grid">
						<button class="btn bi bi-upload" style="background-color: #fd7e14;"></button>
					</div>
				</div>
			</form>
		</div>	
	</div>




	<!-- bot navigation -->
	 <div class="row mb-4">
		<div class="col">
		<div class="navbar navbar-dark bg-white fixed-bottom border-top">
			<div class="col text-center">
				<a class="btn bi bi-microsoft text-secondary " href="/welcomepet/customer/search" role="button""> </a>
			</div>
			<div class="col ">
				<a class="btn bi bi-chat-square-text" role="button" href="/welcomepet/snap/main"> </a>
			</div>
			<div class="col ">
				<a class="btn bi bi-house" role="button" href="/welcomepet/board/main"> </a>
			</div>
			<c:choose>
				<c:when test="${!empty sessionUser }">
					<div class="col ">
						<a class="btn bi bi-heart" role="button" href="/welcomepet/customer/wishList"></a>
					</div>
					<div class="col ">
						<a class="btn bi bi-person-circle text-secondary" role="button" href="/welcomepet/customer/my"> </a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col ">
						<a class="btn bi bi-heart" role="button" href="/welcomepet/customer/login"></a>
					</div>
					<div class="col ">
						<a class="btn bi bi-person-circle text-secondary" role="button" href="/welcomepet/customer/login"> </a>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>