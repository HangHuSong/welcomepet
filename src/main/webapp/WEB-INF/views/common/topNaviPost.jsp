<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
<meta charset="UTF-8">
<%-- viewport --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%-- link --%>

<style type="text/css">
/* 글꼴모음 */
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 200;
    font-style: normal;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 600;
    font-style: normal;
}
@font-face {
    font-family:'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 800;
    font-style: normal;
}
/* 여기까지 글꼴모음 */

#postTopNavBar {
	font-family:'Pretendard-Regular';
}
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
</head>

<body>

<nav id="postTopNavBar" class="topNavbar sticky-top bg-body-tertiary shadow-sm p-3" style="background-color:#ffffff">
<div class="container p-0">
	<div class="container p-0">

  	 <div class="container-fluid">
  	 	<div class="row">
	 	 <div class="col p-0">
	      <a href="/welcomepet/community/showDogPostList" class="btn bi bi-arrow-left fs-4 py-0 ps-0" role="button"></a>
	     </div>

	  	 <div class="col-5 text-center">
	      <a id="main" href="../snap/main">어서보여주개</a>
	     </div>
	     
	     <div class="col d-flex justify-content-end p-0">
	     <a class="btn bi bi-bell text-secondary btn-lg p-0" role="button" href="#"></a>
	     </div>
	  	</div>
	 </div>
  	</div>
</div>
</nav>

</body>