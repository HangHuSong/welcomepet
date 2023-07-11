package com.bubble.welcomepet.dto;

public class SnapImagesDto {
	private int snap_images_no;
	private int snap_board_no;
	private String snap_image_link;

	public SnapImagesDto() {
		super();
	}

	public SnapImagesDto(int snap_images_no, int snap_board_no, String snap_image_link) {
		super();
		this.snap_images_no = snap_images_no;
		this.snap_board_no = snap_board_no;
		this.snap_image_link = snap_image_link;
	}

	public int getSnap_images_no() {
		return snap_images_no;
	}

	public void setSnap_images_no(int snap_images_no) {
		this.snap_images_no = snap_images_no;
	}

	public int getSnap_board_no() {
		return snap_board_no;
	}

	public void setSnap_board_no(int snap_board_no) {
		this.snap_board_no = snap_board_no;
	}

	public String getSnap_image_link() {
		return snap_image_link;
	}

	public void setSnap_image_link(String snap_image_link) {
		this.snap_image_link = snap_image_link;
	}

	@Override
	public String toString() {
		return "SnapImagesDto [snap_images_no=" + snap_images_no + ", snap_board_no=" + snap_board_no
				+ ", snap_image_link=" + snap_image_link + "]";
	}

}
