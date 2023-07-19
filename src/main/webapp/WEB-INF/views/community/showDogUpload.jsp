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
</head>
<body>
<%-- mobileStyle --%>
  
<%-- ----------- --%>  

<div class="container">
 	<div class="row mt-3 mb-3">		
 	<div class="col">
	 	<form action="./showDogUploadProcess" method="post" enctype="multipart/form-data">		 
		 <div class="row justify-content-between">
	 		 <div class="col-2">
	 		  <a class="bi bi-arrow-left text-secondary" role="button" onclick="history.back(-1)" style="stroke-width:3"></a>
	 		 </div>
	 		 
	 		 <div class="col text-end">
	 		  <button class="btn" style="color:white; background-color:#fd7e14">임시저장</button>
	 		  <button class="btn" style="color:white; background-color:#fd7e14"><i class="bi bi-upload"></i> 업로드</button>
	 		 </div>
 		 </div>
 		 
 		 <%-- 삭제예정 --%>
		 
			 <div class="row my-4">
			 	<div class="col fw-bold fs-6">
					  <i class="bi bi-person"></i>
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
		 <div class="row">
		 	<div class="col border-bottom pb-2 fw-bold fs-5">
			 <input type="text" class="form-control-plaintext" name="show_dog_post_title" placeholder="제목을 입력해주세요">
			</div>
		 </div>
		 
<%-- 		 <div class="row mt-4">
		 	<div class="col fst-italic fw-bold">
		 		내용
			</div>
		 </div>--%>
		 <div class="row">
		 	<div class="col border-bottom py-2">
			 <textarea class="form-control-plaintext" name="show_dog_post_content" placeholder="내용을 입력하세요" style="height: 650px"></textarea>
		 	</div>
		 </div>
		 
		 <%-- bottom --%>
		 <div class="row fixed-bottom">
		  <div class="col">
<%--	   		 <div class="row mt-2">
			 	<div class="col fst-italic fw-bold">
			 		사진
				</div>
			 </div>--%>
			 <div class="row pe-4 ps-4 justify-content-center">				
				<div class="col-auto"><button><i class="bi bi-fonts"></i></button></div>
				
				<div class="col-auto"><button><i class="bi bi-paperclip"></i></button></div>
				
				<div class="col-auto">			 
				 <label for="uploadImages" class="btn py-0" style="position:relative; overflow:hidden;"> 
			     <button><i class="bi bi-images"></i></button>
			      <input type="file" id="uploadImages" class="form-control" name="show_dog_post_images_name" 
			      		 style="position: absolute; top: 0; left: 0; opacity: 0;" multiple accept="image/*">	     
			     </label>
				</div>
				
				<div class="col-auto"><button><i class="bi bi-camera-video"></i></button></div>	
				
				<div class="col-auto"><button><i class="bi bi-hash"></i></button></div>
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