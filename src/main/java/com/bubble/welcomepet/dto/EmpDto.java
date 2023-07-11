package com.bubble.welcomepet.dto;

import java.util.Date;

public class EmpDto {
	private int emp_no;
	private int position_no;
	private int emp_status_no;
	private String emp_name;
	private String emp_pw;
	private Date emp_reg_date;
	public EmpDto() {
		super();
	}
	public EmpDto(int emp_no, int position_no, int emp_status_no, String emp_name, String emp_pw, Date emp_reg_date) {
		super();
		this.emp_no = emp_no;
		this.position_no = position_no;
		this.emp_status_no = emp_status_no;
		this.emp_name = emp_name;
		this.emp_pw = emp_pw;
		this.emp_reg_date = emp_reg_date;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getPosition_no() {
		return position_no;
	}
	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}
	public int getEmp_status_no() {
		return emp_status_no;
	}
	public void setEmp_status_no(int emp_status_no) {
		this.emp_status_no = emp_status_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_pw() {
		return emp_pw;
	}
	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}
	public Date getEmp_reg_date() {
		return emp_reg_date;
	}
	public void setEmp_reg_date(Date emp_reg_date) {
		this.emp_reg_date = emp_reg_date;
	}
	@Override
	public String toString() {
		return "EmpDto [emp_no=" + emp_no + ", position_no=" + position_no + ", emp_status_no=" + emp_status_no
				+ ", emp_name=" + emp_name + ", emp_pw=" + emp_pw + ", emp_reg_date=" + emp_reg_date + "]";
	}

	

}
