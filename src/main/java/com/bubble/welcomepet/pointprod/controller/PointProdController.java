package com.bubble.welcomepet.pointprod.controller;

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
import com.bubble.welcomepet.dto.PointProdDto;
import com.bubble.welcomepet.dto.PointProdImgDto;
import com.bubble.welcomepet.pointprod.service.PointProdServiceImpl;

@Controller
@RequestMapping("/pointProd/*")
public class PointProdController {

	@Autowired
	private PointProdServiceImpl pointProdService;

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

		List<PointProdImgDto> pointImgDtoList = new ArrayList<>();

		// 파일 저장 로직
		if (pointProdFiles != null) {

			for (MultipartFile multipartFile : pointProdFiles) {

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명: " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadFolder/";

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

				pointImgDtoList.add(pointProdImgDto);
			}
		}

		CustomerDto customerUser = (CustomerDto) session.getAttribute("customerUser");

		int customer_no = customerUser.getCustomer_no();
		params.setCustomer_no(customer_no);

		pointProdService.writePointProd(params, pointImgDtoList);

		return "pointProd/pointProd";

	}

	@RequestMapping("readPointProd")
	public String readPointProd(Model model, int point_product_no) {

		Map<String, Object> map = pointProdService.getPointProd(point_product_no);

		model.addAttribute("data", map);

		return "pointProd/readPointProd";
	}
}