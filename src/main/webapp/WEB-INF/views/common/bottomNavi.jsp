<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

 <div class="row mb-4" >
	<div class="col">
	<div class="navbar navbar-dark bg-white fixed-bottom border-top" >
		<div class="col text-center">
			<a class="btn bi bi-microsoft text-secondary "
				href="/welcomepet/community/showDogPostList" role="button""> </a>
		</div>
		<div class="col ">
			<a class="btn bi bi-chat-square-text" role="button"
				href="/welcomepet/snap/main"> </a>
		</div>
		<div class="col ">
			<a class="btn bi bi-house" role="button"
			href="/welcomepet/board/main"> </a>
		</div>
		<c:choose>
			<c:when test="${!empty customerUser }">
		<div class="col ">
			<a class="btn bi bi-heart" role="button" href="/welcomepet/customer/wishList"> </a>
		</div>
		<div class="col ">
			<a class="btn bi bi-person-circle text-secondary  " role="button"
				href="/welcomepet/customer/my"> </a>
		</div>
		</c:when>
		<c:otherwise>
		<div class="col ">
			<a class="btn bi bi-heart" role="button" href="/welcomepet/customer/login"> </a>
		</div>
		<div class="col ">
			<a class="btn bi bi-person-circle text-secondary  " role="button"
				 href="/welcomepet/customer/login"> </a>
		</div>
		</c:otherwise>
		</c:choose>
	</div>
	</div>
</div>


