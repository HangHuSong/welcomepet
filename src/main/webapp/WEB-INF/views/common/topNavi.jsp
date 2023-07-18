<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top community Navigation</title>
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
			<div class="col-12 border-bottom py-2">
				<div class="row">
					<div class="col-2">
						<button onclick="history.back()" class="btn btn-black">
							<i class="btn bi bi-chevron-left p-0"></i>
						</button>
					</div>
					<div class="col-8 mt-2 text-center fw-bold 16px">커뮤니티</div>
					<div class="col-2"></div>
				</div>
				<div class="row my-1">
					<div class="col"></div>
				</div>
				<div class="row text-dark" style="font-size: 0.9em;">
					<div class="col-2 text-end">
						<a class="nav-link" href="/welcomepet/snap/snap">스냅</a>
					</div>
					<div class="col-3 text-start">
						<a class="nav-link" href="/welcomepet/board/board">자유게시판</a>
					</div>
					<div class="col-6"></div>
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