package com.bubble.welcomepet.order.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.ExchangeDto;
import com.bubble.welcomepet.dto.OrderAlarmDto;
import com.bubble.welcomepet.dto.OrderProductDto;
import com.bubble.welcomepet.dto.OrderProductStatusDto;
import com.bubble.welcomepet.dto.OrdersDto;
import com.bubble.welcomepet.dto.ReturnDto;
import com.bubble.welcomepet.dto.ReturnExchangeReasonDto;

public interface OrderSqlMapper {

	public List<OrderProductDto> getOrderProductByBizNoAndStatusNo(
			@Param(value = "biz_no") int biz_no, 
			@Param(value = "order_product_status_no") int order_product_status_no);

	public OrdersDto getOrderByNo(int orders_no);

	public void updateOrderStatusNoByNo(OrderProductDto orderProductDto);

	public ExchangeDto getExchangeByOrderProductNo(int order_product_no);

	public ReturnExchangeReasonDto getReturnExchangeReasonByNo(int return_exchange_reason_no);

	public ReturnDto getReturnByOrderProductNo(int order_product_no);

	public List<Map<String, Object>> getDailySalesByBizNo(int biz_no);

	public List<Map<String, Object>> getWeekDaySalesByBizNo(int biz_no);

	public List<Map<String, Object>> getMonthlySalesByBizNo(int biz_no);

	public OrderProductStatusDto getOrderStatusByNo(int order_product_status_no);

	public List<Map<String, Object>> getSubCategorySalesByBizNo(int biz_no);

	public List<Map<String, Object>> getSubCategoryRefundByBizNo(int biz_no);

	public List<Map<String, Object>> getProductSalesByBizNo(int biz_no);

	public List<Map<String, Object>> getProductRefundByBizNo(int biz_no);

	public List<Integer> getOrderMonthByBizNo(int biz_no);

	public List<Integer> getOrderYearByBizNo(int biz_no);


	public List<OrderProductDto> getSettlementProductListByDateAndBizNo(@Param(value = "biz_no") int biz_no, 
			@Param(value = "year") int year,@Param(value = "month") int month);

	public int getSalesByNoAndDate(@Param(value = "biz_no") int biz_no, 
			@Param(value = "year") int year,@Param(value = "month") int month);

	public List<OrderAlarmDto> getOrderAlarmByBizNoAndIsChecked(@Param(value = "biz_no") int biz_no, @Param(value = "order_alarm_is_checked") int order_alarm_is_checked);

	public int countOrderAlarmByBizNoAndIsChecked(@Param(value = "biz_no") int biz_no, @Param(value = "order_alarm_is_checked") int order_alarm_is_checked);

	public OrderProductDto getOrderProductByNo(int order_product_no);

	public void updateAlarmCheckedTo1(int order_alarm_no);

	public int countOrderProductByBizNoAndStatusNo(@Param(value = "biz_no") int biz_no,@Param(value = "order_product_status_no") int order_product_status_no);

	public int sumOrderProductPaymentByBizNoAndDate(@Param(value = "biz_no") int biz_no,@Param(value = "date") String date);

	public int countOrderProductByBizNoAndDate(@Param(value = "biz_no") int biz_no, @Param(value = "date") String date);

	public int sumWeeklyOrderProductPaymentByBizNoAndDate(@Param(value = "biz_no") int biz_no, @Param(value = "date") String date);

	public int countWeeklyOrderProductPaymentByBizNoAndDate(@Param(value = "biz_no") int biz_no, @Param(value = "date") String date);

	public List<Map<String,Object>> getTop5OrderProductByBizNo(int biz_no);//주문건수기준 정렬

	

}
