package com.bubble.welcomepet.community.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.community.service.CommunityServiceImpl;
import com.bubble.welcomepet.dto.BoardDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.DogDto;
import com.bubble.welcomepet.dto.ShowDogCommentDto;
import com.bubble.welcomepet.dto.ShowDogPostDto;
import com.bubble.welcomepet.dto.ShowDogPostImagesDto;
import com.bubble.welcomepet.dto.ShowDogPostLikesDto;


@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	@Autowired
	private CommunityServiceImpl communityServiceImpl;
	
//	로그인 후 홈화면으로(나중에 삭제)
	@RequestMapping("home")
	public String AfterLoginGoToHome() {
		return "community/home";
	}
	
//	스냅 연결
	@RequestMapping("snap")
	public String showCommunityMain(Model model) {
		
		return "../snap/main";
	}


//	반려견 자랑게시판 - showDogPost
	@RequestMapping("showDogPostList")
	public String showDogPostList(Model model) {
		List<Map<String, Object>> list = communityServiceImpl.getDogPostList();		
		model.addAttribute("list",list);

		List<Map<String, Object>> bestList = communityServiceImpl.getBestPostList();		
		model.addAttribute("bestList",bestList);
		
		return "community/showDogPostList";
	}
	
	
//	게시글 상세보기
	@RequestMapping("showDogPost")
	public String showDogPost(Model model, int show_dog_post_no, HttpSession session, ShowDogPostLikesDto showDogPostLikesDto, 
							  @RequestParam(defaultValue = "recent") String commentOrder){
//	  //고객 세션 불러오기
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser"); 
		
		int customerNo = customerUser.getCustomer_no();
		showDogPostLikesDto.setCustomer_no(customerNo);
//	  //여기까지 고객session 불러오기
		
//		조회수 증가
		communityServiceImpl.increaseView(show_dog_post_no);
//  	사진 불러오는 map		
		Map<String, Object> map = communityServiceImpl.bringShowDogPost(show_dog_post_no);		
		model.addAttribute("postData", map);
//		게시글 enter 적용시키기
		ShowDogPostDto showDogPostDto = (ShowDogPostDto) map.get("showDogPostDto");
		String show_dog_post_content = showDogPostDto.getShow_dog_post_content();
		show_dog_post_content = StringEscapeUtils.escapeHtml4(show_dog_post_content);
		show_dog_post_content = show_dog_post_content.replaceAll("\n", "<br>");
		showDogPostDto.setShow_dog_post_content(show_dog_post_content);
		
//	  //댓글보이기
		List<Map<String, Object>> list = communityServiceImpl.bringCommentByPostNo(show_dog_post_no);
		model.addAttribute("commentData",list);	
		
//		댓글 개수 세기
		int countComment = communityServiceImpl.countCommentByPostNo(show_dog_post_no);
		model.addAttribute("countComment", countComment);
		
//	  //좋아요 개수
		int countLike = communityServiceImpl.bringLikeByPostNo(show_dog_post_no);	
		model.addAttribute("countLike", countLike);
//	  //좋아요 눌렀는지 췤
		int checkWhetherLike = communityServiceImpl.checkWhetherLike(showDogPostLikesDto);
		model.addAttribute("checkWhetherLike", checkWhetherLike);
		
		System.out.println(show_dog_post_no);
//		System.out.println("좋아요 들어갔나: " + checkWhetherLike);
	    
//		좋아요 중복방지
//		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
//		int customer_no = customerUser.getCustomer_no();
//		showDogPostLikesDto.setCustomer_no(customer_no);
		
		return "community/showDogPost";
	}
	
//	좋아요 
	@RequestMapping("doLikeProcess")
	public String dolike(HttpSession session, ShowDogPostLikesDto showDogPostLikesDto) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser"); 
		
		int customerNo = customerUser.getCustomer_no();
		showDogPostLikesDto.setCustomer_no(customerNo);
		
		communityServiceImpl.insertLike(showDogPostLikesDto);
		
		System.out.println("좋아요 정보: " + showDogPostLikesDto);
		
		return "redirect:./showDogPost?show_dog_post_no=" + showDogPostLikesDto.getShow_dog_post_no();
	}
	
		
//	새 글쓰기
	@RequestMapping("showDogUpload")
	public String showDogUpload() {
		return "community/showDogUpload";
	}	
		
	@RequestMapping("showDogUploadProcess")											 /*파일 여러개 받기[배열]*/
	public String doShowDogUpload(HttpSession session, ShowDogPostDto showDogPostDto, MultipartFile[] show_dog_post_images_name) {
		
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
			
		System.out.println("새글쓰기 컨트롤러 서블릿(process) 작동");
		System.out.println(showDogPostDto);
		
//		닉네임 불러오기
		int customer_no = customerUser.getCustomer_no();
		showDogPostDto.setCustomer_no(customer_no);
		
		System.out.println("닉네임 불러옴?: " + showDogPostDto);
		
//		이미지 업로드하기
		List<ShowDogPostImagesDto> postImageDtoList = new ArrayList<>();
		/* 만약 입력된것이 없으면 for문 반복하기 */
		if(show_dog_post_images_name != null) {
				/* 타입 변수명 : 배열 or 컬렉션 */
			for(MultipartFile multipartFile : show_dog_post_images_name) {
				/* multipartFile이 비어있으면 continue */
				if(multipartFile.isEmpty()) {
					continue;
				}
				/* rootFolder : 이미지 업로드 시 파일이 저장될 기본폴더의 경로*/
//				String rootFolder = "C:/Users/SSS/Desktop/last/source/postImages";
//				<img src="/Users/SSS/Desktop/last/source/postImages2023/${showImages.show_dog_post_images_link}" alt="사진 어디감">
				String rootFolder = "C:/uploadFiles/WelcomePet_community/";
				
				/*날짜별 폴더생성 로직*/
				SimpleDateFormat createFolderByDate = new SimpleDateFormat("yyyy/MM/dd");
				String today = createFolderByDate.format(new Date());
				
				/*File: API, 파일 속성(ex: 숨김, 공개)*/
				File targetFolder = new File(rootFolder + today);
				if(!targetFolder.exists()) {
					/* mkdirs: 부모 디렉토리 만들기 */
					targetFolder.mkdirs();
				}
				
				/*저장파일명 만들기*/
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				/* 확장자 추출하기(substring: 문자 자르는 API) */
				String originalFileName = multipartFile.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				/*이건 뭐지*/
				String saveFileName = today + "/" + fileName + ext;

				/*문법오류 피하기용: 무슨 오류?*/
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				ShowDogPostImagesDto showDogPostImagesDto = new ShowDogPostImagesDto();
				showDogPostImagesDto.setShow_dog_post_images_name(originalFileName);
				
				showDogPostImagesDto.setShow_dog_post_images_link(saveFileName);
				System.out.println(showDogPostImagesDto);
				postImageDtoList.add(showDogPostImagesDto);
			}
		}
		communityServiceImpl.showDogUpload(showDogPostDto, postImageDtoList);
//		select * from show_dog_post_images where show_dog_post_no = 1
		return "redirect:./showDogPost?show_dog_post_no=" + showDogPostDto.getShow_dog_post_no();
	}
	
//	게시글 수정
	@RequestMapping("showDogUpdate")
	public String updatePost(Model model, int show_dog_post_no) {
		Map<String, Object> map = communityServiceImpl.bringShowDogPost(show_dog_post_no);
		model.addAttribute("postData", map);
		
		return "community/showDogUpdate";
	}

	@RequestMapping("showDogUpdateProcess")						   
	public String updatePostProcess(ShowDogPostDto showDogPostDto, MultipartFile[] show_dog_post_images_name) {

		System.out.println("Controller.updatePostProcess: " + showDogPostDto);
		communityServiceImpl.updatePost(showDogPostDto);
		return "redirect:./showDogPost?show_dog_post_no=" + showDogPostDto.getShow_dog_post_no();
	}
	
//	@RequestMapping("showDogUpdateProcess")						   
//	public String updatePostProcess(ShowDogPostDto showDogPostDto, MultipartFile[] show_dog_post_images_name) {
//		이미지 수정
//		System.out.println("Controller.updatePostProcess: " + showDogPostDto);
////		System.out.println(show_dog_post_images_name);
//		
//		communityServiceImpl.updatePost(showDogPostDto, postImageDtoList);
//		
//		return "redirect:./showDogPost?show_dog_post_no=" + showDogPostDto.getShow_dog_post_no();
//	}	
	
	
//	게시글 삭제
	@RequestMapping("showDogDeleteProcess")
	public String deletePost(int show_dog_post_no) {
		communityServiceImpl.deletePost(show_dog_post_no);
		return "redirect:./showDogPostList";
	}
	
	
//	댓글 작성하기
	@RequestMapping("writeCommentProcess")
	public String writeComment(HttpSession session, ShowDogCommentDto showDogCommentDto) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		
		System.out.println("누구 session: " + showDogCommentDto);
		
		int customer_no = customerUser.getCustomer_no();
		showDogCommentDto.setCustomer_no(customer_no);
		
		communityServiceImpl.insertComment(showDogCommentDto);
		
		return "redirect:./showDogPost?show_dog_post_no=" + showDogCommentDto.getShow_dog_post_no();
	}
	
//	댓글 삭제
//	@RequestMapping("deleteCommentProcess")
//	public String deleteComment(int show_dog_comment_no) {
//		
//		System.out.println("컨트롤:"+ show_dog_comment_no);
//		
//		communityServiceImpl.deleteComment(show_dog_comment_no);
//		
//		return "redirect:./showDogPost?show_dog_post_no=" + show_dog_comment_no;
//	}
		
	@RequestMapping("postLikeList")
	public String gotoPostLikeList() {
		return "community/postLikeList";
	}
	
//	여기서부터 AJAX
	@ResponseBody
	@RequestMapping("getCommentDatas")
	public List<Map<String, Object>> getCommentDatas(int show_dog_post_no) {
		
		List<Map<String, Object>> list = communityServiceImpl.bringCommentByPostNo(show_dog_post_no);
		
		return list;
	}
		
	@ResponseBody
	@RequestMapping("registerComment")
	public void registerComment(HttpSession session, ShowDogCommentDto showDogCommentDto) {
		
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		
		System.out.println("누구 session: " + showDogCommentDto);
		
		int customer_no = customerUser.getCustomer_no();
		showDogCommentDto.setCustomer_no(customer_no);
		
		communityServiceImpl.insertComment(showDogCommentDto);		
		
		
	}

////////////////////////////////////////////////////////////////////////////////	
}







