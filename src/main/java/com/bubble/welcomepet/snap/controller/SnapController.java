package com.bubble.welcomepet.snap.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.DogDto;
import com.bubble.welcomepet.dto.SnapBoardCommentDto;
import com.bubble.welcomepet.dto.SnapBoardDto;
import com.bubble.welcomepet.dto.SnapBoardLikesDto;
import com.bubble.welcomepet.dto.SnapImagesDto;
import com.bubble.welcomepet.snap.service.SnapServiceImpl;


@Controller
@RequestMapping("/snap/*")
public class SnapController {

	@Autowired
	private SnapServiceImpl snapService;
	
	@RequestMapping("main")
	public String main (Model model, HttpSession session) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		List<Map<String, Object>> list = snapService.getSnapList(customer_no);
		model.addAttribute("list", list);
		
		return "snap/main";
	}
	
	@RequestMapping("postSnap")
	public String postSnap(Model model,HttpSession session) {
		CustomerDto customerUser = (CustomerDto) session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		List<Map<String, Object>> list = snapService.getCustomerDogInfo(customer_no);
		model.addAttribute("list", list);
		return "snap/postSnap";
	}
	
	@RequestMapping("postSnapProcess") 	// 스냅 글 작성
	public String snapPostProcess(SnapBoardDto params, MultipartFile[] snap_imgs, MultipartFile thumbnail) {
		
		List<SnapImagesDto> snapImgList = new ArrayList<>();
		// 스냅 썸네일 업로드
		if (thumbnail != null) {
	    	String rootFolder = "C:/uploadFiles/thumbnail/";
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());
			
			File targetFolder = new File(rootFolder + today);

			if (!targetFolder.exists()) {
				targetFolder.mkdirs();
			}
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();
			
			String originalFileName = thumbnail.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = today + "/" + fileName + ext;
			try {
				thumbnail.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			params.setSnap_thumbnail(saveFileName);
		}
		
		// 여러 이미지들 업로드
		if (snap_imgs != null) {
			for(MultipartFile multipartFile : snap_imgs) {
				if (multipartFile.isEmpty()) {
					continue;
				}
				String rootFolder = "C:/uploadFiles/snapImgs/";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				
				File targetFolder = new File(rootFolder + today);
				
				if (!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
				
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				String originalFileName = multipartFile.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				String saveFileName = today + "/" + fileName + ext;
				
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				} 
				
				SnapImagesDto snapImagesDto = new SnapImagesDto();
				snapImagesDto.setSnap_image_link(saveFileName);
				snapImgList.add(snapImagesDto);
			}
		}
		
		snapService.postSnap(params, snapImgList);
		
		return "redirect:./main";
	}
	
	@RequestMapping("snapLike")
	public String snapLike(HttpSession session, int snap_board_no) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		snapService.snapLike(snapBoardLikesDto);
		return "redirect:./main";
	}
	
	@RequestMapping("snapUnLike")
	public String snapUnLike(HttpSession session, int snap_board_no) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		snapService.snapUnLike(snapBoardLikesDto);
		return "redirect:./main";
	}
	
	@RequestMapping("readSnapLike")
	public String readSnapLike(HttpSession session, int snap_board_no) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		snapService.snapLike(snapBoardLikesDto);
		return "redirect:./readSnap?snap_board_no=" + snap_board_no;
	}
	
	@RequestMapping("readSnapUnLike")
	public String readSnapUnLike(HttpSession session, int snap_board_no) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		snapService.snapUnLike(snapBoardLikesDto);
		return "redirect:./readSnap?snap_board_no=" + snap_board_no;
	}
	
	
	@RequestMapping("readSnap")
	public String readSnap(Model model, int snap_board_no,HttpSession session) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		SnapBoardLikesDto snapBoardLikesDto = new SnapBoardLikesDto();
		snapBoardLikesDto.setCustomer_no(customer_no);
		snapBoardLikesDto.setSnap_board_no(snap_board_no);
		int checkLike = snapService.checkLike(snapBoardLikesDto);
		snapService.viewCount(snap_board_no);
		List<Map<String, Object>> list = snapService.getSnapImgsBySnapBoardNo(snap_board_no);
		SnapBoardDto snapBoardDto = snapService.getSnapBySnapBoardNo(snap_board_no);
		List<Map<String, Object>> commentList = snapService.getSnapCommentsBySnapBoardNo(snap_board_no);
		int countLike = snapService.countLike(snap_board_no);
		model.addAttribute("snapBoardDto", snapBoardDto);
		model.addAttribute("list", list);
		model.addAttribute("commentList", commentList);
		model.addAttribute("countLike", countLike);
		model.addAttribute("checkLike", checkLike);
		return "snap/readSnap";
	}
	
	@RequestMapping("dogProfile")
	public String dogProfile(Model model, int dog_no) {
		DogDto dogDto = snapService.getDogByDogNo(dog_no);
		List<SnapBoardDto> list = snapService.getSnapByDogNo(dog_no);
		model.addAttribute("dogDto", dogDto);
		model.addAttribute("list", list);
		return "snap/dogProfile";
	}
	
	@RequestMapping("snapComment")
	public String snapComment(SnapBoardCommentDto params, HttpSession session) {
		CustomerDto customerUser = (CustomerDto)session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		params.setCustomer_no(customer_no);
		snapService.snapComment(params);
		return "redirect:./readSnap?snap_board_no=" + params.getSnap_board_no();
	}
}