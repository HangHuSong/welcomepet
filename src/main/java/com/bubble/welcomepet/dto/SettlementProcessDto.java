package com.bubble.welcomepet.dto;

import java.util.Date;

public class SettlementProcessDto {
	private int settlement_process_no ;
	private int settlement_request_no ;
	private String settlement_process_emp_memo ;
	private String settlement_process_evidence ;
	private Date settlement_process_date ;
	public SettlementProcessDto() {
		super();
	}
	public SettlementProcessDto(int settlement_process_no, int settlement_request_no,
			String settlement_process_emp_memo, String settlement_process_evidence, Date settlement_process_date) {
		super();
		this.settlement_process_no = settlement_process_no;
		this.settlement_request_no = settlement_request_no;
		this.settlement_process_emp_memo = settlement_process_emp_memo;
		this.settlement_process_evidence = settlement_process_evidence;
		this.settlement_process_date = settlement_process_date;
	}
	public int getSettlement_process_no() {
		return settlement_process_no;
	}
	public void setSettlement_process_no(int settlement_process_no) {
		this.settlement_process_no = settlement_process_no;
	}
	public int getSettlement_request_no() {
		return settlement_request_no;
	}
	public void setSettlement_request_no(int settlement_request_no) {
		this.settlement_request_no = settlement_request_no;
	}
	public String getSettlement_process_emp_memo() {
		return settlement_process_emp_memo;
	}
	public void setSettlement_process_emp_memo(String settlement_process_emp_memo) {
		this.settlement_process_emp_memo = settlement_process_emp_memo;
	}
	public String getSettlement_process_evidence() {
		return settlement_process_evidence;
	}
	public void setSettlement_process_evidence(String settlement_process_evidence) {
		this.settlement_process_evidence = settlement_process_evidence;
	}
	public Date getSettlement_process_date() {
		return settlement_process_date;
	}
	public void setSettlement_process_date(Date settlement_process_date) {
		this.settlement_process_date = settlement_process_date;
	}
	@Override
	public String toString() {
		return "SettlementProcessDto [settlement_process_no=" + settlement_process_no + ", settlement_request_no="
				+ settlement_request_no + ", settlement_process_emp_memo=" + settlement_process_emp_memo
				+ ", settlement_process_evidence=" + settlement_process_evidence + ", settlement_process_date="
				+ settlement_process_date + "]";
	}
	
	
}
