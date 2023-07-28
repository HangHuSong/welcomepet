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
 	color:#fd7e14;
}

.topNavbar{
	/* background-color: #F4AE7A; */
	background-color: #ffffff;
}



</style>
<%------ bootstrap ------%>
</head>
<body>

<nav class="topNavbar sticky-top bg-body-tertiary shadow-sm px-3 pb-2 pt-2">
<div class="container p-0">
	<div class="container p-0">
  	 <div class="container-fluid">
  	 	<%-- 1 --%>
  	 	<div class="row" style="align-items: center;">
	     <div class="col-2 p-0">
	      <a href="/welcomepet/pointProd/board" class="btn btn bi bi-bell text-secondary fs-4 py-0 ps-0" 
						data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
					aria-controls="offcanvasExample"></a>
	     </div>
	      	 
	  	 <div class="col text-center text-black">
	     <img  src="/welcomepet/resources/img/logo.png" style="height:2.7em; ">
	     </div>
	     
	     <div class="col-1 p-0">
	     <a class="btn bi bi bi-search text-secondary btn-lg p-0" role="button" href="/welcomepet/board/search"></a>
	     </div>
	     
	     <div class="col-1 d-flex justify-content-end p-0">
	     <a class="btn bi bi-cart2 text-secondary  btn-lg p-0" role="button" href="/welcomepet/customer/cart"></a>
	     </div>
	  	</div>
	  	</div>
	  	</div>
	  	</div> </nav>


<div class="row">
	<div class="col">
		<div class="offcanvas offcanvas-start w-75" tabindex="-1"
			id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasExampleLabel">알림</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
					aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
			<div class="row mt-2">
				<div class="col">님이 좋아요를 눌렀습니다</div>
			</div>
			<div class="row mt-2">
				<div class="col">댓글을 달았습니다.</div>
			</div>			
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
	</div>
</div>