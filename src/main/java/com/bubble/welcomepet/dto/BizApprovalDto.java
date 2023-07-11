package com.bubble.welcomepet.dto;

import java.util.Date;

public class BizApprovalDto {
	private int biz_approval_no;
	private int biz_approval_request_no;
	private int emp_no;
	private int biz_status_no;
	private String biz_approval_message;
	private String biz_approval_emp_memo;
	private Date biz_approval_date;
	
	public BizApprovalDto() {
		super();
	}

	public BizApprovalDto(int biz_approval_no, int biz_approval_request_no, int emp_no, int biz_status_no,
			String biz_approval_message, String biz_approval_emp_memo, Date biz_approval_date) {
		super();
		this.biz_approval_no = biz_approval_no;
		this.biz_approval_request_no = biz_approval_request_no;
		this.emp_no = emp_no;
		this.biz_status_no = biz_status_no;
		this.biz_approval_message = biz_approval_message;
		this.biz_approval_emp_memo = biz_approval_emp_memo;
		this.biz_approval_date = biz_approval_date;
	}

	public int getBiz_approval_no() {
		return biz_approval_no;
	}

	public void setBiz_approval_no(int biz_approval_no) {
		this.biz_approval_no = biz_approval_no;
	}

	public int getBiz_approval_request_no() {
		return biz_approval_request_no;
	}

	public void setBiz_approval_request_no(int biz_approval_request_no) {
		this.biz_approval_request_no = biz_approval_request_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getBiz_status_no() {
		return biz_status_no;
	}

	public void setBiz_status_no(int biz_status_no) {
		this.biz_status_no = biz_status_no;
	}

	public String getBiz_approval_message() {
		return biz_approval_message;
	}

	public void setBiz_approval_message(String biz_approval_message) {
		this.biz_approval_message = biz_approval_message;
	}

	public String getBiz_approval_emp_memo() {
		return biz_approval_emp_memo;
	}

	public void setBiz_approval_emp_memo(String biz_approval_emp_memo) {
		this.biz_approval_emp_memo = biz_approval_emp_memo;
	}

	public Date getBiz_approval_date() {
		return biz_approval_date;
	}

	public void setBiz_approval_date(Date biz_approval_date) {
		this.biz_approval_date = biz_approval_date;
	}

	@Override
	public String toString() {
		return "BizApprovalDto [biz_approval_no=" + biz_approval_no + ", biz_approval_request_no="
				+ biz_approval_request_no + ", emp_no=" + emp_no + ", biz_status_no=" + biz_status_no
				+ ", biz_approval_message=" + biz_approval_message + ", biz_approval_emp_memo=" + biz_approval_emp_memo
				+ ", biz_approval_date=" + biz_approval_date + "]";
	}

	
	
}
