<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}

.product-thum {
	width: 100%;
}

.card-img-top {
	height: 6rem;
	object-fit: cover;
}

.card-footer {
	font-size: 13px;
}

.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}

.gpdHea {
	background-color: rgb(254, 212, 136);
	border-radius: 8px;
	margin-right: 24px;
	font-size: 14px;
	font-weight: 700;
	padding: 10px 12px;
	display: flex;
	flex-flow: row nowrap;
	place-content: center space-between;
	-webkit-box-pack: justify;
	-webkit-box-align: center;
	align-items: center;
	color: rgb(27, 30, 33);
}

.always-show-button {
	position: fixed;
	box-shadow: rgba(0, 0, 0, 0.04) 0.2rem 0.4rem;
	
	bottom: 3em;
	right: 1.5em;
	width: 1.2em;
	height: 1.2em;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	font-size: 2em;
	cursor: pointer;
	opacity: 1;
	z-index: 1000;
}
</style>
</head>
<body>



	<div class="container embed-responsive embed-responsive-4by3 ">
		<jsp:include page="../common/topMyNavi.jsp"></jsp:include>

		<div class="row mb-3">
			<div class="col btn text-start">
				<div class="row mt-2">
					<div class="col fw-bold">${sessionUser.customer_nickname }님</div>
					<div class="col-4 text-end" style="font-size: 0.8em;">
						<a href="./updateMyInfo"
							class="text-decoration-none text-secondary "> 내 정보 변경</a>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">${sessionUser.customer_id }</div>
				</div>
			</div>
			<div class="row"></div>
		</div>
		<div class="row ">
			<div class="col px-0 ms-0">
				<img src="/welcomepet/resources/img/banner/banner5.jpg"
					class="product-thum" style="width:;" alt="...">
			</div>
		</div>

		<div class="row mt-3 ">
			<div class="col">
				<div class="row mt-2">
					<div class="col fw-bold">반려동물</div>
					<div class="col-3 text-end">
						<a href="./registDog" class="text-decoration-none text-secondary "
							style="font-size: 0.8em;"> 추가하기</a>
					</div>
				</div>
				<div class="row mt-2 mb-3">
					<c:forEach items="${dogInfo}" var="list">
						<div class="col-1"></div>
						<div class="col-4 card mt-3">
							<a
								href="/welcomepet/snap/dogProfile?dog_no=${list.dogInfo.dog_no }"><img
								src="/uploadFiles/WelcomePet/${list.dogInfo.dog_image}"
								class="card-img-top embed-responsive-item" alt="..."></a>
							<div class="card-footer ">
								<div class="row">
									<div class="col fw-bold text-center">${list.dogInfo.dog_name }
									</div>
								</div>

							</div>
						</div>
						<div class="col-1"></div>
					</c:forEach>
					<div class="row mt-3">
						<div class="gpdHea ms-3">
							<span class="ps-2">1분만에 🐶 국가동물등록 신청하기 </span> <i
								class="fw-bold text-end bi bi-chevron-right"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2 empty"></div>
		<div class="row mt-3">
			<div class="col fw-bold">MY 쇼핑</div>
		</div>
		<div class="row mt-3 px-3 mb-3 text-center" style="font-size: 0.9em;">
			<div class="col">
				<div class="row">
					<div class="col">주문·배송</div>
				</div>
				<div class="row mt-1 fw-bold">
					<div class="col ">5</div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col">리뷰</div>
				</div>
				<div class="row mt-1 fw-bold">
					<div class="col text-center fw-bold">3</div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col">쿠폰</div>
				</div>
				<div class="row mt-1 fw-bold">
					<div class="col text-center">1</div>
				</div>
			</div>
			<div class="col">
				<div class="row ">
					<div class="col">적립금</div>
				</div>
				<div class="row mt-1 fw-bold">
					<div class="col text-center">500원</div>
				</div>
			</div>
		</div>
		<div class="row mt-2 empty"></div>
		<div class="row mt-2 ">
			<div class="col fs-6">
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start"
						onclick="location.href='./orderList'">주문·배송 내역</div>
				</div>
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start">교환·반품 내역</div>
				</div>
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start"
						onclick="location.href='../board/recentProductList?customer_no=${sessionUser.customer_no}'">최근
						본 상품</div>
				</div>
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start"
						onclick="location.href='./wishList'">
						찜한상품 <span class=" ps-2 text-primary fw-bold">3</span>
					</div>
				</div>
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start"
						onclick="location.href='./myReview'">리뷰관리</div>
				</div>
				<div class="row mt-1 border-bottom ">
					<div class="col btn text-start"
						onclick="location.href='./address?customer_no=${sessionUser.customer_no}'">
						배송지 관리</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col fs-6">
				<div class="row ">
					<div class="col btn text-start fw-bolder">고객 서비스</div>
				</div>
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start">자주하는 질문</div>
				</div>
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start"
						onclick="location.href='./myInquiry'">문의내역</div>
				</div>
				<div class="row mt-1 border-bottom">
					<div class="col btn text-start"
						onclick="location.href='./addInquiry'">1:1 문의하기</div>
				</div>
				<div class="row mt-1 ">
					<div class="col btn text-start">공지사항</div>
				</div>
				<div class="row mt-2"></div>
			</div>
		</div>
		<div class="always-show-button" id="kakao-talk-channel-chat-button"
			data-channel-public-id="_BMbZG" data-title="consult"
			data-size="small" data-color="yellow" data-shape="pc"
			data-support-multiple-densities="true"></div>


		<div class="row">
			<jsp:include page="../common/serviceNavi.jsp"></jsp:include>
			<jsp:include page="../common/bottomNavi2.jsp"></jsp:include>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
<script>
	window.kakaoAsyncInit = function() {
		Kakao.Channel.createChatButton({
			container : '#kakao-talk-channel-chat-button',
		});
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.channel.min.js';
		js.integrity = 'sha384-suN4Zc1CFiRm8j96GVFtk9WqRwjWWhDoYbIrYCXyrsvKZZ2XRUIoUyH/AyjszUEj';
		js.crossOrigin = 'anonymous';
		fjs.parentNode.insertBefore(js, fjs);
	})(document, 'script', 'kakao-js-sdk');
</script>
</html>