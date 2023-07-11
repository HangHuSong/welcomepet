package com.bubble.welcomepet.dto;

public class OrderProductStatusDto {
	private int order_product_status_no ;
	private String order_product_status_name ;
	
	
	public OrderProductStatusDto() {
		super();
	}


	public OrderProductStatusDto(int order_product_status_no, String order_product_status_name) {
		super();
		this.order_product_status_no = order_product_status_no;
		this.order_product_status_name = order_product_status_name;
	}


	public int getOrder_product_status_no() {
		return order_product_status_no;
	}


	public void setOrder_product_status_no(int order_product_status_no) {
		this.order_product_status_no = order_product_status_no;
	}


	public String getOrder_product_status_name() {
		return order_product_status_name;
	}


	public void setOrder_product_status_name(String order_product_status_name) {
		this.order_product_status_name = order_product_status_name;
	}


	@Override
	public String toString() {
		return "OrderProductStatusDto [order_product_status_no=" + order_product_status_no
				+ ", order_product_status_name=" + order_product_status_name + "]";
	}
	
	
	
}
