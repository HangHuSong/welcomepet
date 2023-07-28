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
<title>장바구니</title>
<style type="text/css">
.product-thum {
	height: 6em;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}
</style>
</head>
<body>

	<div class="container align-items-center justify-content-center">

		<div class="row  mt-2 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;">찜한상품</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>
		<div class="row mt-2 ">
			<div class="col-1"></div>
			<div class="col-7 fw-bold">상품</div>
			<div class="col "></div>
			<div class="row mt-2 border-bottom"></div>
		</div>
	
		<c:forEach items="${data}" var="wish">
			<div
				class="row mt-3 border-bottom embed-responsive embed-responsive-4by3">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-4">
						<img
							src="/uploadFiles/WelcomePet/${wish.productInfo.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="...">
					</div>
					<div class="col-5">
						<div class="row mt-1">
							<div class="col">${wish.productInfo.product_name}</div>
						</div>
						<div class="row mt-2">
							<div class="col">
								<del>${wish.productInfo.product_price}원 </del>
							</div>

						</div>
						<div class="row">
							<div class="col-1"></div>
							<div class="col">${wish.productInfo.product_price - wish.salePrice}원</div>
						</div>
						<div class="row mt-2">
									<div class="d-grid gap-2">
										<button class="btn btn-primary" type="button"
											data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom"
											aria-controls="offcanvasBottom">장바구니 담기</button>

										<div class="offcanvas offcanvas-bottom dde"
											style="height: auto;" tabindex="-1" id="offcanvasBottom"
											aria-labelledby="offcanvasBottomLabel">
											<form action="./addCart?product_option_no=6" method="post">
											 <input type="hidden" name="customer_no" value="${sessionUser.customer_no}">
											<div class="row mt-3">
												<div class="col text-center fw-bold">상품 선택</div>
											</div>
											<div class="row mt-4">
												<div class="row">
													<div class="col-1"></div>
													<div class="col">
														<select class="form-select" name="product_option_no">
															<option> 선택해주세요 </option>
																<c:forEach items="${wish.optionList}" var="map">
																		<option value="${map.product_option_no} "> 
																				${map.product_option_name} &nbsp;&nbsp;&nbsp; ${map.product_option_price}원</option>
																</c:forEach>
														</select>
													</div>
													<div class="col-1"></div>
												</div>
												<div class="row mt-3 optionContainer" >
												
												</div>
												<div class="row mt-3">
													<div class="col-1"></div>
													<div class="col-6">
														<input class="form-input" type="number" min="1"
															name="product_amount">
													</div>
													<div class="col-4 text-end">
														<div class="row"></div>
														<div class="row">
															<div class="col fw-bold">${wish.productInfo.product_price - wish.salePrice}원
															</div>
														</div>
													</div>
													<div class="col-1"></div>
												</div>

												<div class="row mt-3">

													<div class="col-1"></div>
													<div class="col-6">총 상품 금액</div>
													<div class="col-4 text-end">
														<div class="row">
															<div class="col fw-bold fs-4">${wish.productInfo.product_price - wish.salePrice}원
															</div>
														</div>
													</div>
													<div class="col-1"></div>
												</div>
												<div class="row mt-4">
													<div class="col-1"></div>
													<div class="col-5 d-grid gap-2">
														<button class="btn btn-outline-primary btn-lg"
															type="button">장바구니</button>
													</div>
													<div class="col-5 d-grid gap-2">
														<button class="btn btn-primary btn-lg" type="submit">바로구매</button>
													</div>
													<div class="col-1"></div>
												</div>
												<div class="row mt-3"></div> 
											</div>
												</form>
										</div>
									</div>
						</div>						
					</div>
					<div class="col-1">
						<a class="btn bi bi-x fs-3 px-0 py-0" role="button"
							href="./deletewish?wish_no=${wish.wishInfo.product_wish_list_no}"> </a>
					</div>
					<div class="col-1"></div>
				</div>

				<div class="row mt-2"></div>
			</div>
		</c:forEach>
	


	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
