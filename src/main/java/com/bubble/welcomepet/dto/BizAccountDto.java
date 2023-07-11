package com.bubble.welcomepet.dto;

public class BizAccountDto {
	private int biz_account_no ;
	private int bank_no ;
	private int biz_no ;
	private String biz_account_num ;
	public BizAccountDto() {
		super();
	}
	public BizAccountDto(int biz_account_no, int bank_no, int biz_no, String biz_account_num) {
		super();
		this.biz_account_no = biz_account_no;
		this.bank_no = bank_no;
		this.biz_no = biz_no;
		this.biz_account_num = biz_account_num;
	}
	public int getBiz_account_no() {
		return biz_account_no;
	}
	public void setBiz_account_no(int biz_account_no) {
		this.biz_account_no = biz_account_no;
	}
	public int getBank_no() {
		return bank_no;
	}
	public void setBank_no(int bank_no) {
		this.bank_no = bank_no;
	}
	public int getBiz_no() {
		return biz_no;
	}
	public void setBiz_no(int biz_no) {
		this.biz_no = biz_no;
	}
	public String getBiz_account_num() {
		return biz_account_num;
	}
	public void setBiz_account_num(String biz_account_num) {
		this.biz_account_num = biz_account_num;
	}
	@Override
	public String toString() {
		return "BizAccountDto [biz_account_no=" + biz_account_no + ", bank_no=" + bank_no + ", biz_no=" + biz_no
				+ ", biz_account_num=" + biz_account_num + "]";
	}
	
	
	
}
