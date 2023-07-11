package com.bubble.welcomepet.dto;

public class SnapBoardLikesDto {
	private int snap_board_likes_no;
	private int snap_board_no;
	private int customer_no;

	public SnapBoardLikesDto() {
		super();
	}

	public SnapBoardLikesDto(int snap_board_likes_no, int snap_board_no, int customer_no) {
		super();
		this.snap_board_likes_no = snap_board_likes_no;
		this.snap_board_no = snap_board_no;
		this.customer_no = customer_no;
	}

	public int getSnap_board_likes_no() {
		return snap_board_likes_no;
	}

	public void setSnap_board_likes_no(int snap_board_likes_no) {
		this.snap_board_likes_no = snap_board_likes_no;
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

	@Override
	public String toString() {
		return "SnapBoardLikesDto [snap_board_likes_no=" + snap_board_likes_no + ", snap_board_no=" + snap_board_no
				+ ", customer_no=" + customer_no + "]";
	}
}
