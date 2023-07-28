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
	<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"
/>
<title>메인</title>
<script >


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
		            updateRecentProductButton();
		            setRecentImgBackground(mySessionId);
				}
			}
		}
		
		//get
		xhr.open("get", "../customer/getMyId", false); // 딱 여기만 쓰세요...false 동기식 호출..! 권장되지 않음
		xhr.send();		
	}	
	
	  function updateRecentProductButton() {
		    const recentProductButton = document.getElementById("recentProduct");
		    
		    // customer_no가 null이면 버튼을 숨깁니다.
		    if (mySessionId === null) {
		      recentProductButton.style.display = "none";
		    } else {
		      recentProductButton.style.display = "block";
		    }
		  }

	  function setRecentImgBackground(customer_no) {
		  var xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = function() {
		    if (xhr.readyState === XMLHttpRequest.DONE) {
		      if (xhr.status === 200) {
		        var response = JSON.parse(xhr.responseText);
		        if (response.result === "success") {
		          var imgUrl = response.recentImg; // recentImg 값으로부터 이미지 URL 가져오기
		          var buttonElem = document.getElementById("recentProduct");

		          if (imgUrl !== null) {
		            // imgUrl이 null이 아닌 경우에만 배경 이미지를 설정합니다.
		        	  buttonElem.style.backgroundImage = "url('/uploadFiles/WelcomePet/" + imgUrl + "')";
		        	  buttonElem.addEventListener("click", handleRecentImgClick);
		          } else {
		   
		            buttonElem.style.display = "none";
		          }
		        } else {
		          console.error("Failed to get recentImg: " + response.result);
		        }
		      } else {
		        console.error("Request failed with status: " + xhr.status);
		      }
		    }
		  };

		  // GET 방식으로 customer_no를 가져와서 업데이트합니다.
		  xhr.open("GET", "./getRecentImg?customer_no=" + customer_no);
		  xhr.send();
		}
	  function handleRecentImgClick() {

		  
		  location.href = "./recentProductList?customer_no=" + mySessionId;
		}
	  
	  
	function getSaleList() {
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				 console.log(response);
				document.getElementById("topSaleBox").innerHTML = "";

			for(data of response.topSaleProductList) {
				
				const col1 = document.createElement("div");
				col1.classList.add("col-4", "embed-responsive", "embed-responsive-4by3", "ps-3");
				
				
				
				const rowImg = document.createElement("div");
				rowImg.classList.add("row");
				col1.appendChild(rowImg);
				
				const colImg =	document.createElement("div");
				colImg.classList.add("col");
				colImg.setAttribute("onclick","location.href='./productDetail?product_no="+data.productInfo.product_no+"'");
				colImg.style.position = "relative";
				rowImg.appendChild(colImg);
				
				const discountLabel = document.createElement("label");
				discountLabel.classList.add("discount-label");
				discountLabel.textContent = data.productInfo.product_discount_rate + "%"; // 할인율 정보
				discountLabel.style.position = "absolute"; // 절대 위치 설정
				discountLabel.style.top = "0.3em"; // 상단 위치
				discountLabel.style.left = "1em"; // 왼쪽 위치
				discountLabel.style.backgroundColor = "rgb(255, 89, 103)"; // 배경색 설정
				discountLabel.style.color = "white"; // 글자색 설정
				discountLabel.style.fontSize = "0.8em"; // 내부 여백 설정
				discountLabel.style.padding = "0.1em";
				discountLabel.style.borderRadius = "4px"; // 테두리 둥글기 설정
				colImg.appendChild(discountLabel);
				
				const heartBox = document.createElement("a");
				heartBox.classList.add("text-secondary", "bi", "bi-heart");
				heartBox.id = "heartBox" + data.productInfo.product_no ;
				heartBox.setAttribute("onclick", "toggleWish("+ data.productInfo.product_no +")");
				heartBox.style.position = "absolute"; // 절대 위치 설정
				heartBox.style.bottom = "0"; // 하단 위치
				heartBox.style.right = "10px"; // 오른쪽 위치
				heartBox.style.filter = "opacity(0.5)";
				heartBox.setAttribute("role", "button");
				colImg.appendChild(heartBox);
				
				const img = document.createElement("img");
				img.src = "/uploadFiles/WelcomePet/" + data.productInfo.product_thumbnail; // 이미지 URL 또는 경로 설정
				img.alt = "제품 이미지";
				img.classList.add("embed-responsive-item", "product-thum");
				colImg.appendChild(img);
				
				const rowName = document.createElement("div");
				rowName.classList.add("row","mt-1", "r_name")
				"location.href='./productDetail?product_no=${map.productInfo.product_no}'"
				rowName.setAttribute("onclick","location.href='./productDetail?product_no="+data.productInfo.product_no+"'");
				col1.appendChild(rowName);
				
				
				const colName = document.createElement("div");
				colName.classList.add("col");
				rowName.appendChild(colName);
				
				const nameBox = document.createElement("p");
				nameBox.classList.add( "fsmid");
				nameBox.innerText = data.productInfo.product_name;
				colName.appendChild(nameBox);
				
				const rowPrice = document.createElement("div");
				rowPrice.classList.add("row");
				col1.appendChild(rowPrice);
				
				const price = data.productInfo.product_price - data.salePrice;
				const formattedPrice = price.toLocaleString();
				
				const colPrice = document.createElement("div");
				colPrice.classList.add("col", "fw-bold","price_text");
				colPrice.innerText = formattedPrice +"원";
				rowPrice.appendChild(colPrice);	
				
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
				
				document.getElementById("topSaleBox").appendChild(col1);
				
				  refreshMyHeart(data.productInfo.product_no);
				}
			}
		}
		xhr.open("get", "./topSalePrdouct");
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

				refreshMyHeart(productNo);
			}
		}
		
		//get
		xhr.open("get", "./toggleWish?product_no=" + productNo);
		xhr.send();	
		
		}
	
	function refreshMyHeart(productNo){
		
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
	
	function fetchCategoryList(categoryNo) {
		  var xhr = new XMLHttpRequest();

		  xhr.onreadystatechange = function() {
		    if (xhr.readyState === XMLHttpRequest.DONE) {
		      if (xhr.readyState == 4 && xhr.status == 200) {
		        const response = JSON.parse(xhr.responseText);
				console.log(response);
		        // categoryList를 사용하여 row와 col 생성
		        var categoryListDiv = document.getElementById("categoryList");
		        categoryListDiv.innerHTML = ""; // 기존 내용 초기화

		        for (data of response.categoryList) {
		        	  console.log(data);
		        	  var colDiv = document.createElement("div");
		        	  colDiv.classList.add("col-3","align-items-center","text-center");
		        	  colDiv.setAttribute("onclick", "redirectToCategory(" + categoryNo + ", " + data.categoryList.sub_category_no + ")");

		        	  var imgRow = document.createElement("div");
		        	  imgRow.classList.add("row", "category_img");
		        	  colDiv.appendChild(imgRow);

		        	  var imgCol = document.createElement("div");
		        	  imgCol.classList.add("col","align-items-center","text-center","ps-0","pe-0");
		        	  imgRow.appendChild(imgCol);

		        	  var img = document.createElement("img"); 
		        	  img.src = "/welcomepet/resources/img/category/" + categoryNo + "/" + data.categoryList.sub_category_no + ".png";
		        	  img.classList.add("category_img", "rounded-circle");
		        	  img.alt = "...";
		        	  imgCol.appendChild(img);

		        	  var categoryRow = document.createElement("div");
		        	  categoryRow.classList.add("row","mt-1");	
		        	  
		        	  var categoryCol = document.createElement("div");
		        	  categoryCol.classList.add("col", "category_name","fw-bold","ps-0","text-secondary");
		        	  categoryCol.innerText = data.categoryList.sub_category_name;

		        	  categoryRow.appendChild(categoryCol);
		        	  colDiv.appendChild(categoryRow);

		        	  categoryListDiv.appendChild(colDiv);
		        	}

		        // 선택된 span에 selected 클래스 추가
		        var selectedSpan = document.getElementById("categoryBtn" + categoryNo);
		        selectedSpan.classList.add("selected");

		        // 나머지 span들의 selected 클래스 제거
		        var spans = document.getElementsByClassName("category-span");
		        for (var j = 0; j < spans.length; j++) {
		          if (spans[j] !== selectedSpan) {
		            spans[j].classList.remove("selected");
		          }
		        }
		      } else {
		        console.log("Error: " + xhr.status);
		      }
		    }
		  };

		  xhr.open("GET", "./getCategoryList?main_category_no=" + categoryNo);
		  xhr.send();
		}
	
	function redirectToCategory(mainCategoryNo, subCategoryNo) {
		  var url = "./categoryProduct?main_category_no=" + mainCategoryNo + "&sub_category_no=" + subCategoryNo;
		  window.location.href = url;
		}
	

	  function countdownTimer() {
	    var countDate = new Date(); 
	    countDate.setHours(24, 0, 0, 0); 

	    var now = new Date().getTime(); 
	    var distance = countDate.getTime() - now; 

	  
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

	 
	    var hoursStr = hours.toString().padStart(2, '0');
	    var minutesStr = minutes.toString().padStart(2, '0');
	    var secondsStr = seconds.toString().padStart(2, '0');

	    
	    document.getElementById('timeTable').innerText = hoursStr + ":" + minutesStr + ":" + secondsStr;

	  
	    setTimeout(countdownTimer, 1000);
	  }
	  
	  

	  function getBizProductList(bizNo) {
			
			const xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const response = JSON.parse(xhr.responseText);
					 console.log(response);

				     // 이전 "이 상품과 비슷한 상품" 리스트들 삭제
				      const relatedListContainer = document.getElementById("bizProductList");
				      relatedListContainer.innerHTML = "";

				      // relatedListContainer에 "relatedProductsSwiper" 생성
				      const swiperContainer = document.createElement("div");
				      swiperContainer.classList.add("swiper-container");
				      swiperContainer.id = "relatedProductsSwiper";

				      const swiperWrapper = document.createElement("div");
				      swiperWrapper.classList.add("swiper-wrapper");
				      swiperContainer.appendChild(swiperWrapper);
				      
			
//				      const prevButton = document.createElement("div");
//				      prevButton.classList.add("swiper-button-prev");
//				      swiperContainer.appendChild(prevButton);

//				      const nextButton = document.createElement("div");
//				      nextButton.classList.add("swiper-button-next");
//				      swiperContainer.appendChild(nextButton); 

				      relatedListContainer.appendChild(swiperContainer);

				for(data of response.bizProductList) {
					
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
					heartBox.style.right = "10px"; // 오른쪽 위치

					heartBox.setAttribute("role", "button");
					colImg.appendChild(heartBox);
					
					const img = document.createElement("img");
					img.src = "/uploadFiles/WelcomePet/" + data.productInfo.product_thumbnail; // 이미지 URL 또는 경로 설정
					img.alt = "제품 이미지";
					img.classList.add("embed-responsive-item", "product-thum");
					colImg.appendChild(img);
					
					const rowName = document.createElement("div");
					rowName.classList.add("row","mt-1", "r_name")
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
			
			


			xhr.open("get", "./bizProduct?biz_no="+bizNo);
			xhr.send();	
		}
	  
	  let selectedBizDiv = null;

	  function handleBizClick(event) {
		    console.log("handleBizClick() 함수 호출됨.");
		    // Remove the "text-primary" class from the previous selected element
		    if (selectedBizDiv !== null) {
		        selectedBizDiv.querySelector(".biz_name").classList.remove("text-primary");
		        selectedBizDiv.querySelector(".biz_img").classList.remove("border-primary");
		        selectedBizDiv.querySelector(".biz_img").classList.remove("border");
		        selectedBizDiv.querySelector(".biz_img").classList.remove("border-3");
		        selectedBizDiv.classList.remove("selected");
		        selectedBizDiv.querySelector(".biz_name").classList.add("text-secondary");
		    }

		    // Add the "text-primary" class to the clicked element
		    const clickedSlide = event.target.closest(".swiper-slide");
		    clickedSlide.querySelector(".biz_name").classList.add("text-primary");
		    clickedSlide.querySelector(".biz_img").classList.add("border-primary");
		    clickedSlide.querySelector(".biz_img").classList.add("border");
		    clickedSlide.querySelector(".biz_img").classList.add("border-3");
		    clickedSlide.classList.add("selected");
		    clickedSlide.querySelector(".biz_name").classList.remove("text-secondary");

		    // Update the selectedBizDiv to the current clicked element
		    selectedBizDiv = clickedSlide;
		}
	  
		function getBizList() {
			 
			  var xhr = new XMLHttpRequest();

			  xhr.onreadystatechange = function() {
				  console.log("bizList() 함수 호출됨.");
			    if (xhr.readyState === XMLHttpRequest.DONE) {
			    	
			      if (xhr.readyState == 4 && xhr.status == 200) {
			        const response = JSON.parse(xhr.responseText);
					console.log(response);
			
			        const bizListContainer = document.getElementById("bizList");
			        bizListContainer.innerHTML = ""; 
			        
				      const swiperContainer2 = document.createElement("div");
				      swiperContainer2.classList.add("swiper-container");
				      swiperContainer2.id = "bizSwiper";
				      bizListContainer.appendChild(swiperContainer2);

				      const swiperWrapper2 = document.createElement("div");
				      swiperWrapper2.classList.add("swiper-wrapper");
				      swiperContainer2.appendChild(swiperWrapper2);

			        for (data of response.bizList) {
			        	  console.log(data);
			        	  var colDiv = document.createElement("div");
			        	  colDiv.classList.add("col-3","align-items-center","text-center","swiper-slide");
			        	  colDiv.id = "biz-slide";
			        	  colDiv.setAttribute("onclick", "getBizProductList("+ data.bizInfo.biz_no + ")");
			        	  
			        	  colDiv.addEventListener("click", handleBizClick);
			              
			        	  var imgRow = document.createElement("div");
			        	  imgRow.classList.add("row", "px-0","mx-0");
			        	  colDiv.appendChild(imgRow);

			        	  var imgCol = document.createElement("div");
			        	  imgCol.classList.add("col","align-items-center","text-center","ps-0","pe-0");
			        	  imgRow.appendChild(imgCol);

			        	  var img = document.createElement("img");
			        	  img.src = "/uploadFiles/WelcomePet/"+ data.bizInfo.biz_store_main_img;
			        	  img.classList.add("biz_img", "rounded-circle");
			        	  img.alt = "...";
			        	  imgCol.appendChild(img);

			        	  var categoryRow = document.createElement("div");
			        	  categoryRow.classList.add("row","mt-1");	
			        	  
			        	  var categoryCol = document.createElement("div");
			        	  categoryCol.classList.add("col", "biz_name","fw-bold","px-0","text-secondary");
			        	  categoryCol.innerText = data.bizInfo.biz_store_name;

			        	  categoryRow.appendChild(categoryCol);
			        	  colDiv.appendChild(categoryRow);

			        	  swiperWrapper2.appendChild(colDiv);
			        	}
			        
	                const swiper = new Swiper("#bizSwiper", {
	                    slidesPerView: "auto",
	                    spaceBetween: 10,
	                    loop: false,
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
			  	};
			  }
			  
			  xhr.open("GET", "./bizList");
			  xhr.send();
			
		}
		
		function getBestList(categoryNo) {
			
			const xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const response = JSON.parse(xhr.responseText);
					 console.log(response);
					document.getElementById("bestListBox").innerHTML = "";

				for(data of response.relatedProductList) {
					
					const col1 = document.createElement("div");
					col1.classList.add("col-4","py-1", "embed-responsive", "embed-responsive-4by3", "ps-3");
					
					
					
					const rowImg = document.createElement("div");
					rowImg.classList.add("row");
					col1.appendChild(rowImg);
					
					const colImg =	document.createElement("div");
					colImg.classList.add("col");
					colImg.setAttribute("onclick","location.href='./productDetail?product_no="+data.productInfo.product_no+"'");
					colImg.style.position = "relative";
					rowImg.appendChild(colImg);
					
					  const index = response.relatedProductList.indexOf(data);
					const discountLabel = document.createElement("label");
					discountLabel.classList.add("discount-label","fw-bold","text-center");
					discountLabel.textContent = index + 1; 
					discountLabel.style.position = "absolute"; // 절대 위치 설정
					discountLabel.style.top = "0.0em"; // 상단 위치
					discountLabel.style.left = "0em"; // 왼쪽 위치
					discountLabel.style.backgroundColor = "red"; // 배경색 설정
					discountLabel.style.color = "white"; // 글자색 설정
					discountLabel.style.fontSize = "0.8em"; // 내부 여백 설정
					discountLabel.style.padding = "0.1em";
					discountLabel.style.opacity = "0.7";
					discountLabel.style.borderRadius = "0.8em 0px"; 
					discountLabel.style.minWidth = "1.8rem";
					colImg.appendChild(discountLabel);
					
					const heartBox = document.createElement("a");
					heartBox.classList.add("text-secondary", "bi", "bi-heart");
					heartBox.id = "heartBox" + data.productInfo.product_no ;
					heartBox.setAttribute("onclick", "toggleWish("+ data.productInfo.product_no +")");
					heartBox.style.position = "absolute"; // 절대 위치 설정
					heartBox.style.bottom = "0"; // 하단 위치
					heartBox.style.right = "10px"; // 오른쪽 위치
					heartBox.style.filter = "opacity(0.5)";
					heartBox.setAttribute("role", "button");
					colImg.appendChild(heartBox);
					
					const img = document.createElement("img");
					img.src = "/uploadFiles/WelcomePet/" + data.productInfo.product_thumbnail; // 이미지 URL 또는 경로 설정
					img.alt = "제품 이미지";
					img.classList.add("embed-responsive-item", "product-thum");
					colImg.appendChild(img);
					
					const rowName = document.createElement("div");
					rowName.classList.add("row","mt-1", "r_name")
					"location.href='./productDetail?product_no=${map.productInfo.product_no}'"
					rowName.setAttribute("onclick","location.href='./productDetail?product_no="+data.productInfo.product_no+"'");
					col1.appendChild(rowName);
					
					
					const colName = document.createElement("div");
					colName.classList.add("col");
					rowName.appendChild(colName);
					
					const nameBox = document.createElement("p");
					nameBox.classList.add( "fsmid");
					nameBox.innerText = data.productInfo.product_name;
					colName.appendChild(nameBox);
					
					const rowPrice = document.createElement("div");
					rowPrice.classList.add("row");
					col1.appendChild(rowPrice);
					
					
					const price = data.productInfo.product_price - data.salePrice
					const formattedPrice = price.toLocaleString();
					
					const colPrice = document.createElement("div");
					colPrice.classList.add("col", "fw-bold","price_text");
					colPrice.innerText = formattedPrice +"원";
					rowPrice.appendChild(colPrice);	
					
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
					
					document.getElementById("bestListBox").appendChild(col1);
					
					  refreshMyHeart(data.productInfo.product_no);
					}
		        var selectedSpan = document.getElementById("categorybutton" + categoryNo);
		        selectedSpan.classList.add("selected");

		        // 나머지 span들의 selected 클래스 제거
		        var spans = document.getElementsByClassName("category-span2");
		        for (var j = 0; j < spans.length; j++) {
		          if (spans[j] !== selectedSpan) {
		            spans[j].classList.remove("selected");
		          }
		        }
		      } else {
		        console.log("Error: " + xhr.status);
		      }
			
			}
			xhr.open("get", "./relatedProduct?main_category_no="+categoryNo);
			xhr.send();	
		}
    
        document.addEventListener("DOMContentLoaded", function () {
            // 스크롤 버튼 요소
            const scrollToTopButton = document.getElementById("scrollToTop");

            // 스크롤 이벤트를 감지하여 스크롤 버튼 표시/숨김 처리
            let isScrollingUp = true; // 스크롤 방향 상태 변수 (true: 위로 스크롤 중, false: 아래로 스크롤 중)
            let prevScrollY = 0; // 이전 스크롤 위치

            window.addEventListener("scroll", function () {
                const currentScrollY = window.scrollY;
                isScrollingUp = currentScrollY < prevScrollY; // 스크롤 방향 업데이트
                prevScrollY = currentScrollY;

                if (isScrollingUp) {
                    scrollToTopButton.classList.add("show");
                } else {
                    scrollToTopButton.classList.remove("show");
                }
            });

            // "맨 위로 가기" 버튼을 눌렀을 때 페이지 맨 위로 스크롤
        });
        
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: "auto" // 스크롤 부드럽게 이동
            });
        }
	window.addEventListener("DOMContentLoaded", function(){
	    //사실상 시작 시점...
	     getSessionId();
		getSaleList();
		fetchCategoryList(1);
		countdownTimer();
		getBizProductList(1);
		getBizList();
		getBestList(1);
		updateRecentProductButton();
		setRecentImgBackground(mySessionId);
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
.swiper-container {
  width: 100%;
  height: 100%;
  overflow: hidden;
   position: relative;
}

.swiper-button-prev,
.swiper-button-next {
  position: absolute; 
  top: 50%; 
  transform: translateY(-50%); 
  width: 1em;
  height: 1em;
  color: grey;
  cursor: pointer;
  z-index: 10;
}

.swiper-button-prev::after,
.swiper-button-next::after {
  font-size: 24px; /* 아이콘 크기를 조절합니다. */
}

.swiper-button-next {
  right: 10px;
}

/* 이전 버튼의 위치를 좌측으로 설정합니다. */
.swiper-button-prev {
  left: 10px;
}

#biz-slide {
  width: 18%;
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
.price_text{
	font-size: 0.8em;
}

.real_price{
 font-size: 0.7em;
 text-decoration: line-through;
}


.carousel-inner {
	height: 12em;
}
.price_text{
	font-size: 0.9em;
}
.product-thum {
	width: 100%;
}
.fLlDaL {
    background-color: rgb(244, 247, 250);
    padding: 3rem 1.6rem 12rem;
}
.fsmid {
	font-size: 0.8em;
	margin-bottom: 0;
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2; /* 라인수 */
    -webkit-box-orient: vertical;
    word-wrap:break-word; 
    line-height: 1.2em;
    height: 2.4em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
}
.r_name{
	height: 2em;
}
.not_select {
 background: white;
 font-size: 0.8em;
}
.category_img {
 width: 100%;
}
.category_name {
 font-size: 0.7em;
}

.biz_img {
	width: 100%;
}
.biz_name {
	font-size: 0.7em;
}

.category-col {
    display: flex;
  border: 1px solid white;
  border-radius: 2.4rem;
  padding: 0.3em 0.3em;
  margin: 0;
  justify-content: center;
  align-items: center;
  transition: all 0.3s;
  font-size: 0.87em;
  color: gray;
  font-weight: 600;
}

.category-col:hover {
  border-color: #007bff;
}

.category-span.not-select {
  background-color: #fff;
}

.category-span.selected {
  color: #007bff;
  font-weight: 700;
 
}


.category-span2.selected {
  color: #007bff;
  font-weight: 700;
 
}
.empty {
	height: 1em;
	background-color: rgb(244, 247, 250);
}

.star-icon {
	display: inline-block;
	width: 1.2em;
	height: 1.2em;
	background-image: url('/uploadFiles/WelcomePet/icons/star-empty.png');
	background-size: cover;
	filter: opacity(0.5);
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
        /* 항상 보여지는 버튼 스타일 */
        .always-show-button {
            position: fixed;
             box-shadow: rgba(0, 0, 0, 0.04) 0.2rem 0.4rem ;
              border: 0.1rem solid rgb(0, 80, 255);
            bottom: 2.3em;
            right: 0.6em; 
            width: 1.4em;
            height: 1.4em;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 2em; 
            cursor: pointer;
            opacity: 1;
                      z-index : 1000;
        }

        /* 스크롤 시 나타나는 버튼 스타일 */
        .scroll-button {
        	display: flex;
            position: fixed;
            border: solid 1px rgb(223, 227, 232);
            background-color: rgb(255, 255, 255);
            box-shadow: rgba(0, 0, 0, 0.04) 0.2rem 0.4rem ;
            bottom: 4em;
            right: 0.6em; 
            width: 1.4em;
            height: 1.4em;
            border-radius: 50%;
            justify-content: center;
            align-items: center;
            color: grey;
            font-size: 2em; /* em 단위로 버튼 내용 폰트 크기 조정 */
            cursor: pointer;
            opacity: 0; /* 초기에는 버튼 숨김 */
            transition: opacity 0.3s;
            z-index : 1000;
        }

        .scroll-button.show {
            opacity: 1; 
 
</style>
</head>
<body>

	<jsp:include page="../common/topMainNavi.jsp"></jsp:include>

	<div class="container">
		

		<div class="row mt-3 border_bottom text-center fw-bold fs-6 text-secondary">
			<div class="col pe-0 ps-0">홈</div>
			<div class="col pe-0 ps-0">베스트</div>
			<div class="col pe-0 ps-0">특가존</div>
			<div class="col">리뷰이벤트</div>
		</div>
		<div class="row mt-2 ps-0 pe-0">
			<div id="carouselExampleIndicators" class="carousel slide ps-0 pe-0"
				data-bs-ride="true">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="4" aria-label="Slide 5"></button>													
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/welcomepet/resources/img/banner/MainBanner3.png"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/welcomepet/resources/img/banner/MainBanner2.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/welcomepet/resources/img/banner/MainBanner1.png"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/welcomepet/resources/img/banner/MainBanner4.png"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/welcomepet/resources/img/banner/MainBanner3.jpg"
							class="d-block w-100" alt="...">
					</div>											
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="row mt-2 text-center fw-bold  " >
			<div class="col-1"></div>
			<div class="col border justify-content-center rounded-2 text-secondary align-items-center d-flex" style="background-color: rgb(227, 237, 255); font-size: 0.9em; 
						height:3em; ">
				<span >리뷰 작성시 최대</span> <span class="text-primary ps-1">결제금액의 3%</span> <span>를 드려요!</span>
			</div>
			<div class="col-1"></div>
		</div>
			<div class="row mt-3 ms-1 me-1 ps-0">
					
					
					  <div class="col  category-col">
					    <span class="category-span not-select" onclick="fetchCategoryList(1)" id="categoryBtn1">사료</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span not-select" onclick="fetchCategoryList(2)" id="categoryBtn2">간식</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span not-select" onclick="fetchCategoryList(3)" id="categoryBtn3">용품</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span not-select" onclick="fetchCategoryList(4)" id="categoryBtn4">건강</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span not-select" onclick="fetchCategoryList(5)" id="categoryBtn5">스타일</span>
					  </div>
					
			</div>
		<div class="row mt-3 text-center">
		
		<div class="col">
			<div class="row ms-2" id="categoryList">

			</div>
			</div>
		</div>
		
			<div class="row mt-2 empty"></div>
		<div class="row mt-2">
		<div class="col">
		<div class="row mt-3" > 
		<div class="col  " style="font-size: 1.2em; font-weight: 600;"> 오늘의 핫딜 <i class="bi bi-fire text-danger"></i>
			<span id="timeTable" class="text-danger fw-bold"></span>
			</div>
		<div class="row mt-4" id="topSaleBox">
		
				</div>
		</div>
		</div>

		</div>
	 <div class="row mt-2"></div>
		<div class="row mt-4 ">
			<div class="col px-0 ms-0">
			<img src="/welcomepet/resources/img/banner/banner2.png"
				class="product-thum" style="width:  ;" alt="...">
			</div>		
		</div>
				
		<div class="row mt-2">
		<div class="col">
		<div class="row mt-3" > 
		<div class="col  fw-bold" style="font-size: 1.2em;"> 브랜드 샵 </div>
		
		<div class="row mt-2" id="bizList">
					
			</div>
		<div class="row mt-3 px-0" id="bizProductList" >

		</div>
		</div>
		
		<div class="row mt-2"></div>
		<div class="row mt-4 ">
			<div class="col px-0 ms-0">
			<img src="/welcomepet/resources/img/banner/banner1.png"
				class="product-thum" style="width:  ;" alt="...">
			</div>		
		</div>
		
		<div class="row mt-4">
			<div class="col fw-bold" style="font-size: 1.2em;">
			  베스트 아이템
			</div>
		</div>
					<div class="row mt-2 ms-1 me-1 ps-0 ">
					
					  <div class="col   category-col">
					    <span class="category-span2 not-select" onclick="getBestList(1)" id="categorybutton1">사료</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span2 not-select" onclick="getBestList(2)" id="categorybutton2">간식</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span2 not-select" onclick="getBestList(3)" id="categorybutton3">용품</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span2 not-select" onclick="getBestList(4)" id="categorybutton4">건강</span>
					  </div>
					  <div class="col  category-col">
					    <span class="category-span2 not-select" onclick="getBestList(5)" id="categorybutton5">스타일</span>
					  </div>
					  
			</div>
		<div class="row mt-2" id="bestListBox">
		
		</div>
				

		</div>
		</div>
	<div class="always-show-button" id="recentProduct" 
			style="background-image: url('/uploadFiles/WelcomePet/'); background-size: contain;">
        
    </div>
        <div class="scroll-button " id="scrollToTop" onclick="scrollToTop()" 
        >
			<a class="bi-arrow-up-short" style="color: rgb(66, 73, 79);"></a>
    </div>
		<div class="row mt-3"></div>
		
	<jsp:include page="../common/serviceNavi.jsp"></jsp:include>
	<jsp:include page="../common/bottomNavi2.jsp"></jsp:include>
	</div>


<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
