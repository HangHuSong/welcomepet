<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>

	<div class="row py-1 my-1 px-5">
		<div class="col"></div>
		<div class="col px-5">
			<div class="row text-center align-items-center">
				<div class="col"></div>
				<div class="col-2 border-end align-self-center">온라인 문의</div>
				<div class="col-2 border-end align-self-center">도움말</div>
				<c:choose>
					<c:when test="${!empty bizUser && bizUser.biz_status_no eq 4}">
						<div class="col-1 text-end mx-3">
							<div class="dropdown">
								<button class="btn dropdown-toggle px-0 py-0" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									<img class="w-100 rounded-circle"
										src="/uploadFiles/bizMainImg/${bizUser.biz_store_main_img }">
								</button>
								<ul class="dropdown-menu text-center py-0">
									<li class="border-bottom"><a class="dropdown-item py-3"
										href="#"><span class="fw-bold"
											style="color: rgb(42, 149, 255);">${bizUser.biz_store_name }</span><span>님</span>
									</a></li>
									<li><a class="dropdown-item py-3 text-secondary"
										href="./logoutProcess"><i class="fas fa-sign-out-alt"></i>
											로그아웃</a></li>

								</ul>
							</div>
						</div>
						<div class="col-1 text-start px-2">
							<div class="dropdown">
								<button class="btn" type="button" data-bs-toggle="dropdown">
									<div class="row justify-content-start">
										<div class="col fs-5 px-0">
											<i class="far fa-bell fa-lg px-2 position-relative"><span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
												style="font-size: 12px;" id="alarmNum">0</span></i>
										</div>
									</div>
								</button>
								<ul class="dropdown-menu" style="width: 450px;" id="alarmUl">
								</ul>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-1 text-end mx-3">
							<div class="dropdown">
								<button class="btn dropdown-toggle px-0 " type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									<i class="fas fa-user-circle fs-3"></i>
								</button>
								<ul class="dropdown-menu text-center py-0">
									<li class="border-bottom"><a class="dropdown-item py-3"
										href="#"><span class="fw-bold"
											style="color: rgb(42, 149, 255);">${bizUser.biz_id }</span><span>님</span>
									</a></li>
									<li><a class="dropdown-item py-3" href="./logoutProcess"><i
											class="fas fa-sign-out-alt"></i> 로그아웃</a></li>

								</ul>
							</div>
						</div>
						<div class="col-1 text-start px-2">
							<div class="dropdown">
								<button class="btn" type="button" data-bs-toggle="dropdown">
									<div class="row">
										<div class="col fs-5">
											<i class="far fa-bell fa-lg px-2 position-relative"><span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
												style="font-size: 12px;" id="alarmNum">0</span></i>
										</div>
									</div>
								</button>

							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		if(${!empty bizUser} && ${bizUser.biz_status_no}==4){
			var intervalAlarm=setInterval(getAlarm,100);	
		}else if(${empty bizUser}){
			clearInterval(intervalAlarm);
		}
		
		
		function getAlarm(){
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					const response=JSON.parse(xhr.responseText);
					
					var alarmNum=document.getElementById("alarmNum");
					if(alarmNum.innerText==0){
						const alarmUl=document.getElementById("alarmUl");
						alarmUl.innerHTML='';
						
						const li=document.createElement("li");
						li.innerText='새 알림이 없습니다.';
					}
					if(alarmNum.innerText<response.orderAlarmNum){
						const alarmUl=document.getElementById("alarmUl");
						alarmUl.innerHTML='';
						alarmNum.innerText=response.orderAlarmNum;
						
						const readAllLi = document.createElement('li');
						readAllLi.classList.add('dropdown-item', 'btn');
						readAllLi.setAttribute('onclick', 'readAlarm(event)');
						readAllLi.setAttribute('data-value', 'all');
						readAllLi.textContent = '전체읽기';
						
						alarmUl.appendChild(readAllLi);
						
						for(orderAlarmData of response.orderAlarmDataList){
							const li=document.createElement("li");
							li.classList.add('dropdown-item', 'btn', 'my-2');
							  li.addEventListener('click', function(event) {
							    readAlarm(event);
							  });

							  const rowDiv = document.createElement('div');
							  rowDiv.classList.add('row');

							  const colImgDiv = document.createElement('div');
							  colImgDiv.classList.add('col-3');

							  const orderAlarmNoInput = document.createElement('input');
							  orderAlarmNoInput.setAttribute('type', 'hidden');
							  orderAlarmNoInput.setAttribute('name', 'order_alarm_no');
							  orderAlarmNoInput.setAttribute('value', orderAlarmData.orderAlarmDto.order_alarm_no);

							  const orderProductNoInput = document.createElement('input');
							  orderProductNoInput.setAttribute('type', 'hidden');
							  orderProductNoInput.setAttribute('name', 'order_product_no');
							  orderProductNoInput.setAttribute('value', orderAlarmData.orderProductDto.order_product_no);

							  const productImg = document.createElement('img');
							  productImg.classList.add('w-100', 'px-2', 'align-self-center', 'rounded-4');
							  productImg.setAttribute('src', '/uploadFiles/productThumbnailImg/' + orderAlarmData.productDto.product_thumbnail);

							  colImgDiv.appendChild(orderAlarmNoInput);
							  colImgDiv.appendChild(orderProductNoInput);
							  colImgDiv.appendChild(productImg);

							  const colContentDiv = document.createElement('div');
							  colContentDiv.classList.add('col', 'ps-0');

							  const nameRowDiv = document.createElement('div');
							  nameRowDiv.classList.add('row');

							  const nameColDiv = document.createElement('div');
							  nameColDiv.classList.add('col', 'text-wrap');
							  nameColDiv.style.fontSize = '15px';
							  nameColDiv.textContent = orderAlarmData.productOptionDto.product_option_name;

							  nameRowDiv.appendChild(nameColDiv);

							  const quantityRowDiv = document.createElement('div');
							  quantityRowDiv.classList.add('row');

							  const quantityColDiv = document.createElement('div');
							  quantityColDiv.classList.add('col');
							  quantityColDiv.style.fontSize = '12px';
							  quantityColDiv.textContent = '수량: ' + orderAlarmData.orderProductDto.order_product_quantity;

							  quantityRowDiv.appendChild(quantityColDiv);

							  const dateRowDiv = document.createElement('div');
							  dateRowDiv.classList.add('row');

							  const dateColDiv = document.createElement('div');
							  dateColDiv.classList.add('col');
							  dateColDiv.style.fontSize = '12px';
							  
							  const date = new Date(orderAlarmData.orderAlarmDto.order_alarm_noti_date);

							  // 원하는 형식으로 날짜 포맷 설정
							  const formattedDate = date.toLocaleString('ko-KR', {
							    year: 'numeric',
							    month: '2-digit',
							    day: '2-digit',
							    hour: '2-digit',
							    minute: '2-digit',
							  });
							  dateColDiv.textContent = formattedDate;

							  dateRowDiv.appendChild(dateColDiv);

							  colContentDiv.appendChild(nameRowDiv);
							  colContentDiv.appendChild(quantityRowDiv);
							  colContentDiv.appendChild(dateRowDiv);

							  rowDiv.appendChild(colImgDiv);
							  rowDiv.appendChild(colContentDiv);

							  li.appendChild(rowDiv);
							  
							  alarmUl.appendChild(li);
						}
						
						
					}
					
				}
			}
			//get
			xhr.open("get", "./getAlarm");
			xhr.send();
		}
		function readAlarm(event) {
			const li=event.currentTarget;
			const li_value=li.getAttribute('data-value');
			
			var queryString="";
			const alarmNoList=[];
			
			if(li_value =='all'){
				const alarmUl=document.getElementById("alarmUl");
				const alarmLi=alarmUl.querySelectorAll('li');
				
				for(var i=0;i<alarmLi.length;i++){
					if(i!=0){
						var orderProductNo=alarmLi[i].querySelector('input[name="order_product_no"]');
						var orderAlarmNo=alarmLi[i].querySelector('input[name="order_alarm_no"]');
						
						alarmNoList.push(orderAlarmNo.value);
						queryString+="order_product_no="+orderProductNo.value+"&";
					}
				}
			}else{
				var orderProductNo=li.querySelector('input[name="order_product_no"]');
				var orderAlarmNo=li.querySelector('input[name="order_alarm_no"]');
				
				queryString+="order_product_no="+orderProductNo.value;
				alarmNoList.push(orderAlarmNo.value);
			}
			
			
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					window.location.href="http://localhost:8181/welcomepet/biz/orderManage?"+queryString;
				}
			}
			//get
			xhr.open("post", "./updateAlarmChecked");
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("alarmNoList="+alarmNoList);
		}
		
	</script>

</body>
</html>