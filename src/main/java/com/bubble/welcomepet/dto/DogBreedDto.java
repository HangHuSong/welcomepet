package com.bubble.welcomepet.dto;

public class DogBreedDto {
	private int dog_breed_no;
	private String dog_breed_name;

	public DogBreedDto() {
		super();
	}

	public DogBreedDto(int dog_breed_no, String dog_breed_name) {
		super();
		this.dog_breed_no = dog_breed_no;
		this.dog_breed_name = dog_breed_name;
	}

	public int getDog_breed_no() {
		return dog_breed_no;
	}

	public void setDog_breed_no(int dog_breed_no) {
		this.dog_breed_no = dog_breed_no;
	}

	public String getDog_breed_name() {
		return dog_breed_name;
	}

	public void setDog_breed_name(String dog_breed_name) {
		this.dog_breed_name = dog_breed_name;
	}

	@Override
	public String toString() {
		return "DogBreedDto [dog_breed_no=" + dog_breed_no + ", dog_breed_name=" + dog_breed_name + "]";
	}

}
