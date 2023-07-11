package com.bubble.welcomepet.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductReviewDto {
		private int product_review_no;
		private int customer_no;
		private int order_product_no;
		private int product_option_no;
		private String product_review_context;
		private int product_review_rating;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date product_review_reg_date;
		private int product_no;
		public ProductReviewDto() {
			super();
		}
		public ProductReviewDto(int product_review_no, int customer_no, int order_product_no, int product_option_no,
				String product_review_context, int product_review_rating, Date producct_review_reg_date,
				int product_no) {
			super();
			this.product_review_no = product_review_no;
			this.customer_no = customer_no;
			this.order_product_no = order_product_no;
			this.product_option_no = product_option_no;
			this.product_review_context = product_review_context;
			this.product_review_rating = product_review_rating;
			this.product_review_reg_date = producct_review_reg_date;
			this.product_no = product_no;
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
		public int getOrder_product_no() {
			return order_product_no;
		}
		public void setOrder_product_no(int order_product_no) {
			this.order_product_no = order_product_no;
		}
		public int getProduct_option_no() {
			return product_option_no;
		}
		public void setProduct_option_no(int product_option_no) {
			this.product_option_no = product_option_no;
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
		public void setProduct_review_reg_date(Date producct_review_reg_date) {
			this.product_review_reg_date = producct_review_reg_date;
		}
		public int getProduct_no() {
			return product_no;
		}
		public void setProduct_no(int product_no) {
			this.product_no = product_no;
		}

}
