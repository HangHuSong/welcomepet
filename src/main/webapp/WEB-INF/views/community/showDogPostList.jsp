<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showDogPostList.jsp</title>
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
.thum{
	height:55px;
	width:55px;
}
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-style: normal;
}
#title{
    font-size:1.1em;
    font-weight:600;
    font-family:'SUITE-Regular', sans-serif;
}
</style>
</head>
<body>
<%-- mobileStyle --%>
  <jsp:include page="../common/topNaviCommu.jsp"></jsp:include>
<%-- ----------- --%>  

<div class="container">
	
	<%-- 배너이미지 --%>
	<div class="row mb-1">
		<div class="col p-0">
			<%--<img class="img-fluid" src="/welcomepet/resources/board/img/banner.jpg">--%>
		</div>
	</div>

	<%-- 베스트 3 --%>
	<div class="row mb-4"> 
		<div class="col">
			<div class="row">
			<c:forEach items="${bestList}" var="bestList">
				<div class="col-12 border-bottom py-2">
					<div class="row">
						<div class="col" onclick="location.href='./showDogPost?show_dog_post_no=${bestList.showDogPostDto.show_dog_post_no}'">
						  <%-- 제목 --%>
						  <div class="row">
						   <div class="col-1">
						    <i class="bi bi-hand-thumbs-up-fill" style="color:#fd7e14;"></i>
						   </div>
						   <div class="col-auto pe-0">
							  <span>
							   <a class=" me-1 text-decoration-none text-black"
							   	  style="font-family: 'SUITE-Regular', sans-serif; font-size:1em; font-weight:800;">
							   ${bestList.showDogPostDto.show_dog_post_title}</a>
							  </span>
						   </div>
						   
						   <div class="col ps-1">
						 	<c:if test="${bestList.checkImg > 0}">
							   	  <span style="color:#FDB959">
							   	  <i class="bi bi-image"></i>
							   	  </span>
					   	    </c:if>
						   </div>
						   
						   
						   
						  </div>
						  
						  <%-- 닉네임/날짜/조회수 
						  <div class="row text-secondary" style="font-size: 0.9em;">
							<div class="col">
								<span class="me-2">
								 ${bestList.customerDto.customer_nickname}
								</span>
								
								<span class="me-2">
								 <fmt:formatDate value="${bestList.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
								</span>
								
								<span>
								 조회수 ${bestList.showDogPostDto.show_dog_post_view_count}
								</span>
							</div>
						  </div>	
						  
						  <div class="col">
								<span class="me-2">
								 ${bestList.customerDto.customer_nickname}
								</span>
								
								<span class="me-2">
								 <fmt:formatDate value="${bestList.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
								</span>
								
								<span>
								 조회수 ${bestList.showDogPostDto.show_dog_post_view_count}
								</span>
							</div>--%>				
						</div>
						
						
						
						<%-- 댓글 
						<div class="col-2 d-flex justify-content-center align-items-center">
						 <c:choose>
							  <c:when test="${bestList.countComment eq 0}">
							   <span>
							   </span>
							  </c:when>	
							  
							  <c:otherwise>
							   <span class="badge text-secondary border p-2" style="background-color: #F0F0F0;">
							    ${bestList.countComment}
							    <br> 댓글
							   </span>
							  </c:otherwise>
						  </c:choose>		
						</div>--%>
					</div>					
				</div>			
			</c:forEach>
			</div>
		</div>
	</div>
	
	<%-- 글 리스트 --%>
	<div class="row mb-4"> 
		<div class="col">
			<div class="row">
			<c:forEach items="${list}" var="map">
				<div class="col-12 border-bottom py-2">
					<div class="row">
						<div class="col" onclick="location.href='./showDogPost?show_dog_post_no=${map.showDogPostDto.show_dog_post_no}'">
						  <%-- 제목 --%>
						  <div class="row">
						   <div class="col-12">
							  <span>
							   <a id="title" class="me-1 text-decoration-none text-black">${map.showDogPostDto.show_dog_post_title}</a>
							  </span>						  
						   </div>
						  </div>						  
						  
						  <%-- 닉네임/날짜/조회수 --%>
						  <div class="row text-secondary" style="font-size: 0.8em;">
							<div class="col">
								<span class="me-2">
								 ${map.customerDto.customer_nickname}
								</span>
							
								<span class="me-2">
								 <fmt:formatDate value="${map.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
								</span>
								
								<span>
								 조회수 ${map.showDogPostDto.show_dog_post_view_count}
								</span>
							</div>
						  </div>					
						</div>						

						<%-- 섬네일 --%>
						<div class="col-2 p-0 embed-responsive embed-responsive-1by1">
						 <c:if test="${map.checkImg > 0}">
					   	  <img class="thum w-100 embed-responsive-item rounded" style="object-fit: cover;" alt="X" src="/uploadFiles/WelcomePet_community/${map.postImageDtoList[0].show_dog_post_images_link}" />
						 </c:if>
						 
						</div>
						
						<%-- 댓글 코드수정 전--%>
						<%-- <div class="col-2 d-flex justify-content-center align-items-center">
						 <c:choose>
							  <c:when test="${map.countComment eq 0}">
							   <span>
							   </span>
							  </c:when>	
							  
							  <c:otherwise>
							   <span class="badge text-secondary border p-2" style="background-color: #F0F0F0;">
							    ${map.countComment}
							    <br> 댓글
							   </span>
							  </c:otherwise>
						  </c:choose>		
						</div> --%>
						
						<%-- 댓글 수 뱃지 --%>
						<div class="col-2">
						<div class="badge d-flex align-items-center justify-content-center" 
							 style="height:55px; background-color: #F0F0F0;
							 		font-family:'SUITE-Regular', sans-serif;">
						 
						 <c:choose>
							  <c:when test="${map.countComment eq 0}">
							   <div class="row">
							    <div class="col">
	
  	 						    <div class="row mt-1">
							     <div class="col" style="color:#454545; font-weight:900;">0</div>
							    </div>
							   
							    <div class="row mt-1">
							     <div class="col" style="color:#9c9c9c; font-weight:500;">댓글</div>
							    </div>
							   
							    </div>
							   </div>
							  </c:when>	
							  
							  <c:otherwise>
							  <div class="row">
							   <div class="col">
							   
							   <div class="row">
							    <div class="col" style="color:#454545; font-weight:900;">${map.countComment}</div>
							   </div>
							   <div class="row mt-1">
							    <div class="col" style="color:#9c9c9c; font-weight:500;">댓글</div>
							   </div>

							   </div>
							  </div>
							  </c:otherwise>
						  </c:choose>		
						</div>
						</div>
						<%-- -------- --%>
							 
					</div>					
				</div>			
			</c:forEach>
			</div>
		</div>
	</div>
	
</div>



<%-- 새글쓰기 버튼 --%>
<div class="row fixed-bottom mb-5 pb-4">
	<div class="col">
	</div>
	<div class="col-3 text-center justify-content-center">
	 	<a class="btn btn-lg shadow rounded-circle bi bi-pencil-square" role="button" 
	 	   style="color:white; background-color:#fd7e14" href="./showDogUpload"></a>
	</div>
</div>

<%-- mobileStyle --%>
  <jsp:include page="../common/bottomTabStyle.jsp"></jsp:include>
<%-- ----------- --%>  
</body>
</html>