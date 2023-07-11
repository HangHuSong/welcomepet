package com.bubble.welcomepet.dto;

public class CustomerAddressDto {
	private int customer_address_no;
	private int customer_no;
	private String customer_address_name;
	private String customer_address_receiver;
	private String customer_address_main;
	private String customer_address_detail;
	private String customer_address_phone;
	private int customer_address_default;
	public CustomerAddressDto() {
		super();
	}
	public CustomerAddressDto(int customer_address_no, int customer_no, String customer_address_name,
			String customer_address_receiver, String customer_address_main, String customer_address_detail,
			String customer_address_phone, int customer_address_default) {
		super();
		this.customer_address_no = customer_address_no;
		this.customer_no = customer_no;
		this.customer_address_name = customer_address_name;
		this.customer_address_receiver = customer_address_receiver;
		this.customer_address_main = customer_address_main;
		this.customer_address_detail = customer_address_detail;
		this.customer_address_phone = customer_address_phone;
		this.customer_address_default = customer_address_default;
	}
	public int getCustomer_address_no() {
		return customer_address_no;
	}
	public void setCustomer_address_no(int customer_address_no) {
		this.customer_address_no = customer_address_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getCustomer_address_name() {
		return customer_address_name;
	}
	public void setCustomer_address_name(String customer_address_name) {
		this.customer_address_name = customer_address_name;
	}
	public String getCustomer_address_receiver() {
		return customer_address_receiver;
	}
	public void setCustomer_address_receiver(String customer_address_receiver) {
		this.customer_address_receiver = customer_address_receiver;
	}
	public String getCustomer_address_main() {
		return customer_address_main;
	}
	public void setCustomer_address_main(String customer_address_main) {
		this.customer_address_main = customer_address_main;
	}
	public String getCustomer_address_detail() {
		return customer_address_detail;
	}
	public void setCustomer_address_detail(String customer_address_detail) {
		this.customer_address_detail = customer_address_detail;
	}
	public String getCustomer_address_phone() {
		return customer_address_phone;
	}
	public void setCustomer_address_phone(String customer_address_phone) {
		this.customer_address_phone = customer_address_phone;
	}
	public int getCustomer_address_default() {
		return customer_address_default;
	}
	public void setCustomer_address_default(int customer_address_default) {
		this.customer_address_default = customer_address_default;
	}

	
}
