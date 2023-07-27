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
	<div class="container" style="margin: 0 0;">

		<div class="row" style="width: 1920px;">
			<div class="col-2" style="background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 bg-light">
				<div class="row bg-white">
					<div class="col">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>

				<div class="row px-5 text-center mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">정산계좌관리</div>
						</div>
						<div class="row mt-2 mb-5">
							<div class="col">
								<div class="row mt-2 mb-3">
									<div class="col border bg-white rounded-3 shadow">
										<div class="row">
											<div class="col">
												<div class="row">
													<div class="col-2 text-start align-self-center px-4">은행</div>
													<div class="col text-start align-self-center">
														<select class="rounded-1"
															style="border: 1px solid rgb(174, 180, 198);">
															<option selected>은행선택</option>
															<option value="1">주문번호</option>
															<option value="2">상품명</option>
															<option value="3">주문자명</option>
														</select>
													</div>
													<div class="col-2 px-5 d-grid py-2 border-start"
														style="background-color: rgb(245, 250, 255);">
														<button class="btn btn-primary rounded-5">검색</button>
													</div>
												</div>
												<div class="row">
													<div class="col-2 text-start align-self-center px-4"
														style="height: auto;">계좌번호</div>
													<div class="col text-start align-self-center">
														<input class="rounded-1" type="text"
															style="width: 423px; border: 1px solid rgb(174, 180, 198);">
													</div>
													<div class="col-2 px-5 d-grid py-2 border-start"
														style="background-color: rgb(245, 250, 255);">
														<button class="btn btn-secondary rounded-5">초기화</button>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row text-center my-5">
							<div class="col">
								<div class="row">
									<div class="col bg-white px-0 shadow">
										<table class="table table-bordered mb-0">
											<thead style="background-color: rgb(245, 250, 255);">
												<tr>
													<th scope="col">선택</th>
													<th scope="col">은행</th>
													<th scope="col">계좌번호</th>
													<th scope="col">예금주명</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${accountDataList }" var="accountData"
													varStatus="i">
													<tr>
														<td><input class="form-check-input" type="radio"></td>
														<td>${accountData.bankDto.bank_name }</td>
														<td>${accountData.bizAccountDto.biz_account_num }</td>
														<td>황**</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row my-1 text-start">
									<div class="col">
										<button class="btn btn-sm btn-primary">기본배송지설정</button>
										<button class="btn btn-sm btn-primary">수정하기</button>
										<button class="btn btn-sm btn-primary">삭제하기</button>
									</div>
								</div>
							</div>
						</div>
						<form action="./accountRegisterProcess" method="post">
							<div class="row mt-5 mb-2">
								<div class="col fw-bold text-start">계좌등록</div>
							</div>
							<div class="row mt-2 mb-5">
								<div class="col">
									<select name="bank_no" class="form-select shadow">
										<option selected>은행을 선택하세요</option>
										<c:forEach items="${bankDtoList }" var="bankDto">
											<option value=${bankDto.bank_no }>${bankDto.bank_name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col">
									<input type="text" class="form-control shadow" name="biz_account_num"
										placeholder="계좌번호를 입력해주세요">
								</div>
								<div class="col-1 text-center">
									<button class="btn btn-primary px-3 rounded-5">등록</button>
								</div>
							</div>

						</form>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>