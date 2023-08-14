package com.bubble.welcomepet.pointprod.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.bubble.welcomepet.dto.BoardDto;
import com.bubble.welcomepet.dto.CommentDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.ImageDto;
import com.bubble.welcomepet.dto.LikeDto;
import com.bubble.welcomepet.dto.PointProdDto;
import com.bubble.welcomepet.dto.PointProdImgDto;
import com.bubble.welcomepet.dto.PointProdOrdDto;
import com.bubble.welcomepet.pointprod.service.PointProdServiceImpl;

@Controller
@RequestMapping("/pointProd/*")
public class PointProdController {

	@Autowired
	private PointProdServiceImpl pointProdService;

	@RequestMapping("board")
	public String board(Model model) {

		List<Map<String, Object>> list = pointProdService.getBoardList();

		model.addAttribute("list", list);

		/* 베스트3 */
		List<Map<String, Object>> list2 = pointProdService.getBoardList2();

		model.addAttribute("list2", list2);
		System.out.println(list2);

		return "pointProd/board";
	}

	@RequestMapping("writeContent")
	public String writeContent() {

		return "pointProd/writeContent";
	}

	@RequestMapping("writeContentProcess")
	public String writeContentProcess(HttpSession session, BoardDto params, MultipartFile[] boardFiles) {

		List<ImageDto> imageDtoList = new ArrayList<>();

		// 파일 저장 로직
		if (boardFiles != null) {

			for (MultipartFile multipartFile : boardFiles) {

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명: " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadFiles/";
				// 날짜별 폴더 생성 로직
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

				ImageDto imageDto = new ImageDto();
				imageDto.setBoard_image_name(originalFileName);
				imageDto.setBoard_image_link(saveFileName);

				imageDtoList.add(imageDto);
			}
		}

		CustomerDto customerUser = (CustomerDto) session.getAttribute("customerUser");

		int customer_no = customerUser.getCustomer_no();
		params.setCustomer_no(customer_no);

		pointProdService.writeContent(params, imageDtoList);

		return "redirect:./board";

	}

	@RequestMapping("readContent")
	public String readContent(Model model, int board_no, LikeDto likeDto, @RequestParam(defaultValue="reg" , value="order") String order) {

		pointProdService.increaseReadCount(board_no);

		Map<String, Object> map = pointProdService.getBoard(board_no);

		model.addAttribute("data", map);// 글 불러오기

		List<Map<String, Object>> list = pointProdService.getCommentById(board_no, order);

		model.addAttribute("commentList", list);// 댓 불러오기

		// 댓글 카운트
		int countCommentByBoardNo = pointProdService.countCommentByBoardNo(board_no);
		model.addAttribute("countCommentByBoardNo", countCommentByBoardNo);

		// 좋아요 카운트
		int countLikeByBoardNo = pointProdService.countLikeByBoardNo(board_no);
		model.addAttribute("countLikeByBoardNo", countLikeByBoardNo);
		// 좋아요했는지

		// html escape
		BoardDto boardDto = (BoardDto) map.get("boardDto");
		String board_content = boardDto.getBoard_content();
		board_content = StringEscapeUtils.escapeHtml4(board_content);
		board_content = board_content.replaceAll("\n", "<br>");
		boardDto.setBoard_content(board_content);

		return "pointProd/readContent";
	}

	/*
	 * @RequestMapping("{community_board_no}") public String
	 * readContentForPathVariable(Model model, @PathVariable("community_board_no")
	 * int community_board_no) {
	 * 
	 * PointProdService.increaseReadCount(community_board_no);
	 * 
	 * Map<String, Object> map = PointProdService.getBoard(community_board_no);
	 * 
	 * model.addAttribute("data", map);
	 * 
	 * return "board/readContent";
	 * 
	 * }
	 */
	@RequestMapping("deleteProcess")
	public String deleteProcess(int board_no) {

		pointProdService.deleteContent(board_no);

		return "redirect:./board";
	}

	@RequestMapping("update")
	public String update(Model model, int board_no) {

		Map<String, Object> map = pointProdService.getBoard(board_no);
		model.addAttribute("data", map);

		return "pointProd/update";
	}

	@RequestMapping("updateContentProcess")
	public String updateContentProcess(BoardDto boardDto) {

		pointProdService.updateContent(boardDto);

		return "redirect:./board";
	}

	@RequestMapping("insertComment")
	public String commentProcess(HttpSession session, CommentDto params) {

		CustomerDto customerUser = (CustomerDto) session.getAttribute("customerUser");
		int customer_no = customerUser.getCustomer_no();
		params.setCustomer_no(customer_no);
		pointProdService.insertComment(params);
		return "redirect:./readContent?board_no=" + params.getBoard_no();
	}

	/*
	 * @re public String category(CategoryDto categoryDto) {
	 * 
	 * PointProdService.category(categoryDto);
	 * 
	 * return "board/board"; }
	 */

	@RequestMapping("insertLikeProcess")
	public String insertLikeProcess(HttpSession session, LikeDto likeDto) {

		CustomerDto customerUser = (CustomerDto) session.getAttribute("customerUser");
		if (customerUser == null) {
			return "redirect:../customer/login";
		} else {
			int customer_no = customerUser.getCustomer_no();

			likeDto.setCustomer_no(customer_no);
			pointProdService.insertLike(likeDto);

			System.out.println("좋아요 정보: " + likeDto);
			return "redirect:./readContent?board_no=" + likeDto.getBoard_no();
		}
	}

	@RequestMapping("report")
	public String report() {

		return "pointProd/report";
	}

	@RequestMapping("pointProd")
	public String pointProd(Model model) {

		List<Map<String, Object>> list = pointProdService.getPointProdList();

		model.addAttribute("list", list);

		return "pointProd/pointProd";
	}

	@RequestMapping("writePointProd")
	public String writePointProd() {

		return "pointProd/writePointProd";
	}

	@RequestMapping("writePointProdProcs")
	public String writePointProdProcs(HttpSession session, PointProdDto params, MultipartFile[] pointProdFiles) {

		List<PointProdImgDto> pointProdImgDtoList = new ArrayList<>();

		// 파일 저장 로직
		if (pointProdFiles != null) {

			for (MultipartFile multipartFile : pointProdFiles) {

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명: " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadFiles2/";

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

				PointProdImgDto pointProdImgDto = new PointProdImgDto();
				pointProdImgDto.setPoint_product_image_name(originalFileName);
				pointProdImgDto.setPoint_product_image_link(saveFileName);

				pointProdImgDtoList.add(pointProdImgDto);
			}
		}

		CustomerDto customerUser = (CustomerDto) session.getAttribute("customerUser");

		int customer_no = customerUser.getCustomer_no();
		params.setCustomer_no(customer_no);

		pointProdService.writePointProd(params, pointProdImgDtoList);

		return "redirect:./pointProd";
	}

	@RequestMapping("readPointProd")
	public String readPointProd(Model model, int point_product_no) {

		Map<String, Object> map = pointProdService.getPointProd(point_product_no);

		model.addAttribute("data", map);

		return "pointProd/readPointProd";
	}

	@RequestMapping("orderPointProdProcs")
	public String orderPointProdProcs(HttpSession session, PointProdOrdDto pointProdOrdDto) {

		CustomerDto customerUser = (CustomerDto) session.getAttribute("customerUser");
		if (customerUser == null) {
			return "redirect:../customer/login";
		} else {
			int customer_no = customerUser.getCustomer_no();

			pointProdOrdDto.setCustomer_no(customer_no);
			pointProdService.insPointProdOrd(pointProdOrdDto);

			System.out.println("주문 정보: " + pointProdOrdDto);
			return "redirect:./readPointProd?point_product_no=" + pointProdOrdDto.getPoint_product_no();
		}
	}
}