package com.bubble.welcomepet.dto;

import java.util.Date;

public class CouponTemplateDto {
	private int template_no;
	private String template_image;
	private String template_name;
	private String description;
	private Date issue_date;
	private Date start_date;
	private Date expire_date;
	private int discount_amount;
	private int min_order_price;

	public CouponTemplateDto() {
		super();
	}

	public CouponTemplateDto(int template_no, String template_image, String template_name, String description,
			Date issue_date, Date start_date, Date expire_date, int discount_amount, int min_order_price) {
		super();
		this.template_no = template_no;
		this.template_image = template_image;
		this.template_name = template_name;
		this.description = description;
		this.issue_date = issue_date;
		this.start_date = start_date;
		this.expire_date = expire_date;
		this.discount_amount = discount_amount;
		this.min_order_price = min_order_price;
	}

	public int getTemplate_no() {
		return template_no;
	}

	public void setTemplate_no(int template_no) {
		this.template_no = template_no;
	}

	public String getTemplate_image() {
		return template_image;
	}

	public void setTemplate_image(String template_image) {
		this.template_image = template_image;
	}

	public String getTemplate_name() {
		return template_name;
	}

	public void setTemplate_name(String template_name) {
		this.template_name = template_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getIssue_date() {
		return issue_date;
	}

	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getExpire_date() {
		return expire_date;
	}

	public void setExpire_date(Date expire_date) {
		this.expire_date = expire_date;
	}

	public int getDiscount_amount() {
		return discount_amount;
	}

	public void setDiscount_amount(int discount_amount) {
		this.discount_amount = discount_amount;
	}

	public int getMin_order_price() {
		return min_order_price;
	}

	public void setMin_order_price(int min_order_price) {
		this.min_order_price = min_order_price;
	}

	@Override
	public String toString() {
		return "CouponTemplateDto [template_no=" + template_no + ", template_image=" + template_image
				+ ", template_name=" + template_name + ", description=" + description + ", issue_date=" + issue_date
				+ ", start_date=" + start_date + ", expire_date=" + expire_date + ", discount_amount=" + discount_amount
				+ ", min_order_price=" + min_order_price + "]";
	}

}
