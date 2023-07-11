package com.bubble.welcomepet.dto;

public class SubCategoryDto {
	private int sub_category_no ;
	private int main_category_no ;
	private String sub_category_name;
	public SubCategoryDto() {
		super();
	}
	public SubCategoryDto(int sub_category_no, int main_category_no, String sub_category_name) {
		super();
		this.sub_category_no = sub_category_no;
		this.main_category_no = main_category_no;
		this.sub_category_name = sub_category_name;
	}
	public int getSub_category_no() {
		return sub_category_no;
	}
	public void setSub_category_no(int sub_category_no) {
		this.sub_category_no = sub_category_no;
	}
	public int getMain_category_no() {
		return main_category_no;
	}
	public void setMain_category_no(int main_category_no) {
		this.main_category_no = main_category_no;
	}
	public String getSub_category_name() {
		return sub_category_name;
	}
	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}
	@Override
	public String toString() {
		return "SubCategoryDto [sub_category_no=" + sub_category_no + ", main_category_no=" + main_category_no
				+ ", sub_category_name=" + sub_category_name + "]";
	}
	
}
