package com.bubble.welcomepet.community.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bubble.welcomepet.community.service.CommunityServiceImpl;

@RestController
@RequestMapping("bringCommentByPostNo")
public class AjaxRestControllerForCommunity {
	@Autowired
	private CommunityServiceImpl communityServiceImpl;
	
	@RequestMapping("getCommentList")
	public Map<String, Object> getCommentListAjax(int show_dog_post_no){
		Map<String, Object> map = new HashMap<>();
		
		map.put("commentList", communityServiceImpl.bringCommentByPostNo(show_dog_post_no));
		return map;
	}
	
	
}
