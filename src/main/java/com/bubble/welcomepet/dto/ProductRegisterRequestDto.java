package com.bubble.welcomepet.dto;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductRegisterRequestDto {
	private int product_no;
	private int sub_category_no;
	private String product_name;
	private String product_description;
	private int product_price;
	private int product_shipping_price;
	private int product_discount_rate;
	
	private List<ProductOptionDto> productOptionDtoList;

	public ProductRegisterRequestDto() {
		super();
	}

	public ProductRegisterRequestDto(int product_no, int sub_category_no, String product_name, MultipartFile thumbnail,
			MultipartFile[] main_images, MultipartFile[] detail_images, String product_description, int product_price,
			int product_shipping_price, int product_discount_rate, List<ProductOptionDto> productOptionDtoList) {
		super();
		this.product_no = product_no;
		this.sub_category_no = sub_category_no;
		this.product_name = product_name;
		this.product_description = product_description;
		this.product_price = product_price;
		this.product_shipping_price = product_shipping_price;
		this.product_discount_rate = product_discount_rate;
		this.productOptionDtoList = productOptionDtoList;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getSub_category_no() {
		return sub_category_no;
	}

	public void setSub_category_no(int sub_category_no) {
		this.sub_category_no = sub_category_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	

	public String getProduct_description() {
		return product_description;
	}

	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_shipping_price() {
		return product_shipping_price;
	}

	public void setProduct_shipping_price(int product_shipping_price) {
		this.product_shipping_price = product_shipping_price;
	}

	public int getProduct_discount_rate() {
		return product_discount_rate;
	}

	public void setProduct_discount_rate(int product_discount_rate) {
		this.product_discount_rate = product_discount_rate;
	}

	public List<ProductOptionDto> getProductOptionDtoList() {
		return productOptionDtoList;
	}

	public void setProductOptionDtoList(List<ProductOptionDto> productOptionDtoList) {
		this.productOptionDtoList = productOptionDtoList;
	}

	@Override
	public String toString() {
		return "ProductRegisterRequestDto [product_no=" + product_no + ", sub_category_no=" + sub_category_no
				+ ", product_name=" + product_name + ", product_description=" + product_description + ", product_price="
				+ product_price + ", product_shipping_price=" + product_shipping_price + ", product_discount_rate="
				+ product_discount_rate + ", productOptionDtoList=" + productOptionDtoList + "]";
	}

	

	
	
	
}
