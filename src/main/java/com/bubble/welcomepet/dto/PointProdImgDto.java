package com.bubble.welcomepet.dto;

public class PointProdImgDto {
	private int point_product_image_no;
	private int point_product_no;
	private String point_product_image_link;
	private String point_product_image_name;

	public PointProdImgDto() {
		super();
	}

	public PointProdImgDto(int point_product_image_no, int point_product_no, String point_product_image_link,
			String point_product_image_name) {
		super();
		this.point_product_image_no = point_product_image_no;
		this.point_product_no = point_product_no;
		this.point_product_image_link = point_product_image_link;
		this.point_product_image_name = point_product_image_name;
	}

	public int getPoint_product_image_no() {
		return point_product_image_no;
	}

	public void setPoint_product_image_no(int point_product_image_no) {
		this.point_product_image_no = point_product_image_no;
	}

	public int getPoint_product_no() {
		return point_product_no;
	}

	public void setPoint_product_no(int point_product_no) {
		this.point_product_no = point_product_no;
	}

	public String getPoint_product_image_link() {
		return point_product_image_link;
	}

	public void setPoint_product_image_link(String point_product_image_link) {
		this.point_product_image_link = point_product_image_link;
	}

	public String getPoint_product_image_name() {
		return point_product_image_name;
	}

	public void setPoint_product_image_name(String point_product_image_name) {
		this.point_product_image_name = point_product_image_name;
	}

	@Override
	public String toString() {
		return "PointProdImgDto [point_product_image_no=" + point_product_image_no + ", point_product_no="
				+ point_product_no + ", point_product_image_link=" + point_product_image_link
				+ ", point_product_image_name=" + point_product_image_name + "]";
	}

}