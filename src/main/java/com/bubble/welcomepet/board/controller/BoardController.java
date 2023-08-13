package com.bubble.welcomepet.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.OrderComparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bubble.welcomepet.customer.service.CustomerService;
import com.bubble.welcomepet.dto.CategoryDto;
import com.bubble.welcomepet.dto.CustomerAddressDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.CustomerSearchDto;
import com.bubble.welcomepet.dto.OrderProductDto;
import com.bubble.welcomepet.dto.OrdersDto;
import com.bubble.welcomepet.dto.ProductDetailImageDto;
import com.bubble.welcomepet.dto.RecentProductDto;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping("main")
	public String mainPage(Model model) {
		List<Map<String, Object>> list = customerService.topSaleProduct();
		model.addAttribute("topSaleProduct", list);
		return "board/main";
	}

	// 검색

	@RequestMapping("search")
	public String searchPage(HttpSession session, Model model) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		if (sessionUser == null) {
			return "board/search";
		} else {
			
			int customer_no = sessionUser.getCustomer_no();
			List<Map<String, Object>> list = customerService.getSearchByCutomerNo(customer_no);
			model.addAttribute("customerInfo", sessionUser);
			model.addAttribute("searchInfo", list);
			return "board/search";
		}

	}

	@RequestMapping("searchProduct")
	public String search(Model model, String searchWord, HttpSession session, CustomerSearchDto customerSearchDto) {

		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");

		List<Map<String, Object>> list = customerService.searchProduct(searchWord);
		int count = customerService.searchProduct(searchWord).size();
		model.addAttribute("productCount", count);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("productInfo", list);
		if (sessionUser != null) {
			int customer_no = sessionUser.getCustomer_no();
			System.out.println(customer_no);
			System.out.println(searchWord);
			customerSearchDto.setCustomer_no(customer_no);
			customerSearchDto.setSearch_content(searchWord);
			customerService.addSearch(customerSearchDto);
		}

		return "board/searchProduct";
	}

	// 주문

	@RequestMapping("buyPage")
	public String buyPage(Model model, @RequestParam("selectedOptions") String selectedOptionsJson,
			HttpSession session) {

		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		int customer_no = sessionUser.getCustomer_no();
		CustomerDto customerDto = customerService.getCustomerInfo(customer_no);
		CustomerAddressDto mainAddress = customerService.mainAddress(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Integer> amountList = new ArrayList<>();

		ObjectMapper objectMapper = new ObjectMapper();

		try {
			List<Map<String, String>> selectedOptions = objectMapper.readValue(selectedOptionsJson,
					new TypeReference<List<Map<String, String>>>() {
					});
			for (Map<String, String> option : selectedOptions) {
				int product_option_no = Integer.parseInt(option.get("product_option_no"));
				int product_amount = Integer.parseInt(option.get("product_amount"));
				Map<String, Object> map = customerService.getProductbyOption(product_option_no);
				amountList.add(product_amount);
				list.add(map);

			}
			session.setAttribute("selectedOptions", selectedOptionsJson);
		} catch (IOException e) {
			// JSON 파싱 오류 처리
			e.printStackTrace();
		}
		System.out.println(amountList);
		model.addAttribute("addressList", customerService.getCustomerAddress(customer_no));
		model.addAttribute("mainAddress", mainAddress);
		model.addAttribute("sessionUser", customerDto);
		model.addAttribute("product_amount", amountList);
		model.addAttribute("data", list);

		return "board/buyPage";
	}

	@RequestMapping("payPage")
	public String payPage(Model model, int order_no, String pg_token, HttpSession session) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		int customer_no = sessionUser.getCustomer_no();
		CustomerDto customerDto = customerService.getCustomerInfo(customer_no);
		OrdersDto ordersDto = customerService.getOrder(order_no);
		List<Map<String, Object>> orderList = customerService.orderDetails(order_no);
		Map<String, Integer> totals = customerService.calculateTotal(order_no);

		model.addAttribute("pgToken", pg_token);
		model.addAttribute("ordersDto", ordersDto);
		model.addAttribute("orderList", orderList);
		model.addAttribute("totals", totals);
		model.addAttribute("sessionUser", customerDto);

		return "board/payPage";
	}

	// 상품

	@RequestMapping("productDetail")
	public String productDetail(Model model, int product_no, HttpSession session, RecentProductDto recentProductDto) {

		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");

		Map<String, Object> map = customerService.getByProductNo(product_no);

		model.addAttribute("data", map);

		if (sessionUser != null) {
			int customer_no = sessionUser.getCustomer_no();
			recentProductDto.setCustomer_no(customer_no);
			recentProductDto.setProduct_no(product_no);
			customerService.addRecentProduct(recentProductDto);
		}

		return "board/productDetail";

	}

	@RequestMapping("recentProductList")
	public String recentProductList(HttpSession session, Model model) {
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");
		if (sessionUser == null) {
			return "customer/login";
		}
		int customer_no = sessionUser.getCustomer_no();

		List<Map<String, Object>> list = customerService.getRecentProductByCutomerNo(customer_no);

		model.addAttribute("recentInfo", list);

		return "board/recentProductList";
	}

	@RequestMapping("categoryProduct")
	public String categoryProduct(Model model, Integer sub_category_no, Integer main_category_no) {

		if (sub_category_no == null) {

			List<Map<String, Object>> list = customerService.getProductInfoByMainCategory(main_category_no);
			List<Map<String, Object>> list2 = customerService.getSubCategoryByMain(main_category_no);

			CategoryDto categoryDto2 = customerService.getMainCategory(main_category_no);

			int mainCateNo = categoryDto2.getMain_category_no();
			int count = customerService.getProductInfoByMainCategory(main_category_no).size();
			String mainCategoryName = categoryDto2.getMain_category_name();
			String subCategoryName = "전체";

			model.addAttribute("mainCateNo", mainCateNo);
			model.addAttribute("subCategoryName", subCategoryName);
			model.addAttribute("mainCategoryName", mainCategoryName);
			model.addAttribute("productCount", count);
			model.addAttribute("categoryInfo", list2);
			model.addAttribute("productInfo", list);
			return "board/categoryProduct";

		}
		CategoryDto categoryDto = customerService.getSubCategory(sub_category_no);
		CategoryDto categoryDto2 = customerService.getMainCategory(main_category_no);

		String mainCategoryName = categoryDto2.getMain_category_name();
		String subCategoryName = categoryDto.getSub_category_name();
		int mainCateNo = categoryDto2.getMain_category_no();

		List<Map<String, Object>> list = customerService.getProductInfoByCategory(sub_category_no);
		List<Map<String, Object>> list2 = customerService.getSubCategoryByMain(main_category_no);
		int count = customerService.getProductInfoByCategory(sub_category_no).size();

		model.addAttribute("mainCateNo", mainCateNo);
		model.addAttribute("mainCategoryName", mainCategoryName);
		model.addAttribute("subCategoryName", subCategoryName);
		model.addAttribute("productCount", count);
		model.addAttribute("categoryInfo", list2);
		model.addAttribute("productInfo", list);
		return "board/categoryProduct";

	}

}
