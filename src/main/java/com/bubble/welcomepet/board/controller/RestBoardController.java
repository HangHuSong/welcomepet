package com.bubble.welcomepet.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.customer.service.CustomerService;
import com.bubble.welcomepet.dto.CartDto;
import com.bubble.welcomepet.dto.CustomerAddressDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.OrderProductDto;
import com.bubble.welcomepet.dto.OrderRequestDto;
import com.bubble.welcomepet.dto.OrdersDto;
import com.bubble.welcomepet.dto.ProductReviewDto;
import com.bubble.welcomepet.dto.ProductWishDto;
import com.bubble.welcomepet.dto.ProductReviewImagesDto;

@RestController
@RequestMapping("/board/*")
public class RestBoardController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("addCart")
	public void addCart(@RequestBody List<Map<String, String>> selectedOptions, HttpSession session) {
	    CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
	    List<CartDto> cartDtoList = new ArrayList<>();

	    for (Map<String, String> option : selectedOptions) {
	        CartDto cartDto = new CartDto();
	        cartDto.setCustomer_no(sessionUser.getCustomer_no());
	        cartDto.setProduct_option_no(Integer.parseInt(option.get("product_option_no")));
	        cartDto.setProduct_amount(Integer.parseInt(option.get("product_amount")));
	        cartDtoList.add(cartDto);
	        customerService.addCart(cartDto);
	    }

	}
	

	// 주문 
	@RequestMapping("orders")
	public  Map<String, Object> orders(@RequestBody OrderRequestDto orderRequestDto, HttpSession session) { 
	    List<OrderProductDto> orderProductDtoList = orderRequestDto.getOrderProductDtoList();
	    OrdersDto ordersDto = orderRequestDto.getOrdersDto();
		System.out.println("어쩌꾸");
		Map<String , Object> map = new HashMap<>();
		
	    int order_no = customerService.addOrders(ordersDto, orderProductDtoList);
	    session.setAttribute("order_no", order_no);
	    map.put("orders_no", order_no);
	    map.put("result", "success");
	    return map;
	}
	
	
	@RequestMapping("getCategoryList")
	public Map<String, Object> getCategoryList(int main_category_no){
		Map<String , Object> map = new HashMap<>();
		

		map.put("categoryList", customerService.getCategoryList(main_category_no));	
		map.put("result", "success");
		return map;
	}
	
	
	@RequestMapping("getRecentImg")
	public Map<String, Object> getRecentImg(int customer_no) {
		Map<String , Object> map = new HashMap<>();
		
		map.put("recentImg", customerService.recentProductImg(customer_no));
		map.put("result", "success");
		return map;
	}
	
	
	// 리뷰 관련
	
	@RequestMapping("getProductReview")
	public Map<String, Object> getProductReview(int product_no) {
		Map<String , Object> map = new HashMap<>();
		
		map.put("reviewList", customerService.getReviewByProduct(product_no));
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("getProductOption")
	public Map<String, Object> getProductOption(int product_no) {
		Map<String , Object> map = new HashMap<>();
		
		map.put("map", customerService.getByProductNo(product_no));
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("deleteReview")
	public Map<String, Object> deleteReview(int product_review_no) {
		Map<String , Object> map = new HashMap<>();
		
		customerService.deleteReview(product_review_no);
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("updateReview") 
	public Map<String, Object> updateReview(ProductReviewDto params) {
		
		Map<String , Object> map = new HashMap<>();
		
		customerService.updateReview(params);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("getTotalWishCount")
	public Map<String, Object> getTotalWishCount(int product_no) {
		
		Map<String , Object> map = new HashMap<>();
		
		
		map.put("count", customerService.getTotalWishCount(product_no));
		
		return map;
	}
	
	@RequestMapping("toggleWish")
	public Map<String, Object> addWish(HttpSession session, ProductWishDto params) {
		
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		Map<String,Object> map = new HashMap<>();
		params.setCustomer_no(sessionUser.getCustomer_no());
		customerService.toggleWish(params);
		
		map.put("result", "success");
		
		return map;
		
	}
	@RequestMapping("isWished")
	public Map<String, Object> isLiked(HttpSession session, ProductWishDto params){
		Map<String , Object> map = new HashMap<>();
		
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}
		
		params.setCustomer_no(sessionUser.getCustomer_no());
		
		map.put("result", "success");
		map.put("isWished", customerService.isWished(params));
		
		return map;
	}
	
	@RequestMapping("topSalePrdouct")
	public Map<String, Object> topSaleProduct(){
		
		Map<String , Object> map = new HashMap<>();
		System.out.println();
		map.put("topSaleProductList", customerService.topSaleProduct());
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("relatedProduct")
	public Map<String, Object> relatedProduct(int main_category_no){
		
		Map<String , Object> map = new HashMap<>();
		System.out.println();
		map.put("relatedProductList", customerService.getProductInfoByMainCategory(main_category_no));
		map.put("result", "success");
		return map;
	}
	
	
	@RequestMapping("bizProduct")
	public Map<String, Object> bizProduct(int biz_no){
		
		Map<String , Object> map = new HashMap<>();
		System.out.println();
		map.put("bizProductList", customerService.getProductInfoByBiz(biz_no));
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("bizList")
	public Map<String, Object> bizList(){
		
		System.out.println("테스트");
		
		Map<String , Object> map = new HashMap<>();
		map.put("bizList", customerService.getbizList());
		map.put("result", "success");
		return map;
	}

	

	
	@RequestMapping("registerReview")
	public Map<String, Object> registerReview(HttpSession session, @RequestPart("reviewImagies") MultipartFile[] reviewImagies,
			@RequestParam("order_product_no") int orderProductNo,
			@RequestParam("product_review_context") String reviewContext,
			@RequestParam("product_option_no") int productOptionNo,
            @RequestParam("product_review_rating") int reviewRating ){
		
		ProductReviewDto productReviewDto = new ProductReviewDto();
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
			
		Map<String , Object> map = new HashMap<>();
		
		List<ProductReviewImagesDto> reviewImageList = new ArrayList<>();
		// 파일 저장 로직
		if (reviewImagies != null) {
			for (MultipartFile reviewImg : reviewImagies) {
				if (reviewImg.isEmpty()) {
					continue;
				}
				String rootFolder = "C:/uploadFiles/WelcomePet/";

				String customer_id = sessionUser.getCustomer_id();
				
				String review = "/review";
				// C:/uploadFolder/2023/05/23 문자
				File targetFolder = new File(rootFolder + customer_id + review);
				
				if (!targetFolder.exists()) {
					targetFolder.mkdirs();

				}

				// 저장 파일명 만들기. 핵심은 파일명 충돌 방치 = 랜덤 + 시간
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = reviewImg.getOriginalFilename();

				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = customer_id + review + "/" + fileName + ext;
				
				try {
					reviewImg.transferTo(new File(rootFolder + saveFileName));

				}catch (Exception e) {
					e.printStackTrace();
				}
				ProductReviewImagesDto reviewImgDto = new ProductReviewImagesDto();    
				reviewImgDto.setProduct_review_images_link(saveFileName);
				
				reviewImageList.add(reviewImgDto);
				System.out.println(reviewImgDto.getProduct_review_images_link());
				System.out.println("테스트");
			}
		}
		int customer_no = sessionUser.getCustomer_no();
		productReviewDto.setCustomer_no(customer_no);
		productReviewDto.setOrder_product_no(orderProductNo);
		productReviewDto.setProduct_option_no(productOptionNo);
		productReviewDto.setProduct_review_rating(reviewRating);
		productReviewDto.setProduct_review_context(reviewContext);
		
		customerService.writeReview(productReviewDto, reviewImageList);
		map.put("result", "success");
		return map;
	}
	

}
