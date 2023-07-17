package com.bubble.welcomepet.pointprod.mapper;

import java.util.List;

import com.bubble.welcomepet.dto.PointProdDto;
import com.bubble.welcomepet.dto.PointProdImgDto;
import com.bubble.welcomepet.dto.PointProdOrdDto;

public interface PointProdSqlMapper {

	public int createPk1();
	
	public PointProdDto selectByPointProdNo(int point_product_no);
	
	public void insPointProd(PointProdDto pointProdDto);
	
	public List<PointProdDto> selectAllPointProd();

	public void insPointProdImg(PointProdImgDto pointProdImgDto);

	public List<PointProdImgDto> selectImgByPointProdNo(int point_product_no);

	/* public void insPointProdOrd(PointProdOrdDto pointProdOrdDto); */

}
