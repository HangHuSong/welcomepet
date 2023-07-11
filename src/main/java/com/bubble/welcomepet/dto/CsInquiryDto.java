package com.bubble.welcomepet.dto;

import java.util.Date;

public class CsInquiryDto {

	private int cs_inquiry_no;
	private int cs_inquiry_category_no;
	private int customer_no;
	private String cs_inquiry_title;
	private String cs_inquiry_context;
	private Date cs_inquiry_date;
	private int cs_inquiry_status;
	
	public CsInquiryDto() {
		super();
	}
	public CsInquiryDto(int cs_inquiry_no, int cs_inquiry_category_no, int customer_no, String cs_inquiry_title,
			String cs_inquiry_context, Date cs_inquiry_date, int cs_inquiry_status) {
		super();
		this.cs_inquiry_no = cs_inquiry_no;
		this.cs_inquiry_category_no = cs_inquiry_category_no;
		this.customer_no = customer_no;
		this.cs_inquiry_title = cs_inquiry_title;
		this.cs_inquiry_context = cs_inquiry_context;
		this.cs_inquiry_date = cs_inquiry_date;
		this.cs_inquiry_status = cs_inquiry_status;
	}
	public int getCs_inquiry_no() {
		return cs_inquiry_no;
	}
	public void setCs_inquiry_no(int cs_inquiry_no) {
		this.cs_inquiry_no = cs_inquiry_no;
	}
	public int getCs_inquiry_category_no() {
		return cs_inquiry_category_no;
	}
	public void setCs_inquiry_category_no(int cs_inquiry_category_no) {
		this.cs_inquiry_category_no = cs_inquiry_category_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getCs_inquiry_title() {
		return cs_inquiry_title;
	}
	public void setCs_inquiry_title(String cs_inquiry_title) {
		this.cs_inquiry_title = cs_inquiry_title;
	}
	public String getCs_inquiry_context() {
		return cs_inquiry_context;
	}
	public void setCs_inquiry_context(String cs_inquiry_context) {
		this.cs_inquiry_context = cs_inquiry_context;
	}
	public Date getCs_inquiry_date() {
		return cs_inquiry_date;
	}
	public void setCs_inquiry_date(Date cs_inquiry_date) {
		this.cs_inquiry_date = cs_inquiry_date;
	}
	public int getCs_inquiry_status() {
		return cs_inquiry_status;
	}
	public void setCs_inquiry_status(int cs_inquiry_status) {
		this.cs_inquiry_status = cs_inquiry_status;
	}
	
	
}
