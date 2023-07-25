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

</head>
<body>
	<div class="container" style="margin: 0 0;">
		<div class="row" style="width: 1900px;">
			<div class="col-2 text-center ps-4 text-white d-flex align-items-stretch align-top"
				style="background-color: rgb(29, 33, 42);"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-8 px-0">
				<div class="row mx-1">
					<div class="col">
						<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
					</div>
				</div>
				<div class="row px-5 text-center bg-light mx-1">
					<div class="col">
						<div class="row my-2">
							<div class="col fs-5 fw-bold text-start py-3">상품성과</div>
						</div>
						<div class="row">
							<div class="col mx-2">

								<div class="row my-2">
									<div class="col border bg-white">
										<!-- 상품카테고리(소)별 결제금액 -->
										<div class="row">
											<div class="col text-start fw-bold py-2 border-bottom">상품카테고리(소)별 결제금액</div>
										</div>
										<div class="row">
											<div class="col">
												<canvas id="subCategorySalesChart"></canvas>
											</div>
										</div>
									</div>
									<div class="col border ms-2 bg-white">
										<!-- 상품카테고리(소)별 환불율 -->
										<div class="row">
											<div class="col text-start fw-bold py-2 border-bottom">상품카테고리(소)별 환불율</div>
										</div>
										<div class="row">
											<div class="col">
												<canvas id="subCategoryRefundChart"></canvas>
											</div>
										</div>
									</div>
									
								</div>
								<div class="row my-2">
									<div class="col border bg-white">
										<!-- 상품별 결제금액 -->
										<div class="row">
											<div class="col text-start fw-bold py-2 border-bottom">상품별 결제금액</div>
										</div>
										<div class="row">
											<div class="col">
												<canvas id="productSalesChart"></canvas>
											</div>
										</div>
									</div>
									<div class="col border ms-2 bg-white">
										<!-- 상품별 환불율 -->
										<div class="row">
											<div class="col text-start fw-bold py-2 border-bottom">상품별 환불율</div>
										</div>
										<div class="row">
											<div class="col">
												<canvas id="productRefundChart"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
		const productSalesChart = document.getElementById('productSalesChart');
		
		var productSalesList=${productPerformanceData.productSalesList};
		productSalesLabels=[]
		productSales=[]
		for(salesData of productSalesList){
			productSalesLabels.push(salesData['PRODUCTNAME']);
			productSales.push(salesData['SALES']);
		}
		
		
		new Chart(productSalesChart,{
			type:'bar',
			data:{
				labels:productSalesLabels,
				datasets:[{
					label:"결제총액",
					data:productSales
				}]
			},
			options:{
				indexAxis: 'y'
			}
		
		});
		
		const productRefundChart = document.getElementById('productRefundChart');
				
				var productRefundList=${productPerformanceData.productRefundList};
				productRefundLabels=[]
				productRefund=[]
				for(salesData of productRefundList){
					productRefundLabels.push(salesData['PRODUCTNAME']);
					productRefund.push(salesData['SALES']);
				}
				
				
				new Chart(productRefundChart,{
					
					data:{
						labels:productSalesLabels,
						datasets:[{
							type:'bar',
							label:"결제총액",
							data:productSales,
							backgroundColor: 'rgba(75,192,192,0.5)'
						},{
							type:'line',
							label:"환불총액",
							data:productRefund,
							backgroundColor: 'rgba(255,99,132,0.8)',
							borderColor:'rgba(255,99,132,0.8)'
						}]
					},
					options:{
						indexAxis: 'y'
					}
				
				});
		
		const subCategorySalesChart = document.getElementById('subCategorySalesChart');
		
		var subCategorySalesList=${productPerformanceData.subCategorySalesList};
		subCategorySalesLabels=[]
		subCategorySales=[]
		for(salesData of subCategorySalesList){
			subCategorySalesLabels.push(salesData['SUBCATEGORYNAME']);
			subCategorySales.push(salesData['SALES']);
		}
		
		
		new Chart(subCategorySalesChart,{
			type:'bar',
			data:{
				labels:subCategorySalesLabels,
				datasets:[{
					label:"결제총액",
					data:subCategorySales
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
		
		const subCategoryRefundChart = document.getElementById('subCategoryRefundChart');
		
		var subCategoryRefundList=${productPerformanceData.subCategoryRefundList};
		subCategoryRefundLabels=[]
		subCategoryRefund=[]
		for(salesData of subCategoryRefundList){
			subCategoryRefundLabels.push(salesData['SUBCATEGORYNAME']);
			subCategoryRefund.push(salesData['SALES']);
		}
		
		
		new Chart(subCategoryRefundChart,{
			data:{
				labels:subCategorySalesLabels,
				datasets:[{
					type:'bar',
					label:"결제총액",
					data:subCategorySales,
					backgroundColor: 'rgba(75,192,192,0.5)'
				},{
					type:'line',
					label:"환불총액",
					data:subCategoryRefund,
					backgroundColor: 'rgba(255,99,132,0.8)',
					borderColor:'rgba(255,99,132,0.8)'
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