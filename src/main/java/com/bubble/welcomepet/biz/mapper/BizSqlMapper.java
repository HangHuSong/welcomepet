package com.bubble.welcomepet.biz.mapper;

import java.util.List;
import java.util.Map;

import com.bubble.welcomepet.dto.BizApprovalDto;
import com.bubble.welcomepet.dto.BizApprovalRequestDto;
import com.bubble.welcomepet.dto.BizDto;
import com.bubble.welcomepet.dto.ProductDto;

public interface BizSqlMapper {
	
	public int createBizNo();
	
	public void createBiz(BizDto bizDto);

	public BizDto getBizByIdAndPw(BizDto bizDto);

	public BizApprovalRequestDto getBizApprovalRequestByBizNo(int biz_no);

	public BizApprovalDto getBizApprovalByRequestNo(int biz_approval_request_no);

	public void createBizApprovalRequest(BizApprovalRequestDto bizApprovalRequestDto);

	public void updateBizStatusFromBiz(BizDto bizDto);

	public void updateBizShopInformFromBiz(BizDto bizDto);

	public BizDto getBizByIdAndEmail(BizDto loginUser);

	public BizDto getBizByNo(int biz_no);

	public void createKakaoBiz(BizDto loginUser);

	public int getBizLikesNumByBizNo(int biz_no);

	


}
