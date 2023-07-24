package com.bubble.welcomepet.ad.mapper;

import java.util.List;

import com.bubble.welcomepet.dto.AdCategoryDto;
import com.bubble.welcomepet.dto.AdPaymentDto;
import com.bubble.welcomepet.dto.AdProductDto;

public interface AdSqlMapper {

	public int createAdPaymentPk();

	public void createAdPayment(AdPaymentDto adPaymentDto);

	public void createAdProduct(AdProductDto adProductDto);

	public List<AdProductDto> getOngoingAdProductByBizNo(int biz_no);

	public AdCategoryDto getAdCategoryByNo(int ad_category_no);

	public List<AdCategoryDto> getAllAdCategory();

	public List<AdProductDto> getUpcomingAdProductByBizNo(int biz_no);

	public List<AdProductDto> getExpiredAdProductByBizNo(int biz_no);

}
