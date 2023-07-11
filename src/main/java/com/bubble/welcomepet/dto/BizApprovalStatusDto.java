package com.bubble.welcomepet.dto;

public class BizApprovalStatusDto {
	private int biz_approval_status_no ;
	private String biz_approval_status_name ;
	public BizApprovalStatusDto() {
		super();
	}
	public BizApprovalStatusDto(int biz_approval_status_no, String biz_approval_status_name) {
		super();
		this.biz_approval_status_no = biz_approval_status_no;
		this.biz_approval_status_name = biz_approval_status_name;
	}
	public int getBiz_approval_status_no() {
		return biz_approval_status_no;
	}
	public void setBiz_approval_status_no(int biz_approval_status_no) {
		this.biz_approval_status_no = biz_approval_status_no;
	}
	public String getBiz_approval_status_name() {
		return biz_approval_status_name;
	}
	public void setBiz_approval_status_name(String biz_approval_status_name) {
		this.biz_approval_status_name = biz_approval_status_name;
	}
	@Override
	public String toString() {
		return "BizApprovalStatusDto [biz_approval_status_no=" + biz_approval_status_no + ", biz_approval_status_name="
				+ biz_approval_status_name + "]";
	}
	
	
}
