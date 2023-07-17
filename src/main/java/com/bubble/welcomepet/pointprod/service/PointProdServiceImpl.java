package com.bubble.welcomepet.pointprod.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bubble.welcomepet.customer.mapper.CustomerSqlMapper;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.PointProdDto;
import com.bubble.welcomepet.dto.PointProdImgDto;
import com.bubble.welcomepet.pointprod.mapper.PointProdSqlMapper;

@Service
public class PointProdServiceImpl {

	@Autowired
	private PointProdSqlMapper pointProdSqlMapper;

	@Autowired
	private CustomerSqlMapper customerSqlMapper;

	public void writePointProd(PointProdDto pointProdDto, List<PointProdImgDto> pointProdImgDtoList) {
		int point_product_no = pointProdSqlMapper.createPk1();

		pointProdDto.setPoint_product_no(point_product_no);
		pointProdSqlMapper.insPointProd(pointProdDto);

		for (PointProdImgDto pointProdImgDto : pointProdImgDtoList) {
			pointProdImgDto.setPoint_product_no(point_product_no);
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

			CustomerDto customerDto = customerSqlMapper.selectById(customer_no);

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
		CustomerDto customerDto = customerSqlMapper.selectById(pointProdDto.getCustomer_no());

		List<PointProdImgDto> pointProdImgDtoList = pointProdSqlMapper.selectImgByPointProdNo(point_product_no);

		map.put("pointProdDto", pointProdDto);
		map.put("customerDto", customerDto);
		map.put("pointProdImgDtoList", pointProdImgDtoList);

		return map;
	}
}
