package com.bubble.welcomepet.dto;

import java.util.Date;

public class ExchangeDto {
	private int exchange_no;
	private int order_product_no;
	private int return_exchange_reason_no;
	private String exchange_reason_detail;
	private Date exchange_reg_date;
	public ExchangeDto() {
		super();
	}
	public ExchangeDto(int exchange_no, int order_product_no, int return_exchange_reason_no,
			String exchange_reason_detail, Date exchange_reg_date) {
		super();
		this.exchange_no = exchange_no;
		this.order_product_no = order_product_no;
		this.return_exchange_reason_no = return_exchange_reason_no;
		this.exchange_reason_detail = exchange_reason_detail;
		this.exchange_reg_date = exchange_reg_date;
	}
	public int getExchange_no() {
		return exchange_no;
	}
	public void setExchange_no(int exchange_no) {
		this.exchange_no = exchange_no;
	}
	public int getOrder_product_no() {
		return order_product_no;
	}
	public void setOrder_product_no(int order_product_no) {
		this.order_product_no = order_product_no;
	}
	public int getReturn_exchange_reason_no() {
		return return_exchange_reason_no;
	}
	public void setReturn_exchange_reason_no(int return_exchange_reason_no) {
		this.return_exchange_reason_no = return_exchange_reason_no;
	}
	public String getExchange_reason_detail() {
		return exchange_reason_detail;
	}
	public void setExchange_reason_detail(String exchange_reason_detail) {
		this.exchange_reason_detail = exchange_reason_detail;
	}
	public Date getExchange_reg_date() {
		return exchange_reg_date;
	}
	public void setExchange_reg_date(Date exchange_reg_date) {
		this.exchange_reg_date = exchange_reg_date;
	}
	@Override
	public String toString() {
		return "ExchangeDto [exchange_no=" + exchange_no + ", order_product_no=" + order_product_no
				+ ", return_exchange_reason_no=" + return_exchange_reason_no + ", exchange_reason_detail="
				+ exchange_reason_detail + ", exchange_reg_date=" + exchange_reg_date + "]";
	}
	
	
}
