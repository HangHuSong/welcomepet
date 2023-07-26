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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%-- link 
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
--%>
<style type="text/css">
#main{
	text-decoration: none;
	color:inherit;
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
<%------ 상단 네비  #333333; ------%>
<nav class="navbar sticky-top bg-body-tertiary shadow-sm p-3" style="background-color:#ffffff">
<div class="container p-0">
	<div class="container p-0">

  	 <div class="container-fluid">
  	 	<div class="row">
	 	 <div class="col p-0">
	      <a href="/welcomepet/community/showDogPostList" class="btn bi bi-arrow-left fs-4 py-0 ps-0" role="button"></a>
	     </div>

	  	 <div class="col-5 text-center">
	      <a id="main" href="../community/home">어서보여주개</a>
	     </div>
	     
	     <div class="col d-flex justify-content-end p-0">
	     <a class="btn bi bi-bell text-secondary btn-lg p-0" role="button" href="#"></a>
	     </div>
	  	</div>
	 </div>
  	</div>
</div>
</nav>
<%------ 상단 네비 ------%>


<%-- bootstrap : script
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
</script> --%>
<%-- bootstrap : script--%>
</body>
</html>