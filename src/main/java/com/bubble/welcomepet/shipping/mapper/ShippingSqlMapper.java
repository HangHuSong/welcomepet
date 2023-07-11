package com.bubble.welcomepet.shipping.mapper;

import java.util.List;

import com.bubble.welcomepet.dto.ShippingCompanyDto;
import com.bubble.welcomepet.dto.ShippingDto;

public interface ShippingSqlMapper {

	public List<ShippingCompanyDto> getAllShippingCompany();

	public void createShipping(ShippingDto shippingDto);

	public int countShippingByOrderProductNo(int order_product_no);

	public ShippingDto getShippingByOrderProductNo(int order_product_no);

	public ShippingCompanyDto getShippingCompanyByNo(int shipping_company_no);

}
