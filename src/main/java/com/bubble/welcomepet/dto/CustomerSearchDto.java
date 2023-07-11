package com.bubble.welcomepet.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CustomerSearchDto {
	private int customer_search_no;
	private int customer_no;
	private String search_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date search_date;
	public CustomerSearchDto() {
		super();
	}
	public CustomerSearchDto(int customer_search_no, int customer_no, String search_content, Date search_date) {
		super();
		this.customer_search_no = customer_search_no;
		this.customer_no = customer_no;
		this.search_content = search_content;
		this.search_date = search_date;
	}
	public int getCustomer_search_no() {
		return customer_search_no;
	}
	public void setCustomer_search_no(int customer_search_no) {
		this.customer_search_no = customer_search_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getSearch_content() {
		return search_content;
	}
	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}
	public Date getSearch_date() {
		return search_date;
	}
	public void setSearch_date(Date search_date) {
		this.search_date = search_date;
	}
	
	
}
