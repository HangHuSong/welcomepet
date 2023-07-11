package com.bubble.welcomepet.dto;

import java.util.Date;

public class BizApprovalRequestDto {
	private int biz_approval_request_no;
	private int biz_no ;
	private String biz_approval_request_brn;
	private String biz_approval_request_document ;
	private Date biz_approval_request_reg_date ;
	public BizApprovalRequestDto() {
		super();
	}
	public BizApprovalRequestDto(int biz_approval_request_no, int biz_no, String biz_approval_request_brn,
			String biz_approval_request_document, Date biz_approval_request_reg_date) {
		super();
		this.biz_approval_request_no = biz_approval_request_no;
		this.biz_no = biz_no;
		this.biz_approval_request_brn = biz_approval_request_brn;
		this.biz_approval_request_document = biz_approval_request_document;
		this.biz_approval_request_reg_date = biz_approval_request_reg_date;
	}
	public int getBiz_approval_request_no() {
		return biz_approval_request_no;
	}
	public void setBiz_approval_request_no(int biz_approval_request_no) {
		this.biz_approval_request_no = biz_approval_request_no;
	}
	public int getBiz_no() {
		return biz_no;
	}
	public void setBiz_no(int biz_no) {
		this.biz_no = biz_no;
	}
	public String getBiz_approval_request_brn() {
		return biz_approval_request_brn;
	}
	public void setBiz_approval_request_brn(String biz_approval_request_brn) {
		this.biz_approval_request_brn = biz_approval_request_brn;
	}
	public String getBiz_approval_request_document() {
		return biz_approval_request_document;
	}
	public void setBiz_approval_request_document(String biz_approval_request_document) {
		this.biz_approval_request_document = biz_approval_request_document;
	}
	public Date getBiz_approval_request_reg_date() {
		return biz_approval_request_reg_date;
	}
	public void setBiz_approval_request_reg_date(Date biz_approval_request_reg_date) {
		this.biz_approval_request_reg_date = biz_approval_request_reg_date;
	}
	@Override
	public String toString() {
		return "BizApprovalRequestDto [biz_approval_request_no=" + biz_approval_request_no + ", biz_no=" + biz_no
				+ ", biz_approval_request_brn=" + biz_approval_request_brn + ", biz_approval_request_document="
				+ biz_approval_request_document + ", biz_approval_request_reg_date=" + biz_approval_request_reg_date
				+ "]";
	}
	
	
	
}
