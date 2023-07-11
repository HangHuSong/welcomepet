package com.bubble.welcomepet.dto;

import java.util.Date;

public class CsInquiryReplyDto {
	private int cs_inquiry_reply_no;
	private int emp_no;
	private int cs_inquiry_no;
	private String cs_inquiry_reply_context;
	private Date cs_inquiry_reply_date;

	public CsInquiryReplyDto() {
		super();
	}

	public CsInquiryReplyDto(int cs_inquiry_reply_no, int emp_no, int cs_inquiry_no, String cs_inquiry_reply_context,
			Date cs_inquiry_reply_date) {
		super();
		this.cs_inquiry_reply_no = cs_inquiry_reply_no;
		this.emp_no = emp_no;
		this.cs_inquiry_no = cs_inquiry_no;
		this.cs_inquiry_reply_context = cs_inquiry_reply_context;
		this.cs_inquiry_reply_date = cs_inquiry_reply_date;
	}

	public int getCs_inquiry_reply_no() {
		return cs_inquiry_reply_no;
	}

	public void setCs_inquiry_reply_no(int cs_inquiry_reply_no) {
		this.cs_inquiry_reply_no = cs_inquiry_reply_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getCs_inquiry_no() {
		return cs_inquiry_no;
	}

	public void setCs_inquiry_no(int cs_inquiry_no) {
		this.cs_inquiry_no = cs_inquiry_no;
	}

	public String getCs_inquiry_reply_context() {
		return cs_inquiry_reply_context;
	}

	public void setCs_inquiry_reply_context(String cs_inquiry_reply_context) {
		this.cs_inquiry_reply_context = cs_inquiry_reply_context;
	}

	public Date getCs_inquiry_reply_date() {
		return cs_inquiry_reply_date;
	}

	public void setCs_inquiry_reply_date(Date cs_inquiry_reply_date) {
		this.cs_inquiry_reply_date = cs_inquiry_reply_date;
	}

	@Override
	public String toString() {
		return "CsInquiryReplyDto [cs_inquiry_reply_no=" + cs_inquiry_reply_no + ", emp_no=" + emp_no
				+ ", cs_inquiry_no=" + cs_inquiry_no + ", cs_inquiry_reply_context=" + cs_inquiry_reply_context
				+ ", cs_inquiry_reply_date=" + cs_inquiry_reply_date + "]";
	}

}
