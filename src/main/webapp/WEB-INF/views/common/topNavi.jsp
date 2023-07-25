<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나연님 navi</title>
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
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="row fixed-top bg-white">
					<div class="col-12 border-bottom py-2">
						<div class="row">
							<div class="col-2">
								<a href="/welcomepet/pointProd/board"
									class="btn btn-black py-0 ps-2"
									style="border: transparent; outline: none;"> <i
									class="btn bi bi-chevron-left p-0"
									style="border: transparent; outline: none; font-size: 1.5em;"></i>
								</a>
							</div>
							<div class="col-1"></div>
							<div class="col-6 mt-2 text-center" style="color: #fd7e14;">
								<a id="main" href="../pointProd/board">커뮤니티</a>
							</div>
							<div class="col-1"></div>
							<div class="col-2 p-0">
								<a class="btn bi bi-bell-fill text-secondary btn-lg pt-1 ps-4"
									role="button" href="#"></a>
							</div>
						</div>
						<div class="row my-1">
							<div class="col"></div>
						</div>
						<div class="row text-dark text-center" style="font-size: 0.9em;">
							<div class="col my-1">
								<div class="row">
									<div class="col fw-bold">
										<a class="nav-link" href="/welcomepet/pointProd/board">자유게시판</a>
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
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
