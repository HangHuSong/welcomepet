package com.bubble.welcomepet.dto;

import java.util.Date;

public class OrderAlarmDto {
	private int order_alarm_no;
	private int biz_no ;
	private int order_product_no ;
	private int order_alarm_is_checked ;
	private Date order_alarm_noti_date ;
	public OrderAlarmDto() {
		super();
	}
	public OrderAlarmDto(int order_alarm_no, int biz_no, int order_product_no, int order_alarm_is_checked,
			Date order_alarm_noti_date) {
		super();
		this.order_alarm_no = order_alarm_no;
		this.biz_no = biz_no;
		this.order_product_no = order_product_no;
		this.order_alarm_is_checked = order_alarm_is_checked;
		this.order_alarm_noti_date = order_alarm_noti_date;
	}
	public int getOrder_alarm_no() {
		return order_alarm_no;
	}
	public void setOrder_alarm_no(int order_alarm_no) {
		this.order_alarm_no = order_alarm_no;
	}
	public int getBiz_no() {
		return biz_no;
	}
	public void setBiz_no(int biz_no) {
		this.biz_no = biz_no;
	}
	public int getOrder_product_no() {
		return order_product_no;
	}
	public void setOrder_product_no(int order_product_no) {
		this.order_product_no = order_product_no;
	}
	public int getOrder_alarm_is_checked() {
		return order_alarm_is_checked;
	}
	public void setOrder_alarm_is_checked(int order_alarm_is_checked) {
		this.order_alarm_is_checked = order_alarm_is_checked;
	}
	public Date getOrder_alarm_noti_date() {
		return order_alarm_noti_date;
	}
	public void setOrder_alarm_noti_date(Date order_alarm_noti_date) {
		this.order_alarm_noti_date = order_alarm_noti_date;
	}
	@Override
	public String toString() {
		return "OrderAlarmDto [order_alarm_no=" + order_alarm_no + ", biz_no=" + biz_no + ", order_product_no="
				+ order_product_no + ", order_alarm_is_checked=" + order_alarm_is_checked + ", order_alarm_noti_date="
				+ order_alarm_noti_date + "]";
	}
	
	
}
