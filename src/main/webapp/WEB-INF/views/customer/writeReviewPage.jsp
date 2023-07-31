<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
	
	<style type="text/css">
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}
	</style>
<title>리뷰 작성하기</title>

<script>

let mySessionId = null;
let selectedRating = 0;

function getSessionId(){
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			 console.log(response);
			 console.log(xhr.responseText);
			if(response.result == "success") {
				
				mySessionId = response.customerNo; 

			}
		}
	}
	
	//get
	xhr.open("get", "../customer/getMyId", false); // 딱 여기만 쓰세요...false 동기식 호출..! 권장되지 않음
	xhr.send();		
}

function executeRating(stars) {
	  const starClassActive = "rating__star fas fa-star";
	  const starClassInactive = "rating__star far fa-star";
	  const starsLength = stars.length;

	  stars.forEach((star, index) => {
	    star.onclick = () => {
	      for (let i = 0; i < starsLength; i++) {
	        if (i <= index) {
	          stars[i].className = starClassActive;
	        } else {
	          stars[i].className = starClassInactive;
	        }
	      }

	      // 선택된 별점 값을 input 요소에 설정
	      const selectedRating = index + 1;
	      document.getElementById("selectedRating").value = selectedRating;
	    };
	  });
	}


function registerReview(){
	
	if(!mySessionId) {
		// 로그인 안되었있으니까...
		return;
	}
	
	const reviewTextBox = document.getElementById("reviewTextBox");
	const reviewTextValue = reviewTextBox.value; 
	const fileInput = document.getElementById("reviewImagies");
	const files = fileInput.files;
	const productOptionNo = '${data.productOptionDto.product_option_no}'; 
	const orderProductNo = '${data.orderProductDto.order_product_no}';

	const selectedRating =  document.getElementById("selectedRating").value;
	const formData = new FormData();
	for (let i = 0; i < files.length; i++) {
	  formData.append("reviewImagies", files[i]);
	}
	
	  formData.append("order_product_no", orderProductNo);
	  formData.append("product_review_context", reviewTextValue);
	  formData.append("product_option_no", productOptionNo);
	  formData.append("product_review_rating", selectedRating);
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			console.log(response);
		}
	}
	
	//post
	xhr.open("post", "../board/registerReview");
	xhr.send(formData);
	
}




window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
	 const ratingStars = [...document.getElementsByClassName("rating__star")];
	  executeRating(ratingStars);
	  getSessionId()
});
</script>

<style >
.product-thum {
	height: 6em;
}
.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}
.smallf {
	font-size: 0.9em;
	color: gray;
}


.rating {
   width: 180px;
}

.rating__star {
   cursor: pointer;
   color: #dabd18b2;
}
</style>
</head>
<body>

	<div class="container align-items-center justify-content-center">
	
		<div class="row  mt-2 align-items-center">
		

		
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col fw-bold" style="text-align: center;">리뷰 작성하기</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2 border-bottom "></div>

			<div
				class="row mt-3 embed-responsive embed-responsive-4by3">
				<div class="row mt-3">
					<div class="col fw-bold">
					 <fmt:formatDate value="${data.ordersDto.orders_date}" pattern="yyyy.MM.dd" /> 주문</div>
			</div>
			
			<div class="row">
					<div class="col-4">
						<img
							src="/uploadFiles/WelcomePet/${data.productDto.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="...">
					</div>
					<div class="col">
						<div class="row">
							<div class="col"> ${data.productDto.product_name} </div>						
						</div>
						<div class="row">
							<div class="col smallf"> ${data.productOptionDto.product_option_name} </div>						
						</div>
						<div class="row mt-2">
						<div class="col-1"></div>
						<div class="col">
								<div class="rating">
									    <i class="rating__star far fa-star"></i>
									    <i class="rating__star far fa-star"></i>
									    <i class="rating__star far fa-star"></i>
									    <i class="rating__star far fa-star"></i>
									    <i class="rating__star far fa-star"></i>
								</div>
								<input type="hidden" id="selectedRating" value="0" name="product_review_rating">
								</div>					
						</div>													
					</div>
			</div>
			<div class="row mt-2 border-top"></div>
			
			<div class="row mt-2 ">
			  <div class="col fw-bold">내용</div>
			</div>
			<div class="row ">
			 <textarea  class="form-control" name="product_review_context" id="reviewTextBox"></textarea>
			</div>
			<div class="row mt-2">
			 <div class="col">
			 	첨부파일 <input type="file" class="form-control" multiple accept="image/*" id="reviewImagies"> 
			 </div>
			</div>
			<div class="row mt-2">
			 <div class="col">
			 	<button class="btn btn-primary" type="button" onclick="registerReview()"> 작성하기</button>
			 </div>
			</div>							
		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>

