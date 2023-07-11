package com.bubble.welcomepet.dto;

public class ProductReviewImagesDto {
	private int product_review_images_no;
	private int product_review_no;
	private String product_review_images_link;
	public ProductReviewImagesDto() {
		super();
	}
	public ProductReviewImagesDto(int product_review_images_no, int product_review_no, String product_review_images_link) {
		super();
		this.product_review_images_no = product_review_images_no;
		this.product_review_no = product_review_no;
		this.product_review_images_link = product_review_images_link;
	}
	public int getProduct_review_images_no() {
		return product_review_images_no;
	}
	public void setProduct_review_images_no(int product_review_images_no) {
		this.product_review_images_no = product_review_images_no;
	}
	public int getProduct_review_no() {
		return product_review_no;
	}
	public void setProduct_review_no(int product_review_no) {
		this.product_review_no = product_review_no;
	}
	public String getProduct_review_images_link() {
		return product_review_images_link;
	}
	public void setProduct_review_images_link(String product_review_images_link) {
		this.product_review_images_link = product_review_images_link;
	}
	
	
}
