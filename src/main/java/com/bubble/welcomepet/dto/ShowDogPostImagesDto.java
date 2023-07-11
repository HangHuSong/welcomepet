package com.bubble.welcomepet.dto;

public class ShowDogPostImagesDto {    
    private int show_dog_post_images_no;
    private int show_dog_post_no;
    private String show_dog_post_images_name;
    private String show_dog_post_images_link;
    
	public ShowDogPostImagesDto() {
		super();
	}

	public ShowDogPostImagesDto(int show_dog_post_images_no, int show_dog_post_no, String show_dog_post_images_name,
			String show_dog_post_images_link) {
		super();
		this.show_dog_post_images_no = show_dog_post_images_no;
		this.show_dog_post_no = show_dog_post_no;
		this.show_dog_post_images_name = show_dog_post_images_name;
		this.show_dog_post_images_link = show_dog_post_images_link;
	}

	public int getShow_dog_post_images_no() {
		return show_dog_post_images_no;
	}

	public void setShow_dog_post_images_no(int show_dog_post_images_no) {
		this.show_dog_post_images_no = show_dog_post_images_no;
	}

	public int getShow_dog_post_no() {
		return show_dog_post_no;
	}

	public void setShow_dog_post_no(int show_dog_post_no) {
		this.show_dog_post_no = show_dog_post_no;
	}

	public String getShow_dog_post_images_name() {
		return show_dog_post_images_name;
	}

	public void setShow_dog_post_images_name(String show_dog_post_images_name) {
		this.show_dog_post_images_name = show_dog_post_images_name;
	}

	public String getShow_dog_post_images_link() {
		return show_dog_post_images_link;
	}

	public void setShow_dog_post_images_link(String show_dog_post_images_link) {
		this.show_dog_post_images_link = show_dog_post_images_link;
	}

	@Override
	public String toString() {
		return "ShowDogPostImagesDto [show_dog_post_images_no=" + show_dog_post_images_no + ", show_dog_post_no="
				+ show_dog_post_no + ", show_dog_post_images_name=" + show_dog_post_images_name
				+ ", show_dog_post_images_link=" + show_dog_post_images_link + "]";
	}
    
}
