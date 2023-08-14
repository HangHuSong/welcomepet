<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<div class="row fixed-top bg-white">
			<div class="col-12 border-bottom py-2" style="height: 60px;">
				<div class="row">
					<div class="col-2">
						<button onclick="history.back()" class="btn btn-black">
							<i class="btn bi bi-chevron-left p-0"></i>
						</button>
					</div>
					<div class="col-8 mt-2 text-center fw-bold 16px">게시판</div>
					<div class="col-2 dropdown pt-2 ps-4">
						<i class="bi bi-three-dots-vertical" type="button"
							data-bs-toggle="dropdown" aria-expanded="false"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-12"></div>
		</div>
		<div class="row my-5">
			<div class="col-12">
				<div class="row pt-3">
					<div class="col">

						<div class="row">
							<div class="col mt-2">
								<c:forEach items="${data.pointProdImgDtoList}"
									var="pointProdImgDto" varStatus="status">
									<c:if test="${status.index > 0}">
										<img
											src="/uploadFiles2/${pointProdImgDto.point_product_image_link}"
											class="w-100">
									</c:if>
								</c:forEach>

							</div>
						</div>
						<div class="row">
							<div class="col fw-semibold fs-4 mb-1">${data.pointProdDto.point_product_title}</div>
						</div>
						<div class="row">
							<div class="col fw-semibold">
								${data.customerDto.customer_nickname}</div>
						</div>
						<div class="row">
							<div class="col text-secondary">
								<span class="me-3"> <fmt:formatDate
										value="${data.pointProdDto.point_product_reg_date}"
										pattern="yyyy.MM.dd" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col mt-3 border-bottom"></div>
						</div>
						<div class="row">
							<div class="col mt-2">
								<c:forEach items="${data.pointProdImgDtoList}"
									var="pointProdImgDto" varStatus="status">
									<c:if test="${status.index == 0}">
										<img
											src="/uploadFiles2/${pointProdImgDto.point_product_image_link}"
											class="w-100">
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="row">
							<div class="col mt-3">${data.pointProdDto.point_product_content}</div>
						</div>
						<div class="row">
							<div class="col-12 mt-3 border-top"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row fixed-bottom border-top pt-3 bg-white">
			<div class="col">
				<div class="row">
					<div class="col">${data.pointProdDto.point_product_price}${data.pointProdDto.point_product_total_amount}</div>
					<form action="./orderPointProdProcs" method="get">
						<input type="hidden" name="point_product_no"
							value="${data.pointProdDto.point_product_no}" /> 
						<input type="number"
							name="point_product_order_amount" placeholder="주문수량" required />
						<input type="submit" value="주문하기" />
					</form>
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