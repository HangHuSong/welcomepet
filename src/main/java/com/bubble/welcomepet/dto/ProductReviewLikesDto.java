package com.bubble.welcomepet.dto;

import java.util.Date;

public class ProductReviewLikesDto {
	private int product_review_likes;
	private int product_review_no ;
	private int customer_no ;
	private Date product_review_likes_date ;
	public ProductReviewLikesDto() {
		super();
	}
	public ProductReviewLikesDto(int product_review_likes, int product_review_no, int customer_no,
			Date product_review_likes_date) {
		super();
		this.product_review_likes = product_review_likes;
		this.product_review_no = product_review_no;
		this.customer_no = customer_no;
		this.product_review_likes_date = product_review_likes_date;
	}
	public int getProduct_review_likes() {
		return product_review_likes;
	}
	public void setProduct_review_likes(int product_review_likes) {
		this.product_review_likes = product_review_likes;
	}
	public int getProduct_review_no() {
		return product_review_no;
	}
	public void setProduct_review_no(int product_review_no) {
		this.product_review_no = product_review_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public Date getProduct_review_likes_date() {
		return product_review_likes_date;
	}
	public void setProduct_review_likes_date(Date product_review_likes_date) {
		this.product_review_likes_date = product_review_likes_date;
	}
	@Override
	public String toString() {
		return "ProductReviewLikesDto [product_review_likes=" + product_review_likes + ", product_review_no="
				+ product_review_no + ", customer_no=" + customer_no + ", product_review_likes_date="
				+ product_review_likes_date + "]";
	}
	
	
}
