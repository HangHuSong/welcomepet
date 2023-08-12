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

<style type="text/css">
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
</style>
</head>
<body>

	<div class="row text-center mt-5">
		<div class="col"></div>
		<div class="col-3 px-5 mt-5">
			<!-- 로그인정보 -->
			<div class="row mt-5">
				<div class="col pt-5">
					<img class="w-75 px-5" src="/welcomepet/resources/img/biz_logo.png">
				</div>
			</div>
			<div class="row mb-5" style="">
				<div class="col fs-5 fw-bold rounded-4 text-white"
					style="margin:10px 120px; font-family: 'GmarketSansMedium'; background-color: #198cff;">seller
					office</div>
			</div>
			<div class="row my-2">
				<!-- 아이디 -->
				<div class="col">
					<input class="form-control" name="biz_id" type="text"
						placeholder="아이디">
				</div>
			</div>
			<div class="row my-1">
				<!-- 비밀번호 -->
				<div class="col">
					<input class="form-control" name="biz_pw" type="password"
						placeholder="비밀번호">
				</div>
			</div>
			<div class="row mt-2">
				<div class="col">
					<div id="loginFailBox" class="visually-hidden text-danger">아이디와
						비밀번호를 확인해주세요</div>
				</div>
			</div>
			<div class="row my-2">
				<div class="col d-grid">
					<button class="btn text-white py-2"
						style="background-color: #198cff;"
						onclick="loginProcess()">로그인</button>
				</div>
			</div>
			<div class="row my-3">
				<div class="col border-end align-self-center">아이디 찾기</div>
				<div class="col border-end align-self-center">비밀번호 찾기</div>
				<div class="col">
					<a class="btn px-0 py-0" href="./register">회원가입</a>
				</div>
			</div>
			<div class="row my-2">
				<div class="col d-grid justify-content-center">

					<button class="btn" onclick="getAuthCode()">
						<img src="/welcomepet/resources/img/kakao_login.png">
					</button>
				</div>
			</div>

		</div>
		<div class="col"></div>
	</div>
	<script type="text/javascript">
		const urlParams = new URLSearchParams(window.location.search);
		const redirect_uri = "http://localhost:8181/welcomepet/biz/login/callback";
		let checkRedirected;
		
		function getAuthCode() {

			var requestParams = "client_id=e4a5b9e6ac9298f7e5a5085408e299b8"
			requestParams += "&redirect_uri=" + redirect_uri;
			requestParams += "&response_type=code";
			requestParams += "&prompt=login";
			
			const loginUrl = "https://kauth.kakao.com/oauth/authorize?"+requestParams;
			var popup =window.open(loginUrl, "KakaoLoginWindow", "width=500,height=700");
			
			if(popup){
				checkRedirected=setInterval(()=>{
					
					if(popup.location.href.includes(redirect_uri)){
						var code=new URLSearchParams(popup.location.search).get('code');
						getToken(code);
            			popup.close();
            			clearInterval(checkRedirected);
					}
				
				},100);	
			}
			
		}
		
		
		
		function getToken(code) {
			console.log(code);
			var requestParams = "grant_type=authorization_code";
			requestParams += "&client_id=e4a5b9e6ac9298f7e5a5085408e299b8";
			requestParams += "&redirect_uri=http://localhost:8181/welcomepet/biz/login/callback";
			requestParams += "&code=" + code;
			

			console.log(requestParams);
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					getEmail(response.access_token);
				}
			}

			xhr.open("post", "https://kauth.kakao.com/oauth/token");
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send(requestParams);
		}
		
		function getEmail(access_token) {
			console.log(access_token);
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					kakaoLoginProcess(response);
				}
			}

			xhr.open("post", "https://kapi.kakao.com/v2/user/me");
			xhr.setRequestHeader("Authorization", "Bearer " + access_token);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send('property_keys=["kakao_account.email"]');
		}

		function kakaoLoginProcess(response) {
			var bizDto = "biz_email=" + response.kakao_account.email
					+ "&biz_id=" + response.id;

			
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					window.location.href = "http://localhost:8181/welcomepet/biz/main";
				}
			}

			xhr.open("post", "./kakaoLoginProcess");
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send(bizDto);
		}

		
		function loginProcess(){
			const bizIdInput=document.querySelector('input[name="biz_id"]');
			const bizPwInput=document.querySelector('input[name="biz_pw"]');
			
			var bizDto="biz_id="+bizIdInput.value+"&biz_pw="+bizPwInput.value;
			
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					const response=JSON.parse(xhr.responseText);
					if (response.result === 'fail') {
						const loginFailBox = document.getElementById("loginFailBox");
						if (loginFailBox.classList.contains('visually-hidden')) {
							loginFailBox.classList.remove('visually-hidden');
						}
					}else{
						window.location.href="./main";
					}
				}
			}

			xhr.open("post", "./loginProcess");
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send(bizDto);
		}
		
		
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>