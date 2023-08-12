<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showDogUpdate.jsp</title>
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
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

#updatePost{
	font-family:'SUITE-Regular';
}
</style>
</head>
<body>
<%-- mobileStyle --%>

<%-- ----------- --%>  
<div id="updatePost" class="container">
 	<div class="row mt-2 mb-5">		
 	<div class="col">
	 	<form action="./showDogUpdateProcess" method="post" enctype="multipart/form-data">
	 	<input type="hidden" name="show_dog_post_no" value="${postData.showDogPostDto.show_dog_post_no}">
		<input type="hidden" name="customer_no" value="${postData.showDogPostDto.customer_no}">		 
		 
		 <div class="row justify-content-between">
		 	 <div class="col-2">
		      <a onclick="history.back(-1)" class="btn btn-black py-0 ps-0" style="border: transparent; outline: none;">
			   <i class="btn bi bi-chevron-left p-0" style="border: transparent; outline: none; font-size: 1.4em;"></i>
			  </a>
		     </div>

	 		 <div class="col text-end pe-3">
	 		  <button class="btn fw-bold" style="color:white; background-color:#ffa500">수정</button>
	 		 </div>
 		 </div>
 		 
 		 <%-- 삭제예정 <i class="bi bi-person"></i>--%>		 
		 	<div class="row mt-4 pb-2 border-bottom">
			 	<div class="col fw-bold fs-6">
				  어서보여주개
			 	</div>
			 </div>
			 <div class="row mt-3 mb-4">
			 	<div class="col fw-bold fs-6">
				  <%-- <i class="bi bi-person"></i> --%>
				  <img id="profileImg" class="rounded-circle" src="../resources/img/myDog.jpg" width="33">
				  ${customerUser.customer_nickname}
			 	</div>
			 </div>  	  
		<%-- 삭제예정 <div class="col border-bottom py-2 fw-bold fs-5"></div>--%>
		
		 <div class="row">
		 	<div class="col border-bottom pb-2 fw-bold fs-5">
			 <input type="text" class="form-control-plaintext" name="show_dog_post_title" 
			 		value="${postData.showDogPostDto.show_dog_post_title}" placeholder="제목을 입력해주세요">
			</div>
		 </div>

		 <div class="row">
		 	<div class="col border-bottom py-2">
			 <textarea class="form-control-plaintext" name="show_dog_post_content" 
			 		   placeholder="내용을 입력하세요" style="height:500px">${postData.showDogPostDto.show_dog_post_content}</textarea>
		 	</div>
		 </div>
		 
		 
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
		 <%-- bottom 
		 <div class="row py-1 shadow fixed-bottom border-top" style="background-color:white;">
		  <div class="col">
			 <div class="row pe-4 ps-4 justify-content-center">				
				<div class="col-auto">
				 <p class="btn mb-0 btn-lg pe-0"><i class="bi bi-fonts"></i></p>
				</div>
				
				<div class="col-auto">
				 <p class="btn mb-0 btn-lg pe-0"><i class="bi bi-paperclip"></i></p>
				</div>
				
				<div class="col-auto">			 
				 <label for="uploadImages" class="btn p-0" style="position:relative; overflow:hidden;"> 
			     <button class="btn btn-lg pe-0"><i class="bi bi-images"></i></button>
			      <input type="file" id="uploadImages" class="form-control" name="show_dog_post_images_name" 
			      		 style="position: absolute; top: 0; left: 0; opacity: 0;" multiple accept="image/*">	     
			     </label>
				</div>
				
				<div class="col-auto">
				 <p class="btn btn-lg mb-0 pe-0"><i class="bi bi-camera-video"></i></p>
				</div>	
				
				<div class="col-auto">
				 <p class="btn btn-lg mb-0 pe-0"><i class="bi bi-hash"></i></p>
				</div>
			 </div>
		   </div>
		  </div>--%>
		<%-- ----------- --%> 
		</form>	
	</div>
 	</div>
 	
</div>
<%-- ----------- --%> 

</body>
</html>