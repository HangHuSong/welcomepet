package com.bubble.welcomepet.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.admin.service.AdminServiceImpl;
import com.bubble.welcomepet.dto.SettlementProcessDto;

@RestController
@RequestMapping("/admin/*")
public class RestAdminController {
	
	@Autowired
	private AdminServiceImpl adminService;
	
	@RequestMapping("getBizList")
	public Map<String, Object> getBizList(){
		Map<String, Object> map = new HashMap<>();
		map.put("bizList", adminService.getAllBiz());
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("getBizDetail")
	public Map<String, Object> getBizDetail(int biz_no){
		Map<String, Object> map = new HashMap<>();
		map.put("bizDto", adminService.getBizByNo(biz_no));
		map.put("bizStatus", adminService.getBizStatusByBizNo(biz_no));
		return map;
	}
	
	@RequestMapping("getSettlementRequest")
	public Map<String, Object> getSettlementRequest(int settlement_request_no){
		Map<String, Object> map = new HashMap<>();
		map.put("settlementRequest", adminService.getSettlementRequestByNo(settlement_request_no));
		
		return map;
	}
	
	@RequestMapping("getSettlementRequestList")
	public Map<String, Object> getSettlementRequestList(){
		Map<String, Object> map = new HashMap<>();
		map.put("settlementRequestList", adminService.getSettleRequest());
		return map;
	}
	
	@RequestMapping("settlementTransfer")
	public Map<String, Object> settlementTransfer(SettlementProcessDto params, MultipartFile evidence){
		Map<String, Object> map = new HashMap<>();
		
		
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
		System.out.println(params);
		adminService.settlementProcess(params);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("getShowDogPostList")
	public Map<String, Object> getShowDogPostList(){
		Map<String, Object> map = new HashMap<>();
		map.put("getShowDogPostList", adminService.getShowDogList());
		return map;
	}
	
	@RequestMapping("getCustomerDetail")
	public Map<String, Object> getCustomerDetail(int customer_no){
		Map<String, Object> map = new HashMap<>();
		map.put("customerDto", adminService.getCustomerByNo(customer_no));
		return map;
	}
}
