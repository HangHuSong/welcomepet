package com.bubble.welcomepet.dto;

import java.util.Date;

public class CustomerBanDto {
	private int ban_no;
	private int customer_no;
	private int emp_no;
	private Date ban_start_date;
	private Date ban_end_date;
	private String ban_reason;

	public CustomerBanDto() {
		super();
	}

	public CustomerBanDto(int ban_no, int customer_no, int emp_no, Date ban_start_date, Date ban_end_date,
			String ban_reason) {
		super();
		this.ban_no = ban_no;
		this.customer_no = customer_no;
		this.emp_no = emp_no;
		this.ban_start_date = ban_start_date;
		this.ban_end_date = ban_end_date;
		this.ban_reason = ban_reason;
	}

	public int getBan_no() {
		return ban_no;
	}

	public void setBan_no(int ban_no) {
		this.ban_no = ban_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public Date getBan_start_date() {
		return ban_start_date;
	}

	public void setBan_start_date(Date ban_start_date) {
		this.ban_start_date = ban_start_date;
	}

	public Date getBan_end_date() {
		return ban_end_date;
	}

	public void setBan_end_date(Date ban_end_date) {
		this.ban_end_date = ban_end_date;
	}

	public String getBan_reason() {
		return ban_reason;
	}

	public void setBan_reason(String ban_reason) {
		this.ban_reason = ban_reason;
	}

	@Override
	public String toString() {
		return "CustomerBanDto [ban_no=" + ban_no + ", customer_no=" + customer_no + ", emp_no=" + emp_no
				+ ", ban_start_date=" + ban_start_date + ", ban_end_date=" + ban_end_date + ", ban_reason=" + ban_reason
				+ "]";
	}

}
