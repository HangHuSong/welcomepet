package com.bubble.welcomepet.dto;

import java.util.Date;

public class BizDto {
	private int biz_no ;
	private int biz_status_no;
	private String biz_id ;
	private String biz_pw ;
	private String biz_phone;
	private String biz_email ;
	private String biz_store_name;
	private String biz_store_main_img;
	private String biz_address ;
	private Date biz_reg_date;
	
	public BizDto() {
		super();
	}

	public BizDto(int biz_no, int biz_status_no, String biz_id, String biz_pw, String biz_phone, String biz_email,
			String biz_store_name, String biz_store_main_img, String biz_address, Date biz_reg_date) {
		super();
		this.biz_no = biz_no;
		this.biz_status_no = biz_status_no;
		this.biz_id = biz_id;
		this.biz_pw = biz_pw;
		this.biz_phone = biz_phone;
		this.biz_email = biz_email;
		this.biz_store_name = biz_store_name;
		this.biz_store_main_img = biz_store_main_img;
		this.biz_address = biz_address;
		this.biz_reg_date = biz_reg_date;
	}

	public int getBiz_no() {
		return biz_no;
	}

	public void setBiz_no(int biz_no) {
		this.biz_no = biz_no;
	}

	public int getBiz_status_no() {
		return biz_status_no;
	}

	public void setBiz_status_no(int biz_status_no) {
		this.biz_status_no = biz_status_no;
	}

	public String getBiz_id() {
		return biz_id;
	}

	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}

	public String getBiz_pw() {
		return biz_pw;
	}

	public void setBiz_pw(String biz_pw) {
		this.biz_pw = biz_pw;
	}

	public String getBiz_phone() {
		return biz_phone;
	}

	public void setBiz_phone(String biz_phone) {
		this.biz_phone = biz_phone;
	}

	public String getBiz_email() {
		return biz_email;
	}

	public void setBiz_email(String biz_email) {
		this.biz_email = biz_email;
	}

	public String getBiz_store_name() {
		return biz_store_name;
	}

	public void setBiz_store_name(String biz_store_name) {
		this.biz_store_name = biz_store_name;
	}

	public String getBiz_store_main_img() {
		return biz_store_main_img;
	}

	public void setBiz_store_main_img(String biz_store_main_img) {
		this.biz_store_main_img = biz_store_main_img;
	}

	public String getBiz_address() {
		return biz_address;
	}

	public void setBiz_address(String biz_address) {
		this.biz_address = biz_address;
	}

	public Date getBiz_reg_date() {
		return biz_reg_date;
	}

	public void setBiz_reg_date(Date biz_reg_date) {
		this.biz_reg_date = biz_reg_date;
	}

	@Override
	public String toString() {
		return "BizDto [biz_no=" + biz_no + ", biz_status_no=" + biz_status_no + ", biz_id=" + biz_id + ", biz_pw="
				+ biz_pw + ", biz_phone=" + biz_phone + ", biz_email=" + biz_email + ", biz_store_name="
				+ biz_store_name + ", biz_store_main_img=" + biz_store_main_img + ", biz_address=" + biz_address
				+ ", biz_reg_date=" + biz_reg_date + "]";
	}
	
	
	
	
	
	
}
