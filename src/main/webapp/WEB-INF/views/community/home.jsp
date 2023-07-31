<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp 임시페이지</title>
</head>
<body>
<%-- mobileStyle --%>
  <jsp:include page="../common/topNaviCommu.jsp"></jsp:include>
<%-- ----------- --%>  

	<div class="container text-center">
		<h1>HOME : 임시</h1>
		${customerUser.customer_nickname}님
	</div>

<%-- mobileStyle --%>
  <jsp:include page="../common/bottomTabCommu.jsp"></jsp:include>
<%-- ----------- --%>  
</body>
</html>