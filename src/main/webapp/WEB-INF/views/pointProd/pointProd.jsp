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
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col mb-5">
						<div class="row">
							<div class="col mt-5">
								<div class="row mt-4">
									<div class="col p-0">
										<img class="img-fluid"
											src="/welcomepet/resources/img/logo.png">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<div class="row">

											<c:forEach items="${list }" var="map">
												<div class="col-6 p-0"
													onclick="location.href='./readPointProd?point_product_no=${map.pointProdDto.point_product_no }'">
													<div class="border p-1">
														<c:forEach items="${map.pointProdImgDtoList}"
															var="pointProdImgDto" varStatus="status">
															<c:if test="${status.index > 0}">
																<img
																	src="/uploadFiles2/${pointProdImgDto.point_product_image_link}"
																	class="w-100">
															</c:if>
														</c:forEach>
														<div class="row">
															<div class="col fw-medium 6px">
																<a class="text-decoration-none text-black">${map.pointProdDto.point_product_title }</a>
															</div>
														</div>
														<div class="row text-secondary" style="font-size: 0.8em;">
															<div class="col mb-1">
																<span class="me-2">
																	${map.customerDto.customer_nickname }</span> <span
																	class="me-2"> <fmt:formatDate
																		value="${map.pointProdDto.point_product_reg_date }"
																		pattern="yy.MM.dd" />
																</span>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="row fixed-bottom mb-5 pb-4">
										<div class="col"></div>
										<div class="col-3">
											<c:choose>
												<c:when test="${empty customerUser}">
													<a href="../customer/login" class="btn btn-secondary"><i
														class="bi bi-pencil-square"></i></a>
												</c:when>
												<c:otherwise>
													<a href="./writePointProd" class="btn btn-dark"><i
														class="bi bi-pencil-square"></i></a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
</body>
</html>