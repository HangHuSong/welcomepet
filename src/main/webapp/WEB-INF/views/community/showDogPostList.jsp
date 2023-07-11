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
</style>
</head>
<body>
<%-- mobileStyle --%>
  <jsp:include page="../common/topNaviDefault.jsp"></jsp:include>
<%-- ----------- --%>  

<div class="container">
	
	<%-- 배너이미지 --%>
	<div class="row mb-1">
		<div class="col p-0">
			<img class="img-fluid" src="/welcomepet/resources/board/img/banner.jpg">
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
						   <div class="col-1 text-danger">
						    <i class="bi bi-fire"></i>
						   </div>
						   <div class="col-auto">
							  <span>
							   <a class="me-1 text-decoration-none text-black fw-bold fs-6">${bestList.showDogPostDto.show_dog_post_title}</a>
							  </span>
						   </div>
						   
						   <div class="col">
						 	<img alt="null" src="">
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
						   	  <c:if test="${map.checkImg > 0}">
							   	  <span style="color:#A9CC9D">
							   	  <i class="bi bi-image "></i>
							   	  </span>
						   	  </c:if>
						   	  
							  <span>
							   <a class="me-1 text-decoration-none text-black" style="font-size: 17px">${map.showDogPostDto.show_dog_post_title}</a>
							  </span>						  
						   </div>
						  </div>						  
						  
						  <%-- 닉네임/날짜/조회수 --%>
						  <div class="row text-secondary" style="font-size: 0.9em;">
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
						 <img class="thum w-100 embed-responsive-item rounded" alt="X" src="/uploadFiles/petImages/${map.postImageDtoList[0].show_dog_post_images_link}" />
						</div>
						
						<%-- 댓글 --%>
						<div class="col-2 d-flex justify-content-center align-items-center">
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
						</div>
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
	<div class="col-3 text-center">
	 	<a class="bi bi-pencil-square btn btn-primary shadow bg-body-tertiary rounded" role="button" href="./showDogUpload"></a>
	</div>
</div>

<%-- 
<div class="container">
 <div class="p-3">
	<div class="col justify-content-center">
	
	<div class="row">
		<a href="./showDogUpload">새 글쓰기</a>
	</div>
	
	<c:forEach items="${list}" var="map">
	<div class="row border-bottom">
		<div class="col">
		 <div class="row" style="font-size: 12pt;">
		 	<div class="col">
		  <a class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover" 
			 href="./showDogPost?show_dog_post_no=${map.showDogPostDto.show_dog_post_no}">${map.showDogPostDto.show_dog_post_title}</a>
		 	</div>
		 	
		 </div>
		 
		 <div class="row" style="font-size: 12pt;">
		  ${map.customerDto.customer_nickname}
	   	   <fmt:formatDate value="${map.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
		   조회 ${map.showDogPostDto.show_dog_post_view_count}
		 </div>
		</div>
	</div>
	</c:forEach>
	


	
	</div>
 </div>
</div>

--%>

<%-- mobileStyle --%>
  <jsp:include page="../common/bottomTabStyle.jsp"></jsp:include>
<%-- ----------- --%>  
</body>
</html>