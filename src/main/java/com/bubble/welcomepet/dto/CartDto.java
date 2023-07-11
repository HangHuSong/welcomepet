package com.bubble.welcomepet.dto;

import java.util.Date;

public class CartDto {
	private int cart_no;
	private int customer_no;
	private int product_option_no;
	private int product_amount;
	private Date cart_product_add_date;
	
	public CartDto() {
		super();
	}
	public CartDto(int cart_no, int customer_no, int product_option_no, int product_amount,
			Date cart_product_add_date) {
		super();
		this.cart_no = cart_no;
		this.customer_no = customer_no;
		this.product_option_no = product_option_no;
		this.product_amount = product_amount;
		this.cart_product_add_date = cart_product_add_date;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public int getProduct_option_no() {
		return product_option_no;
	}
	public void setProduct_option_no(int product_option_no) {
		this.product_option_no = product_option_no;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	public Date getCart_product_add_date() {
		return cart_product_add_date;
	}
	public void setCart_product_add_date(Date cart_product_add_date) {
		this.cart_product_add_date = cart_product_add_date;
	}
	
}
