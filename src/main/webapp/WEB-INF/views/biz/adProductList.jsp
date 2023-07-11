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
	<div class="container overflow-auto">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-2"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10">
				<div class="row">
					<div class="col table-responsive">
						<table class="table align-middle  table-bordered">
							<thead>
								<tr>
									<th scope="col"><input class="form-check-input"
										type="checkbox"></th>
									<th scope="col">상품번호</th>
									<th scope="col">상품썸네일</th>
									<th scope="col">광고종류</th>
									<th scope="col">상품명</th>
									<th scope="col">판매가</th>
									<th scope="col">할인율</th>
									<th scope="col">광고시작일</th>
									<th scope="col">광고종료일</th>
									<th scope="col">연장하기</th>
								</tr>
							</thead>
							<tbody class="table-group-divider">

								<c:forEach items="${adProductDataList }" var="adProductData">
									<tr>
										<th scope="row"><input class="form-check-input"
											type="checkbox" value="${adProductData.adProductDto.ad_product_no }"></th>
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
										<td><button class="btn btn-primary extendButton">연장하기</button>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script type="text/javascript">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>