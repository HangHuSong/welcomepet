package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PointProdDto {

	private int point_product_no;
	private int customer_no;
	private String point_product_title;
	private String point_product_content;
	private int point_product_price;
	private int point_product_total_amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date point_product_reg_date;

	public PointProdDto() {
		super();
	}

	public PointProdDto(int point_product_no, int customer_no, String point_product_title, String point_product_content,
			int point_product_price, int point_product_total_amount, Date point_product_reg_date) {
		super();
		this.point_product_no = point_product_no;
		this.customer_no = customer_no;
		this.point_product_title = point_product_title;
		this.point_product_content = point_product_content;
		this.point_product_price = point_product_price;
		this.point_product_total_amount = point_product_total_amount;
		this.point_product_reg_date = point_product_reg_date;
	}

	public int getPoint_product_no() {
		return point_product_no;
	}

	public void setPoint_product_no(int point_product_no) {
		this.point_product_no = point_product_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getPoint_product_title() {
		return point_product_title;
	}

	public void setPoint_product_title(String point_product_title) {
		this.point_product_title = point_product_title;
	}

	public String getPoint_product_content() {
		return point_product_content;
	}

	public void setPoint_product_content(String point_product_content) {
		this.point_product_content = point_product_content;
	}

	public int getPoint_product_price() {
		return point_product_price;
	}

	public void setPoint_product_price(int point_product_price) {
		this.point_product_price = point_product_price;
	}

	public int getPoint_product_total_amount() {
		return point_product_total_amount;
	}

	public void setPoint_product_total_amount(int point_product_total_amount) {
		this.point_product_total_amount = point_product_total_amount;
	}

	public Date getPoint_product_reg_date() {
		return point_product_reg_date;
	}

	public void setPoint_product_reg_date(Date point_product_reg_date) {
		this.point_product_reg_date = point_product_reg_date;
	}

	@Override
	public String toString() {
		return "PointProdDto [point_product_no=" + point_product_no + ", customer_no=" + customer_no
				+ ", point_product_title=" + point_product_title + ", point_product_content=" + point_product_content
				+ ", point_product_price=" + point_product_price + ", point_product_total_amount="
				+ point_product_total_amount + ", point_product_reg_date=" + point_product_reg_date + "]";
	}

}
