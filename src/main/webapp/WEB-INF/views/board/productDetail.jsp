<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>상품 정보</title>
<script>



 const productNo = new URLSearchParams(location.search).get("product_no"); // 쿼리스트링 다음 값 가져옴
 
 let mySessionId = null;

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


					// 리뷰 

function reloadReviewList() {
	const xhr = new XMLHttpRequest();
	 	let reviewCount = 0;	
		 let totalRating = 0;
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업.. 렌더링....

			document.getElementById("reviewListBox").innerHTML = ""; //초기화 얘만 innerHTML 허용... 
			document.getElementById("colProductRating").innerHTML = "";
			for (data of response.reviewList) {

				  const reviewRating = data.productReviewDto.product_review_rating;
				  totalRating += reviewRating;
				  reviewCount ++ ;
				  const row1 = document.createElement("div");
				  row1.classList.add("row");
				  row1.classList.add("mt-2");
				  row1.classList.add("reviewOuter");
				  row1.classList.add("border-top");
				  row1.setAttribute("reviewNo" , data.productReviewDto.product_review_no);

				  const rowName = document.createElement("div");
				  rowName.classList.add("row");
				  
				  row1.appendChild(rowName);
				  
				  const colName = document.createElement("div");
				  colName.classList.add("col");
				  colName.innerText = "이름 " + data.customerDto.customer_nickname;
				  rowName.appendChild(colName);

				  const rowRatingDate = document.createElement("div");
				  rowRatingDate.classList.add("row");

				  const colRating = document.createElement("div");
				  colRating.classList.add("col", "reviewStar");

				  // "별점: " 텍스트를 추가하는 <span> 요소


				  // 별점을 표시하기 위한 <span> 요소들
				  for (let i = 1; i <= 5; i++) {
				    const starSpan = document.createElement("span");
				    starSpan.classList.add("star-icon");
				    if (i <= reviewRating) {
				      starSpan.classList.add("filled"); // 별점 이상의 별에는 'filled' 클래스 추가
				    }
				    colRating.appendChild(starSpan);
				  }
				  const ratingTextSpan = document.createElement("span");
				  ratingTextSpan.innerText = new Date(data.productReviewDto.product_review_reg_date).toLocaleDateString();
				  colRating.appendChild(ratingTextSpan);

				  rowRatingDate.appendChild(colRating);

				  const colRegDate = document.createElement("div");
				  colRegDate.classList.add("col-1");
				  
				  rowRatingDate.appendChild(colRegDate);

				  row1.appendChild(rowRatingDate);

				  const rowReview = document.createElement("div");
				  rowReview.classList.add("row");
				  rowReview.classList.add("mt-2");

				  const colImage = document.createElement("div");
				  colImage.classList.add("col-6");

				  const reviewImgList = data.reviewImgList;
				  if (reviewImgList && reviewImgList.length > 0) {
				    const imageContainer = document.createElement("div");
				    imageContainer.classList.add("embed-responsive", "embed-responsive-1by1");
				    colImage.appendChild(imageContainer);

				    for (const reviewImg of reviewImgList) {
				      const img = document.createElement("img");
				      img.src = "/uploadFiles/WelcomePet/" + reviewImg.product_review_images_link; // 이미지 URL 또는 경로 설정
				      img.alt = "리뷰 이미지";
				      img.classList.add("review-image", "embed-responsive-item");
				      imageContainer.appendChild(img);
				    }
				  }

				  rowReview.appendChild(colImage);

				  const colContext = document.createElement("div");
				  colContext.classList.add("col", "reviewContext");
				  colContext.innerText = data.productReviewDto.product_review_context;
				  rowReview.appendChild(colContext);

				  row1.appendChild(rowReview);

				  const rowButtons = document.createElement("div");
				  rowButtons.classList.add("row");

				  const colButtons1 = document.createElement("div");
				  colButtons1.classList.add("col");
				  rowButtons.appendChild(colButtons1);
				  
			if(mySessionId == data.productReviewDto.customer_no) {
				

				  const colUpdate = document.createElement("div");
				  colUpdate.classList.add("col-2", "delism");
				  colUpdate.innerText = "수정";
				  colUpdate.setAttribute("onclick", "changeInputForUpdateReview(this)");
				  rowButtons.appendChild(colUpdate);
				  

				  const colDelete = document.createElement("div");
				  colDelete.classList.add("col-2", "delism");
				  colDelete.innerText = "삭제";
				  colDelete.setAttribute("onclick", "deleteReview("+data.productReviewDto.product_review_no+")");
				  rowButtons.appendChild(colDelete); 
			}
			

				  row1.appendChild(rowButtons);

				  document.getElementById("reviewListBox").appendChild(row1);
				} 
			
					console.log(totalRating);
					console.log(reviewCount);
					const productRating = (totalRating / reviewCount).toFixed(1);
					console.log(productRating);
					


					  // 별점을 표시하기 위한 <span> 요소들
					  for (let i = 1; i <= 5; i++) {
					    const starSpan = document.createElement("span");
					    starSpan.classList.add("star-icon");
					    if (i <= productRating) {
					      starSpan.classList.add("filled"); // 별점 이상의 별에는 'filled' 클래스 추가
					    }
					    colProductRating.appendChild(starSpan);
					  }
					  const productRatingSpan2 = document.createElement("span");
					  productRatingSpan2.classList.add("px-2");
					  productRatingSpan2.innerText = reviewCount+"개의 평가";
					  
					  colProductRating.appendChild(productRatingSpan2);
			
		}
	}
	
	//get
	xhr.open("get", "./getProductReview?product_no=" + productNo);
	xhr.send();	
}

function deleteReview(product_review_no) {
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			reloadReviewList();
		}
	}
	
	//get
	xhr.open("get", "./deleteReview?product_review_no=" + product_review_no);
	xhr.send();
	
}

function changeInputForUpdateReview(targetElement){
	
	const reviewOuter = targetElement.closest(".reviewOuter"); // 부모중에 css 접근자 문법에 맞는 엘리먼트를 가져온다.
	
	const reviewContext = reviewOuter.querySelector(".reivewContext");
	
	const reviewStar = reviewOuter.querySelector(".reivewStar"); 
	
	const tempStar = reviewStar.innerText;
	
	const tempValue = reviewContext	.innerText;
	
	reivewContext.innerHTML = "";
	
	const inputReviewText = document.createElement("input");
	inputReviewText.type = "text"
	//inputTextComment.classList.add("form-control");
		inputReviewText.classList.add("reviewInputBox");
		inputReviewText.value = tempValue;
		reviewBox.appendChild(inputReviewText);
	
	const inputButtonUpdate = document.createElement("button");
	inputButtonUpdate.innerText = "수정 적용";
	inputButtonUpdate.setAttribute("onclick" , "updateComment(this)");
	commentBox.appendChild(inputButtonUpdate);
	
	
	
	targetElement.innerText = "수정취소";
	targetElement.setAttribute("onclick", "cancelUpdate(this)");
}

function updateComment(targetElement){
	
	const commentOuter = targetElement.closest(".commentOuter");
	
	const commentId = commentOuter.getAttribute("commentId");
	const commentText = commentOuter.querySelector(".commentInputBox").value;
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			reloadCommentList();
		}
	}
	
	//post
	xhr.open("post", "./updateComment");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send("id=" + commentId + "&comment_text=" + commentText);
			
	
}

function refreshTotalWishCount(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			const totalLikeCountBox = document.getElementById("totalWishCount");
			totalLikeCountBox.innerText = response.count;
		}
	}
	
	
	//get
	xhr.open("get", "./getTotalWishCount?product_no=" + productNo);
	xhr.send();		
}

			// 찜
	function toggleWish() {
				
			if(mySessionId == null){
				if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){
					location.href = "../customer/login";
				}
				
				return;
			}
			
			const xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const response = JSON.parse(xhr.responseText);
					// js 작업..
					refreshTotalWishCount();
					refreshMyHeart();
				}
			}
			
			//get
			xhr.open("get", "./toggleWish?product_no=" + productNo);
			xhr.send();	
			}
			
	function refreshMyHeart(){
			
			if(mySessionId == null) return;
			
			
			const xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const response = JSON.parse(xhr.responseText);
					// js 렌더링... 작업..
					const heartBox = document.getElementById("heartBox");
					
					if(response.isWished){
						heartBox.classList.remove("bi-heart");
						heartBox.classList.add("bi-heart-fill");
					}else{
						heartBox.classList.remove("bi-heart-fill");
						heartBox.classList.add("bi-heart");
					}
				}
			}
			
			//get
			xhr.open("get", "./isWished?product_no=" + productNo);
			xhr.send();
			
		}			
	function getProductOption() {
		  const xhr = new XMLHttpRequest();

		  xhr.onreadystatechange = function() {
		    if (xhr.readyState == 4 && xhr.status == 200) {
		      const response = JSON.parse(xhr.responseText);
		      // js 작업..
					
		      const dropdown = document.createElement("div");
		      dropdown.classList.add("dropdown");
		      colOption.appendChild(dropdown);

		      const button = document.createElement("button");
		      button.classList.add("btn", "dropdown-toggle", "border","w-100", "text-start");
		      button.type = "button";
		      button.id = "optionDropdown";
		      button.dataset.bsToggle = "dropdown";
		      button.textContent = "선택해주세요";
		      dropdown.appendChild(button);

		      const menu = document.createElement("ul");
		      menu.classList.add("dropdown-menu");
		      menu.setAttribute("aria-labelledby", "optionDropdown");
		      dropdown.appendChild(menu);

		      for (option of response.map.optionList) {
		        const optionItem = document.createElement("li");
		        menu.appendChild(optionItem);

		        const optionDiv = document.createElement("div");
		        optionDiv.classList.add("row","mt-2","option-no");
		        optionDiv.setAttribute("optionNo", option.product_option_no);
		        optionItem.appendChild(optionDiv);
		        
		        const optionCol1 = document.createElement("div");
		        optionCol1.classList.add("col-1");
		        optionDiv.appendChild(optionCol1);

		        const optionNameCol = document.createElement("div");
		        optionNameCol.classList.add("col");
		        optionDiv.appendChild(optionNameCol);

		        const optionName = document.createElement("span");
		        optionName.classList.add("option-name");
		        optionName.textContent = option.product_option_name;
		        optionNameCol.appendChild(optionName);

		        const optionPriceCol = document.createElement("div");
		        optionPriceCol.classList.add("col", "text-end","fw-bold");
		        optionDiv.appendChild(optionPriceCol);

		        const optionPrice = document.createElement("span");
		        optionPrice.classList.add("option-price");
		        optionPrice.textContent = option.product_option_price ;
		        optionPriceCol.appendChild(optionPrice);
		        
		        const optionPrice2 = document.createElement("span");
		        optionPrice2.textContent = "원";

		        optionPriceCol.appendChild(optionPrice2);
		        
		        const optionCol2 = document.createElement("div");
		        optionCol2.classList.add("col-1");
		        optionDiv.appendChild(optionCol2);
		        
		       
		      }
		    
		      
		      menu.addEventListener("click", handleOptionSelect);
		    }
		   
		  }
		

		  //get
		  xhr.open("get", "./getProductOption?product_no=" + productNo);
		  xhr.send();
		}
	
	const selectedOptions = [];	
 // 선택 처리 함수
function handleOptionSelect(event) {

  const showTotalPrice = document.getElementById("showTotalPrice");
  const optionItem = event.target.closest("li");
  const optionName = optionItem.querySelector(".option-name").textContent;
  const optionPrice = optionItem.querySelector(".option-price").textContent;
  
  const optionNo = optionItem.querySelector(".option-no").getAttribute("optionNo");
  console.log(selectedOptions);

  const optionOuter = document.createElement("div");
  optionOuter.classList.add("row");
  optionContainer.appendChild(optionOuter);

  const optionCol1 = document.createElement("div");
  optionCol1.classList.add("col-1");
  optionOuter.appendChild(optionCol1);

  const optionDiv = document.createElement("div");
  optionDiv.classList.add("col", "mt-2", "border", "rounded-2");
  optionDiv.style.backgroundColor = "rgb(244, 247, 250)";
  optionOuter.appendChild(optionDiv);

  const optionRow = document.createElement("div");
  optionRow.classList.add("row");
  optionDiv.appendChild(optionRow);

  const optionCol = document.createElement("div");
  optionCol.classList.add("col-10");
  optionCol.innerText = optionName;
  optionRow.appendChild(optionCol);

  const deleteCol = document.createElement("div");
  deleteCol.classList.add("col-2");
  optionRow.appendChild(deleteCol);

  const quantityRow = document.createElement("div");
  quantityRow.classList.add("row", "mt-2");
  optionRow.appendChild(quantityRow);

  const quantityCol = document.createElement("div");
  quantityCol.classList.add("col-6");
  quantityRow.appendChild(quantityCol);
  
  const priceCol = document.createElement("div");
  priceCol.classList.add("col-6", "text-end", "fw-bold", "align-items-center");
  priceCol.innerText = optionPrice +"원";
  quantityRow.appendChild(priceCol);

  const buttonGroup = document.createElement("div");
  buttonGroup.classList.add("input-group");
  quantityCol.appendChild(buttonGroup);

  const decreaseButton = document.createElement("button");
  decreaseButton.classList.add("btn", "btn-outline-secondary");
  decreaseButton.textContent = "-";
  decreaseButton.addEventListener("click", function () {
    if (quantityInput.value > 1) {
      quantityInput.value = parseInt(quantityInput.value) - 1;
    }
    if (quantityInput.value === "1") {
      decreaseButton.disabled = true;
    }
    selectedOptionData.product_amount = quantityInput.value;
    updatePrice();
    updateTotalPrice(selectedOptions);
  });
  buttonGroup.appendChild(decreaseButton);

  const quantityInput = document.createElement("input");
  quantityInput.type = "number";
  quantityInput.classList.add("form-control");
  quantityInput.min = "1";
  quantityInput.value = "1";
  buttonGroup.appendChild(quantityInput);

  const increaseButton = document.createElement("button");
  increaseButton.classList.add("btn", "btn-outline-secondary");
  increaseButton.textContent = "+";
  increaseButton.addEventListener("click", function () {
    quantityInput.value = parseInt(quantityInput.value) + 1;
    decreaseButton.disabled = false;
    selectedOptionData.product_amount = quantityInput.value;
    updatePrice();
    updateTotalPrice(selectedOptions);
    
  });
  buttonGroup.appendChild(increaseButton);
  
  
  const selectedOptionData = {
	product_option_no : optionNo,
    optionName : optionName,
    optionPrice: optionPrice,
    product_amount: quantityInput.value
  };

  selectedOptions.push(selectedOptionData);
  updateTotalPrice(selectedOptions);
  
  const deleteButton = document.createElement("span");
  deleteButton.classList.add("bi", "bi-x", "text-end");
  deleteCol.appendChild(deleteButton);

  deleteButton.addEventListener("click", function () {
    optionContainer.removeChild(optionOuter);
    const index = selectedOptions.indexOf(selectedOptionData);
    if (index > -1) {
      selectedOptions.splice(index, 1);
      updatePrice();
      updateTotalPrice(selectedOptions);
    }
    
    console.log("Selected Options: ", selectedOptions);
  });

  quantityInput.addEventListener("input", function () {
    if (quantityInput.value <= 0) {
      quantityInput.value = 1; // 최소값인 1로 설정
    }
    selectedOptionData.product_amount = quantityInput.value;
    updatePrice();
  });
  
  function updatePrice() {
    const optionPriceValue = parseFloat(optionPrice);
    const quantity = parseInt(quantityInput.value);
    const totalPrice = optionPriceValue * quantity;
    priceCol.textContent = totalPrice + "원";
  }
  
  function updateTotalPrice(selectedOptions) {
	  let totalPrice = 0;

	  // 선택된 옵션들의 가격과 수량을 반복하여 총 가격 계산
	  for (const option of selectedOptions) {
	    const optionPrice = parseFloat(option.optionPrice);
	    const optionQuantity = parseInt(option.product_amount);
	    totalPrice += optionPrice * optionQuantity;
	  }
	  showTotalPrice.textContent = totalPrice + "원";
  }

}

function insertCart() {
	  
		if(!mySessionId) {
			console.log("로그인 해야함");
			return;
		}
		console.log(selectedOptions);
	    const xhr = new XMLHttpRequest();
	    xhr.open("POST", "./addCart");
	    xhr.setRequestHeader("Content-Type", "application/json");
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE) {
	            if (xhr.status === 200) {
	                // 성공적으로 처리된 경우
	                console.log("Cart added successfully");
	            } else {
	                // 처리 중 오류가 발생한 경우
	                console.error("Failed to add cart");
	            }
	        }
	    };
	    xhr.send(JSON.stringify(selectedOptions));
	}
	
function buyNow() {
	  if (!mySessionId) {
	    console.log("로그인 해야함");
	    return;
	  }

	  const form = document.createElement("form");
	  form.method = "POST";
	  form.action = "./buyPage"; // buyPage URL 설정

	  const selectedOptionsInput = document.createElement("input");
	  selectedOptionsInput.type = "hidden";
	  selectedOptionsInput.name = "selectedOptions";
	  selectedOptionsInput.value = JSON.stringify(selectedOptions);
	  form.appendChild(selectedOptionsInput);

	  document.body.appendChild(form);
	  form.submit();
	}
			

window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
    getSessionId();
    reloadReviewList();
    refreshTotalWishCount();
    refreshMyHeart();
    getProductOption();
});

</script>

<style type="text/css">
.product-thum {
	width: 100%;
}

.delism {
	color: rgb(66, 73, 79);
	font-size: small;
}

.dde {
	border-radius: 30px 30px 0px 0px;
}

.dropdown-menu {
	min-width: 100% !important;
}
.review-image {
 width: 60px;
 height: 60px;

}
.star-icon {
  display: inline-block;
  width: 16px;
  height: 16px;
  background-image: url('/uploadFiles/WelcomePet/icons/star-empty.png');
  background-size: cover;
}

.filled {
  background-image: url('/uploadFiles/WelcomePet/icons/star.png');
}

</style>
</head>
<body>


	<div class="container align-items-center justify-content-center">
		<div class="row shadow-sm p-3 mb-5 bg-body-tertiary rounded">
			<div class="col">
				<nav
					class="navbar navbar-dark bg-white d-flex fixed-top  border-bottom fw-bold 
			">
					<div class="col-2 d-flex ">
						<a class="btn bi bi-arrow-left fs-4" role="button"
							onclick="history.back()"> </a>
					</div>
					<div class="col-1"></div>
					<div class="col-6" style="text-align: center;">상세 정보</div>
					<div class="col-1 ">
						<a class="btn bi bi-search fs-3" role="button"
							href="/welcomepet/board/search"> </a>
					</div>
					<div class="col-2">
						<a class="btn bi bi-cart2 fs-4" role="button"
							href="/welcomepet/customer/cart"> </a>
					</div>

				</nav>
			</div>
		</div>
		<div class="row mt-2 embed-responsive embed-responsive-4by3">
			<div class="col"></div>
			<img
				src="/uploadFiles/WelcomePet/${data.productInfo.product_thumbnail}"
				class="embed-responsive-item product-thum" alt="...">
		</div>
		<div class="row mt-2">
			<div class="col fw-bold">${data.productInfo.product_name}</div>
		</div>
		<c:choose>
			<c:when test="${data.productInfo.product_discount_rate != 0}">
				<div class="row">
					<div class="col">
						<del>${data.productInfo.product_price}원</del>
					</div>
				</div>
				<div class="row fs-4">
					<div class="col-2 text-danger text-end fw-bold">
						${data.productInfo.product_discount_rate}%</div>
					<div class="col fw-bold">${data.productInfo.product_price - data.salePrice}원</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col fw-bold">${data.productInfo.product_price}원</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="row mt-2"></div>
		<div class="row mt-3 delism border-top">
			<div class="row mt-2">
				<div class="col-3">배송 안내</div>
				<div class="col">
					<div class="row">
						<div class="col">배송비 :
							${data.productInfo.product_shipping_price}원</div>
					</div>
					<div class="row">
						<div class="col">오후 2시 이전 당일 출고(영업일 기준)</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3 border-top">
			<div class="col-1"></div>
			<div class="col">
				<div class="row mt-2 border">
					<div class="col-3">
						<img
							src="/uploadFiles/WelcomePet/${data.productInfo.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="...">
					</div>
					<div class="col">판매자 이름</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-3">
			<div class="row">
				<div class="col fw-bold">상품정보</div>
			</div>
			<div class="row mt-2"></div>
			<c:forEach items="${data.productImgList }" var="map">
				<div class="row mt-2 embed-responsive embed-responsive-4by3">
					<img src="/uploadFiles/WelcomePet/${map.product_detail_image_link}"
						class="embed-responsive-item product-thum" alt="...">
				</div>
			</c:forEach>
		</div>

		<div class="row mt-3 border-top ">
			<div class="row mt-2">
				<div class="col fw-bold">상품평</div>
			</div>
			<div class="row">
			<div class="col" id="colProductRating"> </div> </div>
			<div class="row mt-2" id="reviewListBox">
			
			</div>
		</div>


		<div class="row mt-2">
			<jsp:include page="../common/serviceNavi.jsp"></jsp:include>
			<div class="row mb-4">
				<div class="col">
					<div class="navbar navbar-dark bg-white fixed-bottom border-top">
						<div class="col-2 text-center">
							<div class="row">
								<div class="col">

								<a class="text-danger bi bi-heart"  id="heartBox"
								onclick="toggleWish()" role="button"> </a>
								


								</div>
							</div>
							<div class="row">
								<div class="col">
								<span id="totalWishCount">3</span> </div>
							</div>
						</div>
						<div class="col ">
							<div class="row">
								<div class="col">
									<div class="d-grid gap-2">
										<button class="btn btn-primary" type="button"
											data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom"
											aria-controls="offcanvasBottom">구매하기</button>

										<div class="offcanvas offcanvas-bottom dde"
											style="height: auto;" tabindex="-1" id="offcanvasBottom"
											aria-labelledby="offcanvasBottomLabel">
										
											<div class="row mt-3">
												<div class="col text-center fw-bold">상품 선택</div>
											</div>
											<div class="row mt-4">
												<div class="row" id="optionRow">
													<div class="col-1"></div>
													<div class="col" id ="colOption">

													</div>
													<div class="col-1"></div>
												</div>
												<div class="row mt-3" id="optionContainer" >
												
												</div>

													<div class="col-1"></div>
												</div>

												<div class="row mt-3">

													<div class="col-1"></div>
													<div class="col-6">총 상품 금액</div>
													<div class="col-4 text-end">
														<div class="row">
															<div class="col fw-bold fs-4" id="showTotalPrice">0원</div>               
														</div>
													</div>
													<div class="col-1"></div>
												</div>
												<div class="row mt-4">
													<div class="col-1"></div>
													<div class="col-5 d-grid gap-2">
														<button class="btn btn-outline-primary btn-lg"
															type="button" onclick="insertCart()">장바구니</button>
													</div>
													<div class="col-5 d-grid gap-2">
														<button class="btn btn-primary btn-lg" type="button" 
														onclick="buyNow()"
														>바로구매</button>
													</div>
													<div class="col-1"></div>
												</div>
												<div class="row mt-3"></div> 
											</div>
										
										</div>
									</div>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
						
					</div>
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