package com.bubble.welcomepet.pointprod.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*import com.bubble.welcomepet.customer.mapper.CustomerSqlMapper;*/
import com.bubble.welcomepet.dto.BoardDto;
import com.bubble.welcomepet.dto.CommentDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.ImageDto;
import com.bubble.welcomepet.dto.LikeDto;
import com.bubble.welcomepet.dto.PointProdDto;
import com.bubble.welcomepet.dto.PointProdImgDto;
import com.bubble.welcomepet.dto.PointProdOrdDto;
import com.bubble.welcomepet.dto.PointProdCategoryDto;
import com.bubble.welcomepet.pointprod.mapper.PointProdSqlMapper;

@Service
public class PointProdServiceImpl {

	@Autowired
	private PointProdSqlMapper pointProdSqlMapper;

	/*
	 * @Autowired private CustomerSqlMapper customerSqlMapper;
	 */

	public void insertComment(CommentDto commentDto) {

		pointProdSqlMapper.insertComment(commentDto);

	}

	public List<Map<String, Object>> getCommentById(int board_no, String order) {

		List<Map<String, Object>> list = new ArrayList<>();

		
		List<CommentDto> commentDtoList = pointProdSqlMapper.getAllCommentByBoardId(board_no, order);

		for (CommentDto commentDto : commentDtoList) {

			Map<String, Object> map = new HashMap<>();

			int customer_no = commentDto.getCustomer_no();

			CustomerDto customerDto = pointProdSqlMapper.selectCustomerByCustomerNo(customer_no);
			
			// BoardDto를 CommentDto로 수정하여 사용한다고 가정합니다.
			String board_comment_content = commentDto.getBoard_comment_content();
			board_comment_content = StringEscapeUtils.escapeHtml4(board_comment_content);
			board_comment_content = board_comment_content.replaceAll("\n", "<br>");
			commentDto.setBoard_comment_content(board_comment_content);

			map.put("customerDto", customerDto);
			map.put("commentDto", commentDto);

			list.add(map);
		}
		return list;
	}

	public void writeContent(BoardDto boardDto, List<ImageDto> imageDtoList) {
		int board_no = pointProdSqlMapper.createPk();

		boardDto.setBoard_no(board_no);
		pointProdSqlMapper.insert(boardDto);

		for (ImageDto imageDto : imageDtoList) {
			imageDto.setBoard_no(board_no);
			pointProdSqlMapper.insertImage(imageDto);
		}
	}

	public List<Map<String, Object>> getBoardList() {

		List<Map<String, Object>> list = new ArrayList<>();

		List<BoardDto> boardDtoList = pointProdSqlMapper.selectAll();

		for (BoardDto boardDto : boardDtoList) {

			Map<String, Object> map = new HashMap<>();

			int customer_no = boardDto.getCustomer_no();

			int board_no = boardDto.getBoard_no();

			CustomerDto customerDto = pointProdSqlMapper.selectCustomerByCustomerNo(customer_no);
			
			PointProdCategoryDto pointProdCategoryDto = pointProdSqlMapper.selectByCategoryNo(boardDto.getBoard_category_no());

			// 댓글 카운트

			int countComment = pointProdSqlMapper.countCommentByBoardNo(board_no);
			
			int countLike = pointProdSqlMapper.countLikeByBoardNo(board_no);

			List<ImageDto> imageDtoList = pointProdSqlMapper.selectImageByBoardNo(board_no);

			map.put("customerDto", customerDto);
			map.put("boardDto", boardDto);
			map.put("countComment", countComment);
			map.put("imageDtoList", imageDtoList);
			map.put("countLike", countLike);
			map.put("pointProdCategoryDto", pointProdCategoryDto);

			list.add(map);
		}

		return list;
	}

	/* 베스트3 */
	public List<Map<String, Object>> getBoardList2() {

		List<Map<String, Object>> list2 = new ArrayList<>();

		List<BoardDto> boardDtoList2 = pointProdSqlMapper.selectBest();

		for (BoardDto boardDto : boardDtoList2) {

			Map<String, Object> map = new HashMap<>();

			int customer_no = boardDto.getCustomer_no();

			int board_no = boardDto.getBoard_no();

			CustomerDto customerDto = pointProdSqlMapper.selectCustomerByCustomerNo(customer_no);

			// 댓글 카운트

			int countComment = pointProdSqlMapper.countCommentByBoardNo(board_no);

			map.put("customerDto", customerDto);
			map.put("boardDto", boardDto);
			map.put("countComment", countComment);

			list2.add(map);
		}

		return list2;
	}

	public Map<String, Object> getBoard(int board_no) {

		Map<String, Object> map = new HashMap<>();

		BoardDto boardDto = pointProdSqlMapper.selectById(board_no);
		CustomerDto customerDto = pointProdSqlMapper.selectCustomerByCustomerNo(boardDto.getCustomer_no());
		PointProdCategoryDto pointProdCategoryDto = pointProdSqlMapper.selectByCategoryNo(boardDto.getBoard_category_no());

		List<ImageDto> imageDtoList = pointProdSqlMapper.selectImageByBoardNo(board_no);

		map.put("customerDto", customerDto);
		map.put("boardDto", boardDto);
		map.put("pointProdCategoryDto", pointProdCategoryDto);
		map.put("imageDtoList", imageDtoList);

		return map;
	}

	public void increaseReadCount(int board_no) {
		pointProdSqlMapper.increaseReadCount(board_no);
	}

	public void deleteContent(int board_no) {
		pointProdSqlMapper.deleteById(board_no);
	}

	public void updateContent(BoardDto boardDto) {
		pointProdSqlMapper.update(boardDto);
	}

	public int countCommentByBoardNo(int board_no) {
		int countCommentByBoardNo = pointProdSqlMapper.countCommentByBoardNo(board_no);
		return countCommentByBoardNo;
	}

	public void insertLike(LikeDto likeDto) {

		int howManyLikeByCustomerNo = pointProdSqlMapper.howManyLikeByCustomerNo(likeDto);

		if (howManyLikeByCustomerNo > 0) {
			pointProdSqlMapper.deleteLikeByCustomerNo(likeDto);
		} else
			pointProdSqlMapper.insertLike(likeDto);
	}

	public int countLikeByBoardNo(int board_no) {
		int countLikeByBoardNo = pointProdSqlMapper.countLikeByBoardNo(board_no);
		return countLikeByBoardNo;
	}

	public void writePointProd(PointProdDto pointProdDto, List<PointProdImgDto> pointProdImgDtoList) {
		int point_product_no = pointProdSqlMapper.createPk1();

		pointProdDto.setPoint_product_no(point_product_no);
		pointProdSqlMapper.insPointProd(pointProdDto);

		for (PointProdImgDto pointProdImgDto : pointProdImgDtoList) {
			pointProdImgDto.setPoint_product_no(point_product_no);
			System.out.println("하하하하!!!!");
			pointProdSqlMapper.insPointProdImg(pointProdImgDto);
		}
	}

	public List<Map<String, Object>> getPointProdList() {

		List<Map<String, Object>> list = new ArrayList<>();

		List<PointProdDto> pointProdDtoList = pointProdSqlMapper.selectAllPointProd();

		for (PointProdDto pointProdDto : pointProdDtoList) {

			Map<String, Object> map = new HashMap<>();

			int customer_no = pointProdDto.getCustomer_no();

			int point_product_no = pointProdDto.getPoint_product_no();

			// CustomerDto customerDto = customerSqlMapper.selectById(customer_no);
			CustomerDto customerDto = pointProdSqlMapper.selectCustomerByCustomerNo(customer_no);

			List<PointProdImgDto> pointProdImgDtoList = pointProdSqlMapper.selectImgByPointProdNo(point_product_no);

			map.put("customerDto", customerDto);
			map.put("pointProdDto", pointProdDto);
			map.put("pointProdImgDtoList", pointProdImgDtoList);

			list.add(map);
		}

		return list;
	}

	public Map<String, Object> getPointProd(int point_product_no) {

		Map<String, Object> map = new HashMap<>();

		PointProdDto pointProdDto = pointProdSqlMapper.selectByPointProdNo(point_product_no);
		CustomerDto customerDto = pointProdSqlMapper.selectCustomerByCustomerNo(pointProdDto.getCustomer_no());
		List<PointProdImgDto> pointProdImgDtoList = pointProdSqlMapper.selectImgByPointProdNo(point_product_no);

		map.put("pointProdDto", pointProdDto);
		map.put("customerDto", customerDto);
		map.put("pointProdImgDtoList", pointProdImgDtoList);

		return map;
	}

	public void insPointProdOrd(PointProdOrdDto pointProdOrdDto) {
		pointProdSqlMapper.insPointProdOrd(pointProdOrdDto);
	}
}
