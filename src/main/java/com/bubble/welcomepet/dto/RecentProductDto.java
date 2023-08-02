package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RecentProductDto {
	private int recent_product_no;
	private int customer_no;
	private int product_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date recent_product_reg_date;
	public RecentProductDto() {
		super();
	}
	public RecentProductDto(int recent_product_no, int customer_no, int product_no, Date recent_product_reg_date) {
		super();
		this.recent_product_no = recent_product_no;
		this.customer_no = customer_no;
		this.product_no = product_no;
		this.recent_product_reg_date = recent_product_reg_date;
	}
	public int getRecent_product_no() {
		return recent_product_no;
	}
	public void setRecent_product_no(int recent_product_no) {
		this.recent_product_no = recent_product_no;
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
	public Date getRecent_product_reg_date() {
		return recent_product_reg_date;
	}
	public void setRecent_product_reg_date(Date recent_product_reg_date) {
		this.recent_product_reg_date = recent_product_reg_date;
	}
	
}
