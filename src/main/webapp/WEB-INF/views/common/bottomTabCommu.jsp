<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<style type="text/css">
/* 글꼴모음 */
@font-face {
    font-family:'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
@font-face {
    font-family:'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

}
/* 여기까지 글꼴모음 */

.navbar {
	font-family:'SUITE-Regular';
}
</style>

</head>
<body>

<div id="bottomTab" class="row mb-5">
<nav class="navbar fixed-bottom pt-1 bg-body-tertiary border-top" style="background-color: #ffffff;">
<div class="container d-flex justify-content-center">
 <div class="row">
	
	<div class="col">
		 <div class="row">
		 	<%-- 카테고리 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-list-ul text-secondary pb-0 d-flex justify-content-center" style="font-size:1.3em"
					  href="#" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.6em">카테고리</div>
				</div>
			</div>
			<%-- 커뮤니티 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-chat-square-text text-secondary pb-0 d-flex justify-content-center" style="font-size:1.3em"
				    href="/welcomepet/snap/main" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.6em">커뮤니티</div>
				</div>
			</div>
			<%-- 쇼핑몰 홈 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-house text-secondary pb-0 d-flex justify-content-center" style="font-size:1.3em"
				    href="/welcomepet/board/main" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.6em">쇼핑몰</div>
				</div>
			</div>
			<%-- 좋아요 목록 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-hand-thumbs-up text-secondary pb-0 d-flex justify-content-center" style="font-size:1.3em"
				    href="/welcomepet/community/postLikeList" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.6em">좋아요</div>
				</div>
			</div>
			<%-- 마이페이지 ㄱ --%>
			<div class="col">
				<div class="row text-center">
				 <div class="col">
				   <a class="btn bi bi-person-circle text-secondary pb-0 d-flex justify-content-center" style="font-size:1.3em"
				    href="/welcomepet/customer/my" role="button"></a>
				 </div>
				 <div class="col" style="font-size:0.6em">마이페이지</div>
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
<%-- bootstrap : script--%>
</body>
</html>