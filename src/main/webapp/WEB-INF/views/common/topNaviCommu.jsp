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
<%-- font --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%-- font --%>

<style type="text/css">

/* @font-face {
    font-family: 'KorailRoundGothicBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
} */

/* #main{
	text-decoration: none;
	color:inherit;
	/* color: #F8961D; */
  	/* font-family:'KorailRoundGothicBold', sans-serif !important; */
/*  	font-family: 'Jua', sans-serif;
 	font-weight:700;
 	font-size:1.3em;
 	color:#fd7e14;
} */

.nav-link{
	text-decoration: none;
	color:inherit;
/*   	font-family: 'Jua', sans-serif;
 	font-weight:700;
 	font-size:1.3em; */
/*  	color:#fd7e14; */
}

#main{
	text-decoration: none;
	color:inherit;
	/* color: #F8961D; */
  	/* font-family:'KorailRoundGothicBold', sans-serif !important; */
  	font-family: 'Jua', sans-serif;
 	font-weight:700;
 	font-size:1.3em;
 	color:#ffa500;
}

.topNavbar{
	/* background-color: #F4AE7A; */
	background-color: #ffffff;
}



</style>
<%------ bootstrap ------%>
</head>
<body>

<nav class="topNavbar sticky-top bg-body-tertiary border-bottom shadow-sm px-0 pt-3">
<div class="container p-0">
	<div class="container p-0">
  	 <div class="container-fluid">
  	 	<%-- 1 --%>
  	 	<div class="row d-flex justify-content-between">
	     <div class="col-1 py-0 pe-0 ms-2">
	      <a href="/welcomepet/pointProd/board" class="btn bi bi-arrow-left text-secondary py-0 ps-0" role="button" 
	         style="font-size:1.2em"></a>
	     </div>
	      	 
	  	 <div class="col-9 text-center">
	      <a id="main" href="../snap/main">커뮤니티</a>
	     </div>
	     
	     <div class="col-1 py-0 ps-0 me-2">
	     <a class="btn bi bi-search text-secondary p-0" role="button" href="#"
	     	style="font-size:1.2em"></a>
	     </div>

<%-- 	     
	     <div class="col-1 d-flex justify-content-end p-0">
	     <a class="btn bi bi-bell text-secondary btn-lg p-0" role="button" href="#"></a>
	     </div>
--%>
	  	</div>
	  	
	  	<%-- 2 --%>
		<div class="row text-center">
		 <div class="col mt-2">
			<div class="row mb-2">
				<div class="col"></div>
			</div>
		 	
			<div class="row" style="font-size:0.9em;">
				<div class="col text-center p-0">
					<a class="nav-link text-secondary" href="/welcomepet/snap/main">스냅</a>
				</div>
				<div class="col text-center p-0">
					<a class="nav-link text-secondary" href="/welcomepet/pointProd/board">어서대화하개</a>
				</div>
				
				<div class="col text-center p-0 fw-bold">
					<a class="nav-link" href="/welcomepet/community/showDogPostList"
					   style="border-bottom:2.5px solid gray">어서보여주개</a>
				</div>
			</div>
			
			</div>
		 </div>

	 </div>
	
	 
  	</div>
</div>
</nav>

<%-- bootstrap : script--%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
</script>
<%-- bootstrap : script--%>
</body>
</html>