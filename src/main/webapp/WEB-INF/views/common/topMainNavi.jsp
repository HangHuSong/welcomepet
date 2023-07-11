<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div class="col">
		<nav
			class="navbar navbar-dark bg-white d-flex fixed-top fw-bold">
			<div class="col-2 text-center">
				<a class="btn bi bi-bell text-secondary fs-4 "
					data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
					aria-controls="offcanvasExample"> </a>
			</div>
			<div class="col-1"></div>
			<div class="col-6" style="text-align: center;">사이트이름</div>
			<div class="col-1 text-center">
				<a class="btn bi bi-search fs-4" role="button"
					href="/welcomepet/board/search"> </a>
			</div>
			<div class="col-2 text-center">
				<a class="btn bi bi-cart2 fs-4" role="button"
					href="/welcomepet/customer/cart"> </a>
			</div>

		</nav>
	</div>
</div>


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