package com.bubble.welcomepet.product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bubble.welcomepet.dto.AdCategoryDto;
import com.bubble.welcomepet.dto.MainCategoryDto;
import com.bubble.welcomepet.dto.ProductDetailImageDto;
import com.bubble.welcomepet.dto.ProductDto;
import com.bubble.welcomepet.dto.ProductInquiryDto;
import com.bubble.welcomepet.dto.ProductInquiryReplyDto;
import com.bubble.welcomepet.dto.ProductMainImageDto;
import com.bubble.welcomepet.dto.ProductOptionDto;
import com.bubble.welcomepet.dto.ProductReviewDto;
import com.bubble.welcomepet.dto.ProductReviewImagesDto;
import com.bubble.welcomepet.dto.SubCategoryDto;

public interface ProductSqlMapper {

	public List<ProductDto> getProductByBizNo(int biz_no);

	public List<ProductOptionDto> getProductOptionByProductNo(int product_no);

	public MainCategoryDto getMainCategoryByNo(int main_category_no);

	public SubCategoryDto getSubCategoryByNo(int sub_category_no);

	public List<MainCategoryDto> getAllMainCategory();

	public List<SubCategoryDto> getSubCategoryByMainCategoryNo(int main_category_no);

	public int createProductPk();

	public void createDetailImg(ProductDetailImageDto productDetailImageDto);

	public void createProduct(ProductDto productDto);

	public void createProductOption(ProductOptionDto productOptionDto);

	public void createMainImg(ProductMainImageDto productMainImageDto);

	public ProductDto getProductByNo(int product_no);

	public List<ProductMainImageDto> getMainImageByProductNo(int product_no);

	public List<ProductDetailImageDto> getDetailImageByProductNo(int product_no);

	public void updateProductSubCategory(ProductDto productDto);

	public void updateProductName(ProductDto productDto);

	public void updatProductDescription(ProductDto productDto);

	public void updateProductDiscount(ProductDto productDto);

	public void updateProductShippingPrice(ProductDto productDto);

	public void updateProductPrice(ProductDto productDto);

	public void updateProductStock(ProductDto productDto);

	public void updateOptionName(ProductOptionDto productOptionDto);

	public void updateOptionPrice(ProductOptionDto productOptionDto);

	public void updateOptionStock(ProductOptionDto productOptionDto);

	public int countProductOptionByProductNo(int product_no);

	public void deleteThumbnailImg(int product_no);

	public void updateProductThumbnail(ProductDto productDto);

	public void deleteMainImage(int product_main_image_no);

	public int createProductDetailImagePk();

	public void deleteDetailImage(int product_detail_image_no);

	public int createProductMainImagePk();

	public ProductOptionDto getProductOptionByNo(int product_option_no);

	public List<ProductInquiryDto> getNewProductInquiryByBizNo(int biz_no);

	public void createInquiryReply(ProductInquiryReplyDto productInquiryReplyDto);

	public List<ProductInquiryDto> getCompleteProductInquiryByBizNo(int biz_no);

	public ProductInquiryReplyDto getProductInquiryReplyByInquiryNo(int product_inquiry_no);

	public List<ProductReviewDto> getProductReviewByBizNo(int biz_no);

	public List<ProductReviewImagesDto> getProductReviewImagesByReviewNo(int product_review_no);

	public int countProductReviewLikesByReviewNo(int product_review_no);

	public List<ProductReviewDto> getReviewListByDateAndBizNo(@Param(value="biz_no") int biz_no, @Param(value="start_date") String start_date, @Param(value="end_date") String end_date);

	public int countInquiryByBizNoAndNotReplied(int biz_no);

	public int countLowStockNumByBizNo(int biz_no);

	public Map<String, Object> getProductNumPerStatusByBizNo(int biz_no);



}
