package com.bubble.welcomepet.dto;

public class ProductDetailImageDto {
	private int product_detail_image_no;
	private int product_no;
	private String product_detail_image_link;
	public ProductDetailImageDto() {
		super();
	}
	public ProductDetailImageDto(int product_detail_image_no, int product_no, String product_detail_image_link) {
		super();
		this.product_detail_image_no = product_detail_image_no;
		this.product_no = product_no;
		this.product_detail_image_link = product_detail_image_link;
	}
	public int getProduct_detail_image_no() {
		return product_detail_image_no;
	}
	public void setProduct_detail_image_no(int product_detail_image_no) {
		this.product_detail_image_no = product_detail_image_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_detail_image_link() {
		return product_detail_image_link;
	}
	public void setProduct_detail_image_link(String product_detail_image_link) {
		this.product_detail_image_link = product_detail_image_link;
	}

		
}
