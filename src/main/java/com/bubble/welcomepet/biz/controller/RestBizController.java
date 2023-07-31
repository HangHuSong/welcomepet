package com.bubble.welcomepet.biz.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.biz.service.BizServiceImpl;
import com.bubble.welcomepet.dto.AdPaymentDto;
import com.bubble.welcomepet.dto.AdProductDto;
import com.bubble.welcomepet.dto.BizAccountDto;
import com.bubble.welcomepet.dto.BizDto;
import com.bubble.welcomepet.dto.CreateAdRequestDto;
import com.bubble.welcomepet.dto.MainCategoryDto;
import com.bubble.welcomepet.dto.ProductDetailImageDto;
import com.bubble.welcomepet.dto.ProductDto;
import com.bubble.welcomepet.dto.ProductInquiryReplyDto;
import com.bubble.welcomepet.dto.ProductMainImageDto;
import com.bubble.welcomepet.dto.ProductOptionDto;
import com.bubble.welcomepet.dto.ProductRegisterRequestDto;
import com.bubble.welcomepet.dto.SettlementRequestDto;
import com.bubble.welcomepet.dto.ShippingCompanyDto;
import com.bubble.welcomepet.dto.SubCategoryDto;

@RestController
@RequestMapping("/biz/*")
public class RestBizController {

	@Autowired
	private BizServiceImpl bizService;
	
	
	@RequestMapping("loginProcess")
	public Map<String,Object> loginProcess(HttpSession session, BizDto params) {
		Map<String,Object> map=new HashMap<String, Object>();
		
		BizDto bizDto = bizService.getBizByIdAndPw(params);
		if (bizDto != null) {
			session.setAttribute("bizUser", bizDto);
			map.put("result","success");
		} else {
			map.put("result","fail");
		}
		
		return map;
	}
	
	
	@RequestMapping("getBizUser")
	public Map<String,Object> getBizUser(HttpSession session) {
		Map<String,Object> map=new HashMap<String, Object>();
		
		if(session.getAttribute("bizUser")==null) {
			map.put("result", "fail");
		}else {
			BizDto bizUser=(BizDto) session.getAttribute("bizUser");
			
			map.put("result", "success");
			map.put("bizUser", bizUser);
		}
		
		
		return map;
	}
	
	
	@RequestMapping("updateAlarmChecked")
	public void updateAlarmChecked(@RequestParam("alarmNoList") int[] alarmNoList) {
		bizService.updateAlarmChecked(alarmNoList);
	}
	
	@RequestMapping("getAlarm")
	public Map<String,Object> getAlarm(HttpSession session) {
		BizDto bizUser=(BizDto) session.getAttribute("bizUser");
		Map<String, Object> response=bizService.getAlarmData(bizUser.getBiz_no());
		
		return response;
	}
	
	@RequestMapping("kakaoLoginProcess")
	public void kakaoLoginProcess(BizDto kakaoLoginUser, HttpSession session ) {
		
		BizDto bizDto=bizService.getBizByIdAndEmail(kakaoLoginUser);
		session.setAttribute("bizUser", bizDto);
		System.out.println(bizDto);
	}
	
	@RequestMapping("getSubCategoryListByMainCategoryNo")
	public Map<String, Object> getSubCategoryListByMainNo(int main_category_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<SubCategoryDto> subCategoryList = bizService.getSubCategoryListByMainCategoryNo(main_category_no);
		map.put("subCategoryList", subCategoryList);
		return map;
	}

	@RequestMapping("getProductDataByNo")
	public Map<String, Object> getProductDataByNo(int product_no) {
		Map<String, Object> map = bizService.getProductByNo(product_no);
		return map;
	}

	@RequestMapping("getMainCategoryList")
	public Map<String, Object> getMainCategoryList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MainCategoryDto> mainCategoryList = bizService.getMainCategoryList();

		map.put("mainCategoryList", mainCategoryList);

		return map;
	}

	@RequestMapping("updateProductSubCategory")
	public void updateProductSubCategory(ProductDto productDto) {

		bizService.updateProductSubCategory(productDto);
	}

	@RequestMapping("updatProductName")
	public void updatProductName(ProductDto productDto) {
		bizService.updateProductName(productDto);
	}

	@RequestMapping("updatProductDescription")
	public void updatProductDescription(ProductDto productDto) {
		bizService.updatProductDescription(productDto);
	}

	@RequestMapping("updateProductDiscount")
	public void updateProductDiscount(ProductDto productDto) {
		bizService.updateProductDiscount(productDto);
	}

	@RequestMapping("updateProductShippingPrice")
	public void updateProductShippingPrice(ProductDto productDto) {
		bizService.updateProductShippingPrice(productDto);
	}

	@RequestMapping("updateProductPrice")
	public void updateProductPrice(ProductDto productDto) {
		bizService.updateProductPrice(productDto);
	}

	@RequestMapping("updateOptionName")
	public void updateOptionName(ProductOptionDto productOptionDto) {
		bizService.updateOptionName(productOptionDto);
	}

	@RequestMapping("updateOptionPrice")
	public void updateOptionPrice(ProductOptionDto productOptionDto) {
		bizService.updateOptionPrice(productOptionDto);
	}

	@RequestMapping("updateOptionStock")
	public void updateOptionStock(ProductOptionDto productOptionDto) {
		bizService.updateOptionStock(productOptionDto);
	}

	@RequestMapping("requestSettlementProcess")
	public Map<String, Object> requestSettlementProcess(SettlementRequestDto settlementRequestDto) {

		return bizService.createSettleRequestAndReturnAccount(settlementRequestDto);
	}

	@RequestMapping("registerAccount")
	public Map<String, Object> registerAccount(BizAccountDto bizAccountDto, HttpSession session) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		bizAccountDto.setBiz_no(bizUser.getBiz_no());

		return bizService.createBizAccountAndReturnMap(bizAccountDto);
	}

	@RequestMapping("requestBizApproval")
	public void requestBizApproval(HttpSession session, MultipartFile document, String biz_approval_request_brn) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		bizService.requestBizApproval(bizUser, document, biz_approval_request_brn);
	}

	@RequestMapping("registerShopInform")
	public void registerShopInform(HttpSession session, MultipartFile main_img, BizDto bizDto) {
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		bizDto.setBiz_no(bizUser.getBiz_no());

		bizService.registerBizShopInform(main_img, bizDto);
	}

	@RequestMapping("deleteThumbnail")
	public void deleteThumbnailProcess(int product_no) {
		bizService.deleteThumbnailImg(product_no);
	}

	@RequestMapping("saveThumbnail")
	public Map<String, Object> saveThumbnail(int product_no, MultipartFile thumbnail) {
		Map<String, Object> map = new HashMap<String, Object>();

		ProductDto productDto = bizService.saveThumbnail(product_no, thumbnail);

		map.put("productDto", productDto);

		return map;
	}

	@RequestMapping("deleteMainImage")
	public void deleteMainImage(int product_main_image_no) {
		bizService.deleteMainImage(product_main_image_no);
	}

	@RequestMapping("saveMainImage")
	public Map<String, Object> saveMainImage(int product_no, @RequestParam("mainImages[]") MultipartFile[] mainImages) {
		System.out.println(mainImages[0].getOriginalFilename());
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductMainImageDto> productMainImageDtoList = bizService.saveMainImages(product_no, mainImages);

		map.put("productMainImageDtoList", productMainImageDtoList);

		return map;
	}

	@RequestMapping("deleteDetailImage")
	public void deleteDetailImage(int product_detail_image_no) {
		bizService.deleteDetailImage(product_detail_image_no);
	}

	@RequestMapping("saveDetailImage")
	public Map<String, Object> saveDetailImage(int product_no,
			@RequestParam("detailImages[]") MultipartFile[] detailImages) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductDetailImageDto> productDetailImageDtoList = bizService.saveDetailImages(product_no, detailImages);

		map.put("productDetailImageDtoList", productDetailImageDtoList);

		return map;
	}

	@RequestMapping("getNewOrder")
	public Map<String, Object> getNewOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");

		List<Map<String, Object>> newOrderList = bizService.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(),
				1);
		map.put("orderList", newOrderList);

		return map;
	}

	@RequestMapping("getPrepareShippingOrder")
	public Map<String, Object> getPrepareShippingOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> preparingOrderList = bizService
				.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(), 3);

		map.put("preparingOrderList", preparingOrderList);
		
		List<ShippingCompanyDto> shippingCompanyDtoList = bizService.getAllShippingCompany();

		map.put("shippingCompanyDtoList", shippingCompanyDtoList);
		
		return map;
	}
	
	@RequestMapping("getInShippingOrder")
	public Map<String, Object> getInShippingOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> inShippingOrderList = bizService
				.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(), 4);
		
		map.put("orderList", inShippingOrderList);
		
		return map;
	}
	
	
	@RequestMapping("getCompleteShippingOrder")
	public Map<String, Object> getCompleteShippingOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> inShippingOrderList = bizService
				.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(), 5);
		
		map.put("orderList", inShippingOrderList);
		
		return map;
	}
	
	
	@RequestMapping("getNewCancelOrder")
	public Map<String, Object> getNewCancelOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> newCancelOrderList = bizService
				.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(), 8);
		
		map.put("orderList", newCancelOrderList);
		
		return map;
	}
	
	
	@RequestMapping("getCompleteCancelOrder")
	public Map<String, Object> getCompleteCancelOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> cancelCompleteOrderList = bizService
				.getOrderListByBizNoAndOrderStatusNo(bizUser.getBiz_no(), 2);
		
		map.put("orderList", cancelCompleteOrderList);
		
		return map;
	}
	
	@RequestMapping("getNewReturnOrder")
	public Map<String, Object> getNewReturnOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> newReturnOrderList = bizService
				.getNewReturnOrderListByBizNo(bizUser.getBiz_no());
		
		map.put("orderList", newReturnOrderList);
		
		return map;
	}
	
	
	@RequestMapping("getCompleteReturnOrder")
	public Map<String, Object> getCompleteReturnOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> completeReturnOrderList = bizService
				.getCompleteReturnOrderListByBizNo(bizUser.getBiz_no());
		
		map.put("orderList", completeReturnOrderList);
		
		return map;
	}
	
	@RequestMapping("getNewExchangeOrder")
	public Map<String, Object> getExchangeOrder(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> exchangeOrderList = bizService
				.getExchangeOrderListByBizNo(bizUser.getBiz_no());
		
		map.put("orderList", exchangeOrderList);
		
		return map;
	}
	
	@RequestMapping("changeOrderStatusTo3")
	public void changeOrderStatusTo3(@RequestParam("orderProductNoList") int[] orderProductNoList) {

		bizService.updateOrderStatusNoByNo(orderProductNoList, 3);

	}
	
	@RequestMapping("changeOrderStatusTo2")
	public void changeOrderStatusTo2(@RequestParam("orderProductNoList") int[] orderProductNoList) {

		bizService.updateOrderStatusNoByNo(orderProductNoList, 2);

	}
	
	@RequestMapping("changeOrderStatusTo7")
	public void changeOrderStatusTo8(@RequestParam("orderProductNoList") int[] orderProductNoList) {

		bizService.updateOrderStatusNoByNo(orderProductNoList, 7);

	}

	@RequestMapping("changeOrderStatusTo4AndCreateShipping")
	public void changeOrderStatusTo4AndCreateShipping(
			@RequestParam("orderProductNoList") int[] orderProductNoList,
			@RequestParam("shippingCompanyList") int[] shippingCompanyList,
			@RequestParam("shippingTrackingNumList") String[] shippingTrackingNumList) {

		
		bizService.updateOrderStatusNoByNo(orderProductNoList, 4);
		bizService.createShipping(orderProductNoList, shippingCompanyList, shippingTrackingNumList);

	}
	
	@RequestMapping("createAdPayment")
	public void createAdPayment(@RequestBody CreateAdRequestDto createAdRequestDto) {
		System.out.println(createAdRequestDto.toString());
		
		AdPaymentDto adPaymentDto=createAdRequestDto.getAdPaymentDto();
		adPaymentDto.setAd_category_no(1);
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		try {
			adPaymentDto.setAd_payment_approved_date(sdf2.parse(createAdRequestDto.getAdPaymentApprovedDate()));
			adPaymentDto.setAd_payment_created_date(sdf2.parse(createAdRequestDto.getAdPaymentCreatedDate()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("===========adProductDtoList==============");
		System.out.println(createAdRequestDto.getAdProductDtoList().toString());
		bizService.createAdPaymentAndAdProduct(adPaymentDto,createAdRequestDto.getAdProductDtoList());

		
	}
	
	
	@RequestMapping("registerInquiryReply")
	public void registerInquiryReply(ProductInquiryReplyDto productInquiryReplyDto) {
		bizService.registerInquiryReply(productInquiryReplyDto);
	}
	
	@RequestMapping("getNewInquiry")
	public Map<String, Object> getNewInquiry(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		
		List<Map<String, Object>> newInquiryList=bizService.getNewProductInquiryListByBizNo(bizUser.getBiz_no());
		map.put("inquiryList", newInquiryList);
		
		return map;
	}
	
	
	@RequestMapping("getCompleteInquiry")
	public Map<String, Object> getCompleteInquiry(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		
		List<Map<String, Object>> completeInquiryList=bizService.getCompleteProductInquiryListByBizNo(bizUser.getBiz_no());
		map.put("inquiryList", completeInquiryList);
		
		return map;
	}
	
	
	@RequestMapping("getSettlementProductListByDate")
	public Map<String, Object> getSettlementProductListByDate(HttpSession session,int year,int month) {
		Map<String, Object> map = new HashMap<String, Object>();
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		
		List<Map<String, Object>> orderList=bizService.getSettlementProductListByDateAndBizNo(bizUser.getBiz_no(),year,month);
		Map<String, Object> salesData=bizService.getSalesByBizNoAndDate(bizUser.getBiz_no(),year,month);
		map.put("orderList", orderList);
		map.put("salesData", salesData);
		return map;
	}
	
	@RequestMapping("getReviewListByDate")
	public Map<String,Object> getReviewListByDate(HttpSession session,String start_date,String end_date) {
		Map<String,Object> map=new HashMap<String, Object>();
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		
		
		List<Map<String, Object>> reviewList=bizService.getReviewListByDateAndBizNo(bizUser.getBiz_no(),start_date,end_date);
		
		map.put("reviewList", reviewList);
		return map;
	}
	
	@RequestMapping("getOngoingAd")
	public Map<String, Object> getOngoingAd(HttpSession session) {
		Map<String,Object> map=new HashMap<String, Object>();
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> adProductDataList = bizService.getOngoingAdProductByBizNo(bizUser.getBiz_no());

		map.put("adProductDataList", adProductDataList);
		return map;
	}
	
	@RequestMapping("getUpcomingAd")
	public Map<String, Object> getUpcomingAd(HttpSession session) {
		Map<String,Object> map=new HashMap<String, Object>();
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> adProductDataList = bizService.getUpcomingAdProductByBizNo(bizUser.getBiz_no());

		map.put("adProductDataList", adProductDataList);
		return map;
	}
	
	@RequestMapping("getExpiredAd")
	public Map<String, Object> getExpiredAd(HttpSession session) {
		Map<String,Object> map=new HashMap<String, Object>();
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> adProductDataList = bizService.getExpiredAdProductByBizNo(bizUser.getBiz_no());

		map.put("adProductDataList", adProductDataList);
		return map;
	}
	
	
	@RequestMapping("getNewSettlement")
	public Map<String,Object> getNewSettlement(HttpSession session) {
		Map<String,Object> map=new HashMap<String, Object>();
		BizDto bizUser = (BizDto) session.getAttribute("bizUser");
		List<Map<String, Object>> settlementList = bizService.getNewSettlementByBizNo(bizUser.getBiz_no());
		
		
		map.put("settlementList", settlementList);
		return map;
	}
//	@RequestMapping("productRegisterRequest")
//	public void productRegisterRequest(@RequestBody ProductRegisterRequestDto productRegisterRequest) {
//		System.out.println(productRegisterRequest);
//		
//	}
//	
//	@RequestMapping("productImagesRegister")
//	public void productImagesRegister(@RequestParam("thumbnail") MultipartFile thumbnail,@RequestParam("main_images[]") MultipartFile[] main_images,@RequestParam("detail_images[]") MultipartFile[] detail_images) {
//		System.out.println(thumbnail.getOriginalFilename());
//	}
}
