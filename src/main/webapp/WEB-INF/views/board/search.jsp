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
<title>검색</title>
<style>
.recent_search {
	font-size: 0.8em;
	background-color: rgb(244, 247, 250);
	border-radius: 1rem;
}

.reco_search {
	font-size: 0.8em;
	border-radius: 1rem;
	margin: 0;
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
					<input class="form-control me-2 fw-bold" type="search"
						placeholder="검색어를 입력하세요" name="searchWord" aria-label="Search">
				</form>
			</div>
			<div class="col-1"></div>
		</div>
	
		<div class="row mt-2">
			<div class="col">
				<img src="/uploadFiles/WelcomePet/banner/banner1.png"
					style="width: 100%;" alt="...">
			</div>
		</div>
	<c:if test="${not empty customerInfo}">
		<div class="row mt-3">
			
			<div class="col  ps-4 pe-3">
				<div class="row fw-bold">최근검색어</div>
				<div class="row mt-2 text-center">

					<c:forEach items="${searchInfo}" var="map">
						<div class="col-3 pe-0">
							<a class="btn btn-outline-secondary fw-bold recent_search"
								role="button"
								href="./searchProduct?searchWord=${map.searchInfo.search_content}">
								${map.searchInfo.search_content} </a>
						</div>
					</c:forEach>

				</div>
			</div>
			
		</div>
		</c:if>
		<div class="row mt-3">
			<div class="col  ps-4 pe-3">
				<div class="row fw-bold">추천 검색어</div>
				<div class="row mt-2 text-center">
					<div class="col-3 pe-0">
						<a class="btn btn-outline-primary fw-bold reco_search"
							role="button" href="./searchProduct?searchWord=잇츄"> 잇츄</a>
					</div>
					<div class="col-3 pe-0">
						<a class="btn btn-outline-primary fw-bold reco_search"
							role="button" href="./searchProduct?searchWord=노즈워크"> 노즈워크</a>
					</div>
				</div>
			</div>
		
		</div>
		<div class="row mt-3"></div> 
		
		<div class="row mt-3">
	
			<div class="col  ps-4 pe-3">
				<div class="row fw-bold">인기 검색어</div>
				<div class="row mt-3 "> </div>
				<div class="row" style="font-size: 0.9em;">
					<div class="col-6">
					<span class="fw-bold">1.</span>
					<span class="ps-2">하림</span>
					</div>
					<div class="col-6">
					<span class="fw-bold">2.</span>
					<span class="ps-2">잇츄</span>
					</div>
				</div>
			</div>
	
		</div>


		<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>