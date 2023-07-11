package com.bubble.welcomepet.dto;

public class CategoryDto {
	private int main_category_no;
	private String main_category_name;
	private int sub_category_no;
	private String sub_category_name;
	public CategoryDto() {
		super();
	}
	public CategoryDto(int main_category_no, String main_category_name, int sub_category_no, String sub_category_name) {
		super();
		this.main_category_no = main_category_no;
		this.main_category_name = main_category_name;
		this.sub_category_no = sub_category_no;
		this.sub_category_name = sub_category_name;
	}
	public int getMain_category_no() {
		return main_category_no;
	}
	public void setMain_category_no(int main_category_no) {
		this.main_category_no = main_category_no;
	}
	public String getMain_category_name() {
		return main_category_name;
	}
	public void setMain_category_name(String main_category_name) {
		this.main_category_name = main_category_name;
	}
	public int getSub_category_no() {
		return sub_category_no;
	}
	public void setSub_category_no(int sub_category_no) {
		this.sub_category_no = sub_category_no;
	}
	public String getSub_category_name() {
		return sub_category_name;
	}
	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}
	
}
