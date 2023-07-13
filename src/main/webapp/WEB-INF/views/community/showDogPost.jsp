<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showDogPostLikes.jsp</title>
<%------ bootstrap ------%>
<%-- viewport --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- link 
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">--%>
<%------ bootstrap ------%>
<script>

</script>

<style>
  #postImg {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 0 auto;
  }
</style>
</head>
<body>
<%-- mobileStyle --%>
  <jsp:include page="../common/topNaviPost.jsp"></jsp:include>
<%-- ----------- --%>  

<div class="container mt-1 mb-4">
 	<%-- 로그인한 사람만 수정/삭제 
	<c:if test="${!empty customerUser && customerUser.customer_no eq postData.customerDto.customer_no}">
		<a href="./showDogUpdate?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}">수정</a>
		<a href="./showDogDeleteProcess?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}">삭제</a>
	</c:if>
	<%-- 로그인한 사람만 수정/삭제 --%>
	<div class="row py-3 border-bottom">
		<div class="col">
			<div class="row">
				 <div class="col">
				 	
				 	<div class="row border-bottom py-3">
				 		<%-- 제목 --%>
				 		<div class="col-10 fw-bold fs-5">
				 		 ${postData.showDogPostDto.show_dog_post_title}			 		 
				 		</div>
				 		<%-- : --%>
				 		<div class="col-2 text-end dropdown">
						  <a class="text-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    <i class="bi bi-three-dots-vertical"></i>
						  </a>
						  <ul class="dropdown-menu">
						  	<c:choose>
						  	 <%-- 글쓴이일때 --%>
						     <c:when test="${!empty customerUser && customerUser.customer_no eq postData.customerDto.customer_no}">
						     <li><a class="dropdown-item" type="button" 
						    	    href="./showDogUpdate?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}">수정</a>
						     </li>
						     <li><a class="dropdown-item" type="button"
						    	    href="./showDogDeleteProcess?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}">삭제</a>
						     </li>
						     </c:when>
						     <%-- 글쓴이 아닐때 --%>
						     <c:otherwise>
						     <li><a class="dropdown-item" type="button">신고</a></li>
						     </c:otherwise>
						    </c:choose>
						  </ul>
						</div>
						
						<%-- 상세글 정보 --%>		 		
				 		<div class="col text-secondary" style="font-size: 10pt;">
				 			<span class="me-1">
				 			 <img class="rounded-circle" src="https://dummyimage.com/3*3" alt="...">
				 			</span>
					 		<span class="me-2">
					 		 ${postData.customerDto.customer_nickname}
					 		</span>
					 		 
							 <span class="me-2">
							  <fmt:formatDate value="${postData.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
							 </span>
							 
							 <span class="me-2">
							  조회 ${postData.showDogPostDto.show_dog_post_view_count}
							 </span>			 	 	 	
							 
							 <span>
							  댓글 ${countComment}
							 </span>
							 	 
				 		</div> 		
				 	</div>
				 	
				 	<%-- 글 내용 --%>
				 	<div class="row py-3">
				 		<div class="col">
				 		 <c:forEach items="${postData.postImageDtoList}" var="showImages">
				 		  	<img id="postImg" src="/uploadFiles/petImages/${showImages.show_dog_post_images_link}" alt="사진 어디감">
				 		 </c:forEach>
				 		 ${postData.showDogPostDto.show_dog_post_content}
				 		</div>
				 	</div>
				 	
				 	<%-- 제일 하단 좋아요 --%>
				 	<%-- 얘도 가능
				 		<a class="btn btn-lg text-danger bi bi-heart-fill" href="./doLikeProcess?~no=${} }" class></a> 
				 	--%>
				 	<form action="doLikeProcess" method="post">
					 	<input type="hidden" name="show_dog_post_no" value="${postData.showDogPostDto.show_dog_post_no}">
					 	<div class="row">
					 		<div class="col text-center">
						 		<c:choose>
						 		 <c:when test="${checkWhetherLike == 0}">
						 		  <button class="btn btn-lg text-danger bi bi-heart" > ${countLike}</button>	
					 			 </c:when>
					 			 
					 			 <c:otherwise>
					 			  <button class="btn btn-lg text-danger bi bi-heart-fill" > ${countLike}</button>	
					 			 </c:otherwise>
					 			</c:choose>
					 		</div>
					 	</div>
				 	</form>
				 	
				 	<%-- <c:choose>
					 		<c:when test="${!empty sessionUser}">
				 			 <a class="btn btn-lg text-danger bi bi-heart-fill" role="button"></a> 
				 			</c:when>
				 			<c:otherwise>
				 			 <a class="btn btn-lg text-danger bi bi-heart" role="button"></a>
				 			</c:otherwise>
			 			</c:choose>
			 		--%>

				 </div>
			</div>
		</div>
	</div>
	
	<%-- 댓글 --%>
	<div class="row">	
		 <%-- 댓글 정렬--%>
		 <div class="col-12 fw-bold text-secondary mb-3" style="font-size: 10pt;">
		   <%-- 최근순 
		   <a href="./showDogPost?show_dog_post_no=${commentData.showDogCommentDto.show_dog_post_no}&commentOrder=recent">최신순</a>--%>
		   <%-- 오래된순 
		   <a href="./showDogPost?show_dog_post_no=${commentData.showDogCommentDto.show_dog_post_no}&commentOrder='recent'">최신순</a>--%>
		   <button>등록순</button>
		   <button>최신순</button>
		 </div>		 
		 		 
		 <div class="col-12">
		  <c:forEach items="${commentData}" var="commentData">
		  <div class="row border-bottom py-3">
		 	<%-- 프사 --%>
			 <div class="col-auto ps-3 pe-0 text-end">
			  <img class="rounded-circle" src="https://dummyimage.com/3*3" alt="...">
			 </div>
			 
			 <%-- 댓글 데이터 --%>
			 <div class="col">
				  <div class="row">
				  	<div class="col fw-bold" style="font-size: 10pt;">
				  	 ${commentData.customerDto.customer_nickname}
				  	</div>
				  	
				  	<%-- 댓글 수정 삭제 --%>
				  	<div class="col text-end dropdown pe-3">
				 	 <a class="text-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				 	  <i class="bi bi-three-dots-vertical"></i>
				 	 </a>
				 	 <ul class="dropdown-menu">
				 	 	<c:if test="${!empty customerUser && customerUser.customer_no eq commentData.customerDto.customer_no}">
					 	 <li><a class="dropdown-item" type="button">수정</a></li>
					 	 <li><a class="dropdown-item" type="button"
					 	 		href="./deleteCommentProcess?show_dog_post_no=${commentData.showDogCommentDto.show_dog_post_no}">삭제</a>
					 	 </li>
					 	</c:if> 
					 	 <li><a class="dropdown-item" type="button">신고</a></li>
				 	 </ul>
				  	</div>  	
				  </div>
				 
				  <div class="row">
				   <div class="col-12">
				    ${commentData.showDogCommentDto.show_dog_comment_content}
				   </div>
				   <div class="col text-secondary" style="font-size: 10pt;">
				    <fmt:formatDate value="${commentData.showDogCommentDto.show_dog_comment_reg_date}" pattern="yy.MM.dd"/>
				    답글쓰기
				   </div>
				  </div>
			 </div>
		  </div>
		  </c:forEach>
		 </div>
		 

		<div class="col mt-2">	 
		
			<form action="./writeCommentProcess?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}" method="post">
				<div class="row">
					<div class="col d-grid pe-0">
					 <textarea class="form-control-plaintext" style="height: 50px" name="show_dog_comment_content" placeholder="댓글 작성하기"></textarea>
					</div>
					
					<div class="col-2">
					 <button class="btn btn-primary"><i class="bi bi-arrow-return-left"></i></button>
					</div>
				</div>
				
			</form> 		
		</div>
	</div>
	<%-- 댓글 --%>
	
</div>
<%-- 
<div class="col mt-2">	 
		
			<form action="./writeCommentProcess?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}" method="post">
				<div class="row">
					<div class="col d-grid pe-0" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">
					 <textarea class="form-control-plaintext" style="height: 50px" name="show_dog_comment_content" placeholder="댓글 작성하기"></textarea>
					</div>
					
					<div class="col-2">
					 <button class="btn btn-primary"><i class="bi bi-arrow-return-left"></i></button>
					</div>
				</div>
				<!-- 아래에서 올라오기 -->
				<div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
			  	 <div class="row d-flex justify-content-end">
				  	<div class="col">
				     <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				    </div> 	
			     	댓글 쓰는 부분
			     	<div class="row">
					<div class="col d-grid pe-0" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">
					 <textarea class="form-control-plaintext" name="show_dog_comment_content" 
					 		   placeholder="댓글 작성하기"></textarea>
					</div>
					
					<div class="col-2">
					 <button class="btn btn-primary"><i class="bi bi-arrow-return-left"></i></button>
					</div>
					</div>
			  	 </div>
				</div>
			</form> 		
		</div> --%>

<%-- 댓글 --%>

	<%-- 	
	<div class="col">
		<div class="row" style="font-size: 10pt;">게시판 카테고리</div>
	</div>
	
	<div class="col">
		<div class="row fw-semibold" style="font-size: 15pt;">
		 ${postData.showDogPostDto.show_dog_post_title}
		</div>
		<div class="row mt-2 mb-2" style="font-size: 12pt;">		
			<div class="col-2 ps-0">img</div>
			<div class="col">
				<div class="row">
				 ${postData.customerDto.customer_nickname}
				</div>
		 	 
		 	 	<div class="row">
		 	 	 <fmt:formatDate value="${postData.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
		 	 	 조회 ${postData.showDogPostDto.show_dog_post_view_count}
		 	 	</div> 
		 	</div>
		</div>
		 
		<!-- 게시글 내용 -->
		<div class="pt-3 pb-3 border-top border-bottom">
		 ${postData.showDogPostDto.show_dog_post_content}
		</div>
	</div>
--%>

<%-- 
<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" 
aria-controls="offcanvasBottom">Toggle bottom offcanvas</button>
--%>



<%-- mobileStyle --%>
  <jsp:include page="../common/bottomTabStyle.jsp"></jsp:include>
<%-- ----------- --%>  
</body>
</html>