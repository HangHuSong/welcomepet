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
<title>검색</title>
<script >

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
	        	  colDiv.setAttribute("onclick", "location.href='./searchProduct?searchWord="+data.bizInfo.biz_store_name+"'");
	        	  
	              
	        	  var imgRow = document.createElement("div");
	        	  imgRow.classList.add("row", "px-0","mx-0");
	        	  colDiv.appendChild(imgRow);

	        	  var imgCol = document.createElement("div");
	        	  imgCol.classList.add("col","align-items-center","text-center","ps-0","pe-0");
	        	  imgRow.appendChild(imgCol);

	        	  var img = document.createElement("img");
	        	  img.src = "/uploadFiles/WelcomePet/biz/biz" + data.bizInfo.biz_no + ".jpg";
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
	
function updateRecentTime() {
    const now = new Date();
    const formattedTime = now.toLocaleString("ko-KR", {
        hour: "2-digit",
        minute: "2-digit",
    });
    document.getElementById("recent_time").innerText = formattedTime;
}
window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
	updateRecentTime();
	getBizList()
	setInterval(updateRecentTime, 5 * 60 * 1000);
});


</script>
<style>


@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
body {
	font-family: 'Pretendard-Regular';
}


#biz-slide {
  width: 18%;
}

.reco_search {
	font-size: 0.8em;
	border-radius: 1rem;
	margin: 0;
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


.biz_img {
	width: 100%;
}
.biz_name {
	font-size: 0.7em;
}
.recent_search {
	font-size: 0.8em;
	background-color: rgb(244, 247, 250);
	border-radius: 1rem;
}


</style>
</head>
<body>

	<div class="container align-items-center justify-content-center">

		<div class="row  mt-2 align-items-center">
			<div class="col-2 d-flex ">
				<a class="btn bi bi-arrow-left fs-4" role="button"
					onclick="history.back()"> </a>
			</div>
			<div class="col " style="text-align: center;">
				<form action="./searchProduct" class="d-flex" role="search">
					<input class="form-control me-2 " type="search"
						placeholder="검색어를 입력하세요" name="searchWord" aria-label="Search">
				</form>
			</div>
			<div class="col-1"></div>
		</div>

		<div class="row mt-2">
			<div class="col">
				<img src="/welcomepet/resources/img/banner/banner3.png"
					style="width: 100%;" alt="...">
			</div>
		</div>
		<c:if test="${not empty customerInfo}">
			<div class="row mt-3">

				<div class="col  ps-4 pe-3">
					<div class="row fw-bold">최근검색어</div>
					<div class="row mt-2 text-center">
						<div class="col text-start ">
							<c:forEach items="${searchInfo}" var="map">
									
								<a class="btn btn-outline-secondary me-1 fw-bold recent_search"
									role="button"
									href="./searchProduct?searchWord=${map.searchInfo.search_content}">
									${map.searchInfo.search_content} </a>

							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</c:if>
		<div class="row mt-3">
			<div class="col  ps-4 pe-3">
				<div class="row mt-3 fw-bold">추천 검색어</div>
				<div class="row mt-2 text-start">
					<div class="col pe-0" >
						<a class="btn btn-outline-primary fw-bold reco_search my-1"
							role="button" href="./searchProduct?searchWord=잇츄"> 잇츄</a>
						<a class="btn btn-outline-primary fw-bold reco_search my-1"
							role="button" href="./searchProduct?searchWord=노즈워크"> 노즈워크</a>
						<a class="btn btn-outline-primary fw-bold reco_search my-1"
							role="button" href="./searchProduct?searchWord= 피니키"> 피니키</a>
						<a class="btn btn-outline-primary fw-bold reco_search my-1"
							role="button" href="./searchProduct?searchWord= 인섹트업"> 인섹트업</a>
						<a class="btn btn-outline-primary fw-bold reco_search my-1"
							role="button" href="./searchProduct?searchWord=영양제"> 영양제</a>
						<a class="btn btn-outline-primary fw-bold reco_search my-1"
							role="button" href="./searchProduct?searchWord= 위글펫"> 위글펫</a>
						<a class="btn btn-outline-primary fw-bold reco_search my-1"  
							role="button" href="./searchProduct?searchWord= 키니키니"> 키니키니</a>																							
					</div>
				</div>
			</div>

		</div>
		<div class="row mt-3"></div>

		<div class="row mt-3">

			<div class="col  ps-4 pe-3">
				<div class="row fw-bold">인기 검색어</div>
				<div class="row ps-1 text-secondary" style="font-size: 0.8em" id="recent_time">
					
				</div>
				<div class="row mt-3 "></div>
				<div class="row" style="font-size: 0.9em;">
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=사료'">
						<span class="fw-bold">1.</span> <span class="ps-2">사료</span> <span
							class="float-end pe-3"> <i class="bi bi-dash "></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=패드'">
						<span class="fw-bold">6.</span> <span class="ps-2">패드</span> <span
							class="float-end pe-3"> <i
							class="bi bi-caret-down-fill text-primary "></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=영양제'">
						<span class="fw-bold">2.</span> <span class="ps-2">영양제</span> <span
							class="float-end pe-3"> <i
							class="bi bi-caret-up-fill text-danger"></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=치약'">
						<span class="fw-bold">7.</span> <span class="ps-2">치약</span> <span
							class="float-end pe-3"> <i class="bi bi-dash"></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=간식'">
						<span class="fw-bold">3.</span> <span class="ps-2">간식</span> <span
							class="float-end pe-3"> <i class="bi bi-caret-down-fill text-primary"></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=인섹트업'">
						<span class="fw-bold">8.</span> <span class="ps-2">인섹트업</span> <span
							class="float-end pe-3"> <i class="bi bi-dash "></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=장난감'">
						<span class="fw-bold">4.</span> <span class="ps-2">장난감</span> <span
							class="float-end pe-3"> <i class="bi bi-dash"></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=잇츄'">
						<span class="fw-bold">9.</span> <span class="ps-2">잇츄</span> <span
							class="float-end pe-3"> <i
							class="bi bi-caret-up-fill text-danger"></i>
						</span>
					</div>
					<div class="col-6 py-2"
						onclick="location.href='./searchProduct?searchWord=나시'">
						<span class="fw-bold">5.</span> <span class="ps-2">나시</span> <span
							class="float-end pe-3"> <i
							class="bi bi-caret-up-fill text-danger"></i>
						</span>
					</div>
					<div class="col-6 ps-1 py-2"
						onclick="location.href='./searchProduct?searchWord=껌'">
						<span class="fw-bold">10.</span> <span class="ps-2">껌</span> <span
							class="float-end pe-3"> <i class="bi bi-caret-down-fill text-primary "></i>
						</span>
					</div>

				</div>
			</div>
		<div class="row mt-3"></div>
		 <div class="row mt-3 fw-bold">
		 	<div class="col">
		 		인기브랜드 
		 	</div>
		 	
		 	</div>
		<div class="row mt-3 mb-3" id="bizList"></div>
		
		
		</div>
		
		<div class="row mt-5"></div>


		<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
	</div>


<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>