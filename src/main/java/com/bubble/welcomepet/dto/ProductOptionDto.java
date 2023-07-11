package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductOptionDto {
	private int product_option_no;
	private int product_no;
	private String product_option_name;
	private int product_option_price;
	private int product_option_stock_quantity;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_option_reg_date;
	
	public ProductOptionDto() {
		super();
	}
	public ProductOptionDto(int product_option_no, int product_no, String product_option_name, int product_option_price,
			int product_option_stock_quantity, Date product_option_reg_date) {
		super();
		this.product_option_no = product_option_no;
		this.product_no = product_no;
		this.product_option_name = product_option_name;
		this.product_option_price = product_option_price;
		this.product_option_stock_quantity = product_option_stock_quantity;
		this.product_option_reg_date = product_option_reg_date;
	}
	public int getProduct_option_no() {
		return product_option_no;
	}
	public void setProduct_option_no(int product_option_no) {
		this.product_option_no = product_option_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_option_name() {
		return product_option_name;
	}
	public void setProduct_option_name(String product_option_name) {
		this.product_option_name = product_option_name;
	}
	public int getProduct_option_price() {
		return product_option_price;
	}
	public void setProduct_option_price(int product_option_price) {
		this.product_option_price = product_option_price;
	}
	public int getProduct_option_stock_quantity() {
		return product_option_stock_quantity;
	}
	public void setProduct_option_stock_quantity(int product_option_stock_quantity) {
		this.product_option_stock_quantity = product_option_stock_quantity;
	}
	public Date getProduct_option_reg_date() {
		return product_option_reg_date;
	}
	public void setProduct_option_reg_date(Date product_option_reg_date) {
		this.product_option_reg_date = product_option_reg_date;
	}
	
}
