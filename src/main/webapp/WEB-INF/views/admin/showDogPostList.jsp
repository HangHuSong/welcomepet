<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
/* 링크 스타일 제거 */
    a {
        color: inherit;
        text-decoration: none;
    }
    
</style>
<script type="text/javascript">
	function formatDate(dateString) {
		  const date = new Date(dateString);
		  const year = String(date.getYear() - 100).padStart(2, '0');
		  const month = String(date.getMonth() + 1).padStart(2, '0');
		  const day = String(date.getDate()).padStart(2, '0');
		  const hours = String(date.getHours()).padStart(2, '0');
		  const minutes = String(date.getMinutes()).padStart(2, '0');
	
		  return year + "." + month + "." + day + "-" + hours + ":" + minutes;
	}
	
	function getShowDogPostList() {
	    const xhr = new XMLHttpRequest();
	
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            const response = JSON.parse(xhr.responseText);
	            const postListBox = document.getElementById("postListBox");
	            const postList = response.getShowDogPostList;

	            postListBox.innerHTML = "";

	            for (list of postList) {
	                const tr = document.createElement("tr");

	                const td1 = document.createElement("td");
	                td1.innerText = list.showDogPostDto.show_dog_post_no;
	                tr.appendChild(td1);

	                const td2 = document.createElement("td");
	                const a = document.createElement("a");
	                a.href = "./showDogPostDetail?show_dog_post_no=" + list.showDogPostDto.show_dog_post_no;
	                a.innerText = list.showDogPostDto.show_dog_post_title;
	                td2.appendChild(a);
	                tr.appendChild(td2);

	                const td3 = document.createElement("td");
	                td3.innerText = list.customerDto.customer_nickname;
	                tr.appendChild(td3);

	                const td4 = document.createElement("td");
	                td4.innerText = formatDate(list.showDogPostDto.show_dog_post_reg_date);
	                tr.appendChild(td4);

	                postListBox.appendChild(tr);
	            }
	        }
	    };
	
	    xhr.open("get", "./getShowDogPostList");
	    xhr.send();
	}
	window.addEventListener("DOMContentLoaded", function() {
		getShowDogPostList();
	});
</script>
</head>
<body>
	<div class="container">
		
		<div class="row">
			<%@ include file="../common/adminTab.jsp" %>
			
			<div class="col-9">
				<div class="row">
					<div class="col">
						<%@ include file="../common/adminHead.jsp" %>
					</div>
				</div>
				<div class="row ms-5 mt-5">
                	<div class="col-2">
                		<select name="searchType" class="form-select">
                			<option value="customer_no" selected="selected">IDX</option>
                			<option value="customer_nickname">제목</option>
                			<option value="customer_phone">작성자</option>
                		</select>
                	</div>
                    <div class="col-8">
                        <input name="searchWord" type="text" class="form-control">
                    </div>
                    <div class="col d-grid">
                        <button class="btn btn-secondary">검색</button>
                    </div>
                </div>
				
				<div class="row ms-5 mt-3">
					<div class="col">
						<table class="table text-center">
						    <thead class="table-dark">
						        <tr>
						            <th scope="col">IDX</th>
						            <th scope="col">제목</th>
						            <th scope="col">작성자</th>
						            <th scope="col">작성일</th>
						        </tr>
						    </thead>
						    <tbody id="postListBox">
						    </tbody>
						</table>
					</div>
				</div>
				
				<div class="row ms-5">
                	<div class="col">
                		<nav aria-label="...">
						    <ul class="pagination justify-content-center">
						        <li class="page-item disabled">
						            <a class="page-link">&lt;</a>
						        </li>
						        <li class="page-item active">
						        	<a class="page-link" href="#">1</a>
					        	</li>
						        <li class="page-item" aria-current="page">
						            <a class="page-link" href="#">2</a>
						        </li>
						        <li class="page-item">
						        	<a class="page-link" href="#">3</a>
					        	</li>
						        <li class="page-item">
						            <a class="page-link" href="#">&gt;</a>
						        </li>
						    </ul>
						</nav>
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