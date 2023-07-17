package com.bubble.welcomepet.customer.mapper;

import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.DogDto;

public interface CustomerSqlMapper {

	CustomerDto getCustomerByNo(int customer_no);

	CustomerDto getCustomerByOrderProductNo(int order_product_no);

	
//	스냅 리스트에서 반려견 정보 불러오기
	public DogDto findByDogNumber(int dog_no);

//	CustomerDto에서 고객 닉네임 불러오기
	public CustomerDto getByCustomerNo(int customer_no);

	public int createCustomerPk();

	public void registerCustomer(CustomerDto customerDto);

	public CustomerDto selectByUserIdAndPw(CustomerDto params);
	
	public CustomerDto selectById(int customer_no);


}

