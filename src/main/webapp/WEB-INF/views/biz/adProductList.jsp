<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">

<script>
	
</script>


</head>
<body>
	<div class="container" style="margin: 0 0;">

		<div class="row" style="width: 1900px;">
			<div
				class="col-2 text-center ps-4 text-white d-flex align-items-stretch align-top"
				style="background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-8 px-0">
				<div class="row bg-white mx-1">
					<div class="col text-center">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row mx-5 text-center">
					<div class="col">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">광고상품 목록</div>
						</div>
						<div class="row my-2 bg-light px-5">
							<div class="col">
								<div class="row my-5">
									<div class="col border bg-white">
										<div class="row border-bottom">
											<div class="col-3 border-end py-2">기간</div>
											<div class="col py-2">
												<input class="text-center" type="date" style="width: 200px;">
												~ <input class="text-center" type="date"
													style="width: 200px;">
											</div>
										</div>
										<div class="row">
											<div class="col-3 border-end py-2">검색어</div>
											<div class="col py-2 text-start"></div>
										</div>
									</div>
								</div>
								<div class="row justify-content-center my-5">
									<div class="col">
										<span><button class="btn btn-dark">검색</button></span> <span><button
												class="btn btn-outline-dark">초기화</button></span>
									</div>
								</div>
							</div>

						</div>
						<div class="row text-start mt-5">
							<div class="col">
								<span
									class="btn border-0 border-bottom border-4 rounded-0 border-primary"
									id="onGoingAdTab" onclick="loadOnGoingAdTab()">진행중인 광고</span> <span
									class="btn" id="upcomingAdTab" onclick="loadUpcomingAdTab()">진행
									예정 광고</span> <span class="btn" id="expiredAdTab"
									onclick="loadExpiredAdTab()">종료된 광고</span>
							</div>
						</div>
						<div class="row my-2 mx-2">
							<div class="col px-0">
								<div class="table-responsive">
									<table class="table align-middle table-bordered text-nowrap">
										<thead>
											<tr>
												<th scope="col">상품번호</th>
												<th scope="col">상품썸네일</th>
												<th scope="col">광고종류</th>
												<th scope="col">상품명</th>
												<th scope="col">판매가</th>
												<th scope="col">할인율</th>
												<th scope="col">광고시작일</th>
												<th scope="col">광고종료일</th>
											</tr>
										</thead>
										<tbody class="table-group-divider" id="adProductList">

											<c:forEach items="${adProductDataList }" var="adProductData">
												<tr>

													<td>${adProductData.adProductDto.product_no }</td>
													<td class="col-1"><img
														src="/uploadFiles/productThumbnailImg/${adProductData.productDto.product_thumbnail }"
														class="w-100"></td>
													<td>${adProductData.productDto.product_name }</td>
													<td>${adProductData.adCategoryDto.ad_category_name}</td>
													<td>${adProductData.productDto.product_price}</td>
													<td>${adProductData.productDto.product_discount_rate}</td>
													<td><fmt:formatDate
															value="${adProductData.adProductDto.ad_product_start_date}"
															pattern="yyyy.MM.dd" /></td>
													<td><fmt:formatDate
															value="${adProductData.adProductDto.ad_product_end_date}"
															pattern="yyyy.MM.dd" /></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-2"></div>
		</div>
	</div>


	<script type="text/javascript">
	
	function loadAdProductTable(response){
		const adProductList=document.getElementById('adProductList');
		adProductList.innerHTML='';
    	
    	for(adProductData of response){

    		const tr = document.createElement("tr");

    	    const productNoTd = document.createElement("td");
    	    productNoTd.textContent = adProductData.adProductDto.product_no;
    	    tr.appendChild(productNoTd);

    	    const imgTd = document.createElement("td");
    	    imgTd.classList.add("col-1");
    	    const img = document.createElement("img");
    	    img.src = "/uploadFiles/productThumbnailImg/"+adProductData.productDto.product_thumbnail;
    	    img.className = "w-100";
    	    imgTd.appendChild(img);
    	    tr.appendChild(imgTd);

    	    const productNameTd = document.createElement("td");
    	    productNameTd.textContent = adProductData.productDto.product_name;
    	    tr.appendChild(productNameTd);

    	    const categoryTd = document.createElement("td");
    	    categoryTd.textContent = adProductData.adCategoryDto.ad_category_name;
    	    tr.appendChild(categoryTd);

    	    const priceTd = document.createElement("td");
    	    priceTd.textContent = adProductData.productDto.product_price;
    	    tr.appendChild(priceTd);

    	    const discountRateTd = document.createElement("td");
    	    discountRateTd.textContent = adProductData.productDto.product_discount_rate;
    	    tr.appendChild(discountRateTd);

    	    const startDateTd = document.createElement("td");
    	    startDateTd.textContent = new Date(adProductData.adProductDto.ad_product_start_date).toLocaleDateString();
    	    tr.appendChild(startDateTd);

    	    const endDateTd = document.createElement("td");
    	    endDateTd.textContent = new Date(adProductData.adProductDto.ad_product_end_date).toLocaleDateString();
    	    tr.appendChild(endDateTd);

    	    adProductList.appendChild(tr);

    		
    	}
    	
    	
    	
	}
	
	
	
	function loadOnGoingAdTab() {
		
		const onGoingAdTab=document.getElementById("onGoingAdTab");
		if (!onGoingAdTab.classList.contains('border-bottom')) {
			onGoingAdTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const upcomingAdTab = document.getElementById("upcomingAdTab");
		if (upcomingAdTab.classList.contains('border-bottom')) {
			upcomingAdTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const expiredAdTab = document.getElementById("expiredAdTab");
		if (expiredAdTab.classList.contains('border-bottom')) {
			expiredAdTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		
		
		const xhr = new XMLHttpRequest();
		
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
            	const response = JSON.parse(xhr.responseText);
            	loadAdProductTable(response.adProductDataList);
            		    
            }
        }

	
        xhr.open("get", "./getOngoingAd");
        xhr.send();
		
	}
	
	function loadUpcomingAdTab() {
		
		const onGoingAdTab=document.getElementById("onGoingAdTab");
		if (onGoingAdTab.classList.contains('border-bottom')) {
			onGoingAdTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const upcomingAdTab = document.getElementById("upcomingAdTab");
		if (!upcomingAdTab.classList.contains('border-bottom')) {
			upcomingAdTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const expiredAdTab = document.getElementById("expiredAdTab");
		if (expiredAdTab.classList.contains('border-bottom')) {
			expiredAdTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const xhr = new XMLHttpRequest();
		
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
            	const response = JSON.parse(xhr.responseText);
            	loadAdProductTable(response.adProductDataList);
            		    
            }
        }

	
        xhr.open("get", "./getUpcomingAd");
        xhr.send();
		
	}
	
	
	function loadExpiredAdTab() {
		const onGoingAdTab=document.getElementById("onGoingAdTab");
		if (onGoingAdTab.classList.contains('border-bottom')) {
			onGoingAdTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const upcomingAdTab = document.getElementById("upcomingAdTab");
		if (upcomingAdTab.classList.contains('border-bottom')) {
			upcomingAdTab.classList.remove('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const expiredAdTab = document.getElementById("expiredAdTab");
		if (!expiredAdTab.classList.contains('border-bottom')) {
			expiredAdTab.classList.add('border-0', 'border-bottom', 'border-4', 'rounded-0', 'border-primary');
		}
		
		const xhr = new XMLHttpRequest();
		
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
            	const response = JSON.parse(xhr.responseText);
            	loadAdProductTable(response.adProductDataList);
            		    
            }
        }

	
        xhr.open("get", "./getExpiredAd");
        xhr.send();
		
	}
	
	function formatDate(date) {
		  const year = date.getFullYear();
		  const month = String(date.getMonth() + 1).padStart(2, '0');
		  const day = String(date.getDate()).padStart(2, '0');
		  return year+"."+month+"."+day;
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>