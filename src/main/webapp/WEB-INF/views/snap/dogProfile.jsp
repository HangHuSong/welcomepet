<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title></title>
<style type="text/css">
	.profileImage {
		width: 80px;
		height: 80px;
		border-radius: 50%;
		overflow: hidden;
	}
	.img{
		width: 125px;
		height: 125px;
		overflow: hidden;
		object-fit: cover;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row shadow-sm p-3 mb-5 bg-body-tertiary rounded">
			<div class="col">
				<nav class="navbar navbar-dark bg-white d-flex fixed-top fw-bold">
					<div class="col-2 text-center">
						<a class="btn bi bi-bell text-secondary fs-4 " data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample"></a>
					</div>
					<div class="col-1"></div>
					<div class="col-6" style="text-align: center;">프로필</div>
					<div class="col-1 text-center">
						<a class="btn bi bi-search fs-4" role="button" href="/welcomepet/board/search"> </a>
					</div>
					<div class="col-2 text-center">
						<div class="dropdown">
						   <a class="text-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		                      <i class="bi bi-three-dots-vertical"></i>
		                   </a>
						   <ul class="dropdown-menu">
						   		<li><a class="dropdown-item" href="./updateDogProfile?dog_no=${dogDto.dog_no}">수정</a></li>
						   </ul>
						</div>
					</div>
		
				</nav>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col">
				<div class="offcanvas offcanvas-start w-75" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasExampleLabel">알림</h5>
						<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
					<div class="row mt-2">
						<div class="col">님이 좋아요를 눌렀습니다</div>
					</div>
					<div class="row mt-2">
						<div class="col">댓글을 달았습니다.</div>
					</div>			
						<div class="dropdown mt-3">
							<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">Dropdown button</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else here</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!-- dog profile img -->
		<div class="row mx-1 mt-2 align-items-center">
			<div class="col-4">
				<div class="profileImage">
				<img src="/uploadFiles/WelcomePet/${dogDto.dog_image}" style="width: 100%; height: 100%;">
				</div>		
			</div>
			<div class="col-4 text-center">
				<span><i class="bi bi-person-plus-fill"></i></span>
				<br>
				<span>10</span>
			</div>
			<div class="col-4 text-center">
				<span>게시물</span>
				<br>
				<span>10</span>
			</div>
		</div>
		
		<div class="row mt-2">
			<div class="col-4">
				<div class="row">
					<div class="col text-center">
						<span style="font-size: 15px;"> ${dogDto.dog_name}</span>
					</div>
				</div>
				<div class="row">
					<div class="col text-center">
						<span style="font-size: 13px; color: gray;"><fmt:formatDate value="${dogDto.dog_birth}" pattern="M월d일"/></span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row my-2">
			<div class="col-auto">
				<p style="font-size: 14px;">${dogDto.dog_introduction}</p>
			</div>
		</div>
		
											
		<div class="row mt-1 border-top"></div>
		
		<!-- dog의 게시글 -->
		<div class="row row-cols-3">
			<c:forEach items="${list}" var="img">
				<div class="col px-0">
					<a href="./readSnap?snap_board_no=${img.snap_board_no}">
						<img class="img" src="/uploadFiles/thumbnail/${img.snap_thumbnail}">
					</a>
				</div>
			</c:forEach>
		</div>
		
		
		<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>