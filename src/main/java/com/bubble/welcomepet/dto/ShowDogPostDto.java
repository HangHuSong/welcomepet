package com.bubble.welcomepet.dto;

import java.util.Date;

public class ShowDogPostDto {
	private int show_dog_post_no;
	private int customer_no;
	private String show_dog_post_title;
	private String show_dog_post_content;
	private int show_dog_post_view_count;
	private Date show_dog_post_reg_date;

	public ShowDogPostDto() {
		super();
	}

	public ShowDogPostDto(int show_dog_post_no, int customer_no, String show_dog_post_title,
			String show_dog_post_content, int show_dog_post_view_count, Date show_dog_post_reg_date) {
		super();
		this.show_dog_post_no = show_dog_post_no;
		this.customer_no = customer_no;
		this.show_dog_post_title = show_dog_post_title;
		this.show_dog_post_content = show_dog_post_content;
		this.show_dog_post_view_count = show_dog_post_view_count;
		this.show_dog_post_reg_date = show_dog_post_reg_date;
	}

	public int getShow_dog_post_no() {
		return show_dog_post_no;
	}

	public void setShow_dog_post_no(int show_dog_post_no) {
		this.show_dog_post_no = show_dog_post_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getShow_dog_post_title() {
		return show_dog_post_title;
	}

	public void setShow_dog_post_title(String show_dog_post_title) {
		this.show_dog_post_title = show_dog_post_title;
	}

	public String getShow_dog_post_content() {
		return show_dog_post_content;
	}

	public void setShow_dog_post_content(String show_dog_post_content) {
		this.show_dog_post_content = show_dog_post_content;
	}

	public int getShow_dog_post_view_count() {
		return show_dog_post_view_count;
	}

	public void setShow_dog_post_view_count(int show_dog_post_view_count) {
		this.show_dog_post_view_count = show_dog_post_view_count;
	}

	public Date getShow_dog_post_reg_date() {
		return show_dog_post_reg_date;
	}

	public void setShow_dog_post_reg_date(Date show_dog_post_reg_date) {
		this.show_dog_post_reg_date = show_dog_post_reg_date;
	}

	@Override
	public String toString() {
		return "ShowDogPostDto [show_dog_post_no=" + show_dog_post_no + ", customer_no=" + customer_no
				+ ", show_dog_post_title=" + show_dog_post_title + ", show_dog_post_content=" + show_dog_post_content
				+ ", show_dog_post_view_count=" + show_dog_post_view_count + ", show_dog_post_reg_date="
				+ show_dog_post_reg_date + "]";
	}

}
