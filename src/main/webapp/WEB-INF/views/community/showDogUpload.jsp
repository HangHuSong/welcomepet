<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showDogUpload.jsp</title>
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

<style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

#upload{
	font-family: 'SUITE-Regular';
}

.bold-icon {
    font-weight: bold;
  }
  </style>
  
</head>
<body>
<div class="container" id="upload">
 	<div class="row mb-5">		
 	<div class="col">
	 	<form action="./showDogUploadProcess" method="post" enctype="multipart/form-data">		 
	 	<%-- mobileStyle --%>
		<jsp:include page="../common/showDogUploadTopNavi.jsp"></jsp:include>  
		<%-- -----------  --%>  
<%--
		 <div class="row justify-content-between">
 	 	     <div class="col-2">
		      <a href="/welcomepet/pointProd/board" class="btn btn-black py-0 ps-0" style="border: transparent; outline: none;">
				 <i class="btn bi bi-chevron-left p-0" style="border: transparent; outline: none; font-size: 1.5em;"></i>
			  </a>
		     </div>
		     
	 		 <div class="col-2">
	 		  <a class="bi bi-arrow-left text-secondary bold-icon" role="button" onclick="history.back(-1)" style="font-weight: bold;"></a>
	 		 </div>
	 		 
	 		 <div class="col text-end">
	 		  <button class="btn" style="pointer-events: none;">임시저장</button>
	 		  <button class="btn fw-bold" style="color:white; background-color:#fd7e14"><i class="bi bi-upload"></i> 등록</button>
	 		 </div>
 		 </div> --%>
 		 
 		 <%-- 삭제예정 <i class="bi bi-person"></i>--%>
		 
		 	<div class="row mt-3 pb-1 border-bottom">
			 	<div class="col">
				  어서보여주개
			 	</div>
			 </div>
			 <div class="row my-3">
			 	<div class="col fw-bold fs-6">
				  <%-- <i class="bi bi-person"></i> --%>
				  <img id="profileImg" class="rounded-circle" src="../resources/img/myDog.jpg" width="33">
				  ${customerUser.customer_nickname}
			 	</div>
			 </div>  
		  
		<%-- 삭제예정 --%>
		
<%-- 사진입력		 <div class="row mt-2">
		 	<div class="col fst-italic fw-bold">
		 		사진
			</div>
		 </div>
		 <div class="row mb-2 mt-1">
		 	<div class="col">
		     <input type="file" class="form-control" name ="show_dog_post_images_name" multiple accept="image/*">
			</div>
		 </div> --%>
		
<%-- 		 <div class="row mt-4">
		 	<div class="col fst-italic fw-bold">
		 		제목
			</div>
		 </div> --%>
		 
		 <%-- 분리 --%>
		 <div class="row" style="height:0.5em; background-color:#F4F7FA">
		 </div>
		 
		 <div class="row">
		 	<div class="col border-bottom py-2 fw-bold fs-5">
			 <input type="text" class="form-control-plaintext" name="show_dog_post_title" placeholder="제목을 입력하세요">
			</div>
		 </div>
		 
<%-- 		 <div class="row mt-4">
		 	<div class="col fst-italic fw-bold">
		 		내용
			</div>
		 </div>--%>
		 <div class="row">
		 	<div class="col border-bottom py-2">
			 <textarea class="form-control-plaintext" name="show_dog_post_content" placeholder="내용을 입력하세요" style="height: 500px"></textarea>
		 	</div>
		 </div>
		 
		 <%-- bottom  height:48px--%>
		 <div class="row py-0 shadow fixed-bottom" style="background-color:white;">
		  <div class="col border-top">
			 <div class="row px-4 d-flex justify-content-between align-items-center">
			 	<%-- 글꼴 --%>				
				<div class="col pe-0 text-center">
				 <p class="btn mb-0 p-0"><i class="bi bi-fonts" style="font-size:1.4em"></i></p>
				</div>
				<%-- 첨부파일 --%>
				<div class="col pe-0 text-center">
				 <p class="btn mb-0 p-0"><i class="bi bi-paperclip" style="font-size:1.15em"></i></p>
				</div>
				<%-- 이미지 첨부--%>
				<div class="col pe-0 text-center">			 
				 <label for="uploadImages" class="btn p-0" style="position:relative; overflow:hidden;"> 
			     <button class="btn"><i class="bi bi-images" style="font-size:1.2em"></i></button>
			      <input type="file" id="uploadImages" class="form-control" name="show_dog_post_images_name" 
			      		 style="position:absolute; top:0; left:0; opacity:0;" multiple accept="image/*">	     
			     </label>
				</div>
				<%-- 영상 첨부 --%>
				<div class="col pe-0 text-center">
				 <p class="btn mb-0 p-0"><i class="bi bi-camera-video" style="font-size:1.3em"></i></p>
				</div>	
				<%-- 해시태그 --%>
				<div class="col pe-0 text-center">
				 <p class="btn mb-0 p-0"><i class="bi bi-hash" style="font-size:1.3em"></i></p>
				</div>
				<%-- 기타 --%>
				<div class="col text-center">
				 <p class="btn mb-0 p-0"><i class="bi bi-three-dots" style="font-size:1.3em"></i></p>
				</div>
			 </div>
		   </div>
		  </div>
		<%-- ----------- --%> 
		</form>	
	</div>
 	</div>
 	
 	
</div>


 

<%-- mobileStyle 
  <jsp:include page="../common/bottomTabStyle.jsp"></jsp:include>
--%>  

</body>
</html>