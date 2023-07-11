package com.bubble.welcomepet.dto;

public class MainCategoryDto {
	private int main_category_no ;
	private String main_category_name ;
	public MainCategoryDto() {
		super();
	}
	public MainCategoryDto(int main_category_no, String main_category_name) {
		super();
		this.main_category_no = main_category_no;
		this.main_category_name = main_category_name;
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
	@Override
	public String toString() {
		return "MainCategoryDto [main_category_no=" + main_category_no + ", main_category_name=" + main_category_name
				+ "]";
	}
	
	
}
