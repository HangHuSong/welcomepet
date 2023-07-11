<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script>
	
</script>


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">어서오개</div>
			<div class="col">판매자 입점 신청</div>
		</div>
		<div class="row text-center my-5" id="bizInputFormBox">
			<div class="col-3"></div>
			<div class="col border py-4">
				<div class="row my-2 border-bottom">
					<div class="col fs-4">
						<i class="bi bi-1-circle-fill"></i>사업자 정보 입력
					</div>
				</div>
				<div class="row my-2">
					<div class="col">사업자 등록 번호</div>
					<div class="col">
						<input type="text" class="form-control"
							name="biz_approval_request_brn">
					</div>
				</div>
				<div class="row my-2">
					<div class="col">사업자 등록 등본</div>
					<div class="col">
						<input type="file" class="form-control" name="document" onchange="saveFile(event)">
					</div>
				</div>
				<div class="row my-2">
					<div class="col">
						<button class="btn btn-primary" onclick="requestBizApproval()">입점 신청하기</button>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row text-center my-5 visually-hidden" id="bizApprovalCompleteBox">
			<div class="col-3"></div>
			<div class="col border py-4">
				<div class="row my-2">
					<div class="col fs-1">
						<i class="far fa-check-circle fa-lg"></i>
					</div>
				</div>
				<div class="row my-2">
					<div class="col fs-3">입점 신청이 완료 되었습니다.</div>
				</div>
				<div class="row my-2">
					<div class="col">입점 승인 완료 후 어서오개 판매자센터의 모든 서비스를 이용하실 수 있습니다.</div>
				</div>
				<div class="row my-2">
					<div class="col"><a class="btn btn-primary" href="./main">메인</a></div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
	<script type="text/javascript">
		const formData=new FormData();
		
		function saveFile(event){
			const file=event.target.files[0];
			formData.append('document',file);
		
		}
		
		function requestBizApproval(){
			const bizBrnInput=document.querySelector('input[name="biz_approval_request_brn"]');
			
			formData.append('biz_approval_request_brn',bizBrnInput.value);
			
			const xhr = new XMLHttpRequest();

	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	                const bizApprovalCompleteBox=document.getElementById("bizApprovalCompleteBox");
	                if(bizApprovalCompleteBox.classList.contains('visually-hidden'))
	                bizApprovalCompleteBox.classList.remove('visually-hidden');
	                
	                const bizInputFormBox=document.getElementById("bizInputFormBox");
	                if(!bizInputFormBox.classList.contains('visually-hidden')){
	                	bizInputFormBox.classList.add('visually-hidden');
	                }
	            }
	        }


	        //get
	        xhr.open("post", "./requestBizApproval");
	        xhr.send(formData);
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>