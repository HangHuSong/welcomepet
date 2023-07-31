<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<style type="text/css">
#section {
	width: 1300px;
	margin: 0 auto;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

<script>
	
</script>


</head>
<body>
	<div class="container" style="margin: 0 0;">
		<c:choose>
			<c:when test="${bizUser.biz_status_no eq 4}">
				<div class="row" style="width: 1920px;">
					<div class="col-2"
						style="height: auto; background-color: rgb(29, 33, 42);"><jsp:include
							page="../common/bizLeftNavi.jsp"></jsp:include></div>
					<div class="col-10 bg-light">
						<div class="row bg-white">
							<div class="col text-center"><jsp:include
									page="../common/bizTopNavi.jsp"></jsp:include></div>
						</div>

						<div class="row ms-1 bg-light pb-5">
							<div class="col-10 px-5">
								<div class="row my-4">
									<div class="col">
										<img class="w-100"
											src="/welcomepet/resources/img/bizAd/bizTopAd.jpg">
									</div>
								</div>
								<div class="row">
									<div class="col border mb-3 mx-3 py-3 bg-white shadow">
										<div class="row">
											<div class="col">
												<div class="row">
													<div class="col-3">
														<img class="w-100 rounded-circle"
															src="/uploadFiles/bizMainImg/${bizUser.biz_store_main_img }">
													</div>
													<div class="col align-self-center pe-0">
														<div class="row">
															<div class="col">
																<span class="fw-bold">${bizUser.biz_store_name }</span>
																<span class="text-secondary">&gt;</span>
															</div>
														</div>
														<div class="row">
															<div class="col" style="font-size: 12px;">
																<span class="text-secondary">스토어찜</span> <span
																	class="text-info">${biz_likes_num }명</span>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="col align-self-center">
												<div class="row">
													<div
														class="col-4 text-secondary align-self-center pe-0 text-end">신규주문</div>
													<div class="col fw-bold text-danger fs-3 align-self-center">${newRequestNumData.newOrderNum }</div>
												</div>
											</div>
											<div class="col align-self-center">
												<div class="row">
													<div
														class="col-4 text-secondary align-self-center pe-0 text-end">신규Q&A</div>
													<div class="col fw-bold text-danger fs-3 align-self-center">${newRequestNumData.newInquiryNum }</div>
												</div>
											</div>
											<div class="col align-self-center">
												<div class="row">
													<div
														class="col-5 text-secondary align-self-center pe-0 text-end">품절임박상품</div>
													<div class="col fw-bold text-danger fs-3 align-self-center">${newRequestNumData.lowStockNum }</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row ">
									<div class="col my-3 mx-3 bg-white border shadow">
										<div class="row py-3 px-2 border-bottom">
											<div class="col fs-5 fw-bold">주문/배송</div>
										</div>
										<div class="row">
											<div class="col">
												<div class="row py-4 border-bottom">
													<div class="col py-1">
														<div class="row align-items-center">
															<div class="col">
																<span class="px-2"><i class="fas fa-won-sign"></i></span>
																주문완료
															</div>
															<div class="col text-primary fs-4 fw-bold text-center">${orderStatusNumData.orderCompleteNum }</div>
														</div>
													</div>
												</div>
												<div class="row py-4 border-bottom">
													<div class="col py-1">
														<div class="row align-items-center">
															<div class="col">
																<span class="px-2"><i class="fas fa-box"></i></span>
																배송준비중
															</div>
															<div class="col text-primary fs-4 fw-bold text-center">${orderStatusNumData.prepareShippingNum }</div>
														</div>
													</div>
												</div>
												<div class="row py-4 border-bottom">
													<div class="col py-1">
														<div class="row align-items-center">
															<div class="col">
																<span class="px-2"><i class="fas fa-truck"></i></span>
																배송중
															</div>
															<div class="col text-primary fs-4 fw-bold text-center">${orderStatusNumData.inShippingNum }</div>
														</div>
													</div>
												</div>
												<div class="row py-4">
													<div class="col py-1">
														<div class="row align-items-center">
															<div class="col">
																<span class="px-2"><i class="fas fa-check-circle"></i></span>
																배송완료
															</div>
															<div class="col text-primary fs-4 fw-bold text-center">${orderStatusNumData.ShippingCompleteNum }</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col my-3 mx-3 bg-white border shadow">
										<div class="row py-3 px-2 border-bottom">
											<div class="col fs-5 fw-bold">취소/환불/교환</div>
										</div>
										<div class="row px-2">
											<div class="col">
												<div class="row align-items-center border-bottom"
													style="padding: 43px 0;">
													<div class="col">취소요청</div>
													<div class="col text-primary fs-4 fw-bold text-center">${cancelRefundExchangeNumData.cancelRequestNum }</div>
												</div>
												<div class="row align-items-center border-bottom"
													style="padding: 43px 0;">
													<div class="col">환불요청</div>
													<div class="col text-primary fs-4 fw-bold text-center">${cancelRefundExchangeNumData.returnRequestNum }</div>
												</div>
												<div class="row align-items-center" style="padding: 43px 0;">
													<div class="col">교환요청</div>
													<div class="col text-primary fs-4 fw-bold text-center">${cancelRefundExchangeNumData.exchangeRequestNum }</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col my-3 mx-3 bg-white border align-items-center shadow">
										<div class="row py-3 px-2 border-bottom">
											<div class="col fs-5 fw-bold">상점등급</div>
										</div>
										<div class="row py-2 px-2">
											<div class="col">
												<canvas id="gradeGoalChart"></canvas>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-4 my-3 mx-3 bg-white border shadow">
										<div class="row py-3 px-2 border-bottom">
											<div class="col fs-5 fw-bold">판매현황</div>
										</div>
										<div class="row py-2">
											<div class="col">
												<div class="row border-bottom px-2 py-2">
													<div class="col">
														<div class="row">
															<div class="col align-self-center">오늘 결제금액</div>
															<div class="col text-end">
																<span style="font-size: 22px;">${paymentData.todayPayment }</span>
																<span>원</span>
															</div>
														</div>
														<div class="row" style="font-size: 12px;">
															<div class="col"></div>
															<div class="col text-danger text-end">
																어제대비
																${paymentData.purchaseAmountOnedayIncreasePercentage }%<i
																	class="fas fa-caret-up"></i>
															</div>
														</div>
													</div>
												</div>
												<div class="row my-2 border-bottom px-2 py-2">
													<div class="col">
														<div class="row">
															<div class="col align-self-center">이번주 결제금액</div>
															<div class="col text-end">
																<span style="font-size: 22px;">${paymentData.thisWeekPayment }</span>
																<span>원</span>
															</div>
														</div>
														<div class="row">
															<div class="col"></div>
															<div class="col text-end">
																<span class="text-danger" style="font-size: 12px;">저번주대비
																	${paymentData.purchaseAmountOneweekIncreasePercentage }%<i
																	class="fas fa-caret-up"></i>
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row my-2 border-bottom px-2 py-2">
													<div class="col">
														<div class="row">
															<div class="col align-self-center">오늘 결제건수</div>
															<div class="col text-end">
																<span style="font-size: 22px;">${paymentData.todayOrderCount }</span>
																<span>건</span>
															</div>
														</div>
														<div class="row">
															<div class="col"></div>
															<div class="col text-end">
																<span class="text-danger" style="font-size: 12px;">어제대비
																	${paymentData.orderCountOnedayIncreasePercentage }%<i
																	class="fas fa-caret-up"></i>
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row px-2 py-2">
													<div class="col">
														<div class="row">
															<div class="col align-self-center">이번주 결제건수</div>
															<div class="col text-end">
																<span style="font-size: 22px;">${paymentData.thisWeekOrderCount }</span>
																<span>건</span>
															</div>
														</div>
														<div class="row">
															<div class="col"></div>
															<div class="col text-end">
																<span class="text-danger" style="font-size: 12px;">저번주대비
																	${paymentData.orderCountOneweekIncreasePercentage }%<i
																	class="fas fa-caret-up"></i>
																</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col my-3 mx-3 bg-white border shadow">
										<div class="row py-3 px-2">
											<div class="col fs-5 fw-bold">TOP5 상품</div>
										</div>
										<div class="row">
											<div class="col">
												<table class="table text-center mb-0">
													<thead class="table-success">
														<tr>
															<th scope="col" class="col-1">랭킹</th>
															<th scope="col">상품</th>
															<th scope="col" class="col-2">총주문건수</th>
															<th scope="col" class="col-2">총판매량</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach
															items="${top5ProductData.top5ProductOptionList }"
															var="top5Product" varStatus="idx">
															<tr>
																<th scope="row">${idx.count }</th>
																<td class="text-start">${top5Product.PRODUCT_OPTION_NAME}</td>
																<td>${top5Product.ORDERCOUNT}</td>
																<td>${top5Product.SUMQUANTITY}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-2 my-4">
								<div class="row my-1">
									<div class="col">
										<img src="/welcomepet/resources/img/bizAd/ad1.png">
									</div>
								</div>
								<div class="row my-1">
									<div class="col">
										<img src="/welcomepet/resources/img/bizAd/ad2.png">
									</div>
								</div>
								<div class="row my-1">
									<div class="col">
										<img src="/welcomepet/resources/img/bizAd/ad3.png">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row" style="width: 1900px;">
					<div class="col-2 text-center ps-4 text-white"
						style="height: auto; background-color: rgb(29, 33, 42);"><jsp:include
							page="../common/bizLeftNavi.jsp"></jsp:include></div>
					<div class="col-10 bg-light">
						<div class="row bg-white">
							<div class="col text-center"><jsp:include
									page="../common/bizTopNavi.jsp"></jsp:include></div>
						</div>
						<div class="row">
							<div class="col-10 py-5 mb-5">
								<div class="row my-4">
									<div class="col">
										<img class="w-100"
											src="/welcomepet/resources/img/bizAd/bizTopAd.jpg">
									</div>
								</div>
								<c:if test="${bizUser.biz_status_no eq 1}">
									<div class="row my-3 mx-3 px-3 rounded-4">
										<div class="col-8 text-start">
											가입을 축하합니다!<br>판매자님은 현재 입점 정보 미등록 상태입니다. 입점절차 완료를 위하여 판매자
											정보를 입력해주세요.
										</div>
									</div>
									<div class="row my-3 mx-3">
										<div
											class="col-8 mt-2 px-5 py-3 mx-4 bg-white rounded-4 border">
											<div class="row my-4">
												<div class="col fs-4 fw-bold text-start">판매자 정보를
													입력해주세요.</div>
											</div>
											<div class="row my-2">
												<div class="col text-start">사업자 인증 후 입점이 승인되면 어서오개
													판매자센터의 모든 서비스를 이용하실 수 있습니다.</div>
											</div>
											<div class="row my-3"></div>
											<div class="row mt-5 mb-2">
												<div class="col text-start">
													<button class="btn btn-primary"
														onclick="showApprovalRequestRegisterModal()"
														data-bs-toggle="modal"
														data-bs-target="#approvalRequestRegisterModal">사업자
														인증하기</button>
												</div>
											</div>
										</div>
									</div>

								</c:if>
								<c:if test="${bizUser.biz_status_no eq 2}">

									<div class="row mx-3 my-3 rounded-4">
										<div
											class="col-6 mt-2 px-4 py-3 mx-4 bg-white rounded-4 border">
											<div class="row my-2 mx-2">
												<div class="col fs-4 fw-bold text-start">판매자님은 현재 입점
													승인 대기 상태입니다.</div>
											</div>
											<div class="row my-2 mx-2">
												<div class="col text-start">운영팀에서 귀하의 신청을 검토중입니다. 입점
													승인 완료 후 어서오개 판매자센터의 모든 서비스를 이용하실 수 있습니다.</div>
											</div>
											<div class="row my-2 mx-2">
												<div class="col text-start">
													<button id="bizApprovalInformButton"
														class="btn btn-primary" data-bs-toggle="modal"
														data-bs-target="#approvalRequestInformModal"
														onclick="showApprovalRequestInfoModal()">내 신청 정보
														보기</button>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${bizUser.biz_status_no eq 5}">
									<div class="row mx-3 my-3 rounded-4">
										<div
											class="col-8 mt-2 px-4 py-3 mx-4 bg-white rounded-4 border">
											<div class="row my-2 mx-2">
												<div class="col fs-4 fw-bold text-start">판매자님이 신청하신 입점
													승인 요청이 거절되었습니다.</div>
											</div>
											<div class="row my-2 mx-2">
												<div class="col text-start">사유:
													${bizApprovalDto.biz_approval_message }</div>
											</div>
											<div class="row my-2 mx-2">
												<div class="col text-start">입점 승인 재요청 후 어서오개 판매자 서비스
													센터를 이용해주세요.</div>
											</div>
											<div class="row my-2 mx-2">
												<div class="col text-start">
													<button class="btn btn-primary"
														onclick="showApprovalRequestRegisterModal()"
														data-bs-toggle="modal"
														data-bs-target="#approvalRequestRegisterModal">사업자
														인증하기</button>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${bizUser.biz_status_no eq 3}">
									<div class="row mx-3 my-3 rounded-4">
										<div
											class="col-8 mt-2 px-3 py-3 mx-4 bg-white rounded-4 border">
											<div class="row my-2 mx-2">
												<div class="col fs-4 fw-bold text-start">입점 승인이
													완료되었습니다.</div>
											</div>
											<div class="row my-2 mx-2">
												<div class="col text-start">상점 정보를 등록하시면 어서오개 판매자 서비스
													센터를 이용하실 수 있습니다.</div>
											</div>
											<div class="row my-2 mx-2">
												<div class="col text-start">
													<a class="btn btn-primary" href="./shopInformRegister">상점
														정보 등록하기</a>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<div class="row my-5 mx-3">
									<div class="col mt-2 px-5 py-3 mx-4 bg-white rounded-4 border">
										<div class="row my-4">
											<div class="col fs-4 fw-bold text-start">단 10초만에 완성!
												사업자등록 안내</div>
										</div>
										<div class="row my-2">
											<div class="col text-start">사업자 등록하고 어서오개 판매를 시작해보세요</div>
										</div>
										<div class="row my-3"></div>
										<div class="row mb-2">
											<div class="col text-start">
												<a class="btn btn-outline-primary" href="#">사업자 등록 가이드</a>
											</div>
										</div>
									</div>
									<div class="col mt-2 px-5 py-3 mx-4 bg-white rounded-4 border">
										<div class="row my-4">
											<div class="col fs-4 fw-bold text-start">쉽고 빠른 상품등록</div>
										</div>
										<div class="row my-2">
											<div class="col text-start">모든 상품을 몇 번의 클릭으로 한번에 등록해
												보세요</div>
										</div>
										<div class="row my-3"></div>
										<div class="row mb-2">
											<div class="col text-start">
												<a class="btn btn-outline-primary" href="#">상품 등록 가이드</a>
											</div>
										</div>
									</div>
									<div class="col mt-2 px-5 py-3 mx-4 bg-white rounded-4 border">
										<div class="row my-4">
											<div class="col fs-4 fw-bold text-start">판매자 교육 오픈</div>
										</div>
										<div class="row my-2">
											<div class="col text-start">어서오개 판매 교육을 위한 컨텐츠가 새롭게
												찾아옵니다</div>
										</div>
										<div class="row my-3"></div>
										<div class="row mb-2">
											<div class="col text-start">
												<a class="btn btn-outline-primary" href="#">판매자 교육</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-2 bg-light"></div>
						</div>
						<div class="row">
							<div class="col">
								<jsp:include page="../common/bizFooter.jsp"></jsp:include></div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<c:if test="${bizUser.biz_status_no eq 2}">
		<div class="modal fade" id="approvalRequestInformModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 모달 헤더 -->
					<div class="modal-header">
						<h5 class="modal-title fw-bold">내 신청 정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<!-- 모달 본문 -->
					<div class="modal-body py-0">
						<div class="row text-center border-bottom">
							<div class="col-4 align-self-center py-2 ">사업자 등록 번호</div>
							<div class="col align-self-center py-2 border-start">
								${bizApprovalRequestDto.biz_approval_request_brn }</div>
						</div>
						<div class="row text-center">
							<div class="col-4 align-self-center py-2 ">사업자 등록 등본</div>
							<div class="col align-self-center px-0 border-start">
								<img class="w-100"
									src="/uploadFiles/bizDocument/${bizApprovalRequestDto.biz_approval_request_document }">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if
		test="${bizUser.biz_status_no eq 1 || bizUser.biz_status_no eq 5}">
		<div class="modal fade" id="approvalRequestRegisterModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 모달 헤더 -->
					<div class="modal-header">
						<h5 class="modal-title fw-bold">사업자 정보 입력</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<!-- 모달 본문 -->
					<div class="modal-body py-3 text-start">
						<div class="row my-2">
							<div class="col">
								<label for="biz_approval_request_brn" class="form-label">사업자
									등록 번호</label> <input type="text" class="form-control"
									name="biz_approval_request_brn" id="biz_approval_request_brn"
									placeholder="xxx-xx-xxxxx">
							</div>
						</div>
						<div class="row ">
							<div class="col">
								<label for="document" class="form-label">사업자 등본 서류</label> <input
									type="file" class="form-control" name="document"
									onchange="saveFile(event)" id="document">
							</div>
						</div>
						<div class="row my-4 text-center">
							<div class="col">
								<button class="btn btn-primary" onclick="requestBizApproval()">입점
									신청하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
	
	//입점승인요청
	const formData = new FormData();

	function saveFile(event) {
		const file = event.target.files[0];
		formData.append('document', file);

	}

	function requestBizApproval() {
		const bizBrnInput = document
				.querySelector('input[name="biz_approval_request_brn"]');

		formData.append('biz_approval_request_brn', bizBrnInput.value);

		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				alert('입점 신청이 완료되었습니다');
			}
		}

		//get
		xhr.open("post", "./requestBizApproval");
		xhr.send(formData);
	}
	function showApprovalRequestRegisterModal() {
		var approvalRequestRegisterModal = document
				.getElementById("approvalRequestRegisterModal");
		approvalRequestRegisterModal.style.display = "block";
	}

	//신청정보 모달
		function showApprovalRequestInfoModal() {
			var approvalRequestInformModal = document
					.getElementById("approvalRequestInformModal");
			approvalRequestInformModal.style.display = "block";
		}

		var gradeGoalChart = new Chart(document
				.getElementById("gradeGoalChart"), {
			type : 'doughnut',
			data : {
				labels : [ "이번달 구매확정금액", "다음 등급까지 남은금액" ],
				datasets : [ {
					data : [ ${storeGradeData.purchaseConfirmationNum}, ${storeGradeData.remainingAmountToNextGrade} ],
					backgroundColor : [ 'rgb(26, 188, 156)',
							'rgb(240, 243, 243)' ]
				} ]
			}
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>