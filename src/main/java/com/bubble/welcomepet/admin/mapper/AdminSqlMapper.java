package com.bubble.welcomepet.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bubble.welcomepet.dto.*;

public interface AdminSqlMapper {

	public EmpDto getEmpByNoAndPw(EmpDto params);

	public List<BizDto> getAllBiz();

	public List<CustomerDto> getAllCustomer(@Param("page") int page, 
											@Param("searchType") String searchType, 
											@Param("searchWord")String searchWord);

	public int getCustomerCount(@Param("searchType")String searchType, @Param("searchWord")String searchWord);

	public List<CustomerDto> getCustomerDetail(int customer_no);

	/* 1대1 문의 게시판 */
	public List<CsInquiryDto> getInquirys(@Param("page") int page, 
										  @Param("searchType") String searchType, 
										  @Param("searchWord")String searchWord);

	public int getInquiryCount(@Param("searchType")String searchType, @Param("searchWord")String searchWord);

	public CsInquiryDto getInquiryByNo(int cs_inquiry_no);

	public CustomerDto getCustomerByInquiryNo(int customer_no);

	/*관리자 문의 답변*/
	public void replyInquiryByEmp(CsInquiryReplyDto params);
	/*답변 이후 상태값 변경*/
	public void changeInquiryStatus(int cs_inquiry_no);

	public CsInquiryReplyDto getInquiryReplyByNo(int cs_inquiry_no);

	public EmpDto getEmpByNo(int emp_no);

	public void banCustomerThreeDays(CustomerBanDto customerBanDto);

	public void banCustomerForever(CustomerBanDto customerBanDto);

	public List<CustomerBanDto> getBanHistory(int customer_no);

	public BizDto getBizByNo(int biz_no);

	public SubCategoryDto getSubCategory(int sub_category_no);

	public MainCategoryDto getMainCategory(int main_category_no);

	public int checkApprovalByNo(int biz_no);

	public BizApprovalRequestDto getApprovalRequestByNo(int biz_no);

	public void confirmApproval(BizApprovalDto bizApprovalDto);

	public void confirmBizApproval(int biz_no);

	public void rejectApproval(BizApprovalDto bizApprovalDto);

	public BizApprovalRequestDto getBizApprovalRequestByNo(int biz_approval_request_no);

	public void rejectBizApproval(int biz_no);

	public BizApprovalDto getBizHistory(int biz_approval_request_no);

	public BizStatusDto getBizStatus(int biz_status_no);

	public CustomerDto getCustomerByNo(int customer_no);

	public List<CouponListDto> getCouponList(int customer_no);

	public CouponTemplateDto getCouponTemplate(int template_no);

	public CustomerPointDto getCustomerPoint(int customer_no);

	public List<OrderProductDto> getOrderProducts();

	public ProductOptionDto getOrderProduct(int product_option_no);

	public OrderProductStatusDto getOrderProductStatus(int order_product_status_no);

	public OrdersDto getOrder(int orders_no);

	public int getTotalSale(int biz_no);

	public List<OrderProductDto> getOrderProductList(int biz_no);

	public void scheduleStatement(StatementDto statementDto);

	public int checkRequestByNo(int statement_no);

	public List<SettlementRequestDto> getSettlementRequest();

	public int checkProcess(int settlement_request_no);

	public StatementDto getStatements(int statement_no);

	public SettlementRequestDto getSettlementRequestByNo(int settlement_request_no);

	public BizAccountDto getBizAccountByNo(int biz_account_no);

	public BankDto getBankByNo(int bank_no);

	public StatementDto getStatementByNo(int statement_no);

	public void settlementProcess(SettlementProcessDto params);

	public int checkInquiryReply(int cs_inquiry_no);

	public SettlementProcessDto getSettlementProcessByRequestNo(int settlement_request_no);

	public List<ShowDogPostDto> getShowDogList();

	public List<ShowDogCommentDto> getShowDogComments(int show_dog_post_no);

	public ShowDogPostDto getShowDogDetail(int show_dog_post_no);

	public int getShowDogCommentCount(int show_dog_post_no);

	public BizStatusDto getBizStatusByBizNo(int biz_no);

	public List<BizApprovalRequestDto> getBizApprovalRequest();

	public ProductOptionDto getProductOptionByNo(int product_option_no);

	public ProductDto getProductByNo(int product_no);

	public List<OrderProductDto> getCustomerOrders(int customer_no);
}
