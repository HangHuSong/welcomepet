package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PointProdOrdDto {

	private int point_product_order_no;
	private int customer_no;
	private int point_product_no;
	private int point_product_order_amount;
	//@DateTimeFormat(pattern = "yy-MM-dd")
	private Date point_product_order_reg_date;

	public PointProdOrdDto() {
		super();
	}

	public PointProdOrdDto(int point_product_order_no, int customer_no, int point_product_no,
			int point_product_order_amount, Date point_product_order_reg_date) {
		super();
		this.point_product_order_no = point_product_order_no;
		this.customer_no = customer_no;
		this.point_product_no = point_product_no;
		this.point_product_order_amount = point_product_order_amount;
		this.point_product_order_reg_date = point_product_order_reg_date;
	}

	public int getPoint_product_order_no() {
		return point_product_order_no;
	}

	public void setPoint_product_order_no(int point_product_order_no) {
		this.point_product_order_no = point_product_order_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getPoint_product_no() {
		return point_product_no;
	}

	public void setPoint_product_no(int point_product_no) {
		this.point_product_no = point_product_no;
	}

	public int getPoint_product_order_amount() {
		return point_product_order_amount;
	}

	public void setPoint_product_order_amount(int point_product_order_amount) {
		this.point_product_order_amount = point_product_order_amount;
	}

	public Date getPoint_product_order_reg_date() {
		return point_product_order_reg_date;
	}

	public void setPoint_product_order_reg_date(Date point_product_order_reg_date) {
		this.point_product_order_reg_date = point_product_order_reg_date;
	}

	@Override
	public String toString() {
		return "PointProdOrdDto [point_product_order_no=" + point_product_order_no + ", customer_no=" + customer_no
				+ ", point_product_no=" + point_product_no + ", point_product_order_amount="
				+ point_product_order_amount + ", point_product_order_reg_date=" + point_product_order_reg_date + "]";
	}

}
