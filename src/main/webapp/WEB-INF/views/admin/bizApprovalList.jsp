<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BackOffice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
        crossorigin="anonymous">
    <style>
        

        .img-thumbnail{
        	width: 120px;
        	height: 120px;
        }
        #bizDoc{
        	width: 490px;
        	height: auto;
        }
       
    </style>
</head>

<body>
    <div class="container">
        
            <div class="row">
                <%@ include file="../common/adminTab.jsp" %>
					
                    <div class="col-9">
                    	<%@ include file="../common/adminHead.jsp" %>
                        <div class="container mt-5">
					        <h2 class="mt-4 mb-4 fw-bold text-center">Biz 입점 승인 관리</h2>
					            <div class="row text-center ms-5 mt-1 bg-light font-weight-bold py-2 rounded-top border">
					                <div class="col-2">사업자등록증</div>
					                <div class="col">사업자등록번호</div>
					                <div class="col">판매자 전달사항</div>
					                <div class="col">관리자 메모</div>
					                <div class="col-2"></div>
					            </div>
					            <c:forEach items="${list}" var="i">
					            <form action="./bizApproval?biz_approval_request_no=${i.bizApprovalRequestDto.biz_approval_request_no}" method="post">
					            	<input type="hidden" name="biz_approval_request_no" ${i.bizApprovalRequestDto.biz_approval_request_no}>
					            	<input type="hidden" name="biz_approval_request_no" ${i.bizApprovalRequestDto.biz_no}>
					            	<div class="row align-items-center border ms-5 py-2">
						                <div class="col-2 d-flex justify-content-center align-items-center">
						                    <img src="/uploadFiles/bizDocument/${i.bizApprovalRequestDto.biz_approval_request_document}" class="img-thumbnail" 
						                    id="biz_approval_request_document" data-bs-toggle="modal" data-bs-target="#businessLicenseModal-${i.bizApprovalRequestDto.biz_approval_request_no}"> 
						                </div>
						                <div class="col d-flex align-items-center justify-content-center">${i.bizApprovalRequestDto.biz_approval_request_brn}</div>
						             
						                <div class="col">
						                    <textarea class="form-control align-items-center justify-content-center" style="height: 100px;" name="biz_approval_message"></textarea>
						                </div>
						                <div class="col">
						                    <textarea class="form-control " style="height: 100px;" name="biz_approval_emp_memo"></textarea>
						                </div>
						                <div class="col-auto  align-items-center justify-content-center">
						                    <div class="row">
							                    <div class="col mb-2">
						                        	<button name="buttonType" value="accept" class="btn px-4 btn-outline-dark py-0" >승인</button>
							                    </div>
							                </div>    
						                    <div class="row">
							                    <div class="col ">
						                        	<button name="buttonType" value="reject" class="btn px-4 btn-dark py-0" >거절</button>
							                	</div>
						                    </div>
						                    
						                </div>
					           		</div>
					            </form>
					            </c:forEach>
					            
					            
					            <div class="row mt-4">
									<div class="col">
										<nav aria-label="...">
											<ul class="pagination justify-content-center">
												<li class="page-item disabled"><a class="page-link">&lt;</a>
												</li>
												<li class="page-item active"><a class="page-link" href="#">1</a>
												</li>
												<li class="page-item"><a class="page-link" href="#">&gt;</a>
												</li>
											</ul>
										</nav>
									</div>
								</div>
					    </div>
                    </div>
            </div>
    </div>
   <c:forEach items="${list}" var="i">
    <div class="modal fade" id="businessLicenseModal-${i.bizApprovalRequestDto.biz_approval_request_no}" tabindex="-1" aria-labelledby="businessLicenseModalLabel-${i.bizApprovalRequestDto.biz_approval_request_no}" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="businessLicenseModalLabel-${i.bizApprovalRequestDto.biz_approval_request_no}">첨부파일</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center px-0">
                    <!-- Display the clicked image in its original size -->
                    <img id="bizDoc" src="/uploadFiles/bizDocument/${i.bizApprovalRequestDto.biz_approval_request_document}">
                </div>
            </div>
        </div>
    </div>
</c:forEach>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>