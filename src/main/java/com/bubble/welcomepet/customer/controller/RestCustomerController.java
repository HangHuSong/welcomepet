package com.bubble.welcomepet.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bubble.welcomepet.customer.service.CustomerService;
import com.bubble.welcomepet.dto.CartDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.ProductWishDto;


@RestController
@RequestMapping("/customer/*")
public class RestCustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("existsCustomerId")
	public Map<String, Object> existsCustomerId(String customerId) {
		boolean exists = customerService.existsCustomerId(customerId);
		System.out.println(exists);
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("data", exists);
		return map;
	}
	
	@RequestMapping("getMyId")
	public Map<String, Object> getMyId(HttpSession session){
		Map<String,Object> map = new HashMap<>();
		
		
		CustomerDto sessionUser = (CustomerDto) session.getAttribute("customerUser");

		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		} else {
			System.out.println(sessionUser.getCustomer_name());
			map.put("result", "success");
			map.put("customerNo", sessionUser.getCustomer_no());
			return map;
		}	
	}
	


	
}
