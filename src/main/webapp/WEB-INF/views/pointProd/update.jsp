<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeContent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
.form-select {
	width: 50%;
}
</style>
</head>
<body>
	<h4>게시글 수정</h4>
	<form action="./updateContentProcess" method="post">
		<div class="row">
			<div class="col">작성자: ${customerUser.customer_nickname }</div>
		</div>
		<div class="row">
			<div class="col">
				카테고리:<select name="board_category_no" class="form-select"
					aria-label="Default select example">
					<option value="1" selected>일상</option>
					<option value="2">질문</option>
					<option value="3">나눔</option>
				</select>
			</div>
		</div>
		제목: <input type="text" name="board_title"
			value="${data.boardDto.board_title}"><br> 내용: <br>
		<textarea rows="10" cols="40" name="board_content">${data.boardDto.board_content}</textarea>
		<input type="hidden" name="board_no"
			value="${data.boardDto.board_no }">
		<button>글 수정</button>
	</form>
</body>
</html>