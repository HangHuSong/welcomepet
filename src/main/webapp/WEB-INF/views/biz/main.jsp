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

						<div class="row ms-1 bg-light pb-5 px-5">
							<div class="col-10 pe-5">
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
									<div
										class="col my-3 mx-3 bg-white border align-items-center shadow">
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
							<div class="col-2">
								<div class="row">
									<div class="col" style="height: 265px;"></div>
								</div>
								<div class="row pb-4">
									<div class="col">
										<img class="w-100"
											src="/welcomepet/resources/img/bizAd/ad7.jpg">
									</div>
								</div>
								<div class="row py-4">
									<div class="col">
										<img class="w-100"
											src="/welcomepet/resources/img/bizAd/ad6.png">
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
				<div class="row" style="width: 1920px;">
					<div class="col-2"
						style="height: auto; background-color: rgb(29, 33, 42);"><jsp:include
							page="../common/bizLeftNavi.jsp"></jsp:include></div>
					<div class="col-10 bg-light">
						<div class="row bg-white">
							<div class="col text-center"><jsp:include
									page="../common/bizTopNavi.jsp"></jsp:include></div>
						</div>
						<div class="row px-5">
							<div class="col-10 px-5">
								<div class="row text-start my-2 py-3">
									<div class="col py-3 px-5 rounded-4 text-white"
										style="background-color: rgb(70, 81, 241);">
										<div class="row">
											<div class="col">
												<div class="row">
													<div class="col fs-4 fw-bold">어서오개 판매자센터 교육자료 오픈!</div>
												</div>
												<div class="row mt-4">
													<div class="col" style="font-size: 14px;">상품등록부터
														재고관리까지 어서오개 교육자료를 활용해보세요!</div>
												</div>
											</div>
											<div class="col-3">
												<div class="row py-1">
													<div class="col-1 fs-4" style="color: rgb(34, 34, 245);">
														<i class="fas fa-check-circle"></i>
													</div>
													<div class="col ms-1 align-self-center">어서오개 판매자센터
														이해하기</div>
												</div>
												<div class="row py-1">
													<div class="col-1 fs-4" style="color: rgb(34, 34, 245);">
														<i class="fas fa-check-circle"></i>
													</div>
													<div class="col ms-1 align-self-center">재고관리 활용하기</div>
												</div>
												<div class="row py-1">
													<div class="col-1 fs-4" style="color: rgb(34, 34, 245);">
														<i class="fas fa-check-circle"></i>
													</div>
													<div class="col ms-1 align-self-center">주문/배송/통합CS처리하기</div>
												</div>
											</div>
											<div class="col-2 pt-5">
												<div class="row mt-4 px-2">
													<div
														class="col bg-white text-dark rounded-5 py-2 text-center">
														다운로드 하기 <i class="fas fa-long-arrow-alt-right"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<c:if test="${bizUser.biz_status_no eq 1}">
									<div class="row my-4 pb-5">
										<div class="col rounded-4 shadow">
											<div class="row bg-white py-3">
												<div class="col fs-4">
													<span class="text-secondary"><i
														class="fas fa-info-circle"></i> </span> <span>어서오개를 시작하는</span> <span
														class="text-info">${bizUser.biz_id }</span> <span>님을
														위한 가이드</span>
												</div>
											</div>
											<div class="row">
												<div class="col mx-2">
													<div class="row bg-white py-3 px-2 mt-3 mb-4"
														style="border: 3px solid #ff476a;">
														<div class="col-2 text-white rounded-2 text-center"
															style="background-color: #ff476a;">STEP 1</div>
														<div class="col" style="color: #ff476a;">스토어 입점
															신청해주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															2</div>
														<div class="col px-0 align-self-center">입점신청 승인을
															기다려주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															3</div>
														<div class="col px-0 align-self-center">입점이 승인되면 스토어
															정보를 입력해주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															4</div>
														<div class="col px-0 align-self-center">스토어 정보를 입력하면
															상품 판매를 시작해보세요.</div>
													</div>
												</div>
												<div class="col bg-white ms-2">
													<div class="row py-3">
														<div class="col fs-5 fw-bold">사업자등록번호와 등본을 입력해주세요.</div>
													</div>
													<div class="row my-3">
														<div class="col">스토어 입점신청하신 후 어서오개 판매자센터의 서비스를 이용하실
															수 있습니다.</div>
													</div>
													<div class="row bg-light mx-2 px-2 mt-2 mb-4">
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-3 text-center py-2 px-2">
															<i class="far fa-file-alt"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">입점서류 확인 및 제출</div>
														<div
															class="col-2 text-info fs-4 align-self-center text-start">
															<i class="fas fa-long-arrow-alt-right"></i>
														</div>
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-4 text-center py-2 px-2">
															<i class="fas fa-users-cog"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">관리자 승인 대기</div>
													</div>
													<div class="row pt-4 mb-3">
														<div class="col text-end">
															<button class="btn btn-primary"
																onclick="showApprovalRequestRegisterModal()"
																data-bs-toggle="modal"
																data-bs-target="#approvalRequestRegisterModal">사업자
																인증하기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${bizUser.biz_status_no eq 2}">
									<div class="row my-4 pb-5">
										<div class="col rounded-4 shadow">
											<div class="row bg-white py-3">
												<div class="col fs-4">
													<span class="text-secondary"><i
														class="fas fa-info-circle"></i> </span> <span>어서오개를 시작하는</span> <span
														class="text-info">${bizUser.biz_id }</span> <span>님을
														위한 가이드</span>
												</div>
											</div>
											<div class="row">
												<div class="col mx-2">
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4 text-primary">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															1</div>
														<div class="col px-0 align-self-center">스토어 입점
															신청해주세요.</div>
													</div>
													<div class="row bg-white py-3 px-2 mt-3 mb-4"
														style="border: 3px solid #ff476a;">
														<div class="col-2 me-1 text-white rounded-2 text-center"
															style="background-color: #ff476a;">STEP 2</div>
														<div class="col ms-4" style="color: #ff476a;">입점신청
															승인을 기다려주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															3</div>
														<div class="col px-0 align-self-center">입점이 승인되면 스토어
															정보를 입력해주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															4</div>
														<div class="col px-0 align-self-center">스토어 정보를 입력하면
															상품 판매를 시작해보세요.</div>
													</div>
												</div>
												<div class="col bg-white ms-2">
													<div class="row py-3">
														<div class="col fs-5 fw-bold">관리자가 ${bizUser.biz_id }님의
															입점 신청을 검토하고있습니다.</div>
													</div>
													<div class="row my-3">
														<div class="col">관리자의 입점 승인 후 스토어 정보를 입력해주시면 어서오개의
															서비스를 이용하실 수 있습니다.</div>
													</div>
													<div class="row bg-light mx-2 px-2 mt-2 mb-4">
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-4 text-center py-2 px-2">
															<i class="fas fa-users-cog"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">관리자 승인 대기</div>
														<div
															class="col-2 text-info fs-4 align-self-center text-start">
															<i class="fas fa-long-arrow-alt-right"></i>
														</div>
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-4 text-center py-2 px-2">
															<i class="fas fa-store"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">스토어 정보 입력</div>
													</div>
													<div class="row pt-4 mb-3">
														<div class="col text-end">
															<button id="bizApprovalInformButton"
																class="btn btn-primary" data-bs-toggle="modal"
																data-bs-target="#approvalRequestInformModal"
																onclick="showApprovalRequestInfoModal()">내 신청
																정보 보기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${bizUser.biz_status_no eq 5}">
									<div class="row my-4 pb-5">
										<div class="col rounded-4 shadow">
											<div class="row bg-white py-3">
												<div class="col fs-4">
													<span class="text-secondary"><i
														class="fas fa-info-circle"></i> </span> <span>어서오개를 시작하는</span> <span
														class="text-info">${bizUser.biz_id }</span> <span>님을
														위한 가이드</span>
												</div>
											</div>
											<div class="row">
												<div class="col mx-2">
													<div class="row bg-white py-3 px-2 mt-3 mb-4"
														style="border: 3px solid #ff476a;">
														<div class="col-2 text-white rounded-2 text-center"
															style="background-color: #ff476a;">STEP 1</div>
														<div class="col" style="color: #ff476a;">스토어 입점
															신청해주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															2</div>
														<div class="col px-0 align-self-center">입점신청 승인을
															기다려주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															3</div>
														<div class="col px-0 align-self-center">입점이 승인되면 스토어
															정보를 입력해주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															4</div>
														<div class="col px-0 align-self-center">스토어 정보를 입력하면
															상품 판매를 시작해보세요.</div>
													</div>
												</div>
												<div class="col bg-white ms-2">
													<div class="row py-3">
														<div class="col fs-5 fw-bold">
															<span class="text-info">${bizUser.biz_id}</span> <span>님의
																입점 요청이 거절되었습니다.
																(사유:${bizApprovalDto.biz_approval_message })</span>
														</div>
													</div>
													<div class="row my-3">
														<div class="col">스토어 입점을 재신청하신 후 어서오개 판매자센터의 서비스를
															이용하실 수 있습니다.</div>
													</div>
													<div class="row bg-light mx-2 px-2 mt-2 mb-4">
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-3 text-center py-2 px-2">
															<i class="far fa-file-alt"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">입점서류 확인 및 제출</div>
														<div
															class="col-2 text-info fs-4 align-self-center text-start">
															<i class="fas fa-long-arrow-alt-right"></i>
														</div>
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-4 text-center py-2 px-2">
															<i class="fas fa-users-cog"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">관리자 승인 대기</div>
													</div>
													<div class="row pt-4 mb-3">
														<div class="col text-end">
															<button class="btn btn-primary"
																onclick="showApprovalRequestRegisterModal()"
																data-bs-toggle="modal"
																data-bs-target="#approvalRequestRegisterModal">사업자
																인증하기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${bizUser.biz_status_no eq 3}">
									<div class="row my-4 pb-5">
										<div class="col rounded-4 shadow">
											<div class="row bg-white py-3">
												<div class="col fs-4">
													<span class="text-secondary"><i
														class="fas fa-info-circle"></i> </span> <span>어서오개를 시작하는</span> <span
														class="text-info">${bizUser.biz_id }</span> <span>님을
														위한 가이드</span>
												</div>
											</div>
											<div class="row">
												<div class="col mx-2">
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4 text-primary">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															1</div>
														<div class="col px-0 align-self-center">스토어 입점
															신청해주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4 text-primary">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															2</div>
														<div class="col px-0 align-self-center">입점신청 승인을
															기다려주세요.</div>
													</div>
													<div class="row bg-white py-3 px-2 mt-3 mb-4"
														style="border: 3px solid #ff476a;">
														<div class="col-2 me-1 text-white rounded-2 text-center"
															style="background-color: #ff476a;">STEP 3</div>
														<div class="col ms-4" style="color: #ff476a;">입점이
															승인되면 스토어 정보를 입력해주세요.</div>
													</div>
													<div class="row bg-white py-2 my-4">
														<div class="col-1 fs-4" style="color: #d7dce3;">
															<i class="fas fa-check-circle"></i>
														</div>
														<div
															class="col-2 rounded-2 text-info px-0 align-self-center">STEP
															4</div>
														<div class="col px-0 align-self-center">스토어 정보를 입력하면
															상품 판매를 시작해보세요.</div>
													</div>
												</div>
												<div class="col bg-white ms-2">
													<div class="row py-3">
														<div class="col fs-5 fw-bold">입점 승인이 완료되었습니다.</div>
													</div>
													<div class="row my-3">
														<div class="col">스토어 정보를 입력해주시면 어서오개의 서비스를 이용하실 수
															있습니다.</div>
													</div>
													<div class="row bg-light mx-2 px-2 mt-2 mb-4">
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-4 text-center py-2 px-2 ms-2">
															<i class="fas fa-store"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">스토어 정보 입력</div>
														<div
															class="col-2 text-info fs-4 align-self-center text-start">
															<i class="fas fa-long-arrow-alt-right"></i>
														</div>
														<div
															class="col-1 text-info bg-white my-3 rounded-4 shadow fs-4 text-center py-2 px-2">
															<i class="fas fa-box-open"></i>
														</div>
														<div class="col align-self-center"
															style="font-size: 15px;">상품 판매 시작</div>
													</div>
													<div class="row pt-4 mb-3">
														<div class="col text-end">
															<a class="btn btn-primary" href="./shopInformRegister">상점
																정보 등록하기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<div class="row mb-5">
									<div class="col bg-white rounded-4">
										<div class="row py-3 border-bottom">
											<div class="col fs-5">함께 이용하면 더 편리한 앱 추천</div>
										</div>
										<div class="row py-3 px-5">
											<div class="col">
												<div class="row">
													<div class="col-3 align-self-center">
														<img class="w-100 border rounded-4"
															src="/welcomepet/resources/img/bizAd/app1.png">
													</div>
													<div class="col">
														<div class="row py-1">
															<div class="col fw-bold" style="font-size: 14px;">어서오개
																스타터 패키지</div>
														</div>
														<div class="row py-1">
															<div class="col text-secondary" style="font-size: 13px;">어서오게
																셀러를 위한 자사몰 구축</div>
														</div>
														<div class="row py-1">
															<div class="col text-primary" style="font-size: 13px;">
																<span class="text-decoration-underline">설치하기</span> <span><i
																	class="fas fa-external-link-alt"></i></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col">
												<div class="row">
													<div class="col-3 align-self-center">
														<img class="w-100 border rounded-4"
															src="/welcomepet/resources/img/bizAd/app2.png">
													</div>
													<div class="col">
														<div class="row py-1">
															<div class="col fw-bold" style="font-size: 14px;">쇼피스타터
																패키지</div>
														</div>
														<div class="row py-1">
															<div class="col text-secondary" style="font-size: 13px;">쇼피
																입점부터 상품등록까지</div>
														</div>
														<div class="row py-1">
															<div class="col text-primary" style="font-size: 13px;">
																<span class="text-decoration-underline">설치하기</span> <span><i
																	class="fas fa-external-link-alt"></i></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col">
												<div class="row">
													<div class="col-3 align-self-center">
														<img class="w-100 border rounded-4"
															src="/welcomepet/resources/img/bizAd/app3.png">
													</div>
													<div class="col">
														<div class="row py-1">
															<div class="col fw-bold" style="font-size: 14px;">FASTBOX
																해외배송</div>
														</div>
														<div class="row py-1">
															<div class="col text-secondary" style="font-size: 13px;">저렴하고
																손쉬운 해외배송</div>
														</div>
														<div class="row py-1">
															<div class="col text-primary" style="font-size: 13px;">
																<span class="text-decoration-underline">설치하기</span> <span><i
																	class="fas fa-external-link-alt"></i></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row py-3 px-5">
											<div class="col">
												<div class="row">
													<div class="col-3 align-self-center">
														<img class="w-100 border rounded-4"
															src="/welcomepet/resources/img/bizAd/app4.png">
													</div>
													<div class="col">
														<div class="row py-1">
															<div class="col fw-bold" style="font-size: 14px;">셀러봇캐시</div>
														</div>
														<div class="row py-1">
															<div class="col text-secondary" style="font-size: 13px;">정산금
																관리 한 번에</div>
														</div>
														<div class="row py-1">
															<div class="col text-primary" style="font-size: 13px;">
																<span class="text-decoration-underline">설치하기</span> <span><i
																	class="fas fa-external-link-alt"></i></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col">
												<div class="row">
													<div class="col-3 align-self-center">
														<img class="w-100 border rounded-4"
															src="/welcomepet/resources/img/bizAd/app5.png">
													</div>
													<div class="col">
														<div class="row py-1">
															<div class="col fw-bold" style="font-size: 14px;">지그재그
																상품연동</div>
														</div>
														<div class="row py-1">
															<div class="col text-secondary" style="font-size: 13px;">등록절차없이
																자동상품노출</div>
														</div>
														<div class="row py-1">
															<div class="col text-primary" style="font-size: 13px;">
																<span class="text-decoration-underline">설치하기</span> <span><i
																	class="fas fa-external-link-alt"></i></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col">
												<div class="row">
													<div class="col-3 align-self-center">
														<img class="w-100 border rounded-4"
															src="/welcomepet/resources/img/bizAd/app6.png">
													</div>
													<div class="col">
														<div class="row py-1">
															<div class="col fw-bold" style="font-size: 14px;">네이버톡톡</div>
														</div>
														<div class="row py-1">
															<div class="col text-secondary" style="font-size: 13px;">스마트스토어
																무료상담</div>
														</div>
														<div class="row py-1">
															<div class="col text-primary" style="font-size: 13px;">
																<span class="text-decoration-underline">설치하기</span> <span><i
																	class="fas fa-external-link-alt"></i></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-2">
								<div class="row">
									<div class="col" style="height: 230px;"></div>
								</div>
								<div class="row pb-4">
									<div class="col">
										<img class="w-100"
											src="/welcomepet/resources/img/bizAd/ad7.jpg">
									</div>
								</div>
								<div class="row py-4">
									<div class="col">
										<img class="w-100"
											src="/welcomepet/resources/img/bizAd/ad6.png">
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