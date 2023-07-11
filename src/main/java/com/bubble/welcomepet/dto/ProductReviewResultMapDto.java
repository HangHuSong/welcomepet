package com.bubble.welcomepet.dto;

import java.util.Date;
import java.util.List;

public class ProductReviewResultMapDto {
	private int product_review_no;
	private CustomerDto customerDto;
	private int order_product_no;
	private ProductOptionDto productOptionDto;
	private String product_review_context;
	private int product_review_rating;
	private Date product_review_reg_date;
	private List<ProductReviewImagesDto> productReviewImagesDtoList;
	
	public ProductReviewResultMapDto() {
		super();
	}

	public ProductReviewResultMapDto(int product_review_no, CustomerDto customerDto, int order_product_no,
			ProductOptionDto productOptionDto, String product_review_context, int product_review_rating,
			Date product_review_reg_date, List<ProductReviewImagesDto> productReviewImagesDtoList) {
		super();
		this.product_review_no = product_review_no;
		this.customerDto = customerDto;
		this.order_product_no = order_product_no;
		this.productOptionDto = productOptionDto;
		this.product_review_context = product_review_context;
		this.product_review_rating = product_review_rating;
		this.product_review_reg_date = product_review_reg_date;
		this.productReviewImagesDtoList = productReviewImagesDtoList;
	}

	public int getProduct_review_no() {
		return product_review_no;
	}

	public void setProduct_review_no(int product_review_no) {
		this.product_review_no = product_review_no;
	}

	public CustomerDto getCustomerDto() {
		return customerDto;
	}

	public void setCustomerDto(CustomerDto customerDto) {
		this.customerDto = customerDto;
	}

	public int getOrder_product_no() {
		return order_product_no;
	}

	public void setOrder_product_no(int order_product_no) {
		this.order_product_no = order_product_no;
	}

	public ProductOptionDto getProductOptionDto() {
		return productOptionDto;
	}

	public void setProductOptionDto(ProductOptionDto productOptionDto) {
		this.productOptionDto = productOptionDto;
	}

	public String getProduct_review_context() {
		return product_review_context;
	}

	public void setProduct_review_context(String product_review_context) {
		this.product_review_context = product_review_context;
	}

	public int getProduct_review_rating() {
		return product_review_rating;
	}

	public void setProduct_review_rating(int product_review_rating) {
		this.product_review_rating = product_review_rating;
	}

	public Date getProduct_review_reg_date() {
		return product_review_reg_date;
	}

	public void setProduct_review_reg_date(Date product_review_reg_date) {
		this.product_review_reg_date = product_review_reg_date;
	}

	public List<ProductReviewImagesDto> getProductReviewImagesDtoList() {
		return productReviewImagesDtoList;
	}

	public void setProductReviewImagesDtoList(List<ProductReviewImagesDto> productReviewImagesDtoList) {
		this.productReviewImagesDtoList = productReviewImagesDtoList;
	}

	@Override
	public String toString() {
		return "ProductReviewResultMapDto [product_review_no=" + product_review_no + ", customerDto=" + customerDto
				+ ", order_product_no=" + order_product_no + ", productOptionDto=" + productOptionDto
				+ ", product_review_context=" + product_review_context + ", product_review_rating="
				+ product_review_rating + ", product_review_reg_date=" + product_review_reg_date
				+ ", productReviewImagesDtoList=" + productReviewImagesDtoList + "]";
	}
	
	
	
}
