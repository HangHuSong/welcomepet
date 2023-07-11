package com.bubble.welcomepet.dto;

public class ShippingDto {
	private int shipping_no;
	private int shipping_company_no;
	private int order_product_no;
	private String shipping_tracking_no;
	
	public ShippingDto() {
		super();
	}
	
	

	public ShippingDto(int shipping_no, int shipping_company_no, int order_product_no, String shipping_tracking_no) {
		super();
		this.shipping_no = shipping_no;
		this.shipping_company_no = shipping_company_no;
		this.order_product_no = order_product_no;
		this.shipping_tracking_no = shipping_tracking_no;
	}



	public int getShipping_no() {
		return shipping_no;
	}
	public void setShipping_no(int shipping_no) {
		this.shipping_no = shipping_no;
	}
	public int getShipping_company_no() {
		return shipping_company_no;
	}
	public void setShipping_company_no(int shipping_company_no) {
		this.shipping_company_no = shipping_company_no;
	}
	public int getOrder_product_no() {
		return order_product_no;
	}
	public void setOrder_product_no(int order_product_no) {
		this.order_product_no = order_product_no;
	}
	public String getShipping_tracking_no() {
		return shipping_tracking_no;
	}
	public void setShipping_tracking_no(String shipping_tracking_no) {
		this.shipping_tracking_no = shipping_tracking_no;
	}



	@Override
	public String toString() {
		return "ShippingDto [shipping_no=" + shipping_no + ", shipping_company_no=" + shipping_company_no
				+ ", order_product_no=" + order_product_no + ", shipping_tracking_no=" + shipping_tracking_no + "]";
	}

	
	
}
