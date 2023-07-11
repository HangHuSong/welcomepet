package com.bubble.welcomepet.dto;

public class OrderProductDto {
	private int order_product_no;
	private int orders_no;
	private int product_option_no;
	private int order_product_status_no;
	private int order_product_quantity;
	private int order_product_price;
	private int order_product_used_point;
    private ProductOptionDto product_option;
    private ProductDto product;
    private String order_product_status_name;
	public OrderProductDto() {
		super();
	}
	public OrderProductDto(int order_product_no, int orders_no, int product_option_no, int order_product_status_no,
			int order_product_quantity, int order_product_price, int order_product_used_point,
			ProductOptionDto product_option, ProductDto product, String order_product_status_name) {
		super();
		this.order_product_no = order_product_no;
		this.orders_no = orders_no;
		this.product_option_no = product_option_no;
		this.order_product_status_no = order_product_status_no;
		this.order_product_quantity = order_product_quantity;
		this.order_product_price = order_product_price;
		this.order_product_used_point = order_product_used_point;
		this.product_option = product_option;
		this.product = product;
		this.order_product_status_name = order_product_status_name;
	}
	public int getOrder_product_no() {
		return order_product_no;
	}
	public void setOrder_product_no(int order_product_no) {
		this.order_product_no = order_product_no;
	}
	public int getOrders_no() {
		return orders_no;
	}
	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}
	public int getProduct_option_no() {
		return product_option_no;
	}
	public void setProduct_option_no(int product_option_no) {
		this.product_option_no = product_option_no;
	}
	public int getOrder_product_status_no() {
		return order_product_status_no;
	}
	public void setOrder_product_status_no(int order_product_status_no) {
		this.order_product_status_no = order_product_status_no;
	}
	public int getOrder_product_quantity() {
		return order_product_quantity;
	}
	public void setOrder_product_quantity(int order_product_quantity) {
		this.order_product_quantity = order_product_quantity;
	}
	public int getOrder_product_price() {
		return order_product_price;
	}
	public void setOrder_product_price(int order_product_price) {
		this.order_product_price = order_product_price;
	}
	public int getOrder_product_used_point() {
		return order_product_used_point;
	}
	public void setOrder_product_used_point(int order_product_used_point) {
		this.order_product_used_point = order_product_used_point;
	}
	public ProductOptionDto getProduct_option() {
		return product_option;
	}
	public void setProduct_option(ProductOptionDto product_option) {
		this.product_option = product_option;
	}
	public ProductDto getProduct() {
		return product;
	}
	public void setProduct(ProductDto product) {
		this.product = product;
	}
	public String getOrder_product_status_name() {
		return order_product_status_name;
	}
	public void setOrder_product_status_name(String order_product_status_name) {
		this.order_product_status_name = order_product_status_name;
	}


}
