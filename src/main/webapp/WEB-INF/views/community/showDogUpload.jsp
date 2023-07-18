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
	 		  <a class="bi bi-arrow-left text-secondary" role="button" onclick="history.back(-1)"></a>
	 		 </div>
	 		 
	 		 <div class="col text-end">
	 		 <%-- <button class="btn btn-primary">임시저장</button> --%>
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
		
		 <div class="row mt-2">
		 	<div class="col fst-italic fw-bold">
		 		사진
			</div>
		 </div>
		 <div class="row mb-2 mt-1">
		 	<div class="col">
		     <input type="file" class="form-control" name ="show_dog_post_images_name" multiple accept="image/*">
			</div>
		 </div>
		
		 <div class="row mt-4">
		 	<div class="col fst-italic fw-bold">
		 		제목
			</div>
		 </div>
		 <div class="row">
		 	<div class="col border-bottom pb-2 fw-bold fs-5">
			 <input type="text" class="form-control-plaintext" name="show_dog_post_title" placeholder="제목을 입력해주세요">
			</div>
		 </div>
		 
		 <div class="row mt-4">
		 	<div class="col fst-italic fw-bold">
		 		내용
			</div>
		 </div>
		 <div class="row">
		 	<div class="col border-bottom py-2">
			 <textarea class="form-control-plaintext" name="show_dog_post_content" placeholder="내용을 입력하세요" style="height: 650px"></textarea>
		 	</div>
		 </div>
		</form>	
	</div>
 	</div>
</div>

	<%-- 
	<div class="col justify-content-center">
	
	<div class="row">
		<form action="./showDogUploadProcess" method="post">
		 <div class="col">
			 <div class="row">
			  작성자(닉네임)
			  ${customerUser.customer_nickname}
			 </div>
			 
			 <div class="row">
			  <input type="text" class="form-control" name="show_dog_post_title" placeholder="제목을 입력하세요">
			 </div>
			 <div class="row">
			  <button>첨부파일 불러오기</button>
			 </div>
			 <div class="row">
			  <textarea class="form-control" name="show_dog_post_content" placeholder="내용을 입력하세요"></textarea>
			 </div>
			
			 <div class="row">
			  <button class="btn btn-primary">업로드하기</button>
			  <button class="btn btn-primary">임시저장</button>
			 </div>
		</div>
		</form>
	</div>

	</div>
	--%>

<%-- mobileStyle --%>
  <jsp:include page="../common/bottomTabStyle.jsp"></jsp:include>
<%-- ----------- --%>  

</body>
</html>