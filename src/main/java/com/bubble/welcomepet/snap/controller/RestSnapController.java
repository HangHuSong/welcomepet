package com.bubble.welcomepet.snap.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.SnapBoardCommentDto;
import com.bubble.welcomepet.dto.SnapBoardLikesDto;
import com.bubble.welcomepet.snap.service.SnapServiceImpl;

@RestController
@RequestMapping("/snap/*")
public class RestSnapController {

	@Autowired
	private SnapServiceImpl snapService;
	
	@RequestMapping("getSnapCommentList")
	public Map<String, Object> getSnapCommentList(int snap_board_no){
		Map<String, Object> map = new HashMap<>();
		map.put("commentList", snapService.getSnapCommentsBySnapBoardNo(snap_board_no));
		return map;
	}
	
	@RequestMapping("getMyId")
	public Map<String, Object> getMyId(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		if (customerUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인 후 이용해주세요");
		} else {
			map.put("result", "success");
			map.put("customer_no", customerUser.getCustomer_no());
		}
		return map;
	}
	
	@RequestMapping("registComment")
	public Map<String, Object> snapComment(HttpSession session,SnapBoardCommentDto params){
		Map<String, Object> map = new HashMap<>();
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		params.setCustomer_no(customerUser.getCustomer_no());
		snapService.snapComment(params);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("getSnapList")
	public Map<String, Object> getSnapList(HttpSession session){
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		Map<String, Object> map = new HashMap<>();	
		map.put("list", snapService.getSnapList(customer_no));
		return map;
	}
	
	@RequestMapping("restSnapLike")
	public Map<String, Object> restSnapLike(HttpSession session, int snap_board_no){
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		snapService.snapLike(snapBoardLikesDto);
		Map<String, Object> map = new HashMap<>();
		map.put("status", "success");
		return map;
	}
	
	@RequestMapping("restSnapUnLike")
	public Map<String, Object> restSnapUnLike(HttpSession session, int snap_board_no){
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		snapService.snapUnLike(snapBoardLikesDto);
		Map<String, Object> map = new HashMap<>();
		map.put("status", "success");
		return map;
	}
	
	@RequestMapping("getSnapDetail")
	public Map<String, Object> getSnapDetail(int snap_board_no,HttpSession session){
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("countLike", snapService.countLike(snap_board_no));
		map.put("snapDetail", snapService.getSnapBySnapBoardNo(snap_board_no));
		map.put("snapImgs", snapService.getSnapImgsBySnapBoardNo(snap_board_no));
		map.put("checkLike", snapService.checkLike(snapBoardLikesDto));
		map.put("commentList", snapService.getSnapCommentsBySnapBoardNo(snap_board_no));
		map.put("dogDto", snapService.getDogBySnapBoardNo(snap_board_no));
		map.put("status", "success");
		return map;
	}
}
