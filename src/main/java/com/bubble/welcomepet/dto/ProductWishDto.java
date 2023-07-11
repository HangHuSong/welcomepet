package com.bubble.welcomepet.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductWishDto {
	private int product_wish_list_no;
	private int customer_no;
	private int product_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_wish_list_reg_date;
	public ProductWishDto() {
		super();
	}
	public ProductWishDto(int product_wish_list_no, int customer_no, int product_no, Date product_wish_list_reg_date) {
		super();
		this.product_wish_list_no = product_wish_list_no;
		this.customer_no = customer_no;
		this.product_no = product_no;
		this.product_wish_list_reg_date = product_wish_list_reg_date;
	}
	public int getProduct_wish_list_no() {
		return product_wish_list_no;
	}
	public void setProduct_wish_list_no(int product_wish_list_no) {
		this.product_wish_list_no = product_wish_list_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public Date getProduct_wish_list_reg_date() {
		return product_wish_list_reg_date;
	}
	public void setProduct_wish_list_reg_date(Date product_wish_list_reg_date) {
		this.product_wish_list_reg_date = product_wish_list_reg_date;
	}
	
	
}
