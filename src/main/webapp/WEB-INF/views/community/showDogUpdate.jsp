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
</head>
<body>
<%-- mobileStyle --%>

<%-- ----------- --%>  

<div class="container">
<div class="row mt-3 mb-1">
	<div class="col">
			<form action="./showDogUpdateProcess" method="post" enctype="multipart/form-data">
			<input type="hidden" name="show_dog_post_no" value="${postData.showDogPostDto.show_dog_post_no}">
			<input type="hidden" name="customer_no" value="${postData.showDogPostDto.customer_no}">
			
			 <div class="row justify-content-between">
		 		 <div class="col-4">
		 		  <a class="bi bi-arrow-left text-secondary" role="button" onclick="history.back(-1)"></a>
		 		 </div>
		 	
		 		 <div class="col text-end">
		 		  <button class="btn btn-primary">수정</button>
		 		 </div>
	 		 </div>
	 		 
 	 		<div class="row">
		 	 <div class="col">
		      <input type="file" name ="show_dog_post_images_name" multiple accept="image/*">
			 </div>
			</div>
		
		 	<div class="row">
		 	 <div class="col border-bottom py-2 fw-bold fs-5">
			   <input type="text" class="form-control-plaintext" name="show_dog_post_title"
			   		  value="${postData.showDogPostDto.show_dog_post_title}" placeholder="제목을 입력하세요">
			 </div>
		 	</div>
		 
		 	<div class="row">
		 	 <div class="col border-bottom py-2">
			   <textarea class="form-control-plaintext" name="show_dog_post_content" 
			   			 placeholder="내용을 입력하세요" style="height: 650px">${postData.showDogPostDto.show_dog_post_content}</textarea>
		 	 </div>
		 	</div>
			</form>
	</div>

 </div>
</div>
<%-- 
	<div class="col justify-content-center">
		<div class="row">
		<form action="./showDogUpdateProcess" method="post">
			<input type="hidden" name="show_dog_post_no" value="${postData.showDogPostDto.show_dog_post_no}"> 
			
			<div class="row">
			 <div class="col">
			  <div class="row">글 번호</div>
			  <div class="row">작성자(닉네임)</div>
			  <div class="row">작성시간</div>
			  <div class="row">제목</div>
			  <div class="row">내용</div>
			  <div class="row">조회수</div>
			  <div class="row">좋아요 수</div>
			 </div>
			  
			 <div class="col">
			  <div class="row">
			   ${postData.showDogPostDto.show_dog_post_no}
			  </div>
			  <div class="row">
			   ${customerUser.customer_nickname}
			  </div>
			  <div class="row">
			   ${postData.showDogPostDto.show_dog_post_reg_date}
			  </div>
			  <div class="row">
			   <input type="text" class="form-control" name="show_dog_post_title" value="${postData.showDogPostDto.show_dog_post_title}">
			  </div>
			  <div class="row">
			   <textarea 
			   class="form-control" name="show_dog_post_content">${postData.showDogPostDto.show_dog_post_content}
			   </textarea>
			  </div>
			  <div class="row">
			   ${postData.showDogPostDto.show_dog_post_view_count}
			  </div>
			  <div class="row">
			   show_dog_post_count_likes
			  </div>	  
			 </div>
			</div>
		
			<div class="row">
			<button class="btn btn-primary">수정하기</button>
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