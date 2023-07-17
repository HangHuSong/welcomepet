package com.bubble.welcomepet.snap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.DogDto;
import com.bubble.welcomepet.dto.SnapBoardCommentDto;
import com.bubble.welcomepet.dto.SnapBoardDto;
import com.bubble.welcomepet.dto.SnapBoardLikesDto;
import com.bubble.welcomepet.dto.SnapImagesDto;
import com.bubble.welcomepet.snap.mapper.SnapSqlMapper;

@Service
public class SnapServiceImpl {
	
	@Autowired
	private SnapSqlMapper snapSqlMapper;

	public List<Map<String, Object>> getCustomerDogInfo(int customer_no) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<DogDto> dogList = snapSqlMapper.getCustomerDogList(customer_no);
		for (DogDto dogDto : dogList) {
			Map<String, Object> map = new HashMap<>();
			map.put("dogDto", dogDto);
			list.add(map);
		}
		return list;
	}

	// 스냅 글 작성
	public void postSnap(SnapBoardDto params, List<SnapImagesDto> snapImgList) {
		int snap_board_no = snapSqlMapper.createPk();
		params.setSnap_board_no(snap_board_no);
		snapSqlMapper.postSnap(params);
		for (SnapImagesDto snapImagesDto : snapImgList) {
			snapImagesDto.setSnap_board_no(snap_board_no);
			snapSqlMapper.insertSnapImage(snapImagesDto);
		}
	}

	public List<Map<String, Object>> getSnapList(int customer_no) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<SnapBoardDto> snapList = snapSqlMapper.getSnapList();
		
		for (SnapBoardDto snapBoardDto : snapList) {
			Map<String, Object> map = new HashMap<>();
			int dog_no = snapBoardDto.getDog_no();
			DogDto dogDto = snapSqlMapper.getSnapDogByDogNo(dog_no);
			int snap_board_no = snapBoardDto.getSnap_board_no();
			int countLike = snapSqlMapper.countLikeBySnapBoardNo(snap_board_no);
			SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
			snapBoardLikesDto.setCustomer_no(customer_no);
			snapBoardLikesDto.setSnap_board_no(snap_board_no);
			int checkLike = snapSqlMapper.checkLike(snapBoardLikesDto);
			map.put("snapBoardDto", snapBoardDto);
			map.put("dogDto", dogDto);
			map.put("countLike", countLike);
			map.put("checkLike", checkLike);
			list.add(map);
		}
		
		return list;
	}

	public void snapLike(SnapBoardLikesDto snapBoardLikesDto) {		
		snapSqlMapper.snapLikeByCustomer(snapBoardLikesDto);
	}

	public void snapUnLike(SnapBoardLikesDto snapBoardLikesDto) {
		snapSqlMapper.snapUnLikeByCustomer(snapBoardLikesDto);
	}

	public List<Map<String, Object>> getSnapImgsBySnapBoardNo(int snap_board_no) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<SnapImagesDto> imgList = snapSqlMapper.getSnapImagesBySnapBoardNo(snap_board_no);
		for (SnapImagesDto snapImagesDto : imgList) {
			Map<String, Object> map = new HashMap<>();
			map.put("snapImagesDto", snapImagesDto);
			list.add(map);
		}
		return list;
	}

	public SnapBoardDto getSnapBySnapBoardNo(int snap_board_no) {
		
		return snapSqlMapper.getSnapBySnapBoardNo(snap_board_no);
	}

	// 스냅 댓글 작성
	public void snapComment(SnapBoardCommentDto params) {
		snapSqlMapper.snapComment(params);
	}

	// 스냅의 댓글 목록 가져오기
	public List<Map<String, Object>> getSnapCommentsBySnapBoardNo(int snap_board_no) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<SnapBoardCommentDto> commentList = snapSqlMapper.getSnapCommentsBySnapBoardNo(snap_board_no);
		for (SnapBoardCommentDto snapBoardCommentDto : commentList) {
			int customer_no = snapBoardCommentDto.getCustomer_no();
			CustomerDto customerDto = snapSqlMapper.getCustomerByNo(customer_no);
			Map<String, Object> map = new HashMap<>();
			map.put("snapBoardCommentDto", snapBoardCommentDto);
			map.put("customerDto", customerDto);
			list.add(map);
		}
		return list;
	}
	// 조회수 증가
	public void viewCount(int snap_board_no) {
		snapSqlMapper.snapViewCount(snap_board_no);
	}

	public DogDto getDogByDogNo(int dog_no) {
		return snapSqlMapper.getSnapDogByDogNo(dog_no);
	}

	public List<SnapBoardDto> getSnapByDogNo(int dog_no) {
		return snapSqlMapper.getSnapByDogNo(dog_no);
	}

	public int countLike(int snap_board_no) {
		return snapSqlMapper.countLikeBySnapBoardNo(snap_board_no);
	}

	public int checkLike(SnapBoardLikesDto snapBoardLikesDto) {
		return snapSqlMapper.checkLike(snapBoardLikesDto);
	}

	public DogDto getDogBySnapBoardNo(int snap_board_no) {
		return snapSqlMapper.getDogBySnapBoardNo(snap_board_no);
	}
}
