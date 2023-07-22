<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
    function getBizList() {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                const bizList = response.bizList;
                const bizListBox = document.getElementById("bizListBox");

                // 기존 행들 제거
                bizListBox.innerHTML = "";

                // 각 판매자 정보를 테이블 행으로 생성
                for (biz of bizList) {
                    const tr = document.createElement("tr");

                    const td1 = document.createElement("td");
                    const a1 = document.createElement("a");
                    a1.href = "./bizDetail?biz_no=" + biz.bizDto.biz_no;
                    a1.className = "text-decoration-none text-dark";
                    a1.innerText = biz.bizDto.biz_no;
                    td1.appendChild(a1);
                    tr.appendChild(td1);

                    const td2 = document.createElement("td");
                    const a2 = document.createElement("a");
                    a2.href = "./bizDetail?biz_no=" + biz.bizDto.biz_no;
                    a2.className = "text-decoration-none text-dark";
                    a2.innerText = biz.bizDto.biz_store_name;
                    td2.appendChild(a2);
                    tr.appendChild(td2);

                    const td3 = document.createElement("td");
                    const a3 = document.createElement("a");
                    a3.href = "./bizDetail?biz_no=" + biz.bizDto.biz_no;
                    a3.className = "text-decoration-none text-dark";
                    a3.innerText = biz.bizDto.biz_id;
                    td3.appendChild(a3);
                    tr.appendChild(td3);

                    const td4 = document.createElement("td");
                    const a4 = document.createElement("a");
                    a4.href = "./bizDetail?biz_no=" + biz.bizDto.biz_no;
                    a4.className = "text-decoration-none text-dark";
                    a4.innerText = biz.bizStatusDto.biz_status_name;
                    td4.appendChild(a4);
                    tr.appendChild(td4);

                    bizListBox.appendChild(tr);
                }
            }
        };

        xhr.open("get", "./getBizList");
        xhr.send();
    }

    // 페이지 로드 시 Ajax 요청 수행
    window.addEventListener("DOMContentLoaded", function() {
		getBizList();
	});
</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<%@ include file="../common/adminTab.jsp"%>
			<div class="col">
				<div class="row">
					<div class="col">
						<%@ include file="../common/adminHead.jsp"%>
					</div>
				</div>
				<div class="col ms-5">
					<div class="row mt-5">
						<div class="col-2">
							<select name="searchType" class="form-select">
								<option value="customer_no" selected="selected">IDX</option>
								<option value="customer_nickname">브랜드명</option>
								<option value="customer_phone">연락처</option>
							</select>
						</div>
						<div class="col-8">
							<input name="searchWord" type="text" class="form-control">
						</div>
						<div class="col d-grid">
							<button class="btn btn-secondary">검색</button>
						</div>
					</div>
					<div class="row mt-3"></div>
					<div class="row mt-3">
						<div class="col">
							<table class="table table-hover text-center">
								<thead class="table-dark">
									<tr>
										<th scope="col">IDX</th>
										<th scope="col">브랜드명</th>
										<th scope="col">사업자번호</th>
										<th scope="col">입점 상태</th>
									</tr>
								</thead>
								<tbody id="bizListBox">
								</tbody>
							</table>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<li class="page-item disabled"><a class="page-link">&lt;</a>
									</li>
									<li class="page-item active"><a class="page-link" href="#">1</a>
									</li>
									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
