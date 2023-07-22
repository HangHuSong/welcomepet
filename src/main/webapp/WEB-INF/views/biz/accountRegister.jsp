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
<script>
	
</script>


</head>
<body>
	<div class="container" style="margin: 0 0;">

		<div class="row" style="width: 1900px;">
			<div
				class="col-2 text-center ps-4 text-white d-flex align-items-stretch align-top"
				style="background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col px-0">
				<div class="row mx-1">
					<div class="col">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>

				<div class="row mx-1 px-5 text-start">
					<div class="col">
						<div class="row">
							<div class="col fs-5 fw-bold py-3">정산계좌관리</div>
						</div>
						
						<div class="row my-5">
								<div class="col fs-5 fw-bold">계좌번호 목록</div>
							</div>
							<div class="row">
								<div class="col">
									<ul class="list-group">
										<c:forEach items="${accountDataList }" var="accountData">
											<li class="list-group-item">${accountData.bankDto.bank_name }&nbsp;${accountData.bizAccountDto.biz_account_num }</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						<form action="./accountRegisterProcess" method="post">
							<div class="row mt-4 mb-2">
								<div class="col fs-5 fw-bold">계좌등록</div>
							</div>
							<div class="row">
								<div class="col">
									<select name="bank_no" class="form-select">
										<option selected>은행을 선택하세요</option>
										<c:forEach items="${bankDtoList }" var="bankDto">
											<option value=${bankDto.bank_no }>${bankDto.bank_name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col">
									<input type="text" class="form-control" name="biz_account_num">
								</div>
								<div class="col-2">
									<button class="btn btn-primary">등록</button>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>