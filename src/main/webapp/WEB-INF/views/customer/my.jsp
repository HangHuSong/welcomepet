<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>마이페이지</title>

<style type="text/css">

@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body {
	font-family: 'SUITE-Regular';
}

.card-img-top {
  height: 6rem;
  object-fit: cover;
}
.card-footer {
	font-size: 13px;
}

</style>
</head>
<body>
	
	

	<div class="container embed-responsive embed-responsive-4by3 ">
		<jsp:include page="../common/topMyNavi.jsp"></jsp:include>
		
		<div class="row">
			<div class="col btn text-start" onclick="location.href='./myInfo'">
				<div class="row mt-4">
					<div class="col fw-bold">${sessionUser.customer_nickname }님</div>
				</div>
				<div class="row mt-2">
					<div class="col">${sessionUser.customer_id }</div>
				</div>
			</div>
			<div class="row"></div>
		</div>
		<div class="row mt-4 border-top">
			<div class="col">
				<div class="row mt-2">
				<div class="col fw-bold">
					반려동물
				</div>
					<div class="col-3 text-end"> 
				<a href="./registDog" class="text-decoration-none text-secondary ">
						추가하기</a>
					</div>
			</div>
				<div class="row mt-3">
				<c:forEach items="${dogInfo}" var="list">
					<div class="col-1"></div>
					<div class="col-4 card mt-3">
						<a href="/welcomepet/snap/dogProfile?dog_no=${list.dogInfo.dog_no }"><img src="/uploadFiles/WelcomePet/${list.dogInfo.dog_image}" class="card-img-top embed-responsive-item" alt="..."></a>
						<div class="card-footer ">
						<div class="row">
							<div class="col fw-bold text-center">${list.dogInfo.dog_name } </div> 
							</div>

						</div>
					</div>
					<div class="col-1"></div>
					</c:forEach>
					</div>
				</div>
			</div>
			<div class="row mt-4 border-top">
					<div class="col fs-6">
					<div class="row mt-1 border-bottom">
						<div class="col btn text-start" onclick="location.href='./orderList'" >주문·배송 내역</div>
					</div>
					<div class="row mt-1 border-bottom">
						<div class="col btn text-start" >교환·반품 내역</div>
					</div>					
					<div class="row mt-1 border-bottom">
						<div class="col btn text-start" onclick="location.href='./wishList'">찜한상품</div>
					</div>
					<div class="row mt-1 border-bottom">
						<div class="col btn text-start" onclick="location.href='./myReview'" >리뷰관리</div>
					</div>														
				</div>
		</div>
			<div class="row mt-4">
					<div class="col fs-6">
					<div class="row ">
						<div class="col btn text-start fw-bolder" >고객 서비스</div>
					</div>
					<div class="row mt-1 border-bottom">
						<div class="col btn text-start" >자주하는 질문</div>
					</div>					
					<div class="row mt-1 border-bottom">
						<div class="col btn text-start" >문의내역</div>
					</div>
					<div class="row mt-1 border-bottom">
						<div class="col btn text-start" >리뷰관리</div>
					</div>														
				</div>
		</div>
		<div class="row mt-4">
		<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
		</div>
		</div>
		

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>