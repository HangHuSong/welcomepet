<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BackOffice</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
.sidebar {
	height: 100vh;
	background-color: #f8f9fa;
	padding-top: 20px;
}

</style>
</head>

<body>
	<div class="container">
		<%@ include file="../common/adminHead.jsp" %>
		<div class="row">
			<%@ include file="../common/adminTab.jsp" %>
			<div class="col-1"></div>
			<div class="col-9">
				<pre>
				
				<input type="hidden" name="cs_inquiry_no" value="${map.csInquiryDto.cs_inquiry_no}">
				</pre>
				<h4>${map.csInquiryDto.cs_inquiry_title}</h4>
				<br>
				<p>${map.csInquiryDto.cs_inquiry_context}</p>
				<br>
				<h6>${map.customerDto.customer_nickname}</h6>
				<h6 class="text-end"><fmt:formatDate value="${map.csInquiryDto.cs_inquiry_date}" pattern="yy.MM.dd-HH:mm:ss"/></h6>
				<br>
				<br>
					<c:if test="${map.csInquiryDto.cs_inquiry_status > 0}">
						<div class="row">
							<div class="col-8">
								${map.csInquiryReplyDto.cs_inquiry_reply_context}
							</div>
							<div class="col text-end">
						        <fmt:formatDate value="${map.csInquiryReplyDto.cs_inquiry_reply_date}" pattern="yy.MM.dd-HH:mm:ss"/>
							</div>
						</div>
					</c:if>
					<c:if test="${map.csInquiryDto.cs_inquiry_status eq 0}">
						<form action="writeReply" method="post">
							<input type="hidden" name="cs_inquiry_no" value="${map.csInquiryDto.cs_inquiry_no}">
							<div class="row">
								<div class="col">
									<textarea name="cs_inquiry_reply_context" rows="10" cols="10" class="form-control"></textarea>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col text-end">
									<button class="btn btn-primary">등록</button>
								</div>
							</div>
						</form>
					</c:if>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>

</html>