package com.bubble.welcomepet.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.ShowDogCommentDto;
import com.bubble.welcomepet.dto.ShowDogPostDto;
import com.bubble.welcomepet.dto.ShowDogPostImagesDto;
import com.bubble.welcomepet.dto.ShowDogPostLikesDto;

public interface ShowDogPostSqlMapper {

	public int createShowDogPostPK();
	
//	게시글 리스트 조회
	public List<ShowDogPostDto> getAllList();

//	조회수
	public int increaseViewByPostNo(int show_dog_post_no);
	
//	새 글쓰기
	public void insertShowDogPostContent(ShowDogPostDto showDogPostDto);
//	이미지 업로드
	public void insertPostImages(ShowDogPostImagesDto showDogPostImagesDto);

//	상세 글보기
	public ShowDogPostDto findByPostNo(int show_dog_post_no);
//	업로드한 이미지 보이기
	public List<ShowDogPostImagesDto> findImagesByPostId(int show_dog_post_no);
	
//	insert 좋아요
	public void insertLike(ShowDogPostLikesDto showDogPostLikesDto);
	
//	@Param("customer_no") int customer_no, @Param("show_dog_post_no") int show_dog_post_no : 파라미터 여러개 넘기고 싶을때
//	좋아요 중복금지: 좋아요 했나?
	public int findLikeByCustNo(ShowDogPostLikesDto showDogPostLikesDto);
//	좋아요 중복금지: 중복 삭제
	public void deleteDupliLike(ShowDogPostLikesDto showDogPostLikesDto);
//	좋아요 수
	public int findLikeByNo(int show_dog_post_no);

//	게시글 삭제
	public void deleteByPostNo(int show_dog_post_no);
//	게시글 수정
	public void updateByPostNo(ShowDogPostDto showDogPostDto);
//	게시글 수정 - 이미지
    /*기존 이미지 지우기*/
	public void updateImagesByDelete(int show_dog_post_no);

//	이미지 있나
	public int countImageByPostNo(int show_dog_post_no);
//	public ShowDogPostImagesDto selectByImagesNo(int show_dog_post_images_no);
//	public void updateByPostImagesNo(ShowDogPostImagesDto showDogPostImagesDto);

//	반려견 자랑게시글 댓글작성	
	public void insertShowDogPostComment(ShowDogCommentDto showDogCommentDto);

//	댓글 리스트 보이기
	public List<ShowDogCommentDto> findComment(@Param("show_dog_post_no") int show_dog_post_no);

//	댓글 등록순 정렬
//	public void orderCommentByASC();
//	댓글 최신순 정렬
//	public void orderCommentByDesc();
	
//	댓글수(count)
	public int countCommentByPostNo(int show_dog_post_no);
//	public int getCommentCountByPostNo(int show_dog_post_no);
//	댓글 삭제하기
	public void deleteByCommentNo(int show_dog_comment_no);
	
//	베스트3 글
	public List<ShowDogPostDto> chooseBestList();


	



	
	






}
