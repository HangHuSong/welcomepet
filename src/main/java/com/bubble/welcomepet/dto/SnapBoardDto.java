package com.bubble.welcomepet.dto;

import java.util.Date;

public class SnapBoardDto {
	private int snap_board_no;
	private int dog_no;
	private String snap_board_content;
	private int snap_board_view_count;
	private Date snap_board_reg_date;
	private String snap_location;
	private String snap_thumbnail;

	public SnapBoardDto() {
		super();
	}

	public SnapBoardDto(int snap_board_no, int dog_no, String snap_board_content, int snap_board_view_count,
			Date snap_board_reg_date, String snap_location, String snap_thumbnail) {
		super();
		this.snap_board_no = snap_board_no;
		this.dog_no = dog_no;
		this.snap_board_content = snap_board_content;
		this.snap_board_view_count = snap_board_view_count;
		this.snap_board_reg_date = snap_board_reg_date;
		this.snap_location = snap_location;
		this.snap_thumbnail = snap_thumbnail;
	}

	public int getSnap_board_no() {
		return snap_board_no;
	}

	public void setSnap_board_no(int snap_board_no) {
		this.snap_board_no = snap_board_no;
	}

	public int getDog_no() {
		return dog_no;
	}

	public void setDog_no(int dog_no) {
		this.dog_no = dog_no;
	}

	public String getSnap_board_content() {
		return snap_board_content;
	}

	public void setSnap_board_content(String snap_board_content) {
		this.snap_board_content = snap_board_content;
	}

	public int getSnap_board_view_count() {
		return snap_board_view_count;
	}

	public void setSnap_board_view_count(int snap_board_view_count) {
		this.snap_board_view_count = snap_board_view_count;
	}

	public Date getSnap_board_reg_date() {
		return snap_board_reg_date;
	}

	public void setSnap_board_reg_date(Date snap_board_reg_date) {
		this.snap_board_reg_date = snap_board_reg_date;
	}

	public String getSnap_location() {
		return snap_location;
	}

	public void setSnap_location(String snap_location) {
		this.snap_location = snap_location;
	}

	public String getSnap_thumbnail() {
		return snap_thumbnail;
	}

	public void setSnap_thumbnail(String snap_thumbnail) {
		this.snap_thumbnail = snap_thumbnail;
	}

	@Override
	public String toString() {
		return "SnapBoardDto [snap_board_no=" + snap_board_no + ", dog_no=" + dog_no + ", snap_board_content="
				+ snap_board_content + ", snap_board_view_count=" + snap_board_view_count + ", snap_board_reg_date="
				+ snap_board_reg_date + ", snap_location=" + snap_location + ", snap_thumbnail=" + snap_thumbnail + "]";
	}

}
