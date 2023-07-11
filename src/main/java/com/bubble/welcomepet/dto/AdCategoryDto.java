package com.bubble.welcomepet.dto;

public class AdCategoryDto {
	private int ad_category_no;
	private String ad_category_name;
	private int ad_category_price;
    
    
	public AdCategoryDto() {
		super();
	}


	public AdCategoryDto(int ad_category_no, String ad_category_name, int ad_category_price) {
		super();
		this.ad_category_no = ad_category_no;
		this.ad_category_name = ad_category_name;
		this.ad_category_price = ad_category_price;
	}


	public int getAd_category_no() {
		return ad_category_no;
	}


	public void setAd_category_no(int ad_category_no) {
		this.ad_category_no = ad_category_no;
	}


	public String getAd_category_name() {
		return ad_category_name;
	}


	public void setAd_category_name(String ad_category_name) {
		this.ad_category_name = ad_category_name;
	}


	public int getAd_category_price() {
		return ad_category_price;
	}


	public void setAd_category_price(int ad_category_price) {
		this.ad_category_price = ad_category_price;
	}


	@Override
	public String toString() {
		return "AdCategoryDto [ad_category_no=" + ad_category_no + ", ad_category_name=" + ad_category_name
				+ ", ad_category_price=" + ad_category_price + "]";
	}
	
	
}
