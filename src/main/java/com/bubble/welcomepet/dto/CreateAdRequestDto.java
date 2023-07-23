package com.bubble.welcomepet.dto;

import java.util.List;

public class CreateAdRequestDto {
	private AdPaymentDto adPaymentDto;
	private List<AdProductDto> adProductDtoList;
	private String adPaymentApprovedDate;
	private String adPaymentCreatedDate;
	
	
	public CreateAdRequestDto() {
		super();
	}
	public CreateAdRequestDto(AdPaymentDto adPaymentDto, List<AdProductDto> adProductDtoList, String adPaymentApprovedDate,
			String adPaymentCreatedDate) {
		super();
		this.adPaymentDto = adPaymentDto;
		this.adProductDtoList = adProductDtoList;
		this.adPaymentApprovedDate = adPaymentApprovedDate;
		this.adPaymentCreatedDate = adPaymentCreatedDate;
	}
	public AdPaymentDto getAdPaymentDto() {
		return adPaymentDto;
	}
	public void setAdPaymentDto(AdPaymentDto adPaymentDto) {
		this.adPaymentDto = adPaymentDto;
	}
	public List<AdProductDto> getAdProductDtoList() {
		return adProductDtoList;
	}
	public void setAdProductDtoList(List<AdProductDto> adProductDtoList) {
		this.adProductDtoList = adProductDtoList;
	}
	public String getAdPaymentApprovedDate() {
		return adPaymentApprovedDate;
	}
	public void setAdPaymentApprovedDate(String adPaymentApprovedDate) {
		this.adPaymentApprovedDate = adPaymentApprovedDate;
	}
	public String getAdPaymentCreatedDate() {
		return adPaymentCreatedDate;
	}
	public void setAdPaymentCreatedDate(String adPaymentCreatedDate) {
		this.adPaymentCreatedDate = adPaymentCreatedDate;
	}
	@Override
	public String toString() {
		return "CreateAdRequest [adPaymentDto=" + adPaymentDto + ", adProductDtoList=" + adProductDtoList
				+ ", adPaymentApprovedDate=" + adPaymentApprovedDate + ", adPaymentCreatedDate=" + adPaymentCreatedDate
				+ "]";
	}
	
	
}
