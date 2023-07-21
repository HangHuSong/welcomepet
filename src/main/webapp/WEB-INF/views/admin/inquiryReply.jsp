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



</style>
</head>

<body>
	<div class="container">
		
		<div class="row">
			<%@ include file="../common/adminTab.jsp" %>
			<div class="col">
				
					<%@ include file="../common/adminHead.jsp" %>
				
				<div class="row">
					<div class="col-3"></div>
			<div class="col-6">
				
                <div class="row my-5">
                    <div class="col-md-12 text-center">
                        <h2 class="fw-bold">1:1 문의 답변 등록하기</h2>
                    </div>
                </div>
                <form action="writeReply" method="post">
                	<input type="hidden" name="cs_inquiry_no" value="${map.csInquiryDto.cs_inquiry_no}">
                    <div class="row my-4">
                        <div class="col-md-2">
                            <label>고객 번호</label>
                        </div>
                        <div class="col-md-10">
                            <input value="${map.csInquiryDto.customer_no}" type="text" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="row my-4">
                        <div class="col-md-2">
                            <label>문의 날짜</label>
                        </div>
                        <div class="col-md-10">
                            <input value="<fmt:formatDate value="${map.csInquiryDto.cs_inquiry_date}" pattern="yyyy.MM.dd HH:mm:ss"/>" type="text" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="row my-4">
                        <div class="col-md-2">
                            <label>문의 제목</label>
                        </div>
                        <div class="col-md-10">
                            <input value="${map.csInquiryDto.cs_inquiry_title}" type="text" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="row my-4">
                        <div class="col-md-2">
                            <label>문의 내용</label>
                        </div>
                        <div class="col-md-10">
                            <textarea class="form-control" rows="5" readonly>${map.csInquiryDto.cs_inquiry_context}</textarea>
                        </div>
                    </div>
                    <div class="row my-4">
                        <div class="col-md-2">
                            <label>답변 여부</label>
                        </div>
                        <div class="col-md-10">
                        	<c:choose>
                        		<c:when test="${map.csInquiryDto.cs_inquiry_status > 0}">
                        			<input value="답변완료 / <fmt:formatDate value="${map.csInquiryReplyDto.cs_inquiry_reply_date}" pattern="yyyy.MM.dd HH:mm:ss"/> / ${map.empDto.emp_name}" type="text" class="form-control" readonly>
                        		</c:when>
                        		<c:otherwise>
                        			<input value="미처리" type="text" class="form-control" readonly>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="row my-4">
                        <div class="col-md-2">
                            <label>답변</label>
                        </div>
                        <div class="col-md-10">
                        	<c:choose>
                        		<c:when test="${map.csInquiryDto.cs_inquiry_status > 0}">
                        			<textarea name="cs_inquiry_reply_context" class="form-control" rows="5" readonly>${map.csInquiryReplyDto.cs_inquiry_reply_context}</textarea>
                        		</c:when>
                        		<c:otherwise>
                        			<textarea name="cs_inquiry_reply_context" class="form-control" rows="5"></textarea>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="row my-4">
                        <div class="col-md-12 text-center">
                        	<c:choose>
                        		<c:when test="${map.csInquiryDto.cs_inquiry_status > 0}">
                        			<a href="./inquiryList" class="btn btn-outline-dark">뒤로 가기</a>
                        			<a href="./inquiryList" class="btn btn-outline-dark">답변 수정</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a href="./inquiryList" class="btn btn-outline-dark">뒤로 가기</a>
                           			<button class="btn btn-outline-dark">답변 등록</button>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </form>
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