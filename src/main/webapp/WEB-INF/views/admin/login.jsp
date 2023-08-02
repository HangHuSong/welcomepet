<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<style>
@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');

	#adminLogo{
		height: 70px;
		width: auto;
	}
	body{
		font-family: "NanumSquare";
	}
</style>
<body>
    <div class="container">
    	<pre>



  
  
  
  

        </pre>
        <div class="row mt-5">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="row mb-2">
                    <div class="col text-center">
                        <h1><img id="adminLogo" src="/welcomepet/resources/img/adminLogo.png"></h1>
                    </div>
                </div>
                <div class="row mb-4 text-center">
                	<div class="col-3"></div>
                	<div class="col-6 align-items-center fs-4 fw-bold rounded-4 text-white d-flex justify-content-center" style="background-color: black; height: 40px">
                		관리자 로그인
                	</div>
                </div>
                <div class="row">
                	<div class="col-2"></div>
                	<div class="col-8">
                		<form action="./loginProcess" method="post">
                            <div class="mb-2">
                                <input type="text" class="form-control" name="emp_no" placeholder="사원번호">
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" name="emp_pw" placeholder="비밀번호">
                            </div>
                            <div class="row mt-2">
                            	<div class="col d-grid">
                            		<button class="btn btn-dark">로그인</button>
                            	</div>
                            </div>
                        </form>
                	</div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>