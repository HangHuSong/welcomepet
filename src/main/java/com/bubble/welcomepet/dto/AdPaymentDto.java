package com.bubble.welcomepet.dto;

import java.util.Date;

public class AdPaymentDto {
	private int ad_payment_no ;
	private int biz_no ;
	private int ad_category_no ;
	private String ad_payment_tid ;
	private String ad_payment_method_type ;
	private int ad_payment_price ;
	private int ad_payment_quantity;
	private Date ad_payment_created_date ;
	private Date ad_payment_approved_date ;
	public AdPaymentDto() {
		super();
	}
	public AdPaymentDto(int ad_payment_no, int biz_no, int ad_category_no, String ad_payment_tid,
			String ad_payment_method_type, int ad_payment_amount, int ad_payment_quantity, Date ad_payment_created_date,
			Date ad_payment_approved_date) {
		super();
		this.ad_payment_no = ad_payment_no;
		this.biz_no = biz_no;
		this.ad_category_no = ad_category_no;
		this.ad_payment_tid = ad_payment_tid;
		this.ad_payment_method_type = ad_payment_method_type;
		this.ad_payment_price = ad_payment_amount;
		this.ad_payment_quantity = ad_payment_quantity;
		this.ad_payment_created_date = ad_payment_created_date;
		this.ad_payment_approved_date = ad_payment_approved_date;
	}
	public int getAd_payment_no() {
		return ad_payment_no;
	}
	public void setAd_payment_no(int ad_payment_no) {
		this.ad_payment_no = ad_payment_no;
	}
	public int getBiz_no() {
		return biz_no;
	}
	public void setBiz_no(int biz_no) {
		this.biz_no = biz_no;
	}
	public int getAd_category_no() {
		return ad_category_no;
	}
	public void setAd_category_no(int ad_category_no) {
		this.ad_category_no = ad_category_no;
	}
	public String getAd_payment_tid() {
		return ad_payment_tid;
	}
	public void setAd_payment_tid(String ad_payment_tid) {
		this.ad_payment_tid = ad_payment_tid;
	}
	public String getAd_payment_method_type() {
		return ad_payment_method_type;
	}
	public void setAd_payment_method_type(String ad_payment_method_type) {
		this.ad_payment_method_type = ad_payment_method_type;
	}
	public int getAd_payment_price() {
		return ad_payment_price;
	}
	public void setAd_payment_price(int ad_payment_amount) {
		this.ad_payment_price = ad_payment_amount;
	}
	public int getAd_payment_quantity() {
		return ad_payment_quantity;
	}
	public void setAd_payment_quantity(int ad_payment_quantity) {
		this.ad_payment_quantity = ad_payment_quantity;
	}
	public Date getAd_payment_created_date() {
		return ad_payment_created_date;
	}
	public void setAd_payment_created_date(Date ad_payment_created_date) {
		this.ad_payment_created_date = ad_payment_created_date;
	}
	public Date getAd_payment_approved_date() {
		return ad_payment_approved_date;
	}
	public void setAd_payment_approved_date(Date ad_payment_approved_date) {
		this.ad_payment_approved_date = ad_payment_approved_date;
	}
	@Override
	public String toString() {
		return "AdPaymentDto [ad_payment_no=" + ad_payment_no + ", biz_no=" + biz_no + ", ad_category_no="
				+ ad_category_no + ", ad_payment_tid=" + ad_payment_tid + ", ad_payment_method_type="
				+ ad_payment_method_type + ", ad_payment_price=" + ad_payment_price + ", ad_payment_quantity="
				+ ad_payment_quantity + ", ad_payment_created_date=" + ad_payment_created_date
				+ ", ad_payment_approved_date=" + ad_payment_approved_date + "]";
	}
	
	
}
