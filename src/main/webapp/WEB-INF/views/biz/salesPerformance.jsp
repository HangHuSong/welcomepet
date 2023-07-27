<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style type="text/css">
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
</head>
<body>
	<div class="container" style="margin: 0 0;">
		<div class="row" style="width: 1920px;">
			<div class="col-2" style="background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-10 bg-light">
				<div class="row bg-white">
					<div class="col">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row px-5 text-center mb-5">
					<div class="col px-5">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">판매성과</div>
						</div>
						<div class="row my-4">
							<div class="col">
								<div class="row my-3">
									<!-- 일별결제금액 -->
									<div class="col border bg-white shadow">
										<div class="row py-3 border-bottom">
											<div class="col text-start fw-bold align-self-center">일별
												결제금액</div>
											<div class="col-3 text-end">
												<span><button class="btn btn-primary"
														id="defaultButton" onclick="getDefaultChart()">기본</button></span>
												<span><button class="btn btn-outline-dark"
														id="dustButton" onclick="getDustChart()">미세먼지</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<canvas id="dailyChart"></canvas>
											</div>
										</div>
									</div>
								</div>
								<div class="row my-5">
									<div class="col border bg-white shadow">
										<!-- 요일별 결제금액 -->
										<div class="row">
											<div class="col text-start fw-bold py-2 border-bottom">요일별
												평균 결제금액</div>
										</div>
										<div class="row">
											<div class="col">
												<canvas id="weekdayChart"></canvas>
											</div>
										</div>
									</div>
									<div class="col border ms-2 bg-white shadow">
										<!-- 월별 결제금액 -->
										<div class="row">
											<div class="col text-start fw-bold py-2 border-bottom">월별
												평균 결제금액</div>
										</div>
										<div class="row">
											<div class="col">
												<canvas id="monthlyChart"></canvas>
											</div>
										</div>
									</div>
								</div>
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
	</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
		const dailyChart = document.getElementById('dailyChart');
		
		var dailySalesList=${salesPerformanceData.dailySalesList};
		dailyLabels=[]
		dailySales=[]
		for(dailySaleData of dailySalesList){
			dailyLabels.push(dailySaleData['ORDER_DATE']);
			dailySales.push(dailySaleData['DAILY_SALES']);
		}
		
		
		var dailyChartCanvas=new Chart(dailyChart,{
			type:'bar',
			data:{
				labels:dailyLabels,
				datasets:[{
					label:"결제액",
					data:dailySales
				}]
			},
			options:{
				scales:{
					y:{
						beginAtZero:true
					}
				}
			}
		
		});
		
		function getDefaultChart() {
			const defaultButton=document.getElementById("defaultButton");
			const dustButton=document.getElementById("dustButton");
			
			if(!defaultButton.classList.contains('btn-primary')){
				defaultButton.classList.remove('btn-outline-primary');
				defaultButton.classList.add('btn-primary');
			}
			if(dustButton.classList.contains('btn-dark')){
				dustButton.classList.remove('btn-dark');
				dustButton.classList.add('btn-outline-dark');
			}
			
			dailyChartCanvas.destroy();
			
			dailyChartCanvas=new Chart(dailyChart,{
				type:'bar',
				data:{
					labels:dailyLabels,
					datasets:[{
						label:"결제액",
						data:dailySales
					}]
				},
				options:{
					scales:{
						y:{
							beginAtZero:true
						}
					}
				}
			
			});
		}
		
		
		function getDustChart() {
			const defaultButton=document.getElementById("defaultButton");
			const dustButton=document.getElementById("dustButton");
			
			if(defaultButton.classList.contains('btn-primary')){
				defaultButton.classList.remove('btn-primary');
				defaultButton.classList.add('btn-outline-primary');
			}
			if(!dustButton.classList.contains('btn-dark')){
				dustButton.classList.add('btn-dark');
				dustButton.classList.remove('btn-outline-dark');
			}
			min_date=dailyLabels[0].split('-').join('');
			max_date=dailyLabels[dailyLabels.length-1].split('-').join('');
			
			var requestParam=encodeURIComponent('serviceKey')+'='+('mjFj9dLHaEmOBk5BRURR0SQJ1iXYvdPNa8BShlMNI0pvRsGVlOizta4zcmMwAwPNdsPY1oa65bokbj3MT2nZbw%3D%3D');
			requestParam+='&'+encodeURIComponent('returnType') + '=' + encodeURIComponent('json');
			requestParam+='&'+encodeURIComponent('inqBginDt') + '=' + encodeURIComponent(min_date);
			requestParam+='&'+encodeURIComponent('inqEndDt') + '=' + encodeURIComponent(max_date);
			requestParam+='&'+encodeURIComponent('msrstnName')+'='+('강남구');
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	        
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	
	            	dustData=[]
	            	for(dust of response.response.body.items){
	            		dustData.push(dust.pm10Value);
	            		
	            	}
	            	
	     
	            	
	            	dailyChartCanvas.destroy();
	            	
	    			dailyChartCanvas=new Chart(dailyChart,{
						type:'bar',
						data: {
					        labels: dailyLabels,
					        datasets: [{
					            label: "결제액",
					            data: dailySales,
					            order: 2,
					            yAxisID: 'y'
					        }, {
					            type: 'line',
					            label: "미세먼지",
					            data: dustData,
					            order: 1,
					            yAxisID: 'y1'
					        }]
					    },
					    options: {
				            scales: {
				                y: {
				                    beginAtZero: true,
				                    position: 'left',
				                    ticks: {
				                        precision: 0
				                    }
				                },
				                y1: {
				                    beginAtZero: true,
				                    position: 'right',
				                    suggestedMax:45,
				                    ticks: {
				                        precision: 0
				                    },
				                    grid: {
				                        drawOnChartArea: false
				                    }
				                }
				            }
				        }
	    			});
	    			
	    			
	    			
	    			
	    			
	            	
	            }
	        }
	
		
	        xhr.open("get", "http://apis.data.go.kr/B552584/ArpltnStatsSvc/getMsrstnAcctoRDyrg?"+requestParam);
	        xhr.send()
			
		}
		
		const weekdayChart = document.getElementById('weekdayChart');
		
		var weekdaySalesList=${salesPerformanceData.weekdaySalesList};
		weekdayLabels=[]
		weekdaySales=[]
		for(weekdaySaleData of weekdaySalesList){
			weekdayLabels.push(weekdaySaleData['WEEKDAY']);
			weekdaySales.push(weekdaySaleData['WEEKDAYSALES']);
		}
		
		
		new Chart(weekdayChart,{
			type:'bar',
			data:{
				labels:weekdayLabels,
				datasets:[{
					label:"평균 결제 금액",
					data:weekdaySales
				}]
			},
			options:{
				scales:{
					y:{
						beginAtZero:true
					}
				}
			}
		
		});
		
		const monthlyChart = document.getElementById('monthlyChart');
		
		var monthlySalesList=${salesPerformanceData.monthlySalesList};
		monthlyLabels=[]
		monthlySales=[]
		for(monthlySaleData of monthlySalesList){
			monthlyLabels.push(monthlySaleData['MONTH']);
			monthlySales.push(monthlySaleData['MONTHLYSALES']);
		}
		
		
		new Chart(monthlyChart,{
			type:'bar',
			data:{
				labels:monthlyLabels,
				datasets:[{
					label:"평균 결제 금액",
					data:monthlySales
				}]
			},
			options:{
				scales:{
					y:{
						beginAtZero:true
					}
				}
			}
		
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>