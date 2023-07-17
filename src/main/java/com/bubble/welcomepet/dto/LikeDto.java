package com.bubble.welcomepet.dto;

public class LikeDto {

	private int board_like_no;
	private int board_no;
	private int customer_no;

	public LikeDto() {
		super();
	}

	public LikeDto(int board_like_no, int board_no, int customer_no) {
		super();
		this.board_like_no = board_like_no;
		this.board_no = board_no;
		this.customer_no = customer_no;
	}

	public int getBoard_like_no() {
		return board_like_no;
	}

	public void setBoard_like_no(int board_like_no) {
		this.board_like_no = board_like_no;
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

	@Override
	public String toString() {
		return "LikeDto [board_like_no=" + board_like_no + ", board_no=" + board_no + ", customer_no=" + customer_no
				+ "]";
	}

}
