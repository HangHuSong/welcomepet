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
  <jsp:include page="../common/topNaviDefault.jsp"></jsp:include>
<%-- ----------- --%>  

	<div class="container text-center">
		<h1>HOME : 임시</h1>
<<<<<<< HEAD
		${customerUser.customer_nickname}님
=======
		${customerUser.412345customer_nickname}님
>>>>>>> 944dee18330522567eedef7449ffc9578b907c15
	</div>

<%-- mobileStyle --%>
  <jsp:include page="../common/bottomTabStyle.jsp"></jsp:include>
<%-- ----------- --%>  
</body>
</html>