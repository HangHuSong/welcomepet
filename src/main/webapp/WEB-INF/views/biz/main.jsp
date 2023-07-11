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
	href="https://cdn.jsdelivr.net/npm/font-awesome@5.15.4/css/fontawesome.min.css"
	rel="stylesheet">

<style type="text/css">
#section {
	width: 1300px;
	margin: 0 auto;
}
</style>

<script>
	
</script>


</head>
<body>
	<div class="container">
		<div id="section">
			<div class="row">
				<div class="col">
					<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
				</div>
			</div>
			<div class="row">
				<div class="col-2 text-center"><jsp:include
						page="../common/bizLeftNavi.jsp"></jsp:include></div>
				<div class="col bg-light">
					<c:choose>
						<c:when test="${bizUser.biz_status_no eq 1}">
							<div class="row my-3 mx-2 rounded-4">
								<div class="col text-start">
									가입을 축하합니다!<br>판매자님은 현재 입점 정보 미등록 상태입니다. 입점절차 완료를 위하여 판매자
									정보를 입력해주세요.
								</div>
							</div>
							<div class="row my-3 mx-2 rounded-4 border">
								<div class="col my-2">
									<div class="row my-2">
										<div class="col fs-4 fw-bold text-start">판매자 정보를 입력해주세요.</div>
									</div>
									<div class="row my-2">
										<div class="col text-start">사업자 인증 후 입점이 승인되면 어서오개
											판매자센터의 모든 서비스를 이용하실 수 있습니다.</div>
									</div>
									<div class="row my-2">
										<div class="col text-start">
											<a class="btn btn-primary" href="./bizApprovalRequest">사업자
												인증하기</a>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${bizUser.biz_status_no eq 2}">
							<div class="row mx-2 my-4 rounded-4 border">
								<div class="col my-3">
									<div class="row my-2 mx-2">
										<div class="col fs-4 text-start">판매자님은 현재 입점 승인 대기
											상태입니다.</div>
									</div>
									<div class="row my-2 mx-2">
										<div class="col text-start">운영팀에서 귀하의 신청을 검토중입니다. 입점 승인
											완료 후 어서오개 판매자센터의 모든 서비스를 이용하실 수 있습니다.</div>
									</div>
									<div class="row my-2 mx-2">
										<div class="col text-start">
											<button id="bizApprovalInformButton" class="btn btn-primary"
												data-bs-toggle="modal"
												data-bs-target="#approvalRequestInformModal"
												onclick="showModal()">내 신청 정보 보기</button>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${bizUser.biz_status_no eq 5}">
							<div class="row mx-2 my-4 rounded-4 border">
								<div class="col my-3">
									<div class="row my-2 mx-2">
										<div class="col fs-4 text-start">판매자님이 신청하신 입점 승인 요청이
											거절되었습니다.</div>
									</div>
									<div class="row my-2 mx-2">
										<div class="col text-start">사유:
											${bizApprovalDto.biz_approval_message }</div>
									</div>
									<div class="row my-2 mx-2">
										<div class="col text-start">입점 승인 재요청 후 어서오개 판매자 서비스 센터를
											이용해주세요.</div>
									</div>
									<div class="row my-2 mx-2">
										<div class="col text-start">
											<a class="btn btn-primary" href="./bizApprovalRequest">사업자
												인증하기</a>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${bizUser.biz_status_no eq 3}">
							<div class="row mx-2 my-4 rounded-4 border">
								<div class="col my-3">
									<div class="row my-2 mx-2">
										<div class="col fs-4 text-start">입점 승인이 완료되었습니다.</div>
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
						</c:when>
						<c:when test="${bizUser.biz_status_no eq 4}">

							<div class="row my-2 mx-2">
								<div class="col">
									<div class="row">
										<div class="col border my-3 mx-3 py-3 bg-white">
											<div class="row">
												<div class="col">
													<div class="row">
														<div class="col d-flex align-items-center">
															<span class="text-secondary">신규주문</span><span
																class="fw-bold fs-3 text-danger px-3">${newRequestNumData.newOrderNum }</span>
														</div>
													</div>
												</div>
												<div class="col">
													<div class="row">
														<div class="col d-flex align-items-center">
															<span class="text-secondary">신규Q&A</span><span
																class="fw-bold fs-3 text-danger px-3">${newRequestNumData.newInquiryNum }</span>
														</div>

													</div>
												</div>
												<div class="col">
													<div class="row">
														<div class="col d-flex align-items-center">
															<span class="text-secondary">품절임박상품</span><span
																class="fw-bold fs-3 text-danger px-3">${newRequestNumData.lowStockNum }</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row ">
										<div class="col my-3 mx-3 bg-white border">
											<div class="row py-3 px-2 border-bottom">
												<div class="col fs-5 fw-bold">주문/배송</div>
											</div>
											<div class="row py-4">
												<div class="col">
													<div class="row">
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
													<div class="row">
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
													<div class="row">
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
													<div class="row">
														<div class="col py-1">
															<div class="row align-items-center">
																<div class="col">
																	<span class="px-2"><i
																		class="fas fa-check-circle"></i></span> 배송완료
																</div>
																<div class="col text-primary fs-4 fw-bold text-center">${orderStatusNumData.ShippingCompleteNum }</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col my-3 mx-3 bg-white border align-items-center">
											<div class="row py-3 px-2 border-bottom">
												<div class="col fs-5 fw-bold">취소/환불/교환</div>
											</div>
											<div class="row py-2 px-2">
												<div class="col">
													<div class="row py-3 align-items-center border-bottom">
														<div class="col">취소요청</div>
														<div class="col text-primary fs-4 fw-bold text-center">${cancelRefundExchangeNumData.cancelRequestNum }</div>
													</div>
													<div class="row py-3 align-items-center border-bottom">
														<div class="col">환불요청</div>
														<div class="col text-primary fs-4 fw-bold text-center">${cancelRefundExchangeNumData.returnRequestNum }</div>
													</div>
													<div class="row py-3 align-items-center">
														<div class="col">교환요청</div>
														<div class="col text-primary fs-4 fw-bold text-center">${cancelRefundExchangeNumData.exchangeRequestNum }</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col my-3 mx-3 bg-white border align-items-center">
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
										<div class="col-4 my-3 py-3 mx-3 bg-white border">
											<div class="row">
												<div class="col fs-5 fw-bold">판매현황</div>
											</div>
											<div class="row my-2">
												<div class="col">
													<div class="row">
														<div class="col align-self-center">오늘 결제금액</div>
														<div class="col">
															<span class="fs-4">${paymentData.todayPayment }</span> <span>원</span>
														</div>
													</div>
													<div class="row">
														<div class="col"></div>
														<div class="col">
															<span class="text-danger" style="font-size: 12px;">어제대비
																${paymentData.purchaseAmountOnedayIncreasePercentage }%<i
																class="fas fa-caret-up"></i>
															</span>
														</div>
													</div>
												</div>
											</div>
											<div class="row my-2">
												<div class="col">
													<div class="row">
														<div class="col align-self-center">이번주 결제금액</div>
														<div class="col">
															<span class="fs-4">${paymentData.thisWeekPayment }</span>
															<span>원</span>
														</div>
													</div>
													<div class="row">
														<div class="col"></div>
														<div class="col">
															<span class="text-danger" style="font-size: 12px;">저번주대비
																${paymentData.purchaseAmountOneweekIncreasePercentage }%<i
																class="fas fa-caret-up"></i>
															</span>
														</div>
													</div>
												</div>
											</div>
											<div class="row my-2">
												<div class="col">
													<div class="row">
														<div class="col align-self-center">오늘 결제건수</div>
														<div class="col">
															<span class="fs-4">${paymentData.todayOrderCount }</span>
															<span>건</span>
														</div>
													</div>
													<div class="row">
														<div class="col"></div>
														<div class="col">
															<span class="text-danger" style="font-size: 12px;">어제대비
																${paymentData.orderCountOnedayIncreasePercentage }%<i
																class="fas fa-caret-up"></i>
															</span>
														</div>
													</div>
												</div>
											</div>
											<div class="row my-2">
												<div class="col">
													<div class="row">
														<div class="col align-self-center">이번주 결제건수</div>
														<div class="col">
															<span class="fs-4">${paymentData.thisWeekOrderCount }</span>
															<span>건</span>
														</div>
													</div>
													<div class="row">
														<div class="col"></div>
														<div class="col">
															<span class="text-danger" style="font-size: 12px;">저번주대비
																${paymentData.orderCountOneweekIncreasePercentage }%<i
																class="fas fa-caret-up"></i>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-7 my-3 py-3 mx-3 bg-white border">
											<div class="row mb-2">
												<div class="col fs-5 fw-bold">TOP5 상품</div>
											</div>
											<div class="row">
												<div class="col">
													<table class="table text-center">
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
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
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
					<div class="modal-body">
						<div class="row text-center border-bottom">
							<div class="col align-self-center pb-3 ">사업자 등록 번호</div>
							<div class="col align-self-center pb-3">
								${bizApprovalRequestDto.biz_approval_request_brn }</div>
						</div>
						<div class="row text-center">
							<div class="col align-self-center">사업자 등록 등본</div>
							<div class="col align-self-center py-3">
								<img
									src="/uploadFiles/bizDocument/${bizApprovalRequestDto.biz_approval_request_document }">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
		function showModal() {
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