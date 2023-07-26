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
<%------ bootstrap height:56px; ------%>
</head>
<body>

<div class="row mb-5">
<nav class="navbar fixed-bottom pt-1 bg-body-tertiary border-top"  style="background-color: #ffffff;">
<div class="container d-flex justify-content-center">
 <div class="row">
	
	<div class="col">
		 <div class="row">
		 	<%-- 카테고리 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-list-ul text-secondary pb-0 d-flex justify-content-center" style="font-size:1.4em"
					  href="#" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.7em">카테고리</div>
				</div>
			</div>
			<%-- 커뮤니티 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-chat-square-text text-secondary pb-0 d-flex justify-content-center" style="font-size:1.4em"
				    href="/welcomepet/community/showDogPostList" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.7em">커뮤니티</div>
				</div>
			</div>
			<%-- 쇼핑몰 홈 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-house text-secondary pb-0 d-flex justify-content-center" style="font-size:1.4em"
				    href="/welcomepet/board/main" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.7em">쇼핑몰</div>
				</div>
			</div>
			<%-- 찜 목록 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-heart text-secondary pb-0 d-flex justify-content-center" style="font-size:1.4em"
				    href="/welcomepet/customer/wishList" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.7em">좋아요</div>
				</div>
			</div>
			<%-- 마이페이지 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-person-circle text-secondary pb-0 d-flex justify-content-center" style="font-size:1.4em"
				    href="/welcomepet/customer/my" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.7em">마이페이지</div>
				</div>
			</div>
		</div>
	</div>
 </div>
</div>
</nav>
</div>

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