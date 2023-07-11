<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
        .nav-link {
            color: black;
            text-decoration: none;
        }

        .nav-link:hover {
            color: gray;
        }


        #header {
            height: 100px;
            background-color: gray;
        }

        #logo {
            color: white;
            height: 100px;
            display: flex;
            align-items: center;
        }

        .a {
            color: white;
        }
    </style>
    <div class="col-2" id="sidebar">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    
                    <div class="row mt-5">
                        <div class="col">
                            <h4 class="my-3">고객 관리</h4>
                            <a class="nav-link" href="./customerList">고객 조회</a>
                            <a class="nav-link" href="./coupon">쿠폰 발급</a>
                            <a class="nav-link" href="./inquiryList">1대1 문의</a>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <h4 class="my-3">Biz 관리</h4>
                            <a class="nav-link" href="./bizList">biz 조회</a>
                            <a class="nav-link" href="./orderList">주문 조회</a>
                            <a class="nav-link" href="./bizApprovalList">입점 관리</a>
                            <a class="nav-link" href="./settlementList">정산 관리</a>
                        </div>
                    </div>
                    
                    <div class="row mt-3">
                        <div class="col">
                            <h4 class="my-3">커뮤니티 관리</h4>
                            <a class="nav-link" href="./showDogPostList">일반 게시판</a>
                            <a class="nav-link" href="#">스냅 게시판</a>
                            <a class="nav-link" href="./customerReport">신고글 관리</a>
                        </div>
                    </div>
                    
                    <c:if test="${!empty sessionUser}">
	                    <div class="row mt-5">
	                    	<div class="col">
	                    		<a class="nav-link" href="./logoutProcess">로그아웃</a>
	                    	</div>
	                    </div>
                    </c:if>
                </div>
            </div>
