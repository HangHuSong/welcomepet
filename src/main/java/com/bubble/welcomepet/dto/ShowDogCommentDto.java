package com.bubble.welcomepet.dto;

import java.util.Date;

public class ShowDogCommentDto {
	private int show_dog_comment_no;
	private int show_dog_post_no;
	private int customer_no;
	private String show_dog_comment_content;
	private Date show_dog_comment_reg_date;

	public ShowDogCommentDto() {
		super();
	}

	public ShowDogCommentDto(int show_dog_comment_no, int show_dog_post_no, int customer_no,
			String show_dog_comment_content, Date show_dog_comment_reg_date) {
		super();
		this.show_dog_comment_no = show_dog_comment_no;
		this.show_dog_post_no = show_dog_post_no;
		this.customer_no = customer_no;
		this.show_dog_comment_content = show_dog_comment_content;
		this.show_dog_comment_reg_date = show_dog_comment_reg_date;
	}

	public int getShow_dog_comment_no() {
		return show_dog_comment_no;
	}

	public void setShow_dog_comment_no(int show_dog_comment_no) {
		this.show_dog_comment_no = show_dog_comment_no;
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

	public String getShow_dog_comment_content() {
		return show_dog_comment_content;
	}

	public void setShow_dog_comment_content(String show_dog_comment_content) {
		this.show_dog_comment_content = show_dog_comment_content;
	}

	public Date getShow_dog_comment_reg_date() {
		return show_dog_comment_reg_date;
	}

	public void setShow_dog_comment_reg_date(Date show_dog_comment_reg_date) {
		this.show_dog_comment_reg_date = show_dog_comment_reg_date;
	}

	@Override
	public String toString() {
		return "ShowDogCommentDto [show_dog_comment_no=" + show_dog_comment_no + ", show_dog_post_no="
				+ show_dog_post_no + ", customer_no=" + customer_no + ", show_dog_comment_content="
				+ show_dog_comment_content + ", show_dog_comment_reg_date=" + show_dog_comment_reg_date + "]";
	}

}
