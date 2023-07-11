package com.bubble.welcomepet.dto;

import java.util.Date;

public class StatementDto {
	private int statement_no ;
	private int biz_no ;
	private int statement_year ;
	private int statement_month;
	private int statement_total_sales ;
	private int statement_commission ;
	private int statement_price ;
	private Date statement_issue_date ;
	public StatementDto() {
		super();
	}
	public StatementDto(int statement_no, int biz_no, int statement_year, int statement_month,
			int statement_total_sales, int statement_commission, int statement_price, Date statement_issue_date) {
		super();
		this.statement_no = statement_no;
		this.biz_no = biz_no;
		this.statement_year = statement_year;
		this.statement_month = statement_month;
		this.statement_total_sales = statement_total_sales;
		this.statement_commission = statement_commission;
		this.statement_price = statement_price;
		this.statement_issue_date = statement_issue_date;
	}
	public int getStatement_no() {
		return statement_no;
	}
	public void setStatement_no(int statement_no) {
		this.statement_no = statement_no;
	}
	public int getBiz_no() {
		return biz_no;
	}
	public void setBiz_no(int biz_no) {
		this.biz_no = biz_no;
	}
	public int getStatement_year() {
		return statement_year;
	}
	public void setStatement_year(int statement_year) {
		this.statement_year = statement_year;
	}
	public int getStatement_month() {
		return statement_month;
	}
	public void setStatement_month(int statement_month) {
		this.statement_month = statement_month;
	}
	public int getStatement_total_sales() {
		return statement_total_sales;
	}
	public void setStatement_total_sales(int statement_total_sales) {
		this.statement_total_sales = statement_total_sales;
	}
	public int getStatement_commission() {
		return statement_commission;
	}
	public void setStatement_commission(int statement_commission) {
		this.statement_commission = statement_commission;
	}
	public int getStatement_price() {
		return statement_price;
	}
	public void setStatement_price(int statement_price) {
		this.statement_price = statement_price;
	}
	public Date getStatement_issue_date() {
		return statement_issue_date;
	}
	public void setStatement_issue_date(Date statement_issue_date) {
		this.statement_issue_date = statement_issue_date;
	}
	@Override
	public String toString() {
		return "StatementDto [statement_no=" + statement_no + ", biz_no=" + biz_no + ", statement_year="
				+ statement_year + ", statement_month=" + statement_month + ", statement_total_sales="
				+ statement_total_sales + ", statement_commission=" + statement_commission + ", statement_price="
				+ statement_price + ", statement_issue_date=" + statement_issue_date + "]";
	}
	
	
}
