package com.bubble.welcomepet.biz.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.account.mapper.BizAccountSqlMapper;
import com.bubble.welcomepet.ad.mapper.AdSqlMapper;
import com.bubble.welcomepet.dto.AdCategoryDto;
import com.bubble.welcomepet.dto.AdPaymentDto;
import com.bubble.welcomepet.dto.AdProductDto;
import com.bubble.welcomepet.dto.BankDto;
import com.bubble.welcomepet.dto.BizAccountDto;
import com.bubble.welcomepet.biz.mapper.BizSqlMapper;
import com.bubble.welcomepet.customer.mapper.CustomerSqlMapper;
import com.bubble.welcomepet.dto.BizApprovalDto;
import com.bubble.welcomepet.dto.BizApprovalRequestDto;
import com.bubble.welcomepet.dto.BizDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.ExchangeDto;
import com.bubble.welcomepet.dto.MainCategoryDto;
import com.bubble.welcomepet.dto.OrderAlarmDto;
import com.bubble.welcomepet.dto.OrderProductDto;
import com.bubble.welcomepet.dto.OrderProductStatusDto;
import com.bubble.welcomepet.dto.OrdersDto;
import com.bubble.welcomepet.dto.ProductDetailImageDto;
import com.bubble.welcomepet.dto.ProductDto;
import com.bubble.welcomepet.dto.ProductInquiryDto;
import com.bubble.welcomepet.dto.ProductInquiryReplyDto;
import com.bubble.welcomepet.dto.ProductMainImageDto;
import com.bubble.welcomepet.dto.ProductOptionDto;
import com.bubble.welcomepet.dto.ProductReviewDto;
import com.bubble.welcomepet.dto.ProductReviewImagesDto;
import com.bubble.welcomepet.dto.ReturnDto;
import com.bubble.welcomepet.dto.ReturnExchangeReasonDto;
import com.bubble.welcomepet.dto.SettlementProcessDto;
import com.bubble.welcomepet.dto.SettlementRequestDto;
import com.bubble.welcomepet.dto.ShippingCompanyDto;
import com.bubble.welcomepet.dto.ShippingDto;
import com.bubble.welcomepet.dto.StatementDto;
import com.bubble.welcomepet.dto.SubCategoryDto;
import com.bubble.welcomepet.order.mapper.OrderSqlMapper;
import com.bubble.welcomepet.product.mapper.ProductSqlMapper;
import com.bubble.welcomepet.settlement.mapper.SettlementSqlMapper;
import com.bubble.welcomepet.shipping.mapper.ShippingSqlMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import oracle.net.aso.m;

@Service
public class BizServiceImpl {

	@Autowired
	private BizSqlMapper bizSqlMapper;
	@Autowired
	private ProductSqlMapper productSqlMapper;
	@Autowired
	private BizAccountSqlMapper accountSqlMapper;
	@Autowired
	private SettlementSqlMapper settlementSqlMapper;
	@Autowired
	private OrderSqlMapper orderSqlMapper;
	@Autowired
	private ShippingSqlMapper shippingSqlMapper;
	@Autowired
	private AdSqlMapper adSqlMapper;
	@Autowired
	private CustomerSqlMapper customerSqlMapper;

	public void createBiz(BizDto bizDto) {
		int biz_no = bizSqlMapper.createBizNo();
		bizDto.setBiz_no(biz_no);
		bizDto.setBiz_status_no(1);

		bizSqlMapper.createBiz(bizDto);

	}

	public BizDto getBizByIdAndPw(BizDto bizDto) {
		return bizSqlMapper.getBizByIdAndPw(bizDto);
	}

	public List<Map<String, Object>> getProductByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<ProductDto> productDtoList = productSqlMapper.getProductByBizNo(biz_no);
		for (ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			List<ProductOptionDto> productOptionDtoList = productSqlMapper
					.getProductOptionByProductNo(productDto.getProduct_no());
			SubCategoryDto subCategoryDto = productSqlMapper.getSubCategoryByNo(productDto.getSub_category_no());
			MainCategoryDto mainCategoryDto = productSqlMapper
					.getMainCategoryByNo(subCategoryDto.getMain_category_no());
			int productOptionNum=productOptionDtoList.size();
			
			map.put("productOptionNum", productOptionNum);
			map.put("productDto", productDto);
			map.put("productOptionDtoList", productOptionDtoList);
			map.put("subCategoryDto", subCategoryDto);
			map.put("mainCategoryDto", mainCategoryDto);

			list.add(map);
		}

		return list;
	}

	public Map<String, Object> getProductByNo(int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		ProductDto productDto = productSqlMapper.getProductByNo(product_no);
		List<ProductOptionDto> productOptionDtoList = productSqlMapper
				.getProductOptionByProductNo(productDto.getProduct_no());
		SubCategoryDto subCategoryDto = productSqlMapper.getSubCategoryByNo(productDto.getSub_category_no());
		MainCategoryDto mainCategoryDto = productSqlMapper.getMainCategoryByNo(subCategoryDto.getMain_category_no());
		List<ProductMainImageDto> productMainImageDtoList = productSqlMapper
				.getMainImageByProductNo(productDto.getProduct_no());
		List<ProductDetailImageDto> productDetailImageDtoList = productSqlMapper
				.getDetailImageByProductNo(productDto.getProduct_no());
		int productOptionNum = productSqlMapper.countProductOptionByProductNo(productDto.getProduct_no());

		String product_description = productDto.getProduct_description();
		product_description = StringEscapeUtils.escapeHtml4(product_description);
		product_description = product_description.replaceAll("\n", "<br>");
		productDto.setProduct_description(product_description);

		map.put("productDto", productDto);
		map.put("productOptionNum", productOptionNum);
		map.put("productOptionDtoList", productOptionDtoList);
		map.put("subCategoryDto", subCategoryDto);
		map.put("mainCategoryDto", mainCategoryDto);
		map.put("productMainImageDtoList", productMainImageDtoList);
		map.put("productDetailImageDtoList", productDetailImageDtoList);

		return map;
	}

	public List<MainCategoryDto> getMainCategoryList() {

		return productSqlMapper.getAllMainCategory();
	}

	public List<SubCategoryDto> getSubCategoryListByMainCategoryNo(int main_category_no) {
		return productSqlMapper.getSubCategoryByMainCategoryNo(main_category_no);
	}

	public void createProduct(ProductDto productDto, List<ProductOptionDto> productOptionDtoList,
			MultipartFile thumbnail, MultipartFile[] main_images, MultipartFile[] detail_images) {

		int productPk = productSqlMapper.createProductPk();
		productDto.setProduct_no(productPk);

		if (thumbnail != null) {
			String rootThumbnailFileFolder = "C:/uploadFiles/productThumbnailImg/";// 썸네일
			String thumbnailImgName = SaveFile(rootThumbnailFileFolder, thumbnail);
			productDto.setProduct_thumbnail(thumbnailImgName);

		}
		if (main_images != null) {
			String rootMainImgFileFolder = "C:/uploadFiles/productMainImg/";// 메인이미지
			for (MultipartFile main_image : main_images) {
				ProductMainImageDto productMainImageDto = new ProductMainImageDto();
				int productMainImagePk = productSqlMapper.createProductMainImagePk();
				productMainImageDto.setProduct_main_image_no(productMainImagePk);

				String mainImgName = SaveFile(rootMainImgFileFolder, main_image);

				productMainImageDto.setProduct_no(productPk);
				productMainImageDto.setProduct_main_image_link(mainImgName);
				productSqlMapper.createMainImg(productMainImageDto);

			}
		}
		if (detail_images != null) {

			String rootDetailImgFileFolder = "C:/uploadFiles/productDetailImg/";// 상세이미지
			for (MultipartFile detail_image : detail_images) {
				ProductDetailImageDto productDetailImageDto = new ProductDetailImageDto();
				int productDetailImagePk = productSqlMapper.createProductDetailImagePk();
				productDetailImageDto.setProduct_detail_image_no(productDetailImagePk);

				String detailImgName = SaveFile(rootDetailImgFileFolder, detail_image);

				productDetailImageDto.setProduct_no(productPk);
				productDetailImageDto.setProduct_detail_image_link(detailImgName);
				productSqlMapper.createDetailImg(productDetailImageDto);
			}
		}

		productSqlMapper.createProduct(productDto);

		if (productOptionDtoList != null) {

			for (ProductOptionDto productOptionDto : productOptionDtoList) {

				productOptionDto.setProduct_no(productPk);
				productSqlMapper.createProductOption(productOptionDto);

			}
		}

	}

	public String SaveFile(String rootFolder, MultipartFile file) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String today = sdf.format(new Date());

		File targetFolder = new File(rootFolder + today);
		if (!targetFolder.exists()) {
			targetFolder.mkdirs();
		}

		String originalFileName = file.getOriginalFilename();
		String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."));

		String randomName = UUID.randomUUID().toString();
		randomName += "_" + System.currentTimeMillis();
		String fileName = today + "/" + randomName + fileExt;

		try {
			file.transferTo(new File(rootFolder + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}

	public void updateProductSubCategory(ProductDto productDto) {
		productSqlMapper.updateProductSubCategory(productDto);

	}

	public void updateProductName(ProductDto productDto) {
		productSqlMapper.updateProductName(productDto);

	}

	public void updatProductDescription(ProductDto productDto) {
		productSqlMapper.updatProductDescription(productDto);
	}

	public void updateProductDiscount(ProductDto productDto) {
		productSqlMapper.updateProductDiscount(productDto);
	}

	public void updateProductShippingPrice(ProductDto productDto) {
		productSqlMapper.updateProductShippingPrice(productDto);
	}

	public void updateProductPrice(ProductDto productDto) {
		productSqlMapper.updateProductPrice(productDto);
	}

	public void updateProductStock(ProductDto productDto) {
		productSqlMapper.updateProductStock(productDto);

	}

	public void updateOptionName(ProductOptionDto productOptionDto) {
		productSqlMapper.updateOptionName(productOptionDto);

	}

	public void updateOptionPrice(ProductOptionDto productOptionDto) {
		productSqlMapper.updateOptionPrice(productOptionDto);

	}

	public void updateOptionStock(ProductOptionDto productOptionDto) {
		productSqlMapper.updateOptionStock(productOptionDto);

	}

	public List<BankDto> getAllBank() {
		return accountSqlMapper.getAllBank();
	}

	public void createBizAccount(BizAccountDto bizAccountDto) {
		int bizAccountPk = accountSqlMapper.createBizAccountPk();
		bizAccountDto.setBiz_account_no(bizAccountPk);
		accountSqlMapper.createBizAccount(bizAccountDto);

	}

	public Map<String, Object> createSettleRequestAndReturnAccount(SettlementRequestDto settlementRequestDto) {
		Map<String, Object> map = new HashMap<String, Object>();

		int settlementPk = settlementSqlMapper.createSettlementPk();
		settlementRequestDto.setSettlement_request_no(settlementPk);
		settlementSqlMapper.createSettlementRequest(settlementRequestDto);

		BizAccountDto bizAccountDto = accountSqlMapper.getBizAccountByNo(settlementRequestDto.getBiz_account_no());
		BankDto bankDto = accountSqlMapper.getBankByNo(bizAccountDto.getBank_no());

		map.put("bizAccountDto", bizAccountDto);
		map.put("bankDto", bankDto);
		return map;
	}

	public List<Map<String, Object>> getSettlementDataListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<StatementDto> statementDtoList = settlementSqlMapper.getStatementListByBizNo(biz_no);
		for (StatementDto statementDto : statementDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("statementDto", statementDto);

			SettlementRequestDto settlementRequestDto = settlementSqlMapper
					.getSettlementRequestByStatementNo(statementDto.getStatement_no());
			if (settlementRequestDto == null) {
				map.put("settlementStatus", "정산미요청");

			} else {
				SettlementProcessDto settlementProcessDto = settlementSqlMapper
						.getSettlememtProcessBySettlementRequestNo(settlementRequestDto.getSettlement_request_no());
				BizAccountDto bizAccountDto = accountSqlMapper
						.getBizAccountByNo(settlementRequestDto.getBiz_account_no());
				if(bizAccountDto != null) {
					BankDto bankDto = accountSqlMapper.getBankByNo(bizAccountDto.getBank_no());

					map.put("bizAccountDto", bizAccountDto);
					map.put("bankDto", bankDto);
				}
				
				if (settlementProcessDto == null) {
					map.put("settlementStatus", "정산대기");
				} else {
					map.put("settlementStatus", "정산완료");
				}
			}
			list.add(map);
		}

		return list;
	}

	public List<Map<String, Object>> getBizAccountDataListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<BizAccountDto> bizAccountDtoList = accountSqlMapper.getBizAccountByBizNo(biz_no);

		for (BizAccountDto bizAccountDto : bizAccountDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			BankDto bankDto = accountSqlMapper.getBankByNo(bizAccountDto.getBank_no());
			map.put("bizAccountDto", bizAccountDto);
			map.put("bankDto", bankDto);

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				String jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}
		return list;
	}

	public Map<String, Object> createBizAccountAndReturnMap(BizAccountDto bizAccountDto) {
		Map<String, Object> map = new HashMap<String, Object>();

		int bizAccountPk = accountSqlMapper.createBizAccountPk();
		bizAccountDto.setBiz_account_no(bizAccountPk);
		accountSqlMapper.createBizAccount(bizAccountDto);

		BankDto bankDto = accountSqlMapper.getBankByNo(bizAccountDto.getBank_no());

		map.put("bizAccountDto", bizAccountDto);
		map.put("bankDto", bankDto);
		return map;
	}

	public BizApprovalRequestDto getBizApprovalRequestByBizNo(int biz_no) {
		return bizSqlMapper.getBizApprovalRequestByBizNo(biz_no);
	}

	public BizApprovalDto getBizApprovalByRequestNo(int biz_approval_request_no) {
		return bizSqlMapper.getBizApprovalByRequestNo(biz_approval_request_no);
	}

	public void requestBizApproval(BizDto bizDto, MultipartFile document, String biz_approval_request_brn) {
		String documentRootFolder = "C:/uploadFiles/bizDocument/";
		String biz_approval_request_document = SaveFile(documentRootFolder, document);

		BizApprovalRequestDto bizApprovalRequestDto = new BizApprovalRequestDto();
		bizApprovalRequestDto.setBiz_no(bizDto.getBiz_no());
		bizApprovalRequestDto.setBiz_approval_request_document(biz_approval_request_document);
		bizApprovalRequestDto.setBiz_approval_request_brn(biz_approval_request_brn);

		bizSqlMapper.createBizApprovalRequest(bizApprovalRequestDto);

		bizDto.setBiz_status_no(2);
		bizSqlMapper.updateBizStatusFromBiz(bizDto);
	}

	public void registerBizShopInform(MultipartFile main_img, BizDto bizDto) {

		if (main_img != null) {

			String rootBizMainImgFolder = "C:/uploadFiles/bizMainImg/";
			String bizMainImgFileName = SaveFile(rootBizMainImgFolder, main_img);

			bizDto.setBiz_store_main_img(bizMainImgFileName);
		}

		bizSqlMapper.updateBizShopInformFromBiz(bizDto);

		bizDto.setBiz_status_no(4);
		bizSqlMapper.updateBizStatusFromBiz(bizDto);
	}

	public void deleteThumbnailImg(int product_no) {
		productSqlMapper.deleteThumbnailImg(product_no);

	}

	public ProductDto saveThumbnail(int product_no, MultipartFile thumbnail) {
		ProductDto productDto = new ProductDto();
		if (thumbnail != null) {
			String rootThumbnailFileFolder = "C:/uploadFiles/productThumbnailImg/";// 썸네일
			String thumbnailImgName = SaveFile(rootThumbnailFileFolder, thumbnail);

			productDto.setProduct_no(product_no);
			productDto.setProduct_thumbnail(thumbnailImgName);

			productSqlMapper.updateProductThumbnail(productDto);

		}
		return productDto;
	}

	public void deleteMainImage(int product_main_image_no) {
		productSqlMapper.deleteMainImage(product_main_image_no);
	}

	public List<ProductMainImageDto> saveMainImages(int product_no, MultipartFile[] mainImages) {
		List<ProductMainImageDto> productMainImageDtoList = new ArrayList<ProductMainImageDto>();

		if (mainImages != null) {
			String rootMainImgFileFolder = "C:/uploadFiles/productMainImg/";// 메인이미지
			for (MultipartFile main_image : mainImages) {
				ProductMainImageDto productMainImageDto = new ProductMainImageDto();
				int productMainImagePk = productSqlMapper.createProductMainImagePk();
				productMainImageDto.setProduct_main_image_no(productMainImagePk);

				String mainImgName = SaveFile(rootMainImgFileFolder, main_image);

				productMainImageDto.setProduct_no(product_no);
				productMainImageDto.setProduct_main_image_link(mainImgName);
				productSqlMapper.createMainImg(productMainImageDto);

				productMainImageDtoList.add(productMainImageDto);
			}
		}

		return productMainImageDtoList;
	}

	public void deleteDetailImage(int product_detail_image_no) {
		productSqlMapper.deleteDetailImage(product_detail_image_no);
	}

	public List<ProductDetailImageDto> saveDetailImages(int product_no, MultipartFile[] detailImages) {
		List<ProductDetailImageDto> productDetailImageDtoList = new ArrayList<ProductDetailImageDto>();

		if (detailImages != null) {

			String rootDetailImgFileFolder = "C:/uploadFiles/productDetailImg/";// 상세이미지
			for (MultipartFile detail_image : detailImages) {
				ProductDetailImageDto productDetailImageDto = new ProductDetailImageDto();

				int productDetailImagePk = productSqlMapper.createProductDetailImagePk();
				productDetailImageDto.setProduct_no(product_no);

				String detailImgName = SaveFile(rootDetailImgFileFolder, detail_image);

				productDetailImageDto.setProduct_detail_image_link(detailImgName);
				productDetailImageDto.setProduct_detail_image_no(productDetailImagePk);

				productSqlMapper.createDetailImg(productDetailImageDto);

				productDetailImageDtoList.add(productDetailImageDto);
			}
		}
		return productDetailImageDtoList;
	}

	public List<Map<String, Object>> getOrderListByBizNoAndOrderStatusNo(int biz_no, int order_product_status_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<OrderProductDto> orderProductDtoList = orderSqlMapper.getOrderProductByBizNoAndStatusNo(biz_no,
				order_product_status_no);
		for (OrderProductDto orderProductDto : orderProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			OrdersDto ordersDto = orderSqlMapper.getOrderByNo(orderProductDto.getOrders_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(ordersDto.getCustomer_no());
			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(orderProductDto.getProduct_option_no());
			int productOptionNum = productSqlMapper.countProductOptionByProductNo(productOptionDto.getProduct_no());
			ProductDto productDto = productSqlMapper.getProductByNo(productOptionDto.getProduct_no());
			OrderProductStatusDto orderProductStatusDto = orderSqlMapper
					.getOrderStatusByNo(orderProductDto.getOrder_product_status_no());

			int shippingNum = shippingSqlMapper.countShippingByOrderProductNo(orderProductDto.getOrder_product_no());
			if (shippingNum >= 1) {
				ShippingDto shippingDto = shippingSqlMapper
						.getShippingByOrderProductNo(orderProductDto.getOrder_product_no());
				ShippingCompanyDto shippingCompanyDto = shippingSqlMapper
						.getShippingCompanyByNo(shippingDto.getShipping_company_no());

				map.put("shippingDto", shippingDto);
				map.put("shippingCompanyDto", shippingCompanyDto);
			}

			map.put("shippingNum", shippingNum);
			map.put("orderProductStatusDto", orderProductStatusDto);
			map.put("productDto", productDto);
			map.put("orderProductDto", orderProductDto);
			map.put("ordersDto", ordersDto);
			map.put("customerDto", customerDto);
			map.put("productOptionDto", productOptionDto);
			map.put("productOptionNum", productOptionNum);

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonData;
			try {
				jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}

		return list;
	}

	public List<ShippingCompanyDto> getAllShippingCompany() {

		return shippingSqlMapper.getAllShippingCompany();
	}

	public void updateOrderStatusNoByNo(int[] order_product_numbers, int order_status_no) {
		for (int order_product_no : order_product_numbers) {
			OrderProductDto orderProductDto = new OrderProductDto();
			orderProductDto.setOrder_product_no(order_product_no);
			orderProductDto.setOrder_product_status_no(order_status_no);

			orderSqlMapper.updateOrderStatusNoByNo(orderProductDto);
		}
	}

	public void createShipping(int[] orderProductNoList, int[] shippingCompanyList, String[] shippingTrackingNumList) {
		for (int i = 0; i < orderProductNoList.length; i++) {
			ShippingDto shippingDto = new ShippingDto();
			shippingDto.setOrder_product_no(orderProductNoList[i]);
			shippingDto.setShipping_company_no(shippingCompanyList[i]);
			shippingDto.setShipping_tracking_no(shippingTrackingNumList[i]);

			shippingSqlMapper.createShipping(shippingDto);
		}
	}

	public List<Map<String, Object>> getExchangeOrderListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<OrderProductDto> orderProductDtoList = orderSqlMapper.getOrderProductByBizNoAndStatusNo(biz_no, 9);
		for (OrderProductDto orderProductDto : orderProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			OrdersDto ordersDto = orderSqlMapper.getOrderByNo(orderProductDto.getOrders_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(ordersDto.getCustomer_no());
			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(orderProductDto.getProduct_option_no());
			ExchangeDto exchangeDto = orderSqlMapper.getExchangeByOrderProductNo(orderProductDto.getOrder_product_no());
			ReturnExchangeReasonDto returnExchangeReasonDto = orderSqlMapper
					.getReturnExchangeReasonByNo(exchangeDto.getReturn_exchange_reason_no());
			int productOptionNum = productSqlMapper.countProductOptionByProductNo(productOptionDto.getProduct_no());
			ProductDto productDto = productSqlMapper.getProductByNo(productOptionDto.getProduct_no());
			OrderProductStatusDto orderProductStatusDto = orderSqlMapper
					.getOrderStatusByNo(orderProductDto.getOrder_product_status_no());

			int shippingNum = shippingSqlMapper.countShippingByOrderProductNo(orderProductDto.getOrder_product_no());
			if (shippingNum >= 1) {
				ShippingDto shippingDto = shippingSqlMapper
						.getShippingByOrderProductNo(orderProductDto.getOrder_product_no());
				ShippingCompanyDto shippingCompanyDto = shippingSqlMapper
						.getShippingCompanyByNo(shippingDto.getShipping_company_no());

				map.put("shippingDto", shippingDto);
				map.put("shippingCompanyDto", shippingCompanyDto);
			}

			map.put("shippingNum", shippingNum);
			map.put("orderProductStatusDto", orderProductStatusDto);
			map.put("productDto", productDto);
			map.put("orderProductDto", orderProductDto);
			map.put("ordersDto", ordersDto);
			map.put("customerDto", customerDto);
			map.put("productOptionDto", productOptionDto);
			map.put("productOptionNum", productOptionNum);
			map.put("exchangeDto", exchangeDto);
			map.put("returnExchangeReasonDto", returnExchangeReasonDto);

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonData;
			try {
				jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);

		}

		return list;

	}

	public List<Map<String, Object>> getNewReturnOrderListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<OrderProductDto> orderProductDtoList = orderSqlMapper.getOrderProductByBizNoAndStatusNo(biz_no, 10);
		for (OrderProductDto orderProductDto : orderProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			OrdersDto ordersDto = orderSqlMapper.getOrderByNo(orderProductDto.getOrders_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(ordersDto.getCustomer_no());
			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(orderProductDto.getProduct_option_no());
			ReturnDto returnDto = orderSqlMapper.getReturnByOrderProductNo(orderProductDto.getOrder_product_no());
			ReturnExchangeReasonDto returnExchangeReasonDto = orderSqlMapper
					.getReturnExchangeReasonByNo(returnDto.getReturn_exchange_reason_no());
			int productOptionNum = productSqlMapper.countProductOptionByProductNo(productOptionDto.getProduct_no());
			ProductDto productDto = productSqlMapper.getProductByNo(productOptionDto.getProduct_no());
			OrderProductStatusDto orderProductStatusDto = orderSqlMapper
					.getOrderStatusByNo(orderProductDto.getOrder_product_status_no());

			int shippingNum = shippingSqlMapper.countShippingByOrderProductNo(orderProductDto.getOrder_product_no());
			if (shippingNum >= 1) {
				ShippingDto shippingDto = shippingSqlMapper
						.getShippingByOrderProductNo(orderProductDto.getOrder_product_no());
				ShippingCompanyDto shippingCompanyDto = shippingSqlMapper
						.getShippingCompanyByNo(shippingDto.getShipping_company_no());

				map.put("shippingDto", shippingDto);
				map.put("shippingCompanyDto", shippingCompanyDto);
			}

			map.put("shippingNum", shippingNum);
			map.put("orderProductStatusDto", orderProductStatusDto);
			map.put("productDto", productDto);
			map.put("productOptionNum", productOptionNum);
			map.put("returnExchangeReasonDto", returnExchangeReasonDto);
			map.put("returnDto", returnDto);
			map.put("returnExchangeReasonDto", returnExchangeReasonDto);
			map.put("orderProductDto", orderProductDto);
			map.put("ordersDto", ordersDto);
			map.put("customerDto", customerDto);
			map.put("productOptionDto", productOptionDto);

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonData;
			try {
				jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}

		return list;
	}

	public List<Map<String, Object>> getCompleteReturnOrderListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<OrderProductDto> orderProductDtoList = orderSqlMapper.getOrderProductByBizNoAndStatusNo(biz_no, 7);
		for (OrderProductDto orderProductDto : orderProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			OrdersDto ordersDto = orderSqlMapper.getOrderByNo(orderProductDto.getOrders_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(ordersDto.getCustomer_no());
			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(orderProductDto.getProduct_option_no());
			ReturnDto returnDto = orderSqlMapper.getReturnByOrderProductNo(orderProductDto.getOrder_product_no());
			ReturnExchangeReasonDto returnExchangeReasonDto = orderSqlMapper
					.getReturnExchangeReasonByNo(returnDto.getReturn_exchange_reason_no());
			int productOptionNum = productSqlMapper.countProductOptionByProductNo(productOptionDto.getProduct_no());
			ProductDto productDto = productSqlMapper.getProductByNo(productOptionDto.getProduct_no());
			OrderProductStatusDto orderProductStatusDto = orderSqlMapper
					.getOrderStatusByNo(orderProductDto.getOrder_product_status_no());

			int shippingNum = shippingSqlMapper.countShippingByOrderProductNo(orderProductDto.getOrder_product_no());
			if (shippingNum >= 1) {
				ShippingDto shippingDto = shippingSqlMapper
						.getShippingByOrderProductNo(orderProductDto.getOrder_product_no());
				ShippingCompanyDto shippingCompanyDto = shippingSqlMapper
						.getShippingCompanyByNo(shippingDto.getShipping_company_no());

				map.put("shippingDto", shippingDto);
				map.put("shippingCompanyDto", shippingCompanyDto);
			}

			map.put("shippingNum", shippingNum);
			map.put("orderProductStatusDto", orderProductStatusDto);
			map.put("productDto", productDto);
			map.put("productOptionNum", productOptionNum);
			map.put("returnExchangeReasonDto", returnExchangeReasonDto);
			map.put("returnDto", returnDto);
			map.put("returnExchangeReasonDto", returnExchangeReasonDto);
			map.put("orderProductDto", orderProductDto);
			map.put("ordersDto", ordersDto);
			map.put("customerDto", customerDto);
			map.put("productOptionDto", productOptionDto);

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonData;
			try {
				jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);

		}

		return list;
	}

	public List<AdCategoryDto> getAllAdCategory() {
		return adSqlMapper.getAllAdCategory();
	}

	public void createAdPaymentAndAdProduct(AdPaymentDto adPaymentDto, List<AdProductDto> adProductDtoList) {
		int adPaymentPk = adSqlMapper.createAdPaymentPk();
		adPaymentDto.setAd_payment_no(adPaymentPk);
		adSqlMapper.createAdPayment(adPaymentDto);

		for (AdProductDto adProductDto : adProductDtoList) {
			adProductDto.setAd_payment_no(adPaymentPk);

			adSqlMapper.createAdProduct(adProductDto);
		}
	}

	public List<Map<String, Object>> getOngoingAdProductByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<AdProductDto> adProductDtoList = adSqlMapper.getOngoingAdProductByBizNo(biz_no);
		System.out.println(adProductDtoList.toString());
		for (AdProductDto adProductDto : adProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();
			ProductDto productDto = productSqlMapper.getProductByNo(adProductDto.getProduct_no());

			AdCategoryDto adCategoryDto = adSqlMapper.getAdCategoryByNo(adProductDto.getAd_category_no());

			map.put("productDto", productDto);
			map.put("adCategoryDto", adCategoryDto);
			map.put("adProductDto", adProductDto);

			list.add(map);
		}

		return list;
	}

	public List<Map<String, Object>> getNewProductInquiryListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<ProductInquiryDto> productNewInquiryDtoList = productSqlMapper.getNewProductInquiryByBizNo(biz_no);
		for (ProductInquiryDto productInquiryDto : productNewInquiryDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			ProductDto productDto = productSqlMapper.getProductByNo(productInquiryDto.getProduct_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(productInquiryDto.getCustomer_no());

			map.put("productDto", productDto);
			map.put("productInquiryDto", productInquiryDto);
			map.put("customerDto", customerDto);
			map.put("isReplied", 0);

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				String jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}

		return list;
	}

	public void registerInquiryReply(ProductInquiryReplyDto productInquiryReplyDto) {
		productSqlMapper.createInquiryReply(productInquiryReplyDto);
	}

	public List<Map<String, Object>> getCompleteProductInquiryListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<ProductInquiryDto> productNewInquiryDtoList = productSqlMapper.getCompleteProductInquiryByBizNo(biz_no);
		for (ProductInquiryDto productInquiryDto : productNewInquiryDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			ProductDto productDto = productSqlMapper.getProductByNo(productInquiryDto.getProduct_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(productInquiryDto.getCustomer_no());
			ProductInquiryReplyDto productInquiryReplyDto = productSqlMapper
					.getProductInquiryReplyByInquiryNo(productInquiryDto.getProduct_inquiry_no());

			map.put("productDto", productDto);
			map.put("productInquiryDto", productInquiryDto);
			map.put("productInquiryReplyDto", productInquiryReplyDto);
			map.put("customerDto", customerDto);
			map.put("isReplied", 1);

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				String jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}

		return list;
	}

	public Map<String, Object> getSalesPerfomanceDataByBizNo(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Map<String, Object>> dailySalesList = orderSqlMapper.getDailySalesByBizNo(biz_no);
		List<Map<String, Object>> weekdaySalesList = orderSqlMapper.getWeekDaySalesByBizNo(biz_no);
		List<Map<String, Object>> monthlySalesList = orderSqlMapper.getMonthlySalesByBizNo(biz_no);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData;
		try {
			jsonData = objectMapper.writeValueAsString(dailySalesList);
			map.put("dailySalesList", jsonData);

			jsonData = objectMapper.writeValueAsString(weekdaySalesList);
			map.put("weekdaySalesList", jsonData);

			jsonData = objectMapper.writeValueAsString(monthlySalesList);
			map.put("monthlySalesList", jsonData);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}

	public Map<String, Object> getProductPerfomanceDataByBizNo(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> subCategorySalesList = orderSqlMapper.getSubCategorySalesByBizNo(biz_no);
		List<Map<String, Object>> subCategoryRefundList = orderSqlMapper.getSubCategoryRefundByBizNo(biz_no);
		List<Map<String, Object>> productSalesList = orderSqlMapper.getProductSalesByBizNo(biz_no);
		List<Map<String, Object>> productRefundList = orderSqlMapper.getProductRefundByBizNo(biz_no);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData;
		try {
			jsonData = objectMapper.writeValueAsString(subCategorySalesList);
			map.put("subCategorySalesList", jsonData);

			jsonData = objectMapper.writeValueAsString(subCategoryRefundList);
			map.put("subCategoryRefundList", jsonData);

			jsonData = objectMapper.writeValueAsString(productSalesList);
			map.put("productSalesList", jsonData);

			jsonData = objectMapper.writeValueAsString(productRefundList);
			map.put("productRefundList", jsonData);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}

	public List<Map<String, Object>> getPurchaseConfirmOrderByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<OrderProductDto> orderProductDtoList = orderSqlMapper.getOrderProductByBizNoAndStatusNo(biz_no, 6);
		for (OrderProductDto orderProductDto : orderProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			OrdersDto ordersDto = orderSqlMapper.getOrderByNo(orderProductDto.getOrders_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(ordersDto.getCustomer_no());

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = sdf.format(ordersDto.getOrders_date());
			SettlementProcessDto settlementProcessDto = settlementSqlMapper.getSettlementByOrdersDate(formattedDate);
			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(orderProductDto.getProduct_option_no());

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(ordersDto.getOrders_date());
			calendar.add(Calendar.DAY_OF_MONTH, 14);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.add(Calendar.MONTH, 1);

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy.MM.dd");
			map.put("settlementScheduledDate", sdf2.format(calendar.getTime()));

			if (settlementProcessDto == null) {
				map.put("isSettled", 0);
			} else {
				map.put("isSettled", 1);
				map.put("settlementProcessDto", settlementProcessDto);
			}

			map.put("ordersDto", ordersDto);
			map.put("orderProductDto", orderProductDto);
			map.put("customerDto", customerDto);
			map.put("orderProductDto", orderProductDto);
			map.put("productOptionDto", productOptionDto);

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				String jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}

		return list;
	}

	public Map<String, Object> getOrderPeriodByBizNo(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> order_month = orderSqlMapper.getOrderMonthByBizNo(biz_no);
		List<Integer> order_year = orderSqlMapper.getOrderYearByBizNo(biz_no);

		map.put("order_month", order_month);
		map.put("order_year", order_year);

		return map;
	}

	public List<Map<String, Object>> getSettlementProductListByDateAndBizNo(int biz_no, int year, int month) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<OrderProductDto> orderProductDtoList = orderSqlMapper.getSettlementProductListByDateAndBizNo(biz_no, year,
				month);
		for (OrderProductDto orderProductDto : orderProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			OrdersDto ordersDto = orderSqlMapper.getOrderByNo(orderProductDto.getOrders_no());
			CustomerDto customerDto = customerSqlMapper.getCustomerByNo(ordersDto.getCustomer_no());

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = sdf.format(ordersDto.getOrders_date());
			SettlementProcessDto settlementProcessDto = settlementSqlMapper.getSettlementByOrdersDate(formattedDate);
			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(orderProductDto.getProduct_option_no());

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(ordersDto.getOrders_date());
			calendar.add(Calendar.DAY_OF_MONTH, 14);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.add(Calendar.MONTH, 1);

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy.MM.dd");
			map.put("settlementScheduledDate", sdf2.format(calendar.getTime()));

			if (settlementProcessDto == null) {
				map.put("isSettled", 0);
			} else {
				map.put("isSettled", 1);
				map.put("settlementProcessDto", settlementProcessDto);
			}

			map.put("ordersDto", ordersDto);
			map.put("orderProductDto", orderProductDto);
			map.put("customerDto", customerDto);
			map.put("orderProductDto", orderProductDto);
			map.put("productOptionDto", productOptionDto);

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				String jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}

		return list;
	}

	public Map<String, Object> getSalesByBizNoAndDate(int biz_no, int year, int month) {
		Map<String, Object> map = new HashMap<String, Object>();

		int sales = orderSqlMapper.getSalesByNoAndDate(biz_no, year, month);
		map.put("sales", sales);

		if (sales < 100000) {
			map.put("commission", 5);
		} else if (sales < 500000) {
			map.put("commission", 10);
		} else {
			map.put("commission", 15);
		}

		return map;
	}

	public BizDto getBizByIdAndEmail(BizDto kakaoLoginUser) {
		BizDto bizDto = bizSqlMapper.getBizByIdAndEmail(kakaoLoginUser);
		if (bizDto == null) {
			int bizPk = bizSqlMapper.createBizNo();
			kakaoLoginUser.setBiz_no(bizPk);
			kakaoLoginUser.setBiz_status_no(1);
			bizSqlMapper.createKakaoBiz(kakaoLoginUser);
			bizDto = bizSqlMapper.getBizByNo(bizPk);
			System.out.println(bizDto);
			return bizDto;

		} else {
			return bizDto;
		}
	}

	public List<Map<String, Object>> getReviewListByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<ProductReviewDto> productReviewDtoList = productSqlMapper.getProductReviewByBizNo(biz_no);
		for (ProductReviewDto productReviewDto : productReviewDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(productReviewDto.getProduct_option_no());
			ProductDto productDto = productSqlMapper.getProductByNo(productOptionDto.getProduct_no());
			List<ProductReviewImagesDto> productReviewImagesDtoList = productSqlMapper
					.getProductReviewImagesByReviewNo(productReviewDto.getProduct_review_no());
			int reviewLikesNum = productSqlMapper
					.countProductReviewLikesByReviewNo(productReviewDto.getProduct_review_no());
			int productOptionNum = productSqlMapper.countProductOptionByProductNo(productDto.getProduct_no());
			CustomerDto customerDto = customerSqlMapper
					.getCustomerByOrderProductNo(productReviewDto.getOrder_product_no());

			map.put("productReviewDto", productReviewDto);
			map.put("productOptionDto", productOptionDto);
			map.put("productDto", productDto);
			map.put("productReviewImagesDtoList", productReviewImagesDtoList);
			map.put("reviewLikesNum", reviewLikesNum);
			map.put("productOptionNum", productOptionNum);
			map.put("customerDto", customerDto);

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonData;
			try {
				jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}
		return list;
	}

	public List<Map<String, Object>> getReviewListByDateAndBizNo(int biz_no, String start_date, String end_date) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<ProductReviewDto> productReviewDtoList = productSqlMapper.getReviewListByDateAndBizNo(biz_no, start_date,
				end_date);
		for (ProductReviewDto productReviewDto : productReviewDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			ProductOptionDto productOptionDto = productSqlMapper
					.getProductOptionByNo(productReviewDto.getProduct_option_no());
			ProductDto productDto = productSqlMapper.getProductByNo(productOptionDto.getProduct_no());
			List<ProductReviewImagesDto> productReviewImagesDtoList = productSqlMapper
					.getProductReviewImagesByReviewNo(productReviewDto.getProduct_review_no());
			int reviewLikesNum = productSqlMapper
					.countProductReviewLikesByReviewNo(productReviewDto.getProduct_review_no());
			int productOptionNum = productSqlMapper.countProductOptionByProductNo(productDto.getProduct_no());
			CustomerDto customerDto = customerSqlMapper
					.getCustomerByOrderProductNo(productReviewDto.getOrder_product_no());

			map.put("productReviewDto", productReviewDto);
			map.put("productOptionDto", productOptionDto);
			map.put("productDto", productDto);
			map.put("productReviewImagesDtoList", productReviewImagesDtoList);
			map.put("reviewLikesNum", reviewLikesNum);
			map.put("productOptionNum", productOptionNum);
			map.put("customerDto", customerDto);

			ObjectMapper objectMapper = new ObjectMapper();
			String jsonData;
			try {
				jsonData = objectMapper.writeValueAsString(map);
				map.put("jsonData", jsonData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			list.add(map);
		}
		return list;
	}

	public Map<String, Object> getAlarmData(int biz_no) {
		Map<String, Object> result = new HashMap<String, Object>();

		int orderAlarmNum = orderSqlMapper.countOrderAlarmByBizNoAndIsChecked(biz_no, 0);
		if (orderAlarmNum > 0) {
			List<Map<String, Object>> orderAlarmDataList = new ArrayList<Map<String, Object>>();
			List<OrderAlarmDto> orderAlarmDtoList = orderSqlMapper.getOrderAlarmByBizNoAndIsChecked(biz_no, 0);
			for (OrderAlarmDto orderAlarmDto : orderAlarmDtoList) {
				Map<String, Object> map = new HashMap<String, Object>();

				OrderProductDto orderProductDto = orderSqlMapper
						.getOrderProductByNo(orderAlarmDto.getOrder_product_no());
				ProductOptionDto productOptionDto = productSqlMapper
						.getProductOptionByNo(orderProductDto.getProduct_option_no());
				ProductDto productDto = productSqlMapper.getProductByNo(productOptionDto.getProduct_no());

				map.put("orderAlarmDto", orderAlarmDto);
				map.put("orderProductDto", orderProductDto);
				map.put("productOptionDto", productOptionDto);
				map.put("productDto", productDto);

				orderAlarmDataList.add(map);
			}

			result.put("orderAlarmDataList", orderAlarmDataList);
		}

		result.put("orderAlarmNum", orderAlarmNum);
		return result;
	}

	public void updateAlarmChecked(int[] alarmNoList) {
		for (int alarmNo : alarmNoList) {
			orderSqlMapper.updateAlarmCheckedTo1(alarmNo);
		}
	}

	public Map<String, Object> getNewRequestData(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		int newOrderNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 1);
		int newInquiryNum = productSqlMapper.countInquiryByBizNoAndNotReplied(biz_no);
		int lowStockNum = productSqlMapper.countLowStockNumByBizNo(biz_no);

		map.put("newOrderNum", newOrderNum);
		map.put("newInquiryNum", newInquiryNum);
		map.put("lowStockNum", lowStockNum);

		return map;
	}

	public Map<String, Object> getOrderNumData(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		int orderCompleteNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 1);
		int prepareShippingNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 3);
		int inShippingNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 4);
		int ShippingCompleteNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 5);

		map.put("orderCompleteNum", orderCompleteNum);
		map.put("prepareShippingNum", prepareShippingNum);
		map.put("inShippingNum", inShippingNum);
		map.put("ShippingCompleteNum", ShippingCompleteNum);

		return map;
	}

	public Map<String, Object> getCancelRefundExchangeNumDataData(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		int cancelRequestNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 8);
		int returnRequestNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 10);
		int exchangeRequestNum = orderSqlMapper.countOrderProductByBizNoAndStatusNo(biz_no, 9);
		map.put("cancelRequestNum", cancelRequestNum);
		map.put("returnRequestNum", returnRequestNum);
		map.put("exchangeRequestNum", exchangeRequestNum);

		return map;
	}

	public Map<String, Object> getPurchaseConfirmationAndremainingAmountToNextGradeData(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		LocalDate today = LocalDate.now();
		int year = today.getYear();
		int month = today.getMonthValue();

		int purchaseConfirmationNum = orderSqlMapper.getSalesByNoAndDate(biz_no, year, month);
		if (purchaseConfirmationNum < 100000) {
			map.put("remainingAmountToNextGrade", 500000 - purchaseConfirmationNum);
		} else if (purchaseConfirmationNum < 500000) {
			map.put("remainingAmountToNextGrade", 1000000 - purchaseConfirmationNum);
		} else {
			map.put("remainingAmountToNextGrade", 10000000 - purchaseConfirmationNum);
		}
		map.put("purchaseConfirmationNum", purchaseConfirmationNum);

		return map;
	}

	public Map<String, Object> getTodayAndWeeklyPaymentData(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		LocalDate today = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String todayDate = today.format(dtf);
		String yesterdayDate = today.minusDays(1).format(dtf);
		String lastweekDate = today.minusWeeks(1).format(dtf);

		System.out.println("today: " + todayDate);
		System.out.println("yesterday: " + yesterdayDate);

		int todayPayment = orderSqlMapper.sumOrderProductPaymentByBizNoAndDate(biz_no, todayDate);
		int yesterdayPayment = orderSqlMapper.sumOrderProductPaymentByBizNoAndDate(biz_no, yesterdayDate);

		double purchaseAmountOnedayIncreasePercentage = 100;
		if (yesterdayPayment != 0) {
			purchaseAmountOnedayIncreasePercentage = Math
					.round((todayPayment - yesterdayPayment) / (double) yesterdayPayment * 100 * 100) / 100.0;
		}

		int todayOrderCount = orderSqlMapper.countOrderProductByBizNoAndDate(biz_no, todayDate);
		int yesterdayOrderCount = orderSqlMapper.countOrderProductByBizNoAndDate(biz_no, yesterdayDate);
		double orderCountOnedayIncreasePercentage = 100.0;
		if (yesterdayOrderCount != 0) {
			orderCountOnedayIncreasePercentage = Math
					.round((todayOrderCount - yesterdayOrderCount) / (double) yesterdayOrderCount * 100 * 100) / 100.0;
		}

		int thisWeekPayment = orderSqlMapper.sumWeeklyOrderProductPaymentByBizNoAndDate(biz_no, todayDate);
		int lastWeekPayment = orderSqlMapper.sumWeeklyOrderProductPaymentByBizNoAndDate(biz_no, lastweekDate);
		double purchaseAmountOneweekIncreasePercentage = 100.0;
		if (lastWeekPayment != 0) {
			purchaseAmountOneweekIncreasePercentage = Math
					.round((thisWeekPayment - lastWeekPayment) / (double) lastWeekPayment * 100 * 100) / 100.0;
		}

		int thisWeekOrderCount = orderSqlMapper.countWeeklyOrderProductPaymentByBizNoAndDate(biz_no, todayDate);
		int lastWeekOrderCount = orderSqlMapper.countWeeklyOrderProductPaymentByBizNoAndDate(biz_no, lastweekDate);
		double orderCountOneweekIncreasePercentage = 100.0;
		if (lastWeekOrderCount != 0) {
			orderCountOneweekIncreasePercentage = Math
					.round((thisWeekOrderCount - lastWeekOrderCount) / (double) lastWeekOrderCount * 100 * 100) / 100.0;
		}

		map.put("todayPayment", todayPayment);
		map.put("purchaseAmountOnedayIncreasePercentage", purchaseAmountOnedayIncreasePercentage);
		map.put("todayOrderCount", todayOrderCount);
		map.put("orderCountOnedayIncreasePercentage", orderCountOnedayIncreasePercentage);

		map.put("thisWeekPayment", thisWeekPayment);
		map.put("purchaseAmountOneweekIncreasePercentage", purchaseAmountOneweekIncreasePercentage);
		map.put("thisWeekOrderCount", thisWeekOrderCount);
		map.put("orderCountOneweekIncreasePercentage", orderCountOneweekIncreasePercentage);

		return map;
	}

	public Map<String, Object> getTop5ProductData(int biz_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Map<String, Object>> top5ProductOptionList = orderSqlMapper.getTop5OrderProductByBizNo(biz_no);
		System.out.println(top5ProductOptionList);

		map.put("top5ProductOptionList", top5ProductOptionList);
		return map;
	}

	public List<Map<String, Object>> getUpcomingAdProductByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<AdProductDto> adProductDtoList = adSqlMapper.getUpcomingAdProductByBizNo(biz_no);
		for (AdProductDto adProductDto : adProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			ProductDto productDto = productSqlMapper.getProductByNo(adProductDto.getProduct_no());

			AdCategoryDto adCategoryDto = adSqlMapper.getAdCategoryByNo(adProductDto.getAd_category_no());

			map.put("productDto", productDto);
			map.put("adCategoryDto", adCategoryDto);
			map.put("adProductDto", adProductDto);

			list.add(map);
		}
		
		return list;

	}
//	public List<Map<String, Object>> getProductReviewByBizNo(int biz_no) {
//	List<Map<String, Object>> map=productSqlMapper.getProductReviewByBizNo(biz_no);
//	
//	return map;
//}

	public List<Map<String, Object>> getExpiredAdProductByBizNo(int biz_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<AdProductDto> adProductDtoList = adSqlMapper.getExpiredAdProductByBizNo(biz_no);
		for (AdProductDto adProductDto : adProductDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			ProductDto productDto = productSqlMapper.getProductByNo(adProductDto.getProduct_no());

			AdCategoryDto adCategoryDto = adSqlMapper.getAdCategoryByNo(adProductDto.getAd_category_no());

			map.put("productDto", productDto);
			map.put("adCategoryDto", adCategoryDto);
			map.put("adProductDto", adProductDto);

			list.add(map);
		}
		
		return list;
	}

	public int getBizLikesNumByBizNo(int biz_no) {
		
		return bizSqlMapper.getBizLikesNumByBizNo(biz_no);
	}

	public Map<String, Object> getProductNumPerStatusByBizNo(int biz_no) {
		return productSqlMapper.getProductNumPerStatusByBizNo(biz_no);
	}

	public List<Map<String, Object>> getNewSettlementByBizNo(int biz_no) {
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		
		return null;
	}
}
