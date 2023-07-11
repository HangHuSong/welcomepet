package com.bubble.welcomepet.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DogDto {
	private int dog_no;
	private int customer_no;
	private int dog_breed_no;
	private String dog_name;
	private String dog_gender;
	private String dog_image;
	private int dog_weight;
	private String dog_introduction;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dog_birth;

	public DogDto() {
		super();
	}

	public DogDto(int dog_no, int customer_no, int dog_breed_no, String dog_name, String dog_gender, String dog_image,
			int dog_weight, String dog_introduction, Date dog_birth) {
		super();
		this.dog_no = dog_no;
		this.customer_no = customer_no;
		this.dog_breed_no = dog_breed_no;
		this.dog_name = dog_name;
		this.dog_gender = dog_gender;
		this.dog_image = dog_image;
		this.dog_weight = dog_weight;
		this.dog_introduction = dog_introduction;
		this.dog_birth = dog_birth;
	}

	public int getDog_no() {
		return dog_no;
	}

	public void setDog_no(int dog_no) {
		this.dog_no = dog_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getDog_breed_no() {
		return dog_breed_no;
	}

	public void setDog_breed_no(int dog_breed_no) {
		this.dog_breed_no = dog_breed_no;
	}

	public String getDog_name() {
		return dog_name;
	}

	public void setDog_name(String dog_name) {
		this.dog_name = dog_name;
	}

	public String getDog_gender() {
		return dog_gender;
	}

	public void setDog_gender(String dog_gender) {
		this.dog_gender = dog_gender;
	}

	public String getDog_image() {
		return dog_image;
	}

	public void setDog_image(String dog_image) {
		this.dog_image = dog_image;
	}

	public int getDog_weight() {
		return dog_weight;
	}

	public void setDog_weight(int dog_weight) {
		this.dog_weight = dog_weight;
	}

	public String getDog_introduction() {
		return dog_introduction;
	}

	public void setDog_introduction(String dog_introduction) {
		this.dog_introduction = dog_introduction;
	}

	public Date getDog_birth() {
		return dog_birth;
	}

	public void setDog_birth(Date dog_birth) {
		this.dog_birth = dog_birth;
	}

	@Override
	public String toString() {
		return "DogDto [dog_no=" + dog_no + ", customer_no=" + customer_no + ", dog_breed_no=" + dog_breed_no
				+ ", dog_name=" + dog_name + ", dog_gender=" + dog_gender + ", dog_image=" + dog_image + ", dog_weight="
				+ dog_weight + ", dog_introduction=" + dog_introduction + ", dog_birth=" + dog_birth + "]";
	}

}
