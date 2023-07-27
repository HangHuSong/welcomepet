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
<title>1:1문의</title>
<style>
@font-face {
	font-family: 'SUITE-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'SUITE-Regular';
}

.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}

.upload-img-btn {
	float: left;
	display: block;
	width: 115px;
	height: 131px;
	margin: 0 6px 5px 0;
	background: url(/welcomepet/resources/img/upload_img.png) no-repeat
		center;
	background-size: 100% auto !important;
	overflow: hidden;
}

.text-area {
	display: flex;
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: center; /* 수평 가운데 정렬 */
	height: 8em;
	padding: 5px;
}

.text-area textarea {
	width: 100%;
	height: 100%;
	font-size: 0.9em;
	resize: none; /* 사용자가 크기를 조정하지 못하도록 설정 */
}
</style>
</head>
<body>

	<div class="container align-items-center justify-content-center">

		<div class="row  mt-1 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button" href="./my">
				</a>
			</div>
			<div class="col fw-bold" style="text-align: center;">1:1문의</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>
		<div class="row mt-4">
			<div class="col-4 py-1">
				<button class="btn btn-outline-secondary" style="width: 100%;">배송</button>
			</div>
			<div class="col-4 py-1">
				<button class="btn btn-outline-primary" style="width: 100%;">주문/결제</button>
			</div>
			<div class="col-4 py-1">
				<button class="btn btn-outline-secondary" style="width: 100%;">교환/환불</button>
			</div>
			<div class="col-4 py-1">
				<button class="btn btn-outline-secondary" style="width: 100%;">회원정보</button>
			</div>
			<div class="col-4 py-1">
				<button class="btn btn-outline-secondary" style="width: 100%;">상품확인</button>
			</div>
			<div class="col-4 py-1">
				<button class="btn btn-outline-secondary" style="width: 100%;">서비스</button>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<select class="form-select " aria-label="Default select example"
					style="font-size: 0.9em;">
					<option selected class="text-secondary">문의 유형을 선택해주세요</option>
					<option value="1">결제수단</option>
					<option value="2">주문변경</option>
					<option value="3">주문취소</option>
					<option value="4">기타</option>
				</select>
			</div>
		</div>
		<div class="row mt-3 empty"></div>

		<div class="row mt-3 pe-0">
			<div class="row">
				<div class="col">내용</div>
			</div>
			<div class="row mt-1 pe-0">
				<div class="text-area">
					<textarea class="px-2 py-3"
						style="width: 100%; height: 9em; font-size: 0.9em;"
						placeholder="우선 접수된 문의 건부터 순차적으로 답변을 드리고 있습니다. 문의유형과 주문번호, 문의내용을 상세히 기재해 주시면 더욱 신속히 답변 드릴 수 있습니다. 문의하신 내용에 답변을 위해 전화로 연락을 드릴 수 있습니다."></textarea>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="row">
				<div class="col">사진</div>
			</div>
			<div class="row mt-1">
				<div class="col-5">
					<img alt="" src="/welcomepet/resources/img/upload_img.png"
						style="width: 100%;">
				</div>
			</div>
		</div>

		<div class="row mt-4 pe-0" style="font-size: 0.75em;">
			<div class="row mt-1 pe-0">
				<div class="col text-danger">- 제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품
					및 부속 사용/분실 시, 교환/환불이 불가능 합니다.</div>
			</div>
			<div class="row mt-1 pe-0">
				<div class="col text-danger">- 교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이
					불가합니다.</div>
			</div>
			<div class="row mt-1 pe-0">
				<div class="col text-secondary">
					- 주문취소/교환/환불은 <a href="../customer/orderList" class="link-txt">마이페이지>주문내역</a>
					에서 신청하실 수 있습니다.
				</div>
			</div>
			<div class="row mt-1 pe-0">
				<div class="col text-secondary">
					- 1:1문의 처리 내역은 <a href="./customer/myInquiry" class="link-txt">마이페이지>1:1문의</a>
					를 통해 확인하실 수 있습니다.
				</div>
			</div>
			<div class="row mt-1 pe-0">
				<div class="col text-secondary">- 상품 정보(사이즈, 실측, 예상 배송일 등) 관련
					문의는 해당 상품 문의에 남기셔야 빠른 답변이 가능합니다.</div>
			</div>

		</div>

		<div class="row mt-4"></div>
			<div class="row mt-2 px-0">
			  <div class="col text-center d-flex align-items-center justify-content-center" style="background-color: rgb(57, 61, 62); color: white; height: 2.8em;">
			    취소
			  </div>
			  <div class="col text-center d-flex align-items-center justify-content-center" style="background-color: black; color: white; height: 2.8em;">
			    작성하기
			  </div>
			</div>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>