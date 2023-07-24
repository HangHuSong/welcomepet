package com.bubble.welcomepet.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bubble.welcomepet.admin.mapper.AdminSqlMapper;
import com.bubble.welcomepet.dto.*;

@Service
public class AdminServiceImpl {

	@Autowired
	private AdminSqlMapper adminSqlMapper;

	public EmpDto getEmpByNoAndPw(EmpDto params) {
		EmpDto sessionUser = adminSqlMapper.getEmpByNoAndPw(params);
		return sessionUser;
	}

	public List<Map<String, Object>> getAllBiz() {
		List<BizDto> bizList = adminSqlMapper.getAllBiz();
		List<Map<String, Object>> list = new ArrayList<>();
		for (BizDto bizDto : bizList) {
			Map<String, Object> map = new HashMap<String, Object>();
			BizStatusDto bizStatusDto =
			adminSqlMapper.getBizStatus(bizDto.getBiz_status_no());
			map.put("bizStatusDto", bizStatusDto);
			map.put("bizDto", bizDto);
			list.add(map);
		}
		return list;
	}

	public List<Map<String, Object>> getAllCustomer(int page, String searchType, String searchWord) {
		List<CustomerDto> customerList = adminSqlMapper.getAllCustomer(page, searchType, searchWord);
		List<Map<String, Object>> list = new ArrayList<>();
		for (CustomerDto customerDto : customerList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("customerDto", customerDto);
			list.add(map);
		}
		return list;
	}

	public int getCustomerCount(String searchType, String searchWord) {
		return adminSqlMapper.getCustomerCount(searchType, searchWord);
	}

	

	public List<Map<String, Object>> getInquirys(int page, String searchWord, String searchType) {
		List<CsInquiryDto> inquiryList = adminSqlMapper.getInquirys(page, searchType, searchWord);
		List<Map<String, Object>> list = new ArrayList<>();
		for (CsInquiryDto csInquiryDto : inquiryList) {
			Map<String, Object> map = new HashMap<>();
			int checkReply = adminSqlMapper.checkInquiryReply(csInquiryDto.getCs_inquiry_no());
			if (checkReply > 0) {
				CsInquiryReplyDto csInquiryReplyDto = adminSqlMapper.getInquiryReplyByNo(csInquiryDto.getCs_inquiry_no());
				EmpDto empDto = adminSqlMapper.getEmpByNo(csInquiryReplyDto.getEmp_no());
				map.put("empDto", empDto);
				map.put("checkReply", checkReply);
			}
			map.put("csInquiryDto", csInquiryDto);
			list.add(map);
		}
		return list;
	}

	public int getInquiryCount(String searchType, String searchWord) {
		return adminSqlMapper.getInquiryCount(searchType, searchWord);
	}

	public Map<String, Object> getInquiryByNo(int cs_inquiry_no) {
		Map<String, Object> map = new HashMap<>();
		CsInquiryDto csInquiryDto = adminSqlMapper.getInquiryByNo(cs_inquiry_no);
		CustomerDto customerDto = adminSqlMapper.getCustomerByInquiryNo(csInquiryDto.getCustomer_no());
		if (csInquiryDto != null) {
			CsInquiryReplyDto csInquiryReplyDto = adminSqlMapper.getInquiryReplyByNo(cs_inquiry_no);
			if (csInquiryReplyDto != null) {
				int emp_no = csInquiryReplyDto.getEmp_no();
				EmpDto empDto = adminSqlMapper.getEmpByNo(emp_no);
				map.put("empDto", empDto);
			}
			map.put("csInquiryReplyDto", csInquiryReplyDto);
		}
		map.put("customerDto", customerDto);
		map.put("csInquiryDto", csInquiryDto);

		return map;
	}

	public void replyInquiryByEmp(CsInquiryReplyDto params) {
		adminSqlMapper.replyInquiryByEmp(params);
	}

	public void changeInquiryStatus(int cs_inquiry_no) {
		adminSqlMapper.changeInquiryStatus(cs_inquiry_no);
	}

	

	public void banCustomerThreeDays(CustomerBanDto customerBanDto) {
		adminSqlMapper.banCustomerThreeDays(customerBanDto);
	}

	public void banCustomerForever(CustomerBanDto customerBanDto) {
		adminSqlMapper.banCustomerForever(customerBanDto);

	}

	public List<Map<String, Object>> getBanHistory(int customer_no) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<CustomerBanDto> banList = adminSqlMapper.getBanHistory(customer_no);
		for (CustomerBanDto customerBanDto : banList) {
			Map<String, Object> map = new HashMap<>();
			int emp_no = customerBanDto.getEmp_no();
			EmpDto empDto = adminSqlMapper.getEmpByNo(emp_no);
			map.put("customerBanDto", customerBanDto);
			map.put("empDto", empDto);
			list.add(map);

		}
		return list;
	}

	public BizDto getBizByNo(int biz_no) {
		
		return adminSqlMapper.getBizByNo(biz_no);
	}

	public int checkApprovalByNo(int biz_no) {

		return adminSqlMapper.checkApprovalByNo(biz_no);
	}

	public BizApprovalRequestDto getApprovalRequestByNo(int biz_no) {

		return adminSqlMapper.getApprovalRequestByNo(biz_no);
	}

	public void confirmApproval(BizApprovalDto bizApprovalDto, int biz_no) {
		adminSqlMapper.confirmApproval(bizApprovalDto);
		adminSqlMapper.confirmBizApproval(biz_no);
	}

	public void rejectApproval(BizApprovalDto bizApprovalDto, int biz_no) {
		adminSqlMapper.rejectApproval(bizApprovalDto);
		adminSqlMapper.rejectBizApproval(biz_no);
	}

	public BizApprovalRequestDto getBizApprovalRequestByNo(int biz_approval_request_no) {
		return adminSqlMapper.getBizApprovalRequestByNo(biz_approval_request_no);

	}

	public BizApprovalDto getBizHistory(int biz_approval_request_no) {

		return adminSqlMapper.getBizHistory(biz_approval_request_no);
	}

	public EmpDto getEmpInfoByNo(int emp_no) {
		return adminSqlMapper.getEmpByNo(emp_no);
	}

	public BizStatusDto getBizStatus(int biz_status_no) {
		return adminSqlMapper.getBizStatus(biz_status_no);
	}

	public CustomerDto getCustomerByNo(int customer_no) {
		return adminSqlMapper.getCustomerByNo(customer_no);
	}

	public List<Map<String, Object>> getCustomerCoupon(int customer_no) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<CouponListDto> couponList = adminSqlMapper.getCouponList(customer_no);
		for (CouponListDto couponListDto : couponList) {
			Map<String, Object> map = new HashMap<>();
			int template_no = couponListDto.getTemplate_no();
			CouponTemplateDto couponTemplateDto = adminSqlMapper.getCouponTemplate(template_no);
			map.put("couponListDto", couponListDto);
			map.put("couponTemplateDto", couponTemplateDto);
			list.add(map);
		}
		return list;
	}

	public CustomerPointDto getCustomerPoint(int customer_no) {

		return adminSqlMapper.getCustomerPoint(customer_no);
	}

//	public List<Map<String, Object>> getOrderList() {
//		List<Map<String, Object>> list = new ArrayList<>();
//		List<OrderProductDto> orderProducts = adminSqlMapper.getOrderProducts();
//		for (OrderProductDto orderProductDto : orderProducts) {
//			Map<String, Object> map = new HashMap<>();
//			int orders_no = orderProductDto.getOrders_no();
//			OrdersDto ordersDto = adminSqlMapper.getOrder(orders_no);
//			int customer_no = ordersDto.getCustomer_no();
//			CustomerDto customerDto = adminSqlMapper.getCustomerByNo(customer_no);
//			int order_product_status_no = orderProductDto.getOrder_product_status_no();
//			OrderProductStatusDto orderProductStatusDto = adminSqlMapper.getOrderProductStatus(order_product_status_no);
//			int product_option_no = orderProductDto.getProduct_option_no();
//			ProductOptionDto productOptionDto = adminSqlMapper.getProductOptionByNo(product_option_no);
//			int product_no = productOptionDto.getProduct_no();
//			ProductDto productDto = adminSqlMapper.getProductByNo(product_no);
//			int biz_no = productDto.getBiz_no();
//			BizDto bizDto = adminSqlMapper.getBizByNo(biz_no);
//			// 상품 계산
//			int discount_rate = productDto.getProduct_discount_rate();
//			double discount_percentage = discount_rate / 100.0;
//			int product_price = productOptionDto.getProduct_option_price();
//			int discount_amount = (int)(product_price * discount_percentage);
//			int onsale_price = product_price - discount_amount;
//			int order_quantity = orderProductDto.getOrder_quantity();
//			int price = onsale_price * order_quantity; 
//			
//			orderProductDto.setOrder_product_price(price);
//			map.put("productOptionDto", productOptionDto);
//			map.put("bizDto", bizDto);
//			map.put("orderProductStatusDto", orderProductStatusDto);
//			map.put("customerDto", customerDto);
//			map.put("ordersDto", ordersDto);
//			map.put("orderProductDto", orderProductDto);
//			int order_status_no = orderProductDto.getOrder_product_status_no();
//			
//			ProductOptionDto productOptionDto = adminSqlMapper.getOrderProduct(orderProductDto.getProduct_option_no());
//			
//			int discount_rate = productDto.getProduct_discount_rate();
//			int product_price = productDto.getProduct_price();
//			double discount_percentage = discount_rate / 100.0;
//			int discount_amount = (int)(product_price * discount_percentage);
//			int onsale_price = product_price - discount_amount;
//			int total_price = onsale_price * orderProductDto.getOrder_quantity();
//			orderProductDto.setOrder_product_price(total_price);
//			// 주문상태
//			OrderProductStatusDto orderProductStatusDto = adminSqlMapper.getOrderProductStatus(order_status_no);
//			OrdersDto ordersDto = adminSqlMapper.getOrder(order_no);
//			CustomerDto customerDto = adminSqlMapper.getCustomerByNo(ordersDto.getCustomer_no());
//			BizDto bizDto = adminSqlMapper.getBizByNo(productDto.getBiz_no());
//			map.put("bizDto", bizDto);
//			map.put("customerDto", customerDto);
//			map.put("orderProductDto", orderProductDto);
//			map.put("productDto", productDto);
//			map.put("orderProductStatusDto", orderProductStatusDto);
//			map.put("ordersDto", ordersDto);
//			list.add(map);
//		}
//		return list;
//	}

	public List<Map<String, Object>> getSettleRequest() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<SettlementRequestDto> settlementRequestList = adminSqlMapper.getSettlementRequest();
		for (SettlementRequestDto settlementRequestDto : settlementRequestList) {
			int statement_no = settlementRequestDto.getStatement_no();
			StatementDto statementDto = adminSqlMapper.getStatements(statement_no);
			BizDto bizDto = adminSqlMapper.getBizByNo(statementDto.getBiz_no());
			int checkProcess = adminSqlMapper.checkProcess(settlementRequestDto.getSettlement_request_no());
			Map<String, Object> map = new HashMap<String, Object>();
			if (checkProcess > 0) {
				SettlementProcessDto settlementProcessDto = adminSqlMapper.getSettlementProcessByRequestNo(settlementRequestDto.getSettlement_request_no());
				map.put("settlementProcessDto", settlementProcessDto);
			}
			map.put("statementDto", statementDto);
			map.put("settlementRequestDto", settlementRequestDto);
			map.put("checkProcess", checkProcess);
			map.put("bizDto", bizDto);
			list.add(map);
		}
		return list;
	}

	public Map<String, Object> getSettlementRequestByNo(int settlement_request_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		SettlementRequestDto settlementRequestDto = adminSqlMapper.getSettlementRequestByNo(settlement_request_no);
		int statement_no = settlementRequestDto.getStatement_no();
		StatementDto statementDto = adminSqlMapper.getStatementByNo(statement_no);
		int biz_account_no = settlementRequestDto.getBiz_account_no();
		BizAccountDto bizAccountDto = adminSqlMapper.getBizAccountByNo(biz_account_no);
		int biz_no = bizAccountDto.getBiz_no();
		int bank_no = bizAccountDto.getBank_no();
		BankDto bankDto = adminSqlMapper.getBankByNo(bank_no);
		BizDto bizDto = adminSqlMapper.getBizByNo(biz_no);
		map.put("bankDto", bankDto);
		map.put("bizDto", bizDto);
		map.put("settlementRequestDto", settlementRequestDto);
		map.put("bizAccountDto", bizAccountDto);
		map.put("statementDto", statementDto);
		return map;
	}

	public void settlementProcess(SettlementProcessDto params) {
		
		adminSqlMapper.settlementProcess(params);
	}

	public List<Map<String, Object>> getShowDogList() {
		List<ShowDogPostDto> showDogList = adminSqlMapper.getShowDogList();
		List<Map<String, Object>> list = new ArrayList<>();
		for (ShowDogPostDto showDogPostDto : showDogList) {
			int customer_no = showDogPostDto.getCustomer_no();
			CustomerDto customerDto = adminSqlMapper.getCustomerByNo(customer_no);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("showDogPostDto", showDogPostDto);
			map.put("customerDto", customerDto);
			list.add(map);
		}
		return list;
	}

	public Map<String, Object> getShowDogDetail(int show_dog_post_no) {
		Map<String, Object> map = new HashMap<>();
		
		ShowDogPostDto showDogPostDto = adminSqlMapper.getShowDogDetail(show_dog_post_no);
		int customer_no = showDogPostDto.getCustomer_no();
		CustomerDto customerDto = adminSqlMapper.getCustomerByNo(customer_no);
		int countComments = adminSqlMapper.getShowDogCommentCount(show_dog_post_no);
		map.put("countComments", countComments);
		map.put("customerDto", customerDto);
		map.put("showDogPostDto", showDogPostDto);
		return map;
	}

	public List<Map<String, Object>> getShowDogComment(int show_dog_post_no) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<ShowDogCommentDto> comments = adminSqlMapper.getShowDogComments(show_dog_post_no);
		for (ShowDogCommentDto showDogCommentDto : comments) {
			int customer_no = showDogCommentDto.getCustomer_no();
			CustomerDto customerDto = adminSqlMapper.getCustomerByNo(customer_no);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("showDogCommentDto", showDogCommentDto);
			map.put("customerDto", customerDto);
			list.add(map);
		}
		return list;
	}

	public BizStatusDto getBizStatusByBizNo(int biz_no) {
		return adminSqlMapper.getBizStatusByBizNo(biz_no);
	}

	public List<Map<String, Object>> getBizApprovalRequest() {
		List<BizApprovalRequestDto> requestList = adminSqlMapper.getBizApprovalRequest();
		List<Map<String, Object>> list = new ArrayList<>();
		for (BizApprovalRequestDto bizApprovalRequestDto : requestList) {
			int check = adminSqlMapper.checkApprovalByNo(bizApprovalRequestDto.getBiz_no());
			if (check > 0) {
				Map<String, Object> map = new HashMap<>();
				map.put("bizApprovalRequestDto", bizApprovalRequestDto);
				list.add(map);
			}
		}
		return list;
	}

	

}
