<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>기본 세팅</title>
<style>
    .fixed-size-image {
        width: auto;
        height: 300px;
        object-fit: cover;
    }
    .comment{
    	background-color: orange;
    }
</style>
<script type="text/javascript">
	const snap_board_no = new URLSearchParams(location.search).get("snap_board_no");
	
	let mySessionId = null;
	
	function getSessionId() {
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				// js 작업 공간 TO-DO
				if (response.result == "success") {
					mySessionId = response.customer_no;
				}
			}
		}
		// get
		xhr.open("get", "./getMyId", false);
		xhr.send();
	}
	
	function reloadCommentList() {
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				document.getElementById("commentListBox").innerHTML = "";
				for(data of response.commentList){
					const row1 = document.createElement("div");
					row1.classList.add("row");
					row1.classList.add("mt-1");
					row1.classList.add("border-top");
					
					const col1 = document.createElement("div");
					col1.classList.add("col");
					col1.classList.add("text-primary");
					col1.classList.add("fw-bold");
					col1.classList.add("fs-5");
					
					const span1 = document.createElement("span");
					span1.style.fontSize = "12px";
					span1.innerText = data.customerDto.customer_nickname;
					
					col1.appendChild(span1);
			        row1.appendChild(col1);
			        commentListBox.appendChild(row1);
			        
			        const col2 = document.createElement("div");
			        col2.classList.add("col");
			        col2.classList.add("text-end");
			        
			        const span2 = document.createElement("span");
			        span2.style.fontSize = "12px";
			        span2.style.color = "gray";
			        const formatDate = new Date(data.snapBoardCommentDto.snap_board_comment_reg_date);
			        span2.innerText = formatDate.toLocaleString();
			        
			        col2.appendChild(span2);
			        row1.appendChild(col2);
			        commentListBox.appendChild(row1);
			        
			        const row2 = document.createElement("div");
			        row2.classList.add("row");
			        row2.classList.add("mt-2");
			        
			        const col3 = document.createElement("div");
			        col3.classList.add("col");
			        
			        const span3 = document.createElement("span");
			        span3.style.fontSize = "15px";
			        span3.classList.add("text-break");
			        span3.innerText = data.snapBoardCommentDto.snap_board_comment_content;
			        
			        col3.appendChild(span3);
			        row2.appendChild(col3);
			        commentListBox.appendChild(row2);
				}
			}
		}
		xhr.open("get", "./getSnapCommentList?snap_board_no=" + snap_board_no);
		xhr.send();
	}
	
	function registerComment() {
		if (!mySessionId) {
			return;
		}
		const commentContentBox = document.getElementById("commentContentBox");
		const commentTextValue = commentContentBox.value;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				commentContentBox.value = "";
				reloadCommentList();
			}
		}
		xhr.open("post", "./registComment");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("snap_board_no=" + snap_board_no + "&snap_board_comment_content=" + commentTextValue);
	}
	
	
	window.addEventListener("DOMContentLoaded", function() {
		getSessionId();
		reloadCommentList();
	});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/topMainNavi.jsp"></jsp:include>
		<div class="row mt-1 border-top"></div>

		<div class="row mt-3">
			<div class="col">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
				    <div class="carousel-inner">
				    	<div class="carousel-item active">
					    	<img src="/uploadFiles/thumbnail/${snapBoardDto.snap_thumbnail}" class="d-block w-100 fixed-size-image rounded" >
					    </div>
				    	<c:forEach items="${list}" var="i">
					        <div class="carousel-item">
					            <img src="/uploadFiles/snapImgs/${i.snapImagesDto.snap_image_link}" class="d-block w-100 fixed-size-image rounded">
					        </div>
				        </c:forEach>
				    </div>
				    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
				        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="visually-hidden">Previous</span>
				    </button>
				    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
				        <span class="carousel-control-next-icon" aria-hidden="true"></span>
				        <span class="visually-hidden">Next</span>
				    </button>
				</div>
			</div>
		</div>
		
		<div class="row mt-2 mb-2 align-items-center">
			<div class="col-auto mx-1">
				<c:choose>
		    		<c:when test="${checkLike == 0}">
				    	<i style="font-size: 20px; color: #ff2465;" class="bi bi-heart" onclick="location.href='./readSnapLike?snap_board_no=${snapBoardDto.snap_board_no}'"></i> ${countLike}
		    		</c:when>
		    		<c:otherwise>
				    	<i style="font-size: 20px; color: #ff2465;" class="bi bi-heart-fill" onclick="location.href='./readSnapUnLike?snap_board_no=${snapBoardDto.snap_board_no}'"></i> ${countLike}					    		
		    		</c:otherwise>
		    	</c:choose>
		    	<i class="bi bi-eye"></i> ${snapBoardDto.snap_board_view_count}
			</div>
		</div>
		<div class="row">
			<div class="col-auto">
				<i class="bi bi-geo-alt-fill"></i> ${snapBoardDto.snap_location}
			</div>
		</div>
		<div class="row mt-3 mb-5">
			<div class="col">
				${snapBoardDto.snap_board_content}
			</div>
		</div>
		
		<!-- 댓글 작성 -->
		<div class="row">
			<div class="col-9" id="commentTextBox">
				<input id="commentContentBox" type="text" class="form-control">
			</div>
			<div class="col d-grid">
				<button onclick="registerComment()" class="btn comment bi bi-box-arrow-in-up-left"></button>
			</div>
		</div>
		<!-- 댓글 리스트 ajax -->
		<div class="row mb-5"> 
			<div class="col" id="commentListBox"></div>
		</div>
		
		
		<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>