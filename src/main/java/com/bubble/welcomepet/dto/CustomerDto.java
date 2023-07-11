package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CustomerDto {

	private int customer_no;
	private String customer_id;
	private String customer_pw;
	private String customer_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date customer_birth;
	private String customer_nickname;
	private String customer_gender;
	private String customer_phone;
	private int customer_status;
	private Date customer_reg_date;
	private int customer_point;
	public CustomerDto() {
		super();
	}
	public CustomerDto(int customer_no, String customer_id, String customer_pw, String customer_name,
			Date customer_birth, String customer_nickname, String customer_gender, String customer_phone,
			int customer_status, Date customer_reg_date, int customer_point) {
		super();
		this.customer_no = customer_no;
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.customer_name = customer_name;
		this.customer_birth = customer_birth;
		this.customer_nickname = customer_nickname;
		this.customer_gender = customer_gender;
		this.customer_phone = customer_phone;
		this.customer_status = customer_status;
		this.customer_reg_date = customer_reg_date;
		this.customer_point = customer_point;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public Date getCustomer_birth() {
		return customer_birth;
	}
	public void setCustomer_birth(Date customer_birth) {
		this.customer_birth = customer_birth;
	}
	public String getCustomer_nickname() {
		return customer_nickname;
	}
	public void setCustomer_nickname(String customer_nickname) {
		this.customer_nickname = customer_nickname;
	}
	public String getCustomer_gender() {
		return customer_gender;
	}
	public void setCustomer_gender(String customer_gender) {
		this.customer_gender = customer_gender;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public int getCustomer_status() {
		return customer_status;
	}
	public void setCustomer_status(int customer_status) {
		this.customer_status = customer_status;
	}
	public Date getCustomer_reg_date() {
		return customer_reg_date;
	}
	public void setCustomer_reg_date(Date customer_reg_date) {
		this.customer_reg_date = customer_reg_date;
	}
	public int getCustomer_point() {
		return customer_point;
	}
	public void setCustomer_point(int customer_point) {
		this.customer_point = customer_point;
	}
	
}
