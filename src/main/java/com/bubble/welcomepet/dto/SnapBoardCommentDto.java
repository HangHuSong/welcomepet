package com.bubble.welcomepet.dto;

import java.util.Date;

public class SnapBoardCommentDto {
	private int snap_board_comment_no;
	private int snap_board_no;
	private int customer_no;
	private String snap_board_comment_content;
	private Date snap_board_comment_reg_date;

	public SnapBoardCommentDto() {
		super();
	}

	public SnapBoardCommentDto(int snap_board_comment_no, int snap_board_no, int customer_no,
			String snap_board_comment_content, Date snap_board_comment_reg_date) {
		super();
		this.snap_board_comment_no = snap_board_comment_no;
		this.snap_board_no = snap_board_no;
		this.customer_no = customer_no;
		this.snap_board_comment_content = snap_board_comment_content;
		this.snap_board_comment_reg_date = snap_board_comment_reg_date;
	}

	public int getSnap_board_comment_no() {
		return snap_board_comment_no;
	}

	public void setSnap_board_comment_no(int snap_board_comment_no) {
		this.snap_board_comment_no = snap_board_comment_no;
	}

	public int getSnap_board_no() {
		return snap_board_no;
	}

	public void setSnap_board_no(int snap_board_no) {
		this.snap_board_no = snap_board_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getSnap_board_comment_content() {
		return snap_board_comment_content;
	}

	public void setSnap_board_comment_content(String snap_board_comment_content) {
		this.snap_board_comment_content = snap_board_comment_content;
	}

	public Date getSnap_board_comment_reg_date() {
		return snap_board_comment_reg_date;
	}

	public void setSnap_board_comment_reg_date(Date snap_board_comment_reg_date) {
		this.snap_board_comment_reg_date = snap_board_comment_reg_date;
	}

	@Override
	public String toString() {
		return "SnapBoardCommentDto [snap_board_comment_no=" + snap_board_comment_no + ", snap_board_no="
				+ snap_board_no + ", customer_no=" + customer_no + ", snap_board_comment_content="
				+ snap_board_comment_content + ", snap_board_comment_reg_date=" + snap_board_comment_reg_date + "]";
	}

}
