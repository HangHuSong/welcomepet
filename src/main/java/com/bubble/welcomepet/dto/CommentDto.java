package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentDto {
	private int board_comment_no;
	private int board_no;
	private int customer_no;
	private String board_comment_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date board_comment_reg_date;

	public CommentDto() {
		super();
	}

	public CommentDto(int board_comment_no, int board_no, int customer_no, String board_comment_content,
			Date board_comment_reg_date) {
		super();
		this.board_comment_no = board_comment_no;
		this.board_no = board_no;
		this.customer_no = customer_no;
		this.board_comment_content = board_comment_content;
		this.board_comment_reg_date = board_comment_reg_date;
	}

	public int getBoard_comment_no() {
		return board_comment_no;
	}

	public void setBoard_comment_no(int board_comment_no) {
		this.board_comment_no = board_comment_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getBoard_comment_content() {
		return board_comment_content;
	}

	public void setBoard_comment_content(String board_comment_content) {
		this.board_comment_content = board_comment_content;
	}

	public Date getBoard_comment_reg_date() {
		return board_comment_reg_date;
	}

	public void setBoard_comment_reg_date(Date board_comment_reg_date) {
		this.board_comment_reg_date = board_comment_reg_date;
	}

	@Override
	public String toString() {
		return "CommentDto [board_comment_no=" + board_comment_no + ", board_no=" + board_no + ", customer_no="
				+ customer_no + ", board_comment_content=" + board_comment_content + ", board_comment_reg_date="
				+ board_comment_reg_date + "]";
	}

}
