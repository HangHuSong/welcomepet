package com.bubble.welcomepet.dto;

import java.util.Date;

public class ProductDto {
    private int product_no;
    private int biz_no;
    private int sub_category_no;
    private String product_name;
    private String product_thumbnail;
    private String product_description;
    private int product_price;
    private int product_shipping_price;
    private int product_discount_rate;
	public ProductDto() {
		super();
	}
	public ProductDto(int product_no, int biz_no, int sub_category_no, String product_name, String product_thumbnail,
			String product_description, int product_price, int product_shipping_price, int product_discount_rate) {
		super();
		this.product_no = product_no;
		this.biz_no = biz_no;
		this.sub_category_no = sub_category_no;
		this.product_name = product_name;
		this.product_thumbnail = product_thumbnail;
		this.product_description = product_description;
		this.product_price = product_price;
		this.product_shipping_price = product_shipping_price;
		this.product_discount_rate = product_discount_rate;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getBiz_no() {
		return biz_no;
	}
	public void setBiz_no(int biz_no) {
		this.biz_no = biz_no;
	}
	public int getSub_category_no() {
		return sub_category_no;
	}
	public void setSub_category_no(int sub_category_no) {
		this.sub_category_no = sub_category_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_thumbnail() {
		return product_thumbnail;
	}
	public void setProduct_thumbnail(String product_thumbnail) {
		this.product_thumbnail = product_thumbnail;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_shipping_price() {
		return product_shipping_price;
	}
	public void setProduct_shipping_price(int product_shipping_price) {
		this.product_shipping_price = product_shipping_price;
	}
	public int getProduct_discount_rate() {
		return product_discount_rate;
	}
	public void setProduct_discount_rate(int product_discount_rate) {
		this.product_discount_rate = product_discount_rate;
	}


    
}