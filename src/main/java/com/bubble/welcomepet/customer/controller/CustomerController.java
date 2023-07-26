package com.bubble.welcomepet.customer.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.customer.service.CustomerService;
import com.bubble.welcomepet.dto.CartDto;
import com.bubble.welcomepet.dto.CustomerAddressDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.DogDto;
import com.bubble.welcomepet.dto.OrderProductDto;
import com.bubble.welcomepet.dto.OrdersDto;
import com.bubble.welcomepet.dto.ProductDto;
import com.bubble.welcomepet.dto.ProductOptionDto;
import com.bubble.welcomepet.dto.ProductReviewDto;
import com.bubble.welcomepet.dto.ProductReviewImagesDto;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;


@Controller
@RequestMapping("/customer/*")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
 
	// 회원
	
	@RequestMapping("login")	
	public String customerLoginPage() {
		return "customer/login";
	}

	@RequestMapping("regist")
	public String customerRegist() {
		return "customer/regist";
	}

	@RequestMapping("registProcess")
	public String customerRegistProcess(CustomerDto customerDto) {
		customerService.registCustomer(customerDto);
		return "customer/login";
	}

	@RequestMapping("loginProcess")
	public String customerLoginProcess(HttpSession session, CustomerDto customerDto) {
		CustomerDto customerUser = customerService.loginCustomer(customerDto);
		if (customerUser == null) {
			return "customer/login";
		} else {
			session.setAttribute("customerUser", customerUser);
			return "redirect:../board/main";
		}

	}

	@RequestMapping("my")
	public String customerMyPage(HttpSession session, Model model) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		if (sessionUser == null) {
			return "customer/login";
		} else {
			int customer_no = sessionUser.getCustomer_no();
			CustomerDto customerDto = customerService.getCustomerInfo(customer_no);
			List<Map<String, Object>> list = customerService.getDogByCutomerNo(customer_no);
			session.setAttribute("sessionUser", customerDto);
			model.addAttribute("dogInfo", list);
			model.addAttribute("sessionUser", customerDto);
			return "customer/my";
		}

	}
	
	@RequestMapping("addInquiry")
	public String addInquiry() {
		return "customer/addInquiry";
	}

	@RequestMapping("myInfo")
	public String customerMyInfoPage(HttpSession session, Model model) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");

		if (sessionUser == null) {
			return "customer/login";
		} else {
			model.addAttribute("customerDto", sessionUser);
			return "customer/myInfo";
		}

	}

	@RequestMapping("updateMyInfo")
	public String updateMyInfo(HttpSession session, Model model) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		model.addAttribute("customerDto", sessionUser);
		return "customer/updateMyInfo";
	}

	@RequestMapping("updateMyInfoProcess")
	public String updateMyInfoProcess(HttpSession session, CustomerDto customerDto) {
		customerService.updateCustomerInfo(customerDto);
		session.setAttribute("sessionUser", customerDto);
		return "redirect:./my";
	}

	
	// 주문
	@RequestMapping("orderList")
	public String orderList(Model model, HttpSession session) {

	    CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
	    int customer_no = sessionUser.getCustomer_no();

	    List<Map<String, Object>> orderList = customerService.getCustomerOrders(customer_no);
	    
	    model.addAttribute("orderList", orderList);

	    return "customer/orderList";
	}
	
	@RequestMapping("orderDetail")
	public String orderDetail(Model model, int order_no) {

		OrdersDto ordersDto = customerService.getOrder(order_no);
	    List<Map<String, Object>> orderList = customerService.orderDetails(order_no);
	    Map<String, Integer> totals = customerService.calculateTotal(order_no);
	    
	    model.addAttribute("ordersDto", ordersDto);
	    model.addAttribute("orderList", orderList);
	    model.addAttribute("totals", totals);

	    return "customer/orderDetail";
	}
	
	@RequestMapping("updateProductStatus")
	public String updateProductStatus(Model model, OrderProductDto orderProductDto) {

	    customerService.updateProductStatus(orderProductDto);
	    return "redirect:./orderList";
	}

	//리뷰
	@RequestMapping("writeReviewPage")
	public String writeReviewPage(Model model, HttpSession session, int order_product_no) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		Map<String, Object> map = customerService.getOrderProduct(order_product_no);

		model.addAttribute("data", map);
		model.addAttribute("customerDto", sessionUser);
		return "customer/writeReviewPage";		
	}
	
	@RequestMapping("writeReviewProcess")
	public String writeReviewProcess(HttpSession session, ProductReviewDto productReviewDto, MultipartFile[] reviewImagies) {

		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");

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

		customerService.writeReview(productReviewDto, reviewImageList);

		return "redirect:./myReview";
	}
	
	@RequestMapping("myReview")
	public String myReview(Model model, HttpSession session) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		int customer_no = sessionUser.getCustomer_no();
		 List<Map<String, Object>> map = customerService.getReviewByCustomer(customer_no);
		 model.addAttribute("data", map);
		return "customer/myReview";
	}
	
	// 주소

	@RequestMapping("address")
	public String addressPage(Model model, int customer_no) {
		List<Map<String, Object>> list = customerService.getCustomerAddress(customer_no);

		model.addAttribute("addressList", list);
		return "customer/address";
	}

	@RequestMapping("addAddress")
	public String addAddress(CustomerAddressDto customerAddressDto) {
		return "customer/addAddress";
	}

	@RequestMapping("addAddressProcess")
	public String addAddressProcess(CustomerAddressDto customerAddressDto) {
		customerService.addAddress(customerAddressDto);
		return "redirect:./address?customer_no=" + (customerAddressDto.getCustomer_no());

	}

	@RequestMapping("updateAddress")
	public String updateAddress(int customer_address_no, Model model) {
		CustomerAddressDto addressInfo = customerService.getAddressByAddressNo(customer_address_no);
		model.addAttribute("addressInfo", addressInfo);
		return "customer/updateAddress";
	}

	@RequestMapping("updateCustomerAddressProcess")
	public String updateCustomerAddress(CustomerAddressDto customerAddressDto, String isDefaultAddress) {
		customerService.updateCustomerAddress(customerAddressDto);
		if (isDefaultAddress != null) {
			
			customerService.updateMainAddress(customerAddressDto);
		}

		return "redirect:./address?customer_no=" + (customerAddressDto.getCustomer_no());

	}

	// 장바구니

	@RequestMapping("cart")
	public String cartPage(HttpSession session, Model model) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		if (sessionUser == null) {
			return "customer/login";
		} else {
			int customer_no = sessionUser.getCustomer_no();
			CustomerDto customerDto = customerService.getCustomerInfo(customer_no);
			List<Map<String, Object>> list = customerService.getCartByCutomerNo(customer_no);
			model.addAttribute("cartInfo", list);
			model.addAttribute("sessionUser", customerDto);
			return "customer/cart";
		}
	}
	
//	@RequestMapping("addCart")
//	public String addCart(HttpSession session, Model model, CartDto cartDto) {
//		
//		customerService.addCart(cartDto);
//		return "redirect:./cart";
//	}
//	
	@RequestMapping("deleteCart")
	public String deleteCart(int cart_no) {
		customerService.deleteCart(cart_no);
		return "redirect:./cart";
	}

	// 찜
	@RequestMapping("wishList")
	public String wishList(HttpSession session, Model model) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		if (sessionUser == null) {
			return "customer/login";
		} else {
			int customer_no = sessionUser.getCustomer_no();
			CustomerDto customerDto = customerService.getCustomerInfo(customer_no);
			List<Map<String, Object>> list = customerService.getWishList(customer_no);
			model.addAttribute("data", list);
			model.addAttribute("sessionUser", customerDto);
			return "customer/wishList";
		}
	}	
	
	
	
	// 반려견

	@RequestMapping("registDog")
	public String dogRegistPage() {
		return "customer/registDog";
	}

	@RequestMapping("dogInfo")
	public String dogInfo() {
		return "customer/dogInfo";
	}

	@RequestMapping("registDogProcess")
	public String registDogProcess(DogDto dogDto, MultipartFile[] dogImg, HttpSession session) {
		System.out.println("테스트");
		System.out.println(dogDto.toString());
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");

		if (dogImg != null) {
			for (MultipartFile dogimage : dogImg) {
				if (dogimage.isEmpty()) {
					continue;
				}
				String rootFolder = "C:/uploadFiles/WelcomePet/";

				String customer_id = sessionUser.getCustomer_id();
				// C:/uploadFolder/2023/05/23 문자
				File targetFolder = new File(rootFolder + customer_id);

				if (!targetFolder.exists()) {
					targetFolder.mkdirs();

				}

				// 저장 파일명 만들기. 핵심은 파일명 충돌 방치 = 랜덤 + 시간
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = dogimage.getOriginalFilename();

				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = customer_id + "/" + fileName + ext;
				try {
					dogimage.transferTo(new File(rootFolder + saveFileName));

				} catch (Exception e) {
					e.printStackTrace();
				}
				dogDto.setDog_image(saveFileName);
			}
		}
		int customer_no = sessionUser.getCustomer_no();
		dogDto.setCustomer_no(customer_no);

		customerService.registDog(dogDto);

		return "redirect:./my";
	}
	
}
