package com.bubble.welcomepet.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bubble.welcomepet.community.service.CommunityServiceImpl;

@RestController
@RequestMapping()
public class AjaxRestControllerForCommunity {
	@Autowired
	private CommunityServiceImpl communityServiceImpl;
	
//	@RequestMapping()

}
