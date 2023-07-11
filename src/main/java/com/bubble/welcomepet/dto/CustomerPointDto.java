package com.bubble.welcomepet.dto;

public class CustomerPointDto {
	private int customer_point_no;
	private int customer_no;
	private int customer_point;

	public CustomerPointDto() {
		super();
	}

	public CustomerPointDto(int customer_point_no, int customer_no, int customer_point) {
		super();
		this.customer_point_no = customer_point_no;
		this.customer_no = customer_no;
		this.customer_point = customer_point;
	}

	public int getCustomer_point_no() {
		return customer_point_no;
	}

	public void setCustomer_point_no(int customer_point_no) {
		this.customer_point_no = customer_point_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getCustomer_point() {
		return customer_point;
	}

	public void setCustomer_point(int customer_point) {
		this.customer_point = customer_point;
	}

	@Override
	public String toString() {
		return "CustomerPointDto [customer_point_no=" + customer_point_no + ", customer_no=" + customer_no
				+ ", customer_point=" + customer_point + "]";
	}

	

}
