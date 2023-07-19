<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<div class="row">
	<div class="col">
		<nav
			class="navbar navbar-dark bg-white fixed-top fw-bold ">
			<div class="row mt-2" style="text-align: center;">
			<div class="col-2 text-center">
				<a class="btn bi bi-bell py-0 text-secondary fs-4 "
					data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
					aria-controls="offcanvasExample"> </a>
			</div>
			<div class="col-6 ps-2 ms-4" style="text-align: center;">
				<img  src="/welcomepet/resources/img/logo.png" style="height:3em; ">
			</div>
			<div class="col-1 ms-2 ps-2 text-center">
				<a class="btn bi bi-search fs-4 py-0" role="button"
					href="/welcomepet/board/search"> </a>
			</div>
			<div class="col-2 text-center">
				<a class="btn bi bi-cart2 fs-4 py-0" role="button"
					href="/welcomepet/customer/cart"> </a>
			</div>
			</div>
		</nav>
	</div>
	 </div>
	 	 <div class="row" style="height: 4em;"> </div>


<div class="row">
	<div class="col">
		<div class="offcanvas offcanvas-start w-75" tabindex="-1"
			id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasExampleLabel">알림</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
					aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
			<div class="row mt-2">
				<div class="col">님이 좋아요를 눌렀습니다</div>
			</div>
			<div class="row mt-2">
				<div class="col">댓글을 달았습니다.</div>
			</div>			
				<div class="dropdown mt-3">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown">Dropdown button</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>