<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readContent</title>
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

#main {
	text-decoration: none;
	color: inherit;
	/* color: #F8961D; */
	/* font-family:'KorailRoundGothicBold', sans-serif !important; */
	font-family: 'Jua', sans-serif;
	font-weight: 700;
	font-size: 1.3em;
	color: #ffa500;
}
</style>
</head>
<body style="font-family: 'SUITE-Regular', sans-serif;">
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<!-- navi -->
				<div
					class="row fixed-top bg-white bg-body-tertiary shadow-sm px-3 pt-3">
					<div class="col-12 border-bottom pb-2">
						<div class="row">
							<div class="col-2">
								<a href="/welcomepet/pointProd/board"
									class="btn btn-black py-0 ps-2"
									style="border: transparent; outline: none;"><i
									class="bi bi-arrow-left"></i> </a>
							</div>
							<div class="col-1"></div>
							<div class="col-6 text-center">
								<a id="main" href="../pointProd/board">어서대화하개</a>
							</div>
							<div class="col-1"></div>
							<div class="col-2 ps-4 dropdown">
								<i class="bi bi-three-dots-vertical" type="button"
									data-bs-toggle="dropdown" aria-expanded="false"></i>
								<ul class="dropdown-menu">
									<c:choose>
										<c:when
											test="${!empty customerUser && customerUser.customer_no == data.customerDto.customer_no}">
											<li><a class="dropdown-item"
												href="./update?board_no=${data.boardDto.board_no}"
												class="text-decoration-none text-black">수정</a></li>
											<li><a class="dropdown-item"
												href="./deleteProcess?board_no=${data.boardDto.board_no}"
												class="text-decoration-none text-black">삭제</a></li>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${empty customerUser}">
													<li><a class="dropdown-item" href="../customer/login"
														class="text-decoration-none text-black">신고</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="dropdown-item" href="../board/report"
														class="text-decoration-none text-black">신고</a></li>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- navi -->
				<div class="row my-1">
					<div class="col"></div>
				</div>
				<div class="row my-5">
					<div class="col">
						<div class="row pt-3">
							<div class="col">
								<div class="row">
									<div class="col">
										<div class="row">
											<div class="col-2">
												<img class="proImg"
													src="https://i.namu.wiki/i/sLpl_9SaPt63LS9uKn7ptjw1GtopAOeL-fVSbFHsfwm2ZKwywO-4rd91q_MPds0-pXHkGqRyAj6u366J2-SygA.webp"
													style="border-radius: 50px; width: 120%;">
											</div>
											<div class="col p-10">
												<div class="row">
													<div class="col ps-1 fw-semibold">
														${data.customerDto.customer_nickname}</div>
												</div>
												<div class="row">
													<div class="col ps-1 text-secondary"
														style="font-size: 0.9em;">
														<span class="me-2"> <fmt:formatDate
																value="${data.boardDto.board_reg_date}"
																pattern="yyyy.MM.dd" /></span> <span> 조회수
															${data.boardDto.board_read_count} </span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 mt-2 border-bottom"></div>
								</div>
								<div class="row">
									<div class="col ps-2 ms-1 pt-2">
										<span class="badge rounded-pill"
											style="font-size: 0.85em; text-color: #ffa500; border: 1px solid #ffa500; color: #ffa500;">${data.pointProdCategoryDto.board_category_name}</span>
									</div>
								</div>
								<div class="row">
									<div class="col fw-semibold py-1" style="font-size: 1.4em;">${data.boardDto.board_title}</div>
								</div>
								<div class="row">
									<div class="col text-center">
										<c:forEach items="${data.imageDtoList}" var="imageDto">
											<img src="/uploadFiles/${imageDto.board_image_link}"
												style="width: 100%;">
										</c:forEach>
									</div>
								</div>
								<div class="row">
									<div class="col py-1" style="font-size: 1.1em;">${data.boardDto.board_content}</div>
								</div>
								<form action="./insertLikeProcess" method="post">
									<input type="hidden" value="${data.boardDto.board_no}"
										name="board_no">
									<div class="row">
										<div class="col-4"></div>
										<div class="col-4 mt-3 text-center">
											<button type="submit" class="btn btn-outline-danger">
												<i class="bi bi-hand-thumbs-up">${countLikeByBoardNo}</i>
											</button>
										</div>
										<div class="col-4"></div>
									</div>
								</form>
								<div class="row">
									<div class="col-12 mt-3 border-top"></div>
								</div>
								<!-- 댓글 여러개 보이게 하기 -->
								<div class="row">
									<div class="col fw-bold mt-3 pb-2"style="font-size: 1.1em;">댓글
										${countCommentByBoardNo}</div>
										<div class="col-5 mt-3">
									<span class="ms-3">
										<a	href="./readContent?board_no=${data.boardDto.board_no}&order=reg" class="btn btn-outline-none btn-sm text-end fw-bold text-secondary p-0"
											style="font-size: 0.9em;">
											<i class="bi bi-filter-left"></i>등록순
										</a>
									</span>
									<span class="me-0 ms-1">
										<a href="./readContent?board_no=${data.boardDto.board_no}&order=recent" class="btn btn-outline-none btn-sm text-end text-secondary p-0"
											style="font-size: 0.9em;">
											<i class="bi bi-filter-right"></i>최신순
										</a>
									</span>
									</div>
								</div>
								<div class="row">
									<div class="col-12 mt-2">
										<c:forEach items="${commentList}" var="comment">
											<div class="row">
												<div class="col-2">
													<img class="rounded-circle"
														src="https://dummyimage.com/3*3" alt="...">
												</div>
												<div class="col pe-3">
													<div class="row">
														<div class="col pe-2 ps-0">
															<span class="me-2 text-secondary"
																style="font-size: 0.88em;">
																${comment.customerDto.customer_nickname }</span><span
																class="text-secondary" style="font-size: 0.87em;"><fmt:formatDate
																	value="${comment.commentDto.board_comment_reg_date}"
																	pattern="yyyy.MM.dd" /></span>
														</div>
													</div>
													<div class="row">
														<div class="col pe-2 ps-0 fw-medium"
															style="overflow-wrap: break-word; font-size: 1em;">
															${comment.commentDto.board_comment_content }</div>
													</div>
													<div class="row">
														<div class="col pt-2 pb-3 pe-2 ps-0 text-secondary"
															style="font-size: 0.8em;">답글</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="row fixed-bottom bg-white">
									<div class="col-12 border-top">
										<form action="./insertComment" method="post">
											<div class="row">
												<div class="col-10 ps-4 pt-1">
													<textarea class="form-control-plaintext"
														name="board_comment_content" placeholder="댓글을 남겨보세요"
														style="height: 40px;"></textarea>
													<input type="hidden" name="board_no"
														value="${data.boardDto.board_no}">
												</div>
												<div class="col p-0">
													<c:choose>
														<c:when test="${empty customerUser}">
															<a href="../customer/login"><i
																class="btn bi bi-arrow-up-circle-fill"
																style="font-size: 1.6em;"></i></a>
														</c:when>
														<c:otherwise>
															<button class="btn bi bi-arrow-up-circle-fill"
																type="submit" style="font-size: 1.6em;"></button>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</form>
									</div>
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