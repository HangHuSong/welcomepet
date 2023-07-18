package com.bubble.welcomepet.pointprod.mapper;

import java.util.List;

import com.bubble.welcomepet.dto.BoardDto;
import com.bubble.welcomepet.dto.CommentDto;
import com.bubble.welcomepet.dto.ImageDto;
import com.bubble.welcomepet.dto.LikeDto;
import com.bubble.welcomepet.dto.PointProdDto;
import com.bubble.welcomepet.dto.PointProdImgDto;
import com.bubble.welcomepet.dto.Prod_CategoryDto;

public interface PointProdSqlMapper {
	
	public void insertComment(CommentDto commentDto);

	public List<CommentDto> getAllCommentByBoardId(int board_no);
	
	public int createPk();

	public BoardDto selectById(int board_no);

	public void insert(BoardDto boardDto);

	public List<BoardDto> selectAll();

	/* 베스트3 */
	public List<BoardDto> selectBest();

	public void increaseReadCount(int board_no);

	public void deleteById(int board_no);

	public void update(BoardDto boardDto);

	public Prod_CategoryDto selectByCategoryNo(int board_category_no);

	public int countCommentByBoardNo(int board_no); /* 댓글수 */

	public void insertLike(LikeDto likeDto); /* 좋아요 */

	public int countLikeByBoardNo(int board_no);

	public int howManyLikeByCustomerNo(LikeDto likeDto);

	public void deleteLikeByCustomerNo(LikeDto likeDto);

	// 이미지 등록
	public void insertImage(ImageDto imageDto);

	public List<ImageDto> selectImageByBoardNo(int board_no);


	public int createPk1();
	
	public PointProdDto selectByPointProdNo(int point_product_no);
	
	public void insPointProd(PointProdDto pointProdDto);
	
	public List<PointProdDto> selectAllPointProd();

	public void insPointProdImg(PointProdImgDto pointProdImgDto);

	public List<PointProdImgDto> selectImgByPointProdNo(int point_product_no);

	/* public void insPointProdOrd(PointProdOrdDto pointProdOrdDto); */

}
