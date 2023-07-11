package com.bubble.welcomepet.dto;

public class ProductMainImageDto {
	private int product_main_image_no ;
	private int product_no ;
	private String product_main_image_link ;
	public ProductMainImageDto() {
		super();
	}
	public ProductMainImageDto(int product_main_image_no, int product_no, String product_main_image_link) {
		super();
		this.product_main_image_no = product_main_image_no;
		this.product_no = product_no;
		this.product_main_image_link = product_main_image_link;
	}
	public int getProduct_main_image_no() {
		return product_main_image_no;
	}
	public void setProduct_main_image_no(int product_main_image_no) {
		this.product_main_image_no = product_main_image_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_main_image_link() {
		return product_main_image_link;
	}
	public void setProduct_main_image_link(String product_main_image_link) {
		this.product_main_image_link = product_main_image_link;
	}
	@Override
	public String toString() {
		return "ProductMainImageDto [product_main_image_no=" + product_main_image_no + ", product_no=" + product_no
				+ ", product_main_image_link=" + product_main_image_link + "]";
	}
	
	
}
