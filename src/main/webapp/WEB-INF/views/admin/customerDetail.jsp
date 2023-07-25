<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BackOffice</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
	.sidebar {
		height: 100vh;
		background-color: #f8f9fa;
		padding-top: 20px;
	}
	/* 링크 스타일 제거 */
    a {
        color: inherit;
        text-decoration: none;
    }
    
</style>
<script type="text/javascript">
	const customer_no = new URLSearchParams(location.search).get("customer_no");
	function getCustomerDetail(customer_no) {
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				const customer = response.customerDto;
				const customerInfo = document.getElementById("customerInfo");
				
				customerInfo.innerHTML = "";
				//이름
				const tr1 = document.createElement("tr");
				const td1 = document.createElement("td");
				const td2 = document.createElement("td");
				td1.innerText = "이름";
				td2.innerText = customer.customer_name;
				tr1.appendChild(td1);
				tr1.appendChild(td2);
				customerInfo.appendChild(tr1);
				
				// 닉네임
				const tr2 = document.createElement("tr");
				const td3 = document.createElement("td");
				const td4 = document.createElement("td");
				td3.innerText = "닉네임";
				td4.innerText = customer.customer_nickname;
				tr2.appendChild(td3);
				tr2.appendChild(td4);
				customerInfo.appendChild(tr2);
				//아이디(이메일)
				const tr3 = document.createElement("tr");
				const td5 = document.createElement("td");
				const td6 = document.createElement("td");
				td5.innerText = "아이디(이메일)";
				td6.innerText = customer.customer_id;
				tr3.appendChild(td5);
				tr3.appendChild(td6);
				customerInfo.appendChild(tr3);
				//연락처
				const tr4 = document.createElement("tr");
				const td7 = document.createElement("td");
				const td8 = document.createElement("td");
				td7.innerText = "연락처";
				td8.innerText = customer.customer_phone;
				tr4.appendChild(td7);
				tr4.appendChild(td8);
				customerInfo.appendChild(tr4);
				//생일
				const tr5 = document.createElement("tr");
				const td9 = document.createElement("td");
				const td10 = document.createElement("td");
				td9.innerText = "생년월일";
				td10.innerText = formatDate(customer.customer_birth, "yy/MM/dd");
				tr5.appendChild(td9);
				tr5.appendChild(td10);
				customerInfo.appendChild(tr5);
				//인증여부
				const tr6 = document.createElement("tr");
				const td11 = document.createElement("td");
				const td12 = document.createElement("td");
				td11.innerText = "인증여부";
				
				if (customer.customer_status == 0) {
					td12.innerText = "N";
				} else {
					td12.innerText = "Y";
				}
				tr6.appendChild(td11);
				tr6.appendChild(td12);
				customerInfo.appendChild(tr6);
				// 가입일
				const tr7 = document.createElement("tr"); 
				const td13 = document.createElement("td");
				const td14 = document.createElement("td");
				td13.innerText = "가입일";
				td14.innerText = formatDate(customer.customer_reg_date, "yy/MM/dd HH:mm:ss");
				tr7.appendChild(td13);
				tr7.appendChild(td14);
				customerInfo.appendChild(tr7);
			}

				
		}
		
		// get
		xhr.open("get", "./getCustomerDetail?customer_no="+customer_no);
		xhr.send();
	}
	
	function formatDate(dateString, pattern) {
		  const date = new Date(dateString);
		  const year = date.getFullYear().toString().substr(-2);
		  const month = ("0" + (date.getMonth() + 1)).slice(-2);
		  const day = ("0" + date.getDate()).slice(-2);
		  const hours = ("0" + date.getHours()).slice(-2);
		  const minutes = ("0" + date.getMinutes()).slice(-2);
		  const seconds = ("0" + date.getSeconds()).slice(-2);

		  const formattedDate = pattern
		    .replace("yy", year)
		    .replace("MM", month)
		    .replace("dd", day)
		    .replace("HH", hours)
		    .replace("mm", minutes)
		    .replace("ss", seconds);

		  return formattedDate;
	}
	
	window.addEventListener("DOMContentLoaded", function() {
		getCustomerDetail(customer_no);		  
		});
</script>
</head>

<body>
	<div class="container">
	
		<div class="row">
			<%@ include file="../common/adminTab.jsp"%>
			<div class="col-1"></div>
			<div class="col-9">
				<div class="row mt-5"></div>
				
				<div class="row mt-5">
					<div class="col-6">
						<table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center" colspan="2">고객정보</th>
                                </tr>
                            </thead>
                            <tbody id="customerInfo">
                            </tbody>
                        </table>
					</div>
				</div>	
				<hr>
				
				<!-- <div class="row mt-3">
					<div class="col">
						<h4>최근 주문내역</h4>
					</div>
				</div>
				<hr> -->
				
				<%-- <div class="row mt-3">
					<div class="col-6">
						<h3>보유중인 쿠폰</h3>
						<c:if test="${!empty coupon }">
						<table class="table table-bordered">
							<tr>
								<td>발급일</td>
								<td>쿠폰이름</td>
								<td>쿠폰 만료일</td>
								<td>사용여부</td>
							</tr>
							<c:forEach items="${coupon }" var="c">
							<tr>
								<td><fmt:formatDate value="${c.couponTemplateDto.issue_date}" pattern="yy/MM/dd"/></td>
								<td>${c.couponTemplateDto.template_name }</td>
								<td><fmt:formatDate value="${c.couponTemplateDto.expire_date}" pattern="yy/MM/dd"/></td>
								<c:if test="${c.couponListDto.coupon_is_used eq 0}">
									<td>X</td>
								</c:if>
								<c:if test="${c.couponListDto.coupon_is_used eq 1}">
									<td>O</td>
								</c:if>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="2">적립금</td>
								<td colspan="2">${customerPointDto.customer_point }원</td>
							</tr>
						</table>
						</c:if>
					</div>
					<div class="col-1"></div>
					
				</div> --%>
				
				<div class="row mt-5">
					
					<div class="col-8">
						<h4>정지 history</h4>
						<c:if test="${!empty banHistory }">
							<table class="table table-bordered">
								<tr>
									<td>처리일</td>
									<td>제한 사유</td>
									<td>처리자</td>
									<td>제한기간</td>
								</tr>
								<c:forEach items="${banHistory }" var="ban">
									<tr>
										<td><fmt:formatDate value="${ban.customerBanDto.ban_start_date}" pattern="yy.MM.dd"/></td>
										<td>${ban.customerBanDto.ban_reason }</td>
										<td>${ban.empDto.emp_name }</td>
										<td>
											<fmt:formatDate value="${ban.customerBanDto.ban_start_date}" pattern="yy.MM.dd"/>~<fmt:formatDate value="${ban.customerBanDto.ban_end_date}" pattern="yy.MM.dd"/>
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
					</div>
						
					<div class="col-1"></div>
					<div class="col d-grid">
						<form action="./banCustomer?customer_no=${customer_no}" method="post">
							<h3>고객 제한</h3>
							<label class="form-label">사유 입력</label>						
							<textarea rows="2" cols="10" name="ban_reason" class="form-control"></textarea>
							<br>
							<button class="btn btn-primary" name="buttonType" value="thereDays">3일 이용 제한</button>
							<button class="btn btn-danger" name="buttonType" value="forever">영구제한</button>
							</form>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>

</html>