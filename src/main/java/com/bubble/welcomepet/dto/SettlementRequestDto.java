package com.bubble.welcomepet.dto;

import java.util.Date;

public class SettlementRequestDto {
	private int settlement_request_no ;
	private int statement_no ;
	private int emp_no ;
	private int biz_account_no ;
	private Date settlement_request_date;
	
	public SettlementRequestDto() {
		super();
	}

	public SettlementRequestDto(int settlement_request_no, int statement_no, int emp_no, int biz_account_no,
			Date settlement_request_date) {
		super();
		this.settlement_request_no = settlement_request_no;
		this.statement_no = statement_no;
		this.emp_no = emp_no;
		this.biz_account_no = biz_account_no;
		this.settlement_request_date = settlement_request_date;
	}

	public int getSettlement_request_no() {
		return settlement_request_no;
	}

	public void setSettlement_request_no(int settlement_request_no) {
		this.settlement_request_no = settlement_request_no;
	}

	public int getStatement_no() {
		return statement_no;
	}

	public void setStatement_no(int statement_no) {
		this.statement_no = statement_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getBiz_account_no() {
		return biz_account_no;
	}

	public void setBiz_account_no(int biz_account_no) {
		this.biz_account_no = biz_account_no;
	}

	public Date getSettlement_request_date() {
		return settlement_request_date;
	}

	public void setSettlement_request_date(Date settlement_request_date) {
		this.settlement_request_date = settlement_request_date;
	}

	@Override
	public String toString() {
		return "SettlementRequestDto [settlement_request_no=" + settlement_request_no + ", statement_no=" + statement_no
				+ ", emp_no=" + emp_no + ", biz_account_no=" + biz_account_no + ", settlement_request_date="
				+ settlement_request_date + "]";
	}
	
	
}
