package com.bubble.welcomepet.snap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.DogDto;
import com.bubble.welcomepet.dto.SnapBoardCommentDto;
import com.bubble.welcomepet.dto.SnapBoardDto;
import com.bubble.welcomepet.dto.SnapBoardLikesDto;
import com.bubble.welcomepet.dto.SnapImagesDto;

public interface SnapSqlMapper {

	public List<DogDto> getCustomerDogList(int customer_no);

	public int createPk();

	public void postSnap(SnapBoardDto params);

	public void insertSnapImage(SnapImagesDto snapImagesDto);

	public List<SnapBoardDto> getSnapList();

	public DogDto getSnapDogByDogNo(int dog_no);

	public List<SnapImagesDto> getSnapImagesBySnapBoardNo(int snap_board_no);

	public int countLikeBySnapBoardNo(int snap_board_no);

	public void snapLikeByCustomer(SnapBoardLikesDto snapBoardLikesDto);
	
	public void snapUnLikeByCustomer(SnapBoardLikesDto snapBoardLikesDto);

	public int checkLike(SnapBoardLikesDto snapBoardLikesDto);

	public SnapBoardDto getSnapBySnapBoardNo(int snap_board_no);

	public void snapComment(SnapBoardCommentDto params);

	public List<SnapBoardCommentDto> getSnapCommentsBySnapBoardNo(int snap_board_no);

	public CustomerDto getCustomerByNo(int customer_no);

	public void snapViewCount(int snap_board_no);

	public List<SnapBoardDto> getSnapByDogNo(int dog_no);

	public DogDto getDogBySnapBoardNo(int snap_board_no);



}
