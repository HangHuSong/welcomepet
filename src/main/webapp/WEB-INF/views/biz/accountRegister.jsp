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
	<div class="container">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-3"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col">
				<form action="./accountRegisterProcess" method="post">
					<div class="row">
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
					<div class="row">
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
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>