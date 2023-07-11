package com.bubble.welcomepet.dto;

public class BizStatusDto {
	private int biz_status_no;
	private String biz_status_name;

	public BizStatusDto() {
		super();
	}

	public BizStatusDto(int biz_status_no, String biz_status_name) {
		super();
		this.biz_status_no = biz_status_no;
		this.biz_status_name = biz_status_name;
	}

	public int getBiz_status_no() {
		return biz_status_no;
	}

	public void setBiz_status_no(int biz_status_no) {
		this.biz_status_no = biz_status_no;
	}

	public String getBiz_status_name() {
		return biz_status_name;
	}

	public void setBiz_status_name(String biz_status_name) {
		this.biz_status_name = biz_status_name;
	}

	@Override
	public String toString() {
		return "BizStatusDto [biz_status_no=" + biz_status_no + ", biz_status_name=" + biz_status_name + "]";
	}

}
