package com.bubble.welcomepet.dto;

import java.util.Date;

public class ProductInquiryReplyDto {
	private int product_inquiry_reply_no;
	private int product_inquiry_no ;
	private String product_inquiry_reply_context ;
	private Date product_inquiry_reply_date ;
	public ProductInquiryReplyDto() {
		super();
	}
	public ProductInquiryReplyDto(int product_inquiry_reply_no, int product_inquiry_no,
			String product_inquiry_reply_context, Date product_inquiry_reply_date) {
		super();
		this.product_inquiry_reply_no = product_inquiry_reply_no;
		this.product_inquiry_no = product_inquiry_no;
		this.product_inquiry_reply_context = product_inquiry_reply_context;
		this.product_inquiry_reply_date = product_inquiry_reply_date;
	}
	public int getProduct_inquiry_reply_no() {
		return product_inquiry_reply_no;
	}
	public void setProduct_inquiry_reply_no(int product_inquiry_reply_no) {
		this.product_inquiry_reply_no = product_inquiry_reply_no;
	}
	public int getProduct_inquiry_no() {
		return product_inquiry_no;
	}
	public void setProduct_inquiry_no(int product_inquiry_no) {
		this.product_inquiry_no = product_inquiry_no;
	}
	public String getProduct_inquiry_reply_context() {
		return product_inquiry_reply_context;
	}
	public void setProduct_inquiry_reply_context(String product_inquiry_reply_context) {
		this.product_inquiry_reply_context = product_inquiry_reply_context;
	}
	public Date getProduct_inquiry_reply_date() {
		return product_inquiry_reply_date;
	}
	public void setProduct_inquiry_reply_date(Date product_inquiry_reply_date) {
		this.product_inquiry_reply_date = product_inquiry_reply_date;
	}
	@Override
	public String toString() {
		return "ProductInquiryReplyDto [product_inquiry_reply_no=" + product_inquiry_reply_no + ", product_inquiry_no="
				+ product_inquiry_no + ", product_inquiry_reply_context=" + product_inquiry_reply_context
				+ ", product_inquiry_reply_date=" + product_inquiry_reply_date + "]";
	}
	
	
}
