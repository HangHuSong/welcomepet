<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script >

	 function checkValueAndSubmit() {
		
		 const userIdBox = document.getElementById("customerId");
		 
		 const idValue = userIdBox.value;
		 
		 if(idValue == "") {
			 alert("아이디를 입력해주세요");
			 return ;
		 }
		 if(idChecked == false) {
			 alert("아이디 중복확인을 해주세요");
			 return;
		 }
		 
		 const userPwBox = document.getElementById("customerPw");
		 const userPwConfirmBox = document.getElementById("customerPwConfirm");
		 
		 if(userPwBox.value != userPwConfirmBox.value) {
			 
			 alert("비밀번호 확인 해주세요");
			 userPwBox.value = "";
			 userPwConfirmBox.value = "";
			 userPwBox.focus();
			 return ;
		 }
		
			 
		const frm = document.getElementById("frm");
		 frm.submit();
	}
	 
	 let idChecked = false;
	 
	 function checkCustomerId() {
		
		 const customerIdValue = document.getElementById("customerId").value;
		 
		 const xhr = new XMLHttpRequest();
		 xhr.onreadystatechange = function () {
			 if(xhr.readyState == 4 && xhr.status == 200 ) {
				 
				 	
				 const response = JSON.parse(xhr.responseText); 
				 
				 if(response.data == true) {
					 
					 alert("이미 존재하는 아이디입니다.");
					 idChecked = false;
					 
				 }else {
					 alert("사용 가능한 아이디 입니다.");
					 idChecked = true;
				 }
				 
			 }
		 };
		 
		 xhr.open("get", "./existsCustomerId?customerId=" + customerIdValue);
		 xhr.send();
	 }

</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

	<div class="container  justify-content-center">
		<div class="row">
			<div class="col-2"></div>
			<div class="col mt-4">


				<div class="row text-center mt-4">
					<div class="col">
						<h5>회원가입</h5>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<hr class="m-0 mb-2">
					</div>
				</div>
				<form action="./registProcess" method="post" id="frm">
					<div class="row mt-3">
						<div class="col-10 ">
						<input id="customerId" class="form-control" type="text" name="customer_id" placeholder="아이디">
						<div class="col-2">
						<button type="button" class="btn btn-sm btn-secondary" onclick="checkCustomerId()"> 중복확인</button></div>
						<div id="idCheckAlert" ></div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col ">
							<input class="form-control" type="password" id="customerPw"
								name="customer_pw" placeholder="비밀번호">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col ">
							<input class="form-control" type="password" id="customerPwConfirm"
								placeholder="비밀번호확인">
						</div>
					</div>					
					<div class="row">
						<div class="col mt-3">
							<input class="form-control" type="text"
								name="customer_name" placeholder="이름">
						</div>
					</div>
					<div class="row">
						<div class="col mt-3">
							<input class="form-control" type="text"
								name="customer_nickname" placeholder="닉네임">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col ">
							gender : <input type="radio" name="customer_gender" value="M">남
							<input type="radio" name="customer_gender" value="F">여
						</div>
					</div>
					<div class="row">
						<div class="col mt-3">
							<input class="form-control" type="date"
								name="customer_birth">
						</div>
					</div>
					<div class="row">
						<div class="col mt-3 ">
							<input class="form-control" type="text"
								name="customer_phone" placeholder="전화번호">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col"></div>
						<div class="col-6">
							<input type="button" value="가입" onclick="checkValueAndSubmit()">
							<button class="btn btn-primary">회원가입</button>
						</div>
						<div class="col"></div>
					</div>
				</form>
			</div>
			<div class="col-2"></div>

		</div>


	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>