package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardDto {

	private int board_no;
	private int board_category_no;
	private int customer_no;
	private String board_title;
	private String board_content;
	private int board_read_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date board_reg_date;

	public BoardDto() {
		super();
	}

	public BoardDto(int board_no, int board_category_no, int customer_no, String board_title, String board_content,
			int board_read_count, Date board_reg_date) {
		super();
		this.board_no = board_no;
		this.board_category_no = board_category_no;
		this.customer_no = customer_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_read_count = board_read_count;
		this.board_reg_date = board_reg_date;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_category_no() {
		return board_category_no;
	}

	public void setBoard_category_no(int board_category_no) {
		this.board_category_no = board_category_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_read_count() {
		return board_read_count;
	}

	public void setBoard_read_count(int board_read_count) {
		this.board_read_count = board_read_count;
	}

	public Date getBoard_reg_date() {
		return board_reg_date;
	}

	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	@Override
	public String toString() {
		return "BoardDto [board_no=" + board_no + ", board_category_no=" + board_category_no + ", customer_no="
				+ customer_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_read_count=" + board_read_count + ", board_reg_date=" + board_reg_date + "]";
	}

}