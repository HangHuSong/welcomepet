<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
		rel="stylesheet">
	<style type="text/css">
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>

<body>
	
<body>
	<div class="container" style="margin: 0 0;">
		<div class="row" style="width: 1920px;">
			<div class="col-2"
				style="background-color: rgb(29, 33, 42); height: auto;"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 bg-light">
				<div class="row bg-white">
					<div class="col"><jsp:include page="../common/bizTopNavi.jsp"></jsp:include></div>
				</div>

				<div class="row px-5 text-center mb-5 py-5" id="bizInputFormBox">
					<div class="col-3"></div>
					<div class="col border bg-white my-5">
						<div class="row py-2 border-bottom">
							<div class="col fs-4 text-start">상점 정보 입력</div>
						</div>
						<div class="row py-2 border-bottom">
							<div class="col align-self-center">상호명</div>
							<div class="col">
								<input type="text" class="form-control" name="biz_store_name">
							</div>
						</div>
						<div class="row py-2 border-bottom">
							<div class="col align-self-center">상점 메인 이미지</div>
							<div class="col">
								<input type="file" class="form-control" name="storeMainImg"
									onchange="saveFile(event)" accept="image/*">
							</div>
						</div>
						<div class="row py-2 border-bottom">
							<div class="col align-self-center">사업장 소재지</div>
							<div class="col">
								<div class="row my-1">
									<div class="col">
										<input class="form-control" type="text" id="postcode"
											placeholder="우편번호">
									</div>
									<div class="col">
										<input type="button" class="btn btn-secondary"
											onclick="findPostcode()" value="우편번호 찾기">
									</div>
								</div>
								<div class="row my-1">
									<div class="col">
										<input class="form-control" type="text" id="address"
											placeholder="주소">
									</div>
								</div>
								<div class="row my-1">
									<div class="col">
										<input class="form-control" type="text" id="detailAddress"
											placeholder="상세주소">
									</div>
									<div class="col">
										<input class="form-control" type="text" id="extraAddress"
											placeholder="참고항목">
									</div>
								</div>
							</div>
						</div>
						<div class="row my-2">
							<div class="col">
								<button class="btn btn-primary" onclick="registerShopInform()">상점
									정보 등록하기</button>
							</div>
						</div>
					</div>
					<div class="col-3"></div>
				</div>
				<div class="row text-center my-5 visually-hidden bg-white"
					id="bizInformRegisterCompleteBox">
					<div class="col-3"></div>
					<div class="col border py-4">
						<div class="row my-2">
							<div class="col fs-1">
								<i class="far fa-check-circle fa-lg"></i>
							</div>
						</div>
						<div class="row my-2">
							<div class="col fs-3">상점 정보 입력이 완료 되었습니다.</div>
						</div>
						<div class="row my-2">
							<div class="col">어서오개 판매자센터의 모든 서비스를 이용하실 수 있습니다.</div>
						</div>
						<div class="row my-2">
							<div class="col">
								<a class="btn btn-primary" href="./main">메인</a>
							</div>
						</div>
					</div>
					<div class="col-3"></div>
				</div>
				<div class="row">
					<div class="col">
						<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function findPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}

		const formData = new FormData();

		function saveFile(event) {
			const file = event.target.files[0];
			formData.append('main_img', file);

		}

		function registerShopInform() {
			const bizStoreNameInput = document
					.querySelector('input[name="biz_store_name"]');

			const addressInput = document.querySelector('#address');
			const detailAddressInput = document.querySelector('#detailAddress');
			const extraAddressInput = document.querySelector('#extraAddress');

			var biz_store_name = bizStoreNameInput.value;
			var biz_address = addressInput.value + " "
					+ detailAddressInput.value + " " + extraAddressInput.value
			formData.append('biz_store_name', biz_store_name);
			formData.append('biz_address', biz_address);

			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					const bizInformRegisterCompleteBox = document
							.getElementById("bizInformRegisterCompleteBox");
					if (bizInformRegisterCompleteBox.classList
							.contains('visually-hidden'))
						bizInformRegisterCompleteBox.classList
								.remove('visually-hidden');

					const bizInputFormBox = document
							.getElementById("bizInputFormBox");
					if (!bizInputFormBox.classList.contains('visually-hidden')) {
						bizInputFormBox.classList.add('visually-hidden');
					}
				}
			}

			//get
			xhr.open("post", "./registerShopInform");
			xhr.send(formData);
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>