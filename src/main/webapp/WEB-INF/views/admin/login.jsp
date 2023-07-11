<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <div class="container">
    	<pre>








        </pre>
        <div class="row mt-5">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="row mb-5">
                    <div class="col text-center">
                        <h1>Dogmin</h1>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <form action="./loginProcess" method="post">
                            <div class="mb-3">
                                <label class="form-label">사원번호</label>
                                <input type="text" class="form-control" name="emp_no">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">비밀번호</label>
                                <input type="password" class="form-control" name="emp_pw">
                            </div>
                            <button class="btn btn-primary">로그인</button>
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