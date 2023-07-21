<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');

		body{
			font-family: 'NanumSquare', sans-serif;
		}
        .nav-link {
            color: #dcdcdc;
            text-decoration: none;
        }
        .nav-link:hover {
            color: black;
        }
        a {
            color: inherit;
        	text-decoration: none;
        }
        
        #sidebar {
        	color: white;
        	height: 200vh;
        	background-color: #3c3a3e;
        }
        
        #logo{
        	height: 60px;
        }
    </style>
    <div class="col-2" id="sidebar">
                <div class="ms-2 nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	    			<div class="row mt-3">
	    				<div class="col">
	    					<img id="logo" src="/welcomepet/resources/img/adminLogo.png">
	    				</div>
	    			</div>
                    <div class="row mt-3">
                        <div class="col">
                            <h5 class="my-3"><span class="ms-2">고객 관리</span></h5>
                            <a class="nav-link" href="./customerList"><i class="bi bi-file-person-fill"></i> 고객 조회</a>
                            <a class="nav-link" href="./coupon"><i class="bi bi-gift-fill"></i> 쿠폰 발급</a>
                            <a class="nav-link" href="./inquiryList"><i class="bi bi-clipboard"></i> 1대1 문의</a>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <h5 class="my-3">Biz 관리</h5>
                            <a class="nav-link" href="./bizList"><i class="bi bi-kanban"></i> Biz 조회</a>
                            <a class="nav-link" href="./orderList"><i class="bi bi-list-ul"></i> 주문 조회</a>
                            <a class="nav-link" href="./bizApprovalList"><i class="bi bi-check-square"></i> 입점 관리</a>
                            <a class="nav-link" href="./settlementList"><i class="bi bi-cash"></i> 정산 관리</a>
                        </div>
                    </div>
                    
                    <div class="row mt-3">
                        <div class="col">
                            <h5 class="my-3">커뮤니티 관리</h5>
                            <a class="nav-link" href="./showDogPostList"><i class="bi bi-filter-square"></i> 일반 게시판</a>
                            <a class="nav-link"><i class="bi bi-postage-heart"></i> 스냅 게시판</a>
                            <a class="nav-link" href="./customerReport"><i class="bi bi-exclamation-square"></i> 신고글 관리</a>
                        </div>
                    </div>
                    
                    <c:if test="${!empty sessionUser}">
	                    <div class="row mt-5">
	                    	<div class="col">
	                    		<a class="nav-link" href="./logoutProcess"><i class="bi bi-toggle-on"></i> 로그아웃</a>
	                    	</div>
	                    </div>
                    </c:if>
                </div>
            </div>
