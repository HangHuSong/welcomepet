package com.bubble.welcomepet.dto;

public class CouponListDto {
	private int coupon_no;
	private int customer_no;
	private int template_no;
	private int emp_no;
	private int coupon_is_used;

	public CouponListDto() {
		super();
	}

	public CouponListDto(int coupon_no, int customer_no, int template_no, int emp_no, int coupon_is_used) {
		super();
		this.coupon_no = coupon_no;
		this.customer_no = customer_no;
		this.template_no = template_no;
		this.emp_no = emp_no;
		this.coupon_is_used = coupon_is_used;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getTemplate_no() {
		return template_no;
	}

	public void setTemplate_no(int template_no) {
		this.template_no = template_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getCoupon_is_used() {
		return coupon_is_used;
	}

	public void setCoupon_is_used(int coupon_is_used) {
		this.coupon_is_used = coupon_is_used;
	}

	@Override
	public String toString() {
		return "CouponListDto [coupon_no=" + coupon_no + ", customer_no=" + customer_no + ", template_no=" + template_no
				+ ", emp_no=" + emp_no + ", coupon_is_used=" + coupon_is_used + "]";
	}

}
