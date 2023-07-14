package com.bubble.welcomepet.dto;

import java.util.List;

public class OrderRequestDto {
	private List<OrderProductDto> orderProductDtoList;
    private OrdersDto ordersDto;
	public OrderRequestDto() {
		super();
	}
	public OrderRequestDto(List<OrderProductDto> orderProductDtoList, OrdersDto ordersDto) {
		super();
		this.orderProductDtoList = orderProductDtoList;
		this.ordersDto = ordersDto;
	}
	public List<OrderProductDto> getOrderProductDtoList() {
		return orderProductDtoList;
	}
	public void setOrderProductDtoList(List<OrderProductDto> orderProductDtoList) {
		this.orderProductDtoList = orderProductDtoList;
	}
	public OrdersDto getOrdersDto() {
		return ordersDto;
	}
	public void setOrdersDto(OrdersDto ordersDto) {
		this.ordersDto = ordersDto;
	}
    
}
