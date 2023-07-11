package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrdersDto {
	private int orders_no;
	private int customer_no;
	private String orders_payment_method;
	private int orders_total_price;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orders_date;
	private String orders_address_name;
	private String orders_receiver_name;
	private String orders_address_phone;
	private String orders_address;
	private String orders_detail_address;
	private String orders_shipping_message;
	public OrdersDto() {
		super();
	}
	public OrdersDto(int orders_no, int customer_no, String orders_payment_method, int orders_total_price,
			Date orders_date, String orders_address_name, String orders_receiver_name, String orders_address_phone,
			String orders_address, String orders_detail_address, String orders_shipping_message) {
		super();
		this.orders_no = orders_no;
		this.customer_no = customer_no;
		this.orders_payment_method = orders_payment_method;
		this.orders_total_price = orders_total_price;
		this.orders_date = orders_date;
		this.orders_address_name = orders_address_name;
		this.orders_receiver_name = orders_receiver_name;
		this.orders_address_phone = orders_address_phone;
		this.orders_address = orders_address;
		this.orders_detail_address = orders_detail_address;
		this.orders_shipping_message = orders_shipping_message;
	}
	public int getOrders_no() {
		return orders_no;
	}
	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getOrders_payment_method() {
		return orders_payment_method;
	}
	public void setOrders_payment_method(String orders_payment_method) {
		this.orders_payment_method = orders_payment_method;
	}
	public int getOrders_total_price() {
		return orders_total_price;
	}
	public void setOrders_total_price(int orders_total_price) {
		this.orders_total_price = orders_total_price;
	}
	public Date getOrders_date() {
		return orders_date;
	}
	public void setOrders_date(Date orders_date) {
		this.orders_date = orders_date;
	}
	public String getOrders_address_name() {
		return orders_address_name;
	}
	public void setOrders_address_name(String orders_address_name) {
		this.orders_address_name = orders_address_name;
	}
	public String getOrders_receiver_name() {
		return orders_receiver_name;
	}
	public void setOrders_receiver_name(String orders_receiver_name) {
		this.orders_receiver_name = orders_receiver_name;
	}
	public String getOrders_address_phone() {
		return orders_address_phone;
	}
	public void setOrders_address_phone(String orders_address_phone) {
		this.orders_address_phone = orders_address_phone;
	}
	public String getOrders_address() {
		return orders_address;
	}
	public void setOrders_address(String orders_address) {
		this.orders_address = orders_address;
	}
	public String getOrders_detail_address() {
		return orders_detail_address;
	}
	public void setOrders_detail_address(String orders_detail_address) {
		this.orders_detail_address = orders_detail_address;
	}
	public String getOrders_shipping_message() {
		return orders_shipping_message;
	}
	public void setOrders_shipping_message(String orders_shipping_message) {
		this.orders_shipping_message = orders_shipping_message;
	}

		
}
