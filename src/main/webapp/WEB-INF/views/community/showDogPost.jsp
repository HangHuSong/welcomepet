<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showDogPost.jsp</title>
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

<%-- font link --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<%-- font link --%>

<script type="text/javascript">
 <%-- ajax --%>
 	<%-- 좋아요 
 	function reloadLikes{
 		const postId = ${postData.showDogPostDto.show_dog_post_no};
 		const 
 	};--%>
 	
 	<%-- 새로운 댓글쓰기 --%>
 	function registerComment(){
		const postId = ${postData.showDogPostDto.show_dog_post_no};
		const commentValue = document.querySelector("#inputCommentText").value;
		
		var xhr = new XMLHttpRequest(); 
	    xhr.onload = function() {
	        if (xhr.status === 200) {
	            // 응답이 성공적으로 도착했을 때 실행되는 코드
	            document.querySelector("#inputCommentText").value = "";
	            reloadComment();
	        } else {
	            // 서버로부터 오류 응답을 받은 경우
	            console.error('요청이 실패하였습니다.');
	        }
	    };

	    // 요청을 보낼 URL 설정
	    var url = './registerComment'; // 데이터를 받아올 URL

	    // GET 방식 요청 설정
	    xhr.open('POST', url, true);
	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	    // 요청 보내기
	    xhr.send('show_dog_comment_content=' + commentValue + "&show_dog_post_no=" + postId);				
		
 	}
 
 	<%-- 댓글리스트 --%>
	function reloadComment(){
		const postId = ${postData.showDogPostDto.show_dog_post_no};
		
		var xhr = new XMLHttpRequest(); 
	    xhr.onload = function() {
	        if (xhr.status === 200) {
	            // 응답이 성공적으로 도착했을 때 실행되는 코드
	            var response = JSON.parse(xhr.responseText);
	            
	            const commentRootBox = document.querySelector("#commentRootBox");
	            commentRootBox.innerHTML = "";
	            
	            for(x of response){
	            	const newNode = document.querySelector("#templete .commentWrapper").cloneNode(true);
	            	
	            	newNode.querySelector(".nickname").innerText = x.customerDto.customer_nickname;
	            	newNode.querySelector(".content").innerText = x.showDogCommentDto.show_dog_comment_content;
	            	
	            	
	            	const date = new Date(x.showDogCommentDto.show_dog_comment_reg_date);
	            	
	            	newNode.querySelector(".date").innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDay();
	            	

	            	commentRootBox.appendChild(newNode);
	            }
	            
	            
	        } else {
	            // 서버로부터 오류 응답을 받은 경우
	            console.error('요청이 실패하였습니다.');
	        }
	    };
		

	    // 요청을 보낼 URL 설정
	    var url = './getCommentDatas?show_dog_post_no=' + postId; // 데이터를 받아올 URL

	    // GET 방식 요청 설정
	    xhr.open('GET', url, true);

	    // 요청 보내기
	    xhr.send();		
		
	}	
	<%-- ------ --%>
 
	window.addEventListener("DOMContentLoaded", function(){
		reloadComment();
	});
	
 <%-- ajax --%>
</script>

<style>
/* 글꼴설정 */
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
/* 여기까지 글꼴설정 */

#body{
	font-family: 'SUITE-Regular' !important;
	letter-spacing:0.02em;
}

#postTitle{
	font-size: 1.2em;
}
#postDetail{
	font-size:0.8em;
}

.nickname{
	font-size:0.9em;
	font-weight:600;
}
.date{
	font-size: 0.75em;
}

#postContent{
	
}


/* 게시글 이미지 */
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

<div class="container mt-1 mb-5" id="body">
	<div class="row pb-3 border-bottom">
		<div class="col">
			<div class="row">
				 <div class="col">
				 	
				 	<div class="row border-bottom py-3">
				 		<%-- 제목 --%>
				 		<div class="col-10" id="postTitle">
				 		 ${postData.showDogPostDto.show_dog_post_title}			 		 
				 		</div>
				 		<%-- : --%>
				 		<div class="col-2 text-end">
							<div class="dropdown">
							  <a class="bi bi-three-dots-vertical text-secondary dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
							
							  <ul class="dropdown-menu">
							  	<c:choose>
							  	<%-- 글쓴이일때 --%>
							  	<c:when test="${!empty customerUser && customerUser.customer_no eq postData.customerDto.customer_no}">
							     <li><a class="dropdown-item" href="./showDogUpdate?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}">수정</a></li>
							     <li><a class="dropdown-item" href="./showDogDeleteProcess?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}">삭제</a></li>
							    </c:when>
							    <%-- 글쓴이 아닐때 --%>
							    <c:otherwise>
							     <li><a class="dropdown-item" href="#">신고</a></li>
							    </c:otherwise>
							    </c:choose> 
							  </ul>
							  
							</div>
						</div>
						
						<%-- 상세글 정보 --%>		 		
				 		<div class="col text-secondary pt-2" id="postDetail">
				 			<%-- 프사 --%>
				 			<span class="me-0">
				 			 <img id="profileImg" class="rounded-circle" src="../resources/img/myDog.jpg" width="33">
				 			</span>
				 			<%-- 닉네임  style="font-weight:bold"--%>
					 		<span class="me-2" style="font-weight:600">
					 		 ${postData.customerDto.customer_nickname}
					 		</span>
					 		 <%-- 작성일 --%>
							<span class="me-2">
							 <fmt:formatDate value="${postData.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
							</span>
							<%-- 조회수 --%> 
							<span class="me-2">
							 조회 ${postData.showDogPostDto.show_dog_post_view_count}
							</span>			 	 	 	
				 		</div> 		
				 		<%-- 여기까지 상세글 정보 --%>	
				 	</div>
				 	
				 	<%-- 글 내용 --%>
				 	<div class="row pt-3 pb-5">
				 		<div class="col">
				 			<div class="row">
				 				<div class="col px-0">
							 		 <c:forEach items="${postData.postImageDtoList}" var="showImages">
							 		  	<img id="postImg" src="/uploadFiles/WelcomePet_community/${showImages.show_dog_post_images_link}" alt="사진 어디감">
							 		 </c:forEach>			 				
				 				</div>
				 			</div>
				 			<div class="row mt-3" id="postContent">
				 				<div class="col">
				 					${postData.showDogPostDto.show_dog_post_content}
				 				</div>
				 			</div>
				 		</div>
				 	</div>
				 	
				 	<%-- 좋아요 --%>
				 	<form action="doLikeProcess" method="post">
					 	<input type="hidden" name="show_dog_post_no" value="${postData.showDogPostDto.show_dog_post_no}">
					 	<div class="row">
					 		<div class="col text-center">
						 		<c:choose>
						 		 <c:when test="${checkWhetherLike == 0}">
						 		 	<button class="btn btn-sm btn-outline-danger"><i class="bi bi-hand-thumbs-up"></i> ${countLike}</button>
					 			 </c:when>
					 			 
					 			 <c:otherwise>
						 		 	<button class="btn btn-sm btn-outline-danger"><i class="bi bi-hand-thumbs-up-fill"></i> ${countLike}</button>
					 			 </c:otherwise>
					 			</c:choose>
					 		</div>
					 	</div>
				 	</form>
				 	
				 </div>
			</div>
		</div>
	</div>
	
	<%-- 댓글 --%>
	<div class="row mt-4">	
		 <%-- 댓글 기타--%>
		 <div class="col-7 fw-bold ps-3 mb-3" style="font-size: 0.9em;">
		 	<%-- 댓글수 --%>
			<span>
			 댓글 ${countComment}
			</span>
		 </div>
		 <%-- 댓글수 --%>
		 <div class="col pe-0 mb-3 text-end">
		   <button class="btn btn-outline-none text-end p-0" style="font-size:0.9em;">
		    <i class="bi bi-filter-left"></i>등록순
		   </button>
		 </div>		 
		 <div class="col mb-3">
		   <button class="btn btn-outline-none text-end p-0" style="font-size:0.9em;">
		    <i class="bi bi-filter-right"></i>최신순
		   </button>
		 </div>		 
		 		 
		 
		 <div class="col-12" id="commentRootBox">
		 
		 <%-- 댓글 JSP 버전 
		  <c:forEach items="${commentData}" var="commentData">
		  <div class="row border-bottom pt-1 pb-3">
			 <div class="col-auto ps-3 pe-0 text-end">
			  <img class="rounded-circle" src="https://dummyimage.com/3*3" alt="...">
			 </div>
			 
			 <div class="col">
				  <div class="row">
				  	<div class="col fw-bold" style="font-size: 13px;">
				  	 ${commentData.customerDto.customer_nickname}
				  	</div>
				  	
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
		  --%>
		 </div>
		 

		<%-- 새 댓글쓰기 
		<div class="col mt-2">	 
			<div class="row">
				<div class="col pe-0">
				 <textarea id="inputCommentText" class="form-control-plaintext" style="height: 2.5em" name="show_dog_comment_content" placeholder="댓글 작성하기"></textarea>
				</div>
				
				<div class="col-2 d-grid ">
				 <button onclick="registerComment()" class="btn" style="color:white; background-color:#fd7e14">
				  <i class="bi bi-arrow-return-left" style="stroke-width:2;"></i>
				 </button>
				</div>
			</div>
			</div>--%>
			<%-- JSP 방식 
			<form action="./writeCommentProcess?show_dog_post_no=${postData.showDogPostDto.show_dog_post_no}" method="post">
				<div class="row">
					<div class="col pe-0">
					 <textarea class="form-control-plaintext" style="height: 2.5em" name="show_dog_comment_content" placeholder="댓글 작성하기"></textarea>
					</div>
					
					<div class="col-2 d-grid ">
					 <button class="btn" style="color:white; background-color:#fd7e14"><i class="bi bi-arrow-return-left" style="stroke-width:2;"></i></button>
					</div>
				</div>
			</form> 
			--%>		
		
	</div>
	<%-- 댓글 --%>
	
	<div id="templete" class="d-none">
		  <div class="commentWrapper row border-bottom pt-2 pb-3">
			 <%-- 프사 --%>
			 <div class="col-auto ps-3 pe-0 text-end">
			  <img class="rounded-circle" src="https://dummyimage.com/3*3" alt="...">
			 </div>
			 
			 <div class="col">
				  <div class="row pt-1">
				  	<%-- 댓글 닉네임 --%>
				  	<div class="col nickname">닉네임</div>			  	
				  	<%-- 댓글 수정 삭제 --%>
				  	<div class="col text-end dropdown pe-3">
				 	 <a class="text-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				 	  <i class="bi bi-three-dots-vertical"></i>
				 	 </a>
				 	 <ul class="dropdown-menu">
					 	 <li><a class="dropdown-item" type="button">수정</a></li>
					 	 <li><a class="dropdown-item" type="button">삭제</a></li>
					 	 <li><a class="dropdown-item" type="button">신고</a></li>
				 	 </ul>
				  	</div>  					  	
				  </div>
				 
				  <div class="row pt-0 align-items-start">
				   <%-- 댓글 데이터 --%>
				   <div class="col-12 content">내용</div>
				   <div class="col text-secondary date">날짜
				    답글쓰기
				   </div>
				  </div>
			  </div>
			 
		  </div>
	</div>
	
</div>

<%-- mobileStyle --%>
  <jsp:include page="../common/showPostBottomNavi.jsp"></jsp:include>
<%-- ----------- --%>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>