package com.bubble.welcomepet.dto;

import java.util.Date;

public class ProductInquiryDto {
	private int product_inquiry_no ;
	private int product_no ;
	private int customer_no ;
	private String product_inquiry_title ;
	private String product_inquiry_context;
	private int product_inquiry_is_public ;
	private Date product_inquiry_reg_date ;
	public ProductInquiryDto() {
		super();
	}
	public ProductInquiryDto(int product_inquiry_no, int product_no, int customer_no, String product_inquiry_title,
			String product_inquiry_context, int product_inquiry_is_public, Date product_inquiry_reg_date) {
		super();
		this.product_inquiry_no = product_inquiry_no;
		this.product_no = product_no;
		this.customer_no = customer_no;
		this.product_inquiry_title = product_inquiry_title;
		this.product_inquiry_context = product_inquiry_context;
		this.product_inquiry_is_public = product_inquiry_is_public;
		this.product_inquiry_reg_date = product_inquiry_reg_date;
	}
	public int getProduct_inquiry_no() {
		return product_inquiry_no;
	}
	public void setProduct_inquiry_no(int product_inquiry_no) {
		this.product_inquiry_no = product_inquiry_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getProduct_inquiry_title() {
		return product_inquiry_title;
	}
	public void setProduct_inquiry_title(String product_inquiry_title) {
		this.product_inquiry_title = product_inquiry_title;
	}
	public String getProduct_inquiry_context() {
		return product_inquiry_context;
	}
	public void setProduct_inquiry_context(String product_inquiry_context) {
		this.product_inquiry_context = product_inquiry_context;
	}
	public int getProduct_inquiry_is_public() {
		return product_inquiry_is_public;
	}
	public void setProduct_inquiry_is_public(int product_inquiry_is_public) {
		this.product_inquiry_is_public = product_inquiry_is_public;
	}
	public Date getProduct_inquiry_reg_date() {
		return product_inquiry_reg_date;
	}
	public void setProduct_inquiry_reg_date(Date product_inquiry_reg_date) {
		this.product_inquiry_reg_date = product_inquiry_reg_date;
	}
	@Override
	public String toString() {
		return "ProductInquiryDto [product_inquiry_no=" + product_inquiry_no + ", product_no=" + product_no
				+ ", customer_no=" + customer_no + ", product_inquiry_title=" + product_inquiry_title
				+ ", product_inquiry_context=" + product_inquiry_context + ", product_inquiry_is_public="
				+ product_inquiry_is_public + ", product_inquiry_reg_date=" + product_inquiry_reg_date + "]";
	}
	
	
	
}
