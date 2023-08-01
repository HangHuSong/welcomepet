<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<title>상품 정보</title>
<script>



 const productNo = new URLSearchParams(location.search).get("product_no"); // 쿼리스트링 다음 값 가져옴
 const categoryNo = ${data.categoryNo};
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
				  row1.classList.add("mt-2","pe-0");
				  row1.classList.add("reviewOuter","border-top");
				  row1.setAttribute("reviewNo" , data.productReviewDto.product_review_no);


				  const rowRatingDate = document.createElement("div");
				  rowRatingDate.classList.add("row", "mt-2","align-items-center","mx-0","px-0");

				  const colRating = document.createElement("div");
				  colRating.classList.add("col", "reviewStar","pe-0","text-center","ps-0");

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

				  rowRatingDate.appendChild(colRating);
				  
				  const colName = document.createElement("div");
				  colName.classList.add("col","pe-0","review_name");
				  colName.innerText =data.customerDto.customer_nickname;
				  rowRatingDate.appendChild(colName);

				  const colRegDate = document.createElement("div");
				  colRegDate.classList.add("col", "text-secondary","text-end","review_date");
				  
				  rowRatingDate.appendChild(colRegDate);
				  
				  const regDateTextSpan = document.createElement("span");
				  regDateTextSpan.innerText = new Date(data.productReviewDto.product_review_reg_date).toLocaleDateString();
				  colRegDate.appendChild(regDateTextSpan);

				  row1.appendChild(rowRatingDate);
				  
				  const reviewOptionRow = document.createElement("div");
				  reviewOptionRow.classList.add("row","mt-2");
				  
				  row1.appendChild(reviewOptionRow);
				  
				  const reviewOptionCol = document.createElement("div");
				  reviewOptionCol.classList.add("col", "text-secondary","review_date","ps-0");
				  reviewOptionCol.innerText = "상품 : " + data.productOptionDto.product_option_name;
				  reviewOptionRow.appendChild(reviewOptionCol);
				  

				  const reviewImgList = data.reviewImgList;
				  if (reviewImgList && reviewImgList.length > 0) {
					  
						 
					 const imageContainer = document.createElement("div");
				 imageContainer.classList.add("row","mt-2","embed-responsive", "embed-responsive-1by1");
				 row1.appendChild(imageContainer);
					  

				    for (const reviewImg of reviewImgList) {
				    	
					const colImage = document.createElement("div");
					 colImage.classList.add("col-4");
					    
				      const img = document.createElement("img");
				      img.src = "/uploadFiles/WelcomePet/" + reviewImg.product_review_images_link; // 이미지 URL 또는 경로 설정
				      img.alt = "리뷰 이미지";
				      img.classList.add("review-image", "embed-responsive-item");
				      colImage.appendChild(img);
				      imageContainer.appendChild(colImage);
				    }
				    

				  }

				 
				  
				  const rowContext = document.createElement("div");
				  rowContext.classList.add("row","mt-3")
				  
				   
				  const colContext = document.createElement("div");
				  colContext.classList.add("col","ps-0", "reviewContext","mb-2");
				  colContext.innerText = data.productReviewDto.product_review_context;
				  rowContext.appendChild(colContext);

				 
				  row1.appendChild(rowContext);
				  
				  const rowButtons = document.createElement("div");
				  rowButtons.classList.add("row","pe-0");

				  const colButtons1 = document.createElement("div");
				  colButtons1.classList.add("col");
				  rowButtons.appendChild(colButtons1);
				  
			if(mySessionId == data.productReviewDto.customer_no) {
				

				  const colUpdate = document.createElement("div");
				  colUpdate.classList.add("col-2", "delism","text-secondary");
				  colUpdate.innerText = "수정";
				  colUpdate.setAttribute("onclick", "changeInputForUpdateReview(this)");
				  rowButtons.appendChild(colUpdate);
				  

				  const colDelete = document.createElement("div");
				  colDelete.classList.add("col-2", "delism","text-secondary");
				  colDelete.innerText = "삭제";
				  colDelete.setAttribute("onclick", "deleteReview("+data.productReviewDto.product_review_no+")");
				  rowButtons.appendChild(colDelete); 
			}
			

				  row1.appendChild(rowButtons);

				  document.getElementById("reviewListBox").appendChild(row1);
				} 
			
					console.log(totalRating);
					console.log(reviewCount);
					var productRating = (totalRating / reviewCount).toFixed(1);
					if (isNaN(productRating)) {
						  productRating = 0;
						}
					console.log(productRating);
					document.getElementById("productRatingSpan3").innerText= "("+reviewCount+")";
					document.getElementById("totalRatingSpan").innerText= productRating;
					 


					  // 별점을 표시하기 위한 <span> 요소들
					  for (let i = 1; i <= 5; i++) {
					    const starSpan = document.createElement("span");
					    starSpan.classList.add("star-icon");
					    if (i <= productRating) {
					      starSpan.classList.add("filled"); // 별점 이상의 별에는 'filled' 클래스 추가
					    }
					    colProductRating.appendChild(starSpan);
					  }
					  const averRatingSpan = document.createElement("span");
					  averRatingSpan.classList.add("px-2");
					  averRatingSpan.innerText = productRating;
					  
					  const productRatingSpan2 = document.createElement("span");
					  productRatingSpan2.classList.add("px-2", "review_name");
					  productRatingSpan2.innerText = reviewCount+"개의 평가";
					
					  colProductRating.appendChild(averRatingSpan);
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
		        optionNameCol.classList.add("col-7","px-0");
		        optionDiv.appendChild(optionNameCol);

		        const optionName = document.createElement("span");
		        optionName.classList.add("option-name");
		        optionName.textContent = option.product_option_name;
		        optionNameCol.appendChild(optionName);

		        const optionPriceCol = document.createElement("div");
		        optionPriceCol.classList.add("col", "text-end","fw-bold","px-0");
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
  optionCol1.classList.add("col-1","ms-3");
  optionOuter.appendChild(optionCol1);

  const optionDiv = document.createElement("div");
  optionDiv.classList.add("col", "mt-2", "border", "rounded-2");
  optionDiv.style.backgroundColor = "rgb(244, 247, 250)";
  optionDiv.style.fontSize = "0.9em";
  optionOuter.appendChild(optionDiv);

  const optionRow = document.createElement("div");
  optionRow.classList.add("row", "mt-2");
  optionDiv.appendChild(optionRow);

  const optionCol = document.createElement("div");
  optionCol.classList.add("col-10","ms-2");
  optionCol.innerText = optionName;
  optionRow.appendChild(optionCol);

  const deleteCol = document.createElement("div");
  deleteCol.classList.add("col");
  optionRow.appendChild(deleteCol);

  const quantityRow = document.createElement("div");
  quantityRow.classList.add("row", "mt-2","mb-2","align-items-center");
  optionRow.appendChild(quantityRow);

  const quantityCol = document.createElement("div");
  quantityCol.classList.add("col-6");
  quantityRow.appendChild(quantityCol);
  
  const priceCol = document.createElement("div");
  priceCol.classList.add("col-6", "text-end", "fw-bold");
  priceCol.style.fontSize = "1.2em";
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
  quantityInput.classList.add("text-center","border-secondary", "align-items-center","border-top","border-bottom");
  quantityInput.min = "1";
  quantityInput.value = "1";
  quantityInput.style.width = "3em";
  quantityInput.style.border = "none";
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
	               
	                showModalAndCloseOffcanvas(); 
	            } else {
	                // 처리 중 오류가 발생한 경우
	                console.error("Failed to add cart");
	            }
	        }
	    };
	    xhr.send(JSON.stringify(selectedOptions));
	}
	
function showModalAndCloseOffcanvas() {
    // 오프캔버스 닫기
    
    setTimeout(function() {
        showModal();
    }, 300);
    
    setTimeout(function() {
        closeModal();
    }, 2500);
    



}
	
	
function showModal() {
    // 모달창 열기
    const modal = document.getElementById("myModal");
    modal.style.display = "block";


    const closeBtn = document.getElementById("closeModalBtn");
    closeBtn.addEventListener("click", function () {
        closeModal();
    });


    const moveToCartBtn = document.getElementById("moveToCartBtn");
    moveToCartBtn.addEventListener("click", function () {
        moveToCart();
    });
}

function closeModal() {

    const modal = document.getElementById("myModal");
    modal.style.display = "none";
}

function moveToCart() {

    window.location.href = "../customer/cart";
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
	
function getRelatedList() {
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			 console.log(response);

		     // 이전 "이 상품과 비슷한 상품" 리스트들 삭제
		      const relatedListContainer = document.getElementById("relatedList");
		      relatedListContainer.innerHTML = "";

		      // relatedListContainer에 "relatedProductsSwiper" 생성
		      const swiperContainer = document.createElement("div");
		      swiperContainer.classList.add("swiper-container");
		      swiperContainer.id = "relatedProductsSwiper";

		      const swiperWrapper = document.createElement("div");
		      swiperWrapper.classList.add("swiper-wrapper");
		      swiperContainer.appendChild(swiperWrapper);
		      
	
//		      const prevButton = document.createElement("div");
//		      prevButton.classList.add("swiper-button-prev");
//		      swiperContainer.appendChild(prevButton);

//		      const nextButton = document.createElement("div");
//		      nextButton.classList.add("swiper-button-next");
//		      swiperContainer.appendChild(nextButton); 

		      relatedListContainer.appendChild(swiperContainer);

		for(data of response.relatedProductList) {
			
			const col1 = document.createElement("div");
			col1.classList.add("col-4", "embed-responsive", "embed-responsive-4by3", "ps-3","swiper-slide");
			
			
			
			const rowImg = document.createElement("div");
			rowImg.classList.add("row");
			col1.appendChild(rowImg);
			
			const colImg =	document.createElement("div");
			colImg.classList.add("col");
			colImg.style.position = "relative";
			rowImg.appendChild(colImg);
			

			
			const heartBox = document.createElement("a");
			heartBox.classList.add("text-secondary", "bi", "bi-heart");
			heartBox.id = "heartBox" + data.productInfo.product_no ;
			heartBox.setAttribute("onclick", "toggleWish("+ data.productInfo.product_no +")");
			heartBox.style.position = "absolute"; // 절대 위치 설정
			heartBox.style.bottom = "0"; // 하단 위치
			heartBox.style.right = "1em"; // 오른쪽 위치

			heartBox.setAttribute("role", "button");
			colImg.appendChild(heartBox);
			
			const img = document.createElement("img");
			img.src = "/uploadFiles/WelcomePet/" + data.productInfo.product_thumbnail; // 이미지 URL 또는 경로 설정
			img.alt = "제품 이미지";
			img.classList.add("embed-responsive-item", "product-thum");
			colImg.appendChild(img);
			
			const rowName = document.createElement("div");
			rowName.classList.add("row", "r_name")
			rowName.setAttribute("onclick","location.href='./productDetail?product_no="+data.productInfo.product_no+"'");
			col1.appendChild(rowName);
			
			
			const colName = document.createElement("div");
			colName.classList.add("col");
			rowName.appendChild(colName);
			
			const nameBox = document.createElement("p");
			nameBox.classList.add( "fsmid");
			nameBox.innerText = data.productInfo.product_name;
			colName.appendChild(nameBox);
			
			const Realprice = data.productInfo.product_price;
			const formattedRealprice = Realprice.toLocaleString();
			
			const rowRealPrice = document.createElement("div");
			rowRealPrice.classList.add("row");
			col1.appendChild(rowRealPrice);
			
			const colRealPrice = document.createElement("div");
			colRealPrice.classList.add("col", "text-secondary","real_price");
			colRealPrice.innerText = formattedRealprice + "원";
			
			rowRealPrice.appendChild(colRealPrice);	
			
			const price = data.productInfo.product_price - data.salePrice;
			const formattedPrice = price.toLocaleString();
			
			const rowPrice = document.createElement("div");
			rowPrice.classList.add("row");
			col1.appendChild(rowPrice);
					
			const colPrice = document.createElement("div");
			colPrice.classList.add("col", "fw-bold","price_text");

			rowPrice.appendChild(colPrice);	
			
			if(data.productInfo.product_discount_rate > 0) {
			
			const SaleRate = document.createElement("span");
			SaleRate.classList.add("text-danger");
			SaleRate.innerText = data.productInfo.product_discount_rate +"%";
			colPrice.appendChild(SaleRate); }	
			
			const Price = document.createElement("span");
			Price.innerText = formattedPrice +"원";
			colPrice.appendChild(Price);
			
			let aveRatingValue = data.aveRating;
			if (isNaN(aveRatingValue)) {
			  aveRatingValue = 0;
			}
			
			const rowRating = document.createElement("div");
			rowRating.classList.add("row");
			col1.appendChild(rowRating);
			
			const colRating = document.createElement("div");
			colRating.classList.add("col","text-secondary");
			colRating.style.fontSize = "0.8em";
			rowRating.appendChild(colRating);	
			
			const star = document.createElement("span");
			star.classList.add("star-icon", "filled");
			colRating.appendChild(star);
			
			const aveRating = document.createElement("span");
			aveRating.classList.add("ps-1");
			aveRating.innerText = aveRatingValue;
			colRating.appendChild(aveRating);
			
			const countRating = document.createElement("span");
			countRating.innerText = "("+data.ratingCount+")";
			colRating.appendChild(countRating);
			
			
			swiperWrapper.appendChild(col1);
			
			  refreshMyHeart(data.productInfo.product_no);
			}
		

		
	    const swiper = new Swiper("#relatedProductsSwiper", {
	        slidesPerView: "auto",
	        spaceBetween: 10,
	        loop: true,
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	        pagination: {
	          el: ".swiper-pagination",
	          clickable: true,
	        },
	      });

		}
	}
	
	


	xhr.open("get", "./relatedProduct?main_category_no="+categoryNo);
	xhr.send();	
}

function toggleWish(productNo) {
	
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
			refreshMyHeart(productNo);
		}
	}
	
	//get
	xhr.open("get", "./toggleWish?product_no=" + productNo);
	xhr.send();	
	
	}

function refreshHeart(productNo){
	
	if(mySessionId == null) return;
	
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 렌더링... 작업..
			const heartBox = document.getElementById("heartBox" + productNo);
			
			if(response.isWished){
				heartBox.classList.remove("bi-heart","text-secondary");
				heartBox.classList.add("bi-heart-fill","text-danger");
			}else{
				heartBox.classList.remove("bi-heart-fill","text-danger");
				heartBox.classList.add("bi-heart","text-secondary");
			}
		}
	}
	
	//get
	xhr.open("get", "./isWished?product_no=" + productNo);
	xhr.send();
	
}

window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
    getSessionId();
    getRelatedList();
    reloadReviewList();
    refreshTotalWishCount();
    refreshMyHeart();
    getProductOption();
});

</script>

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

/* Swiper 슬라이드 컨테이너 스타일 */
.swiper-container {
	width: 100%;
	height: 100%;
	overflow: hidden;
	position: relative;
}

.swiper-button-prev, .swiper-button-next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 1em;
	height: 1em;
	color: grey;
	cursor: pointer;
	z-index: 10;
}
.fLlDaL {
    background-color: rgb(244, 247, 250);
    padding: 3rem 1.6rem 12rem;
}

.swiper-button-prev::after, .swiper-button-next::after {
	font-size: 24px; /* 아이콘 크기를 조절합니다. */
}

.swiper-button-next {
	right: 10px;
}

/* 이전 버튼의 위치를 좌측으로 설정합니다. */
.swiper-button-prev {
	left: 10px;
}

/* Swiper 슬라이드 아이템 스타일 */
.swiper-slide {
	width: 40%;
}

/* 페이지네이션 스타일 */
.swiper-pagination-bullet {
	width: 10px;
	height: 10px;
	background-color: #fff;
	opacity: 0.5;
	border-radius: 50%;
	margin: 0 5px;
}

.swiper-pagination-bullet-active {
	opacity: 1;
}

.bi-heart {
	filter: opacity(0.5);
}

.card-body {
	background-color: rgb(244, 247, 250);
}

.fsmid {
	margin-top: 0.5em;
	margin-bottom: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 2.4em;
	/* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
}

.price_text {
	font-size: 0.9em;
}

.real_price {
	font-size: 0.8em;
	text-decoration: line-through;
}

.product-thum {
	width: 100%;
}

.delism {
	color: rgb(66, 73, 79);
	font-size: 0.9em;
}

.dde {
	border-radius: 30px 30px 0px 0px;
}

.dropdown-menu {
	min-width: 100% !important;
}

.review-image {
	width: 100%;
	height: 4.5em;;
}

.star-icon {
	display: inline-block;
	width: 1.2em;
	height: 1.2em;
	background-image: url('/uploadFiles/WelcomePet/icons/star-empty.png');
	background-size: cover;
	filter: opacity(0.5);
	vertical-align: sub;
}

.filled {
	display: inline-block;
	width: 1.2em;
	height: 1.2em;
	background-size: cover;
	background-image: url('/uploadFiles/WelcomePet/icons/star.png');
	filter: none;
	vertical-align: sub;
}

.empty {
	height: 0.8em;
	background-color: rgb(244, 247, 250);
}

.review_date {
	font-size: 0.8em;
}

.review_name {
	font-size: 0.9em;
}

.reviewContext {
	font-size: 0.9em;
}

#myModal {
	display: none;
	position: fixed;
	top: 85%;
	bottom: 0;
	left: 3%;
	right: 0;
}

.modal-content {
	background-color: rgb(48, 52, 54);
	border-radius: 0.3rem;
	width: 95%;
	height: 2.7em;
	justify-content: center;
}
</style>
</head>
<body>


	<div
		class="container  mx-0 align-items-center justify-content-center">
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
		<div class="row mt-2 ps-2">
			<div class="col fw-bold">${data.productInfo.product_name}</div>
		</div>
		<div class="row mt-2 ps-2">
			<div class="col">
				<span class="filled"></span> <span id="totalRatingSpan"></span> <span
					id="productRatingSpan3"></span>
			</div>
		</div>

		<c:choose>
			<c:when test="${data.productInfo.product_discount_rate != 0}">
				<div class="row mt-2 ps-2 ">
					<div class="col text-secondary">
						<del>${data.productInfo.product_price}원</del>
					</div>
				</div>
				<div class="row fs-4 ps-2">
					<div class="col-2 text-danger text-end fw-bold">
						${data.productInfo.product_discount_rate}%</div>
					<div class="col ps-0 fw-bold">
						<fmt:formatNumber
							value="${data.productInfo.product_price - data.salePrice}"
							pattern="#,###" />
						원
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row ps-2">
					<div class="col fw-bold">${data.productInfo.product_price}원</div>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="row mt-2 empty"></div>

		<div class="row mt-3 delism ms-3">
			<div class="row mt-2">
				<div class="col-3 ps-0 text-secondary">배송 안내</div>
				<div class="col">
					<div class="row">
						<div class="col ps-0">배송비 :
							${data.productInfo.product_shipping_price}원</div>
					</div>
					<div class="row">
						<div class="col ps-0">오후 2시 이전 당일 출고(영업일 기준)</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row ms-3	 mt-3 mb-4">

			<div class="col">
				<div class="row mt-2 border align-items-center" onclick="location.href='./searchProduct?searchWord=${ data.bizInfo.biz_store_name}'">
					<div class="col-3 ps-0">
						<img
							src="/uploadFiles/WelcomePet/${data.bizInfo.biz_store_main_img}"
							class="embed-responsive-item product-thum" alt="...">
					</div>
					<div class="col align-items-center fw-bold"
						style="font-size: 0.9em;">${data.bizInfo.biz_store_name }</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-2 empty"></div>
		<div class="row mt-3" style="justify-content: center;">
			<div class="row">
				<div class="col fw-bold">상품정보</div>
			</div>
			<div class="row mt-2"></div>
			<c:forEach items="${data.productImgList }" var="map">
				<div class="row mt-2 embed-responsive embed-responsive-4by3">
					<img src="/uploadFiles/WelcomePet/productDetailImage/${map.product_detail_image_link}"
						class="embed-responsive-item product-thum" alt="...">
				</div>
			</c:forEach>
		</div>
		<div class="row mt-2 empty"></div>
		<div class="row mt-2">
			<div class="row mt-3 ps-3">
				<div class="col ms-1 fw-bold">이 상품과 비슷한 상품</div>
			</div>
			<div class="row mt-2 px-0" id="relatedList"></div>
		</div>

	<div class="row mt-2 empty" style="height: 1.5em;"></div>

	<div class="row ps-2">
		<div class="row mt-2 py-2">
			<div class="col fw-bold">상품 리뷰</div>
		</div>
		<div class="row mt-2 ">
			<div class="col" id="colProductRating"></div>
		</div>
		<div class="row mt-3  ps-3 mx-0" id="reviewListBox"></div>
		<div class="row mt-3 ">
		  <div class="col text-center">
		  <div class=""> 
		    <button class="btn btn-outline-primary text-center btn-sm" style="width: 80%;">
		     더 많은 리뷰 보기<a class="btn text-primary py-0 bi bi-chevron-right"> </a>
		    </button> </div>
		  </div>
		</div>		
	</div>
	<div class="row mt-3 empty"></div>
	<div class="row ps-3 mt-3">
		<div class="row" style="align-items: center;">
			<div class="col fw-bold pt-1" style="font-size: 1.2em;">상품 문의</div>
			<div class="text-end me-1 pe-0 col ">
				<button class="btn btn-sm btn-outline-secondary"
					style="height: 100%;">문의하기</button>
			</div>
		</div>

		<div class="row mt-3 border-top"></div>
		<div class="row mt-3 text-secondary" style="font-size: 0.9em;">
			<div class="col">
				<span>jsy************</span>
			</div>
			<div class="col ms-2 text-end" style="font-size: 0.8em;">
				<span>23.07.26</span>
			</div>
		</div>
		<div class="row text-secondary" style="font-size: 0.8em;">
			<div class="col">옵션 : [3개] 인섹트업 하이포알러지 트릿 라이트</div>
		</div>
		<div class="row mt-2 " style="font-size: 0.9em;">
			<div class="col-1 fsmid pe-0 me-0">
				<span class="fw-bold">Q.</span>
			</div>
			<div class="col ps-0 fsmid">
				<span class="">애기가 다이어트중이라 고기간식을 지금다끊은상탠데 간혹교육때쓰려고 샀는데 잘먹네요
					칼로리가 궁금합니다!</span>
			</div>
		</div>
		<div class="row " style="font-size: 0.9em;">
			<div class="col">
				<span class=" fw-bold">A.</span> <span
					class="fw-bold  ps-0 text-primary">답변 완료</span> <a
					class="btn bi bi-chevron-down" data-bs-toggle="collapse"
					href="#collapseExample" role="button" aria-expanded="false"
					aria-controls="collapseExample"> </a>
				<div class="collapse" id="collapseExample">
					<div class="card card-body">
						<div class="row">
							<div class="col">
								<span class="fw-bold">판매자 </span> <span
									class="ps-1 text-secondary">23.07.30</span>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col">안녕하세요!</div>
						</div>
						<div class="row">
							<div class="col">건강한 반려생활의 시작 어서오개입니다.</div>
						</div>
						<div class="row mt-2">
							<div class="col">해당 제품은 낱개 1개당 약 4kcal로 확인됩니다 ^^</div>
						</div>
						<div class="row mt-2">
							<div class="col">감사합니다.</div>
						</div>
						<div class="row ">
							<div class="col">오늘도 아이와 함께 행복한 하루 되세요️🐶😺️</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mt-3 ">
		  <div class="col text-center">
		  <div class=""> 
		    <button class="btn btn-outline-secondary text-center btn-sm" style="width: 80%;">
		     더 많은 상품 문의 보기 <a class="btn py-0 bi bi-chevron-right"> </a>
		    </button> </div>
		  </div>
		</div>
		<div class="row mt-3"></div>
	</div>


	<div class="row mt-2 ">
	</div>	
	<jsp:include page="../common/serviceNavi.jsp"></jsp:include>	
		<div class="row mb-4">
			<div class="col">
				<div class="navbar navbar-dark bg-white fixed-bottom border-top "
					style="height: 4em;">
					
					<div class="col-1  mx-2 text-center">
						<div class="row">
							<div class="col">

								<a class="text-danger bi bi-heart" id="heartBox" style="font-size: 1.3em;"
									onclick="toggleWish(${data.productInfo.product_no});" role="button"> </a>



							</div>
						</div>
						<div class="row" style="height: 0.9em; margin-top: -0.5em;">
							<div class="col" style="font-size: 0.8em;">
								<span id="totalWishCount">3</span>
							</div>
						</div>
					</div>
					<div class="col ">
						<div class="row">
							<div class="col">
								<div class="d-grid gap-2">
									<button class="btn " type="button"
										style="background-color: rgb(253, 152, 67); color: white;"
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
												<div class="col" id="colOption"></div>
											
											</div>
											<div class="row mt-3" id="optionContainer"></div>

											<div class="col-1"></div>
										</div>

										<div class="row mt-3">

											<div class="col-1"></div>
											<div class="col-6">총 상품 금액</div>
											<div class="col-4 text-end">
												<div class="row">
													<div class="col fw-bold fs-4" id="showTotalPrice"
														style="color: darksalmon;">0원</div>
												</div>
											</div>
											<div class="col-1"></div>
										</div>
										<div class="row mt-4">
											<div class="col-1"></div>
											<div class="col-5 d-grid gap-2">
												<button class="btn   btn-lg"
													style="border-color: rgb(253, 152, 67); color: darksalmon;"
													data-bs-dismiss="offcanvas" type="button"
													onclick="insertCart()">장바구니</button>
											</div>
											<div class="col-5 d-grid gap-2">
												<button class="btn  btn-lg" type="button"
													style="background-color: rgb(253, 152, 67); color: white;"
													onclick="buyNow()">바로구매</button>
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



	<div id="myModal" class="modal" tabindex="-1" aria-labelledby="myModal"
		aria-hidden="true">
		<div class="modal-content">
			<!-- 높이 조정 (300px로 변경) -->
			<div class="modal-body">
				<div class="row " style="font-size: 0.8em;">
					<div class="col pe-0" style="color: white;">
						<span> 장바구니에 상품이 담겼습니다. </span>
					</div>
					<div class="col-5 ps-0 text-end fw-bold">
						<span onclick="moveToCart()" class="text-primary"> 장바구니로 가기</span>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>




</body>
</html>