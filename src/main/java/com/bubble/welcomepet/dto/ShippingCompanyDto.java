package com.bubble.welcomepet.dto;

public class ShippingCompanyDto {
	private int shipping_company_no;
	private String shipping_company_name;
	public ShippingCompanyDto() {
		super();
	}
	public ShippingCompanyDto(int shipping_company_no, String shipping_company_name) {
		super();
		this.shipping_company_no = shipping_company_no;
		this.shipping_company_name = shipping_company_name;
	}
	public int getShipping_company_no() {
		return shipping_company_no;
	}
	public void setShipping_company_no(int shipping_company_no) {
		this.shipping_company_no = shipping_company_no;
	}
	public String getShipping_company_name() {
		return shipping_company_name;
	}
	public void setShipping_company_name(String shipping_company_name) {
		this.shipping_company_name = shipping_company_name;
	}
	@Override
	public String toString() {
		return "ShippingCompanyDto [shipping_company_no=" + shipping_company_no + ", shipping_company_name="
				+ shipping_company_name + "]";
	}
	
	
}
