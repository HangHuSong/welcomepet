package com.bubble.welcomepet.dto;

public class ImageDto {
	private int board_image_no;
	private int board_no;
	private String board_image_name;
	private String board_image_link;

	public ImageDto() {
		super();
	}

	public ImageDto(int board_image_no, int board_no, String board_image_name, String board_image_link) {
		super();
		this.board_image_no = board_image_no;
		this.board_no = board_no;
		this.board_image_name = board_image_name;
		this.board_image_link = board_image_link;
	}

	public int getBoard_image_no() {
		return board_image_no;
	}

	public void setBoard_image_no(int board_image_no) {
		this.board_image_no = board_image_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_image_name() {
		return board_image_name;
	}

	public void setBoard_image_name(String board_image_name) {
		this.board_image_name = board_image_name;
	}

	public String getBoard_image_link() {
		return board_image_link;
	}

	public void setBoard_image_link(String board_image_link) {
		this.board_image_link = board_image_link;
	}

	@Override
	public String toString() {
		return "ImageDto [board_image_no=" + board_image_no + ", board_no=" + board_no + ", board_image_name="
				+ board_image_name + ", board_image_link=" + board_image_link + "]";
	}

}
