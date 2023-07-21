<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>csBoard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>

</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<%@ include file="../common/adminTab.jsp" %>
			<div class="col">
				<div class="row">
					<div class="col">
						<%@ include file="../common/adminHead.jsp"%>
					</div>
				</div>
				<div class="col ms-5">
					<form action="./inquiryList" method="get">
		                <div class="row mt-5">
		                	<div class="col-2">
		                		<select name="searchType" class="form-select">
		                			<option value="cs_inquiry_no" selected="selected">IDX</option>
		                			<option value="cs_inquiry_title">제목</option>
		                		</select>
		                	</div>
		                    <div class="col-8">
		                        <input name="searchWord" type="text" class="form-control">
		                    </div>
		                    <div class="col d-grid">
		                        <button class="btn btn-secondary">검색</button>
		                    </div>
		                </div>
		            </form>
		            <div class="row mt-4">
                    <div class="col">
                        <table class="table table-hover text-center">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">IDX</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">처리상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="list">
	                                <tr>
							            <td>${list.csInquiryDto.cs_inquiry_no }</td>
							            <td>
							            	<a href="./inquiryReply?cs_inquiry_no=${list.csInquiryDto.cs_inquiry_no}">${list.csInquiryDto.cs_inquiry_title }</a>
						            	</td>
						            	<c:choose>
							            	<c:when test="${list.csInquiryDto.cs_inquiry_status eq 0}">
							            		<td class="text-danger"><i class="bi bi-clipboard-x"></i> 처리 대기</td>
							            	</c:when>
							            	<c:otherwise>
							            		<td class="text-success"><i class="bi bi-clipboard-check"></i> 처리 완료</td>
							            	</c:otherwise>
										</c:choose>
							        </tr>	
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-12 mt-4">
			        <nav aria-label="Page navigation example">
			            <ul class="pagination justify-content-center">
			                <c:choose>
			                    <c:when test="${startPage <= 1}">
			                        <li class="page-item disabled">
			                        	<a class="page-link" href="./inquiryList?page=${startPage-1}">&lt;</a>
		                        	</li>
			                    </c:when>
			                    <c:otherwise>
			                        <li class="page-item">
			                        	<a class="page-link" href="./inquiryList?page=${startPage-1}${searchQueryString}">&lt;</a>
		                        	</li>
			                    </c:otherwise>
			                </c:choose>
			                
			                <c:forEach begin="${startPage}" end="${endPage}" var="index">
			                    <c:choose>
			                        <c:when test="${index == currentPage}">
			                            <li class="page-item active">
			                                <a class="page-link" href="./inquiryList?page=${index}${searchQueryString}">${index}</a>
			                            </li>
			                        </c:when>
			                        <c:otherwise>
			                            <li class="page-item"><a class="page-link" href="./inquiryList?page=${index}${searchQueryString}">${index}</a></li>
			                        </c:otherwise>
			                    </c:choose>
			                </c:forEach>
			                <c:choose>
			                    <c:when test="${endPage >= totalPage}">
			                        <li class="page-item disabled"><a class="page-link" href="./inquiryList?page=${endPage+1}">&gt;</a></li>
			                    </c:when>
			                    <c:otherwise>
			                        <li class="page-item">
			                            <a class="page-link" href="./inquiryList?page=${endPage+1}${searchQueryString}">&gt;</a>
			                        </li>	
			                    </c:otherwise>
			                </c:choose>
			            </ul>
			        </nav>
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