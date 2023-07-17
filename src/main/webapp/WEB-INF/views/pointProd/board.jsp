<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
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
											src="/welcomepet/resources/board/img/bannerMain.png">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="row">
									<div class="col">
										<div class="row">
											<div class="col">
												<div class="row">
													<div class="col-12 bg-secondary text-dark bg-opacity-10">
														<div class="row">
															<!-- 베스트3 -->
															<c:forEach items="${list2 }" var="map">
																<div
																	class="col-12 border-bottom border-light-subtle border-1 py-1"
																	onclick="location.href='./readContent?board_no=${map.boardDto.board_no }'">
																	<div class="row">
																		<div class="col fw-semibold py-1"
																			style="font-size: 15px;">
																			<a class="text-decoration-none text-black"><i
																				class="bi bi-hand-thumbs-up text-danger"> </i><span
																				class="me-1"></span>${map.boardDto.board_title }</a>
																		</div>
																	</div>
																</div>
															</c:forEach>
															<div
																class="col border-bottom border-light-subtle border-2">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<c:forEach items="${list }" var="map">
												<div class="col-12 border-bottom py-2"
													onclick="location.href='./readContent?board_no=${map.boardDto.board_no }'">
													<div class="row">
														<div class="col">
															<div class="row">
																<div class="col fw-medium 6px">
																	<a class="text-decoration-none text-black">${map.boardDto.board_title }</a>
																	<span class="text-danger">[${map.countComment}]</span>
																</div>
															</div>
															<div class="row text-secondary" style="font-size: 0.8em;">
																<div class="col mb-1">
																	<span class="me-2">
																		${map.customerDto.customer_nickname }</span> <span
																		class="me-2"> <fmt:formatDate
																			value="${map.boardDto.board_reg_date }"
																			pattern="yy.MM.dd" />
																	</span> <span> 조회 ${map.boardDto.board_read_count }</span>
																</div>
															</div>
														</div>
														<div class="col-2 px-2">
															<c:forEach items="${map.imageDtoList}" var="imageDto">
																<img src="/uploadFiles/${imageDto.board_image_link}"
																	class="w-100">
															</c:forEach>
														</div>
													</div>
												</div>
											</c:forEach>
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
														<a href="./writeContent" class="btn btn-dark"><i
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
				</div>
<jsp:include page="../common/topNavi.jsp"></jsp:include>
<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
</body>
</html>