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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style type="text/css">
@font-face {
	font-family: 'SUITE-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
		format('woff2');
	font-weight: 300 -900;
	font-style: normal;
}

.bi.bi-pencil-square {
	color: white
}
/* #CF654D; */
#main {
	text-decoration: none;
	color: inherit;
	/* color: #F8961D; */
	/* font-family:'KorailRoundGothicBold', sans-serif !important; */
	font-family: 'Jua', sans-serif;
	font-weight: 700;
	font-size: 1.3em;
	color: #fd7e14;
}
</style>
</head>
<body style="font-family: 'SUITE-Regular', sans-serif;">
	<div class="container">
		<div class="row">
			<div class="col">
				<div
					class="row fixed-top bg-white bg-body-tertiary shadow-sm px-3 pt-3">
					<div class="col-12 border-bottom">
						<div class="row">
							<div class="col-2">
								<a href="/welcomepet/pointProd/board"
									class="btn btn-black py-0 ps-2"
									style="border: transparent; outline: none;"><i
									class="bi bi-arrow-left"></i> </a>
							</div>
							<div class="col-1"></div>
							<div class="col-6 text-center" style="color: #fd7e14;">
								<a id="main" href="../pointProd/board">커뮤니티</a>
							</div>
							<div class="col-2"></div>
							<div class="col-1 p-0">
								<i class="bi bi-search p-0"></i>
							</div>
						</div>
						<div class="row my-1">
							<div class="col"></div>
						</div>
						<div class="row text-dark text-center" style="font-size: 0.9em;">
							<div class="col">
								<div class="row">
									<div class="col">
										<a class="nav-link" href="/welcomepet/snap/main">snap</a>
									</div>
									<div class="col fw-bold">
										<a class="nav-link" href="/welcomepet/pointProd/board"
											style="border-bottom: 2.5px solid gray">자유게시판</a>
									</div>
									<div class="col">
										<a class="nav-link"
											href="/welcomepet/community/showDogPostList">자랑게시판</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col mb-4">
						<div class="row">
							<div class="col mt-4">
								<div class="row mt-5">
									<div class="col p-0">
										<img class="img-fluid"
											src="https://images.pet-friends.co.kr/storage/pet_friends/tab_banner/8/f/e/3/1/d/2/8fe31d2a601e259b912ac4bb56b21bf7/10000/ca150244df92a8cd209a2bd21ac2c5a1.jpeg">
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
																	class="col-12 border-bottom border-light-subtle border-1"
																	style="padding: 0.3em 0.7em; font-weight: 400;"
																	onclick="location.href='./readContent?board_no=${map.boardDto.board_no }'">
																	<div class="row">
																		<div class="col">
																			<a class="text-decoration-none text-black"
																				style="font-size: 0.9em;"><i
																				class="bi bi-fire text-danger"></i> <!-- <i
																				class="bi bi-hand-thumbs-up text-danger"></i> --> <span
																				class="me-1"></span>${map.boardDto.board_title }</a>
																		</div>
																	</div>
																</div>
															</c:forEach>
															<div
																class="col border-bottom border-light-subtle border-1">
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
													<div class="row mb-2">
														<div class="col">
															<div class="row">
																<div class="col mb-1">
																	<a class="text-decoration-none text-black"
																		style="font-size: 0.97em; font-weight: 2em">${map.boardDto.board_title }</a>
																</div>
															</div>
															<div class="row text-secondary"
																style="font-size: 0.73em;">
																<div class="col mb-1">
																	<span class="me-2">
																		${map.customerDto.customer_nickname }</span> <span
																		class="me-2"> <fmt:formatDate
																			value="${map.boardDto.board_reg_date }"
																			pattern="yy.MM.dd" />
																	</span>
																	<%-- <span> 조회 ${map.boardDto.board_read_count }</span> --%>
																</div>
															</div>
														</div>
														<div class="col-3 pe-2 ps-4">
															<c:forEach items="${map.imageDtoList}" var="imageDto">
																<img src="/uploadFiles/${imageDto.board_image_link}"
																	class="w-100">
															</c:forEach>
														</div>
													</div>
													<div class="row">
														<div class="col">
															<div class="row text-secondary"
																style="font-size: 0.79em;">
																<div class="col">
																	<span class="me-2"><i
																		class="bi bi-chat-square-dots">
																			${map.countComment}</i></span> <span class="me-2"><i
																		class="bi bi-hand-thumbs-up"> ${map.countLike}</i></span>
																</div>
																<div class="col-2 text-end">
																	<span><i class="bi bi-eye">
																			${map.boardDto.board_read_count}</i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
										<div class="row fixed-bottom mb-5 pb-4" style="height: 54">
											<div class="col"></div>
											<div
												class="col-3 d-flex justify-content-center align-items-center">
												<c:choose>
													<c:when test="${empty customerUser}">
														<a href="../customer/login"
															class="btn btn-lg shadow rounded-circle d-flex justify-content-center align-items-center"
															style="color: white; height: 52px; background-color: #fd7e14">
															<i class="bi bi-pencil-square" style="color: white;"></i>
														</a>
													</c:when>
													<c:otherwise>
														<a href="./writeContent"
															class="btn btn-lg shadow rounded-circle d-flex justify-content-center align-items-center"
															style="color: white; height: 52px; background-color: #fd7e14">
															<i class="bi bi-pencil-square" style="color: white;"></i>
														</a>
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
	<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>