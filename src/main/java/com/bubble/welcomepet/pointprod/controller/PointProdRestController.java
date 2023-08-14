package com.bubble.welcomepet.pointprod.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bubble.welcomepet.dto.BoardDto;
import com.bubble.welcomepet.pointprod.service.PointProdServiceImpl;

// 만약 여러분이 게시판의 백엔드 개발자라면...!! 
// RestApi를 만드는 것이 핵심... 화면은 우리가 알바 아니다.
// 요청이 들어왔을때...(단, 요청은 App이건, 웹이건 우리가 알바 아니다)

// 게시판 기준으로 하나의 예를 들어서 특정글 상세 내용 요청시...

@RestController // JSP로 포워딩 X -> HTML을 출력하는것이 아니라 JSON으로 출력 -> 데이터만 준다. 나머지는 프론트엔드가 알아서 할일이다.
@RequestMapping("/api/v1/user/board/*")
public class PointProdRestController {

	@Autowired
	private PointProdServiceImpl pointProdService;
	
	
	@RequestMapping("getDetailData")
	public Map<String, Object> getDetailData(int board_no, String order){
		Map<String, Object> result = new HashMap<String, Object>();

		pointProdService.increaseReadCount(board_no);

		Map<String, Object> map = pointProdService.getBoard(board_no);

		//model.addAttribute("data", map);// 글 불러오기
		result.put("data", map);
		
		
		List<Map<String, Object>> list = pointProdService.getCommentById(board_no, order);

		//model.addAttribute("commentList", list);// 댓 불러오기
		result.put("commentList", list);

		// 댓글 카운트
		int countCommentByBoardNo = pointProdService.countCommentByBoardNo(board_no);
		//model.addAttribute("countCommentByBoardNo", countCommentByBoardNo);
		result.put("countCommentByBoardNo", countCommentByBoardNo);
		
		
		// 좋아요 카운트
		int countLikeByBoardNo = pointProdService.countLikeByBoardNo(board_no);
		//model.addAttribute("countLikeByBoardNo", countLikeByBoardNo);
		result.put("countLikeByBoardNo", countLikeByBoardNo);
		// 좋아요했는지

		
		return result;
	}
	
}
