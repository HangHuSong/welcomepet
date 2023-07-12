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


</head>
<body>

	<div class="row align-items-center">
		<div class="col">
			<div class="row py-4" style="background-color: rgb(19, 22, 28);">
				<div class="col">
					<div class="row">
						<div class="col">
							<img class="rounded-circle mx-2 my-2"
								src="/uploadFiles/bizMainImg/${bizUser.biz_store_main_img}"
								style="width: 100px; height: 100px;">
						</div>
					</div>
					<div class="row">
						<div class="col text-white">
							<c:if test="${!empty bizUser }">
												${bizUser.biz_store_name}
											</c:if>
							<c:if test="${empty bizUser }">
												로그인하세요
											</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-start"
				style="background-color: rgb(29, 33, 42);">
				<div class="col">
					<div class="row my-4">
						<div class="col">
							<div class="row">
								<div class="col fw-bold fs-5 text-white px-4">
									판매 관리<i class="fas fa-angle-down"></i>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/orderManage">주문확인/발송관리</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/purchaseConfirmationList">구매확정 내역</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/cancelOrderManage">취소 관리</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/returnOrderManage">반품 관리</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/exchangeOrderManage">교환 관리</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-4">
						<div class="col align-middle">
							<div class="row">
								<div class="col fw-bold fs-5 text-white px-4">
									상품 관리<i class="fas fa-angle-down"></i>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/productRegister">상품 등록</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/productList">상품 목록</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/adProductRegister">광고상품 등록</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/adProductList">광고상품 목록</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-4">
						<div class="col">
							<div class="row">
								<div class="col fw-bold fs-5 text-white px-4">
									정산 관리<i class="fas fa-angle-down"></i>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/settlementList">정산 내역</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/settlementListDetail">정산 상세 내역</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/accountRegister">정산계좌등록</a>
								</div>
							</div>
						</div>

					</div>
					<div class="row my-4">
						<div class="col">
							<div class="row">
								<div class="col fw-bold fs-5 text-white px-4">
									문의/리뷰 관리<i class="fas fa-angle-down"></i>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/productInquiryList">문의 관리</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="../biz/productReviewList">리뷰 관리</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-4">
						<div class="col">
							<div class="row">
								<div class="col fw-bold fs-5 text-white px-4">
									통계 및 분석<i class="fas fa-angle-down"></i>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="./salesPerformance">판매성과</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="btn text-decoration-none text-white"
										href="./productPerformance">상품성과</a>
								</div>
							</div>
						</div>
					</div>
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