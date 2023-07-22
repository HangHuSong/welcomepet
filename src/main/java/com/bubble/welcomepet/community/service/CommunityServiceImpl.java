package com.bubble.welcomepet.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bubble.welcomepet.community.mapper.ShowDogPostSqlMapper;

import com.bubble.welcomepet.customer.mapper.CustomerSqlMapper;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.DogDto;
import com.bubble.welcomepet.dto.ShowDogCommentDto;
import com.bubble.welcomepet.dto.ShowDogPostDto;
import com.bubble.welcomepet.dto.ShowDogPostImagesDto;
import com.bubble.welcomepet.dto.ShowDogPostLikesDto;


@Service
public class CommunityServiceImpl {

	@Autowired
	private CustomerSqlMapper customerSqlMapper;
	
	@Autowired
	private ShowDogPostSqlMapper showDogPostSqlMapper;


//	반려견 자랑게시판 첫 화면 불러오기
	public List<Map<String, Object>> getDogPostList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<ShowDogPostDto> showDogPostDtoList= showDogPostSqlMapper.getAllList();
			
			for(ShowDogPostDto showDogPostDto : showDogPostDtoList) {
				Map<String, Object> map = new HashMap<>();
				int customer_no = showDogPostDto.getCustomer_no();
				CustomerDto customerDto = customerSqlMapper.getByCustomerNo(customer_no);
				
				int show_dog_post_no = showDogPostDto.getShow_dog_post_no();
				
//				------------- 업로드한 이미지 보이기 -------------
				List<ShowDogPostImagesDto> postImageDtoList = showDogPostSqlMapper.findImagesByPostId(show_dog_post_no);
//				댓글 수 
				int countComment = showDogPostSqlMapper.countCommentByPostNo(show_dog_post_no);
//				이미지 유무
				int checkImg=showDogPostSqlMapper.countImageByPostNo(show_dog_post_no);
				
//				댓글 수
				map.put("countComment", countComment);
//				이미지 유무
				map.put("checkImg", checkImg);
//				썸네일 불러오기
				map.put("postImageDtoList", postImageDtoList);
				
				map.put("showDogPostDto", showDogPostDto);				
				map.put("customerDto", customerDto);
				
				list.add(map);
			}
		return list;
	}
	
//	댓글 수(count)
	public int countCommentByPostNo(int show_dog_post_no) {
		int countCommentByNo = showDogPostSqlMapper.countCommentByPostNo(show_dog_post_no);
		
		System.out.println("댓글개수 세기(service): " + countCommentByNo);
		return countCommentByNo;
	}
	
	
//	조회수 올리기
	public void increaseView(int show_dog_post_no) {
		showDogPostSqlMapper.increaseViewByPostNo(show_dog_post_no);
	}

//	새 글쓰기 insert											 ------------ 이미지 업로드 때문에 추가 ------------
	public void showDogUpload(ShowDogPostDto showDogPostDto, List<ShowDogPostImagesDto> postImageDtoList) {
		
		System.out.println("@서비스 작동 " + showDogPostDto);
		
		int show_dog_post_no = showDogPostSqlMapper.createShowDogPostPK();
		
		showDogPostDto.setShow_dog_post_no(show_dog_post_no);
		showDogPostSqlMapper.insertShowDogPostContent(showDogPostDto);
		
		/* 이미지 업로드 */
		for(ShowDogPostImagesDto showDogPostImagesDto : postImageDtoList) {
			showDogPostImagesDto.setShow_dog_post_no(show_dog_post_no);
			showDogPostSqlMapper.insertPostImages(showDogPostImagesDto);
		}
	}
	

//	상세글 보기
	public Map<String, Object> bringShowDogPost(int show_dog_post_no) {
		Map<String, Object> map = new HashMap<>();
		
		ShowDogPostDto showDogPostDto = showDogPostSqlMapper.findByPostNo(show_dog_post_no);
		CustomerDto customerDto = customerSqlMapper.getByCustomerNo(showDogPostDto.getCustomer_no());
		
//		------------- 업로드한 이미지 보이기 -------------
		List<ShowDogPostImagesDto> postImageDtoList = showDogPostSqlMapper.findImagesByPostId(show_dog_post_no);
		
		map.put("showDogPostDto", showDogPostDto);
		map.put("customerDto", customerDto);
		map.put("postImageDtoList", postImageDtoList);
		
		return map;
	}
	
	
//	insert 좋아요
	public void insertLike(ShowDogPostLikesDto showDogPostLikesDto) {
		// 만약 내가 좋아요를 했는지 확인...
		int checkWhetherLike = showDogPostSqlMapper.findLikeByCustNo(showDogPostLikesDto);
		System.out.println(checkWhetherLike);
		
		if(checkWhetherLike > 0) {
//			좋아요를 했으면... DELETE
			showDogPostSqlMapper.deleteDupliLike(showDogPostLikesDto);
		} else
//		 	좋아요를 안했으면... 
			showDogPostSqlMapper.insertLike(showDogPostLikesDto);
	}
	
//	좋아요 있나 체크
	public int checkWhetherLike(ShowDogPostLikesDto showDogPostLikesDto) {
		int checkWhetherLike = showDogPostSqlMapper.findLikeByCustNo(showDogPostLikesDto);
		return checkWhetherLike;
	}
	
//	좋아요(count)
	public int bringLikeByPostNo(int show_dog_post_no) {
		
		int showDogPostLikes = showDogPostSqlMapper.findLikeByNo(show_dog_post_no);	
		
		return showDogPostLikes;
	}
	
	
//	게시글 삭제
	public void deletePost(int show_dog_post_no) {
		showDogPostSqlMapper.deleteByPostNo(show_dog_post_no);	
	}

//	게시글 수정 											,List<ShowDogPostImagesDto> postImageDtoList
	public void updatePost(ShowDogPostDto showDogPostDto) {
		
		int show_dog_post_no = showDogPostSqlMapper.createShowDogPostPK();
		
		showDogPostSqlMapper.updateByPostNo(showDogPostDto);
//		showDogPostSqlMapper.updateImagesByDelete(show_dog_post_no);
		
		/* 이미지 삭제 후 업로드(수정) */
//		for(ShowDogPostImagesDto showDogPostImagesDto : postImageDtoList) {
//			showDogPostImagesDto.setShow_dog_post_no(show_dog_post_no);
//			showDogPostSqlMapper.insertPostImages(showDogPostImagesDto);
//		}
		System.out.println("이미지 들어감? ");
	}
	
	
//	댓글 작성하기
	public void insertComment(ShowDogCommentDto showDogCommentDto) {
		showDogPostSqlMapper.insertShowDogPostComment(showDogCommentDto);
	}
	
//	댓글리스트 보이기
	public List<Map<String, Object>> bringCommentByPostNo(int show_dog_post_no) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<ShowDogCommentDto> showPostCommentList = showDogPostSqlMapper.findComment(show_dog_post_no);
		
		for(ShowDogCommentDto showDogCommentDto : showPostCommentList) {
			Map<String, Object> map = new HashMap<>();
			
			int customer_no = showDogCommentDto.getCustomer_no();
			
			CustomerDto customerDto = customerSqlMapper.getByCustomerNo(customer_no);
			
//			댓글 정렬 orderCommentByASC orderCommentByDesc
			 					 /* asc: 오래된순 */
//			showDogPostSqlMapper.orderCommentByASC();
								 /* desc: 최근순 */
//			showDogPostSqlMapper.orderCommentByDesc();
			
			map.put("showDogCommentDto", showDogCommentDto);
			map.put("customerDto", customerDto);
			
			list.add(map);
		}
		return list;
	}
	
//	댓글 삭제
//	public void deleteComment(int show_dog_post_no) {
//		System.out.println("서비스에서:" + show_dog_post_no);
//		
//		showDogPostSqlMapper.deleteByCommentNo(show_dog_post_no);
//	}

//	자랑게시판 상위 3개 글
	public List<Map<String, Object>> getBestPostList() {
		
		List<Map<String, Object>> bestList = new ArrayList<>();
		
		List<ShowDogPostDto> showDogPostDtoList= showDogPostSqlMapper.chooseBestList();
			
			for(ShowDogPostDto showDogPostDto : showDogPostDtoList) {
				Map<String, Object> map = new HashMap<>();
				int customer_no = showDogPostDto.getCustomer_no();
				CustomerDto customerDto = customerSqlMapper.getByCustomerNo(customer_no);
				
				int show_dog_post_no = showDogPostDto.getShow_dog_post_no();
				
//				댓글 수 
				int countComment = showDogPostSqlMapper.countCommentByPostNo(show_dog_post_no);		
//				이미지 유무
				int checkImg=showDogPostSqlMapper.countImageByPostNo(show_dog_post_no);
				
			
//				댓글 수
				map.put("countComment", countComment);
//				이미지 유무
				map.put("checkImg", checkImg);
				map.put("showDogPostDto", showDogPostDto);
				map.put("customerDto", customerDto);
				
				bestList.add(map);
			}
		return bestList;
	}

	




	

///////////////////////////////////////////////////////////////////////////////////////////	






	

}
