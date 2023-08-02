package com.bubble.welcomepet.biz.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.biz.service.BizServiceImpl;
import com.bubble.welcomepet.dto.AdCategoryDto;
import com.bubble.welcomepet.dto.BankDto;
import com.bubble.welcomepet.dto.BizAccountDto;
import com.bubble.welcomepet.dto.BizApprovalDto;
import com.bubble.welcomepet.dto.BizApprovalRequestDto;
import com.bubble.welcomepet.dto.BizDto;
import com.bubble.welcomepet.dto.MainCategoryDto;
import com.bubble.welcomepet.dto.ProductDto;
import com.bubble.welcomepet.dto.ProductOptionDto;
import com.bubble.welcomepet.dto.ShippingCompanyDto;

@Controller
@RequestMapping("/biz/*")
public class BizController {

	@Autowired
	private BizServiceImpl bizService;
	
	
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		
		return "biz/login";
	}
	
	@RequestMapping("main")
	public String main(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		if (bizUser.getBiz_status_no() == 2) {
			BizApprovalRequestDto bizApprovalRequestDto = bizService
					.getBizApprovalRequestByBizNo(bizUser.getBiz_no());
			model.addAttribute("bizApprovalRequestDto", bizApprovalRequestDto);
		}
		else if (bizUser.getBiz_status_no() == 3 || bizUser.getBiz_status_no() == 5) {
			BizApprovalRequestDto bizApprovalRequestDto = bizService
					.getBizApprovalRequestByBizNo(bizUser.getBiz_no());
			BizApprovalDto bizApprovalDto = bizService
					.getBizApprovalByRequestNo(bizApprovalRequestDto.getBiz_approval_request_no());

			model.addAttribute("bizApprovalDto", bizApprovalDto);
		}
		else if(bizUser.getBiz_status_no() == 4) {
			Map<String, Object> alarmData=bizService.getAlarmData(bizUser.getBiz_no());
			Map<String,Object> newRequestNumData=bizService.getNewRequestData(bizUser.getBiz_no());
			Map<String,Object> orderStatusNumData=bizService.getOrderNumData(bizUser.getBiz_no());
			Map<String,Object> cancelRefundExchangeNumData=bizService.getCancelRefundExchangeNumDataData(bizUser.getBiz_no());
			Map<String,Object> storeGradeData=bizService.getPurchaseConfirmationAndremainingAmountToNextGradeData(bizUser.getBiz_no());
			Map<String,Object> paymentData=bizService.getTodayAndWeeklyPaymentData(bizUser.getBiz_no());
			Map<String,Object> top5ProductData=bizService.getTop5ProductData(bizUser.getBiz_no());
			int biz_likes_num=bizService.getBizLikesNumByBizNo(bizUser.getBiz_no());
			
			model.addAttribute("biz_likes_num", biz_likes_num);
			model.addAttribute("alarmData", alarmData);
			model.addAttribute("newRequestNumData", newRequestNumData);
			model.addAttribute("orderStatusNumData", orderStatusNumData);
			model.addAttribute("cancelRefundExchangeNumData", cancelRefundExchangeNumData);
			model.addAttribute("storeGradeData", storeGradeData);
			model.addAttribute("paymentData", paymentData);
			model.addAttribute("top5ProductData", top5ProductData);
		}

		return "biz/main";
	}

	@RequestMapping("bizApprovalRequest")
	public String bizApprovalRequest() {

		return "biz/bizApprovalRequest";
	}

	@RequestMapping("login")
	public String login() {

		return "biz/login";
	}

	
	
	@RequestMapping("login/callback")
	public String loginCallback() {
		
		return "biz/login";
	}
	
	@RequestMapping("register")
	public String register() {
		return "biz/register";
	}

	@RequestMapping("registerProcess")
	public String registerProcess(BizDto bizDto) {
		bizService.createBiz(bizDto);

		return "redirect:./registerComplete";
	}

	@RequestMapping("registerComplete")
	public String registerComplete() {
		return "biz/registerComplete";
	}

	@RequestMapping("shopInformRegister")
	public String shopInformRegister() {
		return "biz/shopInformRegister";
	}

	@RequestMapping("productList")
	public String productList(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> productDataList = bizService.getProductByBizNo(bizUser.getBiz_no());
		model.addAttribute("productDataList", productDataList);
		
		Map<String,Object> productNumPerStatus=bizService.getProductNumPerStatusByBizNo(bizUser.getBiz_no());
		model.addAttribute("productNumPerStatus", productNumPerStatus);
		
		List<MainCategoryDto> mainCategoryList = bizService.getMainCategoryList();
		model.addAttribute("mainCategoryList", mainCategoryList);

		return "biz/productList";
	}

	@RequestMapping("productRegister")
	public String productRegister(Model model) {
		List<MainCategoryDto> mainCategoryList = bizService.getMainCategoryList();

		model.addAttribute("mainCategoryList", mainCategoryList);

		return "biz/productRegister";
	}

	@RequestMapping("productRegisterProcess")
	public String productRegisterProcess(HttpSession session, ProductDto productDto, int stock_quantity,
			String option_name, String option_price, String option_stock_quantity, MultipartFile thumbnail,
			MultipartFile[] main_images, MultipartFile[] detail_images) {

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		productDto.setBiz_no(bizUser.getBiz_no());

		List<ProductOptionDto> productOptionDtoList = new ArrayList<ProductOptionDto>();

		System.out.println("option_price: " + option_price);
		if (!option_price.equals("")) {
			String[] product_option_names = option_name.split(",");
			String[] product_option_prices = option_price.split(",");
			String[] product_option_stock_quantities = option_stock_quantity.split(",");

			for (int i = 0; i < product_option_names.length; i++) {
				ProductOptionDto productOptionDto = new ProductOptionDto();
				productOptionDto.setProduct_option_name(product_option_names[i]);
				productOptionDto.setProduct_option_price(Integer.parseInt(product_option_prices[i]));
				productOptionDto.setProduct_option_stock_quantity(Integer.parseInt(product_option_stock_quantities[i]));

				productOptionDtoList.add(productOptionDto);
			}
		} else {
			ProductOptionDto productOptionDto = new ProductOptionDto();
			productOptionDto.setProduct_option_name(productDto.getProduct_name());
			productOptionDto.setProduct_option_price(productDto.getProduct_price());
			productOptionDto.setProduct_option_stock_quantity(stock_quantity);

			productOptionDtoList.add(productOptionDto);
		}

		bizService.createProduct(productDto, productOptionDtoList, thumbnail, main_images, detail_images);

		return "redirect:./productRegister?alert=productRegisterSuccess";
	}

	@RequestMapping("productDetail")
	public String productDetail(int product_no, Model model) {
		Map<String, Object> productData = bizService.getProductByNo(product_no);

		model.addAttribute("productData", productData);
		return "biz/productDetail";
	}

	@RequestMapping("accountRegister")
	public String accountRegister(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<BankDto> bankDtoList = bizService.getAllBank();
		List<Map<String, Object>> bizAccountDataList = bizService.getBizAccountDataListByBizNo(bizUser.getBiz_no());

		model.addAttribute("bankDtoList", bankDtoList);
		model.addAttribute("accountDataList", bizAccountDataList);
		return "biz/accountRegister";
	}

	@RequestMapping("accountRegisterProcess")
	public String accountRegisterProcess(BizAccountDto bizAccountDto, HttpSession session) {

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		bizAccountDto.setBiz_no(bizUser.getBiz_no());

		bizService.createBizAccount(bizAccountDto);
		return "redirect:./accountRegister";
	}

	@RequestMapping("settlementList")
	public String settlementList(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> settlementDataList = bizService.getSettlementDataListByBizNo(bizUser.getBiz_no());
		List<Map<String, Object>> bizAccountDataList = bizService.getBizAccountDataListByBizNo(bizUser.getBiz_no());

		List<BankDto> bankDtoList = bizService.getAllBank();

		model.addAttribute("bankDtoList", bankDtoList);
		model.addAttribute("settlementDataList", settlementDataList);
		model.addAttribute("bizAccountDataList", bizAccountDataList);

		return "biz/settlementList";
	}

	@RequestMapping("orderManage")
	public String orderManage(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> newOrderList = bizService.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(),
				1);

		model.addAttribute("newOrderList", newOrderList);

		return "biz/orderManage";
	}

	@RequestMapping("purchaseConfirmationList")
	public String purchaseConfirmationList(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> orderList = bizService.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(),
				6);

		model.addAttribute("orderList", orderList);

		return "biz/purchaseConfirmationList";
	}

	@RequestMapping("cancelOrderManage")
	public String cancelOrderManage(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> orderList = bizService.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(),
				8);

		model.addAttribute("orderList", orderList);

		return "biz/cancelOrderManage";
	}

	@RequestMapping("exchangeOrderManage")
	public String exchangeOrderManage(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> orderList = bizService.getExchangeOrderListByBizNo(bizUser.getBiz_no());

		model.addAttribute("orderList", orderList);

		return "biz/exchangeOrderManage";
	}

	@RequestMapping("returnOrderManage")
	public String returnOrderManage(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> orderList = bizService.getNewReturnOrderListByBizNo(bizUser.getBiz_no());

		model.addAttribute("orderList", orderList);

		return "biz/returnOrderManage";
	}

	@RequestMapping("adProductRegister")
	public String adProductRegister(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<AdCategoryDto> adCategoryDtoList = bizService.getAllAdCategory();
		List<Map<String, Object>> productDataList = bizService.getProductByBizNo(bizUser.getBiz_no());

		model.addAttribute("productDataList", productDataList);
		model.addAttribute("adCategoryDtoList", adCategoryDtoList);
		return "biz/adProductRegister";
	}

	@RequestMapping("adProductList")
	public String adProductList(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> adProductDataList = bizService.getOngoingAdProductByBizNo(bizUser.getBiz_no());

		model.addAttribute("adProductDataList", adProductDataList);
		return "biz/adProductList";
	}

	@RequestMapping("productInquiryList")
	public String productInquiryList(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> productInquiryDataList = bizService
				.getNewProductInquiryListByBizNo(bizUser.getBiz_no());

		model.addAttribute("productInquiryDataList", productInquiryDataList);
		return "biz/productInquiryList";
	}

	@RequestMapping("salesSummary")
	public String salesSummary(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		return "biz/salesSummary";
	}

	@RequestMapping("salesPerformance")
	public String salesPerformance(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		Map<String, Object> salesPerformanceData = bizService.getSalesPerfomanceDataByBizNo(bizUser.getBiz_no());

		model.addAttribute("salesPerformanceData", salesPerformanceData);

		return "biz/salesPerformance";
	}

	@RequestMapping("productPerformance")
	public String productPerformance(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		Map<String, Object> productPerformanceData = bizService.getProductPerfomanceDataByBizNo(bizUser.getBiz_no());

		model.addAttribute("productPerformanceData", productPerformanceData);

		return "biz/productPerformance";
	}
	
//	@RequestMapping("productReviewList")
//	public String productReviewList(HttpSession session, Model model) {
//		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
//		List<Map<String, Object>> productReviewDataList=bizService.getProductReviewByBizNo(bizUser.getBiz_no());
//		
//		model.addAttribute("productReviewDataList", productReviewDataList);
//
//		return "biz/productPerformance";
//	}
	
	@RequestMapping("settlementListDetail")
	public String settlementListDetail(HttpSession session, Model model) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> orderList = bizService.getPurchaseConfirmOrderByBizNo(bizUser.getBiz_no());
		Map<String, Object> orderPeriod=bizService.getOrderPeriodByBizNo(bizUser.getBiz_no());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderPeriod", orderPeriod);

		return "biz/settlementListDetail";
	}
	
	@RequestMapping("productReviewList")
	public String productReviewList(HttpSession session, Model model) {
		BizDto bizUser=(BizDto) session.getAttribute("bizUser");
		
		List<Map<String,Object>> reviewList=bizService.getReviewListByBizNo(bizUser.getBiz_no());
		
		model.addAttribute("reviewList", reviewList);
		return "biz/productReviewList";
	}
	
	@RequestMapping("adProductRegisterComplete")
	public String adProductRegister() {
		return "biz/adProductRegisterComplete";
	}

}
