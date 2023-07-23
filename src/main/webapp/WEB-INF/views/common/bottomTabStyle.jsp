<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bootstrap</title>
<%------ bootstrap ------%>
<%-- viewport --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- link --%>
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%------ bootstrap ------%>
</head>
<body>
<%------ 하단 row ------%>
<div class="row mb-5">
<nav class="navbar fixed-bottom bg-body-tertiary border-top"  style="height:56px; background-color: #ffffff;">
<div class="container d-flex justify-content-center">
 <div class="row">
	
	<div class="col">
		 <div class="row">
		 	<%-- 카테고리 ㄱ --%>
			<div class="col pe-0">
				<a class="btn btn-lg bi bi-microsoft text-secondary" data-bs-toggle="offcanvas"
					href="#offcanvasExample" role="button" aria-controls="offcanvasExample" ></a>
			</div>
			<%-- 커뮤니티 ㄱ --%>
			<div class="col pe-0">
				<a class="btn btn-lg bi bi-chat-square-text text-secondary" 
					role="button" href="/welcomepet/community/showDogPostList"></a>
			</div>
			<%-- 쇼핑몰 홈 ㄱ --%>
			<div class="col pe-0">
				<a class="btn btn-lg bi bi-house text-secondary" 
					role="button" href="/welcomepet/community/home"></a>
			</div>
			<%-- 찜 목록 ㄱ --%>
			<div class="col pe-0">
				<a class="btn btn-lg bi bi-heart text-secondary" 
					role="button" href="/welcomepet/customer/wishList"></a>
			</div>
			<%-- 마이페이지 ㄱ --%>
			<div class="col">
				<a class="btn btn-lg bi bi-person-circle text-secondary" role="button"
				   href="/welcomepet/customer/my"></a>
			</div>
		</div>
	</div>
 </div>
</div>
</nav>
</div>
<%-- 카테고리 열면 왼쪽에서 나오는거 --%>
	<div class="offcanvas offcanvas-start w-75" tabindex="-1"
		id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div>Some text as placeholder. In real life you can have the
				elements you have chosen. Like, text, images, lists, etc.</div>
			<div class="dropdown mt-3">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					data-bs-toggle="dropdown">Dropdown button</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">Action</a></li>
					<li><a class="dropdown-item" href="#">Another action</a></li>
					<li><a class="dropdown-item" href="#">Something else here</a></li>
				</ul>
			</div>
		</div>
	</div>
<%-- 카테고리 열면 나오는거 --%>


<%-- bootstrap script--%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"	crossorigin="anonymous">
</script>

<%-- 왼쪽에서 나오는 카테고리 --%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" 
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" 
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<%-- bootstrap : script--%>
</body>
</html>