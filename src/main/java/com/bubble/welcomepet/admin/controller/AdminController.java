package com.bubble.welcomepet.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
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

import com.bubble.welcomepet.admin.service.AdminServiceImpl;
import com.bubble.welcomepet.dto.*;


@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminServiceImpl adminService;

	@RequestMapping("login")
	public String login() {
		return "admin/login";
	}

	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, EmpDto params) {
		EmpDto sessionUser = adminService.getEmpByNoAndPw(params);
		session.setAttribute("sessionUser", sessionUser);
		return "redirect:./main";
	}

	@RequestMapping("logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:./login";
	}

	@RequestMapping("main")
	public String main() {
		return "admin/main";
	}

	@RequestMapping("customerList")
	public String customer(Model model, @RequestParam(value = "page", defaultValue = "1") int page, String searchWord,
			String searchType) {
		List<Map<String, Object>> customerList = adminService.getAllCustomer(page, searchType, searchWord);
		int customerCount = adminService.getCustomerCount(searchType, searchWord);
		int recordPerPage = 10;
		int totalCustomer = (int) Math.ceil((double)customerCount/recordPerPage);
		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = ((page - 1) / 5 + 1) * 5;

		if (endPage > totalCustomer) {
			endPage = totalCustomer;
		}

		String searchQueryString = "";
		if (searchType != null && searchWord != null) {
			searchQueryString += "&searchType=" + searchType;
			searchQueryString += "&searchWord=" + searchWord;
		}

		model.addAttribute("customerList", customerList);
		model.addAttribute("totalPage", totalCustomer);
		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchQueryString", searchQueryString);

		return "admin/customerList";
	}

	@RequestMapping("bizList")
	public String biz(Model model) {
		List<Map<String, Object>> bizList = adminService.getAllBiz();

		model.addAttribute("bizList", bizList);
		return "admin/bizList";
	}

	@RequestMapping("bizDetail")
	//biz history list로 받아오기
	public String bizDetail(Model model, int biz_no) {
		BizDto bizDto = adminService.getBizByNo(biz_no);
		int approvalHistory = adminService.checkApprovalByNo(biz_no);

		BizApprovalRequestDto bizApprovalRequestDto = adminService.getApprovalRequestByNo(biz_no);
		if (approvalHistory > 0) {
			model.addAttribute("bizApprovalRequestDto", bizApprovalRequestDto);
	        if (bizApprovalRequestDto != null) {
	            BizApprovalDto bizApprovalDto = adminService.getBizHistory(bizApprovalRequestDto.getBiz_approval_request_no());
	            if (bizApprovalDto != null) {
	                BizStatusDto bizStatusDto = adminService.getBizStatus(bizApprovalDto.getBiz_status_no());
	                model.addAttribute("bizStatusDto", bizStatusDto);
	                EmpDto empDto = adminService.getEmpInfoByNo(bizApprovalDto.getEmp_no());
	                model.addAttribute("empDto", empDto);
	                model.addAttribute("bizApprovalDto", bizApprovalDto);
	            }
	        }
	    }
		
		model.addAttribute("approvalHistory", approvalHistory);
		model.addAttribute("bizDto", bizDto);

		return "admin/bizDetail";
	}

	@RequestMapping("customerDetail")
	public String customerDetail(Model model, int customer_no) {
		CustomerDto customerDto = adminService.getCustomerByNo(customer_no);
		CustomerPointDto customerPointDto = adminService.getCustomerPoint(customer_no);
		
		List<Map<String, Object>> banHistory = adminService.getBanHistory(customer_no);
		List<Map<String, Object>> coupon = adminService.getCustomerCoupon(customer_no);
		
		
		model.addAttribute("customerPointDto", customerPointDto);
		model.addAttribute("coupon", coupon);
		model.addAttribute("customer_no", customer_no);
		model.addAttribute("banHistory", banHistory);
		model.addAttribute("customerDto", customerDto);
		return "admin/customerDetail";
	}

	@RequestMapping("inquiryList")
	public String csBoard(Model model, @RequestParam(value = "page", defaultValue = "1") int page, String searchWord,
			String searchType) {
		List<Map<String, Object>> list = adminService.getInquirys(page, searchWord, searchType);
		int inquiryCount = adminService.getInquiryCount(searchType, searchWord);
		int recordPerPage = 10;
		int totalInquiry = (int) Math.ceil((double)inquiryCount/recordPerPage);
		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = ((page - 1) / 5 + 1) * 5;

		if (endPage > totalInquiry) {
			endPage = totalInquiry;
		}

		String searchQueryString = "";
		if (searchType != null && searchWord != null) {
			searchQueryString += "&searchType=" + searchType;
			searchQueryString += "&searchWord=" + searchWord;
		}

		model.addAttribute("list", list);
		model.addAttribute("totalPage", totalInquiry);
		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchQueryString", searchQueryString);
		return "admin/inquiryList";
	}

	@RequestMapping("inquiryReply")
	public String reply(HttpSession session, Model model, int cs_inquiry_no) {
		Map<String, Object> map = adminService.getInquiryByNo(cs_inquiry_no);
		model.addAttribute("map", map);
		return "admin/inquiryReply";
	}

	@RequestMapping("writeReply")
	public String writeReply(HttpSession session, int cs_inquiry_no, CsInquiryReplyDto params) {
		EmpDto sessionUser = (EmpDto) session.getAttribute("sessionUser");
		int emp_no = sessionUser.getEmp_no();
		params.setEmp_no(emp_no);
		params.setCs_inquiry_no(cs_inquiry_no);
		adminService.replyInquiryByEmp(params);
		adminService.changeInquiryStatus(cs_inquiry_no);
		return "redirect:./inquiryList";
	}

	@RequestMapping("banCustomer")
	public String banCustomer(HttpSession session, CustomerBanDto params,
								@RequestParam("buttonType") String buttonType) {
		EmpDto empDto = (EmpDto) session.getAttribute("sessionUser");
		params.setEmp_no(empDto.getEmp_no());

		if (buttonType.equals("thereDays")) {
			adminService.banCustomerThreeDays(params);
		} else {
			adminService.banCustomerForever(params);
		}
		return "redirect:./customerDetail?customer_no=" + params.getCustomer_no();
	}



//	@RequestMapping("orderList")
//	public String orders(Model model) {
//		List<Map<String, Object>> orders = adminService.getOrderList();
//		model.addAttribute("orders", orders);
//		
//		return "admin/orderList";
//	}
	
	@RequestMapping("settlementList")
	public String settlement(Model model,HttpSession session) {
		EmpDto empDto = (EmpDto)session.getAttribute("sessionUser");
		
		List<Map<String, Object>> list = adminService.getSettleRequest();
		model.addAttribute("list", list);
		model.addAttribute("empDto", empDto);
		return "admin/settlementList";
	}
	
	@RequestMapping("settlementHandle")
	public String settlementHandle(int settlement_request_no, HttpSession session, Model model) {
		Map<String, Object> map = adminService.getSettlementRequestByNo(settlement_request_no);
		
		model.addAttribute("map", map);
		
		return "admin/settlementHandle";
	}
	
	@RequestMapping("settlementProcess")
	public String settlementProcess(SettlementProcessDto params, 
									MultipartFile evidence) {
		
		if (evidence != null) {
			String rootFolder = "C:/uploadFiles/evidence/";
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());
			
			File targetFolder = new File(rootFolder + today);
			if (!targetFolder.exists()) {
				targetFolder.mkdirs();
			}
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();
			
			String originalFileName = evidence.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = today + "/" + fileName + ext;
			try {
				evidence.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			params.setSettlement_process_evidence(saveFileName);
		}
		adminService.settlementProcess(params);
		return "redirect:./settlement";
	}
	
	@RequestMapping("showDogPostList")
	public String showDogPost(Model model) {
		List<Map<String, Object>> list = adminService.getShowDogList();
		model.addAttribute("list", list);
		return "admin/showDogPostList";
	}
	
	@RequestMapping("showDogPostDetail")
	public String showDogPostDetail(int show_dog_post_no, Model model) {
		Map<String, Object> map = adminService.getShowDogDetail(show_dog_post_no);
		List<Map<String, Object>> list = adminService.getShowDogComment(show_dog_post_no);
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		return "admin/showDogPostDetail";
	}
	
	@RequestMapping("coupon")
	public String coupon() {
		return "admin/coupon";
	}
	
	@RequestMapping("reportList")
	public String reportList() {
		return "admin/reportList";
	}
	
	@RequestMapping("orderDetail")
	public String orderDetail() {
		return "admin/orderDetail";
	}
	
	@RequestMapping("bizApprovalList")
	public String bizApprovalList(Model model) {
		List<Map<String, Object>> list = adminService.getBizApprovalRequest();
		model.addAttribute("list", list);
		return "admin/bizApprovalList";
	}
	
	@RequestMapping("bizApproval")
	public String bizApproval(HttpSession session, BizApprovalDto bizApprovalDto, BizApprovalRequestDto params,
			@RequestParam("buttonType") String buttonType) {

		EmpDto empDto = (EmpDto) session.getAttribute("sessionUser");

		BizApprovalRequestDto bizApprovalRequestDto = adminService.getBizApprovalRequestByNo(params.getBiz_approval_request_no());
		int biz_no = bizApprovalRequestDto.getBiz_no();
		bizApprovalDto.setEmp_no(empDto.getEmp_no());
		bizApprovalDto.setBiz_approval_request_no(bizApprovalRequestDto.getBiz_approval_request_no());

		if (buttonType.equals("accept")) {
			adminService.confirmApproval(bizApprovalDto, biz_no);
		} else {
			adminService.rejectApproval(bizApprovalDto, biz_no);
		}
		return "redirect:./bizApprovalList";
	}
}
