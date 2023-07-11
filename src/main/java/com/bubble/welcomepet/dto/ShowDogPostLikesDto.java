package com.bubble.welcomepet.dto;

public class ShowDogPostLikesDto {

	private int show_dog_post_likes_no;
	private int show_dog_post_no;
	private int customer_no;
	
	public ShowDogPostLikesDto() {
		super();
	}

	public ShowDogPostLikesDto(int show_dog_post_likes_no, int show_dog_post_no, int customer_no) {
		super();
		this.show_dog_post_likes_no = show_dog_post_likes_no;
		this.show_dog_post_no = show_dog_post_no;
		this.customer_no = customer_no;
	}

	public int getShow_dog_post_likes_no() {
		return show_dog_post_likes_no;
	}

	public void setShow_dog_post_likes_no(int show_dog_post_likes_no) {
		this.show_dog_post_likes_no = show_dog_post_likes_no;
	}

	public int getShow_dog_post_no() {
		return show_dog_post_no;
	}

	public void setShow_dog_post_no(int show_dog_post_no) {
		this.show_dog_post_no = show_dog_post_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	@Override
	public String toString() {
		return "ShowDogPostLikes [show_dog_post_likes_no=" + show_dog_post_likes_no + ", show_dog_post_no="
				+ show_dog_post_no + ", customer_no=" + customer_no + "]";
	}
	
}
