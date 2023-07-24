package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AdProductDto {
	private int ad_product_no;
	private int ad_category_no;
	private int product_no;
	private int ad_payment_no ;
	private Date ad_product_start_date ;
	private Date ad_product_end_date ;
    
    
	public AdProductDto() {
		super();
	}


	public AdProductDto(int ad_product_no, int ad_category_no, int product_no, int ad_payment_no,
			Date ad_product_start_date, Date ad_product_end_date) {
		super();
		this.ad_product_no = ad_product_no;
		this.ad_category_no = ad_category_no;
		this.product_no = product_no;
		this.ad_payment_no = ad_payment_no;
		this.ad_product_start_date = ad_product_start_date;
		this.ad_product_end_date = ad_product_end_date;
	}


	public int getAd_product_no() {
		return ad_product_no;
	}


	public void setAd_product_no(int ad_product_no) {
		this.ad_product_no = ad_product_no;
	}


	public int getAd_category_no() {
		return ad_category_no;
	}


	public void setAd_category_no(int ad_category_no) {
		this.ad_category_no = ad_category_no;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public int getAd_payment_no() {
		return ad_payment_no;
	}


	public void setAd_payment_no(int ad_payment_no) {
		this.ad_payment_no = ad_payment_no;
	}


	public Date getAd_product_start_date() {
		return ad_product_start_date;
	}


	public void setAd_product_start_date(Date ad_product_start_date) {
		this.ad_product_start_date = ad_product_start_date;
	}


	public Date getAd_product_end_date() {
		return ad_product_end_date;
	}


	public void setAd_product_end_date(Date ad_product_end_date) {
		this.ad_product_end_date = ad_product_end_date;
	}


	@Override
	public String toString() {
		return "AdProductDto [ad_product_no=" + ad_product_no + ", ad_category_no=" + ad_category_no + ", product_no="
				+ product_no + ", ad_payment_no=" + ad_payment_no + ", ad_product_start_date=" + ad_product_start_date
				+ ", ad_product_end_date=" + ad_product_end_date + "]";
	}


	
	
}
