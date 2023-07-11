package com.bubble.welcomepet.dto;

import java.util.Date;

public class ReturnDto {
	private int return_no;
	private int order_product_no;
	private int return_exchange_reason_no ;
	private String return_reason_detail ;
	private Date return_reg_date ;
	public ReturnDto() {
		super();
	}
	public ReturnDto(int return_no, int order_product_no, int return_exchange_reason_no, String return_reason_detail,
			Date return_reg_date) {
		super();
		this.return_no = return_no;
		this.order_product_no = order_product_no;
		this.return_exchange_reason_no = return_exchange_reason_no;
		this.return_reason_detail = return_reason_detail;
		this.return_reg_date = return_reg_date;
	}
	public int getReturn_no() {
		return return_no;
	}
	public void setReturn_no(int return_no) {
		this.return_no = return_no;
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
	public String getReturn_reason_detail() {
		return return_reason_detail;
	}
	public void setReturn_reason_detail(String return_reason_detail) {
		this.return_reason_detail = return_reason_detail;
	}
	public Date getReturn_reg_date() {
		return return_reg_date;
	}
	public void setReturn_reg_date(Date return_reg_date) {
		this.return_reg_date = return_reg_date;
	}
	@Override
	public String toString() {
		return "ReturnDto [return_no=" + return_no + ", order_product_no=" + order_product_no
				+ ", return_exchange_reason_no=" + return_exchange_reason_no + ", return_reason_detail="
				+ return_reason_detail + ", return_reg_date=" + return_reg_date + "]";
	}
	
	
}
