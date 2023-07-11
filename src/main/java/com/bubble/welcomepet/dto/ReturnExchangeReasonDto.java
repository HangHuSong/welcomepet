package com.bubble.welcomepet.dto;

public class ReturnExchangeReasonDto {
	private int return_exchange_reason_no;
	private String return_exchange_reason_name ;
	public ReturnExchangeReasonDto() {
		super();
	}
	public ReturnExchangeReasonDto(int return_exchange_reason_no, String return_exchange_reason_name) {
		super();
		this.return_exchange_reason_no = return_exchange_reason_no;
		this.return_exchange_reason_name = return_exchange_reason_name;
	}
	public int getReturn_exchange_reason_no() {
		return return_exchange_reason_no;
	}
	public void setReturn_exchange_reason_no(int return_exchange_reason_no) {
		this.return_exchange_reason_no = return_exchange_reason_no;
	}
	public String getReturn_exchange_reason_name() {
		return return_exchange_reason_name;
	}
	public void setReturn_exchange_reason_name(String return_exchange_reason_name) {
		this.return_exchange_reason_name = return_exchange_reason_name;
	}
	@Override
	public String toString() {
		return "ReturnExchangeReasonDto [return_exchange_reason_no=" + return_exchange_reason_no
				+ ", return_exchange_reason_name=" + return_exchange_reason_name + "]";
	}
	
	
}
